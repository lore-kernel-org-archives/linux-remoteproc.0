Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0271B7F7;
	Sat, 11 May 2024 00:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715388700; cv=fail; b=ORe+hUdh9TEuU2F3P8/NYsmAkDvthmW5X4FlrbUYlUVnG6Rb0B/Tmkx3ssa8FOG8tMui1gHP9zSbA+pOwKMfEC82eqCEX2MQ/DAuzzYpw5/+hhJGmQ372KE+XrqAQuLG/f6DRhsUKoaKq3jlt0DevugHcRoTqAWIffMrs+XysYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715388700; c=relaxed/simple;
	bh=YbBoTWuL+PwQZ6ScblXUoss7JutDbLrdB6tAospsGWA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AsT0o/F20qp+bITLho6D4ajera0S/w5bm+sgcTo53CG/eowmVJ5O8Tc2o/BqAygF1YvAKUd9xaldKnAbyiSS0rTq6IlgZCf65CMx7hXTO3FT0FZv+o0gQ2tmVDmiil83KZfzcrHkySM0Bo5dXa/2ibdZg6v95OUxBV3fp3L3+rM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qUAK4Kt4; arc=fail smtp.client-ip=40.107.94.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qUAK4Kt4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3/QonmPZ/pFfRNT0LyL452UvHszw+ubLoZGSRFGRpPL5XEildrJGM2Lv8vQf+yjYRCLdZSKOJgpG4bxkG7lVYQPP0wZAQ0UjmiVclSJ4JH4axRl6KJCIklGx+5YngoKOBB8cTzdLTF54C641zC9EHaRGNR4pjYRR/GsXiEs5SjvpNA7m5XtBQsMPiumkxKU2MQYeRhf2EebJxnKeuBeHU/8UwyZJj656n7utKCEPL8ue4OsFPp1tdz0EAi/D1RlyAJFWvEc+HIs5LVOg/S9wZhTUUbG+K6VM+88l4fl3cFkpqY3Gj9X1sCR31I2L9CUJY1GCwD47bJju4EU2DfWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7Fuz99JebAALsgHZJ3MIiB5yUYtROW8tera9nnefa8=;
 b=EXHpjGq98Hn0bkDveJVleSeVmNKTZvG7PomGgrfy5aHJvJW9H75LVjsPWJoOmiI+g00VHGdfJk9VKJbXdqbBqwoXrxedYmMxaIdOhIiBPiaZE8LKr7qAv1Q2IMy1WI+VPWHjzkQ3ypiRCugDefz/8ste7aaUe1wAdebNLXTf8lcEUoKESDAmf8Pn3M3nkSrcCG2vVSxssSmhjMqJRRmvLn9jfnveZYO0ssMNN+GLrPSdbyRcRn8MrHZKya9sW2IFlD0LP+CCk2WEoEXfgXzEnRu5WJkx+JB3CeDUmZachQsfDcwVkLSWJ7yiexY1/cB7dnOYQfrQeGwXq99PvAmHLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7Fuz99JebAALsgHZJ3MIiB5yUYtROW8tera9nnefa8=;
 b=qUAK4Kt4GlpDeriYpa0RadOkIF7lEvUHSIWZj0Rr/EJ4X4t7yeJ5Ib77y1LejFz8OTzAKh3Cl1lfSF7cx9bvP0jy1eZ/Gai7GE/FdKwMF1VMkUjEJW7WQFo8pbcNqdXsUAogOwd9DHfHUfH/ceqalPxmG0KFc3wr59icyzlsizQ=
Received: from DS7PR03CA0255.namprd03.prod.outlook.com (2603:10b6:5:3b3::20)
 by PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Sat, 11 May
 2024 00:51:36 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:3b3:cafe::a6) by DS7PR03CA0255.outlook.office365.com
 (2603:10b6:5:3b3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46 via Frontend
 Transport; Sat, 11 May 2024 00:51:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Sat, 11 May 2024 00:51:35 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 19:51:35 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 10 May 2024 19:51:34 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH v2 1/2] drivers: remoteproc: xlnx: add attach detach support
