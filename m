Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 6 Jul 2018 14:32:36 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] remoteproc: qcom: Introduce Non-PAS ADSP PIL driver
Message-ID: <20180706203236.GA24729@rob-hp-laptop>
References: <1530264053-8394-1-git-send-email-rohitkr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1530264053-8394-1-git-send-email-rohitkr@codeaurora.org>
To: Rohit kumar <rohitkr@codeaurora.org>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bgoswami@codeaurora.org, sbpata@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Jun 29, 2018 at 02:50:53PM +0530, Rohit kumar wrote:
> This adds APSS based ADSP PIL driver for QCOM SoCs.
> Added initial support for SDM845 with ADSP bootup and
> shutdown operation handled from Application Processor
> SubSystem(APSS).
> 
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> ---
> Changes since v1:
> - Used APIs from qcom_q6v5.c
> - Use clock, reset and regmap driver APIs instead of 
>   directly writing into the LPASS registers.
> - Created new file for non PAS ADSP PIL instead of extending
>   existing ADSP PIL driver.
> - cleanups as suggested by Bjorn and Rob.
> 
>  .../bindings/remoteproc/qcom,non-pas-adsp.txt      | 138 +++++

This should be a separate patch.

>  drivers/remoteproc/Kconfig                         |  18 +
>  drivers/remoteproc/Makefile                        |   1 +
>  drivers/remoteproc/qcom_nonpas_adsp_pil.c          | 667 +++++++++++++++++++++
>  4 files changed, 824 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,non-pas-adsp.txt
>  create mode 100644 drivers/remoteproc/qcom_nonpas_adsp_pil.c
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,non-pas-adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,non-pas-adsp.txt
> new file mode 100644
> index 0000000..0581aaa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,non-pas-adsp.txt
> @@ -0,0 +1,138 @@
> +Qualcomm Technology Inc. Non PAS ADSP Peripheral Image Loader
> +
> +This document defines the binding for a component that loads and boots firmware
> +on the Qualcomm Technology Inc. ADSP Hexagon core.
> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be one of:
> +		    "qcom,sdm845-apss-adsp-pil"

Didn't Bjorn say to drop the 'apss' part?

> +
> +- reg:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: must specify the base address and size of the qdsp6ss
> +
> +- reg-names:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: must be "qdsp6ss"
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
> +- cx-supply:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: reference to the regulator to be held on behalf of the
> +		    booting Hexagon core
> +
> +- px-supply:
> +	Usage: optional
> +	Value type: <phandle>
> +	Definition: reference to the px regulator to be held on behalf of the
> +		    booting Hexagon core
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
> +The adsp node may have an subnode named either "smd-edge" or "glink-edge" that
> +describes the communication edge, channels and devices related to the ADSP.
> +See ../soc/qcom/qcom,smd.txt and ../soc/qcom/qcom,glink.txt for details on how
> +to describe these.
> +
> +
> += EXAMPLE
> +The following example describes the resources needed to boot control the
> +ADSP, as it is found on SDM845 boards.
> +	adsp-pil {
> +		compatible = "qcom,sdm845-apss-adsp-pil";
> +
> +		reg = <0x17300000 0x40c>;
> +		reg-names = "qdsp6ss";
> +
> +		interrupts-extended = <&intc 0 162 IRQ_TYPE_EDGE_RISING>,
> +			<&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +			<&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +			<&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +			<&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "wdog", "fatal", "ready",
> +			"handover", "stop-ack";
> +
> +		clocks = <&clock_rpmh RPMH_CXO_CLK>,
> +			<&lpasscc GCC_LPASS_SWAY_CLK>,
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
> +		cx-supply = <&pm8998_s9_level>;
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
