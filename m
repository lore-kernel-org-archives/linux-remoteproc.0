Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010038.outbound.protection.outlook.com [52.101.85.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84532DA768;
	Tue, 14 Apr 2026 16:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776183366; cv=fail; b=GlVPCdpY4e1cUEEs7ZlDTZkYyIOhBZesd3sgcOtvpolZSxsSIIxp4b+yiiee8CMwLugbNhN5/dDfAMqj5oajrnoE9cP9+Pto360A7GeGLaknSJiNJ1y/8k1oX+02fg9LrOFWeQhN0JmdvXkrae4HRsnowYu5QzDBMPFghyG3gWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776183366; c=relaxed/simple;
	bh=qiP6OTPZejzqoi1tLH/JbVtFEDQp2nD6mI51F/pCGnw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TtlTn3h+uBD+7h3siqzV+f7aXg4nt37FGaVexSWdx2/bFnGdGtkTYzdauTiaO2duEo0jMjcTtjuHNkTxkhE/2cywBMI4tKslzxZFrdmzt1rYbIAsTF1HRzQnQf9jxZSv1Ix3vQHmiAFbmzWDscY0d2xghurUERms0aVFmni4nj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bEVvtrsr; arc=fail smtp.client-ip=52.101.85.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bEVvtrsr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkHQxEOahR1nT2eMBbvMIitCyaR5n4IGoeTfWeu/Ud7LyX65MNFqzyI14eDd4DRDHxk+3YzU3VadLkRIIeXFYhqJ+GZSKTSBPpqecZvqHvOSNygiZgRjnaDl6Ybd2/rf5SsDrR2D29IYqXB/D7Bd/W/YIb9Y75DxQmomu9eUAn8EuW9DjhHrwazGn2Ilmw6qut2UZoSjJDKr8M7BmsegVNzXUUQ0AHnTBN/cAXv05dmjxpiE89GEVheZzI96x3XtSJldjROiKf2ZuXrGWnbr5XAUajx+MKOOEOt3IMKy1WenVaEB16i9fUjGfwN0K9KNzpiEkm94BX0WRbfh0/9Jug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XJS+QzVg18HxF782Xx9/7uE1t9kmCVpf+H7DiO6/mM=;
 b=wMLnTjIE/9jCmEhjFW5WYrbZo13WvsVrpxO//vRiln0AEEZludFXVsCARzFOQ6GNwVUye30A96tmwLsz2ufcKnbcIc5cvEY49qkO8TA/x8bwDbVlinsK3+Xb8HnFQLdY9CCtJzrN8XGImFbL3f07rolxTWl2BeHJXorYDZ1rdUbD0psASPkybxd/wjN/xmkc9Oghk5hDXjkpZ0ePR4ljNC7M7Wy6jnlxkWMcfFFe0Sur8R0rN2upQuL1e+n73VPZ10YvTERfalzMsfouZtpuSmO8g45WZaZBFPUrcQ9N3zPCT06u6/jT0vdGbGGjlzTwhD+1tZ/rIWObbaanggHlcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XJS+QzVg18HxF782Xx9/7uE1t9kmCVpf+H7DiO6/mM=;
 b=bEVvtrsrNBxcbpRHCMD9SudKge72lGX2VOKHqcYoKNRAAX4mn0F2vHziSgA8WhJ1ot21gDj2w82ZP9WAiDW3vvX8ddpthFNnK5iIvSXwzO5l0vYa1RtgLR0Ka4OncxAgjYw5DUmQeB0gTMHPCWnFWex+WmZRciqARsafxBJcXWc=
Received: from BLAPR03CA0071.namprd03.prod.outlook.com (2603:10b6:208:329::16)
 by IA4PR12MB9763.namprd12.prod.outlook.com (2603:10b6:208:55a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 16:16:01 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:208:329:cafe::77) by BLAPR03CA0071.outlook.office365.com
 (2603:10b6:208:329::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 16:16:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 16:16:01 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 14 Apr
 2026 11:16:00 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 14 Apr
 2026 11:16:00 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 14 Apr 2026 11:15:59 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <ben.levinsky@amd.com>,
	<tanmay.shah@amd.com>, <michal.simek@amd.com>
Subject: [PATCH 1/2] dt-bindings: remoteproc: add AMD MicroBlaze binding
Date: Tue, 14 Apr 2026 09:15:57 -0700
Message-ID: <20260414161558.2579920-2-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414161558.2579920-1-ben.levinsky@amd.com>
References: <20260414161558.2579920-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|IA4PR12MB9763:EE_
X-MS-Office365-Filtering-Correlation-Id: f482da0f-ad2c-433a-1910-08de9a411ea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|13003099007|56012099003|18002099003|22082099003|20046099003;
X-Microsoft-Antispam-Message-Info:
	+5MT4KREYh6hX6wlWgryqe8iwD/LUxXIX0a6CBK3cQlTatF2dXfbP2eS7AXdv3yeZXxsXXkDYVL97haDwEfHjRNuZOT45xVfmw6gpy/AL+c/FCk3uSvpSrzT3YuW3GftXspSFlbLtIdaWIQ1Gdyg+p+TU8Z1OdsbeSN/d6GG0QTBqfCmNgb2230WZqOXZY2xBty4um7snWERVAjUHn4L+5wTEW1npo4pKTCy0TJ4mNXped5VNuh+meF7hTiul9yImZHtJgQ+317JUJ3pbf2rar6B0RUbJcW8Pl4CEIL4dQpVmO5BZ/Gcn6v2xx4kNrXJgUyQByCk4TG9SN53jxH2BBvctCyiSRvD7EPO7U3SvU14Phmqq5duTpsOTaB8s7V/k7SW0MUFWzL8fvDWT8I4iAdvUXUQFI89ov4vQbmzhWDXofQiCOW9Idu2K+GdIPW11h39EkoWl6ifZZ2sNDiCh3UbXfK9BiTu/gnpUs5VibpOfKMUcQzTgFqcJXtrSy7GFJJJFfbICIHlz4+aQZkuGoMLawzrn7d8pPQmE0uMAYURqi24yjVg5HxpDJWFTaYplMnxQE40r22xAHhztVfYbrgux3SJwXW8cnr/wHrU4ycfYzfVQVk548+FiadMGcxO+c59tAB/d9Tg5B0wNQ/XtFhRAGT04zZ/xD9f7Yr1joXnWlmKN+SChYrkoGUJ5bHlawKyYnAhS5/k4zDu5Tn7rzaw245iUyjSKWAqmcNmvBo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(13003099007)(56012099003)(18002099003)(22082099003)(20046099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3K1vL4vu6/npZCjgqzVzpXXRm/jGJX0mW1LQ/1LbjiWPOBG8SuEv6Adqvcin7TrdabOkSNqcAZETHt9nXi5gfrdEFkz3lpAgnZGygiKeqxiKhau98ZxuEnAZxq3kCI/YTJbQFQ21ABZtX7KzyQttQAyFOZqRlF2QyP7aL1jYXnRdRhSueSdC82193KB/2LdUcrsWZbSqlgiqYH5dbS/R2Z5wSp6ZPhvA54IA6kdr/nvjDYMmnCs2eJXE7wKWDXxXPAxSafoboJJcseCnDVbfTfwZBGoRSZeKANfxQZ3LM0H4fsEM5DUbqxmM5S/WL/F8Ut0sAQStNpCzsRWpy1yt5loymui2Uqnpwfy7KD/SG6Viu7IEz47Qgg+gn0I7vnZVUdLEdy/YpXfiOC5SvHv+x4x8sbZRTKfDEyE4kNL5tygPzK6e57YAUbnOWoux2gPJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 16:16:01.0182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f482da0f-ad2c-433a-1910-08de9a411ea1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9763

Describe an AMD MicroBlaze remote processor controlled
through the remoteproc framework.

The binding models the MicroBlaze remoteproc device as a
child node whose reg property describes the executable firmware
memory window in the MicroBlaze-local address space. The parent bus
node provides standard devicetree address translation through ranges
so Linux can access the same memory through the system physical
address space.

An active-low reset GPIO holds the MicroBlaze in reset until
firmware loading completes.

Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 .../bindings/remoteproc/amd,microblaze.yaml   | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/amd,microblaze.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/amd,microblaze.yaml b/Documentation/devicetree/bindings/remoteproc/amd,microblaze.yaml
new file mode 100644
index 000000000000..2811610204a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/amd,microblaze.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/amd,microblaze.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AMD MicroBlaze remote processor
+
+maintainers:
+  - Ben Levinsky <ben.levinsky@amd.com>
+
+description:
+  MicroBlaze remote processor controlled by Linux through the remoteproc
+  framework.
+
+  The executable firmware memory window is described in the
+  MicroBlaze-local address space by the node's reg property and translated
+  to the system physical address space with standard devicetree address
+  translation provided by the parent bus node's ranges property.
+
+properties:
+  $nodename:
+    pattern: "^remoteproc@[0-9a-f]+$"
+
+  compatible:
+    const: amd,microblaze
+
+  reg:
+    maxItems: 1
+    description:
+      MicroBlaze-local address and size of the executable firmware memory
+      window.
+
+  firmware-name:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    / {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      bus@b0000000 {
+        compatible = "simple-pm-bus";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x0 0xb0000000 0x40000>;
+
+        remoteproc@0 {
+          compatible = "amd,microblaze";
+          reg = <0x0 0x40000>;
+          reset-gpios = <&mbv_reset_gpio 0 GPIO_ACTIVE_LOW>;
+        };
+      };
+    };
-- 
2.34.1

