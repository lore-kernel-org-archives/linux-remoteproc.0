Return-Path: <stanimir.varbanov@linaro.org>
Return-Path: <stanimir.varbanov@linaro.org>
From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 1/2] dt-binding: remoteproc: venus rproc dt binding document
Date: Fri, 27 Jan 2017 17:32:56 +0200
Message-Id: <1485531177-3543-2-git-send-email-stanimir.varbanov@linaro.org>
In-Reply-To: <1485531177-3543-1-git-send-email-stanimir.varbanov@linaro.org>
References: <1485531177-3543-1-git-send-email-stanimir.varbanov@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Stanimir Varbanov <stanimir.varbanov@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add devicetree binding document for Venus remote processor.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,venus.txt  | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,venus.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,venus.txt b/Documentation/devicetree/bindings/remoteproc/qcom,venus.txt
new file mode 100644
index 000000000000..38ac585dbd7b
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,venus.txt
@@ -0,0 +1,33 @@
+Qualcomm Venus Peripheral Image Loader
+
+This document defines the binding for a component that loads and boots firmware
+on the Qualcomm Venus remote processor core.
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must contain "qcom,venus-pil"
+
+- memory-region:
+	Usage: required
+	Value type: <phandle>
+	Definition: a phandle to a node describing reserved memory
+
+* An example
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		venus_mem: venus@89900000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x89900000 0x0 0x800000>;
+			alignment = <0x1000>;
+			no-map;
+		};
+	};
+
+	rproc-venus {
+		compatible = "qcom,venus-pil";
+		memory-region = <&venus_mem>;
+	};
-- 
2.7.4
