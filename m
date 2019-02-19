Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 18 Feb 2019 23:10:48 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 6/8] dt-binding: remoteproc: Add QTI WCSS PIL bindings
Message-ID: <20190219071048.GH13018@tuxbook-pro>
References: <20190202152626.1006-1-govinds@codeaurora.org>
 <20190202152626.1006-7-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190202152626.1006-7-govinds@codeaurora.org>
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-remoteproc@vger.kernel.org, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Sat 02 Feb 07:26 PST 2019, Govind Singh wrote:

> Add devicetree bindings for WCSS non pas remoteproc.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/remoteproc/qcom,q6v5.txt         | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> index 9ff5b0309417..1fe8e9f72204 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> @@ -13,6 +13,7 @@ on the Qualcomm Hexagon core.
>  		    "qcom,msm8974-mss-pil"
>  		    "qcom,msm8996-mss-pil"
>  		    "qcom,sdm845-mss-pil"
> +		    "qcom,qcs404-wcss-pil"
>  
>  - reg:
>  	Usage: required
> @@ -153,3 +154,63 @@ Hexagon, as it is found on MSM8974 boards.
>  			memory-region = <&mpss_region>;
>  		};
>  	};
> +
> +	remoteproc-wcss {

I'm not sure it's useful to add another full example here. So some of
the following comments might not matter.

> +		compatible = "qcom,qcs404-wcss-pil";
> +		reg = <0x07400000 0x00104>;
> +		reg-names = "qdsp6";
> +
> +		interrupts-extended = <&intc GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
> +				      <&wcss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +				      <&wcss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +				      <&wcss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +				      <&wcss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "wdog", "fatal", "ready",
> +				  "handover", "stop-ack";
> +
> +		clocks = <&xo_board>,
> +			 <&gcc GCC_WCSS_Q6_AHB_CBCR_CLK>,
> +			 <&gcc GCC_WCSS_Q6_AXIM_CBCR_CLK>,
> +
> +			 <&clock_wcsscc WCSS_AHBFABRIC_CBCR_CLK>,

As with the previous patch, I don't think you should have both "clock"
and "cc" in the name, just make it "wcsscc". But isn't the actual name
q6sstopcc?

> +			 <&clock_wcsscc WCSS_LCC_CBCR_CLK>,
> +			 <&clock_wcsscc WCSS_AHBS_CBCR_CLK>,
> +			 <&clock_wcsscc WCSS_TCM_CBCR_CLK>,
> +			 <&clock_wcsscc WCSS_AHBM_CBCR_CLK>,
> +			 <&clock_wcsscc WCSS_AXIM_CBCR_CLK>,
> +			 <&clock_wcsscc WCSS_QDSP6SS_XO_CBCR_CLK>,
> +			 <&clock_wcsscc WCSS_QDSP6SS_SLEEP_CBCR_CLK>,
> +			 <&clock_wcsscc WCSS_QDSP6SS_GFMMUX_CLK>,
> +			 <&clock_wcsscc WCSS_BCR_CBCR_CLK>;
> +
> +		clock-names = "xo", "gcc_abhs_cbcr", "gcc_axim_cbcr",
> +			      "wcss_ahbfabric_cbcr", "wcnss_csr_cbcr",
> +			      "wcnss_ahbs_cbcr", "wcnss_tcm_slave_cbcr",
> +			      "wcnss_abhm_cbcr", "wcnss_axim_cbcr",
> +			      "wcnss_qdsp6ss_xo_cbcr", "wcnss_sleep_cbcr",
> +			      "wcnss_core_gfm", "wcss_bcr_cbcr";

These clocks should be listed in the binding document. And as the scope
is local to "clock-names" there's no reason to include "wcnss_" in their
name.

> +		resets = <&gcc GCC_WDSP_RESTART>,
> +			 <&clock_wcsscc Q6SSTOP_QDSP6SS_RESET>,
> +			 <&clock_wcsscc Q6SSTOP_QDSP6SS_CORE_RESET>,
> +			 <&clock_wcsscc Q6SSTOP_QDSP6SS_BUS_RESET>,
> +			 <&clock_wcsscc Q6SSTOP_BCR_RESET>;
> +		reset-names = "wcss_reset", "wcss_q6_reset",
> +			      "wcss_q6_core_reset", "wcss_q6_bus_reset",
> +			      "wcss_q6_bcr_reset";
> +
> +		memory-region = <&wlan_fw_mem>;
> +
> +		qcom,smem-states = <&wcss_smp2p_out 0>;
> +		qcom,smem-state-names = "stop";
> +		qcom,halt-regs = <&tcsr_wlan_q6 0x18000>;

Is this the Q6 specific TCSR and not just the primary TCSR?

> +		glink-edge {
> +			interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			qcom,remote-pid = <1>;
> +			mboxes = <&apcs_glb 16>;
> +
> +			label = "wcss";
> +			};
> +		};

Indentation is off here.

Regards,
Bjorn
