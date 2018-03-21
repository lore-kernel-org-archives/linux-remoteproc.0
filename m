Return-Path: <david@lechnology.com>
Subject: Re: [PATCH 5/8] remoteproc: da8xx: add the missing checke for
 clk_enable()
References: <20180321120807.18032-1-brgl@bgdev.pl>
 <20180321120807.18032-6-brgl@bgdev.pl>
From: David Lechner <david@lechnology.com>
Message-ID: <f528a120-d6e8-ff6f-243a-256ce4c392a9@lechnology.com>
Date: Wed, 21 Mar 2018 11:21:04 -0500
MIME-Version: 1.0
In-Reply-To: <20180321120807.18032-6-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On 03/21/2018 07:08 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The davinci platform is being switched to using the common clock
> framework, where clk_enable() can fail. Add the return value check.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>   drivers/remoteproc/da8xx_remoteproc.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
> index bf3b9034c319..592bf0fc52e8 100644
> --- a/drivers/remoteproc/da8xx_remoteproc.c
> +++ b/drivers/remoteproc/da8xx_remoteproc.c
> @@ -138,6 +138,7 @@ static int da8xx_rproc_start(struct rproc *rproc)
>   	struct device *dev = rproc->dev.parent;
>   	struct da8xx_rproc *drproc = (struct da8xx_rproc *)rproc->priv;
>   	struct clk *dsp_clk = drproc->dsp_clk;
> +	int rv;

For style points, you could use ret instead of rv to be consistent with
the rest of this driver.

>   
>   	/* hw requires the start (boot) address be on 1KB boundary */
>   	if (rproc->bootaddr & 0x3ff) {
> @@ -148,7 +149,12 @@ static int da8xx_rproc_start(struct rproc *rproc)
>   
>   	writel(rproc->bootaddr, drproc->bootreg);
>   
> -	clk_enable(dsp_clk);
> +	rv = clk_enable(dsp_clk);
> +	if (rv) {
> +		dev_err(dev, "clk_enable() failed: %d\n", rv);
> +		return rv;
> +	}
> +
>   	davinci_clk_reset_deassert(dsp_clk);
>   
>   	return 0;
> 