Date: Fri, 10 May 2024 17:51:25 -0700
Message-ID: <20240511005126.1240430-2-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240511005126.1240430-1-tanmay.shah@amd.com>
References: <20240511005126.1240430-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|PH7PR12MB8796:EE_
X-MS-Office365-Filtering-Correlation-Id: fdf3ad1f-ea6b-4ef1-3ccb-08dc71548251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2N3oaNkAoj62zVwQfECpmBGXW5n2SrOdcgcvQrhkjTCr4hAS2ZV3gqp9P7Yp?=
 =?us-ascii?Q?3XMhfbQPUAbhYU4uoNgxUA4QvMRT+GkmFMt0iOmpQg4tHoWlx7iIVKl46AtR?=
 =?us-ascii?Q?iw6uTwO1oyE5P7AWTIairEjGPc6OGx5gIWlkB7wTjv7oSd/egiKZAD3eeeTm?=
 =?us-ascii?Q?nStUdYoH9PjSvqAAQJsKekiiHUtmlf11SU9cxLbiyau0C8PAaBZlSn4usuE1?=
 =?us-ascii?Q?JQA4KrTVHNkuOgMUCZE5h7+blh9uMOHqXbyM+TJ08pPzIPG6EZH/CyO0UN7o?=
 =?us-ascii?Q?VsHhvMkWgDDRLYMSvVwvLkc3anPuyV8lzFyqAShb2IgGkKTz/H6W+uAsnBx+?=
 =?us-ascii?Q?gwwsssizODad1sgCNMikIcfscBIf76kKaCLsiosk53gUeyKXZQ4PnLw/XrST?=
 =?us-ascii?Q?5eY/vaQEa+5vdr2vVkuHa3AA/pmgiE7dgrN13NanJvUE4rvo3aelgKjlpuSx?=
 =?us-ascii?Q?UCfs8kTW1GyIniOi3LgNP2wkRMyxW62Ouf/gQIYK1fT4nHlpyc0Mab4S5/Se?=
 =?us-ascii?Q?kOsglLkfD64cDjxbcr3U7FjUfUsNI3SGSStiNbry31O9/ULtqdKl1dWHS277?=
 =?us-ascii?Q?6NVyW0MS839+3K0vxK2dQ3K1R2g/sM5mqe2DESCbI0duCMA3xHFRkt6hFGfw?=
 =?us-ascii?Q?c4Wkb0pE7YpUopFlxgzRkkgY7vrCY+U+/dSaoq3BYsBi8ow1pL7ChV4QIxu2?=
 =?us-ascii?Q?RIC2Nr/BE5meU65+krhbWyjOUwDbpQgfKkIC33G8aKcco5AVuVYLk8WXtcsd?=
 =?us-ascii?Q?dOsQ+2vmOY/etxLi/Y2gz7thQaRxDudYj9jEf3+77deRxCCokxUQaOO3l6gE?=
 =?us-ascii?Q?XX5QGXBbkNmf3AZrnyzXzYucLu1AjuBvETNzkqrSgEmk5i+pIJ/gucvMXqze?=
 =?us-ascii?Q?QSiWZXSG1Lj2cvOf3+qN2eXnvBtTDhWYG9GEVhNrPau04PZDEDGEWCiJ/LVj?=
 =?us-ascii?Q?X22c0N8+fKXg17ttUh22c6tERnwfaQ4ef0GIcNka88p4QWTHEZeZS0Qcrlae?=
 =?us-ascii?Q?g0DXqG+/4jEgsVbrCz8wobYMlvGkaVNMYjS38fW8CBwhhvcC46xVG+XEqbOX?=
 =?us-ascii?Q?Nz2gMK0q1mr1JDiAbxmNg6S6l4J2YVGsTiKR/yxymU+ghABRtcGQmUiuyW8E?=
 =?us-ascii?Q?sdbkFsOgL68PXDE1wt8+y9wTQZXYjLZlByU6KhMvllNXw25OIy/CpjhVaEVi?=
 =?us-ascii?Q?2t9MNBp8/UayVxmlQ95k8iehvxtvJ93Z+sfKyL4WK3IIg8x1i63fdqKljKBF?=
 =?us-ascii?Q?5SIlX6t/q6Hor7hslGMdSWe20MWC2624v6QOcxTGxHSY0ZZYvYTfQg+TAKvu?=
 =?us-ascii?Q?77MvUGcOTj8kf+zZcKM40QyhtObWqQ9X+0uXWzKYX31dTzFJdVOQ94JyshBY?=
 =?us-ascii?Q?DJy3O5T3MmG6pXTTQxNb+Ye821NM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 00:51:35.6540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf3ad1f-ea6b-4ef1-3ccb-08dc71548251
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8796

