Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012070.outbound.protection.outlook.com [40.93.195.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6350446075;
	Wed, 14 Oct 2026 21:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013685; cv=fail; b=rQxXJG2xhDANIn/ervnM2wWr0fzY6bHi9zZJdLIC95m/rBF7YDcDMIoRCG37s6o92/yZhPGXcphfQkmxZd69S4Goa+MWD5asWs/oyvHqEKkzMwtLUhu1LKbaAq8H7/HMZvJXYJVS1dahn2lw0xIwt8WFTveLzcHX0yofXGf2jKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013685; c=relaxed/simple;
	bh=NfGU/TG9kABSWtaamOCXRC8FlJnXoZFwQeS36F924vw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kLwZSkRgz9D+5ArE+5QiCFoMAg8+y07933Yefg7jfCC2zc5wa1N9cZuBGzEeZkJ6HnskV1hwPyJFP4DjPrDgxtg3fuTzzShMIyBrtDYs5ZmdJXqRcpwvaQXbjRfhHqF97kmQEyHnPMKOUIqVFpS3/flFkfiUzAwFiKZBDH6UYQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OCLG3sU8; arc=fail smtp.client-ip=40.93.195.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OCLG3sU8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YslJ4KVRYzaD0xQFPocmcmNgy09Uxd7YoX6b781bu8PPAsWIqr2q6alCqT2F3q/WOLFJOtxTh+ExTVfFLjbbaf3t2vds5d0XczVoi1quG1oDiEjJRwDzWzT1whk9qIC8uBtZJJGQmqywy364Rcn+YbQ5zdkb4HL9GafW1shPuHmYbVNtTlueFJZxsf1NeyWS7S4tikYzyjX4dn49sVhV67mQHzzHimk5QQt3N2s3Ze6HXFTq0qnngYhPUoVQzJ26zbumE828uqR3+9vvQR55b7F6rOyvwuMpcffbtd7UtM8pucaeO9O8zQ1bqrdoBgvaTwk7QuUNvZCDFIMrrJH7rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXvrMgctduVssVwvXdF+DAJWr+bP1CJlVJvxYYnnVsc=;
 b=fAeHfIrfU2lZh8IretB50mePGOPPAtHEIgwT5BI3uSktlKkHVeLRKgvJOcP4qD3805FOo5qBm7bBxs9mIY3oYcFgg/jLeT18nSppQJ5x/STfH022SuXe/PXTZzc551VXRCZxVHJVoZu+58oB0gHenN1HAXafgQcNuu8mayXpSfMJJkdznCSnfEWdJo6KnAe/1MGeqULNlQPKsSUls/PyExPcWiXsnciutiai98+oxUw1S1IOGUrPQGXNZh3g8PmRNAbjj3tMeSQPgpUAHTZ+RFAvipIwWV9z+aYg/EwOIYB6MYeagyEhVLYqSz+Juib8u5arcOCGokDQ4BE9Z2UQwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXvrMgctduVssVwvXdF+DAJWr+bP1CJlVJvxYYnnVsc=;
 b=OCLG3sU8bUnDyZGBTsP2HTAXtGTSdNE/2PHWaTrYybw9tLs8tIQpE+zZT/WBJw+kpzm6xNKm+yCnEEl9Ciz9qRXro6MVx4NQ6IHQa4u1q9oQlQtixtYt0dxevcK9UzEUKVosPcYX8aLcDQFNxVZ/P1WGYMLioZ2GXoa2kdZeSuw=
Received: from SJ2PR07CA0003.namprd07.prod.outlook.com (2603:10b6:a03:505::26)
 by SA3PR12MB9180.namprd12.prod.outlook.com (2603:10b6:806:39b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 21:34:40 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::66) by SJ2PR07CA0003.outlook.office365.com
 (2603:10b6:a03:505::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed,
 14 Oct 2026 21:34:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 21:34:40 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 16:34:27 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 14 Oct 2026 16:34:26 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <michal.simek@amd.com>, <linux-remoteproc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <ben.levinsky@amd.com>, <tanmay.shah@amd.com>
Subject: [PATCH 5/6] dt-bindings: remoteproc: Add RPMsg resources to AMD BRAM rproc
Date: Wed, 14 Oct 2026 14:34:25 -0700
Message-ID: <20261014213426.2957480-6-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|SA3PR12MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: a84cb955-51e6-4988-1bab-08df2a3af463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|7416014|1800799024|10067099003|18002099003|22082099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	WYssfyAwxQ7yWdMmbALdHp4xj1khq+3yE/w+YZs5IoolnxA1BPAgim4qLHvV8vaVSW1Bssa1VHOBMDvgEqXskmZmqOFzM8itx/wVVSoppBKE41ihD2dFimmhEovgmpfs6UqST4ExMScp0G7jfBGO1JJ5urRix40H5chyw4emFgzafQxAEy8NGxZOcaDfOp8CgPniOdqzunI6y9TMmUYGek9JsAeVxjQ14BDoVs1vhDgQncNjek/+M5YoZzSpUBvH6rwIhAE/df3ZSvSjA4vPjIPi1Zc9XZa2c80irbYSDaJGYMmQW+IIIowFRj+fQeXvn4UmkZTg6irHaC2L/9Xrhn/3BdwoWTE/Nmma8ddWnq+UPv8LwPENea3zxpRjiYf3LVgoOvLbVQ4BwbFNiOFJI4EnBp/ye9i3RXFCJpyqcGvaFGas+5vWn/bkHngR2xTu+e5zcEiS/4ER2ZZEj/I3aG9KZX3oLCprPMLNrhouC/UocMvKZIeDBQ0gyfHtusvVtA+Ph1eOsxnesXTG7W8yS4aXai41WnA3q5TgA8h3iM5djt5VzqW/nPjC74qAEXyz9gaTAUh6jXB5yE+dFA/Phcb9V6ryN8uoN/sBk9QizkGPa0OX8gDH0KZm9tlmNaR4mjexpGftUDTrAvxo7SL9pwVg1lOTt6jnP0lQ5Ai3LhKkOmjUNqEP+98e+7TxDsgz7A1zOzu7pSHaUCm2zDo9wA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(7416014)(1800799024)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tTGXw9I/BiPfeOFEmN8csMT+P9aNz27iItra4Ne9095z6bRzevvs/e/mTxy082/ajL1R0YiLpmPYq1tGFQ7r83LAtjsJecOTpUQtU/mACdest5rndKpEPQFmBqYfIBKVFlTtkUikIneYdOEtSGIgqPC6NEWPzViFbvFHiH2nHJU/4gWZYIpd2bpffr4n3IYwCt3iexuXeOQVqh6KKBll47GocNdxwLYurj/E4jLonJcNWpYUkAXEfSZU3m45Zllh4Yy7p8W+5++3AcBezR4Dlhd/7vH1yid9cH8GnnhqbA0MbVwZNyGEYPautpqTR2hqUkfS/bv5IkdBd73i9uoHRYMNu6zeaKqTZiF7lbX3PsvlWYnmWfE1yinNHa3VvPjYy4uimTpA6c20w+XK/YdAJjb15KF/+ud1lmyAukeSNyOuZyFFw1uGM0De2WR+JNOR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 21:34:40.5206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a84cb955-51e6-4988-1bab-08df2a3af463
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9180

Describe the optional mailbox channels and named reserved-memory
regions used for RPMsg communication with a BRAM-based MicroBlaze
remote processor.

The three named memory regions provide the two virtio vrings and the
shared RPMsg buffer pool. Firmware and its loaded resource table remain
in the executable BRAM described by reg.

Assisted-by: LLM sparse
Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 .../bindings/remoteproc/amd,bram-rproc.yaml   | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
index c0359f447ea8..daff8e615ab6 100644
--- a/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
@@ -84,6 +84,33 @@ properties:
     description:
       GPIO specifier controlling the soft-core reset input.
 
+  mboxes:
+    maxItems: 2
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 3
+
+  memory-region-names:
+    items:
+      - const: vdev0vring0
+      - const: vdev0vring1
+      - const: vdev0buffer
+
+dependentRequired:
+  mboxes:
+    - mbox-names
+  mbox-names:
+    - mboxes
+  memory-region:
+    - memory-region-names
+  memory-region-names:
+    - memory-region
+
 required:
   - compatible
   - reg
@@ -101,5 +128,9 @@ examples:
       clocks = <&pl_clk>;
       firmware-name = "firmware.elf";
       reset-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
+      mboxes = <&mbv_mbox0 0>, <&mbv_mbox0 1>;
+      mbox-names = "tx", "rx";
+      memory-region = <&mbv_vring0>, <&mbv_vring1>, <&mbv_vdev0buffer>;
+      memory-region-names = "vdev0vring0", "vdev0vring1", "vdev0buffer";
     };
 ...
-- 
2.34.1

