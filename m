Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012015.outbound.protection.outlook.com [40.107.209.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE31220B81B;
	Tue, 28 Oct 2025 05:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761627688; cv=fail; b=jglQ0SFjeyGWawxGk1T+2iGtejhMS6zpBqCGw9KRbP7zK+tzun1ExiBlPxamdTVa/OlT61F9Gw+f9LMFiwHwWg6jAtLCeuNr5ucgv6+A2fcHKWb8wy8glcqfvOJmr96Z0RzTA7n9YVB1oI0CZsUx7hb6+IOMUBcy8AEtx9mE+ss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761627688; c=relaxed/simple;
	bh=Rx4qvEe8hEJXW4EKUZMF3oj6ForuDTjWIz99HyvaU04=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L4YzyX9nK4XU424chTw4o5/rLFyQlqrcllNNWl0p70U9XbJQh5482ADbAClX19T5OC23m/vaXmmQ2Cz3fVAHFjbye4f3RspRmmbHG4Xy9pCM7v07beiqaqac8NIblsENQcT5tn9IxZBzICAS3KcuwnwsDoJplr0rH+q6Jvo02wI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IL7li3RG; arc=fail smtp.client-ip=40.107.209.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IL7li3RG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWgMOPu9b42iJ41YnOe7FkZiR0lAoyQR1IQ77rTqKbVHtr4pWVe0HqPqFKFN7lDavLAbcXCotMUWt6qiq3jF/PIBYQVgc6wYmWDZGVGmaeYV7SpU4VHXat4APTGTNTHH2DD86ZcEiLPVkKfdOxYBtPCNLO/Btzu94BFOiILSnMr6RrZymP/dr9vOWiJdxjBXizz83LGnECHIsme78l1YKHBqNEyb3uBJn8NVg8WM797tlgasVqj3aYcd4l0xfwW8N43K230Vnuz9LgHnmewjmLOzAisv6L7vwb32CYI+aIwYUjgs1z4Ksdl6l6YZTn4Vu+4c4z93fUvQvIoIHr9bxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XM7YJlwu6Ixp7olWFGAxjpEFRylKjr6aFTrp1IOVTo4=;
 b=GHkjQZSFVLhYOhgxtjQylSzxC2VrmqdUN2l4FhilvrGhfq/edLWbdQgbj1pHpmgBYMUdUXCHr6wCR+tnzAeMkU4jjROJ5RKaMTxtUxS/BkZZOOYH1rzLI4yts8+bBZn04PCiX9glVb4M5uLPlmaSXYo7EFcE8EuW6P6/Cc0VLpXHl3lbGbgJ0lLLfVDD5jVbrb4O0NRMoDCTtzmOgTX1PRiQSd5Mp0TdvE81vTUuZ5pX5B3YoffVn12MDDNlGBTI/P3zXGqejGdCtLmAADLI714vRRJ7b0tF0BQ4X5XEmo/ZAhFr2lGRPn+/E+SaW9u9UE2GZINLg4EyVqjmMvA0aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XM7YJlwu6Ixp7olWFGAxjpEFRylKjr6aFTrp1IOVTo4=;
 b=IL7li3RG5Onzm5W3jPq8Pa53e2AhoMQ1Ul7A7COa2PKlAZ93YJHgQOzsz/0KgJ7SQ4OmKtUmf12X/iWp8TqnUvPmGVSy05vjn2dVCXR9ELpVe//nJ7xV3a2LM83pqvuxpi35AOe7npoe2qT6Q8RwzvcUHRvQnf0dAr0/NPZKy74=
Received: from CH0PR03CA0359.namprd03.prod.outlook.com (2603:10b6:610:11a::19)
 by SA1PR12MB6894.namprd12.prod.outlook.com (2603:10b6:806:24d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 05:01:21 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::46) by CH0PR03CA0359.outlook.office365.com
 (2603:10b6:610:11a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Tue,
 28 Oct 2025 05:01:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 05:01:21 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 27 Oct
 2025 22:01:21 -0700
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 27 Oct 2025 22:01:20 -0700
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH 3/3] remoteproc: xlnx: add crash detection mechanism
Date: Mon, 27 Oct 2025 21:57:31 -0700
Message-ID: <20251028045730.1622685-4-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251028045730.1622685-1-tanmay.shah@amd.com>
References: <20251028045730.1622685-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|SA1PR12MB6894:EE_
X-MS-Office365-Filtering-Correlation-Id: fb00c6e0-9778-4363-0736-08de15df0977
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+O2NsPUGPi/q/4facbEJ8qKFpTYSFpB7wjl5kz6btGyWD80tITdJTi0cIU0L?=
 =?us-ascii?Q?Z2gvq8Oz7r+6PVcjgR3uFDi97NNNBx1PPDQ1OVfVV65dFJ+1Ugdwc+Di4jc2?=
 =?us-ascii?Q?fGeDxbMlIfSLawPstkgVxXgDsnb44l91GNGKyc/seCwW5gZpCbtQiNPMyVHU?=
 =?us-ascii?Q?HPe2muqwCp04eNQD7kMFmgLPvOVGQ5+LnrhzDdjKIbrSHsc5GiyibabRuYNz?=
 =?us-ascii?Q?Jj8Q00qX5D2Bp7wKfqZl35CugXTs8WwxOzEyIT4fAVBDKtq8eQRrVc9NydaY?=
 =?us-ascii?Q?68H5SYO+WapKhQR5y2nnRo4AJ3oogS/q2S6jSLMPoKMre8KmlD6ltRkAullC?=
 =?us-ascii?Q?QVmI4h5XDp48asWW9TWnurx7UzvVX3htB5AzgsFyFqwaqZakdRR/ecgbS+ka?=
 =?us-ascii?Q?K16RQ6d1yNT7ANp9Vykh+3GfWZnV27jy2ePD+674Zo5ydU8nYqssnMzJAjqm?=
 =?us-ascii?Q?+NEGXneX+TmJBU0AigeywUzW0eVV8nE/9XJMQBlr0X71Aj5gDwPELymnQC+j?=
 =?us-ascii?Q?O2XLAruA9eA7CNZnshSNGOHciLOB1ZNF/sacqsIQI1wmo5Jp76K3eYZjFcbC?=
 =?us-ascii?Q?U/TU6t+9mSZa3xl/ocEDaLL9yDK06lOccyCADRJSQ4MIdJr5b224rvoEDCjy?=
 =?us-ascii?Q?T4Rnc7qIh7375l+iVSQGSKV+IQ5JCm5Ya2wg7SkcVACqmXfRnoaFZn7CzwUq?=
 =?us-ascii?Q?uDQWE4lndwHO4Zmg50CforQvA4rKnihwdgjkw5584OV96acUWRQr3pxfT3eP?=
 =?us-ascii?Q?zP0cAYlTw15GaynQ6yiiy+KnHGPCk2MncrkIIg/4ozfMZwj5Ut1JqdqHLBJg?=
 =?us-ascii?Q?rdZK7hiTRHbEoBq3rqQ/qhkVdjq8Sp+W2Ph9sS0sPmKLeW6muXsBNqyKvE31?=
 =?us-ascii?Q?oL8rPHz8+wNscbPKAOuMNpnQJqTVAtoXJJJiRnLOyux7b0wBt9FZUrgVOEtP?=
 =?us-ascii?Q?S07kMjkfAEShubENJXOowaZLxZk/nl3fUg3pdp42MXTa8TyB/zLgWrzkdEQU?=
 =?us-ascii?Q?Eac5JbZDWHtqOkGJukYw6ue1lX2e12l7cXFaPWW/RyTfIqw69Z5bHp9WRmgt?=
 =?us-ascii?Q?yETEi93N9drRmUW2kfLVFJf+DnFfGY+rcFlqU3APmcSOUdmUoxgrkLTfuGY0?=
 =?us-ascii?Q?AkM8rBYRV0eoonfFvPn3uGyuqY0FpSAnEm1Nzg9xn+g9HfGYqt0d1h5fYhQn?=
 =?us-ascii?Q?fEaXdYDhmq2Wn43xs3pIgKsk6RSXAnaoojPItwkyZMupwbmkubP4v6fd1dXN?=
 =?us-ascii?Q?XrSrPBYEDLSiSurk0rbgRI1ReWiJswmJsRnZxlRLkfASAOAVXxOKd/S0mPX/?=
 =?us-ascii?Q?BvzoSnXcz4fgkY0LRlmkgZNOWcul4uZSnVG4g4Skt2JvnPLjtspv+EQiFHjf?=
 =?us-ascii?Q?Co0cx3FOXU2H6b3G3YfgTzXga0qtVfXD1QbbWaTDSl4gKUra3XeoXvmcHJOg?=
 =?us-ascii?Q?dCveYabZ2DQgsd3Vcr37WJDRVtPyC6qTR//4Bbi69+ixUi0QlmsY1+GjNMMM?=
 =?us-ascii?Q?+9/waUvgmQ2k5jANIjT9XACYWF+65lj0ujsUuif0evzft08+oPn1WOPsHXSX?=
 =?us-ascii?Q?bGuNZc3tkEg6BL2z6Uo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 05:01:21.3342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb00c6e0-9778-4363-0736-08de15df0977
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6894

Remote processor will report the crash reason via the resource table
and notify the host via kick. The host checks this crash reason on
every kick notification from the remote and report to the core
framework. Then the rproc core framework will start the recovery
process.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 58 ++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 8677b732ad14..9c6b5f751824 100644
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
@@ -394,9 +422,14 @@ static int zynqmp_r5_rproc_start(struct rproc *rproc)
 
 	ret = zynqmp_pm_request_wake(r5_core->pm_domain_id, 1,
 				     bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
-	if (ret)
+	if (ret) {
 		dev_err(r5_core->dev,
 			"failed to start RPU = 0x%x\n", r5_core->pm_domain_id);
+		return ret;
+	}
+
+	clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
+
 	return ret;
 }
 
@@ -874,6 +907,8 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
 
 static int zynqmp_r5_attach(struct rproc *rproc)
 {
+	rproc_set_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
+
 	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
 
 	return 0;
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

