Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010002.outbound.protection.outlook.com [52.101.201.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8F236923C;
	Mon, 23 Feb 2026 18:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771872633; cv=fail; b=CM0w5oNIFkqUm2sUywJ3txfHQjyev/gHKXqt5/wb4bzbLBOCy334wUVUimTJFBB0n7N3++iVxbxB6vWWwqny2Pl66aMbhA9Ng5McbzOv1dB+EdL01xQ3hzNZGK1TOhGpdZ3jAK6T4VIa38fjkubUK/MaJXzfTD7bLy6MTWLdnvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771872633; c=relaxed/simple;
	bh=ysoYowNKQASt9NsAsa2FDVrSWSuzNwVe5xi5ECpk6Bs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UqqjHtr5WIxb1+6VPZJfpNkHlG51V5GKqKnLTdV3zjsjSHS/3L9V2L9OmzPDost3zZkE7l/3QWVpzCBnplzvwXmtQ0TK/NhAiRKHeunDcn5Ka30Zlfb0PT8WjDpOH42LVLGjhDph6Z6wS/0Vx7PSCQfpBPBrbbQPJMozNnesbA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aLot30ON; arc=fail smtp.client-ip=52.101.201.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aLot30ON"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUOYE73yFFNGXmiU5g9PIWaFAtrL8Ro3GgYZY1yDMNZlgHmRgL/2oZ8M0agCJuv86niG9ZYy6XKsdokORNgpvyAojlzjZuh3lCl1916AFqTwe3/0QHVPNPkrME1O8BQ5OTiGfXitkkk13IlSVTO87Pdnt0Iu358BRbMF8gvbrZ70pLAuqKdm7z7SOXCIldxW+codpP/xBs9UrDmteDxR43gfxR5z0K2nFPCP0HLmKDbEv8WqKsOOBKIjte5WsP0ciNgeHD6fVZlAal9kVfAkPbku7ITFPiE0CJpxeFzj/CATbr4z85FYguW5XNgG7iSBEOjXFXfU1E+NiuxsCmfSqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFju7223h1O7E+pO2ugXyUuQcq0c3Q0q97kwAYxt2+w=;
 b=AQ57eTLtnHiszCV3GPC0C6N6Sw/icTEE3SrdRMtDbAFQREgFuon9OFlPkFG40r+MpEnEp7nGr6oRagEGtwkTg1yGwnoI9nwHBznU9l9KDwnmLhb8tD3iclZDAmc+WMyjfZmKNFKn1c93PjIBAZ9emcSEGXqIY2QR1Aztf0S37bDGem/kL6AuG2HPD8QcZfqnD0vWGNyDaim9PJ8kTM6MIjIoKhNv8Wbp7F7T0jVG8WUALxAeqh7GxZn53QFdEb4Hw5kMzKLp5dRM0A9wVtORDYV7F115LmcSckUM9HfW0SevVn0Bu0Cz52tg6yseS6Fe+zyeeeW1fQmJlZeHGaER4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFju7223h1O7E+pO2ugXyUuQcq0c3Q0q97kwAYxt2+w=;
 b=aLot30ON4Kn67mlVrnX4kdrll4GG1th4RSheRVsC0e7mZhnlbnim+tDEKwJSW1qwv0KaE8WSC0RTrTWwz28azhiysdjJ9xokbxy3CG5AdneI7CTD7gvFacXF+fZ1FZ1ZxbVHQwsWAZJgck1wT3YbpaNMQhBG0DS2rJGF79Gd5+M=
Received: from BL1PR13CA0429.namprd13.prod.outlook.com (2603:10b6:208:2c3::14)
 by PH7PR12MB7425.namprd12.prod.outlook.com (2603:10b6:510:200::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 18:50:23 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:2c3:cafe::95) by BL1PR13CA0429.outlook.office365.com
 (2603:10b6:208:2c3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 18:50:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 18:50:23 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Feb
 2026 12:50:21 -0600
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 23 Feb 2026 12:50:21 -0600
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH v3 2/2] remoteproc: xlnx: add crash detection mechanism
Date: Mon, 23 Feb 2026 10:50:06 -0800
Message-ID: <20260223185006.1278518-3-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|PH7PR12MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: 35368673-06c1-46ec-86b8-08de730c66b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6GVWcR1M8fTaDciIXT3ESjZN7stzPdciYY1xTMNi1vpV6aJahcBnSHXc5+Ay?=
 =?us-ascii?Q?ZqdW1NUPuV7xXDW1scZvhijUSj6tDV2bpNK8j464lPYmaWflixwchdncJZTC?=
 =?us-ascii?Q?YnlfrRiRPvVZNHPcK8K3Qnf32wz1l/rejj8AjsrTQ23b9nzyeFZnoHdicN7c?=
 =?us-ascii?Q?3emZg+xt3oapqxXzirkoq+I++E43ypD2ldah6h8Zg0eTwlPHWMCC55XdEpJb?=
 =?us-ascii?Q?VBwA805oqa8Y39riPFTkMKmfvf3okqBGgFjnN/hHbUix+WzGd33Y1y3OmLqe?=
 =?us-ascii?Q?fP/DzBWfDNGhhL/xlvrX3O8vW+nlLLxGmZidVSX1omyKysQx4YjFb+/uQYWM?=
 =?us-ascii?Q?jOA42vX6HSd+83Exdyv532O0Tz30NfTspM3IP1FRrwsyRdxD+IEftuFIfUMD?=
 =?us-ascii?Q?iWgZpG23e72DcxXpkPzeErcf++jYnyhuZZzA4gohyN6bPD3fDqQlXSccCt7v?=
 =?us-ascii?Q?aGZ0QhGjdr+pYjuCJs1GJlmX50HRX3i0HW3gZ6hs1udmx2iYrjQ3fXcuvL/J?=
 =?us-ascii?Q?j4IQjAEhne9QrlYgTVX5qHwdWAlTw9aUK8f1HeWMeoYN9pSUSw8VTDSzJ/wW?=
 =?us-ascii?Q?+R9SSF+IQ/03A6MLJIER+ciAtUC+a18RtUqc3ESQWhL7xVKUg+UWvSvGbFZG?=
 =?us-ascii?Q?5meABiUYe2TBJFM+NjrKdt6WhOuIIM8xrXCVKpjUdlO0bEU0iItKeLAMqHWM?=
 =?us-ascii?Q?LG5c2l4r80dI1AFiwKl5jqaPUIyPOR/Geh/alD29f3+ROGVncmrpmR+pb4qS?=
 =?us-ascii?Q?EV1YLPSRfBN/dGoP5xRL4kMhblSa0xGtlM/JNFOE8NR0uNMc48XPqUmKiv51?=
 =?us-ascii?Q?Jj7qPOF8S7pLJKiI0W0Zbw9Zokgpe9CArH6rtwlHxQzghsU6lj6teBDoS4OQ?=
 =?us-ascii?Q?YteaIdWOboBHwE5HJxaRAEkCi4Y72mpqSvjn77wjuarlJib9WCIdwuUPg78R?=
 =?us-ascii?Q?BE48aGyScviQIKnzlgiN2SvQjU01Ww8VVddcBxnO1TULKdewhmPmGU2nQRQy?=
 =?us-ascii?Q?Zoo9UPX9JsmPNE2pjVyo2POAI5Ojj7zR2p5MYxsYyXtcmWENzWCsxxiulzfi?=
 =?us-ascii?Q?0EjGbWcwgEzKeQQ1f8/yAEuAsOuS1RqrBoW9nQ1yasGPBMtrq3qUS9MPGWMf?=
 =?us-ascii?Q?9D+Vr5kLp7G+l9DTBlPJjA9L+b+g1kOft4NbxJKs9362dggBaasLhvJ5q/tJ?=
 =?us-ascii?Q?taxCeDos/8BVGr6qi4yStoVwroQVlP7cAG+9/2bkXNs/02W2SXvenQ3NEnFI?=
 =?us-ascii?Q?raknX+MRMXIxgJwYUBdRjHiECXtT2hE1YTpm68KlsTaQ9puNX2+UcKZVHrW2?=
 =?us-ascii?Q?tG8XN90b84sI41lkghF/vWW1pjBYmJTUM4x0SC6Abj24bafO4M4yOCR+/E+r?=
 =?us-ascii?Q?+1DeQU5PGbZ8JwaVMXjSonViFeJL2r/7r8bA1/zUWYzDYiTIXfNrWNEFMGaT?=
 =?us-ascii?Q?gJdKjYmHlQt3KQ5dPavt5qch3988wx/NJU/OLip4fRcn31eS6bU+EnC8WGLH?=
 =?us-ascii?Q?ENZ/0WUgpzeBnDM5eT9VJBhcgeWtinh4imKyxHlyuzWlnHMCjNvsLrenjTw2?=
 =?us-ascii?Q?Cn87PWMah1hgfEC90pUSxqZVr5NZl6HCb+k3jEJogIM9ko4fBobqCKq/sgd3?=
 =?us-ascii?Q?ShLfaSxwYcd3xkI0mERliWDxLRNVd3CavNmZh2St3LuEprEk0X4KE1L5C77H?=
 =?us-ascii?Q?GeSKhw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yPBazzzhfUR36yz5TbTDNGecL8WV729y09zkLMOeZiaEuU+xwT836Jtl2j/cF4AkLMnUm21PV2oHUcyoE3fN7kf9EuVd+R/nbHgV08CQhOTwpJ5BDgbiG2aa64KalN92LMI17txNtHLzDILTs6fN8/SxFek45BCFWFyZNLZVo8LUt/0JUhb9pvGs8IaJiaS3LhIt+eUi9A0EYP4xrHM7C7egAXSwJD942I78SAyqcqNaZtutP28uFQjKc9zxGqVWS1NrPEdC5xL2TrZs+FqvD+68SWRoGjXQzdl54NdnvR9SOYEsj4ObZALJKGlhnqhrPylQs+ZG6mRUKo9Ep5CKqK/LRoQq/LmeEeE5bRjwUyYJTU3u4YSp/On5KSZWVcc9NGjLOfeo57mggRQs2VgjTsxyWk9h/HguFm87cV1gkKwlTBFkrfPIOYyhVo6IMgtm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 18:50:23.2806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35368673-06c1-46ec-86b8-08de730c66b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7425

Remote processor will report the crash reason via the resource table
and notify the host via mailbox notification. The host checks this
crash reason on every mailbox notification from the remote and report
to the rproc core framework. Then the rproc core framework will start
the recovery process.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

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

 drivers/remoteproc/xlnx_r5_remoteproc.c | 60 ++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index bd619a6c42aa..0d831330ea90 100644
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
@@ -244,6 +265,16 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
 	buf_msg->len = len;
 	memcpy(buf_msg->data, ipi_msg->data, len);
 
+	/* Check for crash only if rproc crash is expected */
+	if (rproc->state == RPROC_ATTACHED || rproc->state == RPROC_RUNNING) {
+		if (r5_core->crash_report && r5_core->crash_report->crash_state) {
+			rproc_report_crash(rproc,
+					   r5_core->crash_report->crash_reason);
+			r5_core->crash_report->crash_state = 0;
+			r5_core->crash_report->crash_reason = 0;
+		}
+	}
+
 	/* received and processed interrupt ack */
 	if (mbox_send_message(ipi->rx_chan, NULL) < 0)
 		dev_err(cl->dev, "ack failed to mbox rx_chan\n");
@@ -438,6 +469,13 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
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
 
@@ -859,6 +897,9 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
 
 static int zynqmp_r5_attach(struct rproc *rproc)
 {
+	/* Enable attach on recovery method. Clear it during rproc stop. */
+	rproc_set_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
+
 	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
 
 	return 0;
@@ -873,9 +914,25 @@ static int zynqmp_r5_detach(struct rproc *rproc)
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
+	if (rsc_type == FW_RSC_VENDOR_CRASH_REASON)
+		r5_core->crash_report = (struct xlnx_rproc_crash_report *)(rsc_offset);
+	else
+		return RSC_IGNORED;
+
+	return RSC_HANDLED;
+}
+
 static const struct rproc_ops zynqmp_r5_rproc_ops = {
 	.prepare	= zynqmp_r5_rproc_prepare,
 	.unprepare	= zynqmp_r5_rproc_unprepare,
@@ -890,6 +947,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
 	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
 	.attach		= zynqmp_r5_attach,
 	.detach		= zynqmp_r5_detach,
+	.handle_rsc	= zynqmp_r5_handle_rsc,
 };
 
 /**
@@ -923,7 +981,7 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 
 	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
 
-	r5_rproc->recovery_disabled = true;
+	r5_rproc->recovery_disabled = false;
 	r5_rproc->has_iommu = false;
 	r5_rproc->auto_boot = false;
 	r5_core = r5_rproc->priv;
-- 
2.34.1

