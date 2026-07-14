Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012019.outbound.protection.outlook.com [52.101.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F494427FAC;
	Tue, 14 Jul 2026 20:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784060691; cv=fail; b=dpOhwRN4+4ksLJhcUFNm4OmGDW5jwlbyfuakoZFzDAdSMxCMBZMHEbM7XTZLri4HReHN0wppxzuxFmUhdT2UN7FGiHZf7YebDChM7Ynog78QXdIEdsDNj/GtZNRchcUeqb7ZS4MXCQmnABt2KLX9WxUvN0yutptVWM6iF5krvCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784060691; c=relaxed/simple;
	bh=0V/rtasEFuRaKwsM4lpyYPOMzwbN9dOe2KSifpgN0nU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PkeaLD0mPEC8cFeKmcJkArqOiztZuZ/iHAKG0dCI/D3+0hORcZvaitGsk2ewIa1tx91hRCMxLI9Vc5LZ4rzEljJkx5HL+dRV03MyDxPvZ47YHkH7V8Uc/9pJyLDRjI2hmAISQ82ZC3iPHjnw007mX+KTNWsat7yodWlAd6cZ24Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PIJZFQMQ; arc=fail smtp.client-ip=52.101.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PIJZFQMQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXEzCllbjZo0Pwi60F5pOLv1rOq59Pu1AWTtIIx2zGf7+RTPpAFjh7b6WlnBvssSDOnyTB6eTYZUSmK3wDuPGgzvZyhc1XIRy+iyoL5QwN2eNJqlvq02gKsqXibv0ssFgNmcP34kbv4ijBedCw8Lf0X3AOSbrvkWRU/iOCfWh9CcKvTPgG+wYYs9YVg6LM0Zkk2+eww36UsLMMN5SdOnyXDC+yByLnC2hNwjOfvO4LzFDZGAcNCI7O9gpNNpflEq6LNyvw5qYyHxEAQMkjzHourpXkqNB2r2kfHlfIsbxzbEp5LgJdMMfZBB6CF9Httw4cnVBphQGr9S5xE7LwjBGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7d16mvyBSOOl9CvA4YeF5qT9GlgN88fbSuWz+r0ajKM=;
 b=usp35drwBQnUelu/ljidPBiQ1qUwkbtX5sFOWWTt8kgUOby7+GEaG0g3GhZqFz6J7oBAZ97jsldD/4jl8QMwRM3ad/QUWEUT4UiuHMHti86SUwV04e21NqU8r/BKhl6HXqSytFOTEehT6XaO1O2Ol712tAJh3Pn+YWvKRVtLWZw7AHrt4zlIHmKb3j2bFzeYZ3RHO0Fa/9BMCTpkv5n+BqBjeyvxBBhMOWX2q73EJ6si6RzsrfOxLukJoTXurmZjgJTp7Z+I6D/HJG608Ty6sysGSofSaXwPY+T2dtBw0OQ7NOPQ1m477zldunU0Ijt8C3KBdKZXyMQW6Mr4wzxbPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7d16mvyBSOOl9CvA4YeF5qT9GlgN88fbSuWz+r0ajKM=;
 b=PIJZFQMQABkwC6tMfpm9xTsScdHDGxIiUhBfnJ9u+JeKtVTcFSq9eDP58fznYlS2rnDZlbxqcGUmZuiF5YECGE+fn6IsUOMykD6PpH5IU8eVRO0SLzDerScg302Gvv3oQ8hpP8GC4uSPcZjiNk1nQ7GfBDJp8KQT1/4pg6MUgFk=
Received: from MN2PR03CA0021.namprd03.prod.outlook.com (2603:10b6:208:23a::26)
 by MW6PR12MB8836.namprd12.prod.outlook.com (2603:10b6:303:241::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 20:24:44 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:208:23a:cafe::95) by MN2PR03CA0021.outlook.office365.com
 (2603:10b6:208:23a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Tue,
 14 Jul 2026 20:24:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 20:24:44 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 14 Jul
 2026 15:24:43 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 14 Jul 2026 15:24:43 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>, "Michal
 Simek" <michal.simek@amd.com>, <ben.levinsky@amd.com>
Subject: [PATCH v6 1/2] dt-bindings: remoteproc: document AMD MicroBlaze/V BRAM-based rproc
Date: Tue, 14 Jul 2026 13:24:40 -0700
Message-ID: <20260714202441.554065-2-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714202441.554065-1-ben.levinsky@amd.com>
References: <20260714202441.554065-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|MW6PR12MB8836:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db3bfc5-a576-45f2-29e0-08dee1e5f125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|23010399003|1800799024|376014|36860700016|82310400026|13003099007|20046099003|3023799007|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	apqjnkPG2BSU/OdU8jyc/NUW6lqeyHNp7WlCYOEyeJwRoQtoI+gPeOa6iSd01pp5NS5TYSmMixerny2yYU8aFhzVLW/vcm6Cz34WmeqR5c4YyMOsZ3mWj8xANTmBrxfQkeq6NO6QyypEkbCOiktv/DGTXA/JcefPkxBcIf7VWP3XCCkZpmyxMZFonGk3hfSI8YM1LgKdn7V3dxnCqGtixi1RLef1I3JkFo0mPH5xtxhqVgHvDaEym5jXI/KwMv2KKkZbUitBZmtpKkMuoumSB39EEVO2q//Q7yJv4qRFPmXNsE9OoOJ4SYX1vbWfqSsLkqRmamcSqwhHiets4WR3/K7Phcj+wWOrl7WKrrFF+ZL1rx+4SuwiVHAkMGh69lQdxAQLFNIA1CpGqz1QKz0G60i1Pe/B16boF5OB9AYqhuScCBPnE3RK26lNk9EnsGU7e86w2nVTCxJVGxVG2I/8HCAvvYbEuhy65keR4Xk6ls9ZW15EjwUBItbE1E3rFf4mSpwOGRaBcltIQvn3zAi5NrUBsYGmIMvF7Q849e+yNmbIquKXYcSwlO30HtnMSwTKR+hZeYoHWu+8Jkgn3+BMlggzb4Vf3+8irPa6eBGe0OYWbMH0IKTVTO4sGwuAC4YWK784WWlIwxNoPd1zECT/+Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(13003099007)(20046099003)(3023799007)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0pYQQHjHsuYdAKmy6R6kWfHawWzxva/x2OqhXI6PnN807faEqksXiAxSPmXAayuWsbQQgHf0D7Hy0L4TwZN0qiVDQruPsBX2O3yaVOaYhcPX5hw43V5yvfQDSHlxV4ZSfWMV6oiDjrRfQaOpa3MYu2D18zCO6cqESFDgZUyQIB0uaDfxXdc7JtjSZKxDCwfIBCZRMOlch4Q0Orcd1YvMlAT4YQDkXWkub/Y4TXP13CZ8yu6JG54Xt4m4EuWB+w1AYa12/R7MhSufSZ55LXsNzoejOTwoWDXtX7FmEE+WQwkNiiOgqLNgW+Euz/zR0b6azDUWENhn7hDBQvpXFYJxKYbqPW6p93RYbyyN0e8lov94/yIJkq0aG/jaEu+QBwSIrKB0hBhB61ffZ0cBKnJQG2EoJN038xBDHLox1bI8rLFFEjg9Q07UjT6ClB0PUnV7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 20:24:44.2257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db3bfc5-a576-45f2-29e0-08dee1e5f125
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8836

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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
