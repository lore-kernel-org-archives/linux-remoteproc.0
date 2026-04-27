Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010013.outbound.protection.outlook.com [52.101.193.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109A8381B1F;
	Mon, 27 Apr 2026 16:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777307248; cv=fail; b=U4fVeYiGqZvfynt6GM6cV10YFFfNN+kYxdxz6eaNHUwKOyswOsO8YudZBg6cfgPdoHfEqRbE+IXAYAeSTCrNgv4wRQLgwCxqW8ZX5X8mnS/Go/WMrLxQvBGskQp/C3yh8A69fJSVW2pc6AHV/E6Iixqyt/chF8xAXmcNymESAF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777307248; c=relaxed/simple;
	bh=9SwMUm1SwOOxW3QZ4Wlg0iNu1Gcv5/N1Fdy2ljEiSOI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VdiLXZ/eTUwiFFeyLOMCRZWoWCs68HB4J1ENVkJKHS43ZyGD4bR3Clxuxiip39kulcJ+xLriPDxz0J56QxEue7g4ChGfHyeJUsLDUzYw++ezmboISSyTJm4sVCftIajwV4NV2nz//fIYaaKQc0WBkpRA20A9T8Xv+4i7iOCecZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OUH01EAN; arc=fail smtp.client-ip=52.101.193.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OUH01EAN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcy06H/03hp5XWvIp5vFuGqvaB3bkZA8W+2yNeslpWOxU2uWWzgGMHhe5eGT6EjbiLvIiPfXcv0qBEdRwNZmyWPIinfFIA1Q0JgykYYZOZMgESW4Egygtn/yiAUrY/hfCPGsj8KaOUzxbhvdL6NBAfKQEe8EAVFx7jo7+MSOmN+84PROvXVNslT7H19QOPgZ2tv1fyQUgcaG8kfHsFNQRM0H6gqX6hh5tC8l3zUXdeBryHbmeKCwaPO5HCdPOT34XE4Gu9kDQ6LWRsiFC44uzl6UonT7GhoMk6bdcydRRCGOYhEw+7coZofJ2SIgF6kSKxNXrGbbvjIR7Ef3DHeCbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O18aO0FaNv61ER95MgQ9/0E068aZEcd5mctpEwPJlMQ=;
 b=hOAyzQBUCAiqwXnqL9l6FihnhFT+y6imPuB0RaB9vKxOIt6bCmCpoTdy8d9hRdldpHnazZ+8kf9bG6ycp73tEGYbQ3NnguqCfkc3sXDlqtmEM78CbnmyWLvmjYnMyTt8fSMxxzeeZOsvaUhvN5UcHN4/wCIWyW9p/+tfCba2X3Y9aNkyYu4vxlyYqLkUz0/iMlQrczMxjDBkdpvkMZ7jM7mPWAN7IkAWEOSuPzEe5UDPArgQXpJHxLcW1skyLuedKJ3N3Ns+ZompeeoYRnvv4xK7/ENUOOvQGOHSKJ5/OnQ1WBlJlpieyn2v2fjplXOk21bX+WcmlfW1gZPpFdws0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O18aO0FaNv61ER95MgQ9/0E068aZEcd5mctpEwPJlMQ=;
 b=OUH01EANkmUlJXtq63O2A6HQDScu76mIzQeIOvPWHONRlsLbO4LgfNGngO8Je90ooyUYGz25H2YyFMnbmPRkrJngMk7RyL8xIcc4yJ8BQ+NXqj8M93n6eznYYqIBjdS+UgWmDQ8/dw8vfHavEVyq4URvRfz1F1fnFnGm0FtZ11A=
Received: from IA1P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::7)
 by CH3PR12MB7689.namprd12.prod.outlook.com (2603:10b6:610:14d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 16:27:10 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:208:464:cafe::60) by IA1P220CA0023.outlook.office365.com
 (2603:10b6:208:464::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 16:27:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 16:27:10 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 27 Apr
 2026 11:27:10 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Apr
 2026 11:27:09 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 27 Apr 2026 11:27:09 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <michal.simek@amd.com>, <tanmay.shah@amd.com>, <ben.levinsky@amd.com>
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: document AMD BRAM-based rproc
Date: Mon, 27 Apr 2026 09:27:02 -0700
Message-ID: <20260427162703.1644103-2-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427162703.1644103-1-ben.levinsky@amd.com>
References: <20260427162703.1644103-1-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ben.levinsky@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|CH3PR12MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b8d4c12-5646-4939-1890-08dea479d4f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|36860700016|82310400026|376014|1800799024|56012099003|22082099003|18002099003|20046099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	Fevx8qaA/swMZGAR9gdsEHdyEtVPD66x1TTkcqdEpLbVZSdIorvhJoPOw9paQWfXyXUBQ1BTyXoDCj/z73J5dPRvZTSY2Auv2HoWKThY7TqNm3Ez4880AqlM7p7BUYxxqCn7mR2s7BWLg+u8+NvDiGoiiZSx8Vk0s+N/00mQTZZkdj9la4s1zWzTdSE8IxtThUSDCdVP3EuDQzkAAnYAPE1Lu+phFR6SelcibRLcv4phoTlM2XCTD7vsDEFx9Fzced8PmOjft+bsspAD3i69qsJiqRg2CFwz6UMkEcNmFIH0yM0npCxBk9iE48Kcqlz8D74LGcCeXboANr7n25OjFl/gIc5irp+16FgBdRPtuJ3M9PRtZbc170ZlMeGeAoRjv0KcTQ8MWjEXrjv8vyKDNSF0/uQZkjW4bZKXBt6DNNjLzrgTVEOSqmvBfQ9Z82JEgodu4Zh4KxCkddwPezk+4bUqdFytJdHgE2m2F2FkY310PL+jwLwZm14j2qbrP3BOQZcw4SzSc9u+ESY571qQFeDVpJpxTOslLxcW0N8p7SBdHpIMIGQsPMlJdY/xR1RMLmLJb6lEvIHy0Pf1xWSmhsmZE5Kvx5uZnw/0yf/4QeKthRT1ZQ7TALpkxq0a9hjLELT/tE7cGh0GLsoMV0cnmVzQ1YbxrrMzoxgW/i9KHN8p7ehj5WSs0AD4e2E07N9mOwQrEv6fw/0ii/SDwIfvYfL6UR65nJUOBJAYqaCLfEE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(20046099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	L71sJxQAmBQV/a+4tkgjg9ycJLhX7An6AWIhmllU2TRM5wM9KHMCgQhX5/3Pu/pnS7IqOv6BCKaKGf8vTfar+NpDoFZLW1vfOtvJUO9yqV/n35ONJYpaKydWf2zMbssCLbuGL4DsYDJxom3B1AphySdP8+A54NnKmDMfOmQ3Vt4JmjXVRi2HamN59a4Ts5NsWl98915afY34oLVCZYctQ6RHZlJKF6wAIrntKKr1ABwUlB94HklPFWNZD7IXEvlhEy54aZEBUqsCR2OeT3sYwh3QnrjxY45BPpZwAJne274UVmBpbxb/XmlqwavWNpRZ4qGHJBJmpgFMc+m4SSAH13lq7BXWGOC4+pI4GzQUIyY+utu2BgS6YeRqJNC+2hiU23yodVSpX4AKR2iBuEbT/H89iIvgIEe1gDF3Pzm8OXhJX8thWo7pcyhOykECNBJ3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 16:27:10.3841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b8d4c12-5646-4939-1890-08dea479d4f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7689

Describe an AMD BRAM-based soft-core processor subsystem instantiated in
programmable logic and using dual-port BRAM for firmware storage and
execution.

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
 .../bindings/remoteproc/amd,bram-rproc.yaml   | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
new file mode 100644
index 000000000000..f16657dc0d9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
@@ -0,0 +1,98 @@
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
+    const: amd,bram-rproc
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
+      compatible = "amd,bram-rproc";
+      reg = <0x0 0x40000>;
+      clocks = <&pl_clk>;
+      firmware-name = "firmware.elf";
+      reset-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
+    };
+...
-- 
2.34.1
