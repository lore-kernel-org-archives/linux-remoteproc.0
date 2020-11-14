Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D231CC6379D
	for <linux-remoteproc@archiver.kernel.org>; Sat, 14 Nov 2020 16:49:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98269222E8
	for <linux-remoteproc@archiver.kernel.org>; Sat, 14 Nov 2020 16:49:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="feeMGycT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbgKNQt3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 14 Nov 2020 11:49:29 -0500
Received: from mail-eopbgr760074.outbound.protection.outlook.com ([40.107.76.74]:37190
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726628AbgKNQt2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 14 Nov 2020 11:49:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgiJMkH4Ss9cwuCzACZABgGJQ9OsBxnUyRVuWD5ET88c9zNEcDIw6Yi0lvpoQjDGymMGrZ3TTim5CAcl36BAj02bQWhrSY2ic565w7ba4rQ5yaa1JncX0IuAaWjhPoJ04yH21bTq0tL1Vgnqo8GZK2+w3M/TTFGQIPtIPNnY/77SjoaIDjxMToiUq/OzGeFPSy46oKrG+XHbZY6amVMKANXDg16kD6V2ZaPHn0iHNXjGUthR/MkzeRg1JCQ/mwDQldzx4S4txT0VhpWfDfXPa3vXK5JI5ndo3TkF6/dHSwOM3LjL9oqSRQ94hz+tlIQwoJqc5U59e9XVL6aE9ehkNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryU26hi2plDL9JpqhTSikyr8PmFCDGaSRyGyiQxnqmA=;
 b=A5KNlfDHRLoqkz7weZbdiFJmNVXhM/aMeifjgy63/pvUkxnavVUdyIPCaoLpf/5L2u/Ou5Rrjm44XPVdao5R9bvV/DPPh9A1ppEtLi47jPQeGHhKl5I7OXUjEeDYLUC8VZNrqxkQ8KwrUuiEh9VPEpb0r7yDYwoj7n/X4oLqoH91BOSeRs2dTn/iMOQOhO8J4UgZ57ciknwOW7relyq2x58p5IqaJubTTB8Fo4Tr84uPmFGQOEoGQBQFDo2ydZ7iYMoGGCoKxdYrUC4Si+ChbYdl9qnsi0U3IG1fT/An8mod1ViOWoEehD7t/foXWWcrFbHjmvw7sF0KxjLpHNpF6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryU26hi2plDL9JpqhTSikyr8PmFCDGaSRyGyiQxnqmA=;
 b=feeMGycTTGiuL2qhoSMV0UUqnaGQtFlSZnQ7VzyQ54+BpXJKkbaEW1o4ufRqYOx4l2V6xCPZZKxFu1Gsprl7rZ/sDVBiWg9TtASgGEYynkF02X87okEEz6ZLfxZA0AyxBGrbWrx1jhoQqxNt9fGw6HAljLo4fHUPnGqr4oENnsM=
Received: from BL1PR13CA0210.namprd13.prod.outlook.com (2603:10b6:208:2be::35)
 by SN6PR02MB5632.namprd02.prod.outlook.com (2603:10b6:805:e1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.26; Sat, 14 Nov
 2020 16:49:24 +0000
Received: from BL2NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2be:cafe::5a) by BL1PR13CA0210.outlook.office365.com
 (2603:10b6:208:2be::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.21 via Frontend
 Transport; Sat, 14 Nov 2020 16:49:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT007.mail.protection.outlook.com (10.152.77.46) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Sat, 14 Nov 2020 16:49:24 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sat, 14 Nov 2020 08:49:21 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sat, 14 Nov 2020 08:49:21 -0800
Envelope-to: mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=38914 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kdyjp-0007Ai-Hy; Sat, 14 Nov 2020 08:49:21 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v23 4/5] dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc bindings
Date:   Sat, 14 Nov 2020 08:49:20 -0800
Message-ID: <20201114164921.14573-5-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201114164921.14573-1-ben.levinsky@xilinx.com>
References: <20201114164921.14573-1-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24027661-6191-4c98-7651-08d888bd3e13
X-MS-TrafficTypeDiagnostic: SN6PR02MB5632:
X-Microsoft-Antispam-PRVS: <SN6PR02MB563234CBE9B3433A1B1B76B0B5E50@SN6PR02MB5632.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xBu5s4kUh+CgA22javh28F01ErL9M9Ep43eupLcOcQPwkWS7AWvnpZ6J/O34y/Qzg+hwb+7KoxhPTXppUnPuat/iBFuhAv9S7ekoQfHq2DhCGAq58WnoRXvohYHDsBh40EFRwziIlb88oytVf9NKY/Uu37QVApA3akqI7Je5ddj/uWz8mBTgUtCJYIjd9HvlpJ+C3pUqMU/p5vkwYr5dXFxdBR+UPZDsq8sZL8NL91ld3klekbkWWvKevqHJgLEsCFrNnKwg8pvzYO8pv/R+Z1vsgYHfq7WhEsyO4tUJD9ZYozLIcx12riLZYEIXaW0EJpbf/C56A9/2EPYqllz0JUC/FRLSX/WFHVurohU4IbIdAprPWL0d+27DN4yS71cbIeTv2e6Hf5grEYoPVlW7H5kBcUMekqKiMcRSIk3cig/nqMY4H0Mu925YlmJZm4wGYbQG+HVZBZB1ufIhgtn1cYw0psKxLWQyTSSmJ2LsMFPThTwKNX2x9+AKRpr3PGCQ
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(346002)(376002)(46966005)(7696005)(186003)(4326008)(44832011)(83380400001)(9786002)(356005)(8936002)(8676002)(2906002)(478600001)(26005)(36906005)(316002)(47076004)(336012)(2616005)(426003)(36756003)(54906003)(70586007)(70206006)(6916009)(7636003)(82310400003)(82740400003)(1076003)(5660300002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2020 16:49:24.3165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24027661-6191-4c98-7651-08d888bd3e13
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5632
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
- Update grammar and capitalization
- Align with TI R5 Remoteproc driver as follows:
  > Change TCM node to be generic mmio sram node
  > Reword properties to align with TI R5 driver
  > Change structure of Yaml parsing to mirror TI R5 driver
---
 .../xilinx,zynqmp-r5-remoteproc.yaml          | 238 ++++++++++++++++++
 1 file changed, 238 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
new file mode 100644
index 000000000000..85c91005dbbe
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
@@ -0,0 +1,238 @@
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
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges:
+    const: 0
+
+# Optional properties:
+# --------------------
+  xilinx,cluster-mode:
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
+      "#address-cells":
+        const: 1
+      "#size-cells":
+        const: 1
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
+        maxItems: 2
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
+      - "#address-cells"
+      - "#size-cells"
+      - ranges
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
+         zynqmp_ipi1 {
+           compatible = "xlnx,zynqmp-ipi-mailbox";
+           interrupt-parent = <&gic>;
+           interrupts = <0 29 4>;
+           xlnx,ipi-id = <7>;
+           #address-cells = <1>;
+           #size-cells = <1>;
+           ranges;
+
+           /* APU<->RPU0 IPI mailbox controller */
+           ipi_mailbox_rpu0: mailbox@ff990600 {
+             reg = <0xff990600 0x20>,
+                   <0xff990620 0x20>,
+                   <0xff9900c0 0x20>,
+                   <0xff9900e0 0x20>;
+             reg-names = "local_request_region",
+            	         "local_response_region",
+                         "remote_request_region",
+                         "remote_response_region";
+             #mbox-cells = <1>;
+             xlnx,ipi-id = <1>;
+           };
+
+
+           /* APU<->RPU1 IPI mailbox controller */
+           ipi_mailbox_rpu1: mailbox@ff990780 {
+             reg = <0xff990780 0x20>,
+                   <0xff9907A0 0x20>,
+                   <0xff9907C0 0x20>,
+                   <0xff9905A0 0x20>;
+             reg-names = "local_request_region",
+            	         "local_response_region",
+                         "remote_request_region",
+                         "remote_response_region";
+             #mbox-cells = <1>;
+             xlnx,ipi-id = <2>;
+           };
+        };
+
+        r5fss@ff9a0000 {
+          compatible = "xlnx,zynqmp-r5-remoteproc";
+          #address-cells = <1>;
+          #size-cells = <1>;
+          ranges;
+          reg = <0xff9a0000 0x10000>;
+          xilinx,cluster-mode = <0>;
+
+          r5f_0 {
+               compatible = "xlnx,zynqmp-r5-single-remoteproc";
+               ranges;
+               #address-cells = <1>;
+               #size-cells = <1>;
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
+               compatible = "xlnx,zynqmp-r5-single-remoteproc";
+               ranges;
+               #address-cells = <1>;
+               #size-cells = <1>;
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

