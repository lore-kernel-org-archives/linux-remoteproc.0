Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013057.outbound.protection.outlook.com [40.93.201.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B876FC5;
	Tue, 17 Mar 2026 20:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773778394; cv=fail; b=iiokIbvOqlPJUo7GB3fdOXTwVws0eomYeI8dWFT2qSQbWpJezkR4AfNEu+SAd9ehR/SoKALMwYim2ZkANHHRLpTjJVXpi0tunAyL/EkOKkHCppZlZbzNPxoQyZDkS1/V0piNdxkTp+Sg3CFPKdz2ZvLWvFPGhyL6aw6+zR/9sY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773778394; c=relaxed/simple;
	bh=iShWKJ4u/mKxOn2lO5glIgS2FJEzKqcIGcbJVB7/k+Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FbR9NpEWXfzr8sh5yY05432oQADc97rP39xn4IU3A5K4piwqXAm5XRNcdwKtwHxHElti/EQ9B+N0QzliMtIrZKUGvDu6+C6hVJibEw91DmZb47QOAKz5h5nknA6XFr7vZbjEXa4fgWrbs2pmFdf9rM+k6F5ElOSpUmgGP9Ay5W8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=e8cu7AfV; arc=fail smtp.client-ip=40.93.201.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="e8cu7AfV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtZcECzU0vEmwptJ0q94S3ducbiAP3GSTemZaUYIFkIwW1T5NTjpuW0zqCBTrstqLDfkf+z4XG6xRO7thQMo7CwZSzkp5/l36Mn3oKfwvi8lHAh7RD3hK2VBGa872naRg1O0DXkJfrrTiNQGr147DUeD0WwSziKKqm9Bgmyrzi1HZP10c1ECgf77nhCdk3DWjjmY5EOVCb9d3jqwr+Fmdtf5e71lBb7wa5RKbin1RRpANEpTa+LD2DPKErULwJ7DrduMfxQijeUvXxA+tckC+YxRT6q6VpBW6qP4nsSH3MTYTPCE5cHDCh+SddwN8lyh5kA6kEDjHXXLQ9ruSyV95g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSqXA035eXT3iggyrrgzkzXthXDQJeD30zlrapLl1/Q=;
 b=xqNn8QbFDFpcWEs+HoZuXCmWIJNAzQKMtctIym7nrK8n0yCQLbqKajcbW5u9AJe5uf2BS1k1QPyy7BnflML6yncli9oGZvabllFwDX3MN1ZHIfce9g0wqmYI+quKcsM5+m8oVL+SIpke7tdFCPcnTNVfSx9tGVWzPEKEeokjlO6Hf4d9xtuIc2p5nPReaZMK51z5Dje5vZvO5F3QFNIev495zc3F0briBqZvwzNVGshUU3Ij/YKDlQBkp6gXsqR/mTTWfrCGQZiBklpKu84jDguX/n1lbUFUDJ2wMeHbvJHhbY7V2YtB3gHaacqq2Qf3Nvx3opZyR3jocYKiGDdHpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSqXA035eXT3iggyrrgzkzXthXDQJeD30zlrapLl1/Q=;
 b=e8cu7AfVeP+0qVY0waSMPM4vp9KgGARytUkkoejmI0tIASURZgJZgu2GhcbCfezZbbcK/PkAX4tbSysAwCTIi6TpCnlWc0hefhzGIuF6dnqGDeukCtPitMMScKqu/EmZXXerNaei/D/kADqXJIhfMfMqi7lQSdDvYQqPAOew3WI=
Received: from SJ2PR07CA0011.namprd07.prod.outlook.com (2603:10b6:a03:505::20)
 by BN5PR12MB9537.namprd12.prod.outlook.com (2603:10b6:408:2a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 20:13:09 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::23) by SJ2PR07CA0011.outlook.office365.com
 (2603:10b6:a03:505::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 20:13:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 20:13:06 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Mar
 2026 15:13:04 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Mar 2026 15:13:04 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH] remoteproc: xlnx: reset virtio status during attach
Date: Tue, 17 Mar 2026 13:12:51 -0700
Message-ID: <20260317201251.3920841-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|BN5PR12MB9537:EE_
X-MS-Office365-Filtering-Correlation-Id: 84f310ba-1ed6-4ab7-957c-08de84619a73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Jx0+v0CtUCedYBfKKBo0sWfMAZCwnVsfzCnncfowkyvM63fmM0uIbg1hG/LDrZqJExlF37gvT+ttXpQLISdBy2vLzSCB4v4iPpfcwO6iUiOkS4HgXpib9LvEOEui5Dd3hG9AGa4+AYynVWDFSoL1zbuC5RvMgJguX+iGGi583qwjrYnPieZVZw/S/YnQ80xoiVFAQw5BlrAuDNKFlmSG/BQLb1nhw4Q0OmuFqcK+OgdJOEoi7uFYUtxOgtETmV/DQP2Y7qittSp5NqnLEWRRcvhZIB5kmt2JLZN4XcVBbvJqP92MqkuuWW20fUyJJBSrg+QR5MafJqkriRbQ+HqFHbbJD03wz0cxbgs83AQ57JSGHjukKOmJmLhxvA6nv3hTgfGCcUjZwWtGaaP/jzyXMZzZJEiqyztP+OaIKX828+sb1Z7/852RVbY2Xa66QqVlQkXBPA6RdhTVEQJV3JT/HaaCpwRE4Y/yB6ThTmgeqIEiXHv7M3DhXFDJ5STMMKxVlY8nWXHPDwuSioekSV1EPOYfPz+yLyBLVBd2S4+u1+l+qW/m0I0KgoddSzwyTfuuqS9+uU8D9KlaJdMHk77qXpCpOJGUxc1E7zq2bB6O+BRAMEZt2DhK5aCCY/+PISMV8yDj1r/D3TmxqPC53/gebvyyCX4h0e5yGOe+/6TU3n3xl+hJVDHv5D+DSFp//wZbAwAokLvXZDbvuDUjg/0sRsgyu+sMMmpAkZYuWFiYa1lnSNOogZOLtV8MXsKKh/3MU3qiSAQK2Oc8TfnfnHZpCA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D8IfoVtXvmcykt0zXYdR/FQsdPKPw8mBieZwCt/Wp92ETWpQ1oTG+WeRRQm63Xyj4OLl6NaEENI6XSH8y0O+dh80a/pr1GD762aR3WSeQl3qaX8+9iUlOuQq9obrZTCVPMLm4tK+09ZmFM6OMbMJXYQSGAaQoLNv5nJnyFbp/OfjPS+NA/YlCPCpAP489o2m0pUzXBvs+RI2/GJP2Wl1BNsr1bwUbaRAUKvV5WMb4tM5yVKLHlSp+6DE5qZg9WCkqoQp+kbuvPtKYLjoGWTxsF/3aZhYMBdBe11DljBsLU8fXPATswyswGxeT4XJYkWkbRMD6WeUbUs4jvCjUaV7Rb6RKEoFQq1jMXxUV2Szw1XuRyJthlb3gMhbjkVqtQRdxTkgg7bBBQ8LiRBHo/+LELfFvb806b1kCVcA1aIVqHEZy/PzjCR8LPs06Wsquew0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 20:13:06.9883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f310ba-1ed6-4ab7-957c-08de84619a73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9537

On AMD-Xilinx platforms cortex-A and cortex-R can be configured as
separate subsystems. In this case, both cores can boot independent of
each other. If Linux went through uncontrolled reboot during active
rpmsg communication, then during next boot it can find rpmsg virtio
status not in the reset state. In such case it is important to reset the
virtio status during attach callback and wait for sometime for the
remote to handle virtio driver reset.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 46 +++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 50a9974f3202..f08806f13800 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/power/xlnx-zynqmp-power.h>
+#include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/firmware/xlnx-zynqmp.h>
 #include <linux/kernel.h>
@@ -29,6 +30,8 @@
 #define RSC_TBL_XLNX_MAGIC	((uint32_t)'x' << 24 | (uint32_t)'a' << 16 | \
 				 (uint32_t)'m' << 8 | (uint32_t)'p')
 
