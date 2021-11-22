Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064CFC433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Nov 2021 05:39:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231514AbhKVFmQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Nov 2021 00:42:16 -0500
Received: from mail-sn1anam02on2053.outbound.protection.outlook.com ([40.107.96.53]:7047
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229525AbhKVFmP (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Nov 2021 00:42:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBVnnSzEeAHt3x3xbW1axD7CZO1vbgmv5uzpiZilSK7MU1CVU8sqadR3LDgEAt4cMkSZ/ml29kPZSSgctTGL0vTKwabED9KILsrEdPcd/jmW4zrzCGesA7AdFCRQ5At4FT7tBZ/ehQlKCAgq604Rum46bxnLaePUtzjfpANkVFVbDsUl0YfhgRdop9GCafGjR/TSMyhKBVeH7vv1VENvRxOe2LS/Yb07sjUBYU/+WojHFIJWXrkSFjV5uKj/lBszJQ8nJSiyadfzh9W3L//87apVJaz2Xx0IkrwAoi0zFlvSHzLH4cWn865GQ+0xuy8o4I0JtxrJHQerfsWhjahsJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8HcFGqsF3BA7yhHei3NHIASp+VY4//V6sgMUBdzeDM=;
 b=EitMHn0hRgFPEZwPXZOEAH4BaxIQQW4cE0HrJdOCcmMugKyzko+K5oQAB6VUIItHWpX2E0EbohkYW3s8wKMOv9IXRE5Pvk3t0fKJ7zQY7nAvE1gPCzIOLDY9CvLF1mX5Efxu852DTkKu3pTgmI+5HAwQdYGlXeUZzmKG4iFJ2yh51IzWr8z5gGEHz42KW5XU03i8An1u93e+LasH1nRXFNpv3jJlzBj7Dk0zThuEKhj+1HtWFekjecWw3xx3wwuL6a1WSkLXSEASTm2iqAdIREcvynO/rIlUTmSkhBnUiveLRou770Mywyhvt1dmUkAnU+iMTbySlRWcd2i5Q1Ww4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8HcFGqsF3BA7yhHei3NHIASp+VY4//V6sgMUBdzeDM=;
 b=eWozUcVYiAXU5axrrDUbUkW91SSpKBcviYaRQUSGS60s+ExFJPg7BWDqwwnmErG4MHl1T8Lqvo50zHyqNieVV0UUyD+gP2M6XsFBhUBzPegQP51w3WoIK8vm/ysj5niIQX4OTecngBTA4fmAwbInyWzRmjb5Ai3448JabqORyXA=
Received: from SN4PR0201CA0060.namprd02.prod.outlook.com
 (2603:10b6:803:20::22) by BY5PR02MB7092.namprd02.prod.outlook.com
 (2603:10b6:a03:21f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 05:39:03 +0000
Received: from SN1NAM02FT0048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:20:cafe::91) by SN4PR0201CA0060.outlook.office365.com
 (2603:10b6:803:20::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Mon, 22 Nov 2021 05:39:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0048.mail.protection.outlook.com (10.97.4.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 05:39:03 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 21 Nov 2021 21:39:03 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 21 Nov 2021 21:39:03 -0800
Envelope-to: bjorn.andersson@linaro.org,
 mathieu.poirier@linaro.org,
 robh+dt@kernel.org,
 laurent.pinchart@ideasonboard.com,
 bill.mills@linaro.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.3.14] (port=59046 helo=xsjtanmays50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <tanmay.shah@xilinx.com>)
        id 1mp22h-000BOC-6A; Sun, 21 Nov 2021 21:39:03 -0800
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
Subject: [PATCH 1/6] dt-bindings: remoteproc: Add Xilinx RPU subsystem bindings
Date:   Sun, 21 Nov 2021 21:38:51 -0800
Message-ID: <20211122053856.1342859-2-tanmay.shah@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122053856.1342859-1-tanmay.shah@xilinx.com>
References: <20211122053856.1342859-1-tanmay.shah@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 783bf444-9ff1-4cb2-e873-08d9ad7a64a7
X-MS-TrafficTypeDiagnostic: BY5PR02MB7092:
X-Microsoft-Antispam-PRVS: <BY5PR02MB70928E1B55B640EF789221F3CA9F9@BY5PR02MB7092.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4/CEFvFYnL+HnDzrty9s6Kux+nYUTUpNtEZWkKDwYyF56e0ppfraK8pOmF6o7ViD3zFIEl7p139aB8Z6P6GWhy9s4h9HSnmxF/fxXU5Ayx1T7ZDK9fYJh34N4vl8ryh3fsptvg+nOg0CJ2KceJ/4JFm7NbKsdAwOcLzTJQUSwiBbk4xpmQI4r051Rk+53l+lx13wlYqMh22PjcQtxoSoX5ZKvHQEF0ikaiRjyl0anKGv6ffd0ixjMHXDvu2mqmfsXnEFqSDpiJQXWlaNdztb3BHRijIMz4Q143jiMbvYUSQAViYlMCasWwgvUzOMeh//B09vFNOU1g6oQ0Oa6TC8kS2DwruSaNhBLPwe/S7E+wFDR9mu7ESSDwKcTvzecoq+uUNX4ddJZOAIw2qGUxBmWJUZct2bTrN14i94YDVpgWsuJxVauFnQcSjz+ubjtS0yZT5aLXNenDCw3lZ1nk6eEOCbStZ1Tk3sXJnbG14y42tWz+33VFAnXGm7x2PIZQ8l0mAtadqf4WwzEhxYjKVgURrq31Zymh4AtmDfW0dpRz15mDLOYAifEd+SS7Vw7wM+XuQCJYii+Moiw/NDk3zeHFwT9xQZVBgRqtMYiUlbEibzr9R1edYqf18KMFj6yQ12qVB7Tm+fViEgdbeolla3jEN/+lX8QcsOQZGmSKJMsKTGWhntDo7hddybrbWatc6gzuCKG2F53MXCzvGj9ppE4YzurRW19EwyBq5DHEb4yfFmwnN5g+lwVP53dyrzyURTK5ywS5m7DAE7kChl8ZXlPmSVeqRjyYRuil0JViBiEHSFDW3yGO3zkMLqyWVOx/qEfAhDhSc7AgtmsWe4OoqhXqw60XyO7N9pqJZcg5rwzmM=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(7696005)(508600001)(83380400001)(966005)(36860700001)(356005)(82310400003)(36906005)(7636003)(6636002)(5660300002)(26005)(186003)(44832011)(4326008)(9786002)(8676002)(2906002)(8936002)(36756003)(1076003)(110136005)(2616005)(54906003)(426003)(336012)(6666004)(47076005)(70586007)(316002)(70206006)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 05:39:03.5167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 783bf444-9ff1-4cb2-e873-08d9ad7a64a7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0048.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB7092
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Xilinx ZynqMP platform has dual-core ARM Cortex R5 Realtime Processing
Unit(RPU) subsystem. This patch adds dt-bindings for RPU subsystem (cluster=
).

Signed-off-by: Tanmay Shah <tanmay.shah@xilinx.com>
---
 .../bindings/remoteproc/xlnx,r5f-rproc.yaml   | 139 ++++++++++++++++++
 include/dt-bindings/power/xlnx-zynqmp-power.h |   6 +
 2 files changed, 145 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xlnx,r5f-r=
proc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,r5f-rproc.ya=
ml b/Documentation/devicetree/bindings/remoteproc/xlnx,r5f-rproc.yaml
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
+  The Cortex-R5F processor implements the Arm v7-R architecture and includ=
es a
+  floating-point unit that implements the Arm VFPv3 instruction set.
+
+properties:
+  compatible:
+    const: xlnx,zynqmp-r5fss
+
+  xlnx,cluster-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The RPU MPCore can operate in split mode(Dual-processor performance)=
, Safety
+      lock-step mode(Both RPU cores execute the same code in lock-step,
+      clock-for-clock) or Single CPU mode (RPU core 0 can be held in reset=
 while
+      core 1 runs normally). The processor does not support dynamic config=
uration.
+      Switching between modes is only permitted immediately after a proces=
sor reset.
+      If set to  1 then lockstep mode and if 0 then split mode.
+      If set to  2 then single CPU mode. When not defined, default will be=
 lockstep mode.
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
+      The RPU is located in the Low Power Domain of the Processor Subsyste=
m.
+      Each processor includes separate L1 instruction and data caches and
+      tightly coupled memories (TCM). System memory is cacheable, but the =
TCM
+      memory space is non-cacheable.
+
+      Each RPU contains one 64KB memory and two 32KB memories that
+      are accessed via the TCM A and B port interfaces, for a total of 128=
KB
+      per processor. In lock-step mode, the processor has access to 256KB =
of
+      TCM memory.
+
+    properties:
+      compatible:
+        const: xlnx,zynqmp-r5f
+
+      power-domains:
+        description: |
+          phandle to a PM domain provider node and an args specifier conta=
ining
+          the r5f0 and r5f1 node id value.
+
+      reg:
+        items:
+          - description: RPU0 and RPU1 control and status registers
+
+      mboxes:
+        items:
+          - description: |
+              Bi-directional channel to send data to RPU and receive ack f=
rom RPU.
+              Request and response message buffers are available and each =
buffer is 32 bytes.
+          - description: |
+              Bi-directional channel to receive data from RPU and send ack=
 from RPU.
+              Request and response message buffers are available and each =
buffer is 32 bytes.
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
+          phandles to one or more reserved on-chip SRAM regions. Other tha=
n TCM,
+          the RPU can execute instructions and access data from, the OCM m=
emory,
+          the main DDR memory, and other system memories.
+
+          The regions should be defined as child nodes of the respective S=
RAM
+          node, and should be defined as per the generic bindings in,
+          Documentation/devicetree/bindings/sram/sram.yaml
+
+      memory-region:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description: |
+          List of phandles to the reserved memory regions associated with =
the
+          remoteproc device. This is variable and describes the memories s=
hared with
+          the remote processor (e.g. remoteproc firmware and carveouts, rp=
msg
+          vrings, ...). This reserved memory region will be allocated on D=
DR memory.
+          See Documentation/devicetree/bindings/reserved-memory/reserved-m=
emory.txt
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
+        compatible =3D "xlnx,zynqmp-r5fss";
+        xlnx,cluster-mode =3D <1>;
+
+        #address-cells =3D <1>;
+        #size-cells =3D <1>;
+        reg =3D <0xff9a0000 0x228>;
+
+        r5f-0 {
+            compatible =3D "xlnx,zynqmp-r5f";
+            power-domains =3D <&zynqmp_firmware 0x7>;
+        };
+
+        r5f-1 {
+            compatible =3D "xlnx,zynqmp-r5f";
+            power-domains =3D <&zynqmp_firmware 0x8>;
+        };
+    };
+...
diff --git a/include/dt-bindings/power/xlnx-zynqmp-power.h b/include/dt-bin=
dings/power/xlnx-zynqmp-power.h
index 0d9a412fd5e0..618024cbb20d 100644
--- a/include/dt-bindings/power/xlnx-zynqmp-power.h
+++ b/include/dt-bindings/power/xlnx-zynqmp-power.h
@@ -6,6 +6,12 @@
 #ifndef _DT_BINDINGS_ZYNQMP_POWER_H
 #define _DT_BINDINGS_ZYNQMP_POWER_H

+#define                PD_RPU_0        7
+#define                PD_RPU_1        8
+#define                PD_R5_0_ATCM    15
+#define                PD_R5_0_BTCM    16
+#define                PD_R5_1_ATCM    17
+#define                PD_R5_1_BTCM    18
 #define                PD_USB_0        22
 #define                PD_USB_1        23
 #define                PD_TTC_0        24
--
2.25.1

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
