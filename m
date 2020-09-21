Return-Path: <SRS0=DqHI=C6=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A9FC43468
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Sep 2020 16:14:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 466A2206FB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Sep 2020 16:14:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="Bwx7q/Zm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728129AbgIUQOX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Sep 2020 12:14:23 -0400
Received: from mail-eopbgr770059.outbound.protection.outlook.com ([40.107.77.59]:27926
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727770AbgIUQOU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Sep 2020 12:14:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyJLV5WAeTsE7iXWcLVvxT0sIrGU1hecH+2SJZ0pvkdwA5yXjVf9oIfpDkpd7O5cC6Q9kVVFYqLWmtVjTItrYC2PA6DAUR4K/RZ9b4DHH3Q0hx111c4T+sktMLZ/AQgW2mdVEnmcN80tcGf8H0OTVaKfkKFeMvPHzrHZTBxo+q/Cs/CEOnOJuBNIO1mbDux2+LYfdq0E+HRp+VCAhvAhVV7cmftZ5L6yX+FKy9C9cDIQhy2aC7QsDA+MbRZUjSQr2iUzd/ZsM0eEky2w5A0IawImLy0vF8lv4xN3MfZ5sBK+yzq+uRT94YbKWX8xMTB97n9NWjwDYTXtLRIh8kr88Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rG6gieZ9iBl20Mm42LKgtUc595lIv0Au6XNRoNUDbyg=;
 b=cy0sJMGD1XmMj9ImYBiN1fUgWYmxt7YVZB90PkuDPqSA46JE417g1CRRCjBSPmCrQSaTE1mbfzkQ0S+Jfsi8nZJwG5Z0i15KAxeNaZDkodFWX2IZE/0UoQ5zje7cYXGar8VyL1ynXEQYM5SS8yuhWOaBHkuSlICFo0F5bhkn69zPixC8uV0DGWSrGqKddQvIDA1q6+uGWGj7aAZAeReSSba76NihgcVw5T4wZucGKLDnsYaotpBamyhaWEeuW6txlMFmCTJDL3WZyz2KjfftsJx5zrHJRuEPcsOYCj/g5EErB72CwYKYRuE2ZiHNsIzWhcl5K5d+7ZM3UKH6kdJe9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rG6gieZ9iBl20Mm42LKgtUc595lIv0Au6XNRoNUDbyg=;
 b=Bwx7q/Zmg6payl1VM6wTelDYrbVg9+Evv0tH8LT7uA1f/mAonavTaiNzgPiTnTsPUm2z0HprzPZ4PYgtbJTZStfDzmb4FhiO3y+wr67duUGyeQx7tWoNa6CQs8Yoz7QJ2qxyhaZvtXi50lf1CbuvUXuSIBGahNmuNwAA9MT3hf4=
Received: from SA9PR03CA0024.namprd03.prod.outlook.com (2603:10b6:806:20::29)
 by MN2PR02MB6125.namprd02.prod.outlook.com (2603:10b6:208:180::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Mon, 21 Sep
 2020 16:14:16 +0000
Received: from SN1NAM02FT017.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:20:cafe::78) by SA9PR03CA0024.outlook.office365.com
 (2603:10b6:806:20::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.26 via Frontend
 Transport; Mon, 21 Sep 2020 16:14:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT017.mail.protection.outlook.com (10.152.72.115) with Microsoft SMTP
 Server id 15.20.3391.15 via Frontend Transport; Mon, 21 Sep 2020 16:14:15
 +0000
Received: from [149.199.38.66] (port=36681 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kKOS2-00058f-7D; Mon, 21 Sep 2020 09:14:02 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kKOSF-0004ec-FS; Mon, 21 Sep 2020 09:14:15 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 08LGE6CB008437;
        Mon, 21 Sep 2020 09:14:06 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kKOS6-0004bU-Jq; Mon, 21 Sep 2020 09:14:06 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     sunnyliangjy@gmail.com, punit1.agrawal@toshiba.co.jp,
        stefanos@xilinx.com, michals@xilinx.com, michael.auchter@ni.com
Cc:     devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        emooring@xilinx.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, Jason Wu <j.wu@xilinx.com>,
        Wendy Liang <jliang@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH v15 4/5] dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc bindings
Date:   Mon, 21 Sep 2020 09:14:05 -0700
Message-Id: <20200921161406.11929-5-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921161406.11929-1-ben.levinsky@xilinx.com>
References: <20200921161406.11929-1-ben.levinsky@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c91ea161-c8d3-42a1-fd1c-08d85e4962ee
X-MS-TrafficTypeDiagnostic: MN2PR02MB6125:
X-Microsoft-Antispam-PRVS: <MN2PR02MB6125B48CB553D3ACF984672DB53A0@MN2PR02MB6125.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gx+7lrsWQ+Xc1yE2emGQut0jpk9ilEtXLCDyrfdMozjS/ZDRWcho6ej4UCdpQywi5vq69jT4b9jnDLhoD0hI0bBRg7bXJZkOjUprNuLnxcdWS/rt8POJFfazEFcgBs0ufbERvc2AHlcEyNvCMU65k2p/xDEsnyq7W0/iHQ0Hslfnljge//6Yeqxk77MbWBNOtjqvsr1y4YKo8IdGCPFHujGXaMBs6jbo0h/z8rftx059/WemEFyQu9/bSRqqmsxLCYEzrKQXDnLhCZ83GCkCTjdzFB7jK0fxFhEXXlcYuK2q7OQgpf6Foe6XWB5DysqFFsO9wjVzHF5jI+KhtT9kG7yV3EiqcghWMyWO7saHmeN5dn5rE9UhEaM3OUAw+vcWCVUsqCjDws/UI4r4GnljIlyXNpE/kF91zmYy/6vn444WTETJIr5NP7fSTnO+QYxfsO4kvkjwEj285+eTUj6cC9XNQRwLbeC2kKUIRwrh7q0=
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(376002)(346002)(136003)(39860400002)(396003)(46966005)(8936002)(5660300002)(8676002)(2906002)(9786002)(82740400003)(7696005)(70206006)(83380400001)(70586007)(1076003)(2616005)(478600001)(47076004)(186003)(4326008)(44832011)(336012)(54906003)(107886003)(316002)(82310400003)(426003)(36756003)(356005)(81166007)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2020 16:14:15.7938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c91ea161-c8d3-42a1-fd1c-08d85e4962ee
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT017.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6125
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

