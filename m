Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011015.outbound.protection.outlook.com [52.101.52.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA18C1FBCA7;
	Thu,  2 Oct 2025 15:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759419333; cv=fail; b=pymVLhVQF30dQPz0cGwjvlLcqwYiO99LUi7hNhhVdmqde0MyjqKCv20b+yLBCbz00oYYzmpkebkdr+eERWMf3J/vHAjOZj9U+pIjIPEbuZq/YgfwjElvpcxCWfYb5Sa3xKJi1pai5+WnsvN4eD38/0NWFEdTote04AOq4+pYwgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759419333; c=relaxed/simple;
	bh=EEdBVMOdTlxGLm9TwaX2tY4yKHC/gX8EUEieSxzjMrg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FDoxDd8+FlOSiqcCWZ6mIhDwfOxLZ3HzOPzWUWxa4+yZFhpLaf5fBztt4mKyOBZFsZO0xpoWgg+Z8E0atLQUXz7feA/3z44JhVb8EOxbonFAt6cAr+AWAT4N+hCPqOuL0XPTYyIEneNqnZPoO8QZQLX+szulAmSID61OuV+s/z4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bLTTCn04; arc=fail smtp.client-ip=52.101.52.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bLTTCn04"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqWaWi66OHSPof1QvG5BI/dwI1PhJ0+YH48HHmaxG+XBWCMtDqTLObYIC6N28TZ+6trCxerHzyyktU755lkx+LIwen6FW1qofkWV04UfD5V+y7u4biDcRT1uJ4L9P4uRVy+chc6OHzefaAjgTTaVnCKOm0ncj/jokAQPUqcrBjazDYsuKCDWOoPjm6WQSGPWgqSt+IDCwl6VVGLV4lBegq/nB4eyX9k0hcmMbGCQPzGQb5Qon2htsF9pqbEZhUK11c58EPmwxvf3yiEfiMTa7m8pMH7hGT1GLuRqC2POP5yRgW0e4we1GCxAfP6jM3NTkbtrzAwGDikOcTnV+C71pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RD+p9WYfunRtzmK8Akga0C0tSNrqd7lYIr/vRggjH4=;
 b=hoUJFY+OyJVJBcy1AEimG5+TwyTHQzB+wL6PLYexFw519VWtT/wJdcnHpJqtPdCw63uNI2J8v0yIBHkvTzVLsCu7Kr/xGCQWNxm1sorXSAntkGNlNrKQhGXVCf++y/kv+iGAWbkedOWvBcmGu7FIfXhbSlzC3Tnau28hS9AERvuk/Sjjfbfz3g4Zu/a9i4R5+8CcclRXqma4Enxb1uXWQpXXCeeZ2+SeXqUyooRdZ9cbkCCGS1dBCJOXtYK8LxmmZLWBI5jEFx51djeAjy0bgAfkRCQWEqigVL6sG10PnVlwPQal81YMhknEDmCj54GwLx39LCQBSoSSCvYJ/WqtiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RD+p9WYfunRtzmK8Akga0C0tSNrqd7lYIr/vRggjH4=;
 b=bLTTCn04WQpEy/cd+FvsfoXNUVmDlcj4QSHrL6fSDbsgj764Byz61XtV2zljmjls0oFMUX5AsbkLpd1fu3BLnl+nZ1OJ5T+PsyqkI/vpy2D3FNanRpAU14kDAeHIJspe9RUtw1/b50rLkaAR9Af00X83kHgNkbzh12iIqvRcrq8=
Received: from MN0P222CA0028.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::30)
 by CY8PR12MB8340.namprd12.prod.outlook.com (2603:10b6:930:7a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 15:35:25 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:531:cafe::9e) by MN0P222CA0028.outlook.office365.com
 (2603:10b6:208:531::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.15 via Frontend Transport; Thu,
 2 Oct 2025 15:35:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Thu, 2 Oct 2025 15:35:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 2 Oct
 2025 08:35:23 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Oct
 2025 10:35:23 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 2 Oct 2025 08:35:22 -0700
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [RFC PATCH] remoteproc: core: full attach detach during recovery
Date: Thu, 2 Oct 2025 08:33:46 -0700
Message-ID: <20251002153343.766352-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|CY8PR12MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: 825a722d-f385-4ad6-ae23-08de01c94e19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?leYRej2dB/q24Me39YzaFLYD9IOvb51hYaify6XgI2/vVV+QSqjfn0iMNv8C?=
 =?us-ascii?Q?cOto/Ct+KcJk2Ob+XcZWKtpnSf0y3dthiIj2MUwX+FnuxqSGaE9nWnQVKysH?=
 =?us-ascii?Q?EiosRmM3ZDAh4g6xYEP+esdc9Gmx4z7Vsus8bZF6bZlaV5+5S2o1CbW/ljyV?=
 =?us-ascii?Q?Jtz6YCkEKSUn7DAqD0jiUhwXwImMOru++F3yk93SG31TbDfdWvAkOP0WJ49I?=
 =?us-ascii?Q?ysjqM1QNBe66T8F1aD65oXzj2UeY+BaT6JBNcFdUag9t4FDE/E6kMnYaSjfc?=
 =?us-ascii?Q?hcFQJzr6aVFMCtJnatKYiKa9m4L4+7g0UwJiQPiv8RsVlt7y1ovMtDslind4?=
 =?us-ascii?Q?5oTofRpW56QjX6P44pMuWWpPC6CeaMeRMiUET16+P+/uFpmVeb/24FZrAC9H?=
 =?us-ascii?Q?TP2zgYGIPs3FrTRd2L5vwonbwVXd/IvV17RXsgZaKRCbFc/Qunc2Ycjhy7j4?=
 =?us-ascii?Q?5DAtzUjumngqKipqwjO+w0RF08meLSLvW/aCJXexoXNjg02I7IrqCcbXzBrM?=
 =?us-ascii?Q?/E+zv1sy9EZKoDGlaOWMkqrik4Ft41C0ZcrFqxc4sV/bK2VtYjy2FdGwvjeK?=
 =?us-ascii?Q?DHcjqmxjdp1DMsbLZ3TuWadGrlXz2/vXyl7ifi4HRqa4XRtCZ3mlLPnxMAFT?=
 =?us-ascii?Q?WdPY3LGpQFbElabYZZRPJAHZ/ITD0rqkcgJC7hnLgig33gs1aUQojdiNj7uF?=
 =?us-ascii?Q?l3fvrJAxhlZ1Sar88l5teb6PYAnIHJ0wMV9y/EkwfNX7jsBcnZbjiMCcdFFr?=
 =?us-ascii?Q?OcUZ0gN4P2urnqGNlZ3vchO5NxS6qvunaRjBJ9SWzzhTwF4AAJLyK0lQ/1qK?=
 =?us-ascii?Q?JXGz6iRd6fxStnPyqajB4O9h+SdO953+x07ZkuHQj2UPO5EKGV0Q7oN9oY77?=
 =?us-ascii?Q?7OoGRV9dlSaiSjLiSWSZy6iF0Wr3LaclWQskdeRXF07R80id+shY6ETxR1EC?=
 =?us-ascii?Q?w8PhjCFBlCe/C7Q1crvZb/SWePMeHIc3RbM3mptwJxUglmIQn3TiHlmpLYRS?=
 =?us-ascii?Q?U+XBw1ugsyEEiG5Nu6YBJ+yclV3l+ufMwpQAmm1LGRCeBxwg/kbOc3kYbQBa?=
 =?us-ascii?Q?gMlvNZQ5054tKhsL78ufJv0rcPRDiBcQKyVxt2YZTSus7eEHZ2AZ49+KkuT4?=
 =?us-ascii?Q?Qyj7ftCWhsZrngf8qS7a1ubaxIXYavVellWyg9hgkzX378sVlHuuWAeZWsAG?=
 =?us-ascii?Q?asEFr26h/LiUsslNP06jGUgGFgyRP2196qO0QhQkZaZFL97U87a8h6HFGlu4?=
 =?us-ascii?Q?ImhDkYs+663DbKMZ/xuinOy56r6uHsI6mM1G9HYmDeIN+PQiXEq3LDxfDQrN?=
 =?us-ascii?Q?hePZ7CnrS01/ErP+jrke/m5EM+oIm2JTw15Z5T1yYTdCqVHFoqXAEzfKSTCU?=
 =?us-ascii?Q?VVEoepL8KyCz1H99M1VZoYU+C3K9+X5UBF4Svm66sNYrIp1GBUNAUxDh4Pfn?=
 =?us-ascii?Q?G+BbhlWbCQ3eVjZAqmJN1Y7IvUNONuMRFsYBRzi5lMlLSXz8VRQaVI2ju1Nx?=
 =?us-ascii?Q?K05s6MTeVEdS2oALiw8hrhYDf9q/Bk1lOPwA5nNNNHAMSdrzjoEre3qBYwTk?=
 =?us-ascii?Q?8vRc5bdoIOUnQ9qAC3g=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 15:35:24.3115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 825a722d-f385-4ad6-ae23-08de01c94e19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8340

Current recovery operation does only virtio device reset, but do not
free and re-allocate all the resources. As third-party is booting the
remote processor during attach-detach, it is better to free and
re-allocate resoruces as resource table state might be unknown to linux
when remote processor boots and reports crash.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Note: RFC patch for design discussion. Please do not merge. 

 drivers/remoteproc/remoteproc_core.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 825672100528..4971508bc5b2 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1786,7 +1786,20 @@ static int rproc_attach_recovery(struct rproc *rproc)
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

base-commit: 56d030ea3330ab737fe6c05f89d52f56208b07ac
-- 
2.34.1

