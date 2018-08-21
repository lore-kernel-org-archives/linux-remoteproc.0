Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 21 Aug 2018 15:17:40 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/4] reset: qcom: PDC (Power Domain Controller) reset
 controller
Message-ID: <20180821221740.GB2353@minitux>
References: <20180727152811.15258-1-sibis@codeaurora.org>
 <20180727152811.15258-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180727152811.15258-2-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: p.zabel@pengutronix.de, robh+dt@kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ohad@wizery.com, mark.rutland@arm.com, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 27 Jul 08:28 PDT 2018, Sibi Sankar wrote:

> Add reset controller for SDM845 SoC to control reset signals
> provided by PDC for Modem, Compute, Display, GPU, Debug, AOP,
> Sensors, Audio, SP and APPS
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/reset/Kconfig          |   9 +++
>  drivers/reset/Makefile         |   1 +
>  drivers/reset/reset-qcom-pdc.c | 139 +++++++++++++++++++++++++++++++++
>  3 files changed, 149 insertions(+)
>  create mode 100644 drivers/reset/reset-qcom-pdc.c
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 13d28fdbdbb5..5344e202a630 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -98,6 +98,15 @@ config RESET_QCOM_AOSS
>  	  reset signals provided by AOSS for Modem, Venus, ADSP,
>  	  GPU, Camera, Wireless, Display subsystem. Otherwise, say N.
>  
> +config RESET_QCOM_PDC
> +	bool "Qcom PDC Reset Driver"

"Qualcomm"

And I do not see a strong reason for this not being tristate, the
consumers we've talked about so far can all be modules.

> +	depends on ARCH_QCOM || COMPILE_TEST
> +	help
> +	  This enables the PDC (Power Domain Controller) reset driver
> +	  for Qualcomm Technologies Inc SDM845 SoCs. Say Y if you want
> +	  to control reset signals provided by PDC for Modem, Compute,
> +	  Display, GPU, Debug, AOP, Sensors, Audio, SP and APPS.
> +

Implementation looks fine.

Regards,
Bjorn
