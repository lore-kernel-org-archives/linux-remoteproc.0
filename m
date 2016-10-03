Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 3 Oct 2016 15:16:36 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 5/6] remoteproc/MIPS: Add a remoteproc driver for MIPS
Message-ID: <20161003221636.GI7509@tuxbot>
References: <1474361249-31064-1-git-send-email-matt.redfearn@imgtec.com>
 <1474361249-31064-6-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1474361249-31064-6-git-send-email-matt.redfearn@imgtec.com>
To: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Ohad Ben-Cohen <ohad@wizery.com>, Thomas Gleixner <tglx@linutronix.de>, linux-mips@linux-mips.org, linux-remoteproc@vger.kernel.org, lisa.parratt@imgtec.com, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 20 Sep 01:47 PDT 2016, Matt Redfearn wrote:

> Add a remoteproc driver to steal, load the firmware, and boot an offline
> MIPS core, turning it into a coprocessor.
> 
> This driver provides a sysfs to allow arbitrary firmware to be loaded
> onto a core, which may expose virtio devices. Coprocessor firmware must
> abide by the UHI coprocessor boot protocol.

Hi Matt,

Sorry for my very slow response, I kept getting side tracked on the
sysfs part every time I attempted to review this. After discussing with
others it's obvious that being able to boot a remoteproc with a specific
firmware image for some amount of time is a very common request.

Rather than adding a MIPS specific interface for controlling this rproc
I would like for us to bring this to the core.


I would also appreciate if Ralf had some input on the MIPS specifics.


Also regarding the 32-bit requirement, have you investigated what is
needed to support 64-bit ELFs?