It is possible that remote processor is already running before
linux boot or remoteproc platform driver probe. Implement required
remoteproc framework ops to provide resource table address and
connect or disconnect with remote processor in such case.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v2:
  - Fix following sparse warnings

drivers/remoteproc/xlnx_r5_remoteproc.c:827:21: sparse:    expected struct rsc_tbl_data *rsc_data_va
drivers/remoteproc/xlnx_r5_remoteproc.c:844:18: sparse:    expected struct resource_table *rsc_addr
drivers/remoteproc/xlnx_r5_remoteproc.c:898:24: sparse:    expected void volatile [noderef] __iomem *addr

 drivers/remoteproc/xlnx_r5_remoteproc.c | 164 +++++++++++++++++++++++-
 1 file changed, 160 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 84243d1dff9f..039370cffa32 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -25,6 +25,10 @@
 /* RX mailbox client buffer max length */
 #define MBOX_CLIENT_BUF_MAX	(IPI_BUF_LEN_MAX + \
 				 sizeof(struct zynqmp_ipi_message))
+
+#define RSC_TBL_XLNX_MAGIC	((uint32_t)'x' << 24 | (uint32_t)'a' << 16 | \
+				 (uint32_t)'m' << 8 | (uint32_t)'p')
+
 /*
  * settings for RPU cluster mode which
  * reflects possible values of xlnx,cluster-mode dt-property
@@ -73,6 +77,15 @@ struct mbox_info {
 	struct mbox_chan *rx_chan;
 };
 
+/* Xilinx Platform specific data structure */
+struct rsc_tbl_data {
+	const int version;
+	const u32 magic_num;
+	const u32 comp_magic_num;
+	const u32 rsc_tbl_size;
+	const uintptr_t rsc_tbl;
+} __packed;
+
 /*
  * Hardcoded TCM bank values. This will stay in driver to maintain backward
  * compatibility with device-tree that does not have TCM information.
@@ -95,20 +108,24 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
 /**
  * struct zynqmp_r5_core
  *
+ * @rsc_tbl_va: resource table virtual address
  * @dev: device of RPU instance
  * @np: device node of RPU instance
  * @tcm_bank_count: number TCM banks accessible to this RPU
  * @tcm_banks: array of each TCM bank data
  * @rproc: rproc handle
+ * @rsc_tbl_size: resource table size retrieved from remote
  * @pm_domain_id: RPU CPU power domain id
  * @ipi: pointer to mailbox information
  */
 struct zynqmp_r5_core {
+	struct resource_table *rsc_tbl_va;
 	struct device *dev;
 	struct device_node *np;
 	int tcm_bank_count;
 	struct mem_bank_data **tcm_banks;
 	struct rproc *rproc;
+	u32 rsc_tbl_size;
 	u32 pm_domain_id;
 	struct mbox_info *ipi;
 };
