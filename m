Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59442C8301D
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 Nov 2020 15:58:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B96A205F4
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 Nov 2020 15:58:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="mDfQaU6H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728560AbgK3P6R (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 30 Nov 2020 10:58:17 -0500
Received: from mail-co1nam11on2080.outbound.protection.outlook.com ([40.107.220.80]:26944
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728457AbgK3P6Q (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Nov 2020 10:58:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h41Sjn2MziHJVewewmZLZBjSjhAEiUgM5SznBY+xhGbUq+6f4q0KGLmb90cfLe0NATAyz3DcSPcjsLYebvK0zWVrW4Ca7owNtxa5boiDh9vNWkjtpqXmG0DUqEKo1T7NE1PUWJX53PXLUnsPmUn4i98q5S4KlCR3b73t9SvsqLG0jZTOpyA6kYVqzeDf5XlbgXqJrVd/Cvt9JRMfLeEBMAVKpQhoolLHM9ZXjoK/GUeMpxalgoZYUTr3PFQJb1aN2y3gtHma57Gp7gJqLUl0dFNe41mECzSBuucI1HC8WUjeIs0RNIeeaXF3fVRpIju13RnmbfMTCkTQOPUEHpF+Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXRyrK3DHYXvLWyAnkFmoXmhY24igXb0owOFJz76mGQ=;
 b=EKGK18vCUtJy/CMhuCQoYtI0WK8g5i8d/A68vgqMCKukgvb8JaKYeEVNDtNDr8K5HegRgWz4Daijq/zoAhlCkHJhPlk44kzzfML8dtIVbMMdXaxvqgjIA1WFMVexq8d5Ezz4+j4k3eSSEl1QcGOy5os35pdd3GpRmompjGrnMntGBPYDWZFoKZ/hlauNooMcukeEOUT0rgW6osr+W9k81Pzhjx0J2YzmXvWYZAH2jPXRao0KtWamW9LFudsixoVWymD0jes7hzEBqh/lVO9yB9lGYvNQDbsvjDSxT6wqR8s9Zi26JpF1PROAsnFnz4h34mL+IVHgvpN23B2YL1Uf+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXRyrK3DHYXvLWyAnkFmoXmhY24igXb0owOFJz76mGQ=;
 b=mDfQaU6H7P4V1XSzKggMui4F3iueZAccmmgkcLiVjeTvwFWdkhpBXIQ5rVVOfB1uE6wA2QZ1yWxZW/aCui+NmZur4NlUiMaKlhLODxdFDwvUpcPVZWWF2pyDrv2t6Ahu4LlWoh+5/wAyEQS90jrWMjYp8ZSrNZedAeqc/HjWNng=
Received: from BL0PR05CA0025.namprd05.prod.outlook.com (2603:10b6:208:91::35)
 by BL0PR02MB5697.namprd02.prod.outlook.com (2603:10b6:208:85::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 15:57:18 +0000
Received: from BL2NAM02FT017.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:91:cafe::7) by BL0PR05CA0025.outlook.office365.com
 (2603:10b6:208:91::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.6 via Frontend
 Transport; Mon, 30 Nov 2020 15:57:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT017.mail.protection.outlook.com (10.152.77.174) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Mon, 30 Nov 2020 15:57:17 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 30 Nov 2020 07:57:17 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 30 Nov 2020 07:57:17 -0800
Envelope-to: mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=47338 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kjlYD-000342-9H; Mon, 30 Nov 2020 07:57:17 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v24 4/5] dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc bindings
Date:   Mon, 30 Nov 2020 07:57:16 -0800
Message-ID: <20201130155717.26008-5-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201130155717.26008-1-ben.levinsky@xilinx.com>
References: <20201130155717.26008-1-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb4cbda8-368b-4819-84d5-08d895489d2a
X-MS-TrafficTypeDiagnostic: BL0PR02MB5697:
X-Microsoft-Antispam-PRVS: <BL0PR02MB569780B2370A22152A2E03B4B5F50@BL0PR02MB5697.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YySc4PuDzhgt0knQwELfXSSQDYZUlyFB5kbxGKxlGdtO2S4VbrvyGZIeNTLrM3GnG5cGxne0i0QaVEPRd1yEk585y0X8B67fCD2x3ROgyNzFH4GNjbJ3fLXUejNj4QS6XPuDa5GWJ1sHLOP5EfpuAibZ2g+HatsmN61AmC2iTWdk/YlZPQIwpji5TJYDniA3yEpLo5bwowpDiG3c4jTM7ey1n0AqcUfWS90B/kHamhxvlxwcLDxnFlOHV6oBbSJ/vPG8pilVyE6DWw0cpaQe+6Gx0NBdcI2U9ZG8orlKTbUYbhDfa54Yph50nun7w3ScZmmoVYVFFhsWLw9gF51zx+tdtsf97NDNnIy1Lf1mdJekEW8uDF39unVHXo3TOmhefnZPzAH+rMKzoi0UNI4noHgiaUrurW7zcwLGTQTqjeweqWEr7QbUmuJr2ghFRYzU9oQAvoODXcvP05FJOYjki+b/C7H1inEKPOPj4zdJgXlyXYIyjOump7V7WS3uIyW1
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966005)(36756003)(356005)(186003)(336012)(54906003)(4326008)(36906005)(2616005)(47076004)(316002)(44832011)(7636003)(82740400003)(426003)(9786002)(70206006)(70586007)(5660300002)(2906002)(83380400001)(8676002)(82310400003)(1076003)(7696005)(26005)(8936002)(6916009)(478600001)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 15:57:17.8509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4cbda8-368b-4819-84d5-08d895489d2a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT017.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5697
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add binding for ZynqMP R5 OpenAMP.

Represent the RPU domain resources in one device node. Each RPU
processor is a subnode of the top RPU domain node.

Signed-off-by: Jason Wu <j.wu@xilinx.com>
Signed-off-by: Wendy Liang <jliang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
---
v24: update for 'make dt_binding_check' errors
---
 .../xilinx,zynqmp-r5-remoteproc.yaml          | 223 ++++++++++++++++++
 1 file changed, 223 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
new file mode 100644
index 000000000000..bccbdee8c3f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
@@ -0,0 +1,223 @@
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
+  boots firmwares on the Xilinx Zynqmp and Versal family chipsets.
+
+  Note that the Linux has global addressing view of the R5-related memory (TCM)
+  so the absolute address ranges are provided in TCM reg's.
+
+maintainers:
+  - Ed Mooring <ed.mooring@xilinx.com>
+  - Ben Levinsky <ben.levinsky@xilinx.com>
+
+properties:
+  $nodename:
+    pattern: "^r5fss(@.*)?"
+
+  compatible:
+    enum:
+      - xlnx,zynqmp-r5-remoteproc
+
+  reg:
+    items:
+      - description: Address and Size of Xilinx RPU Configuration register
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+# Optional properties:
+# --------------------
+  xlnx,cluster-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description: |
+      Configuration Mode for the Dual R5F cores within the R5F cluster.
+      Should be either a value of 1 (LockStep mode) or 0 (Split mode),
+      default is LockStep mode if omitted.
+
+
+#R5F Processor Child Nodes:
+# ==========================
+
+patternProperties:
+  "^r5f_[a-f0-9]+$":
+    type: object
+    description: |
+      The R5F Sub-System device node should define one or two R5F child nodes,
+      each node representing a Xilinx instantiation of the Arm Cortex R5F core.
+      There should be one or two child nodes if the R5F is in Split mode and
+      one child node if the R5F is in Lockstep mode.
+
+      In Split mode each R5F core has two associated TCM Banks. R5_0 has
+      TCM Banks 0A and 0B and R5_1 has TCM Banks 1A and 1B.
+
+      In Lockstep mode only one R5F child node should be defined. This one
+      child has access to TCM Banks 0A, 0B, 1A and 1B and any of the four can
+      be included in the child R5F's sram property.
+
+      The example below shows Split mode with two child nodes.
+
+    properties:
+      compatible:
+        enum:
+          - xilinx,r5f
+
+# The following properties are mandatory for R5F Core0 in both LockStep and Split
+# modes, and are mandatory for R5F Core1 _only_ in Split mode.
+
+      memory-region:
+        description: |
+          Phandles to the memory nodes to be associated with the
+          The reserved memory nodes should be carveout nodes, and
+          should be defined with a "no-map" property as per the bindings in
+          Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+        minItems: 1
+        maxItems: 6
+        items:
+          - description: Region used for dynamic DMA allocations like vrings and
+                         vring buffers
+          - description: region reserved for firmware image sections
+        additionalItems: true
+
+      power-domain:
+        description: |
+          Power node ID that is used to uniquely identify the RPU for Xilinx
+          Power Management.
+        maxItems: 1
+
+# Optional properties:
+# --------------------
+# The following properties are optional properties for each of the R5F cores:
+
+      mboxes:
+        description: |
+          Standard property to specify a mailbox
+          This property is required only if the rpmsg/virtio functionality
+          is used
+
+           Refer to the zynqmp-ipi-mailbox documentation for client usage of this
+           property
+        maxItems: 1
+
+      mbox-names:
+        description: |
+          Refer to the zynqmp-ipi-mailbox documentation for client usage of this
+          property
+        items:
+          - const: tx
+          - const: rx
+
+      sram:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        minItems: 1
+        maxItems: 4
+        description: |
+          Phandles to one or more reserved on-chip SRAM regions. The regions
+          should be defined as child nodes of the respective SRAM node, and
+          should be defined as per the generic bindings in,
+          Documentation/devicetree/bindings/sram/sram.yaml
+
+    required:
+      - compatible
+      - power-domain
+
+    unevaluatedProperties: false
+
+required:
+  - reg
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    / {
+        compatible = "xlnx,zynqmp-zcu102-rev1.0", "xlnx,zynqmp-zcu102", "xlnx,zynqmp";
+        #address-cells = <2>;
+        #size-cells = <2>;
+        model = "ZynqMP ZCU102 ";
+
+        zynqmp_ipi1 {
+          compatible = "xlnx,zynqmp-ipi-mailbox";
+          interrupt-parent = <&gic>;
+          interrupts = <0 33 4>;
+          xlnx,ipi-id = <5>;
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          ipi_mailbox_rpu0: mailbox@ff990600 {
+            reg = <0xff990600 0x20>,
+                  <0xff990620 0x20>,
+                  <0xff9900c0 0x20>,
+                  <0xff9900e0 0x20>;
+            reg-names = "local_request_region",
+            "local_response_region",
+            "remote_request_region",
+            "remote_response_region";
+            #mbox-cells = <1>;
+            xlnx,ipi-id = <3>;
+          };
+          ipi_mailbox_rpu1: mailbox@ff990780 {
+            reg = <0xff990780 0x20>,
+                  <0xff9907a0 0x20>,
+                  <0xff9907c0 0x20>,
+                  <0xff9905a0 0x20>;
+            reg-names = "local_request_region",
+            "local_response_region",
+            "remote_request_region",
+            "remote_response_region";
+            #mbox-cells = <1>;
+            xlnx,ipi-id = <3>;
+          };
+        };
+
+        r5fss@ff9a0000 {
+          compatible = "xlnx,zynqmp-r5-remoteproc";
+          #address-cells = <2>;
+          #size-cells = <2>;
+          ranges;
+          reg = <0x0 0xff9a0000 0x0 0x10000>;
+          xlnx,cluster-mode = <0>;
+
+          r5f_0 {
+               compatible = "xilinx,r5f";
+               memory-region = <&elf_load0>,
+                               <&rpu0vdev0vring0>,
+                               <&rpu0vdev0vring1>,
+                               <&rpu0vdev0buffer>;
+               sram = <&tcm_0a>, <&tcm_0b>;
+               mboxes = <&ipi_mailbox_rpu0 0x0 &ipi_mailbox_rpu0 0x1>;
+               mbox-names = "tx", "rx";
+               power-domain = <0x7>;
+          };
+          r5f_1 {
+               compatible = "xilinx,r5f";
+               memory-region = <&elf_load1>,
+                               <&rpu1vdev0vring0>,
+                               <&rpu1vdev0vring1>,
+                               <&rpu1vdev0buffer>;
+               sram = <&tcm_1a>, <&tcm_1b>;
+               mboxes = <&ipi_mailbox_rpu1 0x0 &ipi_mailbox_rpu1 0x1>;
+               mbox-names = "tx", "rx";
+               power-domain = <0x8>;
+          };
+
+        };
+    };
+
+...
-- 
2.17.1

