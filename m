Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04069E732E7
	for <linux-remoteproc@archiver.kernel.org>; Thu, 28 Sep 2023 15:59:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbjI1P73 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 28 Sep 2023 11:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbjI1P72 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 28 Sep 2023 11:59:28 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA55D6;
        Thu, 28 Sep 2023 08:59:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZ2BDr5YJ/Y3MgsSYHzq4wFp6WXF33NACGuBxH0kTyjcmqONfjxW3oMrQVNV1LuH2mMdwURS2klyYxVGoziXiH6nAG48jxh0FIxDNQAfbJ+gXgHbsnJTGaYda1aAkFgMRK/Gx+3tsMYWVnHajE/ecbthpkQb1PNIxY5oj04wA6oKI3EIAZWEhCAbMASXWx3MArdwApsPXum9/bATezPyx1AnWewh18WzRiKJ15+tetlonWV4wEm70ngdqk+7EHemoc/tfCPkTrhTvxMXygfA2oJTUAogyBgOFhISCqvBfV+Kp/SE45SaJS7C/Z75O7wAcRqpfhguzK2j+3iB4hMgKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iq269o5QOQbJhUiqAzKMEPjpeVXDjObs0TmQ+z0/BiA=;
 b=IoJBa7XpBxhzSw6d8PRlQmtYfe1Cc75bOx/aLzFjAZFl/1aAy9FM2gc9s5Zl8h9M8lsfU9P1D8ABb7/KTzH32nDdF3ozE+DKrpDCv4oXhnmXLZxMBHllFPdWo1qxy+MQ0H7Ic8Pn23APKoKvhBJcGLJLAxScRJf+/ir0uIiFqrKJ8XBbYGMu0dpk8OSG0N6EHHFaV5aZcrTwYTMWirq8Ki+3+ROWRK9gKps7kfCzeCjLVCW5BVzW178PmC+21ll1TjpvL4xHH5WTFcQoPBE8EPkFwij7MNKlr+yX5n/icJ0UHK8CNaJGWIZBnjOjpV7Wdu4RGRooFTbXV3ybvok8YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iq269o5QOQbJhUiqAzKMEPjpeVXDjObs0TmQ+z0/BiA=;
 b=whxpF1Znx3oNhKT2+zJWICHqXtXkfIhdSxxHwyMZouNFCxctVqrWTOFElP+do1X6Tb5ZktrgaoDErgcDMNeQLDM72IhG5sIp32ykqlHvJksEraqd7dWVBx/8cLLJp/ZVGI9qzLCntYKJrWwyEQ606jaB675dvKlE47QFavIM2+A=
