Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012018.outbound.protection.outlook.com [40.107.209.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04122877EA;
	Tue, 28 Oct 2025 05:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761627684; cv=fail; b=DlYH0Q9trJKW3AJsUCUcujtCl3cKDJgiuN84eiIGeH86EG/FZJ4xH2Vpw1o6MNnR+L+3jBbMS2ZesxuwPKezACpCsZ2nZrgfiE80j1SC0QpeH4fFGtnnEaXsTLncjYxfjupHZ5XSz0jdFUgG6yR9EkbRkIBEr2uNJa4O8IAqnA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761627684; c=relaxed/simple;
	bh=H/Bf5lVVpb0cCp1D1u85yfU0hn7X2x8+9OpRlX5ScbI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ozl2XyTLDCf8pt62W6MkTox5CzMT/G0c0RG1AA09cJymP3AkGik0xvHGzHFTwIXcOqxr5TnDlAimq8SY4ZGBfAveSOCfJP+mdz6qoIBXbISnpigR4TpgbRQ11viGJkp4thdC9VMU8Ii41CSqb1U1HFrmeRzGE4tKn53sf7pqbMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jftdzfHT; arc=fail smtp.client-ip=40.107.209.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jftdzfHT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKxVhWm2EmtpdJfDgknLA0xmAnmNa7LpYxtNk9TPtca6sVAw6i31tVBxnhQEfP8VAJPLn95zp7VwhAPGeej44dDenEoBAcVEmHPXmA3J1MmLbHzvMcaX+31IlIXq23D6g7DrhbZ/Dfo+F8QIMeUskgBJT2lawmz+/kONFegCOF3XakJHuvzeByXNPWW+ECnOkpY8N7qfXDFyLWYzthvGxxm0ipaB2hd2QIGoXzY9KD/Z4KL+bH2O3K5w0wAxyEOLVLePs5DW8oDXY/Ci9R5HUWuWq/GhDOExvh+iCn+ESoggt0hEfwAb2q43gR0dzi4Eh6m9tFVS9SUPmVn1KcnbnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wg58zOMJp3ycszdzXmtF9KIFKaFcIuG7Z8KqkRG/qgg=;
 b=C2MtGUw4k6cChilzD5qIYZBF7KM4FTJ+TkZfpB4zJaUKqfuHn078xHvHx4Z/zvELYI6XvLF/DLKpHLen6LlNUCfbYC02bKyA4wxQoYYqrY9feo5ch1x23s/84EVtPGUBOtIPWDvwaQ8JhjU3szOT3P4C/U77yVbcOkJsW6o1TzJM7NgejTtJPtWrT1vfJvNcVbAGnFOcCJL04lLw2Og9HTL5r1z8jDSsMpOYGmL+RtgpCSKYC2mUzr14k9eyOl4lK6QPf97lRV3zfa87ZfMVecb5IoiePdfXXkFeG2L+Tx+56yYubyFQkmKKkFk8k4zEEF1sA83nPTZJsaAIXyrORg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wg58zOMJp3ycszdzXmtF9KIFKaFcIuG7Z8KqkRG/qgg=;
 b=jftdzfHTdmn/p2myzgdNPFvx5xyvYHzaoY10LdKDLXhoPXC/0vhDKuLHDMqyEOjcTgVlKB/hy3WZ/4MUg85XXNYemNS+WoKIdEKiM0FnhIdjqHV5kxOUQf1f5RsYSy74bEUMIS6NlrxOEfaudv12aHqwqTOr4OXJwzUOZrIU7rw=
Received: from CH3P221CA0028.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::13)
 by CY3PR12MB9606.namprd12.prod.outlook.com (2603:10b6:930:102::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 05:01:20 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::95) by CH3P221CA0028.outlook.office365.com
 (2603:10b6:610:1e7::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.16 via Frontend Transport; Tue,
 28 Oct 2025 05:01:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 05:01:20 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 27 Oct
 2025 22:01:20 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Oct
 2025 00:01:19 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 27 Oct 2025 22:01:19 -0700
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH 1/3] remoteproc: xlnx: enable boot recovery
Date: Mon, 27 Oct 2025 21:57:29 -0700
Message-ID: <20251028045730.1622685-2-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251028045730.1622685-1-tanmay.shah@amd.com>
References: <20251028045730.1622685-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|CY3PR12MB9606:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f5bb202-8ca5-45c3-a0d3-08de15df090b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n1PM7SNcVe6ruNCZGap6h44aWtymRJ6BOT/jp9yJuHxTp8gff6DrGThm2X8q?=
 =?us-ascii?Q?GikwgmuOEQqBoHkEsvYafOhWNlYMAbMZTTwMhu3192dBXQxdO19spjnSY+k2?=
 =?us-ascii?Q?kWquCCikMvyzP7FWkIZhoJ7/7Mwptnwy+O6ICzlsJFQF+A1Qdb6AjKvfWsZ7?=
 =?us-ascii?Q?lyMfjKGatj+gS+bSqpMtD+xUNMNZqEkePT50f7l0+Wi4vou28bRwJArDVRpK?=
 =?us-ascii?Q?BsYwwvgiUPKcHLhhA9/ngfsfC+UiimJmSGQ7A+AHyn+O+6aEc2IPA0Wxivn/?=
 =?us-ascii?Q?CA+oRDFau0/W+mkyuFQkTOn8hynjU0/++q1G3H64jh73CCYUGiw105f0jHn6?=
 =?us-ascii?Q?deC5xkzWqhzeS0NQobwmTFa0hoS6zBlOheXJrx58qxGlOYVl6sRbLcEgySNO?=
 =?us-ascii?Q?2nnayEHH0br8HoTrRBnIQc/IMRovc+kt6g0V9TkhiPlNEUDRy9QzsCXNgGEd?=
 =?us-ascii?Q?i0gN9Bje4OhKsPabZPb+jhgC+ZYFrjDmXxP2j1oSkklZbEAUghhVShksb/5S?=
 =?us-ascii?Q?xgMgUmXk+eFymvK7f8v6Uno/iuZ8nOWOHwQ2+lVVFYxWpBfBwXKqwX28eUAP?=
 =?us-ascii?Q?W7Nm6ZJJywW4MXk8QekN/gvSnK9GqsRLZIXkGQmqfCyuy2HDasHQaZEu5b/U?=
 =?us-ascii?Q?YqRo6uBHW9uBbY2MWs63l23IDsN4ARJCtcdKhrGN2ytsP8cOWmu2Rc43ch8f?=
 =?us-ascii?Q?uXbStXovvOavBpGbZRqbxJNL9N7HPl0ONQWEInnHelKMWg+LkL42sJZaBgOk?=
 =?us-ascii?Q?g5eB1vLmSS5A0IjfqM8hRIpA+7tjSVdP/yC58JJrFot68CRpezpb4JjrJm3g?=
 =?us-ascii?Q?0OiSC7Z8ghJ0IYYWqymrZ4ti528mk2D75WrHyIyuPqtSZJbiQ88bL2iehyis?=
 =?us-ascii?Q?H+Pi0joTuW0PEPh/TnzN+Fb3QwteEg1ZwLbi0s6shInv2205ryeh5fNY+JlX?=
 =?us-ascii?Q?61yIMlaOxYRVvt0TzwsKxi+nC/l550LzAEmUsM/kzHhyl+UB2KWsdO+NCJMj?=
 =?us-ascii?Q?JwYCklQYdKqu8E7q7CKlQDjf+jZNOaU3gagw+Usnycsh9bTY63N5VzlLWvS7?=
 =?us-ascii?Q?GrBsV8ehzevpGi6m7PAyk3iAiBdD0QytloYxmpn5DHu6Ava6vvi4cGkwUMT4?=
 =?us-ascii?Q?9YlNV63yVrHt/MuWFKBoe3fNGRavu585rgf8ndgJJzB7hes+mFhWpo5bZcCE?=
 =?us-ascii?Q?jBwB1U5GB6+EaF9ZQtENeMlkARBv9PzMO7yV1GL3vaHIxBsXabZb6q/rzDHz?=
 =?us-ascii?Q?7GmObBiwZ/Mz9HatGN0+qAZlvx3srpFwXtEo0GWtkOvWkSqyG4ozJEhgZTu5?=
 =?us-ascii?Q?qv/6tpSP4EcdedfhHskhhzVgY9HY5vFmanAO3ztHP34+Xx6JzdNLvKtMbUb0?=
 =?us-ascii?Q?+nBYCzU1XHKaZpRn4pvneRHtEhh/rQrKmDGoDQ5szNHMk2Bp/+dizSr8OsRo?=
 =?us-ascii?Q?rRjnDwq+3gUG+8hPg9uBvIn55PD2Hbo6QODZN24S4Ux0VCqNwfaatlYN78vy?=
 =?us-ascii?Q?SmmcCZWi+oB7XeE8dh+8LmwA6T2njFfBsKgC5mvSNFy2JCTUIMbEhnu0N/Bn?=
 =?us-ascii?Q?32Xf4tkFKqenGRbmcAE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 05:01:20.6253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f5bb202-8ca5-45c3-a0d3-08de15df090b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9606

This is the default method to recover the remote processor from crash.
During this recovery the Linux will stop the remote, load the same
firmware again and start the remote processor. As of now, coredump
callback doest not contain any useful implementation, but this can be
changed as required

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 0b7b173d0d26..8677b732ad14 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -891,6 +891,11 @@ static int zynqmp_r5_detach(struct rproc *rproc)
 	return 0;
 }
 
+static void zynqmp_r5_coredump(struct rproc *rproc)
+{
+	(void)rproc;
+}
+
 static const struct rproc_ops zynqmp_r5_rproc_ops = {
 	.prepare	= zynqmp_r5_rproc_prepare,
 	.unprepare	= zynqmp_r5_rproc_unprepare,
@@ -905,6 +910,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
 	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
 	.attach		= zynqmp_r5_attach,
 	.detach		= zynqmp_r5_detach,
+	.coredump	= zynqmp_r5_coredump,
 };
 
 /**
@@ -938,7 +944,7 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 
 	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
 
-	r5_rproc->recovery_disabled = true;
+	r5_rproc->recovery_disabled = false;
 	r5_rproc->has_iommu = false;
 	r5_rproc->auto_boot = false;
 	r5_core = r5_rproc->priv;
-- 
2.34.1

