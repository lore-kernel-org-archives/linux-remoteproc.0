Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010040.outbound.protection.outlook.com [52.101.201.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B856349AEA;
	Wed, 10 Jun 2026 18:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781116095; cv=fail; b=s6r1yXufORIQ3GGKY8B5OhBCQYdUlJ89Iwon3MEDDK3NqyXzy6LIlGddo5+2pXX6w/OzVdyL3/MOPumEpPRBdOx3xCqgk33tsHYwyW4XuAQ3X9QU6HjvrXLuRDj5UgZpJEhzQSHmVyj4P3LVSsa1Gsp5SChNkffKKr4CEBRsnqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781116095; c=relaxed/simple;
	bh=4glupw8Cx+ntVYBtTUo3AMogQ5ItHp95+PrkYeeTnXc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LMkg5xjPku9wYMXM3unvwP1M5FTZWM931ad9/ophlTAkSeLohoBZZ23rru/TG4ctKwJwX17N9pN/pkapVcGaXhyddyGag1cdCIgq45saE5vamxVWfU8+mBDrS0WyBfADjtfggDQ2kGrWJeJRSpnOWt9tfqBC1FBroIMPp0D3fmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Y91AhScR; arc=fail smtp.client-ip=52.101.201.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Y91AhScR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7JsJaFeh9HieRF1GTX1XC1LDvjabUnGS4OOt+BFLlHzdH2MynkpD1Rl7Li3fnypaJQaHoGXfO+GTpfnyXDcO7JAkdCSk/DofiND88zts2AhEOQN2aF0yKKTAZ+eRfX6FjC2m+Thd+eI7ESatxo9smzuE9BnbwbQTNTA0IFE9t9hbInl8GuqdShBzMd9jOpbrKLSfJC0luyJZ9G+bzu2jTIZk52PmT/AZO4aHwbEAKwcat2kQ40/5SlT4eNKaUASnn8xqVl7wY1xQSyRBjIeMB60Gh48IeA5eG89QCd+CfAqEC4ASYHt/Dcyvh+PkS/rtkafifm0a3cRQS5YHIRm3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKYL7IM7TJKPNyIW7xLZfsKzEdK8Q0lZJCiBFT+tn1g=;
 b=eZ2sVYr7JvbHVoj5eusPaLx8r9tm85ImYheeymKXjNlvLbyJXspHgEnLqj2BpZmfhSIx1y4tHwanvWoJ5XxYf31VHH5W7dgg//rDegvrXr18D9yb0VtGW8TjZvh2v0e3xMsxtZ27F2H8XIUXc56HNkngNftE52v7MHeEIgTpQpEdr9fyUWbn9tzXm6f8FspbfO0m5X7Zo8VKWR7B8wvlzVgU4YjJgAgPuc5sWcdOfx0ODRRNKzGTF+kIpbgiZxDgaPOOGFsjp78a8EnHfchu2OamoWHyRf0O+OhwRJgF1vRL/ZnklC+NSVHas+HUDadiQzWztzkGhrZ76TIHZHs+4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKYL7IM7TJKPNyIW7xLZfsKzEdK8Q0lZJCiBFT+tn1g=;
 b=Y91AhScR4TVyaa2YsPi95kPy0hmIxvBjRX2TbL3gqkW3pZcpZBfQx4ZLlQ0atuDyLZrC5mSncHtX6Cd6s15j3ApCS9LqAAkpl7tpYt2Hw1Jec+y3cjp/FVIyfYWSAkwMeZK8JTBQvTIljWS2AJp8JmMTYB5mlZF9AvCiO5IMfug=
Received: from SJ0PR13CA0114.namprd13.prod.outlook.com (2603:10b6:a03:2c5::29)
 by EAYPR12MB999181.namprd12.prod.outlook.com (2603:10b6:303:2be::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 10 Jun
 2026 18:28:07 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5::4) by SJ0PR13CA0114.outlook.office365.com
 (2603:10b6:a03:2c5::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Wed,
 10 Jun 2026 18:28:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 18:28:06 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 10 Jun
 2026 13:28:02 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 10 Jun
 2026 13:28:01 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 10 Jun 2026 13:28:01 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v5 2/2] remoteproc: xlnx: add crash detection mechanism
Date: Wed, 10 Jun 2026 11:27:11 -0700
Message-ID: <20260610182711.1758544-3-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610182711.1758544-1-tanmay.shah@amd.com>
References: <20260610182711.1758544-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|EAYPR12MB999181:EE_
X-MS-Office365-Filtering-Correlation-Id: b9332d8c-f596-4168-1db3-08dec71e045e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|22082099003|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	HPOGKZ2u6LI0Wz7aofUellFtjONtdhAm7eB3FOQSHFVGbSjoEw7UwdMr8iSponaLMq5R2h12nkpc3E2LAU38fqFGPOBNfwwPyJyaPr8Zc/GX0EG78HTCkOxho9YuPHD0mDnANjC/RV+dIzk9J78QFe4hxSVsXGxnrr3LUI/uRW06eTBCRcFIWzMVJe/iV2AtoR4Xk4UO508MRmwPLg1mu2CzY394PvnVCt/hWEJA9+4yFQgZDgM/Sp5sicpov61snqTuhme0LUCdUpJtbHWalkLXsUjXBUvbmBnUcP8klwSwXrsRpQNjOn/n6t2RwLlyTIhjta3VYdM1ruYRfISEu+xACiy11EkO7yIEP37xN+pRWNgW/Bafz8RcXBS6m5SQxI8hMMuWjnDQHGOiXgCKbj/MeMKVXV0+Feq+3YhAhYv853G2ZySBiwdjLdM6Zp3Rcnr92IqNm2yhvU8YNrHo1Ac4ESZFjEnu6a9wu4fUy2X30me1zzbY+Cy63YK9jhTypAHud2Kdq9wiHEShNWtSMV0tTvq3w2mRFgrf5zKEXKAIEYIUt8JiYCjp7mTY5FiN0v7DU6SOSRnR5nhCwsY+YsrPsw605INxblh7XTxt+PhR/Uc+JhKAzDy1/Rp5uikbuaHDNbi3aV0kJXTcetqpvAjUBFF0avr8qFfyOSKEfPxWc5lRhqhxJxRUYkTA0O4obzEzLmLuI5rfb2j+Z/rMA4t3fFkyWUn+Ia8eeoXKVrY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+nmOyi3YRkcYMMZc1D+debu9zM0htp9CtBL8p5aYhjIbpRGHuPOjTEtan0PfLjqO1INLLeybfo/WJcaiV9cadoFHrDzdG4PU7cGsMYwWqxG44Je0cePDHsPyVStDLfHQ7TYQAvzOi0w6tIRFhtLGEFXYKTj34wB1GCEpH8bmESgB7Qpr4zLHVgCydaG5kBnN+FuKVIUw0TlqwCaPZ10KU3UNdIC7Xd2Q2n1bhrTMOopqmtVQIi4RiTlLZQtqAO59gEzGaJ7Br64xr3ZI+68lQQweFQ+Kr7DPbM/NqRxH9KuWC3KKnvjzOm1QZPcdneuDYvbTmFyJGF2d913m5yfHZbCsWTwb5x81qjxl/SECSdlvX2/88AOdyCF3Mtd4zFYUK8WDKIm6oH6DKUXFumPLo41egs4ktYPpvPGkK6ltpDANF3lDga7RTs+eyOtoDCQD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 18:28:06.8606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9332d8c-f596-4168-1db3-08dec71e045e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR12MB999181

Remote processor will report the crash reason via the resource table
and notify the host via mailbox notification. The host checks this
crash reason on every mailbox notification from the remote and report
to the rproc core framework. Then the rproc core framework will start
the recovery process.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

changes in v5
  - use local variable to access crash report pointer
  - End crash report string with '\0' without relying on fw

 drivers/remoteproc/xlnx_r5_remoteproc.c | 73 ++++++++++++++++++++++++-
 1 file changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 3349d1877751..86afff9f3b40 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -112,6 +112,10 @@ struct rsc_tbl_data {
 	const uintptr_t rsc_tbl;
 } __packed;
 
+enum xlnx_rproc_fw_rsc {
+	XLNX_RPROC_FW_CRASH_REASON = RSC_VENDOR_START,
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
+ * @crash_state: if true, the rproc is notifying crash, time to recover
+ * @crash_reason: number to describe reason of crash
+ * @crash_reason_str: short string description of crash reason
+ */
+struct xlnx_rproc_crash_report {
+	u8 version;
+	u8 crash_state;
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
+	if (report && report->crash_state) {
+		if (rproc->state == RPROC_ATTACHED || rproc->state == RPROC_RUNNING) {
+			report->crash_reason_str[CRASH_REASON_STR_LEN - 1] = '\0';
+			dev_warn(&rproc->dev, "crash reason id: %d %s\n",
+				 report->crash_reason, report->crash_reason_str);
+			rproc_report_crash(rproc, RPROC_FATAL_ERROR);
+			report->crash_state = false;
+			return;
+		}
+	}
 
 	/*
 	 * We only use IPI for interrupt. The RPU firmware side may or may
@@ -448,6 +487,13 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
 	if (ret)
 		dev_err(r5_core->dev, "core force power down failed\n");
 
+	/*
+	 * Clear attach on recovery flag during stop operation. The next state
+	 * of the remote processor is expected to be "Running" state. In this
+	 * state boot recovery method must take place over attach on recovery.
+	 */
+	test_and_clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
+
 	return ret;
 }
 
@@ -869,6 +915,9 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
 
 static int zynqmp_r5_attach(struct rproc *rproc)
 {
+	/* Enable attach on recovery method. Clear it during rproc stop. */
+	rproc_set_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
+
 	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
 
 	return 0;
@@ -883,9 +932,30 @@ static int zynqmp_r5_detach(struct rproc *rproc)
 	 */
 	zynqmp_r5_rproc_kick(rproc, 0);
 
+	clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
+
 	return 0;
 }
 
+static int zynqmp_r5_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc,
+				int offset, int avail)
+{
+	struct zynqmp_r5_core *r5_core = rproc->priv;
+	void *rsc_offset = (r5_core->rsc_tbl_va + offset);
+
+	if (rsc_type == XLNX_RPROC_FW_CRASH_REASON) {
+		r5_core->crash_report = rsc_offset;
+		/* reset all values */
+		r5_core->crash_report->crash_state = false;
+		r5_core->crash_report->crash_reason = 0;
+		r5_core->crash_report->crash_reason_str[0] = '\0';
+	} else {
+		return RSC_IGNORED;
+	}
+
+	return RSC_HANDLED;
+}
+
 static const struct rproc_ops zynqmp_r5_rproc_ops = {
 	.prepare	= zynqmp_r5_rproc_prepare,
 	.unprepare	= zynqmp_r5_rproc_unprepare,
@@ -900,6 +970,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
 	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
 	.attach		= zynqmp_r5_attach,
 	.detach		= zynqmp_r5_detach,
+	.handle_rsc	= zynqmp_r5_handle_rsc,
 };
 
 /**
@@ -939,7 +1010,7 @@ static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)
 
 	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
 
-	r5_rproc->recovery_disabled = true;
+	r5_rproc->recovery_disabled = false;
 	r5_rproc->has_iommu = false;
 	r5_rproc->auto_boot = false;
 
-- 
2.34.1

