Return-Path: <baolin.wang@linaro.org>
MIME-Version: 1.0
In-Reply-To: <2d10549b83f8b4990af60a61b44514b47da4c287.1509777293.git.baolin.wang@linaro.org>
References: <2d10549b83f8b4990af60a61b44514b47da4c287.1509777293.git.baolin.wang@linaro.org>
From: Baolin Wang <baolin.wang@linaro.org>
Date: Tue, 14 Nov 2017 20:58:18 +0800
Message-ID: <CAMz4kuKeqOH7m0zx7=rmaBOg5eekw3RZZwsREOJCC0sVotG40g@mail.gmail.com>
Subject: Re: [PATCH] hwspinlock: Change hwspinlock to a bool
Content-Type: text/plain; charset="UTF-8"
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-remoteproc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Baolin Wang <baolin.wang@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On 4 November 2017 at 14:37, Baolin Wang <baolin.wang@linaro.org> wrote:
> Change hwspinlock to a bool in case some drivers will meet dependency
> issue when hwspinlock is built as a module.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Could you apply this patch into K4.15 if there are no other comments? Thanks.

> ---
>  drivers/hwspinlock/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
> index 6e0a553..f0f4679 100644
> --- a/drivers/hwspinlock/Kconfig
> +++ b/drivers/hwspinlock/Kconfig
> @@ -3,7 +3,7 @@
>  #
>
>  menuconfig HWSPINLOCK
> -       tristate "Hardware Spinlock drivers"
> +       bool "Hardware Spinlock drivers"
>
>  config HWSPINLOCK_OMAP
>         tristate "OMAP Hardware Spinlock device"
> --
> 1.9.1
>



-- 
Baolin.wang
Best Regards
