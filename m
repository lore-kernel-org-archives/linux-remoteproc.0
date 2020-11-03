Return-Path: <SRS0=eTbm=EJ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2A8C5DF9D
	for <linux-remoteproc@archiver.kernel.org>; Tue,  3 Nov 2020 18:24:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2FFB20870
	for <linux-remoteproc@archiver.kernel.org>; Tue,  3 Nov 2020 18:24:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="saqdbP+m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729553AbgKCSYG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 3 Nov 2020 13:24:06 -0500
Received: from mail-bn7nam10on2086.outbound.protection.outlook.com ([40.107.92.86]:33674
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727688AbgKCSYF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 3 Nov 2020 13:24:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSnJhLdIUuT0D4PUZANTARzGgv6p6iylC80MwibZNbp7/nXxpTZ+1BapQyN/KSa3uVfXhwKO80mKdPM8Rl5uweWEm973WqkkO6v0DtuNYQ7TfyMSLqGzmkMFcUzxqVMTFTfch1v1gdYv6CjkXoeNR3IGhdwucHUb+TwheTdUZL+pdQ3UBmUtC9rlJWCTLQ1palD2TxhVAR3navTA2G7mma+AxfLl0Czi4UpT1p8hFdAVxBcqxXhKf7ZQ0cLKkLZmeuakAOoNuy+ce+OeWg4N8ELmqg5+wV/n1YefaS98H2DAUAEmwgTUA4152/YFJgBH8DtX+z57EqNw/zZFSNrrhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YINAS9/WbHhFgAovbF58hl4xmXoMoTb/F0NrxObhNHc=;
 b=IE7x8ViqU8gZfvHNjMbkGHOBrjDW9SiTAO+HL5Zebz0MSR7pTb7H6/yJL4/LgVqSRh6MU+1EpMk9HRktyTaDMqaP/VC1Y6N4HEk+klr9Y0eIP2oDC2YT6pNxetaqyDeeaA0QVWchk19JPZrGJDczrnKwehX9uDEQrm1CHLNK4z8jwLicDxN2a9tqrz9bGvABYOwgTVT+fIo6S4szNeK/ozSFNNzuqpr1bNmHZu0V16e52ELEmvmMHgjtpUPk9WQ6+4cnM8c7y8OIU+K3tGlGcROoq1jhudz/wUitHDhOHKD0NOebICwuwspsnvM93FmwhXM+JZ7TUj1JvqZwroOJ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=ni.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YINAS9/WbHhFgAovbF58hl4xmXoMoTb/F0NrxObhNHc=;
 b=saqdbP+mexIgsrvSSN2yhQgTLmWBJrlWRDqLsyGIiviDX9N8frj+AGA6imlAgoFclOjRCbK5dMk07STBX0PcukFiA3G256TZOUEr6Tj/Syd80PyLGax0RA2fJzezriM36b84lNrfVRegz8H6ou5+tN65U517udyba1jxZMcUXW4=
Received: from BL1PR13CA0037.namprd13.prod.outlook.com (2603:10b6:208:257::12)
 by SN6PR02MB4144.namprd02.prod.outlook.com (2603:10b6:805:33::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Tue, 3 Nov
 2020 18:24:00 +0000
Received: from BL2NAM02FT026.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:257:cafe::c7) by BL1PR13CA0037.outlook.office365.com
 (2603:10b6:208:257::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend
 Transport; Tue, 3 Nov 2020 18:24:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; ni.com; dkim=none (message not signed)
 header.d=none;ni.com; dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT026.mail.protection.outlook.com (10.152.77.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3520.15 via Frontend Transport; Tue, 3 Nov 2020 18:24:00 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 3 Nov 2020 10:23:40 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 3 Nov 2020 10:23:40 -0800
Envelope-to: stefanos@xilinx.com,
 michael.auchter@ni.com,
 mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=58698 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1ka0y4-0002gB-1p; Tue, 03 Nov 2020 10:23:40 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <michael.auchter@ni.com>, <stefanos@xilinx.com>,
        <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v22 4/5] dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc bindings
Date:   Tue, 3 Nov 2020 10:23:38 -0800
Message-ID: <20201103182339.14286-5-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201103182339.14286-1-ben.levinsky@xilinx.com>
References: <20201103182339.14286-1-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98bc67bd-d1b0-4fb4-1f9c-08d88025a2ad
X-MS-TrafficTypeDiagnostic: SN6PR02MB4144:
X-Microsoft-Antispam-PRVS: <SN6PR02MB414453712185D2FA453E5BFFB5110@SN6PR02MB4144.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LiYGWr+VhAtENjDALkrf622HhdRs4hSB8HoZaANY0kmykkr3zz6vBlm/elrNBm17ZC3oS0trbleJNUw4KmQ78oz+0iSEqEqd6wiHwik5O5mlWdR0A6R8xu+ztk0lcrKTKfAhkrvbnYc/fkQL7qkkl6hyNzUBZwzuyT2AmWK/rgfYM3Js6JYKRlMqoi0sJxyBnl7RtBzDabJTeqZOGihAALXWGHsIdlskjLH70hwSwg+4oyVyz+F8zMdScLtCezbO5kAW7uhkDkdr/F6rCgb46mTHm1SrOLz5DazICkZov0pbEPv+J9gmxsj/4UXnl70xnuKbc3Ofu7CBPrKk2H0iFFIxiIHAP+ICOrD/GH8ptvabYgqRPGUxPwmSQjLrKfqwQBv9rzqjsu8vyG3QqN3Ob+TLdw9mK5B2DaZCK/NEdWRsxScj4+38owt5h72XU0KwQbUYj8opVrkQsXjeZ5HmbKm/TBTXP7X1bCKdg0545BOM/DzHCTMM77jpU8oy7qtl
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(46966005)(36756003)(110136005)(2906002)(54906003)(9786002)(5660300002)(4326008)(47076004)(186003)(82310400003)(26005)(36906005)(44832011)(82740400003)(70586007)(356005)(8676002)(7636003)(7696005)(336012)(70206006)(316002)(8936002)(478600001)(426003)(2616005)(1076003)(83380400001)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 18:24:00.2855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98bc67bd-d1b0-4fb4-1f9c-08d88025a2ad
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT026.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4144
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

