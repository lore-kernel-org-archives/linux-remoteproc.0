Return-Path: <bjorn.andersson@linaro.org>
Date: Sun, 18 Mar 2018 15:46:15 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 5/7] dt-bindings: remoteproc: Add Q6v5 Modem PIL
 binding for SDM845
Message-ID: <20180318224615.GG5626@tuxbook-pro>
References: <1521019283-32212-1-git-send-email-sibis@codeaurora.org>
 <1521019283-32212-6-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521019283-32212-6-git-send-email-sibis@codeaurora.org>
To: Sibi S <sibis@codeaurora.org>
Cc: p.zabel@pengutronix.de, robh+dt@kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, georgi.djakov@linaro.org, jassisinghbrar@gmail.com, ohad@wizery.com, mark.rutland@arm.com, kyan@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 14 Mar 02:21 PDT 2018, Sibi S wrote:

> Add new compatible string for Qualcomm SDM845 SoCs
> 

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Sibi S <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> index 00d3d58..d901824 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> @@ -11,6 +11,7 @@ on the Qualcomm Hexagon core.
>  		    "qcom,msm8916-mss-pil",
>  		    "qcom,msm8974-mss-pil"
>  		    "qcom,msm8996-mss-pil"
> +		    "qcom,sdm845-mss-pil"
>  
>  - reg:
>  	Usage: required
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
