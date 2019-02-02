Return-Path: <govinds@codeaurora.org>
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v4 3/8] dt-bindings: clock: qcom: Introduce QCOM WCSS Q6DSP clock bindings
Date: Sat,  2 Feb 2019 20:56:21 +0530
Message-Id: <20190202152626.1006-4-govinds@codeaurora.org>
In-Reply-To: <20190202152626.1006-1-govinds@codeaurora.org>
References: <20190202152626.1006-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add device tree bindings for WiFi QDSP subsystem clock controls
found in OCS404 soc.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/clock/qcom,wcsscc.txt | 26 +++++++++++++++++++
 include/dt-bindings/clock/qcom,wcss-qcs404.h  | 25 ++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,wcsscc.txt
 create mode 100644 include/dt-bindings/clock/qcom,wcss-qcs404.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,wcsscc.txt b/Documentation/devicetree/bindings/clock/qcom,wcsscc.txt
new file mode 100644
index 000000000000..e9e222e1022f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,wcsscc.txt
@@ -0,0 +1,26 @@
+Qualcomm WCSS Clock Controller Binding
+-----------------------------------------------
+
+Required properties :
+- compatible		: shall contain "qcom,qcs404-wcsscc"
+- #clock-cells		: from common clock binding, shall contain 1
+- reg			: shall contain base register address and size,
+			  in the order
+			Index 0 maps to WCSS_Q6SSTOP clocks register region
+			Index 1 maps to WCSS_TCSR register region
+			Index 2 maps to WCSS_QDSP6SS register region
+
+Optional properties :
+- reg-names	: register names of WCSS domain
+		 "wcss_q6sstop", "wcnss_tcsr", "wcss_qdsp6ss".
+
+Example:
+The below node has to be defined in the cases where the WCSS peripheral loader
+would bring the subsystem out of reset.
+
+	clock_wcsscc: clock-controller@7500000 {
+		compatible = "qcom,qcs404-wcsscc";
+		reg = <0x7500000 0x4e000>, <0x7550000 0x8012>, <0x7400000 0x104>;
+		reg-names = "wcss_q6sstop", "wcnss_tcsr", "wcss_qdsp6ss";
+		#clock-cells = <1>;
+	};
diff --git a/include/dt-bindings/clock/qcom,wcss-qcs404.h b/include/dt-bindings/clock/qcom,wcss-qcs404.h
new file mode 100644
index 000000000000..df2d6b696136
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,wcss-qcs404.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_WCSS_QCS404_H
+#define _DT_BINDINGS_CLK_WCSS_QCS404_H
+
+#define WCSS_AHBFABRIC_CBCR_CLK			0
+#define WCSS_AHBS_CBCR_CLK			1
+#define WCSS_TCM_CBCR_CLK			2
+#define WCSS_AHBM_CBCR_CLK			3
+#define WCSS_AXIM_CBCR_CLK			4
+#define WCSS_BCR_CBCR_CLK			5
+#define WCSS_LCC_CBCR_CLK			6
+#define WCSS_QDSP6SS_XO_CBCR_CLK		7
+#define WCSS_QDSP6SS_SLEEP_CBCR_CLK		8
+#define WCSS_QDSP6SS_GFMMUX_CLK			9
+
+#define Q6SSTOP_QDSP6SS_RESET			0
+#define Q6SSTOP_QDSP6SS_CORE_RESET		1
+#define Q6SSTOP_QDSP6SS_BUS_RESET		2
+#define Q6SSTOP_BCR_RESET			3
+#define Q6SSTOP_CORE_ARCH_RESET			4
+#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
