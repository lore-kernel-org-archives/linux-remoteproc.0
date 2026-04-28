Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012039.outbound.protection.outlook.com [52.101.53.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684D8138490;
	Tue, 28 Apr 2026 21:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777412033; cv=fail; b=BrO7+S6ZGvqCWo7Wb7XeM2WEgIIhVyuvbVXYIVl0nAftKCXMR6WYLIgRXHenluvyPEN4pG8kG8jK3QqVgMPKB4j+6VzMXsuinOblpbl3lynwG0frbE5l8hQKRLxnzEfmOYUqwcS93xt84p3m41pET8wHx80Z9hwQw93bSD/YAM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777412033; c=relaxed/simple;
	bh=GPj4oMZdmFMbXl+h8eAUbZE86d0LWn2zRFHGZ1+3u10=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NeMDGOVob2yZQGcJw98nAtEdBk2lOky1vCZaoD4eBuOsPcyNkXfxoGfLOo2quj5dy3a6JG8SfbXgreLdqinbocdwR4AZwIapjhUVL9X7nJOi1+DzPy0Ck8VSAags2TE/HFdXfoZ5A1bhRyg8xf3B5pkmNgnyohAOYagJiFVVy14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Lgfh8/kK; arc=fail smtp.client-ip=52.101.53.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Lgfh8/kK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXWwqKvKVPFWT82dq7klm78e6tAcREwTZOTmozEp+ZSe76Rz7/PI3zm2cZoWQkUc13IwkqToraBXDYO+3WRIEutkunDciCxOnFT3ZPoEMeIVuaPxZpwQaqmiUBbQIqq+fu4U7GreRdv+Cz7/RDZy1rKhmAAYo18hyp/C56+8+4yD8fVxSWm/ZM3X0g3QPELfKVP64ZjshyBO2WPx6Yt8sgo1um2UvUV7R3WzSbF572lXF7ZS/5Tj9AOJYM5vByuwZ8rqgcTDn5724ZfsTsxdKVBTdaAMtretCCb8y4AyfL0h+hj5exoUaKy256JfuxxH4rDN4xZfbtJUPuqXg7Y/Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkVxirn7pSspooJU84wz8D3Q6wwUo/rydX5W69TUoos=;
 b=LIhN/e7rAwYLOszcU6rGKHAOuXosv+X5P3uO+8F0A+PNBlhHpLvlTAN2n9baWl7ZPbCZ/FEfizUUmQO0J8qJBmGWZLCpKro2tcbuDDu2NrXiTNQVzDlhqALbGjeURBfNc2kMp2MSed80HqdUkjlXvvFJsCmwiCxHApOHUK/x4o+69aDMxz2FTyuMuZu6t/xHPYACIjdTXQnzyRBBN5p2xiT5tfWbv0bmrISaABWCVW8KuY7HHOjTN/s0Z2Oe9XsB8XbXU1Urr2k/oQ6o4MOXCFTXQYGltVXngHOfFOoDQxA7Tj7ClBNpJidC9TtnzBeIZq2kfTxWtx6v27aYXm7cHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RkVxirn7pSspooJU84wz8D3Q6wwUo/rydX5W69TUoos=;
 b=Lgfh8/kKUcA50dag5pfgz6as9WH2mAzWTiDj9wWI4b81fBeBDu3bt0IQiV+qb2IFChCo2Y0TokiUICU1iI2+AUg2SDZ0hNg1LIfOIxxSqt0boHJ/Thorr32Po8M+dEFVgOvVYClE9hN3XvP+jjm4tQOPL2IkLdZAA4iHLcWc31I=
Received: from SJ0PR13CA0206.namprd13.prod.outlook.com (2603:10b6:a03:2c3::31)
 by CH3PR12MB9282.namprd12.prod.outlook.com (2603:10b6:610:1cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Tue, 28 Apr
 2026 21:33:44 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::52) by SJ0PR13CA0206.outlook.office365.com
 (2603:10b6:a03:2c3::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.16 via Frontend Transport; Tue,
 28 Apr 2026 21:33:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 21:33:44 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 28 Apr
 2026 16:33:43 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 28 Apr
 2026 16:33:43 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Apr 2026 16:33:42 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <michal.simek@amd.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>
Subject: [PATCH v2] remoteproc: xlnx: check remote core state
Date: Tue, 28 Apr 2026 14:33:27 -0700
Message-ID: <20260428213327.210574-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|CH3PR12MB9282:EE_
X-MS-Office365-Filtering-Correlation-Id: 647c5ebf-f018-4458-2a8b-08dea56dd308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	a3lxhqGMyyaYiua/0PmUJV+t/r+Ck1a+0n7przUwE/S9P3jjqGwq86aXSvrD8d15Jmeemx63fVYBt1YFY1fQK5BKlxPPWbUM+zOwjtGis3XOC19LJO84lMlbeOBRM3+3yZUtyYKUznUrtssANEZEdOGe68xWLQVjjyoGv8wuN84j1AXFzJOgOTzIkDsKSVYlxQEYN8jFcJ4lzcBNncNNgeOE7B0192ypEDSuyqR/R8RulrQbzP5lhcSlrnNcn9dZIaE6UIUmam4IPqoLQJK3pmaz+7i5W1xQAkSCBNlJtVsEz1oKDlB0oqmbqkn9FnWiU2AMGCi+VwpIJa0xqhpqSdMnFzvxTXAVZZnj4XClAVvCFIxzhPlwg7EkV3+GZL19GnnemMcEROWePY3+cx4xiSCXyMMHsR3/LQGh8itnMZgzMK8bgzIeXy8b9qRgJXcKYrOME/VVLQSTkSfD+qQZg2sien6jerDuQQotHaQkXm0H/w8f/OKz1/q9aI42aGUdSM8zoTWvUaolNOX7WsVlIvklvTUQQW+4bmdOazKzfehuRVFJiOlmxHW7W/LwPEkSZmRcyXiD+PMaEC6SJWq7fS9jYwn+0crk3/qAmO63MOagDR8yizOAKjZrUx05N5BYUUOS6uCDECbqd5NmQmIcFHZCz5/6VvtPOCIMWIp8pvEXUbBvmjxoyW2i5clMsw93FJMZcTFTP9wJInXPWWggWuzNh0+My4/S16naXNgkIH3g0o79Bi4qVRopbVCPW+6JoUTynmnobUVkQV1zohRrkA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ITUaI9relxusjn80TgphpRususyW9VGvO0LQtnkKA8DFBtmFSxXc//cO1VuETEOOgrEdTb4YrG2YghBMycJoKuA4sJmJ8PTACJ1DTHIO+/z9UZt01nUrmyAePw2ZCZdr3LqkDvNHZBDA86iF0ee2fToOmD75seYhDh7SkzgU0Zs5Upg+0/YzAvGJkhC9WacJkKWaE4Pjr0QGu1sFuHmaCY0fhOmdluhxLyHiTGCaWsnItfu9rmcSPlOOooz3TwG9WvNG9jcnhJ+lqV3EIBuB7csiL5xD1XLsye29cHkE+Bd857p9+cqVB/L2AoYgUv7GEDn+1gMHSj+duwfAYaR2DcBJCbNSIdNnoQeWpfi0/HuXEpY3gphf8YZo4ugmkxwWSfaZT4TXSbt/d+TAAN75G0Lmh0STexKF157dlNL2BTyQ36I1GFGISs0bkFoqzRxq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 21:33:44.2395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 647c5ebf-f018-4458-2a8b-08dea56dd308
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9282

The remote state is set to RPROC_DETACHED if the resource table is found
in the memory. However, this can be wrong if the remote is not started,
but firmware is still loaded in the memory. Use PM_GET_NODE_STATUS call
to the firmware to request the state of the RPU node. If the RPU is
actually out of reset and running, only then move the remote state to
RPROC_DETACHED, otherwise keep the remote state to RPROC_OFFLINE.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v2:
  - fix subject line: %s/node/core/
  - add comment explaining optional resource table availability in the
    fw

 drivers/firmware/xilinx/zynqmp.c        | 28 +++++++++++++++
 drivers/remoteproc/xlnx_r5_remoteproc.c | 46 +++++++++++++++++++------
 include/linux/firmware/xlnx-zynqmp.h    | 21 +++++++++++
 3 files changed, 85 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index fbe8510f4927..af838b2dc327 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -1450,6 +1450,34 @@ int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
 }
 EXPORT_SYMBOL_GPL(zynqmp_pm_get_node_status);
 
+/**
+ * zynqmp_pm_get_rpu_node_status - PM call to request a RPU node's current power state
+ * @node:		ID of the RPU component or sub-system in question
+ * @status:		Current operating state of the requested RPU node.
+ * @requirements:	Current requirements asserted on the RPU node.
+ * @usage:		Usage information, used for RPU slave nodes only:
+ *			PM_USAGE_NO_MASTER	- No master is currently using
+ *						  the node
+ *			PM_USAGE_CURRENT_MASTER	- Only requesting master is
+ *						  currently using the node
+ *			PM_USAGE_OTHER_MASTER	- Only other masters are
+ *						  currently using the node
+ *			PM_USAGE_BOTH_MASTERS	- Both the current and at least
+ *						  one other master is currently
+ *						  using the node
+ *
+ * Return:		Returns status, either success or error+reason
+ */
+int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
+				  u32 *const requirements, u32 *const usage)
+{
+	if (zynqmp_pm_feature(PM_GET_NODE_STATUS) < PM_API_VERSION_2)
+		return -EOPNOTSUPP;
+
+	return zynqmp_pm_get_node_status(node, status, requirements, usage);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_get_rpu_node_status);
+
 /**
  * zynqmp_pm_force_pwrdwn - PM call to request for another PU or subsystem to
  *             be powered down forcefully
diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 50a9974f3202..45a62cb98072 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -948,16 +948,6 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 		goto free_rproc;
 	}
 
-	/*
-	 * If firmware is already available in the memory then move rproc state
-	 * to DETACHED. Firmware can be preloaded via debugger or by any other
-	 * agent (processors) in the system.
-	 * If firmware isn't available in the memory and resource table isn't
-	 * found, then rproc state remains OFFLINE.
-	 */
-	if (!zynqmp_r5_get_rsc_table_va(r5_core))
-		r5_rproc->state = RPROC_DETACHED;
-
 	r5_core->rproc = r5_rproc;
 	return r5_core;
 
