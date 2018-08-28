Return-Path: <sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 28 Aug 2018 14:13:49 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH] remoteproc: qcom: adsp: Add SDM845 ADSP and CDSP support
In-Reply-To: <20180828071458.26858-1-bjorn.andersson@linaro.org>
References: <20180828071458.26858-1-bjorn.andersson@linaro.org>
Message-ID: <bc66f41f8e96e92af424af473cd746d5@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Tested-by: Sibi Sankar <sibis@codeaurora.org>

On 2018-08-28 12:44, Bjorn Andersson wrote:
> Add support for booting the Audio and Compute DSPs found in Qualcomm's
> SDM845 platform.
> 
> As with the previous platforms the power rail handling needs to be
> updated once the appropriate support lands upstream.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,adsp.txt     |  2 ++
>  drivers/remoteproc/qcom_q6v5_pas.c                   | 12 ++++++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> index 728e4193f7a6..b7d058228185 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> @@ -10,6 +10,8 @@ on the Qualcomm ADSP Hexagon core.
>  		    "qcom,msm8974-adsp-pil"
>  		    "qcom,msm8996-adsp-pil"
>  		    "qcom,msm8996-slpi-pil"
> +		    "qcom,sdm845-adsp-pas"
> +		    "qcom,sdm845-cdsp-pas"
> 
>  - interrupts-extended:
>  	Usage: required
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c
> b/drivers/remoteproc/qcom_q6v5_pas.c
> index 2478ef3cd519..53eff2afda06 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -342,6 +342,16 @@ static const struct adsp_data adsp_resource_init = 
> {
>  		.ssctl_id = 0x14,
>  };
> 
> +static const struct adsp_data cdsp_resource_init = {
> +	.crash_reason_smem = 601,
> +	.firmware_name = "cdsp.mdt",
> +	.pas_id = 18,
> +	.has_aggre2_clk = false,
> +	.ssr_name = "cdsp",
> +	.sysmon_name = "cdsp",
> +	.ssctl_id = 0x17,
> +};
> +
>  static const struct adsp_data slpi_resource_init = {
>  		.crash_reason_smem = 424,
>  		.firmware_name = "slpi.mdt",
> @@ -355,6 +365,8 @@ static const struct adsp_data slpi_resource_init = 
> {
>  static const struct of_device_id adsp_of_match[] = {
>  	{ .compatible = "qcom,msm8974-adsp-pil", .data = 
> &adsp_resource_init},
>  	{ .compatible = "qcom,msm8996-adsp-pil", .data = 
> &adsp_resource_init},
>  	{ .compatible = "qcom,msm8996-slpi-pil", .data = 
> &slpi_resource_init},
> +	{ .compatible = "qcom,sdm845-adsp-pas", .data = &adsp_resource_init},
> +	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &cdsp_resource_init},
>  	{ },
>  };

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
