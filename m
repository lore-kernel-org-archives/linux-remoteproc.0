Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [RFC 2/3] dt-binding: remoteproc: Introduce DT binding for Qualcomm slpi subsystem.
Date: Thu, 12 Jan 2017 19:23:36 +0530
Message-Id: <1484229217-23364-3-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1484229217-23364-1-git-send-email-akdwived@codeaurora.org>
References: <1484229217-23364-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, spjoshi@codeaurora.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This document defines the binding for a component that loads firmware
and control the life cycle of the Qualcomm slpi core.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 .../devicetree/bindings/remoteproc/qcom,slpi.txt   | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,slpi.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,slpi.txt b/Documentation/devicetree/bindings/remoteproc/qcom,slpi.txt
new file mode 100644
index 0000000..51dc64f
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,slpi.txt
@@ -0,0 +1,88 @@
+Qualcomm SLPI Peripheral Image Loader
+
+This document defines the binding for a component that loads and boots firmware
+on the Qualcomm ADSP Hexagon core.
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be:
+		    "qcom,msm8996-adsp-pil"
+
+- interrupts-extended:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: must list the watchdog, fatal IRQs ready, handover and
+		    stop-ack IRQs
+
+- interrupt-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "wdog", "fatal", "ready", "handover", "stop-ack"
+
+- clocks:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: reference to the xo and aggre2_noc clock to be held on behalf of the
+		    booting slpi core
+
+- clock-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "xo" and "aggre2_noc"
+
+- cx-supply:
+- px-supply:
+	Usage: required
+	Value type: <phandle>
+	Definition: reference to the regulators to be held on behalf of the
+		    booting slpi core
+
+- memory-region:
+	Usage: required
+	Value type: <phandle>
+	Definition: reference to the reserved-memory for the SLPI
+
+- qcom,smem-states:
+	Usage: required
+	Value type: <phandle>
+	Definition: reference to the smem state for requesting the SLPI to
+		    shut down
+
+- qcom,smem-state-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "stop"
+
+
+= EXAMPLE
+The following example describes the resources needed to boot control the
+SLPI, as it is found on MSM8996 boards.
+
+	adsp {
+		compatible = "qcom,msm8996-slpi-pil";
+
+		interrupts-extended = <&intc 0 390 IRQ_TYPE_EDGE_RISING>,
+				      <&slpi_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				      <&slpi_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				      <&slpi_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				      <&slpi_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "wdog",
+				  "fatal",
+				  "ready",
+				  "handover",
+				  "stop-ack";
+
+		clocks = <&rpmcc MSM8996_RPM_SMD_XO_CLK_SRC>,
+				<&rpmcc MSM8996_RPM_SMD_AGGR2_NOC_CLK>;
+		clock-names = "xo",
+					"aggre2";
+
+		vdd_cx-supply = <&pm8994_l26_corner>;
+		vdd_px-supply = <&pm8994_lvs2>;
+
+		memory-region = <&slpi_region>;
+
+		qcom,smem-states = <&slpi_smp2p_out 0>;
+		qcom,smem-state-names = "stop";
+	};
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
