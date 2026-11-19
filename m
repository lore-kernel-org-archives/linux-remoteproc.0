Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795125859;
	b=1+IMtkn34g8+2sRmDR4aoNwtRRR/UMfs8vf+9UBbuE0UhmqYj+6R8YY6MlxbjxxbqiHN
	 EAwAlZVEkusT9eZFSynuhNT9+1ixg9xrt7RnkK5SGiYtConsM71ij4N/icIzzpZU4GPY9
	 GDQxl4sAYEwnFzqCdQ8KiWLXzjqTronjmOZzd58ew7HFR9qve16eR+W3KttFPnK3SEiZ9
	 HG9ffxEZmF7iPc8wanNHQBLMQ/cfljs0mo+cxzLoTFbZltmrHj2Srpbe0244PvedlgINQ
	 RQq2dDS6OvF1yEtQWL8NrPCKSWv9hglUzaXK59QMueAuAJ5xcqC2ehO5GJjARJxA5cQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125859;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ofHmu/+jJdB1eQ+949sFthKR9hu3R+4nZxtgL2IvRSQ=;
	b=H51ZjXWfKMyKywS8CSH4ChrIzWi3B6973pF/KnwBxAnw0AD3I7jmxN4m1OBeo6E1qMW8
	 Kdqpx6BmbLIMpB0FoWgsoyxir+z7vTFUQyhEl1KudGJKkHvr+l8sxMG37C54vFQ03ZdK4
	 z6GBLJQO6E/TizdFTN2szGQwV9eUI2N+IFtXHWMsGSoIIq0H1RoTFptUqaMt25fZaIHp6
	 C7wgVAlZo0xvIbaMDHlcYFEE+bGXmQqqQ3JppnDmkGGhmmeA26/QldN/yI7MC3wKPx5Gg
	 2AmjAQqk/+Ub8WwcTeTJxHMIG+bSJG1oN39antkbETJPZKV3EM4fWcB3qoX5M8AHWPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1gaWaZCQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.12
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012012.outbound.protection.outlook.com [52.101.43.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76692606A325;
	Thu, 19 Nov 2026 22:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76692606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1gaWaZCQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpiVNT7JPDX1aaCmWltu/g/Ob9Il3ATCKfn7kuCokz8AgJdRJDHwgLueyDGZNNE6lFP67HPKYLeVdpWIR2/QKCaZGHR1xkw98zcXLi8/crmljhxrvB+sJSbpLJWxRSqL+JMK+12qKKcYc4EjPu3pvbblVu3KoVWQeBSS7hDA46hZNzStmFT+I2Piz0gJWfM1lPM18znVWPTxxw7AqmNYKol7XYiLVUp4iTQ74j3ScW2lygy/7n3QQGK0D+AKvJDJ9jx2+EXZHm8nGFrj+4J/8YhT54S6uAJ++vwnhgpJPovG01aPKxcPvY7yAh0u/D7EKXi3BCR1PyX9QP2m/nR8yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofHmu/+jJdB1eQ+949sFthKR9hu3R+4nZxtgL2IvRSQ=;
 b=HbPsDMk1aqJOIbOi862CG7S6wvg+gV+WfXH7x6zl5LAkksGGURWKtqsvUl8NjXGhXqZyVSq44IZRAWRHi7GKTf4y0Vund+87VqefspuUCbfHpT1cVkfc3VQduv3YDvNfI+wu9ebK3nypyhm2Sketgd5oY5Q3snd5p3IY9iQOsjgYkGXPgNVvt7BrtOXZ1g0H4JHk4/wikL0Pmhn2gd+cb1aR4ajOX7K8ZABYMlxG+ugOz2qy3SjSee2cDBwC9gJhZBVUnL7nBtk5kXjqAin2H2gFTtbtguwjGkXaOAWqNbjxIyeMT/z/7O5WDNFA3Wy7PyDLYTOZCvejQVNsk67hNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofHmu/+jJdB1eQ+949sFthKR9hu3R+4nZxtgL2IvRSQ=;
 b=1gaWaZCQZjodTjpyyXQn9lxBlOe4dr7DXIwpS6dU7DRmKkjfBNqKvBwZw9BlL52WoM7EH4XDva4nwPgMGU+VMTexn/DbB3iIP+B7vM9tSGnlcr7vgSn0/ghVNScT3vDrNm96AugQsAjFxTv1aXFZnXeTVJPAOoEygf+ZJNe2Ywg=
Received: from BN0PR04CA0167.namprd04.prod.outlook.com (2603:10b6:408:eb::22)
 by CH3PR12MB8210.namprd12.prod.outlook.com (2603:10b6:610:129::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 22:04:14 +0000
Received: from BN1PEPF0001854B.namprd05.prod.outlook.com
 (2603:10b6:408:eb:cafe::58) by BN0PR04CA0167.outlook.office365.com
 (2603:10b6:408:eb::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 22:04:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF0001854B.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 22:04:14 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 16:04:11 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 16:04:07 -0600
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 16:04:07 -0600
From: Ben Levinsky <ben.levinsky@amd.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson
	<andersson@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <michal.simek@amd.com>, <tanmay.shah@amd.com>, <ben.levinsky@amd.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/4] dt-bindings: mailbox: Add AMD PL Mailbox IP
Date: Thu, 19 Nov 2026 14:04:02 -0800
Message-ID: <20261119220405.2838553-2-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119220405.2838553-1-ben.levinsky@amd.com>
References: <20261119220405.2838553-1-ben.levinsky@amd.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0001854B:EE_|CH3PR12MB8210:EE_
X-MS-Office365-Filtering-Correlation-Id: 411be705-508b-4ec2-596e-08df46890c51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|1800799024|376014|82310400026|10067099003|56012099006|11063799006|261028144727099003|261021121427099003|261026140227099003|261022105027099003|261102123227099003|261026121527099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	gDOJ1mguQMG38QL9b9j275vEHujMfRE2Y2YZeaicLyEnW2uTbDXRooLfqZieu1e4+fSqg18Ya5vsSDSgp/6cPRs606bP3D+ItccyPKMY9+vcPamiPskyv8pJ90ePin/BdizpoxP8oE762He1s5rgneC3oK59gm3k/DDN5hnOWNWdlOnWFJPSTfg82vQYZ4Ne4sZ7045Tnbm1SLtaxTWdiZX0HcRjJ+twAzH3Mk3zq8Mvgw2b3bB4xamX4tpPJrGIuizqa4c+tLVrf9Bgc+PG24ne+1TpL1sFkk84n973Gp7bSXnrlvvKHGZWHep4VjmumUK3DVc1IYTtju4fHMGGSDtykHSqZjoeoHt6oIa1ctf/bXRHN9mdUU0qFStJ5sUujs8m4kr5gt94hiqxYZfxzdado/OvBh51tWCLCIFOYqZ+5R4tPYnDTiRS/BJtny0itq6k4i823ROQJzPTfu3qUSo2j9l7AKzJnBbxIhz26xwdQu14YHlXANJSkh+0SolnNd/tBnu1Qg4rbLaAgC6wwupvcYOsv6zHMthH4qJbBRNtUoNiCBke5HUvUgwARlcrrIHo4u117oBxJGtnuKsWOJkYg5VbD1aB+YPgpLe9+BcsjfiNWw+rtzMFKQe+9lQrEnLneUGFu82J1s9oVEckwg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(1800799024)(376014)(82310400026)(10067099003)(56012099006)(11063799006)(261028144727099003)(261021121427099003)(261026140227099003)(261022105027099003)(261102123227099003)(261026121527099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hfJ9d17Z5wmpoxKMhUAo8vpNuaemGdaSdJOnICvageQR72Azl6IzDGSkYCxlK+tLlRcTCU9Tt8Ph5PA2W6Uxhg8c/W6A+Jo8LGFw0byHOL2Ras++wJGDqv8i3dbD+lU2aKp2aHX2c3ZKGADd3pNUdyDc0YDV9aAMQLN/Lrb3iSJ1m8r4ZRp0vpVwtLJyn+KiCVqqiCzdb1Yo2ub6NtUV8vwi2b40avXDYqbVD1y6OJP8+OpVztJ2W6oo0GP9Q5EPJvuMT2kDqFvvf3Mfz92t8/p06qKkYacPm8ejInPmBbSowvTbDA9F27ZACiv7pbGVxNiDGu1U3MdFl7N1fFJkSXmZTPbEs6sgYrJZ1hwhaxPVKFu5fyUj2Vy2AECmllwiPr/uxT9kL24VBq22EOzmSAjCsSAXga4K2E7sI0VvV6VjdBwPN/a11I7F8Y6/YA+a
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 22:04:14.0647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 411be705-508b-4ec2-596e-08df46890c51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0001854B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8210

Add a binding for the AMD PL Mailbox, a soft IP used to exchange 32-bit
words between two processors through a pair of FIFOs.

The IP lives in programmable logic and isn't tied to a SoC, so the
compatible names the IP and its version.  The FIFO depth is set when the
design is synthesized and can't be read from the hardware, hence
property amd,pl-mailbox-depth.

Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 .../bindings/mailbox/amd,pl-mailbox-2.1.yaml  | 71 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml b/Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml
new file mode 100644
index 000000000000..50ac14a4cbac
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/amd,pl-mailbox-2.1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AMD Programmable Logic Mailbox IP
+
+maintainers:
+  - Ben Levinsky <ben.levinsky@amd.com>
+
+description: |
+  The AMD Programmable Logic Mailbox IP passes messages between two
+  processors through a pair of FIFOs. Each side of the IP has its own
+  registers, interrupt and clock, and is described by its own node.
+  Channel 0 is used to transmit and channel 1 to receive.
+
+  The Mailbox is a soft IP core instantiated in programmable logic, not a
+  SoC block, so the compatible names the IP core and its version (2.1).
+  The "pl" part distinguishes it from the IPI hardware that can also be
+  used as a mailbox.
+
+properties:
+  compatible:
+    const: amd,pl-mailbox-2.1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  amd,pl-mailbox-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 16
+    maximum: 8192
+    default: 16
+    description:
+      Depth of the send and receive FIFOs in 32-bit words. The depth is the
+      C_MAILBOX_DEPTH parameter chosen for each IP instance when the design
+      is synthesized, so instances in one design can differ, and it cannot
+      be read from the registers. Must match the synthesized depth.
+
+  '#mbox-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - '#mbox-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mailbox@b2060000 {
+        compatible = "amd,pl-mailbox-2.1";
+        reg = <0xb2060000 0x10000>;
+        interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&pl_clk>;
+        amd,pl-mailbox-depth = <16>;
+        #mbox-cells = <1>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index ca1c59e1fc59..dc6a835f7bbc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1315,6 +1315,12 @@ S:	Supported
 T:	git https://gitlab.freedesktop.org/agd5f/linux.git
 F:	drivers/gpu/drm/amd/pm/
 
+AMD PROGRAMMABLE LOGIC MAILBOX DRIVER
+M:	Ben Levinsky <ben.levinsky@amd.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml
+
 AMD PSTATE DRIVER
 M:	Huang Rui <ray.huang@amd.com>
 M:	Mario Limonciello <mario.limonciello@amd.com>
-- 
2.34.1

