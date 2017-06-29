Return-Path: <sricharan@codeaurora.org>
From: Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH 3/3] dt-binding: remoteproc: Add the bindings required for Q6 - WCSS core
Date: Thu, 29 Jun 2017 19:47:41 +0530
Message-Id: <1498745861-20531-4-git-send-email-sricharan@codeaurora.org>
In-Reply-To: <1498745861-20531-1-git-send-email-sricharan@codeaurora.org>
References: <1498745861-20531-1-git-send-email-sricharan@codeaurora.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
Cc: sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

IPQ8074 has an integrated Q6V5 Hexagon dsp - Lithium Wlan (WCSS) core.
This patch adds the required bindings to load, boot, shutdown that
remoteproc subsystem.

Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 .../bindings/remoteproc/qcom,q6v5-wcss.txt         | 139 +++++++++++++++++++++
 1 file changed, 139 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,q6v5-wcss.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5-wcss.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5-wcss.txt
new file mode 100644
index 0000000..f664c26
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5-wcss.txt
@@ -0,0 +1,139 @@
+Qualcomm Hexagon (Q6) - WCSS Peripheral Image Loader
+
+This document defines the binding for a component that loads and boots firmware
+on the integrated Qualcomm Hexagon - WCSS core.
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be one of:
+		    "qcom,q6v5-wcss-pil",
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: must specify the base address and size of the qdsp6 and
+		    mpm (msm power manager) register blocks.
+
+- reg-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "q6" and "mpm"
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
+	Value type: <phandle>
+	Definition: references to the axim-q6, axim2-q6, axi-wcss,
+		    ahb-q6, ahbs-q6, ahb-wcss, ahbs-wcss, sysnoc and mem.
+		    to be held on behalf of the booting of the Hexagon and WCSS
+		    core. These are the interface, bus, mem clocks required for
+		    the Q6 and WCSS cores.
+
+- clock-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "axim-q6", "axim2-q6", "axi-wcss", "ahb-q6",
+			    "ahbs-q6", "ahb-wcss", "ahbs-wcss", "sysnoc", "mem"
+
+- resets:
+	Usage: required
+	Value type: <phandle>
+	Definition: reference to the reset-controller for the Q6-WCSS sub-system
+
+- reset-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "wcss_aon_reset", "wcss_reset", "wcss_q6_reset"
+
+- qcom,smem-states:
+	Usage: required
+	Value type: <phandle>
+	Definition: reference to the smem state for requesting the Hexagon to
+		    shut down
+
+- qcom,smem-state-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "stop"
+
+- qcom,halt-regs:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: a phandle reference to a syscon representing TCSR followed
+		    by the three offsets within syscon for q6, wcss and tcsr global
+		    halt registers.
+
+= SUBNODES:
+The Hexagon node must contain a subnode, named "q6" representing
+the memory region used by the Hexagon firmware. The sub-node must contain:
+
+- memory-region:
+	Usage: required
+	Value type: <phandle>
+	Definition: reference to the reserved-memory for the Q6 firmware region
+
+= EXAMPLE
+The following example describes the resources needed to boot control the
+Hexagon, as it is found on IPQ8074 boards.
+
+	q6v5_wcss: q6v5_wcss@CD00000 {
+		compatible = "q6v5-wcss-pil";
+		reg = <0xCD00000 0x4040>,
+		      <0x4ab000 0x20>;
+		reg-names = "q6",
+			    "mpm";
+		interrupts-extended = <&intc 0 325 1>,
+				      <&wcss_smp2p_in 0 0>,
+				      <&wcss_smp2p_in 1 0>,
+				      <&wcss_smp2p_in 3 0>;
+		interrupt-names = "wdog",
+				  "fatal",
+				  "handover",
+				  "stop-ack";
+		clocks = <&gcc GCC_SYS_NOC_WCSS_AHB_CLK>,
+			 <&gcc GCC_WCSS_AHB_S_CLK>,
+			 <&gcc GCC_WCSS_ECAHB_CLK>,
+			 <&gcc GCC_Q6_AHB_CLK>,
+			 <&gcc GCC_Q6_AHB_S_CLK>,
+			 <&gcc GCC_WCSS_AXI_M_CLK>,
+			 <&gcc GCC_MEM_NOC_Q6_AXI_CLK>,
+			 <&gcc GCC_Q6_AXIM_CLK>,
+			 <&gcc GCC_Q6_AXIM2_CLK>;
+		clock-names = "sysnoc",
+			      "ahb-wcss",
+			      "ahbs-wcss",
+			      "ahb-q6",
+			      "ahbs-q6",
+			      "axi-wcss",
+			      "memnoc",
+			      "axim-q6",
+			      "axim2-q6";
+
+		resets = <&gcc GCC_WCSSAON_RESET>,
+			 <&gcc GCC_WCSS_BCR>,
+			 <&gcc GCC_WCSS_Q6_BCR>;
+
+		reset-names = "wcss_aon_reset",
+			      "wcss_reset",
+			      "wcss_q6_reset";
+
+		qcom,halt-regs = <&tcsr_mutex_block 0x0 0xA000 0xD000>;
+
+		qcom,smem-states = <&wcss_smp2p_out 0>,
+				   <&wcss_smp2p_out 1>;
+		qcom,smem-state-names = "shutdown",
+					"stop";
+		q6 {
+			memory-region = <&q6_region>;
+		};
+	};
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
