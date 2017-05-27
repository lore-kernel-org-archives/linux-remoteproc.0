Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v7 1/2] soc: qcom: Add device tree binding for GLINK RPM
Date: Sat, 27 May 2017 16:23:34 -0700
Message-Id: <20170527232335.7775-1-bjorn.andersson@linaro.org>
To: Andy Gross <andy.gross@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Add device tree binding documentation for the Qualcomm GLINK RPM, used
for communication with the Resource Power Management subsystem in
various Qualcomm SoCs.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v6:
- Change node in example to "mailbox"
- Add Rob's ack.

 .../devicetree/bindings/soc/qcom/qcom,glink.txt    | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
new file mode 100644
index 000000000000..50fc20c6ce91
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
+- mboxes:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: reference to the "rpm_hlos" mailbox in APCS, as described
+		    in mailbox/mailbox.txt
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
+	apcs_glb: mailbox@9820000 {
+		compatible = "qcom,msm8996-apcs-hmss-global";
+		reg = <0x9820000 0x1000>;
+
+		#mbox-cells = <1>;
+	};
+
+	rpm_msg_ram: memory@68000 {
+		compatible = "qcom,rpm-msg-ram";
+		reg = <0x68000 0x6000>;
+	};
+
+	rpm-glink {
+		compatible = "qcom,glink-rpm";
+
+		interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+
+		qcom,rpm-msg-ram = <&rpm_msg_ram>;
+
+		mboxes = <&apcs_glb 0>;
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
