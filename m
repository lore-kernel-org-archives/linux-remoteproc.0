Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6882EC433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 15:45:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30B0664DE8
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 15:45:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233325AbhBWPpy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Feb 2021 10:45:54 -0500
Received: from mail-dm6nam08on2072.outbound.protection.outlook.com ([40.107.102.72]:24065
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233274AbhBWPpq (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Feb 2021 10:45:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jd0gPYr5SPP72w96NcvXnkKk+b573MUc54m6xbPWWz+UziHrqWiIhBKwTIvkQ2NOi3nGXcE8LdSOWtq4zOpJpg7uN+P87zz8O1czMxq1be2l1jICIowhyUZ+QUUwiSL1QAhwSKT65qq41v6KyRKTp8XfieLt6XWDXmok2gUWfynEEPeLN9kuJIJGqchpwlZIcnHWz77vBagZIIlfV/Xs16SfQJze0Lf58LDFiRXgog6zNu/ZJ4e1OLuv1LIK0XYtI9ZKaMRibHkalEdQlTM7g52Ex2HPguqTtq9c+hEoAM9P2+C3UiC9qrmiE4/Cbxzzwg6pQxos0EPqOxc7pj4d3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjjQkbWISU7bk9PEYhNmG4HT88EK20drwrAsoqLg5jA=;
 b=IM3JmoiTnoD2iY6lChw1X2gde8PBd5B+YxNrWvBDk6YxXnfHH7HPj05eoWUVHydXA8FRx6eoA8jN6/GIzMh6t/mloBLdTzVGhnn3n5ENjuJgGm5OirP2Xt7c2mrCl1PEbt1hRdUDNGIIYzddnsjYTDL7EUuD30VhSRBR4y2AZq9wB1McQQD4X7GeNYkcFlcMOkCGDrIPoq682GxkN8K9IUVrd0fKfQoQ3Q2hsmy0mhNq7tYUKoCbF6Xv5SjFHk1iA10N/D64dMOqmHBP8VOP9hZJ4MJHGb+xdIBv8ozVwFIWN9z4FnYTQAtZiKuOUsGaa52xfsyW8eL3gOLWv4UtVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjjQkbWISU7bk9PEYhNmG4HT88EK20drwrAsoqLg5jA=;
 b=is4Km+6yb7xDnCs5lwhHcAOlAu9FvjUUrWbflUZzmprombW4BADGhd86MqS2Fg1KJfAxq6BErf87hJm9maCjkXwEDYzh6q6LbUiDI+34p7w6sNJf1oek4OzPBVft+bxQ9BhY5ATO6UOhCDGyEYD5yDaMRXlLCz6ePwFR90+hFiE=
Received: from SN4PR0501CA0088.namprd05.prod.outlook.com
 (2603:10b6:803:22::26) by BYAPR02MB4280.namprd02.prod.outlook.com
 (2603:10b6:a03:5a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Tue, 23 Feb
 2021 15:44:48 +0000
Received: from SN1NAM02FT035.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:22:cafe::6) by SN4PR0501CA0088.outlook.office365.com
 (2603:10b6:803:22::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.10 via Frontend
 Transport; Tue, 23 Feb 2021 15:44:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT035.mail.protection.outlook.com (10.152.72.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Tue, 23 Feb 2021 15:44:47 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 23 Feb 2021 07:44:47 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 23 Feb 2021 07:44:47 -0800
Envelope-to: michal.simek@xilinx.com,
 mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=40282 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1lEZrj-0006uk-9z; Tue, 23 Feb 2021 07:44:47 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <michal.simek@xilinx.com>
Subject: [PATCH v26 4/5] dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc bindings
Date:   Tue, 23 Feb 2021 07:44:46 -0800
Message-ID: <20210223154447.13247-5-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210223154447.13247-1-ben.levinsky@xilinx.com>
References: <20210223154447.13247-1-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91e0c5ac-184d-40e2-df4d-08d8d811f32f
X-MS-TrafficTypeDiagnostic: BYAPR02MB4280:
X-Microsoft-Antispam-PRVS: <BYAPR02MB42806E39E1A9122878C1A04BB5809@BYAPR02MB4280.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +obes9re7umEJDR7rJNpeICUHUAoOpX9IMMralgb7DDfAiIkrbH2EIRfiGh5YlKFqsa9GdGtb4Nhg4Ny1cqSXAsI8Jd14waRL/TM6ggOl8iOqDZyOVETiUyh5T7ygGM6l+WyY8yp7oK+AJeSg3QG3SpkH2L9d6lVjnjgQHM5ustnKaVtXoWbamR996zBXoo+iwRw2uMgW9lW09PoMAbhl20YQxk0t028S2Y+2dZG9r408EncOSznur91Vr8u09s0r83YhJ3ggolWdzneFMneU1d6YFJV3hsOisqFHoOKRRVdl9wLB6fH1YxQqk5DIVHuH4tpZ1yBzGjQ1+g8/Wa0HtQK+qEMw+OF0g8721xbA726ITSDxK2DNEoIuzrQbtTLK3446zsCjJMyxq37d9V0VhTMjsdLm6+3pjyr9JFx4dPFauQfq1jjeNNn32UYwM+1D1yoXPTqGel/8RlGRqbum/uKDwlojPdzIXXLBHa+kScFqqedgYSe1DySWAnGz0xju8/I9w1gtGcFPP/ZdOxLGWW/Fv+FIMugcjVCj7vGusHrQQV01Ey6Oc/VtKR7J4Ad8iocoBIypqKnGvvGFQ3ZcUqKIv39/XiCB1TYONSP0UeEMaLQ54bMEIkFt/QXPacQ41zV3+0V+iKBgnVn2CTeuNjNhThz3Vd5ctG8Bhwc6c1COc7CLo+DX7LPGtUPf1hLjHKPEH6d83k0aN3Ox2rzm6kVMMoM5QodXvWd1/A2sG2A+MB5L6VxJlvJzP52RplN
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(376002)(39860400002)(36840700001)(46966006)(107886003)(47076005)(36756003)(356005)(6916009)(8676002)(2906002)(478600001)(4326008)(70586007)(83380400001)(36860700001)(70206006)(5660300002)(9786002)(82740400003)(7636003)(36906005)(7696005)(82310400003)(44832011)(316002)(54906003)(426003)(186003)(8936002)(2616005)(336012)(1076003)(26005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 15:44:47.8130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e0c5ac-184d-40e2-df4d-08d8d811f32f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT035.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4280
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
 .../xilinx,zynqmp-r5-remoteproc.yaml          | 223 ++++++++++++++++++
 1 file changed, 223 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
new file mode 100644
index 000000000000..b9412c2def7b
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
+          - description: Region reserved for firmware image sections
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
+          should be defined as per the generic bindings in
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

