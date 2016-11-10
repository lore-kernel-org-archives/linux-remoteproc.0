Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] dt-binding: remoteproc: Introduce ADSP loader binding
Date: Wed,  9 Nov 2016 21:50:09 -0800
Message-Id: <1478757009-11522-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Sarangdhar Joshi <spjoshi@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This document defines the binding for a component that loads firmware
and control the life cycle of the Qualcomm ADSP Hexagon core.

Cc: Sarangdhar Joshi <spjoshi@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Added the required "xo" clock, from Sarangdhar
- Added smd-edge node
- Corrected example

Changes since v1:
- Added platform names to compatible

 .../devicetree/bindings/remoteproc/qcom,adsp.txt   | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
new file mode 100644
index 000000000000..471946f2f080
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
@@ -0,0 +1,98 @@
+Qualcomm ADSP Peripheral Image Loader
+
+This document defines the binding for a component that loads and boots firmware
+on the Qualcomm ADSP Hexagon core.
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be one of:
+		    "qcom,msm8974-adsp-pil"
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
+	Definition: reference to the xo clock to be held on behalf of the
+		    booting Hexagon core
+
+- clock-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "xo"
+
+- cx-supply:
+	Usage: required
+	Value type: <phandle>
+	Definition: reference to the regulator to be held on behalf of the
+		    booting Hexagon core
+
+- memory-region:
+	Usage: required
+	Value type: <phandle>
+	Definition: reference to the reserved-memory for the ADSP
+
+- qcom,smem-states:
+	Usage: required
+	Value type: <phandle>
+	Definition: reference to the smem state for requesting the ADSP to
+		    shut down
+
+- qcom,smem-state-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "stop"
+
+
+= SUBNODES
+The adsp node may have an subnode named "smd-edge" that describes the SMD edge,
+channels and devices related to the ADSP.  See ../soc/qcom/qcom,smd.txt for
+details on how to describe the SMD edge.
+
+
+= EXAMPLE
+The following example describes the resources needed to boot control the
+ADSP, as it is found on MSM8974 boards.
+
+	adsp {
+		compatible = "qcom,msm8974-adsp-pil";
+
+		interrupts-extended = <&intc 0 162 IRQ_TYPE_EDGE_RISING>,
+				      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "wdog",
+				  "fatal",
+				  "ready",
+				  "handover",
+				  "stop-ack";
+
+		clocks = <&rpmcc RPM_CXO_CLK>;
+		clock-names = "xo";
+
+		cx-supply = <&pm8841_s2>;
+
+		memory-region = <&adsp_region>;
+
+		qcom,smem-states = <&adsp_smp2p_out 0>;
+		qcom,smem-state-names = "stop";
+
+		smd-edge {
+			interrupts = <0 156 IRQ_TYPE_EDGE_RISING>;
+
+			qcom,ipc = <&apcs 8 8>;
+			qcom,smd-edge = <1>;
+		};
+	};
-- 
2.5.0
