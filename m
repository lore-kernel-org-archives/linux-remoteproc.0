Return-Path: <paul@crapouillou.net>
From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v5 1/5] dt-bindings: Document JZ47xx VPU auxiliary processor
Date: Tue, 11 Feb 2020 11:26:09 -0300
Message-Id: <20200211142614.13567-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: od@zcrc.me, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-ID: <linux-remoteproc@vger.kernel.org>

Inside the Video Processing Unit (VPU) of the recent JZ47xx SoCs from
Ingenic is a second Xburst MIPS CPU very similar to the main core.
This document describes the devicetree bindings for this auxiliary
processor.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: Update TCSM0 address in example
    v3: Change node name to 'video-decoder'
    v4: Convert to YAML. I didn't add Rob's Ack on v3 because of that (sorry Rob)
    v5: - Fix 'reg' not in <addr, len> pairs
        - Add missing include to devicetree example

 .../bindings/remoteproc/ingenic,vpu.yaml      | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml b/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
new file mode 100644
index 000000000000..c019f9fbe916
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/remoteproc/ingenic,vpu.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Ingenic Video Processing Unit bindings
+
+description:
+  Inside the Video Processing Unit (VPU) of the recent JZ47xx SoCs from
+  Ingenic is a second Xburst MIPS CPU very similar to the main core.
+  This document describes the devicetree bindings for this auxiliary
+  processor.
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+properties:
+  compatible:
+    const: ingenic,jz4770-vpu-rproc
+
+  reg:
+    items:
+      - description: aux registers
+      - description: tcsm0 registers
+      - description: tcsm1 registers
+      - description: sram registers
+
+  reg-names:
+    items:
+      - const: aux
+      - const: tcsm0
+      - const: tcsm1
+      - const: sram
+
+  clocks:
+    items:
+      - description: aux clock
+      - description: vpu clock
+
+  clock-names:
+    items:
+      - const: aux
+      - const: vpu
+
+  interrupts:
+    description: VPU hardware interrupt
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4770-cgu.h>
+
+    vpu: video-decoder@132a0000 {
+      compatible = "ingenic,jz4770-vpu-rproc";
+
+      reg = <0x132a0000 0x20>, /* AUX */
+            <0x132b0000 0x4000>, /* TCSM0 */
+            <0x132c0000 0xc000>, /* TCSM1 */
+            <0x132f0000 0x7000>; /* SRAM */
+      reg-names = "aux", "tcsm0", "tcsm1", "sram";
+
+      clocks = <&cgu JZ4770_CLK_AUX>, <&cgu JZ4770_CLK_VPU>;
+      clock-names = "aux", "vpu";
+
+      interrupt-parent = <&cpuintc>;
+      interrupts = <3>;
+    };
-- 
2.25.0
