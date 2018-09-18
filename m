Return-Path: <niklas.cassel@linaro.org>
Return-Path: <niklas.cassel@linaro.org>
Date: Tue, 18 Sep 2018 18:26:45 +0200
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH v2 2/2] remoteproc: qcom: Rename Hexagon v5 modem driver
Message-ID: <20180918162645.GB7753@centauri>
References: <20180914173552.20370-1-bjorn.andersson@linaro.org>
 <20180914173552.20370-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180914173552.20370-3-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Sep 14, 2018 at 10:35:52AM -0700, Bjorn Andersson wrote:
> The qcom_q6v5_pil implements support for the self-authenticating modem
> subsystem. With the introduction of other q6v5 based non-TZ based
> remoteproc driver the current name is cause for confusion, so rename it
> to be more specific.
> 
> No functional change.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/remoteproc/Kconfig  | 14 +++++++-------
>  drivers/remoteproc/Makefile |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)

Hello Bjorn,

Patch 1/2 modifies platform_driver.driver.name and MODULE_DESCRIPTION.
I would have expected this patch to do the same.

Kind regards,
Niklas

> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 425e502c6471..8894935583e2 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -92,30 +92,30 @@ config QCOM_Q6V5_COMMON
>  	depends on ARCH_QCOM
>  	depends on QCOM_SMEM
>  
> -config QCOM_Q6V5_PAS
> -	tristate "Qualcomm Hexagon v5 Peripheral Authentication Service support"
> +config QCOM_Q6V5_MSS
> +	tristate "Qualcomm Hexagon V5 self-authenticating modem subsystem support"
>  	depends on OF && ARCH_QCOM
>  	depends on QCOM_SMEM
>  	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
>  	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
>  	depends on QCOM_SYSMON || QCOM_SYSMON=n
>  	select MFD_SYSCON
> -	select QCOM_MDT_LOADER
>  	select QCOM_Q6V5_COMMON
>  	select QCOM_RPROC_COMMON
>  	select QCOM_SCM
>  	help
> -	  Say y here to support the TrustZone based Peripherial Image Loader
> -	  for the Qualcomm Hexagon v5 based remote processors.
> +	  Say y here to support the Qualcomm self-authenticating modem
> +	  subsystem based on Hexagon V5.
>  
> -config QCOM_Q6V5_PIL
> -	tristate "Qualcomm Hexagon V5 Peripherial Image Loader"
> +config QCOM_Q6V5_PAS
> +	tristate "Qualcomm Hexagon v5 Peripheral Authentication Service support"
>  	depends on OF && ARCH_QCOM
>  	depends on QCOM_SMEM
>  	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
>  	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
>  	depends on QCOM_SYSMON || QCOM_SYSMON=n
>  	select MFD_SYSCON
> +	select QCOM_MDT_LOADER
>  	select QCOM_Q6V5_COMMON
>  	select QCOM_RPROC_COMMON
>  	select QCOM_SCM
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index eb86c8ba5a87..050f41ac93b0 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -16,8 +16,8 @@ obj-$(CONFIG_DA8XX_REMOTEPROC)		+= da8xx_remoteproc.o
>  obj-$(CONFIG_KEYSTONE_REMOTEPROC)	+= keystone_remoteproc.o
>  obj-$(CONFIG_QCOM_RPROC_COMMON)		+= qcom_common.o
>  obj-$(CONFIG_QCOM_Q6V5_COMMON)		+= qcom_q6v5.o
> +obj-$(CONFIG_QCOM_Q6V5_MSS)		+= qcom_q6v5_mss.o
>  obj-$(CONFIG_QCOM_Q6V5_PAS)		+= qcom_q6v5_pas.o
> -obj-$(CONFIG_QCOM_Q6V5_PIL)		+= qcom_q6v5_pil.o
>  obj-$(CONFIG_QCOM_Q6V5_WCSS)		+= qcom_q6v5_wcss.o
>  obj-$(CONFIG_QCOM_SYSMON)		+= qcom_sysmon.o
>  obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
> -- 
> 2.18.0
> 
