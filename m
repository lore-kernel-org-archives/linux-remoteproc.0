Return-Path: <sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 25 Sep 2018 15:48:46 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH] remoteproc: qcom: pas: Add QCS404 remoteprocs
In-Reply-To: <20180920172237.30965-1-bjorn.andersson@linaro.org>
References: <20180920172237.30965-1-bjorn.andersson@linaro.org>
Message-ID: <f0887494a9957496399046bac9b1fa32@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On 2018-09-20 22:52, Bjorn Andersson wrote:
> From: Govind Singh <govinds@codeaurora.org>
> 
> Add compatibles for the three PAS based remote processors found in
> QCS404.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> [bjorn: Added adsp and cdsp to the patch]
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,adsp.txt     |  3 +++
>  drivers/remoteproc/qcom_adsp_pil.c                   | 12 ++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> index b7d058228185..9c0cff3a5ed8 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> @@ -10,6 +10,9 @@ on the Qualcomm ADSP Hexagon core.
>  		    "qcom,msm8974-adsp-pil"
>  		    "qcom,msm8996-adsp-pil"
>  		    "qcom,msm8996-slpi-pil"
> +		    "qcom,qcs404-adsp-pas"
> +		    "qcom,qcs404-cdsp-pas"
> +		    "qcom,qcs404-wcss-pas"
>  		    "qcom,sdm845-adsp-pas"
>  		    "qcom,sdm845-cdsp-pas"
> 
> diff --git a/drivers/remoteproc/qcom_adsp_pil.c
> b/drivers/remoteproc/qcom_adsp_pil.c
> index da2254ea1135..fcbb816a9698 100644
> --- a/drivers/remoteproc/qcom_adsp_pil.c
> +++ b/drivers/remoteproc/qcom_adsp_pil.c
> @@ -362,10 +362,22 @@ static const struct adsp_data slpi_resource_init 
> = {
>  		.ssctl_id = 0x16,
>  };
> 
> +static const struct adsp_data wcss_resource_init = {
> +	.crash_reason_smem = 421,
> +	.firmware_name = "wcnss.mdt",
> +	.pas_id = 6,
> +	.ssr_name = "mpss",
> +	.sysmon_name = "wlan",

Shouldn't the sysmon name be "wcnss" instead of "wlan"?

> +	.ssctl_id = 0x12,
> +};
> +
>  static const struct of_device_id adsp_of_match[] = {
>  	{ .compatible = "qcom,msm8974-adsp-pil", .data = 
> &adsp_resource_init},
>  	{ .compatible = "qcom,msm8996-adsp-pil", .data = 
> &adsp_resource_init},
>  	{ .compatible = "qcom,msm8996-slpi-pil", .data = 
> &slpi_resource_init},
> +	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init 
> },
> +	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init 
> },
> +	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init 
> },
>  	{ .compatible = "qcom,sdm845-adsp-pas", .data = &adsp_resource_init},
>  	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &cdsp_resource_init},
>  	{ },

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
