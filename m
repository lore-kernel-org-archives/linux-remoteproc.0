Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 25 May 2017 23:09:28 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RESEND: PATCH v4 4/4] remoteproc: qcom: Add support for mss
 boot on msm8996
Message-ID: <20170526060928.GH12920@tuxbook>
References: <1494957722-13264-1-git-send-email-akdwived@codeaurora.org>
 <1494957722-13264-5-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1494957722-13264-5-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 16 May 11:02 PDT 2017, Avaneesh Kumar Dwivedi wrote:

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> index 92347fe..f9dfb6c 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> @@ -9,8 +9,8 @@ on the Qualcomm Hexagon core.
>  	Definition: must be one of:
>  		    "qcom,q6v5-pil",
>  		    "qcom,msm8916-mss-pil",
> -		    "qcom,msm8974-mss-pil"
> -
> +		    "qcom,msm8974-mss-pil",
> +		"qcom,msm8996-mss-pil"

Indentation please.

>  - reg:
>  	Usage: required
>  	Value type: <prop-encoded-array>
> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
[..]
> +/* QDSP6v56 parameters */
> +#define QDSP6v56_LDO_BYP		BIT(25)
> +#define QDSP6v56_BHS_ON		BIT(24)
> +#define QDSP6v56_CLAMP_WL		BIT(21)
> +#define QDSP6v56_CLAMP_QMC_MEM		BIT(22)
> +#define HALT_CHECK_MAX_LOOPS		200
> +#define QDSP6SS_XO_CBCR		0x0038
> +#define QDSP6SS_ACC_OVERRIDE_VAL		0x20

Please keep the blank line between the defines and the struct
definition.

>  struct reg_info {
>  	struct regulator *reg;
>  	int uV;
[..]
>  
> +static const struct rproc_hexagon_res msm8996_mss = {
> +	.hexagon_mba_image = "mba.mbn",
> +	.proxy_supply = (struct qcom_mss_reg_res[]) {
> +			{}
> +	},
> +	.active_supply = (struct qcom_mss_reg_res[]) {
> +			{},
> +			{}
> +	},

It's possible to just leave .proxy_supply and .active_supply out (i.e.
leaving them as NULL), as I made q6v5_regulator_init() handle this
gracefully a while back.

Regards,
Bjorn
