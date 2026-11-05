Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793855956;
	b=R2SeymavjwsglzJXpn7d9HYjQtNRGs6zzQK4T8QfjL6l+fLzwyAM+SzUA9+EzjaO2DYx
	 bRElWiBqtPosEIWNRfXt9L+VrvKEjsNmBR+oG3Gh50eGTyvS6PLBdNpByktZaOxL52Ncu
	 PadCnAvgMxY1HLNMoaClLjCi1u1IrofCcwz7nnEkCP+qDT8y+b/nGTPYC9Cictf7A+SDY
	 f2bn9FkkZ2sw2tX7dHCw8BoMhvQ2C0ORzMfFcrijr5nT1qS8YTQ+3JpnBxyOIDrRSiarW
	 h+CnP3pNZFgsROlUEi2U3PpLjC5gvGwafc8jwQVUB5zcZhs9l8CqOUHH8RmQnm/vEkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855956;
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
	bh=VGrfNJuGTnsn9ptsUy/oNCt+PaqaZLzRyr/UJ6P2KOc=;
	b=rjgN2baUngF3iUMCrHfjKkqAO7viCwcRsOHeZ1B4RKmEFX8gLAIh+34ThsyON2fMoq4f
	 DbaqiWU3mPpu5M4QkPnDSMgBEhbSzTj5d/8KqllXQ6jYbPTmU9/eB5Wdr22OBsGGsJrG7
	 V08v2SjKZCB7kNtO/L25CCNceydX65F4pcJgGB8v2GrKVaws5DJWh2ddVU8Q4FjW7B5/X
	 fA74pnY6XkXISCc8EPlEGUuiYCsqsPNkbNR828JyRmSEIPzA8J2bz3eAY7ZZ9ujoHQB8I
	 4rZrpVdPQxDSKQn+agwM8G8DyxpXN6G0dGmSYMkaB/RcHRPnAMwPthXs+fEVrqWzd8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uEXh7y24;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.51
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011051.outbound.protection.outlook.com [40.93.194.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F04606A33A;
	Thu,  5 Nov 2026 05:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66F04606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uEXh7y24
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BK6qJB3d1tHOsQ8bOfNRHbG/nr4G9iUw8WUuQFlzGNZpc2hgk10Z07YYLx/fbgfeBTqk0bFJaLz//YBuQ7iOf0vpdiP7m18T9XzeRpslbM5oOHLqPPODOghA5tIIiDHbqkFkvan+651VVo7RIMaZeG0LAqSzORn3BTIKks9+aDtFUiMwLTcgDi9WfknmJk4Bqq/r4FFeGMLBmVkRFzsOFMCEPxXFnc8pvMAOhMAH/eVwsrdpYl7Cp1fSLcPUF9PcOwLyzD3R2GMQCCUAsJGnk28fbhl9acxvdDPY/tohMmuu9MdSTLahDT5v5bHg2Raw84RCFqNKWQO/4UYdgE5sWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGrfNJuGTnsn9ptsUy/oNCt+PaqaZLzRyr/UJ6P2KOc=;
 b=I7qAAliqB4cTiaOnBrve7lyHkgCDrmd6VWoL1c3+dgxK+MChZRQpNe+4HR6a+Xh1hbQOhJ1kWEZ4QUvgbRilj1KVMBYOCxx0KZAGJK4Tog/xQdY8W2aAdGh05iwftOEqeITBrSGu0WTbfCRJyAt3JwOdGkvXv94jeQVJP9Fmm8raDuFpbmJEYYjcP44NsQLR+ZE4OYsqsNQd6JKPLzOsp0k79i7eoupsSNEOEFfIvpF3ddHIaRhj5noPQg1LpOejTzCYtULwbe3rk8Ft7pGbsI0PyrGzapR9tppuYj0h55fvsyt7FS4PgePTIksvFYMyw3CWT/MiGeB3c8ZxVlkQVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGrfNJuGTnsn9ptsUy/oNCt+PaqaZLzRyr/UJ6P2KOc=;
 b=uEXh7y243v3kEsdTaGKFSOihCFjn58N4p8WCWBF3xf2+E8zyDA9Xsped/gXsvKVbOnSoCND2LeUODzfsZqmhRaNfBym7cl4qocw0HhlO1G6s2k/VmJVf6kqiFztQX61gdfgojoyRBP94IOQgZtQWuFSuCq/277yIGBeaojqucJU=
Received: from SJ0PR03CA0001.namprd03.prod.outlook.com (2603:10b6:a03:33a::6)
 by DS0PR12MB8199.namprd12.prod.outlook.com (2603:10b6:8:de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 05:19:12 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::3d) by SJ0PR03CA0001.outlook.office365.com
 (2603:10b6:a03:33a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Thu, 5
 Nov 2026 05:19:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 05:19:12 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 23:19:07 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 23:19:06 -0600
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 4 Nov 2026 23:19:06 -0600
From: Ben Levinsky <ben.levinsky@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <michal.simek@amd.com>, <tanmay.shah@amd.com>, <ben.levinsky@amd.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/6] dt-bindings: mailbox: Add AMD PL Mailbox IP
Date: Wed, 4 Nov 2026 21:18:59 -0800
Message-ID: <20261105051902.1646651-4-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105051902.1646651-1-ben.levinsky@amd.com>
References: <20261105051902.1646651-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|DS0PR12MB8199:EE_
X-MS-Office365-Filtering-Correlation-Id: e9b3c279-9de3-482a-ec0c-08df3afc53c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|23010399003|30052699003|1800799024|10067099003|22082099003|18002099003|3023799007|13003099007|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261021135927099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	tKCYa2+5qf9fop5tDZE8f++dsWvw/UYOYGL6F8jWZ1lY0H+ZWPmvf/zduJNbrjbTOVD59oi76Xh9qT2mT33KdBHjGV59rwxgNY6kxU17Fh6clf7i7mzfhzW9lIAjsSILu/u9mFyX7ayobJakmUyqb2kyGV3DzlfT/zxVx1V9M99oHqHjBupB+vXauhThkvJSpVnRGkXz5YSN6drUfAkWHxWlJ2KGI1zgeTTyA8IrLIx8MTAFBqVEqz/uAkl4OMOe6AMR72WHZ6PuHaBcEGvg2H4uJaY4iJyd2pr+RdChSwkCW+tC9Og+jACyc8kC+AuKJ1kx+OPY9uoSIUtAzNlIRicZWGa0Cn9Iw7UDK099WBxXcF/QWMPNvL9mQw3VijeFxnv/ff7MOYRI9Za9UfyGSW6y7Govlab5vl//pGRHGjM282w35m9EQRMRj7MFT14lPEmVdbpUxkHu627PakPDL4m6xoYf7HrQQavISeKTA2VrhF4xl5otK/7b8J6sT1IcIiApaIBoHi139IC0/uyCrXUmP6Jicjt+QOMLXMKZ6es5XrJhE2A5YP90UDOUJ5yAO/0n+GHnBaGBIVGhZglvBMdzw6bVVwV6fcqNMUVKyTyZ+LldZqR64SYJCAJ4XnINKJGoeRUYfOokwCpcFduI5Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(23010399003)(30052699003)(1800799024)(10067099003)(22082099003)(18002099003)(3023799007)(13003099007)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261021135927099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xvsgLTiqyZG5fE6GD79B2mPiJJC9Zb9cEw+uf/aU/xSat4QA77x1L3pn3uxeXr39cdo3venTO6vOcy8RXuIQCKqHPaWEE7H5OpxWvgCttJYuv6Sq4NYmFqMAFfI0gr0lutNmogzURxkVLcVPKcoDNU+rnqPZ9zwbAIZQi6HFxOfMyI7DJimnmV6O6ocr8goVPNrtJrRfstAmO5o+usG2jCNqUisQyjw1h/p2HEwXkeMOZNek7Lp0tnKMmqcwE8/YcwOwnzLTJ6lh8NQX69h+PcQLOZL1N7OWPS6BzHbahrF0uhLM/HWo/Q/hloxfTWOq+9AQbSrIKTkoKQffYH3xRye4K+OqwdunMi2ad3o2Mg+gjbFm0UnG+4PgoRc5Ld+F3M/oqfrtZFWhMS2r/SiCOIsybIwvmJmRHctN98MbLRnrcLhnKUtvRBNeXyuRL7BI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 05:19:12.0392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b3c279-9de3-482a-ec0c-08df3afc53c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8199

Document the AMD programmable-logic Mailbox IP used for bidirectional
FIFO communication between two processor-facing interfaces.

The Mailbox is a soft IP core instantiated in programmable logic, and the
same SoC can carry different versions of it, so it is not a SoC block.
Like other PL soft IP bindings, use a single compatible that names the IP
core and its version, amd,pl-mailbox-2.1. "pl" distinguishes it from the
IPI hardware that can also act as a mailbox.

Define the transmit and receive channel indices together with the register
aperture, interrupt, and interface clock. Describe the FIFO depth chosen
for each IP instance when the design is synthesized. It cannot be read
from the registers, and the driver needs it to size received messages.

Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 .../bindings/mailbox/amd,pl-mailbox-2.1.yaml  | 73 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml b/Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml
new file mode 100644
index 000000000000..dc16a2e1142b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml
@@ -0,0 +1,73 @@
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
+  The AMD Programmable Logic Mailbox IP provides bidirectional message passing
+  between two processor-facing interfaces. Each interface writes messages to
+  a send FIFO and reads messages from a receive FIFO. The register aperture,
+  interrupt, and clock described by a node belong to one processor-facing
+  interface. Channel 0 represents transmit and channel 1 represents receive
+  for that interface.
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
index 1e3f9f2751fe..3722a66b9960 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1306,6 +1306,12 @@ S:	Supported
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

