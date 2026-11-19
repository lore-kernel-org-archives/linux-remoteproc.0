Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795125861;
	b=Te8rJWlLtv5GrhyRRRuqyFO27XB5bcKbnTlr6mpcYFzjlQUgQkPdVc6VmziP6VVLyQDo
	 TEcTdbvnR8oVuJHWffv5R+lhv+T5ZjcZP5DeByNj7AsuN9N+oJoc+fQdpQ54ey7g1vCpu
	 vN2MDAzT2ef18+Vple3WXFgUO41sLLfcTvKix6jeOpvdPeZYwZAdONqtd87mm4kqTp2o0
	 797oOxnY39W9zfsHzB879w5PG54RVc5VLHZZEficRMVxZXSRVdtZfxQT+ippOXdAExHlF
	 6qdwjmhzsas9UKsaLWBSz9YevLZIg2Tp9OfzMswDrOH9oY/XHajf6tOq+JX43ehEBtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125861;
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
	bh=tJO3qXnNpv+2wVKUKKj8FF/e9naOYSTJl9/QQVdz3aw=;
	b=ScjH8e4Jo94bq2RVRwJarWM9aaFq4P9kjp/Cq838QY/cK5Qf4VkfWcNBRF6SuAky5179
	 kSDYROXZlyLP/FVx0/Rrhz+erH+V9cpSzf5e2xBnO22+zym3PDNLZJ0dPkHqxLPtEtaXJ
	 li2fwG8BM8CEmnlNYyb0Pu+EV1ahKWEVH4qeSogTm6oQomHUzhLj+ien3nfm80ZLRfBE9
	 JnyWximS9Tl+M6MfIA6845HrdBBLtQ6DhViAhvi4lcIYW2t9enmhu+aFEGsJvwNJX0l9w
	 fG8vjdPPnxt+JeqoKqn54XtEwv0cN+v2sLh4eo3nwOwQVx645kd8TzZO165Yy/TTp/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gh+cyZCK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.39
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012039.outbound.protection.outlook.com [40.93.195.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9878B60A2600;
	Thu, 19 Nov 2026 22:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9878B60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gh+cyZCK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eb9HWMHhTHH18xRYHIjmx212wHIoQF1DVMv66Y+UzWVKn3pmMIjd3KO4Nvk2dfy4QumDcO1y2jpXC/7Vp6Hp2L7vpXzvX6swYFGVro7QIpFg9NFCYXnJRW69lghVwjbGUxi0AwmUY1iaN1euYjfJHbTSTwefSoWARmVuCQRquh2suPPyZp1yrLjW+VeBHCEOPb7knC5NCpkixTKVDgyoI5ziuuuo2bfJx7zJn1LqXdrtvHZuT/sjJqVqNhaTBfXe+2ny+3tMH7y7X/UPPa1lf2fdGCxGMmAYdYqTLDdjZ8TVCuMX35tW9VGGjKRU0HnLJpP81zFlxiuhBkAYtkvUFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJO3qXnNpv+2wVKUKKj8FF/e9naOYSTJl9/QQVdz3aw=;
 b=WHSBEKMhul5A+7GsweiE03KwRpao3xbezfsLgW/rhYqD8p2/KDiM9zKfUXl6uBzUYN9LzuExY7wDJ91hVa6YnubigfSIK+aVR8kkcHkd55UywLnbOE0yZjjkrWHgcUObUQopiNKohDJ1v5Cij489x7xAxDQxE2UYQfJp4kDr3nUqFTFQZZ96ctVLPrFf+DwSDs3IR1Hbbx0en1VrwZAQH3KgnOzGisbpv6j4khextl8n8GmGHgyvia4I8FV0lC4UBwYiXC53VrnrphO5AP+s2sp3FUImtekMQWJPCMrKM/RXdAyH0/tvHq7crATAGF4+hYLVja37wrqlcOEI7TfFbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJO3qXnNpv+2wVKUKKj8FF/e9naOYSTJl9/QQVdz3aw=;
 b=gh+cyZCKYuoGUQuS+0oTqNzBaWa3C0wBHVge7c5VoO5DO8r8G2Abt49upZgCjNedNZQKhaMU/9WlFrz/UizYeyqsjbKkMkJsZL4fXmFR0kOtT+dNp+tLIM/DTIANMBsa1kXeQLZ06UGHCA/Qz/oC+cDBOQCQRI/vXYw8Qn6zblY=
Received: from CH0PR08CA0020.namprd08.prod.outlook.com (2603:10b6:610:33::25)
 by DM6PR12MB4372.namprd12.prod.outlook.com (2603:10b6:5:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 22:04:17 +0000
Received: from CH2PEPF000166BD.namprd04.prod.outlook.com (2603:10b6:610:33::4)
 by CH0PR08CA0020.outlook.office365.com (2603:10b6:610:33::25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14
 via Frontend Transport; Thu, 19 Nov 2026 22:04:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF000166BD.mail.protection.outlook.com (10.167.252.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 22:04:16 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 16:04:13 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 16:04:09 -0600
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 16:04:08 -0600
From: Ben Levinsky <ben.levinsky@amd.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson
	<andersson@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <michal.simek@amd.com>, <tanmay.shah@amd.com>, <ben.levinsky@amd.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/4] dt-bindings: remoteproc: Add RPMsg resources to AMD BRAM rproc
Date: Thu, 19 Nov 2026 14:04:04 -0800
Message-ID: <20261119220405.2838553-4-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF000166BD:EE_|DM6PR12MB4372:EE_
X-MS-Office365-Filtering-Correlation-Id: 41ad9b2a-4984-4f05-fa01-08df46890df8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|7416014|376014|36860700016|1800799024|18002099003|22082099003|261026121527099003|11063799006|261022105027099003|261028144727099003|261026140227099003|261021121427099003|261021135927099003|261102123227099003|56012099006|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ISsKAeAcNm6wyKb7Y7fkDJ/0BOWJJ7R8hkhNNzVQXS4XBcQj7trFyXXK003I5Fza3CKSRmJJe/uucrsKIUUYY5oHoqM3RozzcBrLPRvGynymEoMnvBsQMum+sDi6s1WJ7XjYkNh6HNfCRPzS97iEgqVbCl5Oij/QhzR51nfoMo90ZTLYeOEZfdhGUMrE1imnVpHB06w0yYuY9pVsTIkXx7FYiivwRgQNU+rUDO7iUh40I8ydgMkQ+TMYsTHAvib+J9k1TMoHQotWqj+a/xXyksHpmPEjHD2J+39+OPHvoF6ySdTFiUGAhn1ZxK6QmwoIqsPSiN0b5viLTcV2OjXR1LYMsSQKjxaiDf56JjX7pfmkWy8W+zi/WryvhyuTBRtIF80dXrtHtrRp6d4RRR2Rs3U+5/mrLMUI7QrOGS1mATYgcPd1Zf1AjBiq3kZYGpCCej7X2DBuN7mFmjLSNYxu3Ao2d/Wn4LcH6cpozjVHBDcEr5VdVDaro8fVE3BUVMx1QeQH3XK/t9J66dhmKIGzEoBWwEoWd72+so4ejaB/do/EM6CSuJNGFevIkBsErR/uUZ1TQD9ylUPeBgTLj+tW97K12CK8ipimlgqDv0yeo8HmthZIQOsDnTavdbO3dp3WSHfMAJ42hTYK6t/Ye2uYyJ4L56sLQ2uBuk6XbwK4XpQuoVqVN6QG3nsgg/mM3f6QETfrpRoOWvPvg0I9CWOJvA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(7416014)(376014)(36860700016)(1800799024)(18002099003)(22082099003)(261026121527099003)(11063799006)(261022105027099003)(261028144727099003)(261026140227099003)(261021121427099003)(261021135927099003)(261102123227099003)(56012099006)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4JJ4tBUmDdzYna+b6nTPlbjV6NSSWJ7enihRUUlb2Eb7+5vGTRpFo+IA3znept/jVYGVHaLTDAuyN7ZcTiuHhVHrkZiXm5ahvhBMJjNoEMsqDBzHr66CiJ8H4xnijOph4NHnSXZGLLYYgZBDDCRQlG2tNryRDR+c9nryfNKiZ9m4VmkFMQW6FtIEVHdgHG7ZdXOGw9lvGRVdpR0iZfjLqPWcO2RygvWJ3z5ko8iv7b0LSqO3SCzA0g2j9uEAY8JhV89bTmyTjPqz+PcnaHeQG1KU8rC+w30AOKh0eKdQsTIOdm2Kz5EYum2wj+Pl9pcpeo4aqRMqnanE+TPe2/yxm9J7VjaBZnvaeyPoaPNyhuycSSnIUksdtfi85C7LxjSMG1REH0xQEvZARjBdtFhwC3k1U4lBmM1oLDpMO0gWTCabDK9g6QasHWuUiqqxZ97/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 22:04:16.8213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ad9b2a-4984-4f05-fa01-08df46890df8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000166BD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4372

Add optional mailbox channels and reserved memory regions to support
RPMsg communication with the remote processor.  The memory regions hold
the vrings and the RPMsg buffer pool.

Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 .../bindings/remoteproc/amd,bram-rproc.yaml   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
index c0359f447ea8..462bd4be087d 100644
--- a/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
@@ -84,6 +84,23 @@ properties:
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
 required:
   - compatible
   - reg
@@ -101,5 +118,9 @@ examples:
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

