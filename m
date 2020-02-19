Return-Path: <peng.fan@nxp.com>
From: peng.fan@nxp.com
Subject: [PATCH 1/9] dt-bindings: remoteproc: Convert imx-rproc to json-schema
Date: Wed, 19 Feb 2020 15:27:37 +0800
Message-Id: <1582097265-20170-2-git-send-email-peng.fan@nxp.com>
In-Reply-To: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
Return-Path: peng.fan@nxp.com
MIME-Version: 1.0
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-imx@nxp.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Peng Fan <peng.fan@nxp.com>

Convert the i.MX remoteproc binding to DT schema format
using json-schema

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/remoteproc/imx-rproc.txt   | 33 ------------
 .../devicetree/bindings/remoteproc/imx-rproc.yaml  | 61 ++++++++++++++++++++++
 2 files changed, 61 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
 create mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt b/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
deleted file mode 100644
index fbcefd965dc4..000000000000
--- a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-NXP iMX6SX/iMX7D Co-Processor Bindings
-----------------------------------------
-
-This binding provides support for ARM Cortex M4 Co-processor found on some
-NXP iMX SoCs.
-
-Required properties:
-- compatible		Should be one of:
-				"fsl,imx7d-cm4"
-				"fsl,imx6sx-cm4"
-- clocks		Clock for co-processor (See: ../clock/clock-bindings.txt)
-- syscon		Phandle to syscon block which provide access to
-			System Reset Controller
-
-Optional properties:
-- memory-region		list of phandels to the reserved memory regions.
-			(See: ../reserved-memory/reserved-memory.txt)
-
-Example:
-	m4_reserved_sysmem1: cm4@80000000 {
-		reg = <0x80000000 0x80000>;
-	};
-
-	m4_reserved_sysmem2: cm4@81000000 {
-		reg = <0x81000000 0x80000>;
-	};
-
-	imx7d-cm4 {
-		compatible	= "fsl,imx7d-cm4";
-		memory-region	= <&m4_reserved_sysmem1>, <&m4_reserved_sysmem2>;
-		syscon		= <&src>;
-		clocks		= <&clks IMX7D_ARM_M4_ROOT_CLK>;
-	};
diff --git a/Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml
new file mode 100644
index 000000000000..12a5f3de38fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/remoteproc/imx-rproc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: NXP iMX6SX/iMX7D Co-Processor Bindings
+
+description:
+  This binding provides support for ARM Cortex M4 Co-processor found on
+  some NXP iMX SoCs.
+
+maintainers:
+  - Oleksij Rempel <o.rempel@pengutronix.de>
+  - Peng Fan <peng.fan@nxp.com>
+
+properties:
+  compatible:
+      enum:
+        - "fsl,imx7d-cm4"
+        - "fsl,imx6sx-cm4"
+
+  clocks:
+    items:
+      Clock for co-processor (See: ../clock/clock-bindings.txt)
+
+  syscon:
+     description:
+       Phandle to syscon block which provide access to System Reset Controller
+     allOf:
+       - $ref: "/schemas/types.yaml#/definitions/phandle"
+
+  memory-region:
+    description:
+      List of phandles to the reserved memory regions.
+      (see ../reserved-memory/reserved-memory.txt)
+
+required:
+  - compatible
+  - clocks
+  - syscon
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx7d-clock.h>
+    m4_reserved_sysmem1: cm4@80000000 {
+        reg = <0x80000000 0x80000>;
+    };
+
+    m4_reserved_sysmem2: cm4@81000000 {
+        reg = <0x81000000 0x80000>;
+    };
+
+    imx7d-cm4 {
+        compatible  = "fsl,imx7d-cm4";
+        memory-region = <&m4_reserved_sysmem1>, <&m4_reserved_sysmem2>;
+        syscon = <&src>;
+        clocks = <&clks IMX7D_ARM_M4_ROOT_CLK>;
+    };
+
+...
-- 
2.16.4
