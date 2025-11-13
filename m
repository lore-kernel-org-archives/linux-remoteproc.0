Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012047.outbound.protection.outlook.com [52.101.48.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5CD2FC896;
	Thu, 13 Nov 2025 15:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763048703; cv=fail; b=LdHOCOm0KO1VMFiV8BH0EJxZuuFgWgqJ6Vym6uArq33dnPu2pixG31UoVumwEubBwklcYJb+jkoCldiDr5kWyOeofr7bI7qj9qBmSELeRXWKSNjiMHh19Twn8DSa6KJdMsFhSjhJP/CRnVIBw3HXnFvmLSso14An9mqvC7uVuUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763048703; c=relaxed/simple;
	bh=JdobXBDvp+OWp9j76u8MhCvgaOh/jEcj8zizbDUMpKM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=shgvABFfzK6urv4ZshiwLon2R7jMbYZgoRjWGSy3BP7H49trXgm85YeD/wtWtmTcP+gFzVdxQYhCMvu8Gx7rd7wHL7onoRm7DmM/z/HP++6rYPpbVbLspDCVPpeLgeUC/6bRVtljJtsdhscfoxPSxx2UuqGqIpqB84gKYY7+3hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KOsxIVru; arc=fail smtp.client-ip=52.101.48.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KOsxIVru"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVBWwlU+n+uhykUY082AsRgubehua0c1eumJoD0EdHlTAOGm5/MZjw4z97RxsYqtXNdOM2kUbM+8Ao2+J7K0u8D3njZNVa52X8yQifvNKt9sGs4AUSEs5ckACPP96b6r18obAcqWqfW9TvquNEQ7gjElpymlZF4t+rwRLaEnd9gfvjVV4DKWhsgRxIL/r7HYvbekZwGxpSXEspCCRaYCkKRE3/6s+dertglMglU9KXPrXPTgoxO1pV4MpBIyZ5KKtnacRb+VoZMhsOff0p7cRpc+pKU4v3/0PEmazITpvRkudNzeaLzw/DzM9Ay85naFVt2OtFawdqVeEEaLI0FxYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y62PLCnAIMTm/4r+BIoKdRq7WXwqG5VbRVW0HIEHIJ8=;
 b=VkZYFDsx5+Bnb3jFE0fzupugN8ZYlMYQf0yUJIT8YLddN62IPqYFM68wJ9gD159IjdTzsKh1466+WMirGMvYjuZwnxYoAusER2oNfbpP4yv5TTJSMpx6VSnkZ6PNMKo6GpSv2SRVqYd72xd+cYA0YIwmfpVpY2WMoO0yh8X5HLkqECJbwCuGH7xGA/QUmb2v6nSuOnErnVCa0uL1fPqQplZOlGtSEDXQpNS3syfBXOs0DvIKjyU45sXx8xkDedZGqp+Yk0BWoKv0vfuEXRPdM2HLwagglml0IG6X3prIsuBULtbHfhhr2G/gIYk0wbpuHNVRhw2GXwRw/9q9vZi0NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y62PLCnAIMTm/4r+BIoKdRq7WXwqG5VbRVW0HIEHIJ8=;
 b=KOsxIVruL96T5PfED6V2hqhESqaoVca9i+MEABL9iIglR2ikrKcyiyPlkF11pgPGX0DTftsFmEXkKi/NzNDQDsecdBSYlo95a35mUvhL9g8xg/0Z51i2huhYb0tdoHRkTRKW9NQwbHzYv/MxhMyerQfXP+/xTl6LPhpZfRpcbLA=
Received: from BYAPR21CA0004.namprd21.prod.outlook.com (2603:10b6:a03:114::14)
 by SA3PR12MB7808.namprd12.prod.outlook.com (2603:10b6:806:31b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 15:44:55 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::6) by BYAPR21CA0004.outlook.office365.com
 (2603:10b6:a03:114::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.7 via Frontend Transport; Thu,
 13 Nov 2025 15:44:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 15:44:55 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 07:44:54 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 07:44:54 -0800
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 13 Nov 2025 07:44:54 -0800
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v2 3/3] remoteproc: xlnx: add crash detection mechanism
Date: Thu, 13 Nov 2025 07:44:04 -0800
Message-ID: <20251113154403.2454319-4-tanmay.shah@amd.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|SA3PR12MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: bc99f648-81a7-4434-861f-08de22cb97dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nBPPc7b5sGqW1YrSrw4k399AnywMSL0rtDTSrXLATty/qZY0owQt4hyThNoN?=
 =?us-ascii?Q?2nk6dScr29EzMN6oBR4noMtZ8aPmdkXLfgVcLhcX6dJUKvZlgp4L0x9gOUd/?=
 =?us-ascii?Q?X/jXsFtjdFHbGiFmr113fApY5uMZf4azK5JMIE3eRaAh6nfXGvDNsTDBVjt6?=
 =?us-ascii?Q?yx4F3avxgOclRvch8FzUzPVP6X4tHs7ywhgoOUH7ouuStOQq60JRPWKiK7lN?=
 =?us-ascii?Q?IgClunx5v4dA7Xh4pERCGcpbLpDCFr0l2BDlkIjfcXKmwxC/jDkcjc1tPgRa?=
 =?us-ascii?Q?MY7Ky+MuZNbpCqudTWa37IicgvwW42cxv9+0wRg+KPrYX/AcFe3eI0qaN2sC?=
 =?us-ascii?Q?/gNzTTymXZhioFuB47qsh1ROOoZGFrQshUMLLuN1yeGYfaRFRGALwR1aCzRJ?=
 =?us-ascii?Q?Q4Uxbprd9RarjYf8OkpXTsvxd/nDtgtmmQphpjuqgBBwlnMPq4xa6+xLIgGd?=
 =?us-ascii?Q?czdzp48lKKLT9ohiL0vauDXuSjDuShV975gt5mrh976j94hxHUhy1k/grjNX?=
 =?us-ascii?Q?6DkZRJ4do3x55v9OJhdkZeOvhQR3JX/gEjNrgFZu8d3YD53UBGQBPK3Jpa02?=
 =?us-ascii?Q?Hph3Yi7Vf1kjTuEFpYhDEs7BlhZDqAThqAO1mKudv0myJhfT7lbL7VVC0TkV?=
 =?us-ascii?Q?TW/cDOwRYeNqyM/yLSG69fgwoHuZ3Uaxf9OxmDBLTEnVzc7UUM+rjGF0K6QO?=
 =?us-ascii?Q?isEErH4fwd9XP0c4KeUHgTivxdauXq+WstyezaptPadYa1Ejb4b5cubpMqBr?=
 =?us-ascii?Q?gmRFxjdhL3eVJzpGxSgovzkbYLrLSzPmCipC43AGbRzHWskx4j7gB3h4elnl?=
 =?us-ascii?Q?p9mn4V45vJM+2nPhDz9wVQoam+WnAP5jvSTPuykjvrRfbFiM8HPHDZ67natK?=
 =?us-ascii?Q?inBl2R0fWdHSVx4lfYLyxRo1OawH+iS/kCuPVGQZfq0iiB/GouGctmcGZ1sI?=
 =?us-ascii?Q?Ez4dfp3DUNNfF8o8FQAZWjoQGTIVuAaLOZUm+Snx9Lac4LLNdYgtCFnipA1h?=
 =?us-ascii?Q?Tln9d0oh2vEit/YK+hSLMHNEmmACbJ/LnD1OyPXVcSu1r9lqWwvkZ2GFGoiM?=
 =?us-ascii?Q?y9vPwphClIIfnSBoDrjB3B9LKPXeYg4MfC1yslTb3s/ErzGbsCKLgwawTw98?=
 =?us-ascii?Q?ejRRRUpfNc1zOc+eVZ30U6mkaIu5cei8IsgvhONfc+2aeoUXWBmxS3COsHYn?=
 =?us-ascii?Q?pMIL6XED5Zq/6fvnXg1SXqLj2PIw+w6hWCP/WC9PUuInlsk+id90pAD9ciED?=
 =?us-ascii?Q?+MJh1wSJgq6Crdd6JhtxP6TiJw53gpuE6cS/ZR+1R/sF/3wKZPSkZG62ayPl?=
 =?us-ascii?Q?qmXRUFyWMg4owTsOKFtnSI+ijafkJN/PUVMEUJMM3k3dVDo70cXH75AXBf6m?=
 =?us-ascii?Q?xNXy064JOV6MYp6YqCy5+P2NPvwNwLpcjEosAVjDs+8LMsWQbF3ZAb6sTDL8?=
 =?us-ascii?Q?xrI/65OK2oX2W6Vrbss98pZ6b2cr0zuhw7eaDqXD6l9jJ7ebc4uiWJo5tIlV?=
 =?us-ascii?Q?tgSy8l+oKJtL4JwTnfCqwypRoO2rhsMAQnOC9H5xkodotpEm969q9ortuuTH?=
 =?us-ascii?Q?G+Wa7rWNMOAMKZvgGcY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 15:44:55.3366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc99f648-81a7-4434-861f-08de22cb97dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7808

Remote processor will report the crash reason via the resource table
and notify the host via kick. The host checks this crash reason on
every kick notification from the remote and report to the core
framework. Then the rproc core framework will start the recovery
process.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v2:
  - clear attach recovery boot flag during detach and stop ops

 drivers/remoteproc/xlnx_r5_remoteproc.c | 56 +++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 8677b732ad14..5d04e8c0dc52 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -108,6 +108,10 @@ struct rsc_tbl_data {
 	const uintptr_t rsc_tbl;
 } __packed;
 
+enum fw_vendor_rsc {
+	FW_RSC_VENDOR_CRASH_REASON = RSC_VENDOR_START,
+};
+
 /*
  * Hardcoded TCM bank values. This will stay in driver to maintain backward
  * compatibility with device-tree that does not have TCM information.
@@ -127,9 +131,21 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
 	{0xffe30000UL, 0x30000, 0x10000UL, PD_R5_1_BTCM, "btcm1"},
 };
 
+/**
+ * struct xlnx_rproc_crash_report - resource to know crash status and reason
+ *
+ * @crash_state: if true, the rproc is notifying crash, time to recover
+ * @crash_reason: reason of crash
+ */
+struct xlnx_rproc_crash_report {
+	u32 crash_state;
+	u32 crash_reason;
+} __packed;
+
 /**
  * struct zynqmp_r5_core - remoteproc core's internal data
  *
+ * @crash_report: rproc crash state and reason
  * @rsc_tbl_va: resource table virtual address
  * @sram: Array of sram memories assigned to this core
  * @num_sram: number of sram for this core
@@ -143,6 +159,7 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
  * @ipi: pointer to mailbox information
  */
 struct zynqmp_r5_core {
+	struct xlnx_rproc_crash_report *crash_report;
 	void __iomem *rsc_tbl_va;
 	struct zynqmp_sram_bank *sram;
 	int num_sram;
@@ -227,10 +244,14 @@ static void handle_event_notified(struct work_struct *work)
 static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
 {
 	struct zynqmp_ipi_message *ipi_msg, *buf_msg;
+	struct zynqmp_r5_core *r5_core;
+	struct rproc *rproc;
 	struct mbox_info *ipi;
 	size_t len;
 
 	ipi = container_of(cl, struct mbox_info, mbox_cl);
+	r5_core = ipi->r5_core;
+	rproc = r5_core->rproc;
 
 	/* copy data from ipi buffer to r5_core */
 	ipi_msg = (struct zynqmp_ipi_message *)msg;
@@ -244,6 +265,13 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
 	buf_msg->len = len;
 	memcpy(buf_msg->data, ipi_msg->data, len);
 
+	/* Check for crash only if rproc crash is expected */
+	if (rproc->state == RPROC_ATTACHED || rproc->state == RPROC_RUNNING) {
+		if (r5_core->crash_report->crash_state)
+			rproc_report_crash(rproc,
+					   r5_core->crash_report->crash_reason);
+	}
+
 	/* received and processed interrupt ack */
 	if (mbox_send_message(ipi->rx_chan, NULL) < 0)
 		dev_err(cl->dev, "ack failed to mbox rx_chan\n");
@@ -397,6 +425,7 @@ static int zynqmp_r5_rproc_start(struct rproc *rproc)
 	if (ret)
 		dev_err(r5_core->dev,
 			"failed to start RPU = 0x%x\n", r5_core->pm_domain_id);
+
 	return ret;
 }
 
@@ -438,6 +467,8 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
 	if (ret)
 		dev_err(r5_core->dev, "core force power down failed\n");
 
+	test_and_clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
+
 	return ret;
 }
 
@@ -874,6 +905,8 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
 
 static int zynqmp_r5_attach(struct rproc *rproc)
 {
+	rproc_set_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
+
 	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
 
 	return 0;
@@ -888,6 +921,8 @@ static int zynqmp_r5_detach(struct rproc *rproc)
 	 */
 	zynqmp_r5_rproc_kick(rproc, 0);
 
+	clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
+
 	return 0;
 }
 
@@ -896,6 +931,26 @@ static void zynqmp_r5_coredump(struct rproc *rproc)
 	(void)rproc;
 }
 
+static int zynqmp_r5_handle_crash_rsc(struct rproc *rproc, void *rsc,
+				      int offset, int avail)
+{
+	struct zynqmp_r5_core *r5_core = rproc->priv;
+
+	r5_core->crash_report =
+		(struct xlnx_rproc_crash_report *)(r5_core->rsc_tbl_va + offset);
+
+	return RSC_HANDLED;
+}
+
+static int zynqmp_r5_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc,
+				int offset, int avail)
+{
+	if (rsc_type == FW_RSC_VENDOR_CRASH_REASON)
+		return zynqmp_r5_handle_crash_rsc(rproc, rsc, offset, avail);
+
+	return RSC_IGNORED;
+}
+
 static const struct rproc_ops zynqmp_r5_rproc_ops = {
 	.prepare	= zynqmp_r5_rproc_prepare,
 	.unprepare	= zynqmp_r5_rproc_unprepare,
@@ -911,6 +966,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
 	.attach		= zynqmp_r5_attach,
 	.detach		= zynqmp_r5_detach,
 	.coredump	= zynqmp_r5_coredump,
+	.handle_rsc	= zynqmp_r5_handle_rsc,
 };
 
 /**
-- 
2.34.1

