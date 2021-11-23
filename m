Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E191CC4332F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Nov 2021 06:21:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233692AbhKWGYH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Nov 2021 01:24:07 -0500
Received: from mail-bn8nam12on2082.outbound.protection.outlook.com ([40.107.237.82]:28111
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229953AbhKWGYE (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Nov 2021 01:24:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2OaRn/oVsfXK3uCyW5MmhaAoZIKrsssz/O/hcld8jC7vfY/ITuMdRi1P7hc6LxYltQDP8Pp3VRCSd6MUBogiRGi/utlyHgAZdvLDC5zrWAc1exNhMWazsW9XTrdJsq5O1Y4nhgEiWJ7JZeBCho00BFmYellK5a/vS+Ishv3VPJ973jF4PCwbmMrKnTHR0JxiEe+rah6Yrn1vntQCgO620S4kK0IuJ8QpvooasFtHKg81V99JHwGb21+kW91XBWwdxZMJKahYP+AOOt4ARpQkfVVyKGT9DC7RUeRTjdVR7iTFDXPI1uH17OlbVUEzx8yHHKG41Vtn6p4hJIJKj5nsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lW4TlLD5Klk7r8xSlx5CNV2Ywv+FoK0fGE97sYHEX4=;
 b=hssdxuDXpOnKvJOWw6BcQGtP1jxJDRY7Sv05VGmywYpIirHztxpB7xsLVPxFOklJSGytao6LeR+e+0Nm7OGSEx3W+kucAZ7J2WLq7AAuI4968+ZZAxqtHpX88/JM0dTm+M5Z2GXXIoG0oLXgdivuWWw6za6jY02a3me3/lAv63wJgePBWMbupnC0u28Zlp8yGFHZTDXmpmhnaIYj7dJ5IyQbVZq7HkHfGN7GhVr5rglxvLZu/oJuexXdGnkkl3dhMxOlIktc6WSJQVX/WmTtFTUyu5eLYM+Gf1xCI3n9jrdVYMUDrD/zmnvMcFlmnEtUNWG9+6PXhroYpeNCloWI+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lW4TlLD5Klk7r8xSlx5CNV2Ywv+FoK0fGE97sYHEX4=;
 b=cMn58Y0JOXgnrMK06n3J0tm9F9PzsOv7cFU/s/FK0xI/nAE/4VA78eLm1CIogV9gVu4YIIpQF3RYzDOmBPHLgeVj96hZHGxyQpiVGJFEFxTOR46tipfdCgbNXsw3Jc7a95s/aEA/UAAtUGQ8XOk020Hj+EsCAOD02pBdKskZVAU=
Received: from SA9PR13CA0137.namprd13.prod.outlook.com (2603:10b6:806:27::22)
 by CH0PR02MB8259.namprd02.prod.outlook.com (2603:10b6:610:fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Tue, 23 Nov
 2021 06:20:54 +0000
Received: from SN1NAM02FT0045.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:27:cafe::a9) by SA9PR13CA0137.outlook.office365.com
 (2603:10b6:806:27::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.11 via Frontend
 Transport; Tue, 23 Nov 2021 06:20:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0045.mail.protection.outlook.com (10.97.5.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 06:20:54 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 22 Nov 2021 22:20:53 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 22 Nov 2021 22:20:53 -0800
Envelope-to: bjorn.andersson@linaro.org,
 mathieu.poirier@linaro.org,
 robh+dt@kernel.org,
 laurent.pinchart@ideasonboard.com,
 bill.mills@linaro.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.3.14] (port=33042 helo=xsjtanmays50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <tanmay.shah@xilinx.com>)
        id 1mpPAj-0001Zw-Oi; Mon, 22 Nov 2021 22:20:53 -0800
From:   Tanmay Shah <tanmay.shah@xilinx.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ben Levinsky <ben.levinsky@xilinx.com>,
        Bill Mills <bill.mills@linaro.org>,
        Sergei Korneichuk <sergei.korneichuk@xilinx.com>,
        Tanmay Shah <tanmay.shah@xilinx.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 1/6] dt-bindings: remoteproc: Add Xilinx RPU subsystem bindings
Date:   Mon, 22 Nov 2021 22:20:45 -0800
Message-ID: <20211123062050.1442712-2-tanmay.shah@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123062050.1442712-1-tanmay.shah@xilinx.com>
References: <20211123062050.1442712-1-tanmay.shah@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 305bf327-5b19-4af3-db35-08d9ae4967b0
X-MS-TrafficTypeDiagnostic: CH0PR02MB8259:
X-Microsoft-Antispam-PRVS: <CH0PR02MB82592857BC0B86D6D600D961CA609@CH0PR02MB8259.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y74LvEE0vzA3Rw3UNrhsWVyJ7yRvIUmuIygiyQ5RELrL+/H2JUMrrZ6he0D0LE9a0dywumNERrxpPVQtIfuhGWBPVrIY8uuZKLYzMQmSAOyjP/5itgrHUX+b4qQE9dvYrZ8YolHbZzwdgGBECe3SuhMDPzUIgTfXpOkjJFWgmVgsow7NaYtr5qb0FvKIxstRcwf0w812/xnfOGHftoTZp/LWMQaaXzlt1skVJ0P1UjBIa62YdX3s984/VgmqwxYhDLnWUp51HWptas6sKlx7pBO1GZF3NgGubhRmAi8tfD009Bnsqi8sSWCwkZiyKS//wA787abXe309bcY/VTuJt+Y9USqEqiaciYKbM9tQVBCY52MoxknKq2TBo5ogSkkPXGPQaqX9DlDbBm79YU719jdK8sQf5mzUyjIAnhksmsEoymvpdu282Pb5TQuQYeYCo+2gdXzzypuWoiKIvb/4ouoix30oanqknbWygytbZOva2fgJGtVt+h2mK0OdeZ1oDlg9P5Rw0326dCF+kcyCaUV0pFTv0YogWtrmITMtHf2pt0+PqVSS42W7K3YqZVBr8Gt0s64iPSISWrk7516tDv8CtXAk0UjqZyd3GMP0uNKEjiGmjKAc8r0hNIMQj+XzaPzXdZpj6/68hYF2VL2CG5HPRqjFIDs+inyXI5MajQSL8twHi1MqHdA51LH7QFsrVuEhRcPMznpuEjxUc8zeC5Q/RH6E3dumNc8hTWuVGkUEVQ7Kb6aiqQe3BSqC+pZKVJnwW1ldaJMDDUm3V88QFl+z5F70D8qSVCBsBIV6aUEKDoa6KUcLnvbs+82tMLXEC0ZvFVWKpJjg7F3UMgyjQtZyqEMo6ZO8JwnFMjeEShg=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(1076003)(36906005)(7696005)(7636003)(426003)(83380400001)(6636002)(316002)(8936002)(110136005)(5660300002)(70586007)(6666004)(356005)(44832011)(82310400004)(36756003)(2906002)(4326008)(9786002)(54906003)(186003)(70206006)(8676002)(336012)(26005)(36860700001)(966005)(2616005)(508600001)(47076005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 06:20:54.4275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 305bf327-5b19-4af3-db35-08d9ae4967b0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0045.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8259
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Xilinx ZynqMP platform has dual-core ARM Cortex R5 Realtime Processing
Unit(RPU) subsystem. This patch adds dt-bindings for RPU subsystem (cluster).

Signed-off-by: Tanmay Shah <tanmay.shah@xilinx.com>
---
 .../bindings/remoteproc/xlnx,r5f-rproc.yaml   | 139 ++++++++++++++++++
 include/dt-bindings/power/xlnx-zynqmp-power.h |   6 +
 2 files changed, 145 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xlnx,r5f-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/xlnx,r5f-rproc.yaml
new file mode 100644
index 000000000000..d43f0b16ad7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/xlnx,r5f-rproc.yaml
@@ -0,0 +1,139 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/xlnx,r5f-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx R5F processor subsystem
+
+maintainers:
+  - Ben Levinsky <ben.levinsky@xilinx.com>
+  - Tanmay Shah <tanmay.shah@xilinx.com>
+
+description: |
+  The Xilinx platforms include a pair of Cortex-R5F processors (RPU) for
+  real-time processing based on the Cortex-R5F processor core from ARM.
+  The Cortex-R5F processor implements the Arm v7-R architecture and includes a
+  floating-point unit that implements the Arm VFPv3 instruction set.
+
+properties:
+  compatible:
+    const: xlnx,zynqmp-r5fss
+
+  xlnx,cluster-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The RPU MPCore can operate in split mode(Dual-processor performance), Safety
+      lock-step mode(Both RPU cores execute the same code in lock-step,
+      clock-for-clock) or Single CPU mode (RPU core 0 can be held in reset while
+      core 1 runs normally). The processor does not support dynamic configuration.
+      Switching between modes is only permitted immediately after a processor reset.
+      If set to  1 then lockstep mode and if 0 then split mode.
+      If set to  2 then single CPU mode. When not defined, default will be lockstep mode.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  reg:
+    items:
+      - description: RPU subsystem status and control registers
+
+patternProperties:
+  "^r5f-[a-f0-9]+$":
+    type: object
+    description: |
+      The RPU is located in the Low Power Domain of the Processor Subsystem.
+      Each processor includes separate L1 instruction and data caches and
+      tightly coupled memories (TCM). System memory is cacheable, but the TCM
+      memory space is non-cacheable.
+
+      Each RPU contains one 64KB memory and two 32KB memories that
+      are accessed via the TCM A and B port interfaces, for a total of 128KB
+      per processor. In lock-step mode, the processor has access to 256KB of
+      TCM memory.
+
+    properties:
+      compatible:
+        const: xlnx,zynqmp-r5f
+
+      power-domains:
+        description: |
+          phandle to a PM domain provider node and an args specifier containing
+          the r5f0 and r5f1 node id value.
+
+      reg:
+        items:
+          - description: RPU0 and RPU1 control and status registers
+
+      mboxes:
+        items:
+          - description: |
+              Bi-directional channel to send data to RPU and receive ack from RPU.
+              Request and response message buffers are available and each buffer is 32 bytes.
+          - description: |
+              Bi-directional channel to receive data from RPU and send ack from RPU.
+              Request and response message buffers are available and each buffer is 32 bytes.
+        minItems: 1
+
+      mbox-names:
+        items:
+          - const: tx
+          - const: rx
+        minItems: 1
+
+      sram:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        minItems: 1
+        description: |
+          phandles to one or more reserved on-chip SRAM regions. Other than TCM,
+          the RPU can execute instructions and access data from, the OCM memory,
+          the main DDR memory, and other system memories.
+
+          The regions should be defined as child nodes of the respective SRAM
+          node, and should be defined as per the generic bindings in,
+          Documentation/devicetree/bindings/sram/sram.yaml
+
+      memory-region:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description: |
+          List of phandles to the reserved memory regions associated with the
+          remoteproc device. This is variable and describes the memories shared with
+          the remote processor (e.g. remoteproc firmware and carveouts, rpmsg
+          vrings, ...). This reserved memory region will be allocated on DDR memory.
+          See Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+
+    required:
+      - compatible
+      - power-domains
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    r5fss: r5fss@ff9a0000 {
+        compatible = "xlnx,zynqmp-r5fss";
+        xlnx,cluster-mode = <1>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        reg = <0xff9a0000 0x228>;
+
+        r5f-0 {
+            compatible = "xlnx,zynqmp-r5f";
+            power-domains = <&zynqmp_firmware 0x7>;
+        };
+
+        r5f-1 {
+            compatible = "xlnx,zynqmp-r5f";
+            power-domains = <&zynqmp_firmware 0x8>;
+        };
+    };
+...
diff --git a/include/dt-bindings/power/xlnx-zynqmp-power.h b/include/dt-bindings/power/xlnx-zynqmp-power.h
index 0d9a412fd5e0..618024cbb20d 100644
--- a/include/dt-bindings/power/xlnx-zynqmp-power.h
+++ b/include/dt-bindings/power/xlnx-zynqmp-power.h
@@ -6,6 +6,12 @@
 #ifndef _DT_BINDINGS_ZYNQMP_POWER_H
 #define _DT_BINDINGS_ZYNQMP_POWER_H
 
+#define		PD_RPU_0	7
+#define		PD_RPU_1	8
+#define		PD_R5_0_ATCM	15
+#define		PD_R5_0_BTCM	16
+#define		PD_R5_1_ATCM	17
+#define		PD_R5_1_BTCM	18
 #define		PD_USB_0	22
 #define		PD_USB_1	23
 #define		PD_TTC_0	24
-- 
2.25.1

