Return-Path: <SRS0=ZH1X=C7=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B03C4727F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 22:39:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25B2520936
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 22:39:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="f6uNiYVX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbgIVWjw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Sep 2020 18:39:52 -0400
Received: from mail-dm6nam12on2078.outbound.protection.outlook.com ([40.107.243.78]:17217
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726751AbgIVWjq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Sep 2020 18:39:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b073wNQFEc974LMvC1Ko81TDhvgBgP5jDD6O1rAPz3IsQVumhG1W+g+Tt3mvnCgKSeMGB7LU6HZZijNJYnDNS7HfO9kreERX+neWcOBrq5ydMQOdBK1W3S78TSBM4oJKqGWKABd2O2kK0Km3TP5K5eI5eHsJ4slBO6iKF2sBvxMuxjnaN958QTek65/dTsIOJXx3hfCTg2n5vlG/F4bwlhBeSKrg5JsA//6VcCtmxPz+GOOy7Xe024TZtEUVXlstDUxjFW6oVScnebDJ+S515gaYeKjbqg43bbw7/UpWbOH1brJ/NxjGLEvFkLfNEMVejPse+9FU0n6mbV57q7+KKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0giYf0BiDI6wNyz/Sl3D4iRa7Ngg5xBDtHPTM387wQ=;
 b=Q/XVQ1oQx/A+do5XsxSpafwmWjp4T5lGD536o4ZuPFZVSxll2aOer9R1rsfqa7Wvv3oXKcLvtWdc+fxBvmjt6rjMzHptBZ0Nuqed80zjFSr42cDkYK1bDg+a84miv2IlL5DoJhcHV2FKgWrJ3lVhrE2BlZ/8+eqpvSuWEL7WlYWJYbsiRoLNsoRxOijOngrWq2AJR+kIq6z51rFo9pbf+LGzaSB5A/uY9zbsId4sTtfh7c5TBZWqkireBiOUTn8Cwa0TaoD0494iUe7wPaFFuQW+omVFTRKVEzSvn54ZYwnvBNCVnO0995PWDxx/hGVaT6YTdgRpaGHIbwV02l20tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0giYf0BiDI6wNyz/Sl3D4iRa7Ngg5xBDtHPTM387wQ=;
 b=f6uNiYVX4jiJVRZKnjyQ9CUp//0uB25S1P+HcHXARz2bq9yBsWTgoNom4SB+XxaSy3gBa0J7V34Nr3dqlamdGZI1eQ6nBwnFkyIOgxW3kbr7BwTEboey9QxU6ei4vWv1oF8fGuMjakyRVl/0DlU/FVJyhVoWg8li29J9tFLoFRk=
Received: from CY4PR13CA0009.namprd13.prod.outlook.com (2603:10b6:903:32::19)
 by BYAPR02MB4903.namprd02.prod.outlook.com (2603:10b6:a03:49::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.22; Tue, 22 Sep
 2020 22:39:38 +0000
Received: from CY1NAM02FT025.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:32:cafe::17) by CY4PR13CA0009.outlook.office365.com
 (2603:10b6:903:32::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.9 via Frontend
 Transport; Tue, 22 Sep 2020 22:39:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT025.mail.protection.outlook.com (10.152.75.148) with Microsoft SMTP
 Server id 15.20.3391.15 via Frontend Transport; Tue, 22 Sep 2020 22:39:37
 +0000
Received: from [149.199.38.66] (port=42757 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kKqwU-0000ph-Hj; Tue, 22 Sep 2020 15:39:22 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kKqwj-0002tQ-DB; Tue, 22 Sep 2020 15:39:37 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 08MMdUDQ023304;
        Tue, 22 Sep 2020 15:39:30 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kKqwc-0002rc-DO; Tue, 22 Sep 2020 15:39:30 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     stefanos@xilinx.com, michals@xilinx.com, michael.auchter@ni.com
Cc:     devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        emooring@xilinx.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, Jason Wu <j.wu@xilinx.com>,
        Wendy Liang <jliang@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH v16 4/5] dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc bindings
Date:   Tue, 22 Sep 2020 15:39:29 -0700
Message-Id: <20200922223930.4710-5-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922223930.4710-1-ben.levinsky@xilinx.com>
References: <20200922223930.4710-1-ben.levinsky@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 305f3d74-77b5-44a6-e34f-08d85f486306
X-MS-TrafficTypeDiagnostic: BYAPR02MB4903:
X-Microsoft-Antispam-PRVS: <BYAPR02MB49037DEDD722835DF79DCC66B53B0@BYAPR02MB4903.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kGbeuDagf5GeEGe2t2oDmPCW9iypcDUYbtXueGj/Q1m0++WsacaRNH+NCnFrz62evrXA04QOx6iQdtK0o4mVkFgXsut4TFYed6JFCzUc7GMLSZz5UTqj5FIRJfLf5CBVxJwKlZE/V0ycO1jft/8Ljz//dJZCALSjb/rEIgQrKzISkGXmHG4i1lkv2xv9IPdV8OLRbsn9o3WsYlsarFVU3SKqmU6hJMfXPlAHkbcG/F7CHbgWFTMZD9CKPCjic1qxDc9Sq7SE7+AQyzF0EbZALR0Q78A0AkV8WJj2W+oUxpwhNv0+b/DCr6uVGd15raCzmlaiAJq7dr8ZN+04vzT3/kAzzH2YdSY55LSMh+8NjsjHckqMQFWLOPQ2HnzHFruk8rakHERbqgpRaFAellWvBUZXp9VO8rf43raGjr+Go5ZeaR4HUazXdZ9pIwdfuWXyDB01E7Li1ahkuy9A2klVNC1Y5uvoyjZDOFCSk2/DDf0=
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(396003)(376002)(136003)(346002)(39850400004)(46966005)(2906002)(47076004)(426003)(82740400003)(5660300002)(107886003)(54906003)(82310400003)(1076003)(44832011)(7696005)(4326008)(2616005)(8676002)(186003)(81166007)(83380400001)(336012)(8936002)(36756003)(9786002)(316002)(356005)(26005)(478600001)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 22:39:37.6505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 305f3d74-77b5-44a6-e34f-08d85f486306
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT025.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4903
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
---
 .../xilinx,zynqmp-r5-remoteproc.yaml          | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
new file mode 100644
index 000000000000..ce02e425692e
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
@@ -0,0 +1,120 @@
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
+maintainers:
+  - Ed Mooring <ed.mooring@xilinx.com>
+  - Ben Levinsky <ben.levinsky@xilinx.com>
+
+properties:
+  compatible:
+    const: "xlnx,zynqmp-r5-remoteproc-1.0"
+
+  lockstep-mode:
+    description:
+      If this property is present, then the configuration is lock-step.
+      Otherwise RPU is split.
+    maxItems: 1
+
+  interrupts:
+    description:
+      Interrupt mapping for remoteproc IPI. It is required if the
+      user uses the remoteproc driver with the RPMsg kernel driver.
+    maxItems: 6
+
+  memory-region:
+    description:
+      collection of memory carveouts used for elf-loading and inter-processor
+      communication.
+    maxItems: 4
+    minItems: 4
+  meta-memory-regions:
+    description:
+      collection of memories that are not present in the top level memory
+      nodes' mapping. For example, R5s' TCM banks. These banks are needed
+      for R5 firmware meta data such as the R5 firmware's heap and stack
+  pnode-id:
+    maxItems: 1
+  mboxes:
+    maxItems: 2
+  mbox-names:
+    maxItems: 2
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
+         compatible = "xlnx,tcm";
+     };
+     tcm0b: tcm_1a@ffe20000 {
+         reg = <0xffe20000 0x10000>;
+         pnode-id = <0x10>;
+         no-map;
+         status = "okay";
+         compatible = "xlnx,tcm";
+         phandle = <0x41>;
+     };
+
+     rpu {
+          compatible = "xlnx,zynqmp-r5-remoteproc-1.0";
+          #address-cells = <1>;
+          #size-cells = <1>;
+          ranges;
+          lockstep-mode;
+          r5_0 {
+               ranges;
+               #address-cells = <1>;
+               #size-cells = <1>;
+               memory-region = <&elf_load>,
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

