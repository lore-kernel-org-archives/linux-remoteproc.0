Return-Path: <rohitkr@codeaurora.org>
From: Rohit kumar <rohitkr@codeaurora.org>
Subject: [PATCH v3] arm64: dts: sdm845: Add Q6V5 ADSP node
Date: Tue,  5 Feb 2019 16:04:54 +0530
Message-Id: <1549362894-3408-1-git-send-email-rohitkr@codeaurora.org>
To: dianders@chromium.org, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org, srinivas.kandagatla@linaro.org, linux-remoteproc@vger.kernel.org, bjorn.andersson@linaro.org, rohkumar@qti.qualcomm.com
Cc: Rohit kumar <rohitkr@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch adds Q6V5 ADSP pil remoteproc node
for SDM845 SoC.

Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
---
Changes since v2:
Updated reg property values from <0x17300000 0x410> to <0 0x17300000 0 0x410>

This depends on below upstream patches:
Add adsp_mem dt node: https://lkml.org/lkml/2019/1/29/1392
Remove lpass_aon clock from adsp clk list:  https://lore.kernel.org/patchwork/patch/1019609/

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 89 ++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 33f5f4b..c5cde12 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/reset/qcom,sdm845-aoss.h>
 #include <dt-bindings/reset/qcom,sdm845-pdc.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/soc/qcom,apr.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -2048,6 +2049,94 @@
 			status = "disabled";
 		};
 
+		adsp_pil: remoteproc-adsp-pil@17300000 {
+			compatible = "qcom,sdm845-adsp-pil";
+
+			reg = <0 0x17300000 0 0x410>;
+			interrupts-extended =
+				<&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
+				<&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				<&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				<&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				<&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_LPASS_SWAY_CLK>,
+				 <&lpasscc LPASS_Q6SS_AHBS_AON_CLK>,
+				 <&lpasscc LPASS_Q6SS_AHBM_AON_CLK>,
+				 <&lpasscc LPASS_QDSP6SS_XO_CLK>,
+				 <&lpasscc LPASS_QDSP6SS_SLEEP_CLK>,
+				 <&lpasscc LPASS_QDSP6SS_CORE_CLK>;
+
+			clock-names = "xo", "sway_cbcr", "lpass_ahbs_aon_cbcr",
+				      "lpass_ahbm_aon_cbcr", "qdsp6ss_xo",
+				      "qdsp6ss_sleep", "qdsp6ss_core";
+
+			resets = <&pdc_reset PDC_AUDIO_SYNC_RESET>,
+				 <&aoss_reset AOSS_CC_LPASS_RESTART>;
+			reset-names = "pdc_sync", "cc_lpass";
+
+			qcom,halt-regs = <&tcsr_mutex_regs 0x22000>;
+
+			memory-region = <&adsp_mem>;
+
+			qcom,smem-states = <&adsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+			glink-edge {
+				interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
+				label = "lpass";
+				qcom,remote-pid = <2>;
+				mboxes = <&apss_shared 8>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				apr@4 {
+					compatible = "qcom,apr-v2";
+					qcom,glink-channels = "apr_audio_svc";
+					reg = <APR_DOMAIN_ADSP>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					q6core {
+						compatible = "qcom,q6core";
+						reg = <APR_SVC_ADSP_CORE>;
+					};
+
+					q6afe {
+						compatible = "qcom,q6afe";
+						reg = <APR_SVC_AFE>;
+						q6afedai: afedais {
+							compatible = "qcom,q6afe-dais";
+							#sound-dai-cells = <1>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+
+					q6asm {
+						compatible = "qcom,q6asm";
+						reg = <APR_SVC_ASM>;
+						q6asmdai: asmdai{
+							compatible = "qcom,q6asm-dais";
+							iommus = <&apps_smmu 0x1821 0x0>;
+							#sound-dai-cells = <1>;
+						};
+					};
+
+					q6adm {
+						compatible = "qcom,q6adm";
+						reg = <APR_SVC_ADM>;
+						q6routing: routing {
+							compatible = "qcom,q6adm-routing";
+							#sound-dai-cells = <0>;
+						};
+					};
+				};
+			};
+		};
+
 		apss_shared: mailbox@17990000 {
 			compatible = "qcom,sdm845-apss-shared";
 			reg = <0 0x17990000 0 0x1000>;
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
