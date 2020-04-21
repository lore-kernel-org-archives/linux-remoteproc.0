Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 7/7] arm64: dts: qcom: sc7180: Update Q6V5 MSS node
Date: Tue, 21 Apr 2020 20:02:28 +0530
Message-Id: <20200421143228.8981-8-sibis@codeaurora.org>
In-Reply-To: <20200421143228.8981-1-sibis@codeaurora.org>
References: <20200421143228.8981-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc: agross@kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, ohad@wizery.com, mka@chromium.org, dianders@chromium.org, devicetree@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add TCSR node and update MSS node to support MSA based Modem boot on
SC7180 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

V2:
 * use memory-region to reference mba/mpss regions [Bjorn]
 * overload the base remoteproc_mpss node wherever possible [Bjorn]

Depends on the following bindings:
iommus: https://patchwork.kernel.org/patch/11499603/
spare-regs: https://patchwork.kernel.org/patch/11491425/

 arch/arm64/boot/dts/qcom/sc7180-idp.dts |  7 +++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi    | 28 +++++++++++++++++++++----
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 5405cde1a32ef..08f1f04cca734 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -309,6 +309,13 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&remoteproc_mpss {
+	status = "okay";
+	compatible = "qcom,sc7180-mss-pil";
+	iommus = <&apps_smmu 0x460 0x1>, <&apps_smmu 0x444 0x3>;
+	memory-region = <&mba_mem &mpss_mem>;
+};
+
 &sdhc_1 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 94cead96eade0..5e2618eb1b7fa 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -932,6 +932,11 @@ tcsr_mutex_regs: syscon@1f40000 {
 			reg = <0 0x01f40000 0 0x40000>;
 		};
 
+		tcsr_regs: syscon@1fc0000 {
+			compatible = "syscon";
+			reg = <0 0x01fc0000 0 0x40000>;
+		};
+
 		tlmm: pinctrl@3500000 {
 			compatible = "qcom,sc7180-pinctrl";
 			reg = <0 0x03500000 0 0x300000>,
@@ -1325,7 +1330,8 @@ pinconf-sd-cd {
 
 		remoteproc_mpss: remoteproc@4080000 {
 			compatible = "qcom,sc7180-mpss-pas";
-			reg = <0 0x04080000 0 0x4040>;
+			reg = <0 0x04080000 0 0x4040>, <0 0x04180000 0 0x48>;
+			reg-names = "qdsp6", "rmb";
 
 			interrupts-extended = <&intc GIC_SPI 266 IRQ_TYPE_EDGE_RISING>,
 					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
@@ -1336,19 +1342,33 @@ remoteproc_mpss: remoteproc@4080000 {
 			interrupt-names = "wdog", "fatal", "ready", "handover",
 					  "stop-ack", "shutdown-ack";
 
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
+			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
+				 <&gcc GCC_MSS_Q6_MEMNOC_AXI_CLK>,
+				 <&gcc GCC_MSS_NAV_AXI_CLK>,
+				 <&gcc GCC_MSS_SNOC_AXI_CLK>,
+				 <&gcc GCC_MSS_MFAB_AXIS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface", "bus", "nav", "snoc_axi",
+				      "mnoc_axi", "xo";
 
 			power-domains = <&aoss_qmp AOSS_QMP_LS_MODEM>,
 					<&rpmhpd SC7180_CX>,
+					<&rpmhpd SC7180_MX>,
 					<&rpmhpd SC7180_MSS>;
-			power-domain-names = "load_state", "cx", "mss";
+			power-domain-names = "load_state", "cx", "mx", "mss";
 
 			memory-region = <&mpss_mem>;
 
 			qcom,smem-states = <&modem_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			resets = <&aoss_reset AOSS_CC_MSS_RESTART>,
+				 <&pdc_reset PDC_MODEM_SYNC_RESET>;
+			reset-names = "mss_restart", "pdc_reset";
+
+			qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
+			qcom,spare-regs = <&tcsr_regs 0xb3e4>;
+
 			status = "disabled";
 
 			glink-edge {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
