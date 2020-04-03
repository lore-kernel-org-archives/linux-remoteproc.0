Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH] remoteproc/omap: Fix set_load call in
 omap_rproc_request_timer
References: <20200402010812.GA751391@yoga>
 <20200403013134.11407-1-natechancellor@gmail.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <4a2b5227-a251-bc90-7177-a75224da4623@ti.com>
Date: Fri, 3 Apr 2020 08:45:43 -0500
MIME-Version: 1.0
In-Reply-To: <20200403013134.11407-1-natechancellor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Nathan Chancellor <natechancellor@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On 4/2/20 8:31 PM, Nathan Chancellor wrote:
> When building arm allyesconfig:

Thanks, Nathan. Also throws up with omap2plus_defconfig.

> 
> drivers/remoteproc/omap_remoteproc.c:174:44: error: too many arguments
> to function call, expected 2, have 3
>         timer->timer_ops->set_load(timer->odt, 0, 0);
>         ~~~~~~~~~~~~~~~~~~~~~~~~~~                ^
> 1 error generated.
> 
> This is due to commit 02e6d546e3bd ("clocksource/drivers/timer-ti-dm:
> Enable autoreload in set_pwm") in the clockevents tree interacting with
> commit e28edc571925 ("remoteproc/omap: Request a timer(s) for remoteproc
> usage") from the rpmsg tree.
> 
> This should have been fixed during the merge of the remoteproc tree
> since it happened after the clockevents tree merge; however, it does not
> look like my email was noticed by either maintainer and I did not pay
> attention when the pull was sent since I was on CC.
> 
> Fixes: c6570114316f ("Merge tag 'rproc-v5.7' of git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc")
> Link: https://lore.kernel.org/lkml/20200327185055.GA22438@ubuntu-m2-xlarge-x86/
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Acked-by: Suman Anna <s-anna@ti.com>

> ---
>  drivers/remoteproc/omap_remoteproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index cdb546f7232e..6955fab0a78b 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -171,7 +171,7 @@ static int omap_rproc_request_timer(struct device *dev, struct device_node *np,
>  	}
>  
>  	/* clean counter, remoteproc code will set the value */
> -	timer->timer_ops->set_load(timer->odt, 0, 0);
> +	timer->timer_ops->set_load(timer->odt, 0);
>  
>  	return 0;
>  }
> 
