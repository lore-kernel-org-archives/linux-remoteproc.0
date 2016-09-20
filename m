Return-Path: <sergei.shtylyov@cogentembedded.com>
Return-Path: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 6/6] MIPS: Deprecate VPE Loader
References: <1474361249-31064-1-git-send-email-matt.redfearn@imgtec.com>
 <1474361249-31064-7-git-send-email-matt.redfearn@imgtec.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <1eeeef2e-0825-94ea-77b3-07f46fcef2ca@cogentembedded.com>
Date: Tue, 20 Sep 2016 13:25:21 +0300
MIME-Version: 1.0
In-Reply-To: <1474361249-31064-7-git-send-email-matt.redfearn@imgtec.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
To: Matt Redfearn <matt.redfearn@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org, linux-remoteproc@vger.kernel.org, lisa.parratt@imgtec.com, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello.

On 9/20/2016 11:47 AM, Matt Redfearn wrote:

> The MIPS remote processor driver (CONFIG_MIPS_RPROC) provides a more
> standard mechanism for using one or more VPs as coprocessors running
> separate firmware.
>
> Here we deprecate this mechanism before it is removed.
>
> Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
> ---
>
> Changes in v2: None
>
>  arch/mips/Kconfig | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 2094cbcea0d4..071fc4585265 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -2263,7 +2263,7 @@ comment "MIPS R2-to-R6 emulator is only available for UP kernels"
>  	depends on SMP && CPU_MIPSR6
>
>  config MIPS_VPE_LOADER
> -	bool "VPE loader support."
> +	bool "VPE loader support. (DEPRECATED)"

    I think the period should be after (DEPRECATED), if at all.

[...]

MBR,Sergei
