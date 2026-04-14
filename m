Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013028.outbound.protection.outlook.com [40.107.159.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08E33E9F71;
	Tue, 14 Apr 2026 15:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776180565; cv=fail; b=XWvRG0QpH05bAQoRDl45JGK2rnOlRI3vVdp9OxVL2Bom7MwumDo6JAOzw648zcwi3AcsHvdV6cPEqHBs2mOlDF6KYxTAbine6jbNn4Q10+WWaKEPyWzYVEdWKEm7AwurDKC3IaQtUhutLV3dUExDT+EHSzGzEABMaiskYJ3Mplo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776180565; c=relaxed/simple;
	bh=bBNisy1+XuncrTLdsJFgdPaI8O6s9yTF70qyU9+8Ykk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E/KzAg8LTDTA2PeN4WyR4PjxbfuvmbThr0RYqSCYNvnjqIyfHwZVFbjexLlVNgEtcnpAXllYdcozMx6cI9AK6bSq39sOOcHUL5MCnH80stc91fnk0KenwKuaUfsIkZyc5fwsFZvGW5Dy23wpNaG8d5uUbdldDgAbNK4IJfDIxLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=OYbQrftP; arc=fail smtp.client-ip=40.107.159.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="OYbQrftP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLYAxrmh5MFb2EiblkN3PmvkGHuz4k8ObWFMXyYJ1m+yhv4uHwxkW1xRSiK4TbbMQB/YcZ2EY/jkT/TSKHgSQc3QYmoohS8srs50Dr1V2EH4JgboueCbXFEZqG4gKjxZwZ+GYWHrhstQorKzi1gMA5KP2zq4MmyLbanM/vAlaPuq6VY7HhFsFyI2U+dV20uSkMqWpcH5B1aR42usU79FqpDidl7oLpfwKWy7Y6ADUnN6ZeZjddcF3fbAnnFa44XbQj0akA8midMGrl9hLBPMmeNRlBFKLjG6FDUKTPCT8UiU58mRcoj6wtSD5+XkcjG3mU8cRR1nMVP5f+Hin/CAvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reO8FkVOSCmvh6cNS+XOBBthpeRomlgGJxelQnXGf7c=;
 b=BdyJ4JiCY/5kj9sYFaO25fCGVrUfeJ1gUkLwuCg3TwypxFLV40NWU9N2q6L69PDt9jjdysjHnWSvIYjTUZ9WgoSAOl8yoKxq7BSVkGLnC9vI7Ve4psnfS3/K6WjF/0tIeS1uRfpeGzINt4sS0onedV1mEFQiBq2Z9dVRvA94F/PQK2hR/VmU6mcsQJyVpI27bR+Iz/bh2ZpcUr/HSdeq5+iqrzh2MxFMDcdLSRIIZni9iju1k2mb56CfkSsW0rKUPdDDMDxHNBi2Fbh0EUHyINK96H3qPBYcuYdiF6WGSdCnCUpCt0kqxvGIq/x/fmEDGiu0OuUjS/EpFdoUWkNDZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=reO8FkVOSCmvh6cNS+XOBBthpeRomlgGJxelQnXGf7c=;
 b=OYbQrftPixs49tSY4a6AbbXSkrbrODcvKcAXgDAoGCaNZspy9CmgaNXJOIXACVdqQlW67eeCVNOAN7tigoYBtqA1YxNk7+ty+jwDfbZCfflTqepga915py0oe6GdeJkee8Fcgqr48CkjICvuF9odWwyZWb3J5Wh4NhVwKbCrJ5qMEc39pF0Wzh8vLJh2+FvFU/Li1XwH8czlFZ32ngk1sahWRgs/FoiXrbB+HxYSeSGuVimh0RiwL5xENPw15ETLO0UOt+prJRFi6SpZGyFXHhl6x6PEV052jT9LtLf+JnXptYeeSvafn+/wvKUqbEWQhe8YAuL41llatOUvc3UjAA==
Received: from DU2PR04CA0048.eurprd04.prod.outlook.com (2603:10a6:10:234::23)
 by PAWPR10MB7198.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 15:29:17 +0000
Received: from DU2PEPF00028D0A.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::59) by DU2PR04CA0048.outlook.office365.com
 (2603:10a6:10:234::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 15:29:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D0A.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 14 Apr 2026 15:29:16 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 14 Apr
 2026 17:32:04 +0200
Received: from localhost (10.252.12.46) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 14 Apr
 2026 17:29:15 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>,
	"Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
	<devicetree@vger.kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v22 1/7] dt-bindings: firmware: Add TEE remoteproc service binding
