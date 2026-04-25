Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013023.outbound.protection.outlook.com [40.107.201.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E0436215F;
	Sat, 25 Apr 2026 03:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777086172; cv=fail; b=ah5eaRVV4AAucTL1r9+No5aKW7vuECPFEWrtf43EZde4hYZiEwj3JOO774SiGaL1iepu7pWw4p6d55su24D9j5okgcB2FARgM817OkafrTmXWH7BNjsuzZOuB8Zfi4xBOLFiF8s3mM0kBLU8RrIHqiOxCavofIi2PsAlN5ZRPHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777086172; c=relaxed/simple;
	bh=XEhzB8OFQ8HvEPEaxYKIMHqeRG/9JgUctUzr0MLYrwM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a/EcVfPm9R5z3e9XrDeVWV7WOw95hGPmwbyxvdAB/yUMA4GvSs4wI8QMHNewTQiSrlvE6of0c1gUXkyypY3PeD00JHqZt3H03FpYwVi6xo99br+JogL7hTU9uZryASce10srwsD9x6VyGIOgZbaBsx4k9U1k6BedFhZxe55tsKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3WHO8Y1s; arc=fail smtp.client-ip=40.107.201.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3WHO8Y1s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zLAeQRXqHKM1cIA9VoBN0FV2fUcWax6ZjInlsY/xBlcQVdsuMjHuz3ABlGCVnQmLrwmKo0qBIPqHyxFc8nR9zTGKaXt8ZHLhDZ8P/kZXgAAGSgbURe4NYeQwC+DVkzib/MfE4hXAxk892ySSdbphUa0SuvfCFg1ymK+HbveKuo6GkTrL8KLhgmpiNKXCGnZKBdpPx5QtmUigHDTHo/5Wyln+Pw6XKZDq39VwCIG3htpqjoBAWj81hSe5q721Gt6lg0jGJmnoV5mhCoF+7bEWAXYM2TmbsZ+vbGqxMIHNSyRNLzdxeDLsX5To5IO2usZCtGa6F6GoX0j9bARnnJxjAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gty8IDulhSv53SFT4gRqCY4X6zeXmq0u81489k7FZ/g=;
 b=Uj4eVIdoMqD02e7pbYOqxsgpjZhGXX3DMZxL1oINZ8Z0/NBB3FeCOfyLFtQioa+xwSbUFkqlA7RnW+qyQjHkeJoTUrmmq9QANEv8hABV6l14x4o0MF/lcX/KJeA/XcZNAelxmPSISkk6aN3ObMbqZdIY2ihXgWRWb6f1nuc+pxhdOmzOz6nrQJeKCyjzuulZ0Sykckf5LNNF8zEb4E/ODRFKBU5qUNS6sZYnmg4iKsikn0NbGmL02Ys18YGM8ym7NnHwn2yFuCFd8N44gNVAEygzzcOM6lfJejLR06O5lsm4Zaa3nVLNEu0abSGrvMje0sIaU8SjV1z0rqt93krruA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gty8IDulhSv53SFT4gRqCY4X6zeXmq0u81489k7FZ/g=;
 b=3WHO8Y1sMMsyDJO1j5MFwuOGnWlIRmQKj+emKpESmwapjLxrUXwbF6kdK4YLrHenSmjmk/HCm72YhFgFPi+NZXt0+QE9dXCSnloWx8qPmooGvJNSG3L8ulJGPLErhzVGEDFYxQWBv2UPJcuVtRHPDMr0FN0rt0be3DZ5sqNmc7Q=
Received: from CH2PR02CA0016.namprd02.prod.outlook.com (2603:10b6:610:4e::26)
 by IA1PR12MB6385.namprd12.prod.outlook.com (2603:10b6:208:38b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Sat, 25 Apr
 2026 03:02:45 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::67) by CH2PR02CA0016.outlook.office365.com
 (2603:10b6:610:4e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Sat,
 25 Apr 2026 03:02:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Sat, 25 Apr 2026 03:02:45 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 24 Apr
 2026 22:02:45 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 24 Apr 2026 22:02:45 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <michal.simek@amd.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH] remoteproc: xlnx: check remote node state
Date: Fri, 24 Apr 2026 20:02:31 -0700
Message-ID: <20260425030231.3145225-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|IA1PR12MB6385:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f6ddb6-6086-411d-3ff1-08dea2772029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DqlpM4skAACi42y2vRgx6EqbdWUdWMbKmidWVQWmWvmeSzquTFQ3tAbQuSm2VOUFBODvf9UCm97HMoO9LMqiQFSf5bk/j2nM0VsC8lV9y1XXCQH4bYcwYP6mYINuMHm1xRCzQPheIXWsJj7rrlayYE251Ja8vxhh+109tJsOkWFMZOysszs+K9dwjysR+emX/aACjjjzGIZddY6xw2QfLKuN4FR38uwtXvFuMYal3umBsLqJ2vQvl4Q/6oTvLIVjd73rRrY9wpi06lCdNFfnipJlrzb1O8d6N8XGtHR49Z88eylA/UGY7f425JRc7n+J3UNC+c2zu+b3K/9yrj7Oq1RdyXntl35ePh/eHDtL5bNqk/Iv+Gg5TctINzBv3h4rTDzKo9OqL8Dex4JaDszs++ZpQ36TWHorqsBRgq6WIpK+Aco3NAFSa5om/zgQ1y6WwPjhLrEaWzsyMuTWMNDsAtHvD/pbEq2Mv/76rqPyBXg38vjYMoGwzk9O0MAzKNfdEs1+A2RM4bcN1N5kdElKrtKsfLDbZbUMONRHoYRcSo8tV9WesSvy00may0P0jEGn12ZyM6Rk/sO0Uc6GcXQTZ5pI71Z4Yl5D7YM+AjRyC3jY2gmTPU+apXk4xJ1Q9GpYe/UqwkpDKn8P7M5peLFrECRKMHYFe8H7Aj8yz/hZ+RNcJudOZg+ymBuMYbAPYTjcmtassG5o27UU+DIR8z7H8/oT2Z4beac0LNcxqIVSmKagtore8msC9s5OD5u7ebUbt7JZcqs5O03MqRGI/VxV8A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GFcF/K9l6kc5lARLh6ctfYH/h8AkJNK8f37ifIigoULFg3ijESUfQkiGWIXVhyNDlW6aFcBGrq1BL/g8rO7tp+m1lVQKnfQhjMB03QTxN1JWwP2hpYT5qvLKg8dcHT7H3tYscFs17zvi1+sBhpex8G5nIPXI0pvfJz8DtfRJ95XLxcydcL1A8FIGhvjMrAFDpfyMrCOdOmmlFZuPbfdd/Pds/cpKg3ZJFEamFngSIBPvfCQWXwdlsH/ivdUedXMSEnId5rfLrICHjPy0Wztbj+jcjR5C5D/Z7OYe2cZYuQ50okx57U1m56pXRxGPxzivUhm063mLrZScOUK01oV5jtR9OJZ+SajxrtXKqWbOFPbd9LN+8CesIeZdbyPUnNb6OUxtnPqjtyAPIQKlNMAgLPiQU3w2/4zNwCXezaawlvwQj8jM+t2pMlWPIpEiyaDp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2026 03:02:45.7249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f6ddb6-6086-411d-3ff1-08dea2772029
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6385

The remote state is set to RPROC_DETACHED if the resource table is found
in the memory. However, this can be wrong if the remote is not started,
but firmware is still loaded in the memory. Use PM_GET_NODE_STATUS call
to the firmware to request the state of the RPU node. If the RPU is
actually out of reset and running, only then move the remote state to
RPROC_DETACHED, otherwise keep the remote state to RPROC_OFFLINE.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c        | 28 +++++++++++++++++++
 drivers/remoteproc/xlnx_r5_remoteproc.c | 37 ++++++++++++++++++-------
 include/linux/firmware/xlnx-zynqmp.h    | 21 ++++++++++++++
 3 files changed, 76 insertions(+), 10 deletions(-)

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
index 50a9974f3202..e2f25d94177d 100644
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
@@ -1255,6 +1246,32 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
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

base-commit: 6f860d238b44da8ac57be25289b9f4410691c4e2
-- 
2.34.1

