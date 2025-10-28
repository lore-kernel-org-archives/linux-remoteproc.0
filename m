Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010023.outbound.protection.outlook.com [52.101.201.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CA9298CCF;
	Tue, 28 Oct 2025 05:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761627685; cv=fail; b=h9ErCsm9PWqjYklfLm+KpfIb3bZ+awkRq1aqaSPZ5kAYY9QvNJUvxG4ASETNpTn+YOrkjbbPoH72GXrKCfwIx00W6cXQp6JRkCySt4jB7SwXHNSORe1tiBAukjOrSs0NiRbXK7TxseLLGdsuqthrBzmgetap29mJpx78TVf2yBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761627685; c=relaxed/simple;
	bh=F5WPM+6o/qWaqQaAVk3VlCvXgL0zNxFlRif0+jkAT+c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C/ozl7ng120ZzNfYFBmljldyjh0LUhMw1yW2tImDm1OzM46SrhywzSLOXzRySbcPi/xRmGx/XgDM7o0m5kNW8KRNMjCZGo55h8V6lE6w7Nt/BknUzb/40Hx9jF2XFCLZFgBN2sXSwgVO/t+M5zpdLUUQcFlT/pYGOqV2QGpZzJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aL0Fmeiv; arc=fail smtp.client-ip=52.101.201.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aL0Fmeiv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXUmISw91iawVCZk9SiHNr7Eof16zF/stiLlL/TEZAVuDvy3+SYEkQ7j1SojJp7y3O0G9YeNhh6omOlm/KcQMERhgGf5CFZ8kiG196zABGpouGiBwvPfqHGQug2Hf5AvKxd/PJxtWeiAtDvH9/L+WjRrnZfio8Pob/Hg4OIdyRjSwCQTKLrlE9/8eeMBxpBJpPdjyRv/JBnciAMyOVliEf5+Q+xi2z1JWQvkz5CNuzbV5+VHnWdojJdkt95KMC1zo1OU3FHjsFIshbzxz2MwlAP1QFs0J3qZtGAG85DolJmIdtSNnkzqN/BiQb2Mgp6alO1XCxW6EQYAAQUURi22Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWx6v7leH/IVtDS//DjyFH+dourmPuIFkVT/asyqVls=;
 b=yZ3q7entdA7L92Y7Pz1d0+eD2K8r7z/mlhMHpByUwMIV1zP+bmNz3F0YYUNHM0ABMV/ERXUJVfqrfcb7/LnR1D90tNvMBUnYRMBPSHq7bECFIq0/ceg2HmkA9uFlkX2np/jWVv7WV4g1W7fBY2bPPxWJR+ozrIKVwe9gaxi4UN79dJHJeADBN044IQZUr6aspep2ww/hcSH50NLG3QxxsPmgTgfLEXS2XFmC0PtP00fMaudZQYcjpkTZbLg8dSlFqixjdmnRXDH00XmAXouqeZfxfWPE1JCNSEFZDM7vLcVD1eFyBZwPdkV2Ck0yjzEvbjMVq9bt8XuMef8oDucExA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWx6v7leH/IVtDS//DjyFH+dourmPuIFkVT/asyqVls=;
 b=aL0Fmeiv4oSKvBgMTXsOWFx+357lmPYnH5YhRhBu+xywC9yV7SIAKeGH9GjJXLrfXM8b3aJ9GmN9fJqEmpGejKa+YYeUlsL+1lwh1KDAPN8vOrliIKgjMXV3YuoFfePPyqx/6LwHjAYwiFKNatA2b2D65e6pbpGzXhCdYeicVIo=
Received: from CH3P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::30)
 by SA3PR12MB7858.namprd12.prod.outlook.com (2603:10b6:806:306::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 05:01:21 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::93) by CH3P221CA0018.outlook.office365.com
 (2603:10b6:610:1e7::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.15 via Frontend Transport; Tue,
 28 Oct 2025 05:01:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 05:01:21 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 27 Oct
 2025 22:01:20 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Oct
 2025 00:01:20 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 27 Oct 2025 22:01:20 -0700
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH 2/3] remoteproc: core: full attach detach during recovery
Date: Mon, 27 Oct 2025 21:57:30 -0700
Message-ID: <20251028045730.1622685-3-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|SA3PR12MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e3e3d4c-5fb6-40cc-0b24-08de15df0951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vKFU1L83yXHo4zZwIAwB1GxT73Ti86lxpWdYDJMzz6jy0KJQVKalnuOTTYJY?=
 =?us-ascii?Q?qTCghsu3maWa9paMAGU2tG5aPE/oEAfO1POaCqFmIMHc1ArZRPPZsgRppmdM?=
 =?us-ascii?Q?IkJWEUjNjOOs2uejGcuUSxO/gHA/dex7xlSmDk2kZatdmuDg7utJCL7MZljq?=
 =?us-ascii?Q?W6lGQWayY8LEoRUvG0T6e7AiLOwojJl4ketREBZuWSe1YE84+X4Ug8Xm2NFK?=
 =?us-ascii?Q?aX/zWoV8RVI3ChrzfCkl2J1Z73q+z9PvutiE8venTiWZRzWKzvLQlrKAgRbm?=
 =?us-ascii?Q?QrtxoJehcHDLyMhI3RcXdzzl3Xvlcw5gibWjkJRGK8kyTZKbmkW80OpADG17?=
 =?us-ascii?Q?g8nE4w5bvZR9oi+1u9l2+9CxglvaTDuiRcZg9/LG9T6D57kGemT4VxrKIf+r?=
 =?us-ascii?Q?Y2pzWgt5qENzvLUrP0jnz6pFcf2ymjEfustgJWUdkbSBebDFHPzWfIfZ4Zq/?=
 =?us-ascii?Q?XwyvZwpGFKq6qDXvx2ple86b7vPiY4bVCuGhCKhSEHN5rSwhVK4JoerQHUUU?=
 =?us-ascii?Q?N5ShwpsRFxIZEX6GdAaBO3BjFYbfymShJn3NC77nR72nITfZtPXdqPMtvJuP?=
 =?us-ascii?Q?TzihXq3wBgHUK47nZcuxRiSIapbdqmF5IvXJvwX3lp0icOlJBAccwg7bYIPQ?=
 =?us-ascii?Q?s/i6+CfkJoJlnhJXLinCE0d8L4vUumlRppMPHqKFMixX9/gbA5D0T6WNmYHW?=
 =?us-ascii?Q?gz6y7OI+RMhywBv2Mk5GcHMb0w9pmyvdViudpZ8FQUJbpnmV6tugQEfVTud3?=
 =?us-ascii?Q?6hJLOzYX97U/Gvu1twySWiYM/ZltoK2QQkroTNnbZ779mZBliUF1KsI5dIBB?=
 =?us-ascii?Q?fxrxi17DnaFL0oIm6MNYZ8th9ZcQAmxgwmAuqm4ggR0FnQ8BmjyHKBu/JTRI?=
 =?us-ascii?Q?cmAmfSfxrae/u4IKccvVyGyy36z+IbgDSRlkVJNk7gztjrV7A6fq28w4clYQ?=
 =?us-ascii?Q?l+cM6O5aQ3sNcFoWL0bUNnUzj+wCrrktDCtSyufwhEo31Rn2cXXGrZVYtQjZ?=
 =?us-ascii?Q?lNSm3SL2FzPm/CJhlr6gRfzNBTYVQUiglZ+mk4cNYRLXWjHj/hzsrJHch4tC?=
 =?us-ascii?Q?LkfRIuSc/UNAm4ZGOceaDP1gzSrG0SmyPHpVa1o0JvPRDFUiyjhRwLSfNVc/?=
 =?us-ascii?Q?Au2/7XcAc6ktjoCPMDWfTSTVbDyoLyHUSCpXuZLOTgtJEAhgK+Yh+KfwzSJG?=
 =?us-ascii?Q?GTGeM6MDWCvsLUciRMup67Jq9vbOToYF6YZQbPx+Iu81Mmhu2+qjPZZTqCEh?=
 =?us-ascii?Q?P05Ad20PXy82OZbRv9RWGn728mVoo4Fprgq4AdFHr9gXC96xu6WBVMCmjVTK?=
 =?us-ascii?Q?e7mKeCK7vhqQcGa1T4MYyrdw2HH/wkfNLzdjGqt3oRKXGEv7ORTwi/2pNBe3?=
 =?us-ascii?Q?BC9jR5WsaZVEfa/Nn+UwvJN17hteJwFwTrRziWyUVvBpRZbh+J8NHfagkMm3?=
 =?us-ascii?Q?zbHLy+3E5idkSU25r4PziogK8wxn+bvdpO5BKLpnCyGS7DxPc7b4N/Q4Jh36?=
 =?us-ascii?Q?m149dogNwIpm4mUjkKXZxqT+v5Kim38OoadKs7qGXXaSLtxG91W5EtmjTUOR?=
 =?us-ascii?Q?zwlF0LTKROM6SYvtSaU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 05:01:21.0837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3e3d4c-5fb6-40cc-0b24-08de15df0951
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7858

