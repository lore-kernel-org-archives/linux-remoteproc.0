Return-Path: <tglx@linutronix.de>
Date: Wed, 9 Nov 2016 11:15:20 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4 0/4] MIPS: Remote processor driver
In-Reply-To: <1478103063-17653-1-git-send-email-matt.redfearn@imgtec.com>
Message-ID: <alpine.DEB.2.20.1611091111041.3501@nanos>
References: <1478103063-17653-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, linux-mips@linux-mips.org, linux-remoteproc@vger.kernel.org, Lisa Parratt <lisa.parratt@imgtec.com>, LKML <linux-kernel@vger.kernel.org>, Qais Yousef <qsyousef@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Lisa Parratt <Lisa.Parratt@imgtec.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Jason Cooper <jason@lakedaemon.net>, James Hogan <james.hogan@imgtec.com>, Marc Zyngier <marc.zyngier@arm.com>, Paul Burton <paul.burton@imgtec.com>, Peter Zijlstra <peterz@infradead.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, 2 Nov 2016, Matt Redfearn wrote:
> The MIPS remote processor driver allows non-Linux firmware to take
> control of and execute on one of the systems VPEs. The CPU must be
> offlined from Linux first. A sysfs interface is created which allows
> firmware to be loaded and changed at runtime. A full description is
> available at [1]. An example firmware that can be used with this driver
> is available at [2].
> 
> This is useful to allow running bare metal code, or an RTOS, on one or
> more CPUs while allowing Linux to continue running on those remaining.

And how is actually guaranteed that these two things are properly seperated
(memory, devices, interrupts etc.) ?

We have rejected attempts to do exactly the same thing on x86 in the
past. There is virtualization and NOHZ_FULL to do it proper and not just
with a horrible hackery.

Thanks,

	tglx
