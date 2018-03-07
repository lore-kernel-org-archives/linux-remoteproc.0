Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 7 Mar 2018 15:56:12 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/6] dt-bindings: remoteproc: Add Q6v5 Modem PIL binding
 for SDM845
Message-ID: <20180307215612.pk3igiws37mnoy2p@rob-hp-laptop>
References: <1520243613-30393-1-git-send-email-sibis@codeaurora.org>
 <1520243613-30393-5-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1520243613-30393-5-git-send-email-sibis@codeaurora.org>
To: sibis <sibis@codeaurora.org>
Cc: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, georgi.djakov@linaro.org, jassisinghbrar@gmail.com, p.zabel@pengutronix.de, ohad@wizery.com, mark.rutland@arm.com, kyan@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Mar 05, 2018 at 03:23:31PM +0530, sibis wrote:
> Add new compatible string for Qualcomm SDM845 SoCs
> 
> Signed-off-by: sibis <sibis@codeaurora.org>

Full name.

> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> index 00d3d58..11907db 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> @@ -9,8 +9,9 @@ on the Qualcomm Hexagon core.
>  	Definition: must be one of:
>  		    "qcom,q6v5-pil",
>  		    "qcom,msm8916-mss-pil",
> -		    "qcom,msm8974-mss-pil"
> -		    "qcom,msm8996-mss-pil"
> +		    "qcom,msm8974-mss-pil",
> +		    "qcom,msm8996-mss-pil",
> +		    "qcom,sdm845-mss-pil"

Drop the comma.

>  
>  - reg:
>  	Usage: required
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
