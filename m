Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 10 Sep 2018 11:27:52 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-binding: remoteproc: Add QTI ADSP PIL bindings
Message-ID: <20180910182752.GD2523@minitux>
References: <1535975560-8200-1-git-send-email-rohitkr@codeaurora.org>
 <1535975560-8200-2-git-send-email-rohitkr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1535975560-8200-2-git-send-email-rohitkr@codeaurora.org>
To: Rohit kumar <rohitkr@codeaurora.org>
Cc: ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org, srinivas.kandagatla@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 03 Sep 04:52 PDT 2018, Rohit kumar wrote:

> Add devicetree bindings documentation file for Qualcomm
> Technolgies Inc ADSP Peripheral Image Loader.
> 
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>

Rob, this revision looks good to me and I would like to move ahead and
merge it.

Regards,
Bjorn

> ---
>  .../bindings/remoteproc/qcom,adsp-pil.txt          | 123 +++++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,adsp-pil.txt
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp-pil.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp-pil.txt
> new file mode 100644
> index 0000000..f1c215a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp-pil.txt
> @@ -0,0 +1,123 @@
> +Qualcomm Technology Inc. ADSP Peripheral Image Loader
> +
> +This document defines the binding for a component that loads and boots firmware
> +on the Qualcomm Technology Inc. ADSP Hexagon core.
> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be one of:
> +		    "qcom,sdm845-adsp-pil"
> +
> +- reg:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: must specify the base address and size of the qdsp6ss register
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
> +- clocks:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition:  List of phandle and clock specifier pairs
> +
> +- clock-names:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: List of clock input name strings sorted in the same
> +				order as the clocks property.
> +
> +- power-domains:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: reference to cx power domain node.
> +
> +- resets:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: reference to the reset-controller for the lpass
> +
> +- reset-names:
> +        Usage: required
> +        Value type: <stringlist>
> +        Definition: must be "pdc_sync" and "cc_lpass"
> +
> +- qcom,halt-regs:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: a phandle reference to a syscon representing TCSR followed
> +			by the offset within syscon for lpass halt register.
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
> +
> += SUBNODES
> +The adsp node may have an subnode named "glink-edge" that describes the
> +communication edge, channels and devices related to the ADSP.
> +See ../soc/qcom/qcom,glink.txt for details on how to describe these.
> +
> += EXAMPLE
> +The following example describes the resources needed to boot control the
> +ADSP, as it is found on SDM845 boards.
> +	adsp-pil {
> +		compatible = "qcom,sdm845-adsp-pil";
> +
> +		reg = <0x17300000 0x40c>;
> +
> +		interrupts-extended = <&intc 0 162 IRQ_TYPE_EDGE_RISING>,
> +			<&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +			<&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +			<&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +			<&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "wdog", "fatal", "ready",
> +			"handover", "stop-ack";
> +
> +		clocks = <&rpmhcc RPMH_CXO_CLK>,
> +			<&gcc GCC_LPASS_SWAY_CLK>,
> +			<&lpasscc LPASS_AUDIO_WRAPPER_AON_CLK>,
> +			<&lpasscc LPASS_Q6SS_AHBS_AON_CLK>,
> +			<&lpasscc LPASS_Q6SS_AHBM_AON_CLK>,
> +			<&lpasscc LPASS_QDSP6SS_XO_CLK>,
> +			<&lpasscc LPASS_QDSP6SS_SLEEP_CLK>,
> +			<&lpasscc LPASS_QDSP6SS_CORE_CLK>;
> +		clock-names = "xo", "sway_cbcr", "lpass_aon",
> +			"lpass_ahbs_aon_cbcr",
> +			"lpass_ahbm_aon_cbcr", "qdsp6ss_xo",
> +			"qdsp6ss_sleep", "qdsp6ss_core";
> +
> +		power-domains = <&rpmhpd SDM845_CX>;
> +
> +		resets = <&pdc_reset PDC_AUDIO_SYNC_RESET>,
> +			 <&aoss_reset AOSS_CC_LPASS_RESTART>;
> +		reset-names = "pdc_sync", "cc_lpass";
> +
> +		qcom,halt-regs = <&tcsr_mutex_regs 0x22000>;
> +
> +		memory-region = <&pil_adsp_mem>;
> +
> +		qcom,smem-states = <&adsp_smp2p_out 0>;
> +		qcom,smem-state-names = "stop";
> +	};
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
