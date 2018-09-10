Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 10 Sep 2018 11:31:47 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 2/2] remoteproc: qcom: Introduce Non-PAS ADSP PIL
 driver
Message-ID: <20180910183147.GE2523@minitux>
References: <1535975560-8200-1-git-send-email-rohitkr@codeaurora.org>
 <1535975560-8200-3-git-send-email-rohitkr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1535975560-8200-3-git-send-email-rohitkr@codeaurora.org>
To: Rohit kumar <rohitkr@codeaurora.org>
Cc: ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org, srinivas.kandagatla@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 03 Sep 04:52 PDT 2018, Rohit kumar wrote:

> This adds Non PAS ADSP PIL driver for Qualcomm
> Technologies Inc SoCs.
> Added initial support for SDM845 with ADSP bootup and
> shutdown operation handled from Application Processor
> SubSystem(APSS).
> 
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>

Thanks for the changes Rohit, this looks good.

Once we hear from DT maintainers that patch 1 can be applied I will
update the name of the file and driver as I apply it to match the naming
scheme I'm aiming for - no need for you to resend because of this.

> ---
>  drivers/remoteproc/Kconfig         |  14 ++
>  drivers/remoteproc/Makefile        |   1 +
>  drivers/remoteproc/qcom_adsp_pil.c | 500 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 515 insertions(+)
>  create mode 100644 drivers/remoteproc/qcom_adsp_pil.c
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index c98c0b2..445de2d 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -139,6 +139,20 @@ config QCOM_Q6V5_WCSS
>  	  Say y here to support the Qualcomm Peripheral Image Loader for the
>  	  Hexagon V5 based WCSS remote processors.
>  
> +config QCOM_ADSP_PIL

I will make this QCOM_Q6V5_ADSP

[..]
> diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c

Make this qcom_q6v5_adsp.c

[..]
> +static struct platform_driver adsp_pil_driver = {
> +	.probe = adsp_probe,
> +	.remove = adsp_remove,
> +	.driver = {
> +		.name = "qcom_adsp_pil",

and this qcom_q6v5_adsp".

> +		.of_match_table = adsp_of_match,
> +	},
> +};

Please let me know if you have any objections to this.

Regards,
Bjorn
