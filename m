Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 5/5] arm64: dts: qcom: sc7180: Update Q6V5 MSS node
Date: Fri, 17 Apr 2020 19:56:05 +0530
Message-Id: <20200417142605.28885-6-sibis@codeaurora.org>
In-Reply-To: <20200417142605.28885-1-sibis@codeaurora.org>
References: <20200417142605.28885-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org
Cc: agross@kernel.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, ohad@wizery.com, mka@chromium.org, dianders@chromium.org, devicetree@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add TCSR node and update MSS node to support MSA based Modem boot on
SC7180 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

Depends on the following bindings:
iommus: https://patchwork.kernel.org/patch/11443101/
spare-regs: https://patchwork.kernel.org/patch/11491425/

 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 42 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi    |  5 +++
 2 files changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index e613d70cc0198..6f472872be1a3 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -319,6 +319,48 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&remoteproc_mpss {
+	compatible = "qcom,sc7180-mss-pil";
+	reg = <0 0x04080000 0 0x410>, <0 0x04180000 0 0x48>;
+	reg-names = "qdsp6", "rmb";
+
+	clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
+		 <&gcc GCC_MSS_Q6_MEMNOC_AXI_CLK>,
+		 <&gcc GCC_MSS_NAV_AXI_CLK>,
+		 <&gcc GCC_MSS_SNOC_AXI_CLK>,
+		 <&gcc GCC_MSS_MFAB_AXIS_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "iface", "bus", "nav", "snoc_axi",
+		      "mnoc_axi", "xo";
+
+	iommus = <&apps_smmu 0x460 0x1>, <&apps_smmu 0x444 0x2>;
+
+	resets = <&aoss_reset AOSS_CC_MSS_RESTART>,
+		 <&pdc_reset PDC_MODEM_SYNC_RESET>;
+	reset-names = "mss_restart", "pdc_reset";
+
+	qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
+	qcom,spare-regs = <&tcsr_regs 0xb3e4>;
+
+	power-domains = <&aoss_qmp AOSS_QMP_LS_MODEM>,
+			<&rpmhpd SC7180_CX>,
+			<&rpmhpd SC7180_MX>,
+			<&rpmhpd SC7180_MSS>;
+	power-domain-names = "load_state", "cx", "mx", "mss";
+
+	/delete-property/memory-region;
+
+	status = "okay";
+
+	mba {
+		memory-region = <&mba_mem>;
+	};
+
+	mpss {
+		memory-region = <&mpss_mem>;
+	};
+};
+
 &uart3 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index e319762a0bffc..c49801ddb9d70 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -981,6 +981,11 @@ tcsr_mutex_regs: syscon@1f40000 {
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
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
