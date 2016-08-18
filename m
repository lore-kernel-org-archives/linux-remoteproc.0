Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 17 Aug 2016 22:43:09 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] dt-binding: remoteproc: Introduce ADSP loader binding
Message-ID: <20160818054309.GR26240@tuxbot>
References: <1471454854-28302-1-git-send-email-bjorn.andersson@linaro.org>
 <1471454854-28302-2-git-send-email-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1471454854-28302-2-git-send-email-bjorn.andersson@linaro.org>
To: Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 17 Aug 10:27 PDT 2016, Bjorn Andersson wrote:

> This document defines the binding for a component that loads firmware
> and control the life cycle of the Qualcomm ADSP core.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,adsp.txt   | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> new file mode 100644
> index 000000000000..077d9b6b9cd0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> @@ -0,0 +1,69 @@
> +Qualcomm ADSP Peripheral Image Loader
> +
> +This document defines the binding for a component that loads and boots firmware
> +on the Qualcomm ADSP core.
> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be one of:
> +		    "qcom,adsp-pil"

This won't fly, as I moved past 8974 and 8996 to 8064 I found a few new
details that makes this slightly off, and the 8660 ADSP resources are
way off.

So it's probably better to throw in a platform identifier in the
compatible.

Regards,
Bjorn

> +
> +- interrupts-extended:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: must list the watchdog, fatal IRQs ready, handover and
> +		    stop-ack IRQs
> +
> +- interrupt-names:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: must be "wdog", "fatal", "ready", "handover", "stop-ack"
> +
> +- cx-supply:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: reference to the regulator to be held on behalf of the
> +		    booting of the Hexagon core
> +
> +- memory-region:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: reference to the reserved-memory for the ADSP
> +
> +- qcom,smem-states:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: reference to the smem state for requesting the ADSP to
> +		    shut down
> +
> +- qcom,smem-state-names:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: must be "stop"
> +
> += EXAMPLE
> +The following example describes the resources needed to boot control the
> +ADSP, as it is found on MSM8974 boards.
> +
> +	adsp {
> +		compatible = "qcom,adsp-pil";
> +
> +		interrupts-extended = <&intc 0 162 1>,
> +				      <&adsp_smp2p_in 0 0>,
> +				      <&adsp_smp2p_in 1 0>,
> +				      <&adsp_smp2p_in 2 0>,
> +				      <&adsp_smp2p_in 3 0>;
> +		interrupt-names = "wdog",
> +				  "fatal",
> +				  "ready",
> +				  "handover",
> +				  "stop-ack";
> +
> +		cx-supply = <&pm8841_s2>;
> +
> +		memory-region = <&adsp_region>;
> +
> +		qcom,smem-states = <&adsp_smp2p_out 0>;
> +		qcom,smem-state-names = "stop";
> +	};
> -- 
> 2.5.0
> 
