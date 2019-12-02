Return-Path: <afaerber@suse.de>
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [RFC 1/5] dt-bindings: hwlock: Add Realtek RTD1195 SB2
Date: Mon,  2 Dec 2019 23:05:31 +0100
Message-Id: <20191202220535.6208-2-afaerber@suse.de>
In-Reply-To: <20191202220535.6208-1-afaerber@suse.de>
References: <20191202220535.6208-1-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: linux-realtek-soc@lists.infradead.org
Cc: Cheng-Yu Lee <cylee12@realtek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Define a binding for Realtek RTD1195 SoC's SB2 hardware semaphore.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 .../bindings/hwlock/realtek,rtd1195-sb2-sem.yaml   | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/realtek,rtd1195-sb2-sem.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/realtek,rtd1195-sb2-sem.yaml b/Documentation/devicetree/bindings/hwlock/realtek,rtd1195-sb2-sem.yaml
new file mode 100644
index 000000000000..8035af02c667
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/realtek,rtd1195-sb2-sem.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwlock/realtek,rtd1195-sb2-sem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTD1195 SB2 hardware semaphore device tree binding
+
+maintainers:
+  - Andreas Färber <afaerber@suse.de>
+
+properties:
+  compatible:
+    const: realtek,rtd1195-sb2-sem
+
+  reg:
+    maxItems: 1
+
+  "#hwlock-cells":
+    enum: [ 0, 1 ]
+
+required:
+  - compatible
+  - reg
+  - "#hwlock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    hwspinlock@9801a000 {
+      compatible = "realtek,rtd1195-sb2-sem";
+      reg = <0x9801a000 0x4>;
+      #hwlock-cells = <0>;
+    };
+  - |
+    hwspinlock@9801a620 {
+      compatible = "realtek,rtd1195-sb2-sem";
+      reg = <0x9801a620 0x20>;
+      #hwlock-cells = <1>;
+    };
+...
-- 
2.16.4
