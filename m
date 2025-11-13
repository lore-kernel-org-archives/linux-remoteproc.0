Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012070.outbound.protection.outlook.com [40.93.195.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE9C2FCC04;
	Thu, 13 Nov 2025 15:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763048703; cv=fail; b=fSokDsDVkY3fbq8GkRQYwFVfigwFCdvMwx8n1mR5GIHrgbmWHgxfg++SYdOBVWRue1O0fNd69RyrfkB9CCRrinrb68Y8QN9qkQ7ivZShuoNJyqNGs8Gawa8v39XOnHt/TRaoV+qLMvjHxN9+KbIizE+kbNHown4uh2Ngro24RAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763048703; c=relaxed/simple;
	bh=GTXbKP1WkWX0W9ArC54hpCfv1N1vAGqsmGlbCHaWL+M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EfRGhfJg3ZXrYILrDhxiEGGw/3WMBX/pMpFg3UPJ0xRlOn2tjaiRZe1zj29Ga6NuMjqgPu106N5AbUmyyb3oSiaCcdBSZ8c82ltZWDyOTbUOjxjgtebO81etG9N6L181q3ozRLVYbINQMty8ZTa12KZ9kH4dxBOOnjk7mRtIFPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=s55C+8EK; arc=fail smtp.client-ip=40.93.195.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="s55C+8EK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gUKYK6bo+xaPH7E7k4esXWPH2WM1tDP8Y/8QCv7aUpYTzP9nzh19ZSt/Tb+tqF129Xsnybc8PRT1eMAjdEP4xOWyHQTBre/BqxqCtmTF7iHHDiDQpgM8EAarCaVV44C38a3j69qkfhNTl9fkbztuHc6ZLWetfiURKqQ4rQP63ysf0oRFsl/vDR+lDszlT3AhwN2QeFE2CLETTM9Re8Y/ZddaK860d1dTjWvAGRHh6IKnLH1+l9tako9s7s6W7m+8wgpjr9h0d+v+lpCdFy4qVFxdKVE4NqBvr1T3Uxs39fZRxDU9CBaRH5YJ3LKcq94E2LNGT2gqJJrwSvGRRbsSrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hT6hViAtAsHDG+y4pGGGptgnW4Ritz0bkM9k1/nNhsY=;
 b=UFkuiP0KBPqA2qO/LwnscOehyWgWJ9H/b+zlQqpUl/gQcjikj/EFsB2HU3h9Sp5Jf0eDXa0RDzJ3fNOm28Deovf/UepxBBs4nkkSZ2plajoUTFTegDyReybsZUAHtwmAtzV2EUYPpPNPCTmHoVIA4gVchVZKdMk6wUdI35p76AwpfvkXvIJOewXC/X2sgnfkiFdQyARs5HLTvZsp/Peb1jJWXG+op8M9Vyf8LwePlKnXyZRfA5q+/Cq00/s/TEUSsmVGw2XbZ55+8y+BSB+zJz6XWqUC+SIWCxpr+JByzTZLTgO6dgo9g+Rx7gBq7T07C9tDjObvXnvHpwdLVT+Y+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hT6hViAtAsHDG+y4pGGGptgnW4Ritz0bkM9k1/nNhsY=;
 b=s55C+8EK9LZbelCSa+GoVq9nYpAIay3TFL4s44rYdJryjBqJ4EWJgnVHckxwPZBF8kUWsKTSZVHQOsEqytU0JPPmNnVETu8EAmfGMcciXB99uHfe5geq+pPWiMuHlBV0nlF4BnbIr+I581VxRHwnnklf/86DuAfOSTPwi/V6eQw=
Received: from PH7P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::33)
 by CH3PR12MB8994.namprd12.prod.outlook.com (2603:10b6:610:171::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 15:44:58 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:510:326:cafe::69) by PH7P220CA0027.outlook.office365.com
 (2603:10b6:510:326::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 15:44:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 15:44:57 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 13 Nov
 2025 07:44:54 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Nov
 2025 09:44:54 -0600
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 13 Nov 2025 07:44:53 -0800
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v2 2/3] remoteproc: core: full attach detach during recovery
Date: Thu, 13 Nov 2025 07:44:03 -0800
Message-ID: <20251113154403.2454319-3-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113154403.2454319-1-tanmay.shah@amd.com>
References: <20251113154403.2454319-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|CH3PR12MB8994:EE_
X-MS-Office365-Filtering-Correlation-Id: 093cc14c-8ec1-47ba-55fa-08de22cb9912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2NExrX3Rfpx8R3bqc1nsfoXQW8mARiB+1UMQNhInWpg9b4XvAypENpAsBy+r?=
 =?us-ascii?Q?agiW8E3zu5TmY1O5YFCrK+M+KwzPzfNRA6VEGCUtwmF2824R3sTC1IhgF7Mo?=
 =?us-ascii?Q?nSEBQTOs2nWF0NOeh81+eJcOBJoawGWm4tApSUtrs0WHl/26Dde0QgtSmmlh?=
 =?us-ascii?Q?ZyY47YGDXkDm8Dsu2JR8CNZNBNry8wAqIcE8TyJjsqDvB8W9/3ObRsdf1izh?=
 =?us-ascii?Q?WY9yX3/k90Wgo95Np06+ryBEPV859Rx0jid7per5MVxiR0TZfn/9Ks2Onjkf?=
 =?us-ascii?Q?vxtcSreE0prq2SoBmOchA21KSJgfq9iA+K4nzN4p3bcgjuQEBIctwAYle86H?=
 =?us-ascii?Q?5+Bt9eGyQJrEqv+V7LGwWJ+UQRX55Qjz1Cw21XueI3jfPHZaCwZ3oHEfEpv7?=
 =?us-ascii?Q?ph714XXNajwCE/ODAaannVhjzZAbCc+8nXqvlNtgCRl27w1yMfkj6kLpOQop?=
 =?us-ascii?Q?2Sz5SSd0F3s8wfSZ9ygBcLOseHcnd4rt7Pz8tZWgndjXb2Xv96irJcCdcSyt?=
 =?us-ascii?Q?Tv+4qFeHK9pDIyH6sCpXV6Q/1DcCEvXCLeafqWgOM6dAgLN2WpEj57a9jha3?=
 =?us-ascii?Q?vIXsX9mx9rSCeYICoogYbDbO09a6DvId7SgeWrm1JxJyHYldIJysBUhWCjMg?=
 =?us-ascii?Q?BndiLiPpaci3rKhkDmMFkPMgkzCoE3iYHshWADgPvV36jMFFRm2E+p+A9DAn?=
 =?us-ascii?Q?EZTDXAHSs6wYC8Xb27gvQzTD4MxNDXVVnkai1HjE+yZwpIjjZzCJ43+jXopQ?=
 =?us-ascii?Q?aw4HowO29nvBQY/KGiPp+7YyjtNByMGvpCLnMSQHFID1ga79ZFpzZWKCSmaf?=
 =?us-ascii?Q?lSeG8X+a6MN7UtWkFviFrxRFjh9I3GY2dhpE9Dy0R6W40AaSUu2WylCgHSIy?=
 =?us-ascii?Q?CJtOPXRU2rq/OrmzsbOX1KKgQmVXdr/hzrNuTpKNbV+hWfXJOz5ZQsLK6ZVX?=
 =?us-ascii?Q?7/SycTgIA0/WQwQ0TeT+6zPT83gYqeIEANjBhMBku9XBDIr+tNk3Pc54S/Ns?=
 =?us-ascii?Q?yFARO/2aa1Pa1hYKoXi+9K0CFhunhrJGEjpfLCfHXznqO6dhP1FGiz2k5zwe?=
 =?us-ascii?Q?ucFlYK4w25uAqOFqGHj1dtQ3VgsMQ/ObrZBgcxTGorT3yE2Pl55MplS4c/x1?=
 =?us-ascii?Q?C/WnHMhCJUB570f5MDjtDeglGjEp1Z0BSroTIm0wAUlmc+sovNNIZY+/ZUZn?=
 =?us-ascii?Q?6e/bNwI2mt7jDswU+CqfYEKiK9epXKbP5AjKXY1ksys0LEWeNdZqJwZlOjAX?=
 =?us-ascii?Q?u7QyTD/iAfLdWcomiperZM87vR+q2tmEWT1DXQ8uDRVdHxc6pU3n1vEIuGmB?=
 =?us-ascii?Q?PanrKCBzFZaBgqE0qwouOa+Vdevp3HhMwdPEdf6iaBMRNMvjQN1GcyhJbavR?=
 =?us-ascii?Q?jayML4rVMnaXZEdyd52epEWUdG6LyIOLFBX3M1PrCnTSKtNyqwaroQ7OiB7J?=
 =?us-ascii?Q?XsedS2pMsXJMfN6yliJoKhb8WDyfLZFYByJY4tis26IOYiLA8RZN5JtUlLL2?=
 =?us-ascii?Q?Qrc4ApfSD4LAXh8le8zcWqDOHsgpUTdR5X5jH+asRJoojsj4L1UcxqT+q10c?=
 =?us-ascii?Q?/322fSHKT+4w6RpO0QM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 15:44:57.4129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 093cc14c-8ec1-47ba-55fa-08de22cb9912
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8994

Current attach on recovery mechanism loads the clean resource table
during recovery, but doesn't re-allocate the resources. RPMsg
communication will fail after recovery due to this. Fix this
incorrect behavior by doing the full detach and attach of remote
processor during the recovery. This will load the clean resource table
and re-allocate all the resources, which will set up correct vring
information in the resource table.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v2:
  - use rproc_boot instead of rproc_attach
  - move debug message early in the function

 drivers/remoteproc/remoteproc_core.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index aada2780b343..f65e8bc2d1e1 100644
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
@@ -1829,6 +1829,11 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	struct device *dev = &rproc->dev;
 	int ret;
 
+	dev_err(dev, "recovering %s\n", rproc->name);
+
+	if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
+		return rproc_attach_recovery(rproc);
+
 	ret = mutex_lock_interruptible(&rproc->lock);
 	if (ret)
 		return ret;
@@ -1837,12 +1842,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	if (rproc->state != RPROC_CRASHED)
 		goto unlock_mutex;
 
-	dev_err(dev, "recovering %s\n", rproc->name);
-
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

