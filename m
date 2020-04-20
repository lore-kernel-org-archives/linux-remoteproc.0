Return-Path: <BLEVINSK@xilinx.com>
Return-Path: ben.levinsky@xilinx.com
From: Ben Levinsky <ben.levinsky@xilinx.com>
Subject: [PATCH v3 4/5] dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc bindings
Date: Mon, 20 Apr 2020 15:27:08 -0700
Message-Id: <1587421629-914-5-git-send-email-ben.levinsky@xilinx.com>
In-Reply-To: <1587421629-914-1-git-send-email-ben.levinsky@xilinx.com>
References: <1587421629-914-1-git-send-email-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: ohad@wizery.com, bjorn.andersson@linaro.org, michal.simek@xilinx.com, jollys@xilinx.com, rajan.vaja@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Wu <j.wu@xilinx.com>, Wendy Liang <jliang@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Add binding for ZynqMP R5 OpenAMP.

Represent the RPU domain resources in one device node. Each RPU
processor is a subnode of the top RPU domain node.

Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
Signed-off-by: Jason Wu <j.wu@xilinx.com>
Signed-off-by: Wendy Liang <jliang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
Changes since v2:
	- update zynqmp_r5 yaml parsing to not raise warnings for extra
	 information in children of R5 node. The warning "node has a unit
	 name, but no reg or ranges property" will still be raised though 
	 as this particular node is needed to describe the
	 '#address-cells' and '#size-cells' information.
---
 .../remoteproc/xilinx,zynqmp-r5-remoteproc.yaml    | 126 +++++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
new file mode 100644
index 0000000..e7d1496
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Xilinx R5 remote processor controller bindings
+
+description:
+  This document defines the binding for the remoteproc component that loads and
+  boots firmwares on the Xilinx Zynqmp and Versal family chipset.
+
+maintainers:
+  - Ed Mooring <ed.mooring@xilinx.com>
+  - Ben Levinsky <ben.levinsky@xilinx.com>
+
+properties:
+  compatible:
+    const: "xlnx,zynqmp-r5-remoteproc-1.0"
+
+  core_conf:
+    description:
+      R5 core configuration (valid string - split or lock-step)
+    maxItems: 1
+
+  interrupts:
+    description:
+      Interrupt mapping for remoteproc IPI. It is required if the
+      user uses the remoteproc driver with the RPMsg kernel driver.
+    maxItems: 6
+
+  memory-region:
+    maxItems: 4
+    minItems: 4
+  pnode-id:
+    maxItems: 1
+  mboxes:
+    maxItems: 2
+  mbox-names:
+    maxItems: 2
+
+  r5@0:
+    type: object
+    required:
+        - '#address-cells'
+        - '#size-cells'
+        - pnode-id
+examples:
+  - |
+     reserved-memory {
+          #address-cells = <1>;
+          #size-cells = <1>;
+          ranges;
+          rpu0vdev0vring0: rpu0vdev0vring0@3ed40000 {
+               no-map;
+               reg = <0x3ed40000 0x4000>;
+          };
+          rpu0vdev0vring1: rpu0vdev0vring1@3ed44000 {
+               no-map;
+               reg = <0x3ed44000 0x4000>;
+          };
+          rpu0vdev0buffer: rpu0vdev0buffer@3ed48000 {
+               no-map;
+               reg = <0x3ed48000 0x100000>;
+          };
+          rproc_0_reserved: rproc@3ed000000 {
+               no-map;
+               reg = <0x3ed00000 0x40000>;
+          };
+     };
+     rpu: rpu@ff9a0000 {
+          compatible = "xlnx,zynqmp-r5-remoteproc-1.0";
+          #address-cells = <1>;
+          #size-cells = <1>;
+          ranges;
+          core_conf = "split";
+          reg = <0xFF9A0000 0x10000>;
+          r5_0: r5@0 {
+               ranges;
+               #address-cells = <1>;
+               #size-cells = <1>;
+               memory-region = <&rproc_0_reserved>, <&rpu0vdev0buffer>, <&rpu0vdev0vring0>, <&rpu0vdev0vring1>;
+               pnode-id = <0x7>;
+               mboxes = <&ipi_mailbox_rpu0 0>, <&ipi_mailbox_rpu0 1>;
+               mbox-names = "tx", "rx";
+               tcm_0_a: tcm_0@0 {
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+                    reg = <0xFFE00000 0x10000>;
+                    pnode-id = <0xf>;
+               };
+               tcm_0_b: tcm_0@1 {
+                    #address-cells = <2>;
+                    #size-cells = <2>;
+                    reg = <0xFFE20000 0x10000>;
+                    pnode-id = <0x10>;
+               };
+          };
+     };
+
+
+     zynqmp_ipi1 {
+          compatible = "xlnx,zynqmp-ipi-mailbox";
+          interrupt-parent = <&gic>;
+          interrupts = <0 29 4>;
+          xlnx,ipi-id = <7>;
+          #address-cells = <1>;
+          #size-cells = <1>;
+          ranges;
+
+          /* APU<->RPU0 IPI mailbox controller */
+          ipi_mailbox_rpu0: mailbox@ff90000 {
+               reg = <0xff990600 0x20>,
+                     <0xff990620 0x20>,
+                     <0xff9900c0 0x20>,
+                     <0xff9900e0 0x20>;
+               reg-names = "local_request_region",
+                        "local_response_region",
+                        "remote_request_region",
+                        "remote_response_region";
+               #mbox-cells = <1>;
+               xlnx,ipi-id = <1>;
+          };
+     };
+
+...
-- 
2.7.4