@@ -1210,6 +1200,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
 {
 	struct device *dev = cluster->dev;
 	struct zynqmp_r5_core *r5_core;
+	u32 req, usage, status;
 	int ret = -EINVAL, i;
 
 	r5_core = cluster->r5_cores[0];
@@ -1255,6 +1246,41 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
 		ret = zynqmp_r5_get_sram_banks(r5_core);
 		if (ret)
 			return ret;
+
+		/*
+		 * It is possible that firmware is loaded into the memory, but
+		 * RPU (remote) is not running. In such case, RPU state will be
+		 * moved to RPROC_DETACHED wrongfully. To avoid it first make
+		 * sure RPU is power-on and out of reset before parsing for the
+		 * resource table.
+		 */
+		ret = zynqmp_pm_get_rpu_node_status(r5_core->pm_domain_id,
+						    &status, &req, &usage);
+		if (ret) {
+			dev_warn(r5_core->dev,
+				 "failed to get rpu node status, err %d\n", ret);
+			continue;
+		}
+
+		/*
+		 * If RPU state is power on and out of reset i.e. running, then
+		 * assign RPROC_DETACHED state. If the RPU is not out of reset
+		 * then do not attempt to attach to the remote processor.
+		 */
+		if (status == PM_NODE_RUNNING) {
+			/*
+			 * Not all the firmware that is running on the remote
+			 * core is expected to have the resource table. The
+			 * firmware might not use RPMsg at all, and in that case
+			 * resource table becomes irrelevant. However, we still
+			 * need to make sure that running core is not reported
+			 * as offline. so do not decide remote core state based
+			 * on the resource table availability
+			 */
+			if (zynqmp_r5_get_rsc_table_va(r5_core))
+				dev_dbg(r5_core->dev, "rsc tbl not found\n");
+			r5_core->rproc->state = RPROC_DETACHED;
+		}
 	}
 
 	return 0;
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index d70dcd462b44..7e27b0f7bf7e 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -542,6 +542,18 @@ enum pm_gem_config_type {
 	GEM_CONFIG_FIXED = 2,
 };
 