+#define RPROC_ATTACH_TIMEOUT_US (100 * 1000)
+
 /*
  * settings for RPU cluster mode which
  * reflects possible values of xlnx,cluster-mode dt-property
@@ -865,6 +868,49 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
 
 static int zynqmp_r5_attach(struct rproc *rproc)
 {
+	struct device *dev = &rproc->dev;
+	bool wait_for_remote = false;
+	struct fw_rsc_vdev *rsc;
+	struct fw_rsc_hdr *hdr;
+	int i, offset, avail;
+
+	if (!rproc->table_ptr)
+		goto attach_success;
+
+	for (i = 0; i < rproc->table_ptr->num; i++) {
+		offset = rproc->table_ptr->offset[i];
+		hdr = (void *)rproc->table_ptr + offset;
+		avail = rproc->table_sz - offset - sizeof(*hdr);
+		rsc = (void *)hdr + sizeof(*hdr);
+
+		/* make sure table isn't truncated */
+		if (avail < 0) {
+			dev_err(dev, "rsc table is truncated\n");
+			return -EINVAL;
+		}
+
+		if (hdr->type != RSC_VDEV)
+			continue;
+
+		/*
+		 * reset vdev status, in case previous run didn't leave it in
+		 * a clean state.
+		 */
+		if (rsc->status) {
+			rsc->status = 0;
+			wait_for_remote = true;
+			break;
+		}
+	}
+
+	/* kick remote to notify about attach */
+	rproc->ops->kick(rproc, 0);
+
+	/* wait for sometime until remote is ready */
+	if (wait_for_remote)
+		usleep_range(100, RPROC_ATTACH_TIMEOUT_US);
+
+attach_success:
 	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
 
 	return 0;

base-commit: d4ef36fbd57e610d4c334123ce706a2a71187cae
-- 
2.34.1

