Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 3 Jan 2019 15:50:02 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845: Add Q6V5 ADSP node
Message-ID: <20190103235002.GI31596@builder>
References: <1545313174-13481-1-git-send-email-rohitkr@codeaurora.org>
 <1545313174-13481-3-git-send-email-rohitkr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1545313174-13481-3-git-send-email-rohitkr@codeaurora.org>
To: Rohit kumar <rohitkr@codeaurora.org>
Cc: dianders@chromium.org, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org, srinivas.kandagatla@linaro.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 20 Dec 05:39 PST 2018, Rohit kumar wrote:

> This patch adds Q6V5 ADSP remoteproc node for SDM845 SoCs.
> 

Thanks Rohit, nice to see these things on the list!

> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 96 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 95 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index c0a012f..dfeb3cf 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -13,6 +13,9 @@
>  #include <dt-bindings/reset/qcom,sdm845-aoss.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +#include <dt-bindings/soc/qcom,apr.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
> +#include <dt-bindings/sound/qcom,q6asm.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -1691,7 +1694,98 @@
>  				status = "disabled";
>  			};
>  		};
> -	};
> +
> +		adsp_pil: remoteproc@17300000 {

Please sort nodes by address, then name.

> +			compatible = "qcom,sdm845-adsp-pil";
> +
> +			reg = <0x17300000 0x410>;
> +			reg-names = "qdsp6ss";

reg-names was dropped from the binding (iirc), please omit it here.

> +
> +			interrupts-extended = <&intc 0 162 IRQ_TYPE_EDGE_RISING>,

s/0/GIC_SPI/

> +				<&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +				<&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +				<&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +				<&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready",
> +					  "handover", "stop-ack";
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_LPASS_SWAY_CLK>,
> +				 <&lpasscc LPASS_Q6SS_AHBS_AON_CLK>,
> +				 <&lpasscc LPASS_Q6SS_AHBM_AON_CLK>,
> +				 <&lpasscc LPASS_QDSP6SS_XO_CLK>,
> +				 <&lpasscc LPASS_QDSP6SS_SLEEP_CLK>,
> +				 <&lpasscc LPASS_QDSP6SS_CORE_CLK>;
> +
> +			clock-names = "xo", "sway_cbcr", "lpass_ahbs_aon_cbcr",
> +				      "lpass_ahbm_aon_cbcr", "qdsp6ss_xo",
> +				      "qdsp6ss_sleep", "qdsp6ss_core";
> +
> +			resets = <&pdc_reset PDC_AUDIO_SYNC_RESET>,
> +				 <&aoss_reset AOSS_CC_LPASS_RESTART>;
> +			reset-names = "pdc_sync", "cc_lpass";
> +
> +			qcom,halt-regs = <&tcsr_mutex_regs 0x22000>;
> +
> +			memory-region = <&pil_adsp_mem>;
> +
> +			qcom,smem-states = <&adsp_smp2p_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			glink-edge {

So we will end up duplicating these between the PAS based and non-PAS
based remoteprocs. I don't have a better idea right now, but this
deserves some thought.

> +				compatible = "qcom,glink-smem";
> +				interrupts = <0 156 IRQ_TYPE_EDGE_RISING>;

s/0/GIC_SPI/

> +
> +				label = "lpass";
> +				qcom,remote-pid = <2>;
> +				mboxes = <&apss_shared 8>;
> +				mbox-names = "adsp_smem";

mbox-names is not a documented property, please omit it.

> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				apr@4 {
> +					compatible = "qcom,apr-v2";
> +					qcom,glink-channels = "apr_audio_svc";
> +					reg = <APR_DOMAIN_ADSP>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					q6core {
> +						compatible = "qcom,q6core";
> +						reg = <APR_SVC_ADSP_CORE>;
> +					};
> +
> +					q6afe {
> +						compatible = "qcom,q6afe";
> +						reg = <APR_SVC_AFE>;
> +						q6afedai: afedais {
> +							compatible = "qcom,q6afe-dais";
> +							#sound-dai-cells = <1>;
> +							#address-cells = <1>;
> +							#size-cells = <0>;
> +						};
> +					};
> +
> +					q6asm {
> +						compatible = "qcom,q6asm";
> +						reg = <APR_SVC_ASM>;
> +						q6asmdai: asmdai{
> +							compatible = "qcom,q6asm-dais";
> +							iommus = <&apps_smmu 0x1821 0x0>;
> +							#sound-dai-cells = <1>;
> +						};
> +					};
> +
> +					q6adm {
> +						compatible = "qcom,q6adm";
> +						reg = <APR_SVC_ADM>;
> +						q6routing: routing {
> +							compatible = "qcom,q6adm-routing";
> +							#sound-dai-cells = <0>;
> +						};
> +					};
> +				};
> +			};
> +			status = "disabled";

Properties must come before subnodes.

> +		};

Regards,
Bjorn
