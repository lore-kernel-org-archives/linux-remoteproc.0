Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 9 Dec 2016 11:23:10 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: qcom_adsp_pil: select qcom_scm
Message-ID: <20161209192310.GY30492@tuxbot>
References: <20161209114730.3780719-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161209114730.3780719-1-arnd@arndb.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 09 Dec 03:47 PST 2016, Arnd Bergmann wrote:

> The adsp-pil driver relies on SCM and causes a build error without it:
> 
> ERROR: "qcom_scm_pas_supported" [drivers/remoteproc/qcom_adsp_pil.ko] undefined!
> ERROR: "qcom_scm_is_available" [drivers/remoteproc/qcom_adsp_pil.ko] undefined!
> ERROR: "qcom_scm_pas_auth_and_reset" [drivers/remoteproc/qcom_adsp_pil.ko] undefined!
> ERROR: "qcom_scm_pas_shutdown" [drivers/remoteproc/qcom_adsp_pil.ko] undefined!
> ERROR: "qcom_scm_pas_mem_setup" [drivers/remoteproc/qcom_adsp_pil.ko] undefined!
> ERROR: "qcom_scm_pas_init_image" [drivers/remoteproc/qcom_adsp_pil.ko] undefined!
> 
> This adds a 'select', as SCM is a silent Kconfig symbol that gets
> enabled implicitly by all its users.
> 

Thanks, sorry for giving you the opportunity for finding all these odd
combinations.

Are you aware of any projects aiming to catch these through e.g.
dependency analysis rather than random build testing (and my now growing
manual checklist)?

Regards,
Bjorn

> Fixes: b9e718e950c3 ("remoteproc: Introduce Qualcomm ADSP PIL")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/remoteproc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 51d7ca0e10fc..1177329b7618 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -85,6 +85,7 @@ config QCOM_ADSP_PIL
>  	depends on QCOM_SMEM
>  	select MFD_SYSCON
>  	select QCOM_MDT_LOADER
> +	select QCOM_SCM
>  	help
>  	  Say y here to support the TrustZone based Peripherial Image Loader
>  	  for the Qualcomm ADSP remote processors.
> -- 
> 2.9.0
> 
