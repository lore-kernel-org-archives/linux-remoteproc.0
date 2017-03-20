Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 1/2] soc: qcom: Add device tree binding for GLINK RPM
Date: Mon, 20 Mar 2017 14:09:55 -0700
Message-Id: <20170320210956.29641-1-bjorn.andersson@linaro.org>
To: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Add device tree binding documentation for the Qualcomm GLINK RPM, used
for communication with the Resource Power Management subsystem in
various Qualcomm SoCs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 .../devicetree/bindings/soc/qcom/qcom,glink.txt    | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
new file mode 100644
index 000000000000..da92c4f787f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
@@ -0,0 +1,73 @@
+Qualcomm RPM GLINK binding
+
+This binding describes the Qualcomm RPM GLINK, a fifo based mechanism for
+communication with the Resource Power Management system on various Qualcomm
+platforms.
+
+- compatible:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "qcom,glink-rpm"
+
+- interrupts:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: should specify the IRQ used by the remote processor to
+		    signal this processor about communication related events
+
+- qcom,rpm-msg-ram:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: handle to RPM message memory resource
+
+- qcom,ipc:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: three entries specifying the outgoing ipc bit used for
+		    signaling the remote processor:
+		    - phandle to a syscon node representing the apcs registers
+		    - u32 representing offset to the register within the syscon
+		    - u32 representing the ipc bit within the register
+
+= GLINK DEVICES
+Each subnode of the GLINK node represent function tied to a virtual
+communication channel. The name of the nodes are not important. The properties
+of these nodes are defined by the individual bindings for the specific function
+- but must contain the following property:
+
+- qcom,glink-channels:
+	Usage: required
+	Value type: <stringlist>
+	Definition: a list of channels tied to this function, used for matching
+		    the function to a set of virtual channels
+
+= EXAMPLE
+The following example represents the GLINK RPM node on a MSM8996 device, with
+the function for the "rpm_request" channel defined, which is used for
+regualtors and root clocks.
+
+	apcs: syscon@f9011000 {
+		compatible = "syscon";
+		reg = <0xf9011000 0x1000>;
+	};
+
+	rpm_msg_ram: memory@68000 {
+		compatible = "qcom,rpm-msg-ram";
+		reg = <0x68000 0x6000>;
+	};
+
+        rpm-glink {
+		compatible = "qcom,glink-rpm";
+
+		interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+
+		qcom,rpm-msg-ram = <&rpm_msg_ram>;
+		qcom,ipc = <&apcs 0x10 0>;
+
+		rpm-requests {
+			compatible = "qcom,rpm-msm8996";
+			qcom,glink-channels = "rpm_requests";
+
+			...
+		};
+	};
-- 
2.12.0