Current attach on recovery mechanism loads the clean resource table
during recovery, but doesn't re-allocate the resources. RPMsg
communication will fail after recovery due to this. Fix this
incorrect behavior by doing the full detach and attach of remote
processor during the recovery. This will load the clean resource table
and re-allocate all the resources, which will set up correct vring
information in the resource table.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/remoteproc_core.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index aada2780b343..f5b078fe056a 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1777,11 +1777,11 @@ static int rproc_attach_recovery(struct rproc *rproc)
 {
 	int ret;
 
-	ret = __rproc_detach(rproc);
+	ret = rproc_detach(rproc);
 	if (ret)
 		return ret;
 
-	return __rproc_attach(rproc);
+	return rproc_attach(rproc);
 }
 
 static int rproc_boot_recovery(struct rproc *rproc)
@@ -1829,6 +1829,9 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	struct device *dev = &rproc->dev;
 	int ret;
 
+	if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
+		return rproc_attach_recovery(rproc);
+
 	ret = mutex_lock_interruptible(&rproc->lock);
 	if (ret)
 		return ret;
@@ -1839,10 +1842,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
 
 	dev_err(dev, "recovering %s\n", rproc->name);
 
-	if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
-		ret = rproc_attach_recovery(rproc);
-	else
-		ret = rproc_boot_recovery(rproc);
+	ret = rproc_boot_recovery(rproc);
 
 unlock_mutex:
 	mutex_unlock(&rproc->lock);
@@ -1860,6 +1860,7 @@ static void rproc_crash_handler_work(struct work_struct *work)
 {
 	struct rproc *rproc = container_of(work, struct rproc, crash_handler);
 	struct device *dev = &rproc->dev;
+	int ret;
 
 	dev_dbg(dev, "enter %s\n", __func__);
 
@@ -1883,8 +1884,11 @@ static void rproc_crash_handler_work(struct work_struct *work)
 
 	mutex_unlock(&rproc->lock);
 
-	if (!rproc->recovery_disabled)
-		rproc_trigger_recovery(rproc);
+	if (!rproc->recovery_disabled) {
+		ret = rproc_trigger_recovery(rproc);
+		if (ret)
+			dev_warn(dev, "rproc recovery failed, err %d\n", ret);
+	}
 
 out:
 	pm_relax(rproc->dev.parent);
@@ -2057,7 +2061,7 @@ int rproc_detach(struct rproc *rproc)
 		return ret;
 	}
 
-	if (rproc->state != RPROC_ATTACHED) {
+	if (rproc->state != RPROC_ATTACHED && rproc->state != RPROC_CRASHED) {
 		ret = -EINVAL;
 		goto out;
 	}
-- 
2.34.1

