Return-Path: <SRS0=uUKq=D2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B6A0C4363A
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 22:40:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1529223FD
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 22:40:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="MkaZySeT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388513AbgJSWkV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 19 Oct 2020 18:40:21 -0400
Received: from mail-bn8nam11on2044.outbound.protection.outlook.com ([40.107.236.44]:3553
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388479AbgJSWkT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Oct 2020 18:40:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTi55k7Kz+54LdfHPgRC8GlNnL5WJp1XTseW/zu7WyXdDw4EtzYC2g3mYzdlNg1UbpnxhKb8Y/sAEDYDX2moQeOrDa4SxPrF+B0lBBcD5b4HPriHfmSn2N0MPK6c0Q++l0hjaFDHRKxOduB3q3Ld4bihOQKYvUB8PwydjX/ACdOxSCytQAg/lm81WXR6oT/i3+IfRnlaNp6b+cn0u/uj4w76iBdbDE7doOOvv7MAhruUilN6wy3YOq8/C3B/esVVOibN4mLdtBVW75ajLLlDyIxYtmdaH3AAHURlTKJqmM5t7EgpMfsJ0DHpV6CtvvSxzaDkLHdQJy0Df8fsi7/vjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yfs2jQnAxtWy3Fd26QoaFWRpLRwVOmRVxlpKBDDRKw=;
 b=ajv5WyeFmT95Hefu2gFYXbNom4THdCqjwag+LwmEX+cyJRsWn0nYdW0khqkIczmmHEZXTllbqrXlfB+0lyuDzuXpu/xSpUp/EMImojnYcar08clMoQNsJTXFrZqdAonJng9hPNLXgRWrt2QZ6dTkhkvSjQJewksgc7k/Sx59Scjf1lSnx5er4FsqfSpjwSlqSWjJW6Deon/2HMfOihNhLWoWz3KtixpJ7gWxLhdpw39X/GK668vaHEGE27xAhgMtvGRgEZaBS5CHas4tqlM+T0uqASIl9YhnXGPzu1lLrSlhzwNIio2Ik4T2UUfh1MbNx/ju/xb28CbP44RLyLzaPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yfs2jQnAxtWy3Fd26QoaFWRpLRwVOmRVxlpKBDDRKw=;
 b=MkaZySeT9c7NDSY99lr2RvtUFdPKXxvlGACy8VNr/KVtZVxidAT/X5N2WmfyT04xmwx0IkTAERPJuR9qFrwjPXO5yTyK8YZ+yO0CHrwIAcL76d9xsL5fkQAh256aLDBl0vFB9bvhYkamqJAA3bR9SSv2hSTh+OjZWWSTB/S0HcY=
Received: from SN4PR0401CA0031.namprd04.prod.outlook.com
 (2603:10b6:803:2a::17) by BYAPR02MB4134.namprd02.prod.outlook.com
 (2603:10b6:a02:fe::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Mon, 19 Oct
 2020 22:40:15 +0000
Received: from SN1NAM02FT029.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2a:cafe::27) by SN4PR0401CA0031.outlook.office365.com
 (2603:10b6:803:2a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Mon, 19 Oct 2020 22:40:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT029.mail.protection.outlook.com (10.152.72.110) with Microsoft SMTP
 Server id 15.20.3477.21 via Frontend Transport; Mon, 19 Oct 2020 22:40:14
 +0000
Received: from [149.199.38.66] (port=33992 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kUdoG-0004rG-75; Mon, 19 Oct 2020 15:39:20 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kUdp8-0007Tv-Il; Mon, 19 Oct 2020 15:40:14 -0700
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 09JMe7uf026641;
        Mon, 19 Oct 2020 15:40:08 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kUdp1-0007R9-UH; Mon, 19 Oct 2020 15:40:07 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     sunnyliangjy@gmail.com, punit1.agrawal@toshiba.co.jp,
        stefanos@xilinx.com, michals@xilinx.com, michael.auchter@ni.com
Cc:     devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v19 4/5] dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc bindings
Date:   Mon, 19 Oct 2020 15:40:06 -0700
Message-Id: <20201019224007.16846-5-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019224007.16846-1-ben.levinsky@xilinx.com>
References: <20201019224007.16846-1-ben.levinsky@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 42a09fcc-ab56-4b29-f0db-08d8747ff261
X-MS-TrafficTypeDiagnostic: BYAPR02MB4134:
X-Microsoft-Antispam-PRVS: <BYAPR02MB41343D1485D8F64A52759C99B51E0@BYAPR02MB4134.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7apdp/hplWvqgcVi5Y4P19ThyFdzLMXabonS4g5c1Df0uBqHdR1AZFJZVG4OtdPzAWbHz/O+Ngpq/VRJFuuKb3uvjgIbwypiMKOUjj0ggi3uiAjpHtAEV0/d4kSkEqLs7t4BAAsKfSK3EvvdeAGe286y67/9vUUgWKiSe9sDPC1iJPqF0QlhhIfdYKThhn3pYW0Oip3+ApF/UFYndLyPCWfrTBPqOrnrUipIRcQgFTlwxLKKNFBRrQ4kDZ3c6NV/ynqbAmovOkbsPRzj8S0Mfq1IM/eFSYzgPkNzT6vUXeoXOaR4LUkO6BfAqtf+4QM/lnhe2Io+1bg0hP4YMUM2ph9Fa8pF9zePAKUBnwRTlt5pEdUyhrLe4UerjXUJuX1Np0IiejdGdc1rEAZY0EIHlQhATQKcxY2MpR2mcUhLGHok/KSC0L1WEdkZLPqB/8WhAHlyw9iWEy7+Y05AKODlPvJQ1KHOO1XEspbWPSnNQwxHyawoHl+5TwWeOeVWnRA2
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(39860400002)(396003)(346002)(376002)(136003)(46966005)(186003)(70206006)(70586007)(82740400003)(47076004)(4326008)(508600001)(36756003)(316002)(7696005)(5660300002)(2616005)(82310400003)(336012)(426003)(356005)(8936002)(44832011)(8676002)(83380400001)(81166007)(1076003)(9786002)(2906002)(26005)(42866002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 22:40:14.8983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a09fcc-ab56-4b29-f0db-08d8747ff261
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT029.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4134
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
v3:
- update zynqmp_r5 yaml parsing to not raise warnings for extra
  information in children of R5 node. The warning "node has a unit
  name, but no reg or ranges property" will still be raised though 
  as this particular node is needed to describe the
  '#address-cells' and '#size-cells' information.
v4::
- remove warning '/example-0/rpu@ff9a0000/r5@0: 
  node has a unit name, but no reg or ranges property'
  by adding reg to r5 node.
v5:
- update device tree sample and yaml parsing to not raise any warnings
- description for memory-region in yaml parsing
- compatible string in yaml parsing for TCM
v6:
- remove coupling TCM nodes with remoteproc 
- remove mailbox as it is optional not needed
v7:
- change lockstep-mode to xlnx,cluster-mode
v9:
- show example IPC nodes and tcm bank nodes
v11:
- add property meta-memory-regions to illustrate link
  between r5 and TCM banks
- update so no warnings from 'make dt_binding_check'
v14:
- concerns were raised about the new property meta-memory-regions.
  There is no clear direction so for the moment I kept it in the series
- place IPC nodes in RAM in the reserved memory section
v15:
- change lockstep-mode prop as follows: if present, then RPU cluster is in
  lockstep mode. if not present, cluster is in split mode.
v17:
- remove compatible string from tcm bank nodes
- fix style for bindings
- add boolean type to lockstep mode in binding
- add/update descriptions memory-region, meta-memory-regions,
  pnode-id, mbox* properties
v18: 
- update example remoteproc zynqmp r5 compat string, remove version
  number
- change property from memory-region to memory-regions
---
 .../xilinx,zynqmp-r5-remoteproc.yaml          | 142 ++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
new file mode 100644
index 000000000000..c202dca3b6d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
@@ -0,0 +1,142 @@
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
+      collection of memory carveouts used for elf-loading and inter-processor
+      communication. each carveout in this case should be in DDR, not
+      chip-specific memory. In Xilinx case, this is TCM, OCM, BRAM, etc.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  meta-memory-regions:
+    description:
+      collection of memories that are not present in the top level memory
+      nodes' mapping. For example, R5s' TCM banks. These banks are needed
+      for R5 firmware meta data such as the R5 firmware's heap and stack.
+      To be more precise, this is on-chip reserved SRAM regions, e.g. TCM,
+      BRAM, OCM, etc.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  pnode-id:
+    maxItems: 1
+    description:
+      power node id that is used to uniquely identify the node for Xilinx
+      Power Management. The value is then passed to Xilinx platform
+      manager for power on/off and access.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  mboxes:
+    description:
+      array of phandles that describe the rx and tx for xilinx zynqmp
+      mailbox driver. order of rx and tx is described by the mbox-names
+      property. This will be used for communication with remote
+      processor.
+    maxItems: 2
+
+  mbox-names:
+    description:
+      array of strings that denote which item in the mboxes property array
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
+      * if not, then either do not provide nodes are label as disabled in
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

