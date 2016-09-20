Return-Path: <tglx@linutronix.de>
Date: Tue, 20 Sep 2016 11:40:18 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 1/6] irqchip: mips-gic: Add context saving for
 MIPS_REMOTEPROC
In-Reply-To: <1474361249-31064-2-git-send-email-matt.redfearn@imgtec.com>
Message-ID: <alpine.DEB.2.20.1609201139130.6905@nanos>
References: <1474361249-31064-1-git-send-email-matt.redfearn@imgtec.com> <1474361249-31064-2-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, linux-mips@linux-mips.org, linux-remoteproc@vger.kernel.org, lisa.parratt@imgtec.com, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Jason Cooper <jason@lakedaemon.net>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, 20 Sep 2016, Matt Redfearn wrote:
> +/*
> + * The MIPS remote processor driver allows non-Linux firmware to take control
> + * of and execute on one of the systems VPEs. If that VPE is brought back under
> + * Linux, it is necessary to ensure that all GIC interrupts are routed and
> + * masked as Linux expects them, as the firmware can have done anything it
> + * likes with the GIC configuration (hopefully just for that VPEs local
> + * interrupt sources, but allow for shared external interrupts as well).
> + */
> +static int gic_cpu_notify(struct notifier_block *nfb, unsigned long action,
> +			       void *hcpu)
> +{
> +	unsigned int cpu = mips_cm_vp_id((unsigned long)hcpu);
> +
> +	switch (action) {
> +	case CPU_UP_PREPARE:
> +	case CPU_DOWN_FAILED:
> +		gic_restore_shared();
> +		gic_restore_local(cpu);
> +	default:
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}

Please use the new state machine based infrastructure.

Thanks,

	tglx