Date: Tue, 14 Apr 2026 17:28:56 +0200
Message-ID: <20260414152904.1679724-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414152904.1679724-1-arnaud.pouliquen@foss.st.com>
References: <20260414152904.1679724-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0A:EE_|PAWPR10MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: 614e3259-31d6-40d2-072e-08de9a3a972e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700016|82310400026|18002099003|22082099003|13003099007|56012099003;
X-Microsoft-Antispam-Message-Info:
	VmAP85iVx+bvd+XqJMs8KQIefkELkuNuaFXVeSZOhMwS4f3DHU0fWir/esKQUvtvqPl75ha743MDGCNY+lI2tXF/Dfg8zDafA6+pHNH7xFDLZ8Ofsv3eP4Y+HC65mjLpAr7cnVjTGHRZsGY8alQKy4TXwX8QD8XQ1e3OCuJg5AOv/nZM+886hHlaxVAJbM0c1f/ZSZ4S1EM7UqNKDqhvhKlRnBmm9TxyJLbHJ3FfUoM40/73ZJSctu6dZsVMxNfpjs01HbJQgyJnK+0/lwWhR2TbvMfKmQBBdHHs9dvP6hzJ+eXXCL08lZqiQ8FTRao5o3qwdWBHfC0zhYJ0V7W5LME5UIwPoFalt4XRvTbrvAteSWePA+NTplrTZTT26oHpLaJSy9dGAJ/k2nnEjG8bhzzB34Y8WrPmAYLzM4F30Uwl/KHVYcue+ppCDasVGMsc9cez7Exl8f02ph74Exas95k1Mk2Vo9mq4nvGghQbPek6Tf7SHk7qkrZSIeLmfwHXcFCfoepvYmg5VpWhGUKzxSkRRGtO5lVd4JAcz9GFonUrykzSJ/th8vJRm3siVDPSiyGaj0RRTPGW+hanrV6aO5xdAtdGC8c35dz3G1OdOuAU7XZC0YnhDiGJ6z8C5UTR1BXKtkBsZl1Z07jWuYnJoJQfeMvOjBfXCQAfT2iR++oOYvgov8DXxIS4vjXS81gXOrPXo4b6AgK/MJOPrjJC/ZC0TGU5J2OwafTGp1y7mVg=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700016)(82310400026)(18002099003)(22082099003)(13003099007)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7Xbfp0B7/V6RVxNjkxj24oyoIJRP334N+gWsm5feRMoUvqkN6aepSb9sJHdrkuPNW8m/HqWsrIMLA2T+UmQn/6i5hUeKqS8fRA6w0+LvgyAAZlvZ9y+I9cUfu1zxMiAkKcHaI47OwexbJzJ0QVvcERH4AFbW24DPgLg9rHJQ9nAdZd5WYPy3mQVezf5xZ9tednFOQD3ZX18hiHIBesslOgxjtzbLGlHOcDmRKRvPYMG0gnbt8HWfodIBASLd8yoXBsjWoQizBKyTwRMoQ2J2tvicfnJND5uNUr7xreqda0ku2aLcNxTVUkSJ60242ni8LVlITIrKO8CxLYa7q5WObnCNW1qWs22aTqCZxRNB/rYC5/2nGXPRbtyZnzLJ1oXsq1t/0V3B/XxvgYJ7m7v3wcp6S3JIkfxm15fjMEG1t8+tOWQFzgo7AdUK/q4WDYaN
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 15:29:16.7247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 614e3259-31d6-40d2-072e-08de9a3a972e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7198

Add a device tree binding for the TEE-based remote processor control
service implemented as an OP-TEE Trusted Application identified by
UUID 80a4c275-0a47-4905-8285-1486a9771a08.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
v21 updates:
- rename compatible to exactly match with the TEE UUID
- the remoteproc device driver is no more declared as a child,
  but use phandle as done for the SCMI.
- remove linaro,optee-tz bindings update are now useless.
---
 .../bindings/remoteproc/remoteproc-tee.yaml   | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/remoteproc-tee.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-tee.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-tee.yaml
new file mode 100644
index 000000000000..498a7e590905
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-tee.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/remoteproc-tee.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TEE Remote Processor Control Service (UUID 80a4c275-0a47-4905-8285-1486a9771a08)
+
+maintainers:
+  - Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
+
+description:
+  Node describing a TEE-based remote processor control service implemented as
+  a Trusted Application identified by UUID 80a4c275-0a47-4905-8285-1486a9771a08.
+
+  This binding is intended to define the interface for remoteproc services
+  implemented as TAs running in a TEE, and is used by the a remoteproc driver
+  to bind to such a service and control a remote processor through it.
+
+properties:
+  compatible:
+    const: 80a4c275-0a47-4905-8285-1486a9771a08
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    firmware {
+        tee_rproc: optee-rproc {
+            compatible = "80a4c275-0a47-4905-8285-1486a9771a08";
+        };
+    };
+...
-- 
2.43.0

