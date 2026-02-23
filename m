Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011023.outbound.protection.outlook.com [52.101.52.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A126F369234;
	Mon, 23 Feb 2026 18:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771872627; cv=fail; b=YCpGI1amPG3eNZktBEa1yJokoyWiMWk8m5X08bwQZop9qcQ8sKZW9UAy37JXd0iXEUFwBS1s01bXKdU4j90tP9Arkjr13kTc6wJzwJpFLL0knfjAXOtxEcZK+oBrlS2sK21HDmrpACSgV5J3Srhsct0CLrDFvL4TMPZwAn83ZvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771872627; c=relaxed/simple;
	bh=/d+hGa3upiPMJDCM17+STxmzs82oa5UmLjATpIsBrFA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I0EA73AcXICyLq0kU22nrLNUC8YB+Hw+AYw0+3xenmzNvXbUUQ+Y0j4jV85eNaXnHdJmMtcRKU/xQXFmczwiqUtb13qJ8PZWwpefSt83TfDi6rA7nXVMkaUhypLCnObGY5BaxJ/HQCplrw0CpwPsm48IfO8eNKzk6xYxNjcwJ8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iyuSDyvq; arc=fail smtp.client-ip=52.101.52.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iyuSDyvq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArL2KrAWtoH0FY4ypTvf4wzRQO6N7oYsNcK9BLKKTjfMW1bOHqvSthyMqyxMilFW94gujjIN9M80clju7CfCimLROt/4BBQBHKgMe8QaH9F8ZQ0/n6Hw9fj0KRxpBzqswrL06Bz+3JdJ10aJru/iUZcM4lDhJ+md1xJKX5yXQREQEuUv9Y8Y8vbMvqJSiXIti73eDbysOG6wD62kH2G2FOm8JfCuV7h9RvYh3y/hpZdEdT3nunkR+NL0spC/OwSLm3cnGb9RLSOPOcq0ohMZz/yjJHgR/P0mbASpGFt4xFLxYpAFo1GCcXfJrTPsEdb7fQIMqXtAneEFsGS69Kxwzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/fEv+ovz7eTKzvBMX1jJPQcDnEXExCMz7gQ42DbCF0=;
 b=mklyz6cXjO1bfvsXiPcATLOBbNYTXoglj/OlVi6N+OvFNNAEIb2ka2v/mcL7vE2Eur+q1+N08xcGqcNYWklQ9YzDWvOgxRR0J+SKOcxUpa15jPcSkv7z+diVid47jxzvucpbpAv0umi4hQvEAGhuh/vniZUYYdU5ocVdb8VdovNz2RcEePq82inRZe1yWHeoFx7RMxvDK44H8tiuxQYYjL38k4P7tK3IUeullurhZMOVSx0tmEiPzhPjrwh9n+P3VdC7coVuMvJ5xQWWSKjgwRggRH9tQAZjplWXQUM6g7JQF2b9Ku+/ciW5eUDXqyZaudoiAAPo1TAYnizkLP1xQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/fEv+ovz7eTKzvBMX1jJPQcDnEXExCMz7gQ42DbCF0=;
 b=iyuSDyvqxMeLmXJWhMG4E/15o9gzg3+L9XJrQtRVx8QYQ9kq3qMbxJ2+nTj4WBdG+0HuulvzXdWO89Jd2tW64GXQtJ2lJTDgrCykgpznYcY5v6kLGH4rwf7D+Ys6qnge1Yq0UXdAKeVoTHUqB79p0pY2/FcterMFrWKJn3mrP7M=
Received: from BL1PR13CA0437.namprd13.prod.outlook.com (2603:10b6:208:2c3::22)
 by IA0PR12MB8350.namprd12.prod.outlook.com (2603:10b6:208:40d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 18:50:23 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:2c3:cafe::77) by BL1PR13CA0437.outlook.office365.com
 (2603:10b6:208:2c3::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 18:50:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 18:50:22 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Feb
 2026 12:50:21 -0600
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 23 Feb 2026 12:50:20 -0600
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH v3 1/2] remoteproc: core: full attach detach during recovery
Date: Mon, 23 Feb 2026 10:50:05 -0800
Message-ID: <20260223185006.1278518-2-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260223185006.1278518-1-tanmay.shah@amd.com>
References: <20260223185006.1278518-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|IA0PR12MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: 317f1f8e-3944-49d6-fa31-08de730c6681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/KpBpvMmVw7N2DS6u1fylp4drkUvfZyoTYXXQpZTCb4VxN09rRbf5PXm1X6N?=
 =?us-ascii?Q?0jaeG3W3w4oFNJIJjakpEo5Up1NUyhWp4irr6eNaEevCyFDZEg0ch7zihLJN?=
 =?us-ascii?Q?ctaiifiEdnC0DVKX5E8qJWL0K91cL4TndAJe1uGiI82F0splnJE5DVeox26r?=
 =?us-ascii?Q?VxXV/BbkioriaKP70EeAg/D+/pTcomOJghYxrOM1WpA+u6mjCYXLs0xPF9TM?=
 =?us-ascii?Q?+7KDUUCwuHYBQTlaojDfgPjJ09u82dOU0auhakSvR1nO4OSYcC+ia7XP/z61?=
 =?us-ascii?Q?paG6QT2k/0TDquzy8HE8Mn/y+RX/OcTW9PuEaRbGEFcAhZxLlNYsYlBsX9aM?=
 =?us-ascii?Q?3jojRU6LuT0kZO0jQqfRtPZ6WbuK2ugroN6uYJplOV5ybaHtb8LvfRqsHzdk?=
 =?us-ascii?Q?ohmnJd+CJ/PPl0sI2QHP9g7cCGQGQ8V5SCkdkP2iZmo5IggkZi6oYOHSlTjL?=
 =?us-ascii?Q?+uiGDvUWPu2Nh4qtBbqzVYXgsdnrwGKaePx0XTbubt6X9niiiR5l6Kocvpse?=
 =?us-ascii?Q?RTQ8BqAFLXE//YYf1i8ZL86Nn1nOQSeJjKuBIIXLtHpcnUxSRCjnsJWJhrx+?=
 =?us-ascii?Q?JykPceu+wwGBySmG8+LyLxWKjXuo1bYwWwkX+VYzr6RvTqYNcsnSex0TSr3H?=
 =?us-ascii?Q?kkyrWYmcxCK+pdx9JXWjOWtbOJ5OXBJv8/6JZMJrBsM2gCOXdUWwX6jxSaaO?=
 =?us-ascii?Q?yK1qnW20Spl4ouT4mhWCAifBTQYJkUB8a4/oDw/tmLY5lLiEvQh5s1/fL7bQ?=
 =?us-ascii?Q?bR+FqxjU/F8f01nz8JD9qcCcFs8We3IyET/9d2GUS2P9Z95G+zUTKnTNzvNu?=
 =?us-ascii?Q?lLz1aPPie0zuWfHY9ntZdwqrYn6D3lJhCYAcxgLH0cRp/dLfUy9V80ie4U4e?=
 =?us-ascii?Q?3E0qbbnF93g9n7yPEU6uMuTBfFLddYdbl0uZYxn3y/8kJy54nZH+cDFZDlQN?=
 =?us-ascii?Q?kz08YeFCbgcV6aZOd9/Pj+6+w2Yb7u0DnA3HZUgCjxQvBl7ZjdKDMc5/rW37?=
 =?us-ascii?Q?MZdGF/aiQCRf6voHCDbaVOgb3qoP1R1/cuVTMBiPA6iR426pbI08V4marced?=
 =?us-ascii?Q?tGAR60caJTUvrhepNcY+XPNX2Foq01hgGy/cMpYN24bbDLZU9NOlxYXC3oxM?=
 =?us-ascii?Q?N9+zcfKMLUhwVP3vzQvGfxDCJrGoACJpE2t8iKLVp7g8OjMQd9AaFWxzljYL?=
 =?us-ascii?Q?nMLyHwUG7e1qvYA/tn00wirY2KZIlVkExaTOGoGZhn9C5GGgxErU5gc0U1+C?=
 =?us-ascii?Q?4xdxYkJe8tK5WiaEMepvWsCreMlg+9bBKBZkJ9LXtoeY4eZeafR/6Lyaw3S9?=
 =?us-ascii?Q?/Gove9pnsEJizCjQG0KxkDcy1bju+yrgZABZzLksSmoGngdIMSlfjgQX5goF?=
 =?us-ascii?Q?Y3V1hRU8lE7fbSfM3Wqy+oqPdfPSyW8ISZ2svtPTkOzDDccMNrh0HgSwWaat?=
 =?us-ascii?Q?iq+x2eub7q7L+vwKrz8I5zm01Fd0CnvhuuPSnYmX4rdZVPyCMK2MnJXJsRFE?=
 =?us-ascii?Q?tnIDxjntmRM/yF3c8BDZ9U7fVLgOp0R5NVf6y1zQQ2Tm/8re6IStLosTmG85?=
 =?us-ascii?Q?oQowiqbKIOlEWk8kUE4b2UtXLWMPzKZwtmeuacKl65hX85/ifRG62mHmEAsA?=
 =?us-ascii?Q?2D4lXN/wXmSITelno6ls8MruoJuZN8MFi3S4ZG/q/BeXHL54r1FqjKLro1xX?=
 =?us-ascii?Q?qOomoA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j2rc9kEdZ/vqiMO6mj+1AbLPb+IPJ2H7m9rQ2PVJhHxmGOqWl+iZpiMKEsluS8AIHBX0fTB9u6O/gyNgBSzzNKka51hr6KPSxztLtgusGmUusTXMqiFSJLV03TuPwC8jdOvP4jIBRva0sBlnXNeeTNDfFP4BytJ33OgZtcn3c6AE83me14Z3LwqyiK9I3WRqhHUr31FheSExqshFsA07UcOM/dyeAzCMikjs5Xa7xUbC7c38eyVo0toEhCPBI8DO6etIJ63zIbyJR8cIa6v389TcmWs7iRn43RXEHLFTOT2wp3vcvmjS/3Ys7m+xvQ4a8t7CqggQRYReWmDUwMppnxifYgPooKmzdmpptzcUpXLguFS9TK0/BJEMEJVLMHZaqNEZ9N0d2Gn8fMCrNHMmcARGv1jquTqHMh4jN1Kzto6lLVq7zONYN88XugrVRwKA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 18:50:22.9344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 317f1f8e-3944-49d6-fa31-08de730c6681
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8350

Current attach on recovery mechanism loads the clean resource table
during recovery, but doesn't re-allocate the resources. RPMsg
communication will fail after recovery due to this. Fix this
incorrect behavior by doing the full detach and attach of remote
processor during the recovery. This will load the clean resource table
and re-allocate all the resources, which will set up correct vring
information in the resource table.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v3:
 - both rproc_attach_recovery() and
   rproc_boot_recovery() are called the same way.
 - remove unrelated changes

Changes in v2:
 - use rproc_boot instead of rproc_attach
 - move debug message early in the function

 drivers/remoteproc/remoteproc_core.c | 33 +++++++++++-----------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index aada2780b343..790ad7c6d12e 100644
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
+	return rproc_boot(rproc);
 }
 
 static int rproc_boot_recovery(struct rproc *rproc)
