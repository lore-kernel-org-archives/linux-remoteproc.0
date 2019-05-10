Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 6/8] arm64: dts: qcom: qcs404: Move lpass and q6 into soc
Date: Thu,  9 May 2019 21:34:19 -0700
Message-Id: <20190510043421.31393-7-bjorn.andersson@linaro.org>
In-Reply-To: <20190510043421.31393-1-bjorn.andersson@linaro.org>
References: <20190510043421.31393-1-bjorn.andersson@linaro.org>
To: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Although we don't describe lpass and wcss with all the details needed to
control them in a Trustzone-less environment, move them under soc in
order to tidy up the structure and prepare for describing them fully.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 126 ++++++++++++++-------------
 1 file changed, 64 insertions(+), 62 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 896f95817f23..b213f6acad76 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -82,68 +82,6 @@
 		method = "smc";
 	};
 
-	remoteproc_adsp: remoteproc-adsp {
-		compatible = "qcom,qcs404-adsp-pas";
-
-		interrupts-extended = <&intc GIC_SPI 293 IRQ_TYPE_EDGE_RISING>,
-				      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
-				      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
-				      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
-				      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
-		interrupt-names = "wdog", "fatal", "ready",
-				  "handover", "stop-ack";
-
-		clocks = <&xo_board>;
-		clock-names = "xo";
-
-		memory-region = <&adsp_fw_mem>;
-
-		qcom,smem-states = <&adsp_smp2p_out 0>;
-		qcom,smem-state-names = "stop";
-
-		status = "disabled";
-
-		glink-edge {
-			interrupts = <GIC_SPI 289 IRQ_TYPE_EDGE_RISING>;
-
-			qcom,remote-pid = <2>;
-			mboxes = <&apcs_glb 8>;
-
-			label = "adsp";
-		};
-	};
-
-	remoteproc_wcss: remoteproc-wcss {
-		compatible = "qcom,qcs404-wcss-pas";
-
-		interrupts-extended = <&intc GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
-				      <&wcss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
-				      <&wcss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
-				      <&wcss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
-				      <&wcss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
-		interrupt-names = "wdog", "fatal", "ready",
-				  "handover", "stop-ack";
-
-		clocks = <&xo_board>;
-		clock-names = "xo";
-
-		memory-region = <&wlan_fw_mem>;
-
-		qcom,smem-states = <&wcss_smp2p_out 0>;
-		qcom,smem-state-names = "stop";
-
-		status = "disabled";
-
-		glink-edge {
-			interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
-
-			qcom,remote-pid = <1>;
-			mboxes = <&apcs_glb 16>;
-
-			label = "wcss";
-		};
-	};
-
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -458,6 +396,38 @@
 			#interrupt-cells = <4>;
 		};
 
+		remoteproc_wcss: remoteproc@7400000 {
+			compatible = "qcom,qcs404-wcss-pas";
+			reg = <0x07400000 0x4040>;
+
+			interrupts-extended = <&intc GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&xo_board>;
+			clock-names = "xo";
+
+			memory-region = <&wlan_fw_mem>;
+
+			qcom,smem-states = <&wcss_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
+
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 16>;
+
+				label = "wcss";
+			};
+		};
+
 		sdcc1: sdcc@7804000 {
 			compatible = "qcom,sdhci-msm-v5";
 			reg = <0x07804000 0x1000>, <0x7805000 0x1000>;
@@ -843,6 +813,38 @@
 				status = "disabled";
 			};
 		};
+
+		remoteproc_adsp: remoteproc@c700000 {
+			compatible = "qcom,qcs404-adsp-pas";
+			reg = <0x0c700000 0x4040>;
+
+			interrupts-extended = <&intc GIC_SPI 293 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&xo_board>;
+			clock-names = "xo";
+
+			memory-region = <&adsp_fw_mem>;
+
+			qcom,smem-states = <&adsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 289 IRQ_TYPE_EDGE_RISING>;
+
+				qcom,remote-pid = <2>;
+				mboxes = <&apcs_glb 8>;
+
+				label = "adsp";
+			};
+		};
 	};
 
 	timer {
-- 
2.18.0
