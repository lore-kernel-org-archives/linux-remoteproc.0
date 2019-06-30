Return-Path: <bjorn.andersson@linaro.org>
Date: Sat, 29 Jun 2019 21:05:22 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] hwspinlock: stm32: implement the relax() ops
Message-ID: <20190630040522.GA1263@builder>
References: <1551973336-23048-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1551973336-23048-1-git-send-email-fabien.dessenne@st.com>
To: Fabien Dessenne <fabien.dessenne@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 07 Mar 07:42 PST 2019, Fabien Dessenne wrote:

> Implement this optional ops, called by hwspinlock core while spinning on
> a lock, between two successive invocations of trylock().
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>

Applied

Thanks,
Bjorn

> ---
>  drivers/hwspinlock/stm32_hwspinlock.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
> index 4418392..c8eacf4 100644
> --- a/drivers/hwspinlock/stm32_hwspinlock.c
> +++ b/drivers/hwspinlock/stm32_hwspinlock.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/hwspinlock.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> @@ -42,9 +43,15 @@ static void stm32_hwspinlock_unlock(struct hwspinlock *lock)
>  	writel(STM32_MUTEX_COREID, lock_addr);
>  }
>  
> +static void stm32_hwspinlock_relax(struct hwspinlock *lock)
> +{
> +	ndelay(50);
> +}
> +
>  static const struct hwspinlock_ops stm32_hwspinlock_ops = {
>  	.trylock	= stm32_hwspinlock_trylock,
>  	.unlock		= stm32_hwspinlock_unlock,
> +	.relax		= stm32_hwspinlock_relax,
>  };
>  
>  static int stm32_hwspinlock_probe(struct platform_device *pdev)
> -- 
> 2.7.4
> 
