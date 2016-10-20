Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 04/11] dt-binding: remoteproc: wcnss: Allow describing smd edge
Date: Wed, 19 Oct 2016 19:40:05 -0700
Message-Id: <1476931212-1806-5-git-send-email-bjorn.andersson@linaro.org>
In-Reply-To: <1476931212-1806-1-git-send-email-bjorn.andersson@linaro.org>
References: <1476931212-1806-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Sarangdhar Joshi <spjoshi@codeaurora.org>, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Allow the associated smd edge to be described within the wcnss
remoteproc node. This creates a bond between the remoteproc and the
associated smd channels and devices, showing the interaction between the
two parts and provides both a natural reference to the other.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../bindings/remoteproc/qcom,wcnss-pil.txt         | 30 ++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
index 0d2361ebe3d7..d420f84ddfb0 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
@@ -60,8 +60,8 @@ on the Qualcomm WCNSS core.
 		    see ../reserved-memory/reserved-memory.txt
 
 = SUBNODES
-A single subnode of the WCNSS PIL describes the attached rf module and its
-resource dependencies.
+A required subnode of the WCNSS PIL is used to describe the attached rf module
+and its resource dependencies. It is described by the following properties:
 
 - compatible:
 	Usage: required
@@ -90,6 +90,11 @@ resource dependencies.
 	Definition: reference to the regulators to be held on behalf of the
 		    booting of the WCNSS core
 
+
+The wcnss node can also have an subnode named "smd-edge" that describes the SMD
+edge, channels and devices related to the WCNSS.
+See ../soc/qcom/qcom,smd.txt for details on how to describe the SMD edge.
+
 = EXAMPLE
 The following example describes the resources needed to boot control the WCNSS,
 with attached WCN3680, as it is commonly found on MSM8974 boards.
@@ -129,4 +134,25 @@ pronto@fb204000 {
 		vddpa-supply = <&pm8941_l19>;
 		vdddig-supply = <&pm8941_s3>;
 	};
+
+	smd-edge {
+		interrupts = <0 142 1>;
+
+		qcom,ipc = <&apcs 8 17>;
+		qcom,smd-edge = <6>;
+		qcom,remote-pid = <4>;
+
+		label = "pronto";
+
+		wcnss {
+			compatible = "qcom,wcnss";
+			qcom,smd-channels = "WCNSS_CTRL";
+
+			qcom,mmio = <&pronto>;
+
+			bt {
+				compatible = "qcom,wcnss-bt";
+			};
+		};
+	};
 };
-- 
2.5.0
