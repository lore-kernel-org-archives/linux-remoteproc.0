Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010015.outbound.protection.outlook.com [52.101.46.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DC6346E66;
	Wed, 22 Apr 2026 20:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776889606; cv=fail; b=fE4GY4Iwkb8m6A5ZS2tynVIxDa1ZFaf0ZsOn5TIvTEV6BYm4O2Te2QgHIaeXtIp64MBgqya83aOb06uS5ykBOzwyN4aeMf452xkLH/NdSIg4KOxb7+46PVZDWDrY4JUSjfLmI09OxM4ngzAIGpAqajMDxrh2mnk8yJK3nmwObOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776889606; c=relaxed/simple;
	bh=ekA8LIByy8FzYKnwkNHa+vF26sKM5u1mhe1ASg0YlEg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NF9I9SALUNVYp9X3zL8Uz0cbDvq5nQe6YqNydyf735xCyWP5ikxxMaLq6vZoTIRL0u/2IcS92JZkTUwtNLlsz3bJX4Xp2d5kYlcNmHVPTZUnJ3CjPsRYCO5Wlyepm1lG7WFKvDkQLZ5Qo6jBy6Q6m0ygn63X3oZ4qvsKA3fNKjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oOibfZCS; arc=fail smtp.client-ip=52.101.46.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oOibfZCS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMkcx0zwTjejjAz+8ktxmCfmSmmeFNvSn7R1xC9qr0kA5ryN+J2hSXSao/1O1JUSsgPlPsoJP5s2eDolkyzCidgXz9556P6hf5wMrPIqF8ajapcj4/7mZNOSB8gzr7Nj0BC4Ty/2ZV45hwQcF77cFrwRObtjaw5ki3KHU0IAVdk6LKM1XLIkhZTAjmA/hi4xWF59dO1PEV2a38J9Q2sjcOM/Q64oFuXi/NZ1GXNlSbTIshJtvsd62tAHLK2+0dQJcr2mCFt0JeYod6tne8W9TzUJR9XQUTHNQ7rs0C9VWvFDZ0qdNeJjYdGfg2dTuxsmc8IKRO/GVGebgY/Yi9rBmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBv5jjdjxH5ULFbRv7VfJ+lpYWyW8XQDfsXEr7Cqu5o=;
 b=v6jrkzF0WJwc8w8RW+s81eErPi9m9EFDissqq5MBOljiNyc+whcUJV9hcd1Sd1/InzE9zOB6JsiONAIgDaOAAivdGcpJ7iv1z3c+I4rsW8CQl0//YB3XQ/onwd62lpS8noqf4yPdG6JtLdVvzh4Ef5ogJ+jt+8Pnrt5x74NP1qkuhwERsRJNZzjZXaIVNSNjJs1nerr+UEK05x0qKnpQTl06Uv+l6MT1rboC5WvfO0clRBEw5giEztOBJ6TQtVQhKESlFYUakpzJ4m+hey0WpqNZYbEV0lvv/3DVBVhyU/CQUYmI54y5dk03aDI9BK61Ykqkm/qhZjKpHJzYukgQuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBv5jjdjxH5ULFbRv7VfJ+lpYWyW8XQDfsXEr7Cqu5o=;
 b=oOibfZCSzF/yoc0KfE3PxQjcIKiIKyG/13X34T3mEk7VeRLZiryIZLLA0frpA/VOlhZb6jK9pNlLMM1Yll+vvCz2FaQiK7Czp8POV5mwZJU5c1EJZzr+gJ8aQ336ya6lLzKuw7WckRoPEI8NjWlhgVT5xbV0uoD3mg4l45uto+4=
Received: from PH5P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::12)
 by CH3PR12MB8725.namprd12.prod.outlook.com (2603:10b6:610:170::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.17; Wed, 22 Apr
 2026 20:26:39 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:510:34a:cafe::7f) by PH5P220CA0007.outlook.office365.com
 (2603:10b6:510:34a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 20:26:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 20:26:39 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 22 Apr
 2026 15:26:27 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 22 Apr
 2026 15:26:27 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 22 Apr 2026 15:26:27 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <michal.simek@amd.com>,
	<ben.levinsky@amd.com>, <tanmay.shah@amd.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] remoteproc: xlnx: enable auto boot feature
