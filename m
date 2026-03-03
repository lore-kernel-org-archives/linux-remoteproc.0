Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010065.outbound.protection.outlook.com [52.101.193.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B125369206;
	Tue,  3 Mar 2026 23:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772580998; cv=fail; b=kdgtZPNcQ3Eg35DvQEreFWp3ErfybsMszSxUqCgs1k2UgfztEz2yhyrZLUoMgmHdQPrCpRUaf5NqcY2GkCvWXINyKrgbLlowBWOKr4DUaiIQJDmzvLu9Ar72j9wbCP2z3HtwXbtGq1Y2ypSXw4Ah4pQi7lllgivqZ41+HzcEje8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772580998; c=relaxed/simple;
	bh=r5T9TrgK0GmiiFUtG6Gvm8Fwgav9+bFCxxE6sJTPPgs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RQ+FJfN3UgvtG10CgVMsQICfYZApEBLP6L6FgoGmNKR4QCAGTTBdHUbpSqnP2r4TSQyvW+xtfVqvmn9Ai0V0D3Cs6LMx2sgl+jIC42fILVOtHMSZSQaRAU0OHhpzA43X7n6pMqbQK1DAKciL0sRYC5pNSwT1fTX5sNFI5QJ8Q8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=S2HevIHc; arc=fail smtp.client-ip=52.101.193.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="S2HevIHc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SiDt59IjKV/eTLcCssz9rn29Brez/nD3qLGHlMdTJJBziIN7T31XLp03/SZdEe9CGbrARSKgwe7C1klap2q0WlKL/P6Z5fok08rscej648N3t1iT4zY/o7AEAQAIuVQFLFbnx29U4B7SrWvonpRCunTyrnh57I4K+97U9Maug0rQ/qVWc5lLEga1Oo5M20zyaz81x8ikJ3rf/ByIeHyNf0FgADDn1cDGzU0WIbYdT10CZgVtF8oUnv+MdXPSdUIAJuAbjilnoV9/gqFsXoVSJo0lLjDXF8XKwrU9aRkrp3RTqX+fd0E8xCMggOhn8QewLi2J5Ey894YnOEnLixjTUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XwTglUnzXGaIwAjhJokeCtJgFsiOi+eJJ1sUFWJD4Vw=;
 b=ZsgJwT4vGFQlM8TR6cFprYaRqFWcdbl1Hz2LyA2mUH5vFAxlMjM99GyKNWvWho2GGW19352Vy1wfOZlM6hQ6t1Q1SRfHiovTbwGKSXiUSa64yH7w8Ftl415sKlOXMa9A8asnjJh7IH5Ioi8Jpr6GlOlQEu7oh3NHBIyKN2r3p1DDV5Rs9xKPlvHQORXcegDWR5GeXTK+rD1Gfy+OMmj1+T1W/F5iK/twlxZjtscWY93OWzOIRCkvW2862dFnS+5FCYrgFAxr1+OBQ+Uc7vC51ks7djR6P3l39cOrIM3BwEXsY9elzSUi5Eiekgb2DC4wG0OC7zbNJiAcqznDEPvFOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwTglUnzXGaIwAjhJokeCtJgFsiOi+eJJ1sUFWJD4Vw=;
 b=S2HevIHc++1jZ0jSbMNZinwEK5JgWebPPkAFADowQxmYnGCl5RX1DA7oX2diZMPM0KdSbGkmpCbEY3vyMXaZuz8ypR9f3rqg2Qh19uVx85qsgioibfYkn5dO2kk0aMTrRA1NYifLRn8hp/Pys+qKwuuMxkmu8lqVRqlHEUbksgo=
Received: from PH8PR22CA0001.namprd22.prod.outlook.com (2603:10b6:510:2d1::16)
 by DS0PR12MB6630.namprd12.prod.outlook.com (2603:10b6:8:d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 23:36:32 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:510:2d1:cafe::40) by PH8PR22CA0001.outlook.office365.com
 (2603:10b6:510:2d1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 23:36:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 23:36:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 3 Mar
 2026 17:36:30 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Mar
 2026 17:36:30 -0600
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 3 Mar 2026 17:36:30 -0600
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v4 2/2] remoteproc: xlnx: add crash detection mechanism
Date: Tue, 3 Mar 2026 15:35:33 -0800
Message-ID: <20260303233533.2310513-3-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|DS0PR12MB6630:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c9e6ef4-5707-4a70-e69a-08de797db35b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700015|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	PCknLqeSaRlmY3M+Jp2CxNsR8o4TWaVBqfy6tMxOZ3jp4d5DCCsJy1Gp/5qwLcoisfPal35NMV+nCnfvkFAH1OxomCxV2g4peC3ZHoWu2e0vfcw3XD/8WwmC1Vq709uOOzC2d/gxbMp23ajknSKpffCtz2qX+X789+tVKqgxNUz5R+hTQ+rkVG8BMZM4N9bHa4TPweGgm3kjcYxyx5uCb42B5+wNf7Bx4dUvWwjCvSHKruqKMljjpx3gwzBB7Eo/3MmhMOu1AFBOSFv7J99BtdotCIQtbZ/+KYssl0+nBiTAcs19T0Sv1mdXthM8nt64XUFSl/n4VkjIFjx7q9xmM4HZb6LfX6BF46re5yvOFg4DFqlduuQ1MzDqBh5fplB0+adXQKF+8voORJJSP1zhUg/oFyLe/E0kut5hX2H/wtc3EQ2aFiGAVU+mVqu7mBy5T78flFQK9q51fHnOFWW80VvW7jNdAFTjclJBLvswoT6mTOF8SXCKdRVDkKHL80TAPTmiLysit+H+ZWVstZewI1+JObhQFF7paSY4gjwkiQNZXAwZgpH144axxcaXi/ft+uCkTluaeCM5OlBdZGb6OVvg5AbWG79QuOvZhsdqNoG7ghB2WEfLqilNFvRPTebGMyBLhofBH2ZkZL/YyuAYtkPBcF279at6s+H1W0QnDNRbeR92Z1ljc8jcJslhUs5+rframzT9xIQo+UU0lC7bpWV5rYB1p6GDVz1v8jThv+OhydhB4LCvWneIXPXDolwuLSKbbfUoR9KYwOGnUN3jsw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700015)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LxXDe8dspXKYtrbMngc/d63a3tnnXAMFALTt0GlS/t6HK4DUgxSZh1ARHmrxx/Kop4xXsz8sDd46x3HyAigKUB/utSbZ7n+vxlACll+wWvHxpm6ypplt+nWzTV+ZRuAl1c+fYLapsYpEs1ntHgwcUoiFBzFwruePG41Up2iuLWCG5lr3fMpu9xCqe/ClcAAULqkANaTDVxd8+/Ss4Z+j7QBRAVMj64n7k+ILv3CvbecXhhR/xaNoQHZtEpCRh1HedDA2vCjGETvWL3Q5cbXsMLWeLsQRpVXnDkVCvypIx+cZ15gNEoiN4WKY1jOHlEw00+lVXB3hW9m4KmP/C09D8dhVyRzeKc1HCXzo1uafFuamoF11OuyxNY0i4ixs0i97zg0jOTLd4cPRGRCNm5K/3LzGAeqG6PMjG7+ZS7H3rM9rYid2vAVbSwRPOH1Ku7Ee
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 23:36:31.9550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9e6ef4-5707-4a70-e69a-08de797db35b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6630

