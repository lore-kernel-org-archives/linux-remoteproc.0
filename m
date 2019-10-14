Return-Path: <benjamin.gaignard@st.com>
From: Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH v3] dt-bindings: hwlock: Convert stm32 hwspinlock bindings to json-schema
Date: Mon, 14 Oct 2019 11:17:56 +0200
Message-ID: <20191014091756.23763-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, alexandre.torgue@st.com
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Convert the STM32 hwspinlock binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
change in v3:
- use (GPL-2.0-only OR BSD-2-Clause)

change in v2:
- use BSD-2-Clause license
- use const for #hwlock-cells
- add additionalProperties: false

 .../bindings/hwlock/st,stm32-hwspinlock.txt        | 23 ----------
 .../bindings/hwlock/st,stm32-hwspinlock.yaml       | 50 ++++++++++++++++++++++
 2 files changed, 50 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
 create mode 100644 Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
deleted file mode 100644
index adf4f000ea3d..000000000000
--- a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-STM32 Hardware Spinlock Device Binding
--------------------------------------
-
-Required properties :
-- compatible : should be "st,stm32-hwspinlock".
-- reg : the register address of hwspinlock.
-- #hwlock-cells : hwlock users only use the hwlock id to represent a specific
-	hwlock, so the number of cells should be <1> here.
-- clock-names : Must contain "hsem".
-- clocks : Must contain a phandle entry for the clock in clock-names, see the
-	common clock bindings.
-
-Please look at the generic hwlock binding for usage information for consumers,
-"Documentation/devicetree/bindings/hwlock/hwlock.txt"
-
-Example of hwlock provider:
-	hwspinlock@4c000000 {
-		compatible = "st,stm32-hwspinlock";
-		#hwlock-cells = <1>;
-		reg = <0x4c000000 0x400>;
-		clocks = <&rcc HSEM>;
-		clock-names = "hsem";
-	};
diff --git a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
new file mode 100644
index 000000000000..47cf9c8d97e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwlock/st,stm32-hwspinlock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 Hardware Spinlock bindings
+
+maintainers:
+  - Benjamin Gaignard <benjamin.gaignard@st.com>
+  - Fabien Dessenne <fabien.dessenne@st.com>
+
+properties:
+  "#hwlock-cells":
+    const: 1
+
+  compatible:
+    const: st,stm32-hwspinlock
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: hsem
+
+required:
+  - "#hwlock-cells"
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    hwspinlock@4c000000 {
+        compatible = "st,stm32-hwspinlock";
+        #hwlock-cells = <1>;
+        reg = <0x4c000000 0x400>;
+        clocks = <&rcc HSEM>;
+        clock-names = "hsem";
+    };
+
+...
-- 
2.15.0