@@ -1790,10 +1790,14 @@ static int rproc_boot_recovery(struct rproc *rproc)
 	struct device *dev = &rproc->dev;
 	int ret;
 
-	ret = rproc_stop(rproc, true);
+	ret = mutex_lock_interruptible(&rproc->lock);
 	if (ret)
 		return ret;
 
+	ret = rproc_stop(rproc, true);
+	if (ret)
+		goto unlock_mutex;
+
 	/* generate coredump */
 	rproc->ops->coredump(rproc);
 
@@ -1801,7 +1805,7 @@ static int rproc_boot_recovery(struct rproc *rproc)
 	ret = request_firmware(&firmware_p, rproc->firmware, dev);
 	if (ret < 0) {
 		dev_err(dev, "request_firmware failed: %d\n", ret);
-		return ret;
+		goto unlock_mutex;
 	}
 
 	/* boot the remote processor up again */
@@ -1809,6 +1813,8 @@ static int rproc_boot_recovery(struct rproc *rproc)
 
 	release_firmware(firmware_p);
 
+unlock_mutex:
+	mutex_unlock(&rproc->lock);
 	return ret;
 }
 
@@ -1827,26 +1833,13 @@ static int rproc_boot_recovery(struct rproc *rproc)
 int rproc_trigger_recovery(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
-	int ret;
-
-	ret = mutex_lock_interruptible(&rproc->lock);
-	if (ret)
-		return ret;
-
-	/* State could have changed before we got the mutex */
-	if (rproc->state != RPROC_CRASHED)
-		goto unlock_mutex;
 
 	dev_err(dev, "recovering %s\n", rproc->name);
 
 	if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
-		ret = rproc_attach_recovery(rproc);
+		return rproc_attach_recovery(rproc);
 	else
-		ret = rproc_boot_recovery(rproc);
-
-unlock_mutex:
-	mutex_unlock(&rproc->lock);
-	return ret;
+		return rproc_boot_recovery(rproc);
 }
 
 /**
@@ -2057,7 +2050,7 @@ int rproc_detach(struct rproc *rproc)
 		return ret;
 	}
 
-	if (rproc->state != RPROC_ATTACHED) {
+	if (rproc->state != RPROC_ATTACHED && rproc->state != RPROC_CRASHED) {
 		ret = -EINVAL;
 		goto out;
 	}
-- 
2.34.1

