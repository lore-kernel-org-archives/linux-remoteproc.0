Return-Path: <sboyd@codeaurora.org>
Date: Wed, 9 Nov 2016 17:54:02 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 2/3] dt-binding: remoteproc: venus rproc dt binding
 document
Message-ID: <20161110015402.GD16026@codeaurora.org>
References: <1478539853-23218-1-git-send-email-stanimir.varbanov@linaro.org>
 <1478539853-23218-3-git-send-email-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1478539853-23218-3-git-send-email-stanimir.varbanov@linaro.org>
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 11/07, Stanimir Varbanov wrote:
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,venus.txt b/Documentation/devicetree/bindings/remoteproc/qcom,venus.txt
> new file mode 100644
> index 000000000000..06a2db60fa38
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,venus.txt
> @@ -0,0 +1,33 @@
> +Qualcomm Venus Peripheral Image Loader
> +
> +This document defines the binding for a component that loads and boots firmware
> +on the Qualcomm Venus remote processor core.
> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must contain "qcom,venus-pil"
> +
> +- memory-region:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: a phandle to a node describing reserved memory
> +
> +* An example
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		venus_mem: venus@89900000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0x89900000 0x0 0x800000>;
> +			alignment = <0x1000>;
> +			no-map;
> +		};
> +	};
> +
> +	rproc_venus@0 {

Not sure we need @0 here in the example if it doesn't have a reg
property.

> +		compatible = "qcom,venus-pil";
> +		memory-region = <&venus_mem>;
> +	};
> -- 
> 2.7.4
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