+/**
+ * enum pm_node_status - Device node status provided by xilpm fw
+ * @PM_NODE_UNUSED: Device is not used
+ * @PM_NODE_RUNNING: Device is power-on and out of reset
+ * @PM_NODE_HALT: Device is power-on but in the reset state
+ */
+enum pm_node_status {
+	PM_NODE_UNUSED = 0,
+	PM_NODE_RUNNING = 1,
+	PM_NODE_HALT = 12,
+};
+
 /**
  * struct zynqmp_pm_query_data - PM query data
  * @qid:	query ID
@@ -630,6 +642,8 @@ int zynqmp_pm_set_rpu_mode(u32 node_id, enum rpu_oper_mode rpu_mode);
 int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode);
 int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
 			      u32 *const requirements, u32 *const usage);
+int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
+				  u32 *const requirements, u32 *const usage);
 int zynqmp_pm_set_sd_config(u32 node, enum pm_sd_config_type config, u32 value);
 int zynqmp_pm_set_gem_config(u32 node, enum pm_gem_config_type config,
 			     u32 value);
@@ -939,6 +953,13 @@ static inline int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
 	return -ENODEV;
 }
 
+static inline int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
+						u32 *const requirements,
+						u32 *const usage)
+{
+	return -ENODEV;
+}
+
 static inline int zynqmp_pm_set_sd_config(u32 node,
 					  enum pm_sd_config_type config,
 					  u32 value)

base-commit: fcdf2df56d34a3f04cab0725c5bc3abdaa73c2be
-- 
2.34.1

