Return-Path: <ore@pengutronix.de>
Date: Tue, 4 Jun 2019 06:19:46 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH 2/2] remoteproc: imx: Fix typo in "failed"
Message-ID: <20190604041946.hvmhcpwybpwn2hdk@pengutronix.de>
References: <20190603234628.10924-1-festevam@gmail.com>
 <20190603234628.10924-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190603234628.10924-2-festevam@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Jun 03, 2019 at 08:46:28PM -0300, Fabio Estevam wrote:
> There are several places where "failed" is spelled incorrectly.
> 
> Fix them all.

Thank you!

Reviewed-by:  Oleksij Rempel <o.rempel@pengutronix.de>

> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 54c07fd3f204..7e0804c72677 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -168,7 +168,7 @@ static int imx_rproc_start(struct rproc *rproc)
>  	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
>  				 dcfg->src_mask, dcfg->src_start);
>  	if (ret)
> -		dev_err(dev, "Filed to enable M4!\n");
> +		dev_err(dev, "Failed to enable M4!\n");
>  
>  	return ret;
>  }
> @@ -183,7 +183,7 @@ static int imx_rproc_stop(struct rproc *rproc)
>  	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
>  				 dcfg->src_mask, dcfg->src_stop);
>  	if (ret)
> -		dev_err(dev, "Filed to stop M4!\n");
> +		dev_err(dev, "Failed to stop M4!\n");
>  
>  	return ret;
>  }
> @@ -206,7 +206,7 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
>  		}
>  	}
>  
> -	dev_warn(priv->dev, "Translation filed: da = 0x%llx len = 0x%x\n",
> +	dev_warn(priv->dev, "Translation failed: da = 0x%llx len = 0x%x\n",
>  		 da, len);
>  	return -ENOENT;
>  }
> @@ -352,7 +352,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  
>  	ret = imx_rproc_addr_init(priv, pdev);
>  	if (ret) {
> -		dev_err(dev, "filed on imx_rproc_addr_init\n");
> +		dev_err(dev, "failed on imx_rproc_addr_init\n");
>  		goto err_put_rproc;
>  	}
>  
> -- 
> 2.17.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
