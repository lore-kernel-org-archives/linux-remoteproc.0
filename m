Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v3 4/4] arm64: dts: msm8996: Add SLPI SMP2P dt node.
Date: Mon, 30 Jan 2017 20:33:09 +0530
Message-Id: <1485788589-21968-5-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1485788589-21968-1-git-send-email-akdwived@codeaurora.org>
References: <1485788589-21968-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add smp2p support to communicate with slpi processor.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 29ed6b6..5bec315 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -551,5 +551,29 @@
 			#interrupt-cells = <2>;
 		};
 	};
+
+	smp2p-slpi {
+		compatible = "qcom,smp2p";
+		qcom,smem = <481>, <430>;
+
+		interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
+
+		qcom,ipc = <&apcs 16 26>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <3>;
+
+		slpi_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		slpi_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+	};
+
 };
 #include "msm8996-pins.dtsi"
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
