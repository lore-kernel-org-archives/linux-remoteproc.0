Return-Path: <tglx@linutronix.de>
Date: Tue, 20 Sep 2016 11:47:16 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 5/6] remoteproc/MIPS: Add a remoteproc driver for
 MIPS
In-Reply-To: <1474361249-31064-6-git-send-email-matt.redfearn@imgtec.com>
Message-ID: <alpine.DEB.2.20.1609201141120.6905@nanos>
References: <1474361249-31064-1-git-send-email-matt.redfearn@imgtec.com> <1474361249-31064-6-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, linux-mips@linux-mips.org, linux-remoteproc@vger.kernel.org, lisa.parratt@imgtec.com, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, 20 Sep 2016, Matt Redfearn wrote:
> +/* Intercept CPU hotplug events for syfs purposes */
> +static int mips_rproc_callback(struct notifier_block *nfb, unsigned long action,
> +			       void *hcpu)
> +{

Please convert to cpu hotplug state machine.

> +	unsigned int cpu = (unsigned long)hcpu;
> +
> +	switch (action) {
> +	case CPU_UP_PREPARE:
> +	case CPU_DOWN_FAILED:
> +		mips_rproc_device_unregister(cpu);
> +		break;
> +	case CPU_DOWN_PREPARE:
> +		mips_rproc_device_register(cpu);
> +		break;
> +	}

There is no reason why you need to setup the rproc device on
DOWN_PREPARE. It's sufficient to do that when the CPU is dead, so you can
use a symetric callback prep/dead.

> +	/* Dynamically create mips-rproc class devices based on hotplug data */
> +	get_online_cpus();
> +	for_each_possible_cpu(cpu)
> +		if (!cpu_online(cpu))
> +			mips_rproc_device_register(cpu);
> +	register_hotcpu_notifier(&mips_rproc_notifier);
> +	put_online_cpus();

Perhaps we should add support for "reverse" functionality to the state
machine core. I'll have a look later how hard that'd be.

Thanks,

	tglx