Remote processor will report the crash reason via the resource table
and notify the host via mailbox notification. The host checks this
crash reason on every mailbox notification from the remote and report
to the rproc core framework. Then the rproc core framework will start
the recovery process.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v4:
  - Optimize crash resource memory by changing type to u32 to u8
  - Introduce version field in the crash resource
  - Check crash related condition before rproc state related condition
  - Move crash reporting to the bottom half of the isr instead of
    actual irq handler
  - Introduce 16 bytes array in the crash report to store crash reason
    in the string format
  - Remove redundant type cast

Changes in v3:
  - %s/kick/mailbox notification/
  - %s/core framework/rproc core framework/
  - fold simple function within zynqmp_r5_handle_rsc().
  - remove spurious change
  - reset crash state after reporting the crash
  - document set and reset of ATTACH_ON_RECOVERY flag
  - set recovery_disabled flag to false
  - check condition rproc->crash_reason != NULL

Changes in v2:
  - clear attach recovery boot flag during detach and stop ops

 drivers/remoteproc/xlnx_r5_remoteproc.c | 71 ++++++++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 5a468d959f1e..9c7cf9f37294 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -108,6 +108,10 @@ struct rsc_tbl_data {
 	const uintptr_t rsc_tbl;
 } __packed;
 
+enum xlnx_rproc_fw_rsc {
+	XLNX_RPROC_FW_CRASH_REASON = RSC_VENDOR_START,
+};
+
 /*
  * Hardcoded TCM bank values. This will stay in driver to maintain backward
  * compatibility with device-tree that does not have TCM information.
@@ -127,9 +131,25 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
 	{0xffe30000UL, 0x30000, 0x10000UL, PD_R5_1_BTCM, "btcm1"},
 };
 
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
+	char crash_reason_str[16];
+} __packed;
+
 /**
  * struct zynqmp_r5_core - remoteproc core's internal data
  *
+ * @crash_report: rproc crash state and reason
  * @rsc_tbl_va: resource table virtual address
  * @sram: Array of sram memories assigned to this core
  * @num_sram: number of sram for this core
@@ -143,6 +163,7 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
  * @ipi: pointer to mailbox information
  */
 struct zynqmp_r5_core {
+	struct xlnx_rproc_crash_report *crash_report;
 	void __iomem *rsc_tbl_va;
 	struct zynqmp_sram_bank *sram;
 	int num_sram;
@@ -200,11 +221,27 @@ static int event_notified_idr_cb(int id, void *ptr, void *data)
  */
 static void handle_event_notified(struct work_struct *work)
 {
+	struct zynqmp_r5_core *r5_core;
 	struct mbox_info *ipi;
 	struct rproc *rproc;
 
 	ipi = container_of(work, struct mbox_info, mbox_work);
 	rproc = ipi->r5_core->rproc;
+	r5_core = ipi->r5_core;
+
+	/* report crash only if expected */
+	if (r5_core->crash_report && r5_core->crash_report->crash_state) {
+		if (rproc->state == RPROC_ATTACHED || rproc->state == RPROC_RUNNING) {
+			dev_warn(&rproc->dev, "crash reason id: %d %.15s\n",
+				 r5_core->crash_report->crash_reason,
+				 r5_core->crash_report->crash_reason_str);
+			rproc_report_crash(rproc, RPROC_FATAL_ERROR);
+			r5_core->crash_report->crash_state = false;
+			r5_core->crash_report->crash_reason = 0;
+			r5_core->crash_report->crash_reason_str[0] = '\0';
+			return;
+		}
+	}
 
 	/*
 	 * We only use IPI for interrupt. The RPU firmware side may or may
@@ -438,6 +475,13 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
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
 
@@ -859,6 +903,9 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
 
 static int zynqmp_r5_attach(struct rproc *rproc)
 {
+	/* Enable attach on recovery method. Clear it during rproc stop. */
+	rproc_set_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
+
 	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
 
 	return 0;
@@ -873,9 +920,30 @@ static int zynqmp_r5_detach(struct rproc *rproc)
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
@@ -890,6 +958,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
 	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
 	.attach		= zynqmp_r5_attach,
 	.detach		= zynqmp_r5_detach,
+	.handle_rsc	= zynqmp_r5_handle_rsc,
 };
 
 /**
@@ -923,7 +992,7 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 
 	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
 
-	r5_rproc->recovery_disabled = true;
+	r5_rproc->recovery_disabled = false;
 	r5_rproc->has_iommu = false;
 	r5_rproc->auto_boot = false;
 	r5_core = r5_rproc->priv;
-- 
2.34.1

