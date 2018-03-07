Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 7 Mar 2018 15:55:41 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: mailbox: Add APCS global binding for
 SDM845 SoCs
Message-ID: <20180307215541.hs55cfdlrga7p7qo@rob-hp-laptop>
References: <1520243613-30393-1-git-send-email-sibis@codeaurora.org>
 <1520243613-30393-3-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1520243613-30393-3-git-send-email-sibis@codeaurora.org>
To: sibis <sibis@codeaurora.org>
Cc: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, georgi.djakov@linaro.org, jassisinghbrar@gmail.com, p.zabel@pengutronix.de, ohad@wizery.com, mark.rutland@arm.com, kyan@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Mar 05, 2018 at 03:23:29PM +0530, sibis wrote:
> Include SDM845 APCS binding to the list of possible bindings
> 
> Signed-off-by: sibis <sibis@codeaurora.org>

Need a full name.

> ---
>  Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
> index 16964f0..a60d2b2 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
> @@ -9,7 +9,8 @@ platforms.
>  	Value type: <string>
>  	Definition: must be one of:
>  		    "qcom,msm8916-apcs-kpss-global",
> -		    "qcom,msm8996-apcs-hmss-global"
> +		    "qcom,msm8996-apcs-hmss-global",
> +		    "qcom,sdm845-apcs-hmss-global"

Drop the comma so we can have 1 line changes instead of 3 in the 
future.

>  
>  - reg:
>  	Usage: required
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
