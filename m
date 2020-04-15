Return-Path: <baolin.wang7@gmail.com>
MIME-Version: 1.0
References: <20200414220943.6203-1-ezequiel@collabora.com>
In-Reply-To: <20200414220943.6203-1-ezequiel@collabora.com>
From: Baolin Wang <baolin.wang7@gmail.com>
Date: Wed, 15 Apr 2020 21:32:52 +0800
Message-ID: <CADBw62oJj_x046piRbPP48A04ALo-w2J6jZXNspyN5eOGj-TEg@mail.gmail.com>
Subject: Re: [PATCH] hwspinlock: Simplify Kconfig
Content-Type: text/plain; charset="UTF-8"
To: Ezequiel Garcia <ezequiel@collabora.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, kernel@collabora.com
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Ezequiel,

On Wed, Apr 15, 2020 at 6:09 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> Every hwspinlock driver is expected to depend on the
> hwspinlock core, so it's possible to simplify the
> Kconfig, factoring out the HWSPINLOCK dependency.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Looks reasonable to me.
Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>

> ---
>  drivers/hwspinlock/Kconfig | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
> index 826a1054100d..32cd26352f38 100644
> --- a/drivers/hwspinlock/Kconfig
> +++ b/drivers/hwspinlock/Kconfig
> @@ -6,9 +6,10 @@
>  menuconfig HWSPINLOCK
>         bool "Hardware Spinlock drivers"
>
> +if HWSPINLOCK
> +
>  config HWSPINLOCK_OMAP
>         tristate "OMAP Hardware Spinlock device"
> -       depends on HWSPINLOCK
>         depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX || SOC_AM33XX || SOC_AM43XX || ARCH_K3 || COMPILE_TEST
>         help
>           Say y here to support the OMAP Hardware Spinlock device (firstly
> @@ -18,7 +19,6 @@ config HWSPINLOCK_OMAP
>
>  config HWSPINLOCK_QCOM
>         tristate "Qualcomm Hardware Spinlock device"
> -       depends on HWSPINLOCK
>         depends on ARCH_QCOM || COMPILE_TEST
>         select MFD_SYSCON
>         help
> @@ -30,7 +30,6 @@ config HWSPINLOCK_QCOM
>
>  config HWSPINLOCK_SIRF
>         tristate "SIRF Hardware Spinlock device"
> -       depends on HWSPINLOCK
>         depends on ARCH_SIRF || COMPILE_TEST
>         help
>           Say y here to support the SIRF Hardware Spinlock device, which
> @@ -43,7 +42,6 @@ config HWSPINLOCK_SIRF
>  config HWSPINLOCK_SPRD
>         tristate "SPRD Hardware Spinlock device"
>         depends on ARCH_SPRD || COMPILE_TEST
> -       depends on HWSPINLOCK
>         help
>           Say y here to support the SPRD Hardware Spinlock device.
>
> @@ -52,7 +50,6 @@ config HWSPINLOCK_SPRD
>  config HWSPINLOCK_STM32
>         tristate "STM32 Hardware Spinlock device"
>         depends on MACH_STM32MP157 || COMPILE_TEST
> -       depends on HWSPINLOCK
>         help
>           Say y here to support the STM32 Hardware Spinlock device.
>
> @@ -60,7 +57,6 @@ config HWSPINLOCK_STM32
>
>  config HSEM_U8500
>         tristate "STE Hardware Semaphore functionality"
> -       depends on HWSPINLOCK
>         depends on ARCH_U8500 || COMPILE_TEST
>         help
>           Say y here to support the STE Hardware Semaphore functionality, which
> @@ -68,3 +64,5 @@ config HSEM_U8500
>           SoC.
>
>           If unsure, say N.
> +
> +endif # HWSPINLOCK
> --
> 2.26.0.rc2
>


-- 
Baolin Wang
