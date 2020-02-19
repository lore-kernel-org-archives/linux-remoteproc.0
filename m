Return-Path: <peng.fan@nxp.com>
From: peng.fan@nxp.com
Subject: [PATCH 2/9] dt-bindings: remoteproc: imx-rproc: support i.MX[8,8M,7ULP]
Date: Wed, 19 Feb 2020 15:27:38 +0800
Message-Id: <1582097265-20170-3-git-send-email-peng.fan@nxp.com>
In-Reply-To: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
Return-Path: peng.fan@nxp.com
MIME-Version: 1.0
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-imx@nxp.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Peng Fan <peng.fan@nxp.com>

Support i.MX8/8M/7ULP:
 - Introduce early-booted property for M4 booted before Linux
 - Introduce mboxes for rpmsg/virtio to communicate with M4
 - Introduce mub-partition for hardware partition supported by i.MX8
 - Introduce rsrc-table which hold the resource table

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/remoteproc/imx-rproc.yaml  | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml
index 12a5f3de38fb..be708130d5c0 100644
--- a/Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/imx-rproc.yaml
@@ -19,6 +19,12 @@ properties:
       enum:
         - "fsl,imx7d-cm4"
         - "fsl,imx6sx-cm4"
+        - "fsl,imx7ulp-cm4"
+        - "fsl,imx8mm-cm4"
+        - "fsl,imx8qm-cm4"
+        - "fsl,imx8qxp-cm4"
+
+  early-booted: true
 
   clocks:
     items:
@@ -30,11 +36,39 @@ properties:
      allOf:
        - $ref: "/schemas/types.yaml#/definitions/phandle"
 
+  mboxes:
+    description:
+      This property is required only if the rpmsg/virtio functionality is used.
+      List of <&phandle type channel> - 1 channel for TX, 1 channel for RX,
+      1 channel for RXDB.
+      (see mailbox/fsl,mu.txt)
+    maxItems: 3
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+      - const: rxdb
+    maxItems: 3
+
   memory-region:
     description:
       List of phandles to the reserved memory regions.
       (see ../reserved-memory/reserved-memory.txt)
 
+  mub-partition:
+    description:
+      The remote Co-processor hardware partition which is only valid for
+      i.MX SoCs with hardware partition feature.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  rsrc-table:
+    description:
+      Resource table array is required only if the rpmsg/virtio
+      functionality is used.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32-array
+
 required:
   - compatible
   - clocks
-- 
2.16.4
