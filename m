Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 5/8] arm64: dts: qcom: qcs404: Fully describe the CDSP
Date: Thu,  9 May 2019 21:34:18 -0700
Message-Id: <20190510043421.31393-6-bjorn.andersson@linaro.org>
In-Reply-To: <20190510043421.31393-1-bjorn.andersson@linaro.org>
References: <20190510043421.31393-1-bjorn.andersson@linaro.org>
To: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Add all the properties needed to describe the CDSP for both the
Trustzone and non-Trustzone based remoteproc case, allowing any child
devices to be described once by just overriding the compatible to match
the firmware available on the board.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 82 +++++++++++++++++-----------
 1 file changed, 51 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 3eb6089c8024..896f95817f23 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -113,37 +113,6 @@
 		};
 	};
 
-	remoteproc_cdsp: remoteproc-cdsp {
-		compatible = "qcom,qcs404-cdsp-pas";
-
-		interrupts-extended = <&intc GIC_SPI 229 IRQ_TYPE_EDGE_RISING>,
-				      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
-				      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
-				      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
-				      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
-		interrupt-names = "wdog", "fatal", "ready",
-				  "handover", "stop-ack";
-
-		clocks = <&xo_board>;
-		clock-names = "xo";
-
-		memory-region = <&cdsp_fw_mem>;
-
-		qcom,smem-states = <&cdsp_smp2p_out 0>;
-		qcom,smem-state-names = "stop";
-
-		status = "disabled";
-
-		glink-edge {
-			interrupts = <GIC_SPI 141 IRQ_TYPE_EDGE_RISING>;
-
-			qcom,remote-pid = <5>;
-			mboxes = <&apcs_glb 12>;
-
-			label = "cdsp";
-		};
-	};
-
 	remoteproc_wcss: remoteproc-wcss {
 		compatible = "qcom,qcs404-wcss-pas";
 
@@ -288,6 +257,57 @@
 			clock-names = "core";
 		};
 
+		remoteproc_cdsp: remoteproc@b00000 {
+			compatible = "qcom,qcs404-cdsp-pas";
+			reg = <0x00b00000 0x4040>;
+
+			interrupts-extended = <&intc GIC_SPI 229 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&xo_board>,
+				 <&gcc GCC_CDSP_CFG_AHB_CLK>,
+				 <&gcc GCC_CDSP_TBU_CLK>,
+				 <&gcc GCC_BIMC_CDSP_CLK>,
+				 <&turingcc TURING_WRAPPER_AON_CLK>,
+				 <&turingcc TURING_Q6SS_AHBS_AON_CLK>,
+				 <&turingcc TURING_Q6SS_AHBM_AON_CLK>,
+				 <&turingcc TURING_Q6SS_Q6_AXIM_CLK>;
+			clock-names = "xo",
+				      "sway",
+				      "tbu",
+				      "bimc",
+				      "ahb_aon",
+				      "q6ss_slave",
+				      "q6ss_master",
+				      "q6_axim";
+
+			resets = <&gcc GCC_CDSP_RESTART>;
+			reset-names = "restart";
+
+			qcom,halt-regs = <&tcsr 0x19004>;
+
+			memory-region = <&cdsp_fw_mem>;
+
+			qcom,smem-states = <&cdsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 141 IRQ_TYPE_EDGE_RISING>;
+
+				qcom,remote-pid = <5>;
+				mboxes = <&apcs_glb 12>;
+
+				label = "cdsp";
+			};
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,qcs404-pinctrl";
 			reg = <0x01000000 0x200000>,
-- 
2.18.0
