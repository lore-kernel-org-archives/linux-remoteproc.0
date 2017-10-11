Return-Path: <ore@pengutronix.de>
Date: Wed, 11 Oct 2017 14:35:17 +0200
From: Oleksij Rempel <ore@pengutronix.de>
Subject: Re: [PATCH] remoteproc: imx_rproc: fix return value check in
 imx_rproc_addr_init()
Message-ID: <20171011123516.sc57t5sttm4uhgnn@pengutronix.de>
References: <1507718924-127469-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507718924-127469-1-git-send-email-weiyongjun1@huawei.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Oleksij Rempel <o.rempel@pengutronix.de>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Oct 11, 2017 at 10:48:44AM +0000, Wei Yongjun wrote:
> In case of error, the function devm_ioremap() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check should
> be replaced with NULL test.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 612d914..fc38916 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -269,10 +269,9 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  
>  		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
>  						     att->sa, att->size);
> -		if (IS_ERR(priv->mem[b].cpu_addr)) {
> +		if (!priv->mem[b].cpu_addr) {
>  			dev_err(dev, "devm_ioremap_resource failed\n");
> -			err = PTR_ERR(priv->mem[b].cpu_addr);
> -			return err;
> +			return -ENOMEM;
>  		}
>  		priv->mem[b].sys_addr = att->sa;
>  		priv->mem[b].size = att->size;
> 
> 

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
