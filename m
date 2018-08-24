Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 1/6] dt-bindings: reset: Add PDC Global binding for SDM845 SoCs
Date: Fri, 24 Aug 2018 18:48:55 +0530
Message-Id: <20180824131900.5353-2-sibis@codeaurora.org>
In-Reply-To: <20180824131900.5353-1-sibis@codeaurora.org>
References: <20180824131900.5353-1-sibis@codeaurora.org>
To: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ohad@wizery.com, mark.rutland@arm.com, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add PDC Global(Power Domain Controller) binding for SDM845 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 .../bindings/reset/qcom,pdc-global.txt        | 52 +++++++++++++++++++
 include/dt-bindings/reset/qcom,sdm845-pdc.h   | 20 +++++++
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
 create mode 100644 include/dt-bindings/reset/qcom,sdm845-pdc.h

diff --git a/Documentation/devicetree/bindings/reset/qcom,pdc-global.txt b/Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
new file mode 100644
index 000000000000..69f9edca9503
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
@@ -0,0 +1,52 @@
+PDC Global
+======================================
+
+This binding describes a reset-controller found on PDC-Global(Power Domain
+Controller) block for Qualcomm Technologies Inc SDM845 SoCs.
+
+Required properties:
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be:
+		    "qcom,sdm845-pdc-global"
+
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: must specify the base address and size of the register
+	            space.
+
+- #reset-cells:
+	Usage: required
+	Value type: <uint>
+	Definition: must be 1; cell entry represents the reset index.
+
+Example:
+
+pdc_reset: reset-controller@b2e0000 {
+	compatible = "qcom,sdm845-pdc-global";
+	reg = <0xb2e0000 0x20000>;
+	#reset-cells = <1>;
+};
+
+PDC reset clients
+======================================
+
+Device nodes that need access to reset lines should
+specify them as a reset phandle in their corresponding node as
+specified in reset.txt.
+
+For list of all valid reset indicies see
+<dt-bindings/reset/qcom,sdm845-pdc.h>
+
+Example:
+
+modem-pil@4080000 {
+	...
+
+	resets = <&pdc_reset PDC_MODEM_SYNC_RESET>;
+	reset-names = "pdc_reset";
+
+	...
+};
diff --git a/include/dt-bindings/reset/qcom,sdm845-pdc.h b/include/dt-bindings/reset/qcom,sdm845-pdc.h
new file mode 100644
index 000000000000..53c37f9c319a
--- /dev/null
+++ b/include/dt-bindings/reset/qcom,sdm845-pdc.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2018 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_RESET_PDC_SDM_845_H
+#define _DT_BINDINGS_RESET_PDC_SDM_845_H
+
+#define PDC_APPS_SYNC_RESET	0
+#define PDC_SP_SYNC_RESET	1
+#define PDC_AUDIO_SYNC_RESET	2
+#define PDC_SENSORS_SYNC_RESET	3
+#define PDC_AOP_SYNC_RESET	4
+#define PDC_DEBUG_SYNC_RESET	5
+#define PDC_GPU_SYNC_RESET	6
+#define PDC_DISPLAY_SYNC_RESET	7
+#define PDC_COMPUTE_SYNC_RESET	8
+#define PDC_MODEM_SYNC_RESET	9
+
+#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