Date: Wed, 22 Apr 2026 13:25:58 -0700
Message-ID: <20260422202558.2362971-3-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260422202558.2362971-1-tanmay.shah@amd.com>
References: <20260422202558.2362971-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|CH3PR12MB8725:EE_
X-MS-Office365-Filtering-Correlation-Id: 02f0f7d9-76a7-4767-c407-08dea0ad7574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	oo94xBkmNzOJBdk7PA5Novnkn7Jt6z1mQVm0+G4DQg/zJcbHYpfQMv0vF8qnLBzJiVd4gbqHx7XWjbaa1unVTC0vU9MoaGpeUmLklBY1xf8AbxmDgkHBH02qhdhexO512op8tc8CfuHfC5Ym1i6cB2BgzsYAhUJTeF+Q8i9b7y3OEYCGIS6O/3bSCS4zBhObImtb9k4QeAgQ/vBJk0gAO5QqdUcGOktkfsvTCWeUVAMTUr4tnxZxwaAF06SqchwL4Juqx4LpDOu/N9qp8Q8FeQkmhCTNAY9HwtkqITFgma3lLo905zkhE84Vqth4gCj2qlJ7B7xns+0tJUGGsUNQWOcWEMFUjUWcEErVoW/AmftfrPVkkB/rRNjFOnatPLDbgrIIQlxWtbq5kLX/qoDAH/tUPtF/8CbuSog0MMYY8hNSF5YxsK2V+N2eppRm5yFHU4/EbhrU0GYXrzzcgpe+vuA0tZtPFf2Mne0byM3DRaiduXV3f9BkmIHHVIS1jkLaAmVVdclKO4An+r7qMc0n3vSnpPNZNja3Hyc2qG7tLtgLDt3uvfkOTesm0nmO2dsyPwAOjf92njnCO190xOSjqVC0hUM5B4JB+U0a0TWp87M4dkuvLYNbQQMFf3EqHsBXgGVVaoH+tOk1hprqldgd8OSTrVCQrjn7j7cqMNPhslJdQvtdYSPa9VSZXfSLWPYp1nzvTtY9rWvRF/Tt52ihmZvt4PRQgrRk7jQtE/0OXn4gGumyHdMSBTI7quC/Nbj3lpxi9kMCH1RG1zxk961kBA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5bu3/w8l0g9uVpl1EMWUXFjxIvi7piAUvm7t6rfQVler+milCIkoHk8PLQYbqYSJQhgGsFipHH72VUvrxlSQG6vM61qZLDlp+3e8exadCf5E7FbLG1fQzAHM/h+//iiam7BIrFYxio+OapMQbyHdkJyF9FZWx6Uq41gqaBX/QuqOi8/kxyQavEv4+nN9bhIdsOhVQdSPz0Hc13/CMxQoEEbdLXcrj/1Z7AvR1fDEH6P4K9Omm0W8ryiFgRkO/Ke+eyhd0WE5oxZHeQqZsmx8vhATmY4dawR45xrirvAmFtOvaWOjfSwWmq8ZBBYJbN/jNvnRqsm4uroVVTBRF1rCWcRNFyFEQeGQd0+PYs6Afj3eXj2UX3Rqo9FddEU4S1LMO5ZGmM+VapZA2TrLZQTLw5yGChT53ve7OVoKVnn0Q+JNjjKMGdelR/A+8HfxXCGG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 20:26:39.2730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f0f7d9-76a7-4767-c407-08dea0ad7574
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8725

remoteproc framework has capability to start (or attach to) the remote
processor automatically if auto boot flag is set by the driver during
probe. If remote core is not started before the Linux boot, and linux is
expected to start the remote core then it uses "firmware-name" property
to load default firmware during auto boot.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 49 +++++++++++++++++--------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 50a9974f3202..c6ec8186b160 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -899,17 +899,18 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
 };
 
 /**
- * zynqmp_r5_add_rproc_core() - Add core data to framework.
- * Allocate and add struct rproc object for each r5f core
+ * zynqmp_r5_alloc_rproc_core() - alloc rproc core data structure
+ * Allocate struct rproc object for each r5f core
  * This is called for each individual r5f core
  *
  * @cdev: Device node of each r5 core
  *
  * Return: zynqmp_r5_core object for success else error code pointer
  */
