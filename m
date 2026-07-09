Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010004.outbound.protection.outlook.com [52.101.56.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC45389460;
	Thu,  9 Jul 2026 14:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783609141; cv=fail; b=H7RsVcnEW2OuIEkBzE3b+Noi+wbatclz9i3p+ovHQFDo6TYRQhlpryt2J1kKWCQ2IIGRoCgzKNA6JtGGRCEjU+n+24wcjjFlTKkyedTLy28I7dmyy1FlJy/ID/HxeNmrvzvXLmLQYALX4BD2wPQFnLeme3Sf4lX9OuJZ2ELApgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783609141; c=relaxed/simple;
	bh=ZynCHSKyrnbO/rLG5BA6OLP3a0IM9mwBrNxWKsPBd9Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IhVV5xNe2OF2r9TDBEYwDeradoeFaGJl6/lKgCqkmzbYQ2t2wjS7QwRnfRMTMt34kz2YIW3tl7yPt81eH1127HC9GPJdwhPsJ/yOk+D+4CZIPco1f8SWLx6QudMqnMuBw3tNxwX08wRDfUVHhVa41U4xZhMKj3TL8jkZnoNHo3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NPXvkMnq; arc=fail smtp.client-ip=52.101.56.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NPXvkMnq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R964biU+RHc1U0U95ePJvcmPF75vh5A0PPeLeYJE0dl9Hzrm7w+mBNaorNo9V3oPEWbkW82Pe0QJmcC1sU3ZylGKZZrZ0e61VQ9EwdXrjNDaXZWnq+Bh9Xu4FC3Melkx8SQ5VMJhhKQXIGoAmpqsyxEEqLSW5JoeIPFRTe98xGddGST5LLTnHkv74NmDzXaeuUnQOVkK23gbDxWf9kAt7gNHCXYh5YlZBIepuLLlRJ2SL/p+0dcQz5Sjdciuu37Ay+n5zrlqjEST+8ICJYS+YmApt7/jqNgDF1W8kpS5zM0iYdjtFigrXmuhARqYyQuOR+E94UGhbsIT/z6TcX/qzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHekJfsbS9KeAXm4wLEzMsv5eOU/UolRAsiSs8dx7Yk=;
 b=A4+P0qhx6EXxZxehAjD26kkQvC7S+327XtsD2Bn/9lRdQOlLSdOuegdCVJXoFJodbsijfCjpDiLvj38pUSa+WbW/RtIy+f1KzDEdHzi5cbi26DnhxOevW8n3E1rDrGFulOSqty7dpZwkWnjNfU/HZnIYAn5Aegbz/ctXAqldzfhydaIX24yrm516KnaTQyfo1NtclUZtpaUwT/EkkreWgjkTKBNKzD8GPh8fW0zWpAKfxyDprtm+Bjb8o6rDHWL/875HfglK/NULa/VrSGc9TCM7IidnRdILl0zqq4a1XdfLC5bCuXsNfVltREZ5N4kjQFaZn8J6v1/v03qHT4o84A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHekJfsbS9KeAXm4wLEzMsv5eOU/UolRAsiSs8dx7Yk=;
 b=NPXvkMnqIeBe2NC3IfvRaWKs9vEoSF5rWFJVUd9+DiZRZdy0/eTbYaDQggAQp5gUSw+JVdJizS9VeGGDnzpWuqUJ9LDY/s3Ca0T9vLVCIymODe5bIKNoK/Xx26ltroNw1J79h5nIQpu/ZPWHrhYWDbB5UtBjGMkCXPEzFK3FNn4=
Received: from SN6PR2101CA0025.namprd21.prod.outlook.com
 (2603:10b6:805:106::35) by DS7PR12MB6071.namprd12.prod.outlook.com
 (2603:10b6:8:9d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 9 Jul
 2026 14:58:49 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:805:106:cafe::1f) by SN6PR2101CA0025.outlook.office365.com
 (2603:10b6:805:106::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.4 via Frontend Transport; Thu, 9
 Jul 2026 14:58:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 14:58:49 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 09:58:48 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 09:57:14 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 09:57:13 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ben.levinsky@amd.com>, <tanmay.shah@amd.com>, <michal.simek@amd.com>
Subject: [PATCH v5 1/2] dt-bindings: remoteproc: document AMD MicroBlaze/V BRAM-based rproc
Date: Thu, 9 Jul 2026 07:57:11 -0700
Message-ID: <20260709145712.951146-2-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709145712.951146-1-ben.levinsky@amd.com>
References: <20260709145712.951146-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|DS7PR12MB6071:EE_
X-MS-Office365-Filtering-Correlation-Id: a23dc091-1ca9-4a7f-0e32-08deddca957c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|30052699003|1800799024|376014|3023799007|56012099006|11063799006|20046099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	7n4iJn4CzrMwigGnoL0IcokA6Ve3A8GMCV4tbxCsQUm3ndtNQV0fDE3/0xk/R8VL4e3vjumTvGdyd/AmXlT3skssIIsgUGe8Pw1F2Qb3FJzgSMMR1ToMQR/9z+tQFttTmaGKl1H26JwZZXYFIK0iAGMBxo4RKQyktQyNYRB4tXVu9qn0AlVFn3O+4vXXOmI2xCI37xxq5232DLj5oL34hHtI0sFGr8XDCmGaFlQcJomygYaW8oDYSrhjMYTNMtLPbkpQJzwlTf6FXpFfN+O9JOQXRKsqNCjKZSqA8vXN3g3vDXbmFjDrDB4tb0uwx1D253Vs1p9Y13qjMeZzHJWD0Zat1ihe/DFXjYIWub9ToyKVBHquZaHvxDaWs6mcDexEIG2I7ETcs6wc8LpM5mZyVA9ePAh3tVFJnUSRZskL9SpIrqpO7BmY9+59mJTbtzquc67Hlapk2oiuRPlruO4blAZYcTAaZDG4s85wvYRJav8q7kcUo1xB/QmgCO7ik/N7swn0grvGDJXLJDZYLZXuB37cv+WUzA9tc8YhZaod+5YPJaetgkGSrYFA9o32S6PM2VS2LigYvBY/DrT5zPysdIYjWiVYq+3fhepIwpKMNel7PPx4XM/ikMg25uY/EsQKR1/dgEoXQVcjVbyEIpdYgA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(30052699003)(1800799024)(376014)(3023799007)(56012099006)(11063799006)(20046099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JYj/VAR0nKDz56oSO62C3Xiyl6ZdUgIsXjdekt8AbBZQWu3UcdN1U5NKtILx3SMIZvk2VYCK0NCscjthuGTOaIBEO8mASNH8joqNuATXUgu3tC4TJOjOtvi+a8jA52PeYDftFqq6PzrvzyUJOttAK3F79kqSEtA6WhXwoFIPNFaCNjVm1zIhAIq82YSslEKX+u0cWfF4gwu0tAQU3LIeP4XgtLcL3F02ahe5aR02mlpJ02r1OT5U+k2YFA8LJofQEmdhJEkyged9Y56msGLw3QFpQ0nFi59veRlkUS+iOw5W/MwmdB2IDO6c5FairyL9Rd+Fn3KNhy39dcVoixnC3pxuk/kh7HReDAYg2445L37vsZdaTyPcFwIu9yq1+gSRar7rEPJdU9DPqPXRF08f06OfqCmIJv9RLs3u5xDBlb3jMG8NlosD/wjysEQHoGKt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 14:58:49.3867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a23dc091-1ca9-4a7f-0e32-08deddca957c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6071

Describe an AMD MicroBlaze/V BRAM-based remote processor controlled
through the remoteproc framework.

The binding models a soft-core processor subsystem instantiated in AMD
programmable logic and using dual-port BRAM for firmware storage and
execution. The remoteproc device is represented as a child node whose
reg property describes the firmware memory window in the processor-local
address space. The parent bus node provides standard devicetree address
translation through ranges so Linux can access the same BRAM through the
system physical address space.

A clock input feeds the soft-core processor subsystem, and an active-low
reset GPIO holds the processor in reset until firmware loading completes.
The firmware-name property is optional.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 .../bindings/remoteproc/amd,bram-rproc.yaml   | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
new file mode 100644
index 000000000000..c0359f447ea8
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/amd,bram-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AMD MicroBlaze/V BRAM-based Remote Processor
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

