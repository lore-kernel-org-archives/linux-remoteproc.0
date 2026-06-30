Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011052.outbound.protection.outlook.com [52.101.52.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C05520C029;
	Tue, 30 Jun 2026 00:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782780520; cv=fail; b=ZH1oQ9mSydw7fR4YowqKbYwW7Cm2dailQX0kgbYUCT0L04uUhVNazH0fuux3TuZprBgDNP7LD3oKF7wVQ2da34LTPduePdC/yo21th8BMIu15yzNEuFUmRMoZUZ5k3HOQbYipgOt2qAPEmXZkOJJqWC60424PErBtVzv45225fs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782780520; c=relaxed/simple;
	bh=ok/HinOKMBEQBBTF11egt00iXwMc6hSZfBpUDnBQXeU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rj0MsDz4dX/V9w13mHJTN9NKIS8LZee4M7mvJ53oFScxDYcKUPJZbHMsEcJkSYgF3YTNpVHwzHnVVvk4hIu7Q0A9zCZdQTOYFR9Z/t58tqEhUUuQqV9HfyL9ohtTp54wvskIFv+3aRXZcb3WgfWRgrs6aMuXWkswFbUzszPQwys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MvYNWa9N; arc=fail smtp.client-ip=52.101.52.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MvYNWa9N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AOjf4vsYfp2SG2DUtbwB0p7Xg5jYXn2xI4Tg15DRUOarS1yTMZI1exHOUX5tAHKNpe1WvRJjJ2tZNAwaMDLyeDG+H9bd2tqZ+xPkpt6AJHwyF3iU+WPDVUnofWo9zZk1NOj5/PULj6O1VRb+LByzcFkTgAMf0fPKj4bWTToP0+NFvTWYuRs0UJND3iCUekC6UPVi9ptep//nrFlvMRd8E0Z2WuaRhorw0W600VNzJQaVHmtAwxpjGHCP11QG8nnnflPWO+TN2Dp16ctXrXKgRhtetmjsbup55JECwVrhyxU/AJCwEXx1vtQENG48ht7MW+esBF6mCQ+bU8Vl+oa9kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTgCdSaXegdpDN3Kglu4JYvCPurqWh9S+HQnBOvq9G8=;
 b=K/uftjPX7bo9IvBEXiaSHr15ITao1yWMrb2J2GwY/pDCBm+X3h94dIc0wm9DWgInnhzv7EafquteZCSp6SotaTMHKsp8eoYV+BNATWc8kxI52Tx/2oc0MJsJMtiK8G+LdbLvlLKLwl6K+AdjVQXC9s/olThlX9EjvJUcoah7BNH2ckhSVjCDYI8fUEBq9zrqclx3rW6OJ3A3JAms9cuFm+WbnsIxzCPi9ktWWBW0uv4w+zp7MG7x9cSgeZc8zE126lnLtOzho04Ch4xNJDBbcZfUt+1YIw/iBclIcdCz0mOC6Yrqi1UoAQSQmlz3IjGhsoBcu0Hnt01vVi9l0a0Ktg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTgCdSaXegdpDN3Kglu4JYvCPurqWh9S+HQnBOvq9G8=;
 b=MvYNWa9N1Q0Fc3Pec07NZaARJqnbgcTlZY+Bj9/fg961X6bpqDmZ7BFtQXRzxps87pxNbgOLFK22vuRoxNCVra2ZydvWUnEzUeUuV8Beos5C0f3fMq10islqyShoNQWGoluyATlDiY3E51hCXnMCGo0zhGvo9ZEpCfRNfLpbEsI=
Received: from DS7PR05CA0094.namprd05.prod.outlook.com (2603:10b6:8:56::11) by
 DS7PR12MB9041.namprd12.prod.outlook.com (2603:10b6:8:ea::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.19; Tue, 30 Jun 2026 00:48:34 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:8:56:cafe::16) by DS7PR05CA0094.outlook.office365.com
 (2603:10b6:8:56::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 00:48:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 00:48:34 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 19:48:32 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 17:48:31 -0700
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 29 Jun 2026 19:48:31 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v6 2/2] remoteproc: xlnx: add crash detection mechanism
Date: Mon, 29 Jun 2026 17:48:06 -0700
Message-ID: <20260630004806.3835488-3-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|DS7PR12MB9041:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ddf8f30-179b-4a76-536b-08ded641505b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|56012099006|22082099003|11063799006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	EIkm27DOCfxNrWoIE2vnJcgychH162Q1ZAJut1ErRamW4f2SJpk83R9YqsRxtQ9eoTcR8oynFe9XN8KvVBSCdv2QQbJQ9ESBgYj5REDasvOPz/pKAOh7VK1nnlD8XFpSLYjfsKbt18HmRButlXDB//WVxVXSenp+frE9wIZbT4XBlqgIZXPL1fVihgQOWkusD1PojZFiqngHGXovSLP+sUOgqk3tKpHacpT0TraZBRzP9OMLk1Yvc9EyqfvG55a1ZVDxH2aS1tNDpph/AYP4f5EriH7WxxIqdxVK6fvreJyfKWQGt1g5N0E5+WStGN74EHcrNYD1V3KoGE1TVHlqULYgh23j4NDxF/asKW5QHA6p+p9/+zjC+NNFjRvRuEkZAew0b0PFwDfVTrACgEeePuhmxEaat43P9M7dWWj8WmGD4KmnM5YiGZwk1UDxT3QYY9hju74qvRiHVh6+u/G4dDnmnZMZ3nJ5taK87CObAoJ5a3AGOC6IPUFUMHWLcjggeC1MRwoMMV7vUC69MFtocKpjiQw7gl1RQE9nxn/Gcou5ZjI88dqih0mOKSYlfQPLFdUtJJfg/sTMf/+HBov7cP5hU8aKjUb4tSOukfkzCKU73Bh1faG3azUtzUgdRrm6JHrE4l5aaDq5wWxF3TzzdkK8XlUphJL9aSWDC8e1KFzf6iKuBbZzNGhPMHv82OOUEW5EGwl1Lq3qSL2+U7bypg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(56012099006)(22082099003)(11063799006)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gZbYaIYUccuG1Ocxk2jfsyoPia1vuBBx1G5mYensoSl/qcBx1fQYjch84PcCsqEUZAkTzcL501EPOJMq9R8Nczy1iw+MVl/JgxYU0OGoVVMEGZUBMBIQh3Kqi0M01owOw9YJV1KAQMPl+ZNrCMdoEfN1zLSgYr737BnZZacjbpT9fBIZ8EEyex64btKWhEFlJ3wTiHy0gdXgzfC8/FHh725lYCOXrH9sbh3jXBw/wzYSv52QIczn59q2qn9KDlwkGszYw0N65ONe2eHC8Zjpj9gcHhR75Bbeqg/vMdSR36WuYZF/BrijQ88R6ANd0tEuoggGS7NHSxri3hHz/yfnOUREeKykN9N6aNMeSnerl85aHaPm4PeO8aGnrHo2VPGakcRBhbTTauGMj0MYGvgEXzhXRhWTqHHBJ8Y5vOj4xUZ5Z+qIKvvDCAG8kEI7iN43
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 00:48:34.1704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ddf8f30-179b-4a76-536b-08ded641505b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9041

Remote processor will report the crash reason via the resource table
and notify the host via mailbox notification. The host checks this
crash reason on every mailbox notification from the remote and report
to the rproc core framework. Then the rproc core framework will start
the recovery process.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 70 ++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 7014d48c1228..c685bb5fa62c 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -112,6 +112,10 @@ struct rsc_tbl_data {
 	const uintptr_t rsc_tbl;
 } __packed;
 
+enum xlnx_rproc_fw_rsc {
+	XLNX_RPROC_FW_CRASH_REPORT = RSC_VENDOR_START,
+};
+
 /*
  * Hardcoded TCM bank values. This will stay in driver to maintain backward
  * compatibility with device-tree that does not have TCM information.
@@ -131,9 +135,27 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
 	{0xffe30000UL, 0x30000, 0x10000UL, PD_R5_1_BTCM, "btcm1"},
 };
 
+#define CRASH_REASON_STR_LEN 16
+
+/**
+ * struct xlnx_rproc_crash_report - resource to know crash status and reason
+ *
+ * @version: version of this resource
+ * @crashed: if true, the rproc is notifying crash, time to recover
+ * @crash_reason: number to describe reason of crash
+ * @crash_reason_str: short string description of crash reason
+ */
+struct xlnx_rproc_crash_report {
+	u8 version;
+	u8 crashed;
+	u8 crash_reason;
+	char crash_reason_str[CRASH_REASON_STR_LEN];
+} __packed;
+
 /**
  * struct zynqmp_r5_core - remoteproc core's internal data
  *
+ * @crash_report: rproc crash state and reason
  * @rsc_tbl_va: resource table virtual address
  * @sram: Array of sram memories assigned to this core
  * @num_sram: number of sram for this core
@@ -147,6 +169,7 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
  * @ipi: pointer to mailbox information
  */
 struct zynqmp_r5_core {
+	struct xlnx_rproc_crash_report *crash_report;
 	void __iomem *rsc_tbl_va;
 	struct zynqmp_sram_bank *sram;
 	int num_sram;
@@ -204,11 +227,27 @@ static int event_notified_idr_cb(int id, void *ptr, void *data)
  */
 static void handle_event_notified(struct work_struct *work)
 {
+	struct xlnx_rproc_crash_report *report;
+	struct zynqmp_r5_core *r5_core;
 	struct mbox_info *ipi;
 	struct rproc *rproc;
 
 	ipi = container_of(work, struct mbox_info, mbox_work);
 	rproc = ipi->r5_core->rproc;
+	r5_core = ipi->r5_core;
+	report = r5_core->crash_report;
+
+	/* report crash only if expected */
+	if (report && report->crashed) {
+		if (rproc->state == RPROC_ATTACHED || rproc->state == RPROC_RUNNING) {
+			report->crash_reason_str[CRASH_REASON_STR_LEN - 1] = '\0';
+			dev_warn(&rproc->dev, "crash reason id: %d %s\n",
+				 report->crash_reason, report->crash_reason_str);
+			rproc_report_crash(rproc, RPROC_FATAL_ERROR);
+			report->crashed = false;
+			return;
+		}
+	}
 
 	/*
 	 * We only use IPI for interrupt. The RPU firmware side may or may
@@ -390,6 +429,13 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
 	if (ret)
 		dev_err(&rproc->dev, "failed to stop RPU\n");
 
+	/*
+	 * Clear attach on recovery flag during stop operation. The next state
+	 * of the remote processor is expected to be in "Running" state. In this
+	 * state, boot recovery method must take place over attach on recovery.
+	 */
+	test_and_clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
+
 	return ret;
 }
 
@@ -784,6 +830,24 @@ static int zynqmp_r5_detach(struct rproc *rproc)
 	return 0;
 }
 
+static int zynqmp_r5_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc,
+				int offset, int avail)
+{
+	struct zynqmp_r5_core *r5_core = rproc->priv;
+	void *rsc_offset = (r5_core->rsc_tbl_va + offset);
+
+	if (rsc_type != XLNX_RPROC_FW_CRASH_REPORT)
+		return RSC_IGNORED;
+
+	r5_core->crash_report = rsc_offset;
+	/* reset all values */
+	r5_core->crash_report->crashed = false;
+	r5_core->crash_report->crash_reason = 0;
+	r5_core->crash_report->crash_reason_str[0] = '\0';
+
+	return RSC_HANDLED;
+}
+
 static const struct rproc_ops zynqmp_r5_rproc_ops = {
 	.prepare	= zynqmp_r5_rproc_prepare,
 	.unprepare	= zynqmp_r5_rproc_unprepare,
@@ -798,6 +862,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
 	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
 	.attach		= zynqmp_r5_attach,
 	.detach		= zynqmp_r5_detach,
+	.handle_rsc	= zynqmp_r5_handle_rsc,
 };
 
 /**
@@ -837,7 +902,7 @@ static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)
 
 	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
 
-	r5_rproc->recovery_disabled = true;
+	r5_rproc->recovery_disabled = false;
 	r5_rproc->has_iommu = false;
 	r5_rproc->auto_boot = false;
 
@@ -1186,6 +1251,9 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
 			if (zynqmp_r5_get_rsc_table_va(r5_core))
 				dev_dbg(r5_core->dev, "rsc tbl not found\n");
 			r5_core->rproc->state = RPROC_DETACHED;
+			/* Enable attach on recovery method. Clear it during rproc stop. */
+			rproc_set_feature(r5_core->rproc,
+					  RPROC_FEAT_ATTACH_ON_RECOVERY);
 			r5_core->rproc->auto_boot = true;
 		}
 	}
-- 
2.34.1