@@ -621,10 +638,19 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
 {
 	int ret;
 
-	ret = add_tcm_banks(rproc);
-	if (ret) {
-		dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
-		return ret;
+	/**
+	 * For attach/detach use case, Firmware is already loaded so
+	 * TCM isn't really needed at all. Also, for security TCM can be
+	 * locked in such case and linux may not have access at all.
+	 * So avoid adding TCM banks. TCM power-domains requested during attach
+	 * callback.
+	 */
+	if (rproc->state != RPROC_DETACHED) {
+		ret = add_tcm_banks(rproc);
+		if (ret) {
+			dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
+			return ret;
+		}
 	}
 
 	ret = add_mem_regions_carveout(rproc);
@@ -662,6 +688,123 @@ static int zynqmp_r5_rproc_unprepare(struct rproc *rproc)
 	return 0;
 }
 
+static struct resource_table *zynqmp_r5_get_loaded_rsc_table(struct rproc *rproc,
+							     size_t *size)
+{
+	struct zynqmp_r5_core *r5_core;
+
+	r5_core = rproc->priv;
+
+	*size = r5_core->rsc_tbl_size;
+
+	return r5_core->rsc_tbl_va;
+}
+
+static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
+{
+	struct device *dev = r5_core->dev;
+	struct rsc_tbl_data *rsc_data_va;
+	struct resource_table *rsc_addr;
+	struct resource res_mem;
+	struct device_node *np;
+	int ret;
+
+	/**
+	 * It is expected from remote processor firmware to provide resource
+	 * table address via struct rsc_tbl_data data structure.
+	 * Start address of first entry under "memory-region" property list
+	 * contains that data structure which holds resource table address, size
+	 * and some magic number to validate correct resource table entry.
+	 */
+	np = of_parse_phandle(r5_core->np, "memory-region", 0);
+	if (!np) {
+		dev_err(dev, "failed to get memory region dev node\n");
+		return -EINVAL;
+	}
+
+	ret = of_address_to_resource(np, 0, &res_mem);
+	if (ret) {
+		dev_err(dev, "failed to get memory-region resource addr\n");
+		return -EINVAL;
+	}
+
+	rsc_data_va = (struct rsc_tbl_data *)devm_ioremap_wc(dev, res_mem.start,
+							     sizeof(struct rsc_tbl_data));
+	if (!rsc_data_va) {
+		dev_err(dev, "failed to map resource table data address\n");
+		return -EIO;
+	}
+
+	/**
+	 * If RSC_TBL_XLNX_MAGIC number and its complement isn't found then
+	 * do not consider resource table address valid and don't attach
+	 */
+	if (rsc_data_va->magic_num != RSC_TBL_XLNX_MAGIC ||
+	    rsc_data_va->comp_magic_num != ~RSC_TBL_XLNX_MAGIC) {
+		dev_dbg(dev, "invalid magic number, won't attach\n");
+		return -EINVAL;
+	}
+
+	rsc_addr = (struct resource_table *)ioremap_wc(rsc_data_va->rsc_tbl,
+						       rsc_data_va->rsc_tbl_size);
+	if (!rsc_addr) {
+		dev_err(dev, "failed to get rsc_addr\n");
+		return -EINVAL;
+	}
+
+	/**
+	 * As of now resource table version 1 is expected. Don't fail to attach
+	 * but warn users about it.
+	 */
+	if (rsc_addr->ver != 1)
+		dev_warn(dev, "unexpected resource table version %d\n",
+			 rsc_addr->ver);
+
+	r5_core->rsc_tbl_size = rsc_data_va->rsc_tbl_size;
+	r5_core->rsc_tbl_va = rsc_addr;
+
+	return 0;
+}
+
+static int zynqmp_r5_attach(struct rproc *rproc)
+{
+	struct zynqmp_r5_core *r5_core = rproc->priv;
+	int i, pm_domain_id, ret;
+
+	/*
+	 * Firmware is loaded in TCM. Request TCM power domains to notify
+	 * platform management controller that TCM is in use. This will be
+	 * released during unprepare callback.
+	 */
+	for (i = 0; i < r5_core->tcm_bank_count; i++) {
+		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
+		ret = zynqmp_pm_request_node(pm_domain_id,
+					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
+					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
+		if (ret < 0)
+			pr_warn("TCM %d can't be requested\n", i);
+	}
+
+	return 0;
+}
+
+static int zynqmp_r5_detach(struct rproc *rproc)
+{
+	struct zynqmp_r5_core *r5_core = rproc->priv;
+
+	/*
+	 * Generate last notification to remote after clearing virtio flag.
+	 * Remote can avoid polling on virtio reset flag if kick is generated
+	 * during detach by host and check virtio reset flag on kick interrupt.
+	 */
+	zynqmp_r5_rproc_kick(rproc, 0);
+
+	iounmap((void __iomem *)r5_core->rsc_tbl_va);
+	r5_core->rsc_tbl_va = NULL;
+
+	return 0;
+}
+
 static const struct rproc_ops zynqmp_r5_rproc_ops = {
 	.prepare	= zynqmp_r5_rproc_prepare,
 	.unprepare	= zynqmp_r5_rproc_unprepare,
@@ -673,6 +816,9 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
 	.sanity_check	= rproc_elf_sanity_check,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 	.kick		= zynqmp_r5_rproc_kick,
+	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
+	.attach		= zynqmp_r5_attach,
+	.detach		= zynqmp_r5_detach,
 };
 
 /**
@@ -723,6 +869,16 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 		goto free_rproc;
 	}
 
+	/*
+	 * Move rproc state to DETACHED to give one time opportunity to attach
+	 * if firmware is already available in the memory. This can happen if
+	 * firmware is loaded via debugger or by any other agent in the system.
+	 * If firmware isn't available in the memory and resource table isn't found,
+	 * then rproc state stay OFFLINE.
+	 */
+	if (!zynqmp_r5_get_rsc_table_va(r5_core))
+		r5_rproc->state = RPROC_DETACHED;
+
 	r5_core->rproc = r5_rproc;
 	return r5_core;
 
-- 
2.25.1

