Return-Path: <Orson.Zhai@spreadtrum.com>
From: Baolin Wang <baolin.wang@spreadtrum.com>
Subject: [PATCH] DT: hwspinlock: Add binding documentation for Spreadtrum hwspinlock
Date: Thu, 18 May 2017 10:49:19 +0800
Message-ID: <fe3d04f400460673ee88324c414544ff3e15990e.1495075341.git.baolin.wang@spreadtrum.com>
MIME-Version: 1.0
Content-Type: text/plain
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org, baolin.wang@spreadtrum.com
List-ID: <linux-remoteproc@vger.kernel.org>

This patch adds the binding documentation for Spreadtrum hardware spinlock
device.

Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
---
 .../devicetree/bindings/hwlock/sprd-hwspinlock.txt |   23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/sprd-hwspinlock.txt

diff --git a/Documentation/devicetree/bindings/hwlock/sprd-hwspinlock.txt b/Documentation/devicetree/bindings/hwlock/sprd-hwspinlock.txt
new file mode 100644
index 0000000..581db9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/sprd-hwspinlock.txt
@@ -0,0 +1,23 @@
+SPRD Hardware Spinlock Device Binding
+-------------------------------------
+
+Required properties :
+- compatible : should be "sprd,hwspinlock-r3p0".
+- reg : the register address of hwspinlock.
+- #hwlock-cells : hwlock users only use the hwlock id to represent a specific
+	hwlock, so the number of cells should be <1> here.
+- clock-names : Must contain "enable".
+- clocks : Must contain a phandle entry for the clock in clock-names, see the
+	common clock bindings.
+
+Please look at the generic hwlock binding for usage information for consumers,
+"Documentation/devicetree/bindings/hwlock/hwlock.txt"
+
+Example of hwlock provider:
+	hwspinlock@40500000 {
+		compatible  = "sprd,hwspinlock-r3p0";
+		reg = <0 0x40500000 0 0x1000>;
+		#hwlock-cells = <1>;
+		clock-names = "enable";
+		clocks = <&clk_aon_apb_gates0 22>;
+	};
-- 
1.7.9.5