[..]
> diff --git a/drivers/remoteproc/mips_remoteproc.c b/drivers/remoteproc/mips_remoteproc.c
[..]
> +int mips_rproc_op_start(struct rproc *rproc)
> +{
> +	struct mips_rproc *mproc = *(struct mips_rproc **)rproc->priv;
> +	int err;
> +	int cpu = mproc->cpu;
> +
> +	if (mips_rprocs[cpu]) {
> +		dev_err(&rproc->dev, "CPU%d in use\n", cpu);
> +		return -EBUSY;
> +	}
> +	mips_rprocs[cpu] = rproc;
> +
> +	/* Create task for the CPU to use before handing off to firmware */
> +	mproc->tsk = fork_idle(cpu);
> +	if (IS_ERR(mproc->tsk)) {
> +		dev_err(&rproc->dev, "fork_idle() failed for CPU%d\n", cpu);
> +		return -ENOMEM;
> +	}
> +
> +	/* We won't be needing the Linux IPIs anymore */
> +	if (mips_smp_ipi_free(get_cpu_mask(cpu)))
> +		return -EINVAL;
> +
> +	/*
> +	 * Direct IPIs from the remote processor to CPU0 since that can't be
> +	 * offlined while the remote CPU is running.
> +	 */
> +	mproc->ipi_linux = irq_reserve_ipi(ipi_domain(), get_cpu_mask(0));
> +	if (!mproc->ipi_linux) {
> +		dev_err(&mproc->dev, "Failed to reserve incoming kick\n");
> +		goto exit_rproc_nofrom;
> +	}
> +
> +	mproc->ipi_remote = irq_reserve_ipi(ipi_domain(), get_cpu_mask(cpu));
> +	if (!mproc->ipi_remote) {
> +		dev_err(&mproc->dev, "Failed to reserve outgoing kick\n");
> +		goto exit_rproc_noto;
> +	}
> +
> +	/* register incoming ipi */
> +	err = devm_request_threaded_irq(&mproc->dev, mproc->ipi_linux,
> +					mips_rproc_ipi_handler,
> +					mips_rproc_vq_int, 0,
> +					"mips-rproc IPI in", mproc->rproc);

Based on how you've designed this I think it makes sense to just depend
on the fact that stop() will always be called and hence you do not
benefit from the devm_ version of this api.

> +	if (err) {
> +		dev_err(&mproc->dev, "Failed to register incoming kick: %d\n",
> +			err);
> +		goto exit_rproc_noint;
> +	}
> +
> +	if (!mips_cps_steal_cpu_and_execute(cpu, &mips_rproc_cpu_entry,
> +						mproc->tsk))
> +		return 0;

Please flip this around, to follow the pattern of the others, like:

	if (mips_cps_steal_cpu_and_execute()) {
		dev_err()
		goto exit_free_irq;
	}

	return 0;

exit_free_irq:

> +
> +	dev_err(&mproc->dev, "Failed to steal CPU%d for remote\n", cpu);
> +	devm_free_irq(&mproc->dev, mproc->ipi_linux, mproc->rproc);
> +exit_rproc_noint:
> +	irq_destroy_ipi(mproc->ipi_remote, get_cpu_mask(cpu));
> +exit_rproc_noto:
> +	irq_destroy_ipi(mproc->ipi_linux, get_cpu_mask(0));
> +exit_rproc_nofrom:
> +	free_task(mproc->tsk);
> +	mips_rprocs[cpu] = NULL;
> +
> +	/* Set up the Linux IPIs again */
> +	mips_smp_ipi_allocate(get_cpu_mask(cpu));
> +	return -EINVAL;
> +}
> +
> +int mips_rproc_op_stop(struct rproc *rproc)
> +{
> +	struct mips_rproc *mproc = *(struct mips_rproc **)rproc->priv;
> +
> +	if (mproc->ipi_linux)

stop() should not be called unless start() succeeded, so ipi_linux
should not be able to be 0.

> +		devm_free_irq(&mproc->dev, mproc->ipi_linux, mproc->rproc);
> +
> +	irq_destroy_ipi(mproc->ipi_linux, get_cpu_mask(0));
> +	irq_destroy_ipi(mproc->ipi_remote, get_cpu_mask(mproc->cpu));
> +
> +	/* Set up the Linux IPIs again */
> +	mips_smp_ipi_allocate(get_cpu_mask(mproc->cpu));
> +
> +	free_task(mproc->tsk);
> +
> +	mips_rprocs[mproc->cpu] = NULL;
> +
> +	return mips_cps_halt_and_return_cpu(mproc->cpu);
> +}
> +
> +
[..]
> +
> +/* Steal a core and run some firmware on it */
> +int mips_rproc_start(struct mips_rproc *mproc, const char *firmware, size_t len)
> +{
> +	int err = -EINVAL;
> +	struct mips_rproc **priv;
> +
> +	/* Duplicate the filename, dropping whitespace from the end via len */
> +	mproc->firmware = kstrndup(firmware, len, GFP_KERNEL);
> +	if (!mproc->firmware)
> +		return -ENOMEM;
> +
> +	mproc->rproc = rproc_alloc(&mproc->dev, "mips", &mips_rproc_proc_ops,
> +				   mproc->firmware,
> +				   sizeof(struct mips_rproc *));
> +	if (!mproc->rproc)
> +		return -ENOMEM;
> +
> +	priv = mproc->rproc->priv;
> +	*priv = mproc;

If we move the class into the core, everyone will share the same
interface for setting firmware, booting and shutting down remoteproc.

I think you should set rproc->auto_boot to false and move this code into
the probe function above. It would make there be an remoteproc instance
whenever the cpu is offlined, do you see any problems with this?

> +
> +	/* go live! */
> +	err = rproc_add(mproc->rproc);
> +	if (err) {
> +		dev_err(&mproc->dev, "Failed to add rproc: %d\n", err);
> +		rproc_put(mproc->rproc);
> +		kfree(mproc->firmware);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +/* Stop a core, and return it to being offline */
> +int mips_rproc_stop(struct mips_rproc *mproc)
> +{
> +	rproc_shutdown(mproc->rproc);

I presume this shutdown is related to the implicit boot happening in
rproc_add() if you have virtio devices; I've changed this for v4.9 so
that rproc_del() shuts down the core if rproc_add() booted it.

There needs to be some more work done in this area though, because there
are plenty of corner cases that we don't handle properly today...

> +	rproc_del(mproc->rproc);
> +	rproc_put(mproc->rproc);
> +	mproc->rproc = NULL;
> +	return 0;
> +}
> +
[..]
> +
> +/* sysfs interface to mips_rproc_stop */
> +static ssize_t stop_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct mips_rproc *mproc = to_mips_rproc(dev);
> +	int err = -EINVAL;
> +
> +
> +	if (mproc->rproc)
> +		err = mips_rproc_stop(mproc);
> +	else
> +		err = -EBUSY;
> +
> +	return err ? err : count;
> +}
> +static DEVICE_ATTR_WO(stop);

Please move this control into the core, preferably as "state" which can
be passed "boot" or "shutdown" - i.e. what we today have in debugfs.

> +
> +/* Boiler plate for devclarng mips-rproc sysfs devices */
> +static struct attribute *mips_rproc_attrs[] = {
> +	&dev_attr_firmware.attr,
> +	&dev_attr_stop.attr,
> +	NULL
> +};
> +

Regards,
Bjorn
