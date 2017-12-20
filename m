Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 20 Dec 2017 12:30:00 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: soc: qcom: Add label for GLINK bindings
Message-ID: <20171220183000.rhxgyikfqzxmqkjo@rob-hp-laptop>
References: <1513634534-22861-1-git-send-email-clew@codeaurora.org>
 <1513634534-22861-2-git-send-email-clew@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1513634534-22861-2-git-send-email-clew@codeaurora.org>
To: Chris Lew <clew@codeaurora.org>
Cc: bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, aneela@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Dec 18, 2017 at 02:02:09PM -0800, Chris Lew wrote:
> Add a label property to identify the edge this node represents.

Why does a user need to know this?

> 
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
> index 9663cab52246..0b8cc533ca83 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
> @@ -10,6 +10,11 @@ edge.
>  	Value type: <stringlist>
>  	Definition: must be "qcom,glink-rpm"
>  
> +- label:
> +	Usage: optional
> +	Value type: <string>
> +	Definition: should specify the subsystem name this edge corresponds to.
> +
>  - interrupts:
>  	Usage: required
>  	Value type: <prop-encoded-array>
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
