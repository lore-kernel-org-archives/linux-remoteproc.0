Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012034.outbound.protection.outlook.com [40.107.200.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC0B472F65;
	Wed, 14 Oct 2026 21:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013680; cv=fail; b=oQie1byDvMmqlsQTnH44WflvihSdMdqdv3OG0dHBrKYw0CTidKAbe/ghBPNz5ou5RS16rqEMsRXUj5ax7Y8VzlbBDUa62wnKwN0X/yHHyqXjPbM0XAGizsI1u5Va3Lx4wWLhV8TopW9aZM0NMe2SIlxcTIQcfBv6qMIdGjr4i0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013680; c=relaxed/simple;
	bh=Sc5c0/MQuamU9ZwbFtOQTvAryAwV0B1A+8Kx47DIiVs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a/1iEwww06NSaUU8uyeMZZdLEEsoUv4WVubw/N7YQkXWKQWgsBGtL8o1lqSvpcfZbhu/O1qWtYovp+OObEisTZwFiwAzxtWd53fIYyyNYj2yddyR5/yQ1haVwjZKcJUkcihBTgVrkXWOmjWifslErEWoI22BYaiLeIjb0y3V5Eg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JwJHq5ZG; arc=fail smtp.client-ip=40.107.200.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JwJHq5ZG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbzMYE03kSE0H1jHDLMPzfr5GqGBQig/R6z+kumo3Sfj4OjO2sLufRCL/XCh5UXrLTI03z0AYeL1relpi7VsVchvuXyC1fiE+trNDkeRkMKKQhMV/VHe/JGs6SvB6liADI+pdQxMej6U+x+LUb8WfdjpDWdxX78kfCsQX1RFY9Rvx4F3ESF2Znw54vIxJcEMSteqxpQD7mLQHeNOh0DoMXaw2Tz+Hirt5MG3mbW4f3qCoUeUxOkvGm2nKAG6Ry4bKjJ8ZRLFb46QpvvSfyOwLrKd4qOjUiE7hre98abiM/gBnOS9EwsgvHVrYbpsUp2Hhsvm/L5lO5ef/aEK83y7BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rjin0yiZC6oa0pczK8YkLPBsRcQtD4/nEhc7ROIWL+M=;
 b=RIAoK3Omf/tXK5Bk2WL0o48FE+D/7KQond3BQf72meeyjoUQshmR/DQ4hHBHyDe57yKCi7T+oM5HrbUEy/6ZSIh3gGXn68hsjFwSIWnRrr8MI9c18o/N2acLDiwggTQH8/VRF79xN6H/hOGJnz/mCQmuisYnmQ2lKWBqvkw2J9f07gYFinIPGOW5ruDeng/ytdyNcKkMKgfMDCYHQ5ZVBNQrNWvj+JtWYJht0RtOdaejzk8YSpFO1/bqKDRZGOPyMrIsloJ+VqO4tFKzZJcQvElUxuQkK1BvjWXbR6OIbMofcknaTIpcxNVPKgodSTPXi0wjJrgCkBkZh3LYft/KXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rjin0yiZC6oa0pczK8YkLPBsRcQtD4/nEhc7ROIWL+M=;
 b=JwJHq5ZGOVTgz98IB9bD/DTTrbsUrbSDadvZ0uGmA/DgZo7/cj5pE+SLua6wD7a8ivRlytBeEXulQtR8gs12JqDpniOzKfYBZf3fDuqI81hv3nbcRiN4bVY/5rkGqzY13DKfNw6EPOz4BWRMlb+EgRaUK9e8FUYX7Zkwy87UWyo=
Received: from SJ0PR05CA0044.namprd05.prod.outlook.com (2603:10b6:a03:33f::19)
 by SA3PR12MB176418.namprd12.prod.outlook.com (2603:10b6:806:513::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 21:34:35 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:33f:cafe::6f) by SJ0PR05CA0044.outlook.office365.com
 (2603:10b6:a03:33f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 21:34:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 21:34:34 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 16:34:25 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 16:34:25 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 14 Oct 2026 16:34:24 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <michal.simek@amd.com>, <linux-remoteproc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <ben.levinsky@amd.com>, <tanmay.shah@amd.com>
Subject: [PATCH 3/6] dt-bindings: mailbox: Add AMD PL Mailbox IP
Date: Wed, 14 Oct 2026 14:34:23 -0700
Message-ID: <20261014213426.2957480-4-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261014213426.2957480-1-ben.levinsky@amd.com>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|SA3PR12MB176418:EE_
X-MS-Office365-Filtering-Correlation-Id: 51372076-bd34-4360-ab3c-08df2a3af0c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|7416014|10067099003|18002099003|22082099003|3023799007|13003099007|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	h04QWUvihBB+HpRgl7CSrIxu2LLF/ass2jHQlu/xfS0JsDK8Zkonwo4T/rS0yp8EnprHFsGO9dlJYasCMcyu7pHWq2NH0MxZEJwmvMdTf0p4wwVBBHDu3ts9DRXa6LKzCPIsp+Ad1tRazA9n00G08MHq4K8Uj44zN8UWe+DshGAFQ8s1Wnrb6Ywk2SUtQhS7LVR50cDC1YJe1O+YRzArG2ij1gdGARYM6any9vn46uq1bJ0gefSZgGm9UsptV1KjZExD8ewjOrVeB067cVeuVpVbOq6v0qdN2YOezoBNKnahwnSXxQEPn+1DFO6HxkJ+OH2oIGMvSBXIJTfxm7x+kbCnfgdvPRrkK+cXUlDaatJG5m3savmmyeB7eDPqRn8zrDLNAlYD4NZuq5YM/zPZnF27sBYtnH+7gTT5g7nzW54xsVw8JrXN9fEpxn4uXt4WLogJwSuS5sblxi7dPIL6NGnQIw2nkVMbMc3ze4sPFbR8yJbUl6fgoqendS3LckzghbfKQeGiM7m9VhSqLmgwPV1NYncKHC0BVexz6MK1g2IXtd6eMbIQ1+V58CCvdeIq7FUdG02CqXhdl/6z8JVjihJ48bYUeJfH8jz+GQiHyR46D1g2pN70KmUi9wrVIE+b3Ah4dtuqob7i/IKWuNR1jg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(7416014)(10067099003)(18002099003)(22082099003)(3023799007)(13003099007)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kl3s+yotI3xnX51LnqbzNvFjDzyxClBHH6fRQ+M2A/1EDMaNAyPHWOJf1oEn0oX0mtPLPmGrmqpnCjRt2PpbS3ASJ7HUMoHBDncmIA+bvu7drelLik8/hOLbqoN4wnc253yvi9Qn685+7Gcehz1eDVzc/j+2PtvPq0LIdEV+fx5scmCbaw+zBqdlZR4NWkfeE0Ub+DksArBuTGu0hUJDRa/olp5qyXxsRetSdF3fNTXmnsCFgaJDoFBljwlnUirpRkgZRBJYL9rymmW8jRDdEIaYxfEMQpu3q19uSV2UQgxiX5a2WzGGpiqKqwKm4d8wjgduHw53pGDAsaLwU5kkNf9zoVINmqorAbCchufy+G5mfCSsAl8IABrSs6gh9WEkT64cX98s/xn9427/HwOwls18YQPPRwmugzSde+XYiHvtvO79lD62CPOHexD+pDu8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 21:34:34.4711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51372076-bd34-4360-ab3c-08df2a3af0c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB176418

Document the AMD programmable-logic Mailbox IP used for bidirectional
FIFO communication between two processor-facing interfaces.

The same IP is used on ZynqMP, Versal, Versal NET and Versal Gen 2.
Name each SoC in its compatible, and use amd,zynqmp-pl-mbox-2.1 as the
fallback that drivers match.

Define the transmit and receive channel indices together with the register
aperture, interrupt, and interface clock. Describe the FIFO depth chosen
when the IP is configured, so that the driver can size received messages
to it.

Assisted-by: LLM sparse
Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 .../mailbox/amd,zynqmp-pl-mbox-2.1.yaml       | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl-mbox-2.1.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl-mbox-2.1.yaml b/Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl-mbox-2.1.yaml
new file mode 100644
index 000000000000..2cc0d106b888
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl-mbox-2.1.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/amd,zynqmp-pl-mbox-2.1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AMD Programmable Logic Mailbox IP
+
+maintainers:
+  - Ben Levinsky <ben.levinsky@amd.com>
+
+description: |
+  The AMD Programmable Logic Mailbox IP provides bidirectional message passing
+  between two processor-facing interfaces. Each interface writes messages to
+  a send FIFO and reads messages from a receive FIFO. The register aperture,
+  interrupt, and clock described by a node belong to one processor-facing
+  interface. Channel 0 represents transmit and channel 1 represents receive
+  for that interface.
+
+properties:
+  compatible:
+    oneOf:
+      - const: amd,zynqmp-pl-mbox-2.1
+      - items:
+          - enum:
+              - amd,versal-pl-mbox-2.1
+              - amd,versal-net-pl-mbox-2.1
+              - amd,versal2-pl-mbox-2.1
+          - const: amd,zynqmp-pl-mbox-2.1
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
+  amd,mbox-pl-fifo-len:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 16
+    maximum: 8192
+    default: 16
+    description:
+      Depth of the send and receive FIFOs in 32-bit words, as configured by
+      the C_MAILBOX_DEPTH parameter of the IP. Must match the configured
+      depth.
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
+        compatible = "amd,zynqmp-pl-mbox-2.1";
+        reg = <0xb2060000 0x10000>;
+        interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&pl_clk>;
+        amd,mbox-pl-fifo-len = <16>;
+        #mbox-cells = <1>;
+    };
+...
-- 
2.34.1

