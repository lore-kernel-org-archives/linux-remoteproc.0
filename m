Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012021.outbound.protection.outlook.com [40.93.195.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743E5358391;
	Tue,  3 Mar 2026 23:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772580995; cv=fail; b=Tr6yK6vvXV2urgpEaOxnJEJXsPpPWBQ/tkge5HdCSIt2SC7nEidWvaUePepiU2L7lREuegqreLBpbx5yg1eTpDbPusWHe6Tt2Xv0JzvfQUBV232mrJ+qbah0xHhJr6g+kjzgJxYuOENELQjN7GlyYQs9QkGcs7aWP7BD6fiCTH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772580995; c=relaxed/simple;
	bh=GRz7XBwu5uFMBkMmlyjcfxDqb2j41q4tCpljqUqQw7A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pu2OZO9MX2hP6nGYUN9Cp4N+HGz9QJ0vtInAkx3hlkYbcMXcQdRapdZ7tyQiOXgbQjrNshp/VhoS4Kh+WpZa9m3W8ALTdgrNYS4x008ELdEvoLBgUnaQGtaghAeScpjcKqf2GWY3B9f4HnydEu4VisbPTmRsqBqc0OcXqm1T1TQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VI2bkkD+; arc=fail smtp.client-ip=40.93.195.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VI2bkkD+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXLWlyBPGYhTE2HErLE0msqyNSSHo/LUPNyEz4hpVXPm2FJWKkMrMlrvOWOLCxxCyOMcYs0AyOkRgOrGhA+MPG1j0EwmPPRJBUl8BEQZIsEBtnkI5TDYCoDqFTcirJ8LEPhG+qy0p4mp4b6YkPYm6lm25bK7J7bKrvrU+1Y54wGkdVT7mb/NYMov3+gsoVTRbVmgQ+B0/6YGuyuyKHcYb1cSQoC21bCBXDB11Tn0n9+/t5UBUSVIIjbtLUKcZxlVC7IBcEQAsFyFusDrI42NNuNtbS6pU9Kn2YrL/BHFp5bB337LREXMIpdhOlLiMq/fNi+ABKEViqTCZJVD8MaVYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUDkWwjPoXfglzXA2AV8qOcDubdbr6UQ1FxLetd0JMw=;
 b=dBfRdMMb+3S9gzHYtJNHjb/8vi7qqyn7YgDRv4B8lN7jabQdqORn0GV/dwOT1/lYNhTXQhTlgAaZsDxHXBFhqYkNc//JFBmEqkPDzONkq51NnvO+2DCQHZ8/IZzUmO6foWGIAPC3SVrUCXk1mLW9ETHe34WY3xDbGwL1nhl2M6L/kLk/U036avYZTs0swrD6uvuQ+nxMComuS8o24G95/20D8f8GL7jnEsPoobGRkEIWFYUkQAaA9tJLWuVFqfSvFbL8q3uWo4vcRFEYScyEQiPIhqM2XMxcMfvfPkrAflqdKBGc3kIhlt0y1gFtjQRTvToQEEMR924H0Lv3eWczNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUDkWwjPoXfglzXA2AV8qOcDubdbr6UQ1FxLetd0JMw=;
 b=VI2bkkD+ws7BmiU+p2WR3/Yvfl5XkLfCyJXUDyo2Tuzj1Bn9m5MHQ2P92QZv/FR2G24FlJQGVZo6CE3lpnPgJJrwIdbkaIaNx9kh6i0Whku3g3K0i2LCVHXuY+e2+peItyhVaP9ABCV3ik5C5qNl+FxxeMHljdwcfVjJAv379Ug=
Received: from CH0PR04CA0026.namprd04.prod.outlook.com (2603:10b6:610:76::31)
 by MN2PR12MB4160.namprd12.prod.outlook.com (2603:10b6:208:19a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 23:36:31 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:76:cafe::58) by CH0PR04CA0026.outlook.office365.com
 (2603:10b6:610:76::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 23:36:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 23:36:30 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 3 Mar
 2026 17:36:30 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Mar
 2026 17:36:29 -0600
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 3 Mar 2026 17:36:29 -0600
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v4 1/2] remoteproc: core: full attach detach during recovery
Date: Tue, 3 Mar 2026 15:35:32 -0800
Message-ID: <20260303233533.2310513-2-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303233533.2310513-1-tanmay.shah@amd.com>
References: <20260303233533.2310513-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|MN2PR12MB4160:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d8ea368-8a30-4919-af5e-08de797db271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700015|1800799024;
X-Microsoft-Antispam-Message-Info:
	PLY4YJGHeeBdoILoXP8yj4fcD+vAK3xv9wN9w2ETpzGA559OT7hN4+1P9vMqYRVckYT98JZWi/YRkbXStUMLIZ7wivlFfNRuhXDuaflU3L+PmgjfJKPKCpjr9U4mkISM2tNBOj6qH8pMXSwdoN52DQ0OSqE/Lr1QmOiQj8aw4VTEALvb+gZgFRoUPSdztof1kZla+3pb9ZNbw5xtyEZ4shJA82YZER1TScygnYUP0de/N16bnGhXP3NxusHGI6hagBRHXCimX2fmNR2vJ98jvOxZK8EwQVyIQZqXbw8pqCdea14bs6N85JjYmvhDOSz7wGi0hG7J1iugM433e5x0ueHJYrV4B2pXbzSaUAbn7aKM27sHltdDEwj+Pu55fCrjtkzKvRLg/Ue0obYv4oJlJHnr72e617aO4pRySfqvT4IwlKE05dTtNEMUk9WIJH83jsPlEkskhurJmV4J8zQ2hmCIvcGSD0qbEC03SswOmydNShUnLmTu1Tw4uPJ1zrHcX26qxXUh3zwVg3zqvUQwdYybImOy36FvqYIs4X/cGfyDoFO338C8bl1kLT8VucVNELZYDMZ//MHmRpAu5QkTEjAwrowsHg59jyxHlJbD/wQXPfkOf+8hcbji9isC9ZJhENmiaCSruli1RrFh2YkZk5/wIc2bIfkEvoj6fazE43Y6uloWswzNbWv64NYmpoG9nQ6i/vZIy/pdWJFYkZhjfDHS6g5ZjpzITyTg4d7Y8Wsm5Vds/koOpEfj1hP9ElCQLqPUKbco/mEEFqNPn7UbwQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700015)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jXQO2fhvxoV+BYST/r+3kfu3ZnAZqDsTc25Pkqm+jMvA/Ozvj2HoK0BYhiJa1iimbzrkuRXvExmF6mv/M8+J3u3m9Nef9XRjC91vpRKg8Y5UapFMi2iyjfXHi28JHurkS2dZ6xGuUyBz3FeZSqOie9wvm/SFg9cPUlqNfDvR+TZAJsYc9s9y4F+uW/E7ltkgevCoINdC7hCQRSvoJHbdGVSz7L0sCByXQuZ75gliHpKys4zx1g5OZgfxcda96/idACdorNb81CJ0PlOOvEj/APBod6yiSdRStZZAXDC9gDlDNfhmrffpGblrGE0V4dftF6EI0xu2PRyu+JaEMOsAVN4l+iyfEPfQnPq/d42LzhIi7F7kgOAxVkhkLOK3UvxSMFC4che3JZ6W2k5Y+Z0BIolgqgWkssqQH32ptyqtirNgsQBDJ1wkTDB3PV6F7zXi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 23:36:30.4320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8ea368-8a30-4919-af5e-08de797db271
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4160

Current attach on recovery mechanism loads the clean resource table
during recovery, but doesn't re-allocate the resources. RPMsg
communication will fail after recovery due to this. Fix this
incorrect behavior by doing the full detach and attach of remote
processor during the recovery. This will load the clean resource table
and re-allocate all the resources, which will set up correct vring
information in the resource table.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v4:
 - move pieces needed from rproc_detach() to rproc_attach_recovery() to
   cleanup the resources
 - use rproc_attach() over __rproc_attach() to create resources again
 - keep rproc_trigger_recovery() unmodified

Changes in v3:
 - both rproc_attach_recovery() and
   rproc_boot_recovery() are called the same way.
 - remove unrelated changes

Changes in v2:
 - use rproc_boot instead of rproc_attach
 - move debug message early in the function

 drivers/remoteproc/remoteproc_core.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index b087ed21858a..d56788e8df76 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1781,7 +1781,20 @@ static int rproc_attach_recovery(struct rproc *rproc)
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

