Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793855950;
	b=Uit+18g4z9bxhvG4/+q8dLhocw7jIUkj3OOsOce8HYAVlCLPoFs8X9ofSwtIFp9oqygV
	 6y8DcmV7YmMVcty52yZzyB1dSvDiYLSIjt9i3o3Ett4Sco+e90vd9dzRAox/IrwvjtXXa
	 65FOLcFuEm6VKk/Kt0d3EvUAnFR6S+SyfDHU4wH0lRkeXGmH8WejlQ9JkGFx0fM0q/j1r
	 eHL0lbIwXp4xQsl3HlK4DA4Vuz3NPAnvHR5EfPY6S8ccVtQodCH5ZErjthobcBLtjLszB
	 W+1f7EDLjc+AQOejXX8Ag7X709D621fmkdxMfSLNTusM3568Mnxx8pukRqcKx8Y5qhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855950;
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
	bh=ygEfqZkKdYLvH5PzfILD+BlJxPDngifIuZOGwDu9kek=;
	b=fN63Gdp5fEL37XkGAhFHQ6rMBlpL5wwEYZkh4qKd1TIQzqUdpb+4Ys0ImVRcoZdM23W4
	 R7yNAr46HlH4fFbEuWNcTCLZ/5kfHvGv2X6ofasLpENe/9+oKGpVEPDVRRxJcRxkEkDQg
	 kds2jjo6WafUABo6IE550Sg6qJSbFrcmsK3WeVGKqJ1RAUTZnCQuTpXVJ+raYTJUL9ykc
	 +0ANP9B7cqdU/JIKpBrOaQjBx5y54ACbqU3YSqhXmJdc7MIthghjQbP6ytChPUgIDSka5
	 KrEUweKIR4iUjwucSqmbtkIO1zKupHq87SBs4qlDC7znMYmkuqD5iuR7k37SRiz0Y1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=YxB1tXyG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.28
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011028.outbound.protection.outlook.com [52.101.52.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A92606A32C;
	Thu,  5 Nov 2026 05:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1A92606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=YxB1tXyG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ulNrGaH05dZXatZjkidkml9/4M3sbw1JFj/hB8f0KF6OBb51DYs2PUy014Jb8avx9BQ1I+NpPzjUfdHQThvWh+HDUg5v9PpOHQ7TOjig1nVTe4FJIeEdDmho8BRLwauj37Ug9mHzcDzmH1Sn5moKoHMfKvdD5FqhwCvZxZThQs8o8N9KNoX422wwZ+PFZmjoUtdJE544vs++ugjUtBa6vjPfD2dD0vM4yNn1DLyuTgRuHMltebmG6JNwG4K3eRqrf/IygEXLhdPEiOYUNBYS+GsFjvKeYtBu5hg2cXpH8pFOfemhjvAoH1WndSzT2V5i6dd68+6LuXop2n9ITe+PFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygEfqZkKdYLvH5PzfILD+BlJxPDngifIuZOGwDu9kek=;
 b=HZDUyR2BHZHWugTH58VcFTeYT6puYrWc2FrE60axj3Qrzg0mLyDhXFnhArRbyljTUH+ElMTsezpQIzU1YGR4O6J3AaVDLuH1YpQOhhkUyXwXgLN7aoy9gRThm73obo2oRLEYNu/M5l4jkq5PObp4q6Tm/dzaMplOx5RgEAcH8R57yxi85YkgSfl3JsBbVCnO86FG+Ua0JIqaFH6dl0CTpRkiWmnko5xrJi6ql7M54O936oWFxjiFjt0sFFd5v0EMGBLnoFHGrIctqD07bleA+SkAndVbjGxXZCVstNj2zsgLKn7etv6gmHuMxUIxoySkynMg0oVhgdpbhPbtJZ1RDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygEfqZkKdYLvH5PzfILD+BlJxPDngifIuZOGwDu9kek=;
 b=YxB1tXyGwa6szSoUEVBYbSYkghTPCYlI287+qpzFKga4t7zXhit2AjvSeYDKiJeb/WA3ZicmW6m3C/E2AR+IVhk337zoaBwIT+wZQV3txoKzhIZuGPIAsPrQAXpOM3D2gooIj8d1n/UwOiDEtMMVVi1lEJlwFRnc5DTHPQ6wHjY=
Received: from BY3PR03CA0027.namprd03.prod.outlook.com (2603:10b6:a03:39a::32)
 by SN7PR12MB7979.namprd12.prod.outlook.com (2603:10b6:806:32a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 05:19:06 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::22) by BY3PR03CA0027.outlook.office365.com
 (2603:10b6:a03:39a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 05:19:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 05:19:06 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 23:19:04 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 23:19:04 -0600
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 4 Nov 2026 23:19:03 -0600
From: Ben Levinsky <ben.levinsky@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <michal.simek@amd.com>, <tanmay.shah@amd.com>, <ben.levinsky@amd.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/6] remoteproc: amd_mbv_bram: Bound device name formatting
Date: Wed, 4 Nov 2026 21:18:57 -0800
Message-ID: <20261105051902.1646651-2-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|SN7PR12MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d8fa826-68c2-421b-6cc4-08df3afc5030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|7416014|1800799024|22082099003|18002099003|3023799007|56012099006|10067099003|11063799006|261026140227099003|261028144727099003|261102123227099003|261021121427099003|261022105027099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	DwQI5bVxnjGLGYAFQViGJDOFYClFC6UyseT7QvNp2/949/ZfXyNp5cLYlhRJ9yb1b1F7ieNvXxn1lHM6SSgmRLnsn7aTQgIGOzEdK1QRJq4pU/SXyT8hUHkJi6q1R6FwgcM6gzLqVxGbLl6EEJ/pCJdWknf9QWpU6Y7TWU/mb9QicGD3OsF7tvYDI1kJnonBsPPeQakrCV99V9e3NAqmmuLIqs5YCCLZ16XsgzXRxhbt/6pof1MwTy3icmPENy+G0zXikuLRcq6ynxd0i+LegqS1Ut+vetqy1Wt4ZMWYoViGko6VwHf4pzn/+JCT1O7T01EwDw5NheKhRXpFE8n1ZdTAXqzAyFaZz9ZVWestmrNFSKvTsQgXfpyftu5QRouLukQluCwaIQbXnM8mIr8i2BG5cqwlEq6URBa1pak0d3fXM6R6fpTf8u8we7XLaPesg3hGEIPzdPb6rqLOMi6kffubBVzY3nLII4dyGrlGE5wq2vzH5zPOlA4z+L7tnA7fgwYewL5xC1UinRFYA4cTb3/r1ngQyWmtFxv/7x4DGnxXYCJJ5DZEaFhP2pYLbr+YnyAl91f3gilKwt+bR4RjISd+vB1h/7okAA4PORpR694fEI4UIg0EEnQwUi1RnC0u5ZQXm3uZQZ3A15sqvwZHqRByYCpWcZePkpdSTvBCLRgceZhnKh8Gh+EwQuTQ3uuF60BFTqzb/th4jnv/n/ebjg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(7416014)(1800799024)(22082099003)(18002099003)(3023799007)(56012099006)(10067099003)(11063799006)(261026140227099003)(261028144727099003)(261102123227099003)(261021121427099003)(261022105027099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CyLEc3IcVdM7K1UPtvfvqJs8jO1xjLZwtv3nrqfcWlJE88S7uBRgcP55dpZb4JNnwy0IGlauAlVm+a/lVY2/4KI9kHZIUGslkbI36KFoM6R1czfZqZSe5jiG4SsxWdWkCpB+haHpeiQUMTCA5nKXePN3eGZJLP/h//zB/h2IYdVdmYka77kbahvk4OIMuu64/OLCIFcZtoleg6EtLd/1+BgqY929QDNrNt8aCJR5MJ9zGU8T7e53pLF2wfFpRdDqioptxC33A5aqNwpevmZhYKSWe+aAQSRYNWcLXz9+m+xVvaPUN7m3owPC+61w1B+Tqj+QEF2zDps6kZkKlGYL0Pei5xs9ne+ZoZEwX2JQvgFeHbz+xvByXazcgAy5wyS9GpVAQJLFWbOe6khsv5dU+3+C3M2pCv9gm5ZezDtN88vWZwL6hyNXXlGif8iyEUp5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 05:19:06.0095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8fa826-68c2-421b-6cc4-08df3afc5030
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7979

rproc_mem_entry_init() interprets its name argument as a printf format
string. Passing the device name directly allows percent conversions in a
DT-derived platform device name to consume nonexistent variadic arguments.

Pass the device name through a constant format so it is always handled as
data. Limit the formatted name to 31 characters to match the space
available in rproc_mem_entry::name while leaving room for its terminating
null byte.

Fixes: f87b4998994e ("remoteproc: Add AMD MicroBlaze/V BRAM-based remote processor driver")
Reviewed-by: Tanmay Shah <tanmay.shah@amd.com>
Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/amd_mbv_bram_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/amd_mbv_bram_rproc.c b/drivers/remoteproc/amd_mbv_bram_rproc.c
index e4a103cf8455..6cf33c7b7e64 100644
--- a/drivers/remoteproc/amd_mbv_bram_rproc.c
+++ b/drivers/remoteproc/amd_mbv_bram_rproc.c
@@ -72,7 +72,7 @@ static int amd_bram_rproc_prepare(struct rproc *rproc)
 				   resource_size(&res), da,
 				   rproc_mem_entry_ioremap_wc,
 				   rproc_mem_entry_iounmap,
-				   dev_name(priv->dev));
+				   "%.31s", dev_name(priv->dev));
 	if (!mem)
 		return -ENOMEM;
 
-- 
2.34.1

