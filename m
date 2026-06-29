Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010068.outbound.protection.outlook.com [40.93.198.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADBD2D3A7C;
	Mon, 29 Jun 2026 16:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751218; cv=fail; b=lqW6QczmErYXBIncFkgLIPSttsbKDjwPvICKvFxwv/17eU/2jb8zPbEIoquZgdSVG30A63aJGh0SumEj1NFeR0rjMs2rsHWi6N5py1zE0DsYn/UrWeAZq2lWbDUNJ9pIa01ckkYWrXh2/TRrAVP0gLxOv+9sC0CeJgljOfocsnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751218; c=relaxed/simple;
	bh=Na/J+u+Y3yBkyW86xBhKkPDZSdqf/Y1xIfv6qkNxFrU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G3cSQAC+Wws0TX+lk7ioAkMw/S4UlhhWmC5QY7kC7PU23xtYpd8PoqVUMrBCtE9C7SbJUrNTv+liy9yHMIHftqoXmjNgTSjsYTKm6hh8k9O2cKbh+ISIdkyqrnhr0iTFZ3jyZD7Y3oUZDon6fBQ9juGz6Pds1YZ11B22A+uUfTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yrON52Hw; arc=fail smtp.client-ip=40.93.198.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yrON52Hw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qarcUMgwgkRM6CU2KRqadYOnqIQ8fUoAxR86vurPkipU+xFQGiltycox+2c9vlsDvTQxMqdJJzSBrtuH8/ty7bsTWwGTREpRI2A/LcBsz+JrBQVG/VSi/V0ZLZ3kWEALhUYiHoOlPPckBw0y+WbBWy4ri8NkBuF3Lb4kBa8VKoW8Hf+Kcw3xxB+qWlLzYh0op9mTJ44Bu8L1uDiVpRXjOKodu7zVK8mNrMvRtCOyniPYkxxSD4Mzs+EAbo3QRy9Ttr0hU7F6y2eTC4tQhqjetwMT7iOioDDRjChMXIHc6QIMVtPiGl0HFbNvI0xv+kx6AJufWPS2ejx/wdDDKVT46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/rwYjqSvBpD6nWLcLf0Vs/D6sViWNp//gj1lWdwu1k=;
 b=qF+BNBDH3KiPIdMrfhS/Hi7Qn0bUeLTrADi8mV1MhHAuTAmDa9UtbrjEuJQk5rfdAJW5rEAUkUOOdXDgxPFPdlHFTDR6KuHPPkt/jHUbb8EsEsm/kXUCrpdAn894uSlA1cvfbcdZavT/hph32A8lb2o4hH4DjzFrhKsBegjFo/Rjf3UaUIwam6XDenjgOQBdi91gPWtIENmcHqk7olVgWL7cNKBEZWg6shL3jCvDi/u/x4zg0g8GqCEJXBI8V7cWuZdkj9/C3DD4rZZKOIb5+joYlrRFtAbZ2JOQPTahGBbfOVmtIQucmsDNbg9P9hXT/3Uxy6xX9EenCoeOdW4E+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/rwYjqSvBpD6nWLcLf0Vs/D6sViWNp//gj1lWdwu1k=;
 b=yrON52Hw3bcupxQlD/nghTeYaJisQmtrpIhNuHUDXRUUaRdqxOC0IHa6FUx4XOZLkLbWB2Uz+UGr5SicwNxk9XLtZ4rGrDnL01G0TKDtiAbIGXpuPttxfsu8Ab8ADPcEbbK2Twu7S8hPszVoZOf9Qk9gKUO/zLRxYQyTT1Oc08Y=
Received: from MW4PR04CA0115.namprd04.prod.outlook.com (2603:10b6:303:83::30)
 by DS0PR12MB9275.namprd12.prod.outlook.com (2603:10b6:8:1be::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 16:40:07 +0000
Received: from MWH0EPF000C6185.namprd02.prod.outlook.com
 (2603:10b6:303:83:cafe::33) by MW4PR04CA0115.outlook.office365.com
 (2603:10b6:303:83::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 16:40:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6185.mail.protection.outlook.com (10.167.249.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 16:40:07 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 11:40:05 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 09:40:05 -0700
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 29 Jun 2026 11:40:04 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ben.levinsky@amd.com>, <tanmay.shah@amd.com>, <michal.simek@amd.com>
Subject: [PATCH v4 1/2] dt-bindings: remoteproc: document AMD BRAM-based rproc
Date: Mon, 29 Jun 2026 09:40:02 -0700
Message-ID: <20260629164003.3940208-2-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629164003.3940208-1-ben.levinsky@amd.com>
References: <20260629164003.3940208-1-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6185:EE_|DS0PR12MB9275:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bd92067-f2c0-44c1-22f3-08ded5fd13f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|56012099006|3023799007|11063799006|20046099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xeFZGwdm+Nd9ymfCxo15rx3wieChpVE9cLlq38xlS/BeS/D9DK1p5VUf1rF9CKxwbkjPAH9+Rb3LE4osEr9Sn4PSOJzf6rUjpewg+xSmt+1EOooaWftKaRuSmSF2nss5XtkM8O3olb4KoeO0MkGLIdMUBsBEEdy/d2cjTGxt/n5zMS+ACq7cSW3oQPALxjf/5XrPnbAtcvdRE5kYksBTqvUMKPzc8pCeXPIDzoR7Ib1/1Fhso3bvC3sKaN/kqWHxCst+TA6wkzOVVfpF8i/uFOZLVMfAaNjJv2YU2nMs146f5kKqthTR5ArIwDIRAPKax40OyccSgaQAeE9aXUZhOdIpe1W/47SvF+YauyKZTdljsUuATHRpLGug92/OqcM8UXVSbUHhg/i8qdS3nwB+hRXZ3NB5ht1FHpxM/iG8otyG629InYGiHxlCuv5cH6nTxG6Lec7WMgELM22L2VRXbfGlU4LRPxbpUz9rX+SmqD8AjNqbftvzE7SBbGuZ5Xh4ml0rQFNs6hlf2lu46xXf3az3H3HYY8ISiufUMx/0BI9xdDtm1Yrbil5TWb0HSRQgO5ZKAmFhx7MVQf+WONABhJ20VCvmRS2H3e45J+0WlJFrgr3kByvfCB4oCxyb/O0f05gS3XLOjhH2usA5DTV7pw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(56012099006)(3023799007)(11063799006)(20046099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7K/BkPkw2/V9H/yT+rskvpba749SvMLha+v6F5da1DWKTEOBRkYhzTsQ8RfjOrnwN4jwNQcyap7p6WfWDtQTOxlVR2GKPX1wtLiYAL9iA238VWnHHNFfo2x8jINUdm5VZKCJVSuU9/5yvmSgIgejm4Z9pyZpFcHYGfJNxzAljupkqi3O0/tg56T1brDbEwsdLUh2ybljLjlibFrs8CWDGykH3BPhJNpd5x0WQi8DjfnEDU40xUrAgRWVkciqZk0XZ+ECuYH+XCeN29baVm1ALFenkIMQ5jpjlE8rXBqIpP5CWnipoqLEVlzqB82FviPAUuL0pMBBy35lXrVbvIL+PeRAXt5xiyzHWsFkMflWXN2Lnqrz7k361arck2JPIxnAF/8ep34BdmX8NYjiMjYOxQ4Ykrs9Y9EMrd97QoswXK63fJzGieZLS4twoIAns5wJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 16:40:07.0634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd92067-f2c0-44c1-22f3-08ded5fd13f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6185.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9275

Describe an AMD BRAM-based remote processor controlled through the
remoteproc framework.

The binding models a soft-core processor subsystem instantiated in AMD
programmable logic and using dual-port BRAM for firmware storage and
execution. The remoteproc device is represented as a child node whose
reg property describes the firmware memory window in the processor-local
address space. The parent bus node provides standard devicetree address
translation through ranges so Linux can access the same BRAM through the
system physical address space.

A clock input feeds the soft-core processor subsystem, and an active-low
reset GPIO holds the processor in reset until firmware loading
completes. The firmware-name property is optional.

Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 .../bindings/remoteproc/amd,bram-rproc.yaml   | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
new file mode 100644
index 000000000000..c4fadf25c230
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/amd,bram-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AMD BRAM-based Remote Processor
+
+maintainers:
+  - Ben Levinsky <ben.levinsky@amd.com>
+
+description: |
+  Soft-core processor subsystem instantiated in AMD programmable logic and
+  using dual-port BRAM for firmware storage and execution.
+
+  Hardware Architecture:
+
+    Host (PS)                        Programmable Logic (PL)
+    =========                        ======================
+
+    AXI Interface -----------------> AXI BRAM Controller (Host Port)
+                                             |
+                                             | Port A
+                                             v
+                                     +-----------------+
+                                     |  Dual-Port BRAM |
+                                     | (shared memory) |
+                                     +-----------------+
+                                             ^
+                                             | Port B
+                                             |
+                                     AXI BRAM Controller (Soft-core Port)
+                                             ^
+                                             | LMB
+                                             |
+                                     Soft-core CPU (MicroBlaze/V)
+
+    GPIO --------------------------> Proc Sys Reset ----> CPU Reset Signal
+
+    Clock -------------------------> Clock Distribution -> CPU Clock
+
+  Memory Architecture:
+
+    The dual-port BRAM allows simultaneous access from both processors:
+      - Port A: Connected to the host AXI BRAM controller for firmware loading
+      - Port B: Connected to the soft-core local memory bus for execution
+
+  The reg property describes the executable BRAM window in the processor-local
+  address space. The parent bus node translates that window to the system
+  physical address space by using standard devicetree address translation
+  through ranges. A clock input and a reset GPIO control the subsystem.
+
+properties:
+  compatible:
+    oneOf:
+      - const: xlnx,zynqmp-bram-rproc
+      - items:
+          - enum:
+              - amd,versal2-bram-rproc
+              - xlnx,versal-bram-rproc
+              - xlnx,versal-net-bram-rproc
+          - const: xlnx,zynqmp-bram-rproc
+
+  reg:
+    maxItems: 1
+    description:
+      Processor-local address and size of the BRAM firmware memory window,
+      as seen by the soft-core processor (typically 0x0 for reset vector).
+      The parent bus ranges property must translate this window to the
+      corresponding system physical address.
+
+  clocks:
+    maxItems: 1
+    description:
+      Clock input for the soft-core processor subsystem.
+
+  firmware-name:
+    maxItems: 1
+    description:
+      Name of the firmware ELF file to load.
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      GPIO specifier controlling the soft-core reset input.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    remoteproc@0 {
+      compatible = "xlnx,zynqmp-bram-rproc";
+      reg = <0x0 0x40000>;
+      clocks = <&pl_clk>;
+      firmware-name = "firmware.elf";
+      reset-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
+    };
+...
-- 
2.34.1

