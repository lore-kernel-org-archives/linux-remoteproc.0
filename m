Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 1/4] dt-bindings: Introduce doorbell binding
Date: Tue,  2 May 2017 22:29:26 -0700
Message-Id: <20170503052929.17422-1-bjorn.andersson@linaro.org>
To: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Introduce the generic doorbell binding as well as a binding for the
Qualcomm APCS Global block. This is used to expose doorbell-like devices
in the system.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- New binding

 .../devicetree/bindings/doorbell/doorbell.txt      | 31 +++++++++++++++
 .../bindings/doorbell/qcom,apcs-kpss-global.txt    | 45 ++++++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/doorbell/doorbell.txt
 create mode 100644 Documentation/devicetree/bindings/doorbell/qcom,apcs-kpss-global.txt

diff --git a/Documentation/devicetree/bindings/doorbell/doorbell.txt b/Documentation/devicetree/bindings/doorbell/doorbell.txt
new file mode 100644
index 000000000000..8fd814898c3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/doorbell/doorbell.txt
@@ -0,0 +1,31 @@
+Doorbell binding
+============================================
+
+The doorbell binding is used to describe a set of doorbells for client blocks
+to ring.
+
+1) Doorbell controller
+----------------------
+
+A doorbell controller is a device that exposes a number of doorbells, that can
+client devices can ring to signal some event to some piece of hardware.
+
+- #doorbell-cells:
+	Usage: required
+	Value type: <u32>
+	Definition: should be 0 for single-doorbell controllers and 1 for
+		    multi-doorbell controllers
+
+2) Doorbell user
+----------------
+
+- doorbells:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: list of doorbell references
+
+- doorbell-names:
+	Usage: optional
+	Value type: <stringlist>
+	Definition: list of strings identifying each entry in the doorbells
+		    property
diff --git a/Documentation/devicetree/bindings/doorbell/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/doorbell/qcom,apcs-kpss-global.txt
new file mode 100644
index 000000000000..6320e1a355cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/doorbell/qcom,apcs-kpss-global.txt
@@ -0,0 +1,45 @@
+Binding for the Qualcomm APCS global block
+==========================================
+
+This binding describes the APCS "global" block found in various Qualcomm
+platforms.
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be one of:
+		    "qcom,msm8916-apcs-kpss-global",
+		    "qcom,msm8996-apcs-hmss-global"
+
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: must specify the base address and size of the global block
+
+- #doorbell-cells:
+	Usage: required
+	Value type: <u32>
+	Definition: as described in doorbell.txt, must be 1
+
+
+= EXAMPLE
+The following example describes the APCS HMSS found in MSM8996 and part of the
+GLINK RPM referencing the "rpm_hlos" doorbell therein.
+
+	apcs_glb: apcs-glb@9820000 {
+		compatible = "qcom,msm8996-apcs-hmss-global";
+		reg = <0x9820000 0x1000>;
+
+		#doorbell-cells = <1>;
+	};
+
+        rpm-glink {
+                compatible = "qcom,glink-rpm";
+
+                interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+
+                qcom,rpm-msg-ram = <&rpm_msg_ram>;
+
+		doorbells = <&apcs_glb 0>;
+	};
+
-- 
2.12.0
