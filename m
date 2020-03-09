Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Mon, 9 Mar 2020 08:56:15 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: remoteproc: Add documentation for SPSS
 remoteproc
Message-ID: <20200309145615.GA24489@xps15>
References: <1583522467-3499-1-git-send-email-rishabhb@codeaurora.org>
 <1583522467-3499-3-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583522467-3499-3-git-send-email-rishabhb@codeaurora.org>
To: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, tsoni@codeaurora.org, psodagud@codeaurora.org, sidgup@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Rishabh,

On Fri, Mar 06, 2020 at 11:21:07AM -0800, Rishabh Bhatnagar wrote:
> Add devicetree binding for Secure Subsystem remote processor
> support in remoteproc framework. This describes all the resources
> needed by SPSS to boot and handle crash and shutdown scenarios.
>

Bindings in txt format are no longer accepted - everything needs to be in yaml
Also, this needs to be reviewed by the DT brigade.  As such you will
have to CC the device tree mailing list and Rob Herring.
 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,spss.txt   | 114 +++++++++++++++++++++
>  1 file changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,spss.txt
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,spss.txt b/Documentation/devicetree/bindings/remoteproc/qcom,spss.txt
> new file mode 100644
> index 0000000..79d6258
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,spss.txt
> @@ -0,0 +1,114 @@
> +Qualcomm SPSS Peripheral Image Loader
> +
> +This document defines the binding for a component that loads and boots firmware
> +on the Qualcomm Secure Peripheral Processor. This processor is booted in the
> +bootloader stage and it attaches itself to linux later on in the boot process.
> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be one of:
> +		    "qcom,sm8250-spss-pas"
> +
> +- reg:
> +	Should contain an entry for each value in 'reg-names'. Each entry
> +	have memory region's start address and size of the region.
> +
> +- reg-names:
> +	Should contain strings with the following names each representing
> +	a specific region in memory.
> +	"sp2soc_irq_status", "sp2soc_irq_clr", "sp2soc_irq_mask", "rmb_err",
> +	"rmb_err_spare2"
> +
> +- interrupts:
> +	Should contain the generic interrupt assigned to remote processor.
> +	The values should follow the interrupt-specifier format as dictated
> +	by the 'interrupt-parent' node.
> +
> +- clocks:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: reference to the xo clock and optionally aggre2 clock to be
> +		    held on behalf of the booting Hexagon core
> +
> +- clock-names:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: must be "xo" and optionally include "aggre2"
> +
> +- cx-supply:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: reference to the regulator to be held on behalf of the
> +		    booting Hexagon core
> +
> +- px-supply:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: reference to the px regulator to be held on behalf of the
> +		    booting Hexagon core
> +
> +- memory-region:
> +	Usage: required
> +	Value type: <phandle>
> +	Definition: reference to the reserved-memory for the SPSS
> +
> +- qcom,spss-scsr-bits:
> +	Usage: required
> +	Value type: <array>
> +	Definition: Bits that are set by remote processor in the irq status
> +		    register region to represent different states during
> +		    boot process
> +
> += SUBNODES
> +The spss node may have an subnode named either "smd-edge" or "glink-edge" that
> +describes the communication edge, channels and devices related to the SPSS.
> +See ../soc/qcom/qcom,smd.txt and ../soc/qcom/qcom,glink.txt for details on how
> +to describe these.
> +
> += EXAMPLE
> +The following example describes the resources needed to boot the
> +Secure Processor, as it is found on SM8250 boards.
> +
> +	spss {
> +		compatible = "qcom,sm8250-spss-pil";
> +		reg = <0x188101c 0x4>,
> +                      <0x1881024 0x4>,
> +                      <0x1881028 0x4>,
> +                      <0x188103c 0x4>,
> +                      <0x1882014 0x4>;
> +                reg-names = "sp2soc_irq_status", "sp2soc_irq_clr",
> +                            "sp2soc_irq_mask", "rmb_err", "rmb_err_spare2";
> +                interrupts = <0 352 1>;
> +
> +                cx-supply = <&VDD_CX_LEVEL>;
> +                cx-uV-uA = <RPMH_REGULATOR_LEVEL_TURBO 100000>;
> +                px-supply = <&VDD_MX_LEVEL>;
> +                px-uV = <RPMH_REGULATOR_LEVEL_TURBO 100000>;
> +
> +                clocks = <&clock_rpmh RPMH_CXO_CLK>;
> +                clock-names = "xo";
> +                qcom,proxy-clock-names = "xo";
> +                status = "ok";
> +
> +                memory-region = <&pil_spss_mem>;
> +                qcom,spss-scsr-bits = <24 25>;
> +
> +                glink-edge {
> +                        qcom,remote-pid = <8>;
> +                        transport = "spss";
> +                        mboxes = <&sp_scsr 0>;
> +                        mbox-names = "spss_spss";
> +                        interrupt-parent = <&intsp>;
> +                        interrupts = <0 0 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                        reg = <0x1885008 0x8>,
> +                              <0x1885010 0x4>;
> +                        reg-names = "qcom,spss-addr",
> +                                    "qcom,spss-size";
> +
> +                        label = "spss";
> +                        qcom,glink-label = "spss";
> +                };
> +	};
> +
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
