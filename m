Return-Path: <andy.gross@linaro.org>
Return-Path: <andy.gross@linaro.org>
Date: Wed, 1 Feb 2017 17:24:24 -0600
From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH 5/5] soc/qcom: Move qcom_mdt_loader from remoteproc
Message-ID: <20170201232424.GA30135@hector.attlocal.net>
References: <20170130165547.4344-1-bjorn.andersson@linaro.org>
 <20170130165547.4344-5-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170130165547.4344-5-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.com>, Georgi Djakov <georgi.djakov@linaro.org>, Jordan Crouse <jcrouse@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Jan 30, 2017 at 08:55:47AM -0800, Bjorn Andersson wrote:
> With the remoteproc parts cleaned out of the MDT loader we can move it
> to drivers/soc/qcom.

<snip>

> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 461b387d03cc..78b1bb7bcf20 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -10,6 +10,10 @@ config QCOM_GSBI
>            functions for connecting the underlying serial UART, SPI, and I2C
>            devices to the output pins.
>  
> +config QCOM_MDT_LOADER
> +	tristate
> +	select QCOM_SCM

Do we need a help description here?

> +
>  config QCOM_PM
>  	bool "Qualcomm Power Management"
>  	depends on ARCH_QCOM && !ARM64

Add the description on the next set and add my ack as well.

Acked-by: Andy Gross <andy.gross@linaro.org>