-static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
+static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)
 {
 	struct zynqmp_r5_core *r5_core;
+	const char *fw_name = NULL;
 	struct rproc *r5_rproc;
 	int ret;
 
@@ -918,10 +919,15 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = rproc_of_parse_firmware(cdev, 0, &fw_name);
+	if (ret < 0 && ret != -EINVAL)
+		return ERR_PTR(dev_err_probe(cdev, ret,
+					     "failed to parse firmware-name\n"));
+
 	/* Allocate remoteproc instance */
 	r5_rproc = rproc_alloc(cdev, dev_name(cdev),
 			       &zynqmp_r5_rproc_ops,
-			       NULL, sizeof(struct zynqmp_r5_core));
+			       fw_name, sizeof(struct zynqmp_r5_core));
 	if (!r5_rproc) {
 		dev_err(cdev, "failed to allocate memory for rproc instance\n");
 		return ERR_PTR(-ENOMEM);
@@ -931,7 +937,7 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 
 	r5_rproc->recovery_disabled = true;
 	r5_rproc->has_iommu = false;
-	r5_rproc->auto_boot = false;
+	r5_rproc->auto_boot = of_property_read_bool(dev_of_node(cdev), "auto-boot");
 	r5_core = r5_rproc->priv;
 	r5_core->dev = cdev;
 	r5_core->np = dev_of_node(cdev);
@@ -941,13 +947,6 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 		goto free_rproc;
 	}
 
-	/* Add R5 remoteproc core */
-	ret = rproc_add(r5_rproc);
-	if (ret) {
-		dev_err(cdev, "failed to add r5 remoteproc\n");
-		goto free_rproc;
-	}
-
 	/*
 	 * If firmware is already available in the memory then move rproc state
 	 * to DETACHED. Firmware can be preloaded via debugger or by any other
@@ -958,6 +957,11 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 	if (!zynqmp_r5_get_rsc_table_va(r5_core))
 		r5_rproc->state = RPROC_DETACHED;
 
+	dev_dbg(cdev, "auto boot %s, rproc state %s, fw-name = %s\n",
+		r5_rproc->auto_boot ? "enabled" : "disabled",
+		(r5_rproc->state == RPROC_DETACHED) ? "detached" : "offline",
+		!fw_name ? "NULL" : fw_name);
+
 	r5_core->rproc = r5_rproc;
 	return r5_core;
 
@@ -1278,7 +1282,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 	enum rpu_oper_mode fw_reg_val;
 	struct device **child_devs;
 	enum rpu_tcm_comb tcm_mode;
-	int core_count, ret, i;
+	int core_count, ret, i, j;
 	struct mbox_info *ipi;
 
 	ret = of_property_read_u32(dev_node, "xlnx,cluster-mode", &cluster_mode);
@@ -1364,7 +1368,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 		child_devs[i] = &child_pdev->dev;
 
 		/* create and add remoteproc instance of type struct rproc */
-		r5_cores[i] = zynqmp_r5_add_rproc_core(&child_pdev->dev);
+		r5_cores[i] = zynqmp_r5_alloc_rproc_core(&child_pdev->dev);
 		if (IS_ERR(r5_cores[i])) {
 			ret = PTR_ERR(r5_cores[i]);
 			r5_cores[i] = NULL;
@@ -1409,6 +1413,22 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 		goto release_r5_cores;
 	}
 
+	for (j = 0; j < cluster->core_count; j++) {
+		/* Add R5 remoteproc core */
+		ret = rproc_add(r5_cores[j]->rproc);
+		if (ret) {
+			dev_err_probe(r5_cores[j]->dev, ret,
+				      "failed to add emoteproc\n");
+			i = core_count - 1;
+
+			/* delete previous added rproc */
+			while (--j >= 0)
+				rproc_del(r5_cores[j]->rproc);
+
+			goto release_r5_cores;
+		}
+	}
+
 	kfree(child_devs);
 	return 0;
 
@@ -1418,7 +1438,6 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 		if (r5_cores[i]) {
 			zynqmp_r5_free_mbox(r5_cores[i]->ipi);
 			of_reserved_mem_device_release(r5_cores[i]->dev);
-			rproc_del(r5_cores[i]->rproc);
 			rproc_free(r5_cores[i]->rproc);
 		}
 		i--;
-- 
2.34.1