Received: from CH0PR03CA0349.namprd03.prod.outlook.com (2603:10b6:610:11a::33)
 by SA0PR12MB4349.namprd12.prod.outlook.com (2603:10b6:806:98::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Thu, 28 Sep
 2023 15:59:23 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::d6) by CH0PR03CA0349.outlook.office365.com
 (2603:10b6:610:11a::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25 via Frontend
 Transport; Thu, 28 Sep 2023 15:59:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Thu, 28 Sep 2023 15:59:23 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 10:59:21 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 28 Sep 2023 10:59:21 -0500
From:   Tanmay Shah <tanmay.shah@amd.com>
To:     <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <michal.simek@amd.com>
CC:     <radhey.shyam.pandey@amd.com>, <tanmay.shah@amd.com>,
        <ben.levinsky@amd.com>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        "Rob Herring" <robh@kernel.org>
Subject: [PATCH v5 1/4] dt-bindings: remoteproc: add Tightly Coupled Memory (TCM) bindings
Date:   Thu, 28 Sep 2023 08:58:57 -0700
Message-ID: <20230928155900.3987103-2-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230928155900.3987103-1-tanmay.shah@amd.com>
References: <20230928155900.3987103-1-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|SA0PR12MB4349:EE_
X-MS-Office365-Filtering-Correlation-Id: c5668bfa-d919-491f-d27d-08dbc03be228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LLRvokKEifVFYKhe4MvlqJv55PVwEY/M9sKkRkDfnU1nCJANhB7BVPK12UW/nlLbXx5HASIv9HMqdpt8u50yf5sHPGmAcv7qMDP7nepHZ7PewKwevujHaJpTsyyBdhQTXrrbAk9SlOA2cwzmBrkUk8Kksp1yHcbc3v7q9mV8AM13c+td4UycgrfDB/mS4+VjBeSB6q4jnZiZIjuSvYd3uQbElL5qpV+RDbNLrfR0jRjFZQ0TwC8bLBUMZR8YJajq8clxp98p3qjaWZsCHnSDZJoYieuSrdu3VfCggat8TXRfjpu92Vv745x9AgQ8elY9ooRYB0mQch5lbPFwwe9PRsOI4wmmpqjaGweLn1zuZq/w2BnBPRqGWoO5zrkH06JcIY4XI3KHx9anyegL49rVlVCgD7Ef4zGa0pn7r7i7dxMdJAt9YmkdKdVkFuK94cGaxTr4du946LCy2y9Zx8AJsBaFTkuwrnZYW6df1SIM0onuQOWtDdaF9jbxOqoCJAvf55lcv4/+S5YKPUNLp0yndc3tf8s3kAF8yXjd14PxJmGn7X4aPjGoezW4jbM0/lQa1WKA27PvcpWroDVyRD85DCY7zQ+7lFJ/OT4+s+uLy3WY3OZlb/af+p9mXlWHfyz8cBeYrhATTbpb5VcOdLjNPoDHuYApWykvCFdoBtn1Bp7Pp/VrUzbV58rWz7nVluKwDHHBZFbh4XBXBfxJ/k+XGyf1zzhfDi93nrQh2N059CS/X7Kq1ZwRijpR6VZdTutzZJEnK0HLr1BMw+U4G3BWkA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(82310400011)(186009)(40470700004)(36840700001)(46966006)(36860700001)(2906002)(336012)(426003)(36756003)(83380400001)(47076005)(86362001)(26005)(82740400003)(2616005)(1076003)(356005)(81166007)(6666004)(40460700003)(478600001)(44832011)(5660300002)(6636002)(316002)(8676002)(8936002)(4326008)(40480700001)(54906003)(110136005)(70206006)(70586007)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 15:59:23.2205
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5668bfa-d919-491f-d27d-08dbc03be228
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4349
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

Introduce bindings for TCM memory address space on AMD-xilinx Zynq
UltraScale+ platform. It will help in defining TCM in device-tree
and make it's access platform agnostic and data-driven.

Tightly-coupled memories(TCMs) are low-latency memory that provides
predictable instruction execution and predictable data load/store
timing. Each Cortex-R5F processor contains two 64-bit wide 64 KB memory
banks on the ATCM and BTCM ports, for a total of 128 KB of memory.

The TCM resources(reg, reg-names and power-domain) are documented for
each TCM in the R5 node. The reg and reg-names are made as required
properties as we don't want to hardcode TCM addresses for future
platforms and for zu+ legacy implementation will ensure that the
old dts w/o reg/reg-names works and stable ABI is maintained.

It also extends the examples for TCM split and lockstep modes.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../remoteproc/xlnx,zynqmp-r5fss.yaml         | 131 +++++++++++++++---
 1 file changed, 113 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
index 78aac69f1060..9ecd63ea1b38 100644
--- a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
@@ -20,6 +20,17 @@ properties:
   compatible:
     const: xlnx,zynqmp-r5fss
 
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges:
+    description: |
+      Standard ranges definition providing address translations for
+      local R5F TCM address spaces to bus addresses.
+
   xlnx,cluster-mode:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [0, 1, 2]
@@ -37,7 +48,7 @@ properties:
       2: single cpu mode
 
 patternProperties:
-  "^r5f-[a-f0-9]+$":
+  "^r5f@[0-9a-f]+$":
     type: object
     description: |
       The RPU is located in the Low Power Domain of the Processor Subsystem.
@@ -54,8 +65,19 @@ patternProperties:
       compatible:
         const: xlnx,zynqmp-r5f
 
+      reg:
+        items:
+          - description: ATCM internal memory region
+          - description: BTCM internal memory region
+
+      reg-names:
+        items:
+          - const: atcm
+          - const: btcm
+
       power-domains:
-        maxItems: 1
+        minItems: 1
+        maxItems: 3
 
       mboxes:
         minItems: 1
@@ -102,34 +124,107 @@ patternProperties:
     required:
       - compatible
       - power-domains
+      - reg
+      - reg-names
 
     unevaluatedProperties: false
 
 required:
   - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
 
 additionalProperties: false
 
 examples:
   - |
-    remoteproc {
-        compatible = "xlnx,zynqmp-r5fss";
-        xlnx,cluster-mode = <1>;
-
-        r5f-0 {
-            compatible = "xlnx,zynqmp-r5f";
-            power-domains = <&zynqmp_firmware 0x7>;
-            memory-region = <&rproc_0_fw_image>, <&rpu0vdev0buffer>, <&rpu0vdev0vring0>, <&rpu0vdev0vring1>;
-            mboxes = <&ipi_mailbox_rpu0 0>, <&ipi_mailbox_rpu0 1>;
-            mbox-names = "tx", "rx";
+    #include <dt-bindings/power/xlnx-zynqmp-power.h>
+
+    //Split mode configuration
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        remoteproc@ffe00000 {
+            compatible = "xlnx,zynqmp-r5fss";
+            xlnx,cluster-mode = <0>;
+
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges = <0x0 0x0 0x0 0xffe00000 0x0 0x10000>,
+                     <0x0 0x20000 0x0 0xffe20000 0x0 0x10000>,
+                     <0x1 0x0 0x0 0xffe90000 0x0 0x10000>,
+                     <0x1 0x20000 0x0 0xffeb0000 0x0 0x10000>;
+
+            r5f@0 {
+                compatible = "xlnx,zynqmp-r5f";
+                reg = <0x0 0x0 0x0 0x10000>, <0x0 0x20000 0x0 0x10000>;
+                reg-names = "atcm", "btcm";
+                power-domains = <&zynqmp_firmware PD_RPU_0>,
+                                <&zynqmp_firmware PD_R5_0_ATCM>,
+                                <&zynqmp_firmware PD_R5_0_BTCM>;
+                memory-region = <&rproc_0_fw_image>, <&rpu0vdev0buffer>,
+                                <&rpu0vdev0vring0>, <&rpu0vdev0vring1>;
+                mboxes = <&ipi_mailbox_rpu0 0>, <&ipi_mailbox_rpu0 1>;
+                mbox-names = "tx", "rx";
+            };
+
+            r5f@1 {
+                compatible = "xlnx,zynqmp-r5f";
+                reg = <0x1 0x0 0x0 0x10000>, <0x1 0x20000 0x0 0x10000>;
+                reg-names = "atcm", "btcm";
+                power-domains = <&zynqmp_firmware PD_RPU_1>,
+                                <&zynqmp_firmware PD_R5_1_ATCM>,
+                                <&zynqmp_firmware PD_R5_1_BTCM>;
+                memory-region = <&rproc_1_fw_image>, <&rpu1vdev0buffer>,
+                                <&rpu1vdev0vring0>, <&rpu1vdev0vring1>;
+                mboxes = <&ipi_mailbox_rpu1 0>, <&ipi_mailbox_rpu1 1>;
+                mbox-names = "tx", "rx";
+            };
         };
+    };
 
-        r5f-1 {
-            compatible = "xlnx,zynqmp-r5f";
-            power-domains = <&zynqmp_firmware 0x8>;
-            memory-region = <&rproc_1_fw_image>, <&rpu1vdev0buffer>, <&rpu1vdev0vring0>, <&rpu1vdev0vring1>;
-            mboxes = <&ipi_mailbox_rpu1 0>, <&ipi_mailbox_rpu1 1>;
-            mbox-names = "tx", "rx";
+  - |
+    //Lockstep configuration
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        remoteproc@ffe00000 {
+            compatible = "xlnx,zynqmp-r5fss";
+            xlnx,cluster-mode = <1>;
+
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges = <0x0 0x0 0x0 0xffe00000 0x0 0x20000>,
+                     <0x0 0x20000 0x0 0xffe20000 0x0 0x20000>;
+
+            r5f@0 {
+                compatible = "xlnx,zynqmp-r5f";
+                reg = <0x0 0x0 0x0 0x20000>, <0x0 0x20000 0x0 0x20000>;
+                reg-names = "atcm", "btcm";
+                power-domains = <&zynqmp_firmware PD_RPU_0>,
+                                <&zynqmp_firmware PD_R5_0_ATCM>,
+                                <&zynqmp_firmware PD_R5_0_BTCM>;
+                memory-region = <&rproc_0_fw_image>, <&rpu0vdev0buffer>,
+                                <&rpu0vdev0vring0>, <&rpu0vdev0vring1>;
+                mboxes = <&ipi_mailbox_rpu0 0>, <&ipi_mailbox_rpu0 1>;
+                mbox-names = "tx", "rx";
+            };
+
+            r5f@1 {
+                compatible = "xlnx,zynqmp-r5f";
+                reg = <0x1 0x0 0x0 0x10000>, <0x1 0x20000 0x0 0x10000>;
+                reg-names = "atcm", "btcm";
+                power-domains = <&zynqmp_firmware PD_RPU_1>,
+                                <&zynqmp_firmware PD_R5_1_ATCM>,
+                                <&zynqmp_firmware PD_R5_1_BTCM>;
+                memory-region = <&rproc_1_fw_image>, <&rpu1vdev0buffer>,
+                                <&rpu1vdev0vring0>, <&rpu1vdev0vring1>;
+                mboxes = <&ipi_mailbox_rpu1 0>, <&ipi_mailbox_rpu1 1>;
+                mbox-names = "tx", "rx";
+            };
         };
     };
 ...
-- 
2.25.1

