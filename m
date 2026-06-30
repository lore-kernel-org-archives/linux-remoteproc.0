Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012044.outbound.protection.outlook.com [52.101.53.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C50221721;
	Tue, 30 Jun 2026 00:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782780520; cv=fail; b=lQDhnpXBLpLoQ8wYhAzsBO+1g1PQDqmzwEc6poNAv/J9BzlW2jYa4PsepF4UtqjwCBEh+7RYtdtyHscT9/Gll5jS9UoEBm8WaUyybM1wsNXTMqcUW3xcpTMaIY8H4AVyUvbAPhRFO9KrcD5m44oKB/CI8a+ax7hRrvvPaReQvhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782780520; c=relaxed/simple;
	bh=JeZWrAkpT28HlDYLafknjQUUJ3hLBjTUSCrJ+afgm9A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lvjX127Wh5inRHmt/VsNjp6O6nSst8hQ1VnRz34NRcSz9AxRL9t06gm59/3RUjWxbm5urDQ8e7QQ0acF8FCziaNIzo1lLxj2aZaV1jam474ORRzHDzEJyfnwkJuXSrtIeo8SNJQd+7HuYtATkFEvvJxqVquwjVBi/8fYRpvnSUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=by8gxgR+; arc=fail smtp.client-ip=52.101.53.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="by8gxgR+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtMeUjY4NNK4AcHXx6VNb7YTDYcJYuw7DJcG/o0vPP+0uGN5KOhsY6417GgUzC3xFW5fuC8mkAhb8DUvC8YismVonet3BiH+Wd+OBdbxbFkr3RLTQIbUlJzsiTLU/vSBnLnrhdw5pv5LW2wAAT2zO0MAis9ySt7lX903Us5eO7iTl1zulroPfJ1RAybhwJ3ywwvd1Jul/fIbKbpD6nCLFR5c8VjMA221XefBLdAHaJ8Jff51O8yDaa2RDiFIHqr6y97RNT/T/uf7+saxk4O/bxECmcFRTGF6Hp78ZGavNQP4Bae7HKH3JdMSYGfRbmAXX7uj5jbgBFHxZRtcCMWS5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDrfqeXTeSDBhgdvSql2q2wxo6MasYkoo59Z5v/13Tg=;
 b=LfclFih+hiOEnBG4bq7li60v+K7la4w5DMDuG3zQk/v+XZXhXNCyGE2rIg9LdgJGvsenrp2k9nAxiF67WwJ33vr7fHAJPVNGfuz9ahbjL27wK2sx78FOILU8XteFZHCAHbIuPuqPpNjUli0AXf1i9FOHIiyDsmnrPvSuwMDXdFOedAa8/RVPqKEGmojEdxivjx51KQGLRkivqitPQi3SOUumEgSFw82Mjd1cfuA264PxzpPMIuJ7CP+0bRoUXoC1WfElBAh+Mw/b+k0jLX7vYmErueH/GqVqMSjwved62RVMmUSdWZBCBVfbQHblDMJRA1IK/Z6gmNcaU0k/Em2BZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDrfqeXTeSDBhgdvSql2q2wxo6MasYkoo59Z5v/13Tg=;
 b=by8gxgR+xH4c9HKWNGqOwcBKMzDUTxyZm+kv18GM+dm7q190zp1GpZTdw2x67gTa7nvPrp3EWqu6/ZnAODF8tW/NYUBu6ZGc1TGzYs/3a2d9VTvcXvuFSVpu6mHfZhxTFj3IuqHExKnJd0lPv6hIkATec/xYmg9yVWAczxEkz/I=
Received: from DS7PR05CA0107.namprd05.prod.outlook.com (2603:10b6:8:56::25) by
 PH7PR12MB6811.namprd12.prod.outlook.com (2603:10b6:510:1b5::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.19; Tue, 30 Jun 2026 00:48:32 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:8:56:cafe::af) by DS7PR05CA0107.outlook.office365.com
 (2603:10b6:8:56::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 00:48:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 00:48:32 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 19:48:31 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 17:48:31 -0700
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 29 Jun 2026 19:48:30 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v6 1/2] remoteproc: core: full attach detach during recovery
Date: Mon, 29 Jun 2026 17:48:05 -0700
Message-ID: <20260630004806.3835488-2-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630004806.3835488-1-tanmay.shah@amd.com>
References: <20260630004806.3835488-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|PH7PR12MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: bc7fb7c5-bc6d-414f-6995-08ded6414f13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|22082099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	6Yp9TS4YaXIpN0R4pB/2glyFFU+/636BlcXpNPFlLPQyAd6wglb3hE6r7669f30TvF5gqPqEWxZvWoK3HWjmipYGdjFdY1UtYQ3YoW3wfzgSbu0gLJoNAcBGt0SwNLBGsGT/Oc4SkOD2Ns7SvmHBWnIq4td+JW98+yyFTTIV+OwtdK211YHVAXvMfjJxLNJpVXG9AKlLIlPkkYV2bmZqISrT+/R1fC6fqNIO/jgZF1XOZJelQF4vvzRJwMYUL8iftWh7If+a1ZuRTp6pTxyXSpKdmyNFMJ7xbLYnqLQCWvFMSEmk6NUl53K4UvRPkvh44PCrWHUokE3WOtaQg8Y4/2g1G3qM/wW4upXREgoWHKnEKh0CQhaK/YtzXe8zZfuZ8q3u7ndygm19nVceNI3ZESZGr5N8DTwIMbt0j6cTI1GEvWq53h2LIA50BwMZrE6q9RmB7w/3wFqbBJyjJ4iVlRlBIQCVnwHmamIM7e0cCgr2AmanVzcrsc+U9JDX+WAnJ1RHZTwOjbh2Ja91qfcZZuPYSur0IFgl9fKFJW0am4znHH64zVVn19dqoWITL+HjHwBEffWEJJQmVgtY6TfK2XE+Xe5XwymBzPPkGZpkSdwwqcpja1WRm+ND4G0iTr1Uvcm7QfdlZyHqnSP4GgQ0tfy/n2fJWFniZak7odERrQ1xHX5SsJFyCuVvxVt2LJcvbgDZIUuOisHjn/JKhWfZ1w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WkghiIziPu1occxVSsQLAtZpJeztmFIENOo39TnETd9Sd52yCfeNlDnWhFXa038SfdPinT/JbMbu1JO7SpALG6Wk6mXYDvI3i+XGKeB+29CEUbPItxG+/SN6gYLzJ3n1thTDXVR1rErY0Ozfwsh9c9aUSCimk6p6XtAadTR3UZJWeDlFb+jmA60wKGvXQOWlZXsAdpIM0GX8SUsbPOH1yxZotxTLu967d4m9R4cC4YMC55oS/ytHFB/6a/UZaqJCzdgLczWSdfiHUtBH73FMJeHzzdgxrNtZEcf84iRZCHTsaI7GNCkWXfy8d+/Grt/T4d+J7j8Q67AFu9CRsNcUoE24x0ZXZEVKtoDubB7d1jL3Ts7w+c80Kql7u8fcSwsJ9BPGDPOLIn2pfZ2CT/QKLrr1qThQgSj8j9s3HMqDlpWdu9j2RPORnfO1rXIOa8sN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 00:48:32.0212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7fb7c5-bc6d-414f-6995-08ded6414f13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6811

Current attach on recovery mechanism loads the clean resource table
during recovery, but doesn't re-allocate the resources. RPMsg
communication will fail after recovery due to this. Fix this
incorrect behavior by doing the full detach and attach of remote
processor during the recovery. This will load the clean resource table
and re-allocate all the resources, which will set up correct vring
information in the resource table.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/remoteproc_core.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f003be006b1b..8393468fa1ee 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1776,7 +1776,20 @@ static int rproc_attach_recovery(struct rproc *rproc)
 	if (ret)
 		return ret;
 
-	return __rproc_attach(rproc);
+	/* clean up all acquired resources */
+	rproc_resource_cleanup(rproc);
+
+	/* release HW resources if needed */
+	rproc_unprepare_device(rproc);
+
+	rproc_disable_iommu(rproc);
+
+	/* Free the copy of the resource table */
+	kfree(rproc->cached_table);
+	rproc->cached_table = NULL;
+	rproc->table_ptr = NULL;
+
+	return rproc_attach(rproc);
 }
 
 static int rproc_boot_recovery(struct rproc *rproc)
-- 
2.34.1

