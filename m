Return-Path: <SRS0=47aK=EF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E88C388F9
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 21:29:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F95A22202
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 21:29:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="Rty4k++v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727660AbgJ3V3F (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 30 Oct 2020 17:29:05 -0400
Received: from mail-mw2nam10on2079.outbound.protection.outlook.com ([40.107.94.79]:39360
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726163AbgJ3V2l (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 30 Oct 2020 17:28:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QO8c8x4NbuXT02V0wW26hgoKxKTxfyv3onQv1l359gcLllG7edePW/900dL5dYW7HxWVoVd+DFBjQW5JqhiTYGZaTMCUVPGXRNSxKw7D3BQn6XF17Ks8ZLGIqOLwX84owQC5VAF1HmKMIr99bOHSxCMFUk5BxlFJlNtJFw4CDOsmoGetklY0boWX4qIEwxorNwycU7uPTlQ+Hmi/vZIYxKCmIkoeGhXwes3qS6OHY9vtaxKTaiUuj51nn730xQyY14ptq+V+PB0konvRemjbhaCxqzrDhZd5G8VLukIe3yGEs2yVpYrbQJRAe8pdV43hwageWuDjwEr6dQwyzMZzvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSBpjDU5RzhFqD03KFq84A3tCc6J+wP0V9a9CDG9kDg=;
 b=nUaI06GI2E80VJy590kW6mh787ZGQ7s0vYvfL+B6b0N+g6vSaFnKRGTSo8GYt13WQ6CY/h0DxOuWoYs6Y7Mu8R+qc78nHgO+J9nTBYvA505R14fAkJkToiDO/7keC4tpc89WZMwpnoMFwgJEdEUiVGnvEla2wcyY/SSGvD88mWvIIVEgzRzYREMmwvhjDP8t58FItyqRK3PdWyp/yEjFMrrTDZaWX6hkzCwnpk4zdVg9LFEAUX48xp4lWrcmdNC+tflBgJF+A7qfpkvDyJiQkksyLBOhh7dLzJzGKWXz1kK/eL7b+1uEgx+nzk7G8Z/GsK/p3uEuxRsrkmPgoUVAaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSBpjDU5RzhFqD03KFq84A3tCc6J+wP0V9a9CDG9kDg=;
 b=Rty4k++vp1mtu/EozRJWylVEr8l51SSXbMi4c2L1k3CI3N7AO0bLMLPrUkrYz4i/XjcIxY06v19/R7ADx7pG358nlaH3uQPjwcxqXN3YFIvBUYbn6uF0AZoOW2Q3GebB+tOD7ZHYfoO8bW48RG7D9bdCfaQJ+wazw28xG6SJrlo=
Received: from DM5PR16CA0020.namprd16.prod.outlook.com (2603:10b6:3:c0::30) by
 MN2PR02MB6640.namprd02.prod.outlook.com (2603:10b6:208:1d0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 30 Oct
 2020 21:28:38 +0000
Received: from CY1NAM02FT015.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:c0:cafe::d) by DM5PR16CA0020.outlook.office365.com
 (2603:10b6:3:c0::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Fri, 30 Oct 2020 21:28:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT015.mail.protection.outlook.com (10.152.75.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 21:28:38 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Fri, 30 Oct 2020 14:28:34 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Fri, 30 Oct 2020 14:28:34 -0700
Envelope-to: stefanos@xilinx.com,
 mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=56470 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kYbwo-0003JM-F0; Fri, 30 Oct 2020 14:28:34 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <stefanos@xilinx.com>, <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <robh+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v20 4/5] dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc bindings
Date:   Fri, 30 Oct 2020 14:28:33 -0700
Message-ID: <20201030212834.18270-5-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201030212834.18270-1-ben.levinsky@xilinx.com>
References: <20201030212834.18270-1-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70c9f6a3-11e8-424a-44f0-08d87d1ac3f4
X-MS-TrafficTypeDiagnostic: MN2PR02MB6640:
X-Microsoft-Antispam-PRVS: <MN2PR02MB664033E00045861314D4C846B5150@MN2PR02MB6640.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e8y1IAOHJFxDSJHz4mJJay8DjpqJ9AsnCQIvSVMYNcHLdWj+ubFrKST/3KYXONCtyI7L/mKddbzoOT6b3VOeHiHlHlypKJ13cDX+nCx6daowKjTRfcbVkHARubYSjbp3K82YILtwRKeFLjX2uLy2gIzNBbYATC00askOr7mk/nyGBqEpDseN21TbCaoOO8F/pzffBVMM04NP4LIWO0I5BfHHqVbxn0ss4gcqck5DnP4xXJffdKc+13W3r5+CPuZ5ThvOKx5fgHbjOlexrtKY0PRFAXZNZ+3GvNfcnkRfKSBiAScrC/SFt87Ut34MxmwderWI9UyVLp8/df7CG+BX82PEqjA73q1e9b7IxYS+qV+TPu7XtCWR0i9YZxeiaE4lHLmOx2OwQrWox1YyXrrfv7R+pCnxq0kHH1WftmeB8ZIsUSMvPnpvbu+fJtgd/f7hMDaxHL9l334Nk50iOTjRs1t8prgEKfRBIc3udvf5JDwVCt2jQazrwUJavPikZuDP
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966005)(47076004)(316002)(44832011)(82310400003)(82740400003)(7636003)(2616005)(36756003)(4326008)(54906003)(478600001)(26005)(8676002)(186003)(2906002)(70206006)(356005)(110136005)(8936002)(70586007)(336012)(36906005)(7696005)(5660300002)(83380400001)(426003)(9786002)(1076003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 21:28:38.2462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c9f6a3-11e8-424a-44f0-08d87d1ac3f4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT015.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6640
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
v20:
- update typos and style
- add compat string for singular r5 core to accomodate
  devm_of_platform_populate
---
 .../xilinx,zynqmp-r5-remoteproc.yaml          | 143 ++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
new file mode 100644
index 000000000000..9cb358389cd7
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
@@ -0,0 +1,143 @@
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
+  Note that the Linux has global addressing view of the R5-related memory (TCM)
+  so the absolute address ranges are provided in TCM reg's.
+
+maintainers:
+  - Ed Mooring <ed.mooring@xilinx.com>
+  - Ben Levinsky <ben.levinsky@xilinx.com>
+
+properties:
+  compatible:
+    const: xlnx,zynqmp-r5-remoteproc
+
+  lockstep-mode:
+    description:
+      If this property is present, then the configuration is lock-step.
+      Otherwise RPU is split.
+    type: boolean
+    maxItems: 1
+
+  interrupts:
+    description:
+      Interrupt mapping for remoteproc IPI. It is required if the
+      user uses the remoteproc driver with the RPMsg kernel driver.
+    maxItems: 6
+
+  memory-regions:
+    description:
+      Collection of memory carveouts used for elf-loading and inter-processor
+      communication. each carveout in this case should be in DDR, not
+      chip-specific memory. In Xilinx case, this is TCM, OCM, BRAM, etc.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  meta-memory-regions:
+    description:
+      Collection of memories that are not present in the top level memory
+      nodes' mapping. For example, R5s' TCM banks. These banks are needed
+      for R5 firmware meta data such as the R5 firmware's heap and stack.
+      To be more precise, this is on-chip reserved SRAM regions, e.g. TCM,
+      BRAM, OCM, etc.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  pnode-id:
+    maxItems: 1
+    description:
+      Power node id that is used to uniquely identify the node for Xilinx
+      Power Management. The value is then passed to Xilinx platform
+      manager for power on/off and access.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  mboxes:
+    description:
+      Array of phandles that describe the rx and tx for xilinx zynqmp
+      mailbox driver. order of rx and tx is described by the mbox-names
+      property. This will be used for communication with remote
+      processor.
+    maxItems: 2
+
+  mbox-names:
+    description:
+      Array of strings that denote which item in the mboxes property array
+      are the rx and tx for xilinx zynqmp mailbox driver
+    maxItems: 2
+    $ref: /schemas/types.yaml#/definitions/string-array
+
+
+examples:
+  - |
+     reserved-memory {
+          #address-cells = <1>;
+          #size-cells = <1>;
+          ranges;
+          elf_load: rproc@3ed000000 {
+               no-map;
+               reg = <0x3ed00000 0x40000>;
+          };
+
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
+
+     };
+
+     /*
+      * Below nodes are required if using TCM to load R5 firmware
+      * if not, then either do not provide nodes or label as disabled in
+      * status property
+      */
+     tcm0a: tcm_0a@ffe00000 {
+         reg = <0xffe00000 0x10000>;
+         pnode-id = <0xf>;
+         no-map;
+         status = "okay";
+         phandle = <0x40>;
+     };
+     tcm0b: tcm_1a@ffe20000 {
+         reg = <0xffe20000 0x10000>;
+         pnode-id = <0x10>;
+         no-map;
+         status = "okay";
+         phandle = <0x41>;
+     };
+
+     rpu {
+          compatible = "xlnx,zynqmp-r5-remoteproc";
+          #address-cells = <1>;
+          #size-cells = <1>;
+          ranges;
+          lockstep-mode;
+          r5_0 {
+               compatible = "xlnx,zynqmp-r5-single-remoteproc";
+               ranges;
+               #address-cells = <1>;
+               #size-cells = <1>;
+               memory-regions = <&elf_load>,
+                               <&rpu0vdev0vring0>,
+                               <&rpu0vdev0vring1>,
+                               <&rpu0vdev0buffer>;
+               meta-memory-regions = <&tcm_0a>, <&tcm_0b>;
+               pnode-id = <0x7>;
+          };
+     };
+
+...
-- 
2.17.1

