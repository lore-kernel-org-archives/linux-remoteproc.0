Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010055.outbound.protection.outlook.com [52.101.61.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D3444BC92;
	Tue, 28 Apr 2026 14:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777386404; cv=fail; b=IFbcznC/nddQLLacwsV1eHMr6iKrcRFD08Tyvu78ZuDj+e/o4celwbt5DNGTBmz/8/U/K1Fe41P9n6UX+ZpEl5hksPfdN1G80n9atkAJRKQfIa4/SpGl6q1MXbAYubnTaew131zUhry5dr/1Re+PH3g29F9jeIeBckKnhLBZuwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777386404; c=relaxed/simple;
	bh=AE/YiQvL1PUg/Z4k24VLeib4ktbkyV0ZcCPg3E7S4Qk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GCbD2jK63pHp8y1AQewfdSs6xdcXIVcKTh/svOHPJxY+dZm3LHEadIPtyWXyKjsp/KBMUWYzqq6V19z6pMsdwiYOvU8CHhS45KM4degZqLDQ6Zr3vyRrCtEjAGrwN4YfB6BL3ytc48MRmB9JtXDrYdGlpCulzJhrMvqkp14b7E8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KNPSvL06; arc=fail smtp.client-ip=52.101.61.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KNPSvL06"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3vci5AIBcRDBH19aPMkm2w/kf49Mcq/r78JYz+161gQUXDWRY+7islkBmgUrW7fICgCJ54YgdwSkZzJy3jGIB4/EvbGZtdh82JM9MOFc8V/J7wyNO+3sIGTgv4AsAt673sv3dKkJ0wTygl5OpGJgStErmys/v1QUvKDpk8JjmFqAncVT+7AYJhteti+1UdBrjgvz/bCUFsmYcE4j+YE0ED8s0X59R1CJQviTZQddCb8groTvX7nr4l67dzF9n9aov2Zrcvqf3E920V0f/GbhPJKtQTn7xMs5cNFA2Hs7G9wdM+KRJrIrG/HdjZPZnFsaYSddPj7dYWZm5bhoiycTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ItAYSRk3yM+/a+ZHQ3rJpEv4hBBoDfYPTNgXPCszW4I=;
 b=GZWWYiX/FxjRriQfYNz9O/qKKjCavsJhe+x7Pkmfw531nTWj4lIYL4qyomf0bAw4N51ZEufu049wdAllvJNo/mCELQQIfeJwBwzz5Uv1ER/JS1kVjRXfrzlsYT3Jt5ehOC+jkeQOPN6LgoDIwJlyztjgSb34e4Kxrmf8lL+VU4MdpD/K+RaUoc+wYn3XbZAS+6QTu47xGsPdWVfPPKW2Ix3glxZ7GBe2ZEENYIX3PhgR5uTpmVgLTT/N1hpNiEPhCeVxlIjauW7iVhHbgAt45af+ZeLgvZ3CZ+tPyR38Qau/PSihxHbhaCIzSQ4hpJkEdb0i4bj2oiLyHkwDlXFzPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ItAYSRk3yM+/a+ZHQ3rJpEv4hBBoDfYPTNgXPCszW4I=;
 b=KNPSvL067rveIGGkK1vW5VoKSfU7uRnDyaN5uOt/XDVcBc99phCYNdg8g0jCL9x+crT1kNMwQYKu/HpFtSGNsSyzFOY1Es8kKPDPyLShip8d3m7SQlI0ma9+jUAmB9sf/yH2rz3h/3DAHuFnWeATIC2DPE6H8iTatTSh1Rqk/vc=
Received: from BN0PR03CA0032.namprd03.prod.outlook.com (2603:10b6:408:e7::7)
 by CYXPR12MB9387.namprd12.prod.outlook.com (2603:10b6:930:e6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Tue, 28 Apr
 2026 14:26:36 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:e7:cafe::b0) by BN0PR03CA0032.outlook.office365.com
 (2603:10b6:408:e7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 14:26:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 14:26:35 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 28 Apr
 2026 09:26:35 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 28 Apr
 2026 07:26:35 -0700
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Apr 2026 09:26:34 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <michal.simek@amd.com>,
	<tanmay.shah@amd.com>
Subject: [PATCH v3 1/2] dt-bindings: remoteproc: document AMD BRAM-based rproc
Date: Tue, 28 Apr 2026 07:26:32 -0700
Message-ID: <20260428142633.1854251-2-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260428142633.1854251-1-ben.levinsky@amd.com>
References: <20260428142633.1854251-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|CYXPR12MB9387:EE_
X-MS-Office365-Filtering-Correlation-Id: 725a4423-59d9-42f7-bbb1-08dea532274a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|30052699003|82310400026|376014|36860700016|13003099007|56012099003|18002099003|22082099003|20046099003;
X-Microsoft-Antispam-Message-Info:
	Fpwol9Fo7UB4Oy6efbVEyRLjOjfQKErQgsmLqhj5AOCmmz/R9UDR28PrJFKuSCjQpWcdlISZuEuNeH3RnFmJUSpPm+sj7CLcDvqdVWjscfUqg8tP+1US2DpvuVfU7iH7/rMDwcPK8gO7eRYbfY2gXXN1r501kNybPSSIBA9YNZrkYn1W4iqMFzNrmL2eqdyXr9povXoTjLJJc07buHVxzrkx+A8l4sTtEB+o37tJzV3C8ulVwdUVFguLYy4kjQL5b+IqQsTzD8mLVIx2VwJAnBydrDjPWorWSLnjS2o7PHCpygRUvlhX7t4vkhefekjR0/15eqHMQldjfhh2XPpsemRpYaIVdgSgiKnHabf+n1/0O3sE2ZF0z2PD+P54DwzxXfM/M7e0+yzcU5siyq/MqmZ1f2Lf+15nNBeatTmoohpqGBK7KBr4GisZ7P3A4B5sQvPoec7skYb43Ur5tXJ8RkgYPkdGs5hc20SfRpVypli7YU4F67sUiq4yQOXEKnNtNlckr+g+fkRV0OUHinbVtft28g29HRVEphNB3jIaSdBEkmNNuUIYohXcZablyQ0gnNg0+IqtHly6480zYe1deXkw/F0gRqdgG4c7lDfHjlCZMqf+hAhf2D6w46w90HUXbfh5ErLQKUNfowRJg1UyQBZyD8gmPQmw1QXTswP6or+LQNVFqPtMQZptQfP6HZ5+29X0GFwPtUDVP0Z/zjumOk80tcLeIHUQfMzxOsBYbM8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(30052699003)(82310400026)(376014)(36860700016)(13003099007)(56012099003)(18002099003)(22082099003)(20046099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Jw+czdci0L3T+XYIi+5xkj7HMiQSDmOvpZPgPi70fXRo63cY652B/qOwceBdcdWNmGXMDbDfpRGwp6ajCd53qlj5eN6/4VjxieN64oZi/kOih/i9Eu3fJ2LncSo+hvXuwhZw18viCVA/Dch5Go9gwKV+FkpPGwPT62PDu2oAcihBnnkMYgkacL2p46nnFBNg7NLzdlaWK/Ey87cTuW3HBbQOiuKeuTvfL/rNZCBqPKF/xLPisOcbcDQlON1ocCT9rQH01FYRyEa4LxuStpNLOkhM62d7bKaXg6m6pfY615vqwY1ZcmmBn2cYAsyVK0jPNlZ25Nrb6K+403NQylV0or27WRdfwvNleVgrda4ulbFCV80ZwTT6xTNPxnU7jQ+xivjcZ8t+bouvu+roB3ucgAEF6QuRfuxWFTm+S0ScawPH/5ygcPQYHYzjNS7gkYmY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 14:26:35.8911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 725a4423-59d9-42f7-bbb1-08dea532274a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9387

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
index 000000000000..cff13d552321
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
+              - xlnx,versal-bram-rproc
+              - xlnx,versal-net-bram-rproc
+              - amd,versal2-bram-rproc
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

