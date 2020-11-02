Return-Path: <SRS0=xJOp=EI=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF08AC4742C
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Nov 2020 19:39:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6287822275
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Nov 2020 19:39:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="TLKkQFfG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbgKBTjG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Nov 2020 14:39:06 -0500
Received: from mail-dm6nam12on2073.outbound.protection.outlook.com ([40.107.243.73]:22337
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726633AbgKBTjF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Nov 2020 14:39:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkIFgJNc2oFHZ953OWvcobc1t0/R3yxiLAxeQfqkn5rRYb1fIGg+kslQ10gCMNqOF7VuEMPu1PzaK7pAapttQ7cyd5v/7lloRDrSc3D72GUOvWP8dsxbunyIdzlWaXAOUaNcPsbGy8j4l6LDRHSA2Uirm7Cm+mJnLlSC6AGeuX5zVeZKv9oJ6QR1mKkLzC2nvEKo4TbtLhYUc4Qhv2AbTMOSoxs9K75hPaEtdlz97KvNbwS0KbtlQZq0qOxmovKFHNzCqsKGdWo0XGGxDC2mOg54lm8xR9i6Io1GyZ6hEwqxSAd9KQulTj3zQYMNGF62TfWmQPOD4hbtwJ/SSnQqUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YINAS9/WbHhFgAovbF58hl4xmXoMoTb/F0NrxObhNHc=;
 b=bH/7k+0KFSy4t0eV0MZb3p+4m9eY9+TJbqeJO8GRfSu6p7PAuNKt6+F5OYN4Ioh4EwJ8vBEP6+kbPi4mPKXHtPj+aFDvM0opJbowHXnOiCGHIqACHqMGdBKeTBV+yYDqGX4Pw/Q9SQ1Ln3lWq/vF7cTQhw+Dq5MG4gnUmZJn6O+3i8QGQu8o1id8JqTzxS9NCcmL3lrDc9WeouCEOgl/2WOELr6iyGj6RHwJ4/NEf1MWxOA7SD7ztI5fcMcYuqfyN5FF1d6FAixTBtS0dfuODR0mtxKvbsYKMSvbPQYbogcs2vm4Ft2ojPoQ/HVji4KwYQb0TBReQImbSrRDQYeuBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=ni.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YINAS9/WbHhFgAovbF58hl4xmXoMoTb/F0NrxObhNHc=;
 b=TLKkQFfGaPlXwINsgobYoA7c7/OJ4K8oGr7NYJONdDtBLAcuUqkiQbCPYf/ndaQ2ylCAhCH6AD0xzyzWS3CL6YHa28B/3z0P8XNy6mu2ELmQtmzQ/EP/KpzQsyplvFd206UtASKVs7zPTCoQXkEK50nGV0KajHcjDnZwz8w/Zbo=
Received: from CY4PR20CA0014.namprd20.prod.outlook.com (2603:10b6:903:98::24)
 by DM6PR02MB6746.namprd02.prod.outlook.com (2603:10b6:5:21b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 2 Nov
 2020 19:39:02 +0000
Received: from CY1NAM02FT048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:98:cafe::70) by CY4PR20CA0014.outlook.office365.com
 (2603:10b6:903:98::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Mon, 2 Nov 2020 19:39:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; ni.com; dkim=none (message not signed)
 header.d=none;ni.com; dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT048.mail.protection.outlook.com (10.152.74.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3520.15 via Frontend Transport; Mon, 2 Nov 2020 19:39:02 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 2 Nov 2020 11:38:59 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 2 Nov 2020 11:38:59 -0800
Envelope-to: stefanos@xilinx.com,
 michael.auchter@ni.com,
 mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=58004 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kZffP-0005Vs-Oh; Mon, 02 Nov 2020 11:38:59 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <michael.auchter@ni.com>, <stefanos@xilinx.com>,
        <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v21 4/5] dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc bindings
Date:   Mon, 2 Nov 2020 11:38:58 -0800
Message-ID: <20201102193859.31090-5-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201102193859.31090-1-ben.levinsky@xilinx.com>
References: <20201102193859.31090-1-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75dc5fb1-5eaa-41ef-6acf-08d87f66f3c3
X-MS-TrafficTypeDiagnostic: DM6PR02MB6746:
X-Microsoft-Antispam-PRVS: <DM6PR02MB6746DA3443DC2AAA25835DD3B5100@DM6PR02MB6746.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oQ4ZjLR7Qx58EssfJ8ZDx6+xi6gbr2rrDROD812FRg7XN9cmhs6a8JP3D6npvBS/iXc6MPV0o7wjR5iFyg99xaLd9BPZhJ5kD0p3DUYgiEf3+4+uABjg+UvLztliJBD/A3kR7kxJeLZv7ZXbV/Q3KfXIAPsc1ALoBVGo0ml7QD4KW7F3SVjpoF01xdQ4riwfq00i2zTK+1815F4aKljzA/MGJVFHWIwM9gI2ycYVnmX5RZ5CJltXdSYRouKGw7deovCIJCCKXGVrzEKi4L5mQntKVzv5/+LeUdBHGyCBgV//Zd1lZ4VzRFnyQLWkEGtoiQFuZazmvH0g1I9R3yuHuxKbCE3tdHECKuXMWNi4vPOsO4ghjpKnAgT5l8rQIdH6GWSvHnxuHnRkCXTPnTnpzAHp67aao+hsuZ2Qft1zIBc8afoVyvc5Sm1j5fWp1WclbrnmxlO5ddxS6J7fhkpL/hOC22SO2MrK6VLSoI9eO5HrQeQtRQC5L4H9NTuvT2Yu
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(46966005)(83380400001)(7636003)(186003)(478600001)(2906002)(4326008)(8676002)(44832011)(7696005)(1076003)(82740400003)(36756003)(8936002)(356005)(426003)(36906005)(54906003)(110136005)(316002)(70206006)(82310400003)(5660300002)(47076004)(9786002)(26005)(336012)(70586007)(2616005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 19:39:02.5357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75dc5fb1-5eaa-41ef-6acf-08d87f66f3c3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT048.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6746
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

