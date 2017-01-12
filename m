Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [RFC 3/3] arm64: dts: msm8996: Add SMP2P node for Qualcomm SLPI rproc driver.
Date: Thu, 12 Jan 2017 19:23:37 +0530
Message-Id: <1484229217-23364-4-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1484229217-23364-1-git-send-email-akdwived@codeaurora.org>
References: <1484229217-23364-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, spjoshi@codeaurora.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add SMP2P DT nodes required for Qualcomm SLPI Peripheral Image Loader.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 9d1d7ad..2457b20 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -541,5 +541,29 @@
 			#interrupt-cells = <2>;
 		};
 	};
+
+	smp2p-slpi {
+		compatible = "qcom,smp2p";
+		qcom,smem = <481>, <430>;
+
+		interrupts = <0 178 1>;
+
+		qcom,ipc = <&apcs 4 8>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <3>;
+
+		slpi_smp2p_in: slave-kernel {
+				qcom,entry-name = "slave-kernel";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+		slpi_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,state-cells = <1>;
+		};
+	};
+
 };
 #include "msm8996-pins.dtsi"
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
