Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 23 Aug 2016 12:32:59 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] dt-binding: remoteproc: venus rproc dt binding
 document
Message-ID: <20160823173259.GA13327@rob-hp-laptop>
References: <1471622000-1906-1-git-send-email-stanimir.varbanov@linaro.org>
 <1471622000-1906-4-git-send-email-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1471622000-1906-4-git-send-email-stanimir.varbanov@linaro.org>
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Rob Clark <robdclark@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Aug 19, 2016 at 06:53:19PM +0300, Stanimir Varbanov wrote:
> Add devicetree binding document for Venus remote processor.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,venus.txt  | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,venus.txt
> 
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

This does not make sense to me. Venus is the video encoder/decoder h/w, 
right? Why is the firmware loader separate from the codec block? Why 
rproc is used? Are there multiple clients? Naming it rproc_venus implies 
there aren't. And why does the firmware loading need 8MB of memory at a 
fixed address?

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
> +		compatible = "qcom,venus-pil";
> +		memory-region = <&venus_mem>;
> +	};
> \ No newline at end of file
> -- 
> 2.7.4
> 
