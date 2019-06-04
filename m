Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 3 Jun 2019 22:01:21 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] remoteproc: imx: Broaden the Kconfig selection logic
Message-ID: <20190604050121.GA23094@builder>
References: <20190603234628.10924-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190603234628.10924-1-festevam@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: ohad@wizery.com, o.rempel@pengutronix.de, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 03 Jun 16:46 PDT 2019, Fabio Estevam wrote:

> Besides i.MX6SX and i.MX7D, there are other i.MX devices that contain
> Cortex M4 and could make use of the imx remoteproc driver, such as
> i.MX7ULP, i.MX8M, etc.
> 
> Instead of adding new SoC entries in the Kconfig logic, make it
> broader by using the more generic ARCH_MXC, which encompasses
> all the 32-bit and 64-bit i.MX devices.
> 

Patches applied with Oleksij's review.

Thanks,
Bjorn

> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/remoteproc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 18be41b8aa7e..0df301be6d9a 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -16,7 +16,7 @@ if REMOTEPROC
>  
>  config IMX_REMOTEPROC
>  	tristate "IMX6/7 remoteproc support"
> -	depends on SOC_IMX6SX || SOC_IMX7D
> +	depends on ARCH_MXC
>  	help
>  	  Say y here to support iMX's remote processors (Cortex M4
>  	  on iMX7D) via the remote processor framework.
> -- 
> 2.17.1
> 
