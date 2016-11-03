Return-Path: <sergei.shtylyov@cogentembedded.com>
Return-Path: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v4 4/4] MIPS: Deprecate VPE Loader
References: <1478103063-17653-1-git-send-email-matt.redfearn@imgtec.com>
 <1478103063-17653-5-git-send-email-matt.redfearn@imgtec.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <540026e5-a839-b4db-ec8c-bd5d03d9faca@cogentembedded.com>
Date: Thu, 3 Nov 2016 13:12:28 +0300
MIME-Version: 1.0
In-Reply-To: <1478103063-17653-5-git-send-email-matt.redfearn@imgtec.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
To: Matt Redfearn <matt.redfearn@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org, linux-remoteproc@vger.kernel.org, lisa.parratt@imgtec.com, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello.

On 11/2/2016 7:11 PM, Matt Redfearn wrote:

> The MIPS remote processor driver (CONFIG_MIPS_REMOTEPROC) provides a
> more standard mechanism for using one or more VPs as coprocessors
> running separate firmware.
>
> Here we deprecate this mechanism before it is removed.
>
> Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
> ---
>
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
>
>  arch/mips/Kconfig | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 6faf7c96ee15..d5b5a25a49e8 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
[...]
> @@ -2307,6 +2307,9 @@ config MIPS_VPE_LOADER
>  	  Includes a loader for loading an elf relocatable object
>  	  onto another VPE and running it.
>
> +	  Unless you have a specific need, you should use CONFIG_MIPS_REMOTEPROC
> +          instead of this.

    Please indent using a leading tab (like above). There's too many spaces too...

[...]

MBR, Sergei
