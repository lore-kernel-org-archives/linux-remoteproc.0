Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D5C37165;
	Thu, 27 Jun 2024 18:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719512042; cv=fail; b=MIe4o5ynsWbaXQBtIb9K4opT+THKSPugViRwljDLRT9t1O1JgMS2rH7rRhWCmZNUhZ4NiD3VWQf3hgtWWOqb0JS64Au0+ARGMboPJkAI3OznNAiXkKVq/yLzDpgQib1aspGlva7C11eKNSvSwcHiLHAIXQ0PHeCxSloZarxASWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719512042; c=relaxed/simple;
	bh=HXVl56gy2J+8U5cXyRMmZCn6rP+Sw6u6/x1RM518trY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lDg36fEs2cZEASyLLPbeHo7JxiJoh/vVHAzsMCm3vWMOAo4X26ytqKu4LXBpKzgXqYbmY2gZ2ZOHHh/2ihCtXl9t9xJSqA4QOLPiJwhPZ49pZjkmurYrHNFC/BkmtIkpDp/VpaeG2xtHrMd6vIyFIh4uvjNgdxFdSGL4oMjzAA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ng8G07y9; arc=fail smtp.client-ip=40.107.237.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ng8G07y9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzBAyPiV8LOws3YRwjaEaDOy+U2ALFCckuj58ldPDlrQ22ZmK/LdxOKKCoyU+lVudI2uEIsEb+IoFRmAiXAkN2XNjq0MKEmn7/NEaYJWGj89OcVduT1KQFwuARNeKjW7j9JzE/lSQMcGxt00nw873gx0mR01DnnS8wO83PBnaDYNGmjz61sOWvpD0linAlfX3YIH4p9H7df0IpPPY5agSDju60CqVFU3G3HSd/P+I4urQNxmTVeW6+SFiGbtIaa0/sZu5qEyrW8J/sP3jqGOjmxg9Yn0HoJVKnZAWlDIVfNYXjUahcToDEh99KpRb7qlu353pQw7wMxiQaHRaELv8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+lAemjlLQcrKcj5gWcyOOMYoCl6MuVbzN6xDrthbms=;
 b=Rd9kiFgBFMtR/sKelAfbIMOQzgny2zlYzOf1xWhhSLYFSKSAeG9qjNllgoVimgK944PMdkjIRRKW1bhHNIji9xpRQU+O4osigFan/FoWGApZ8qX15nnSDXU1Dcu+mHidMzDbJAMhf7g+y4Mg/EvXykiHjT0TuC24L+6bHBGE46wsH5hILpeZC+PjBk0lJs9pL6JkXJMgBYWMZy2C5b2KkGF+sXwWjAYnwBVxWg9QXj7/ZbkTPEz9ttoitH3M7AsfFTlvVGMuar0NdMFrCmwp7/W8dIQwrxcOAwrRMi4pCUjOP+n7Beno2bb7etYGUfwm+d8DlrzSatWB0cnx6+VWUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+lAemjlLQcrKcj5gWcyOOMYoCl6MuVbzN6xDrthbms=;
 b=Ng8G07y9cOb+n8Al1ZC50yOOk+yEqkkIYW1dRp9IZlW3zi17e04wD9dtNgGsUmPI41JF6Mhd60lD/tc4LCyL54BhcvE5iaTNftK9xD6AyLLXzRtWdMJeUamazT/0B0vRJZdIViCxSGP4V8i11TxH6oVs/OGcdS48bPMSxJgKXms=
Received: from DM6PR17CA0023.namprd17.prod.outlook.com (2603:10b6:5:1b3::36)
 by SN7PR12MB7935.namprd12.prod.outlook.com (2603:10b6:806:349::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 18:13:57 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:1b3:cafe::b7) by DM6PR17CA0023.outlook.office365.com
 (2603:10b6:5:1b3::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.24 via Frontend
 Transport; Thu, 27 Jun 2024 18:13:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 27 Jun 2024 18:13:55 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Jun
 2024 13:13:54 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 27 Jun 2024 13:13:54 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH v6] remoteproc: xlnx: add attach detach support
Date: Thu, 27 Jun 2024 10:29:38 -0700
Message-ID: <20240627172936.227439-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|SN7PR12MB7935:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d8e6e62-d7a5-4973-4f73-08dc96d4e886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KAq8BA8a/sGDxdT7oflEKpDrpiXSmAgVPjmHiKlTuA/HblUER1bvYN5dkDvV?=
 =?us-ascii?Q?6pF5+udCsM1TpgZbOa+/RnHdxJ2u1B7juL2IvDH4v3fQ/pcvtSAf8dP2H1GL?=
 =?us-ascii?Q?+A2Mdfnohl8r+OQEh5rXXhUmO/mSxW4iU4hDkWaZtuOY7k+jsnOueEMzy7gT?=
 =?us-ascii?Q?waoY4wFdbXCkWGoMq0Nz2JDfmmD9GjzVMCvhMijyGek9XKBiulVPZAilRs3G?=
 =?us-ascii?Q?H3zc+wek8TBpSVNOcNRF29FQ2TMQl54zDaEnVbRqNE4C+I3xnCgpKIEz4ORy?=
 =?us-ascii?Q?EwbGSA4Pj9LXJCaEh999Raxqowl08RA/bhwvpQbZfmeIkqiW2RqfbjgxirOT?=
 =?us-ascii?Q?21WLvO25ZvFAwm/yANZ5ESraC8IY6wTO4eRH/9elKW17s4252j8dDWeb/16j?=
 =?us-ascii?Q?av4nuU0N2rBPjA0gsvR4R41zHDFy221OC5lvnnp+cq/LHf1pBz3ILssdHyRY?=
 =?us-ascii?Q?YYevs3JRdRIKJpU3OAJByvWAEfONsN7Tw7E5oEEka1vpvfIwUVvaWcZQbOo8?=
 =?us-ascii?Q?5BUecp0I0cqDRMUpxTHql5qjFUDme4OtUaNh+xvm9mfGgwgPVTUsZ1pABVnr?=
 =?us-ascii?Q?xUFZV3izBg5icok0GBIYbryz0QaXy4shmLMdLo7+HVqmqxNrIDTq+WVHUWy0?=
 =?us-ascii?Q?AVa/LhdhcnC2byu3xHDIphA69xTuiF7CK/9jQPPuPkCkC+Q2dMBS/P+l5oi1?=
 =?us-ascii?Q?2t01RtVog5CVYMcCFHiA8LF+jQlOVDtkuYlLV+Dvtnp9GFrhNF65xd3qmZ8i?=
 =?us-ascii?Q?td/2S+VHuoZ9ESqAyG6ea1lJ5LBGb5EPO/LucfPoawy0lUQ49MKd6AoBuXFZ?=
 =?us-ascii?Q?hJ52RoyqhsTZhwjikm6vLxIOQ1yCX1XvD32/iyWdN5JFXCOqD8mzeaOZ9cMY?=
 =?us-ascii?Q?iYa17UwDXwN3bJEcSlZicr+aF9RoJQIKp16nDXr4xMtdpEUS72JNlRL5jDRp?=
 =?us-ascii?Q?dcNXBPdEdcgRqFiUZCkcsWGh2cxka359+qBRxA8BbQGqFYI6WeggiCgBW4zD?=
 =?us-ascii?Q?EzTTU+UiHOogi+cQKjxevlXe3tobcLbWTl+IDJRfun4IBRmq047rTmZoB0j+?=
 =?us-ascii?Q?ZthQWDWFtEfj/UGOyzzUMy0lfcsb1IWnuk0CQsVZqvncRF1nOxP5H+w7GY6e?=
 =?us-ascii?Q?7lns2l/fNgvzLm7TrdFqEbKc8/2TvCeUbpKMAIkcrbpZGhfZI/sRo4IbfzGk?=
 =?us-ascii?Q?sStwN0TT5rJiXPi4jrRQorBMYv6/NMmVwaRO3JGHJOSzio+q3UUrvgq/9mim?=
 =?us-ascii?Q?Ijd50+81lGhrnwR0nH4a/wH7F2KjUip+iwhNWUFZi1QpIJbzNOTGthf5aTOG?=
 =?us-ascii?Q?ldYrxSmx+vwrzsVA036zfGESH90vCMOqQM1ckAesYeS5uTJkdhSAC7o053Qt?=
 =?us-ascii?Q?6L9ycitBELNP6UFpQvLPmP15DV1giBgl0KgtZ/1FmFm/J7YQvNYFNm1qYtrf?=
 =?us-ascii?Q?vdVFt8yVwtLvrqo1QHtg631pygAp/PDU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 18:13:55.7023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8e6e62-d7a5-4973-4f73-08dc96d4e886
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7935

It is possible that remote processor is already running before
linux boot or remoteproc platform driver probe. Implement required
remoteproc framework ops to provide resource table address and
connect or disconnect with remote processor in such case.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v6:
  - Move rproc state check to add_tcm_carveout
  - free node reference using of_node_put
  - fix iounmap use

Changes in v5:
  - Fix comment on assigning DETACHED state to remoteproc instance
    during driver probe.
  - Fix patch subject and remove "drivers"

Changes in v4:
  - Move change log out of commit text

Changes in v3:
  - Drop SRAM patch from the series
  - Change type from "struct resource_table *" to void __iomem *
  - Change comment format from /** to /*
  - Remove unmap of resource table va address during detach, allowing
    attach-detach-reattach use case.
  - Unmap rsc_data_va after retrieving resource table data structure.
  - Unmap resource table va during driver remove op

Changes in v2:
  - Fix typecast warnings reported using sparse tool.
  - Fix following sparse warnings:

 drivers/remoteproc/xlnx_r5_remoteproc.c | 151 ++++++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 84243d1dff9f..596f3ffb8935 100644
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
@@ -73,6 +77,26 @@ struct mbox_info {
 	struct mbox_chan *rx_chan;
 };
 
+/**
+ * struct rsc_tbl_data
+ *
+ * Platform specific data structure used to sync resource table address.
+ * It's important to maintain order and size of each field on remote side.
+ *
+ * @version: version of data structure
+ * @magic_num: 32-bit magic number.
+ * @comp_magic_num: complement of above magic number
+ * @rsc_tbl_size: resource table size
+ * @rsc_tbl: resource table address
+ */
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
@@ -95,20 +119,24 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
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
+	void __iomem *rsc_tbl_va;
 	struct device *dev;
 	struct device_node *np;
 	int tcm_bank_count;
 	struct mem_bank_data **tcm_banks;
 	struct rproc *rproc;
+	u32 rsc_tbl_size;
 	u32 pm_domain_id;
 	struct mbox_info *ipi;
 };
@@ -557,6 +585,14 @@ static int add_tcm_banks(struct rproc *rproc)
 		dev_dbg(dev, "TCM carveout %s addr=%llx, da=0x%x, size=0x%lx",
 			bank_name, bank_addr, da, bank_size);
 
+		/*
+		 * In DETACHED state firmware is already running so no need to
+		 * request add TCM registers. However, request TCM PD node to let
+		 * platform management firmware know that TCM is in use.
+		 */
+		if (rproc->state == RPROC_DETACHED)
+			continue;
+
 		rproc_mem = rproc_mem_entry_init(dev, NULL, bank_addr,
 						 bank_size, da,
 						 tcm_mem_map, tcm_mem_unmap,
@@ -662,6 +698,107 @@ static int zynqmp_r5_rproc_unprepare(struct rproc *rproc)
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
+	return (struct resource_table *)r5_core->rsc_tbl_va;
+}
+
+static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
+{
+	struct resource_table *rsc_tbl_addr;
+	struct device *dev = r5_core->dev;
+	struct rsc_tbl_data *rsc_data_va;
+	struct resource res_mem;
+	struct device_node *np;
+	int ret;
+
+	/*
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
+	of_node_put(np);
+	if (ret) {
+		dev_err(dev, "failed to get memory-region resource addr\n");
+		return -EINVAL;
+	}
+
+	rsc_data_va = (struct rsc_tbl_data *)ioremap_wc(res_mem.start,
+							sizeof(struct rsc_tbl_data));
+	if (!rsc_data_va) {
+		dev_err(dev, "failed to map resource table data address\n");
+		return -EIO;
+	}
+
+	/*
+	 * If RSC_TBL_XLNX_MAGIC number and its complement isn't found then
+	 * do not consider resource table address valid and don't attach
+	 */
+	if (rsc_data_va->magic_num != RSC_TBL_XLNX_MAGIC ||
+	    rsc_data_va->comp_magic_num != ~RSC_TBL_XLNX_MAGIC) {
+		dev_dbg(dev, "invalid magic number, won't attach\n");
+		return -EINVAL;
+	}
+
+	r5_core->rsc_tbl_va = ioremap_wc(rsc_data_va->rsc_tbl,
+					 rsc_data_va->rsc_tbl_size);
+	if (!r5_core->rsc_tbl_va) {
+		dev_err(dev, "failed to get resource table va\n");
+		return -EINVAL;
+	}
+
+	rsc_tbl_addr = (struct resource_table *)r5_core->rsc_tbl_va;
+
+	/*
+	 * As of now resource table version 1 is expected. Don't fail to attach
+	 * but warn users about it.
+	 */
+	if (rsc_tbl_addr->ver != 1)
+		dev_warn(dev, "unexpected resource table version %d\n",
+			 rsc_tbl_addr->ver);
+
+	r5_core->rsc_tbl_size = rsc_data_va->rsc_tbl_size;
+
+	iounmap((void __iomem *)rsc_data_va);
+
+	return 0;
+}
+
+static int zynqmp_r5_attach(struct rproc *rproc)
+{
+	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
+
+	return 0;
+}
+
+static int zynqmp_r5_detach(struct rproc *rproc)
+{
+	/*
+	 * Generate last notification to remote after clearing virtio flag.
+	 * Remote can avoid polling on virtio reset flag if kick is generated
+	 * during detach by host and check virtio reset flag on kick interrupt.
+	 */
+	zynqmp_r5_rproc_kick(rproc, 0);
+
+	return 0;
+}
+
 static const struct rproc_ops zynqmp_r5_rproc_ops = {
 	.prepare	= zynqmp_r5_rproc_prepare,
 	.unprepare	= zynqmp_r5_rproc_unprepare,
@@ -673,6 +810,9 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
 	.sanity_check	= rproc_elf_sanity_check,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 	.kick		= zynqmp_r5_rproc_kick,
+	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
+	.attach		= zynqmp_r5_attach,
+	.detach		= zynqmp_r5_detach,
 };
 
 /**
@@ -723,6 +863,16 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 		goto free_rproc;
 	}
 
+	/*
+	 * If firmware is already available in the memory then move rproc state
+	 * to DETACHED. Firmware can be preloaded via debugger or by any other
+	 * agent (processors) in the system.
+	 * If firmware isn't available in the memory and resource table isn't
+	 * found, then rproc state remains OFFLINE.
+	 */
+	if (!zynqmp_r5_get_rsc_table_va(r5_core))
+		r5_rproc->state = RPROC_DETACHED;
+
 	r5_core->rproc = r5_rproc;
 	return r5_core;
 
@@ -1134,6 +1284,7 @@ static void zynqmp_r5_cluster_exit(void *data)
 	for (i = 0; i < cluster->core_count; i++) {
 		r5_core = cluster->r5_cores[i];
 		zynqmp_r5_free_mbox(r5_core->ipi);
+		iounmap(r5_core->rsc_tbl_va);
 		of_reserved_mem_device_release(r5_core->dev);
 		put_device(r5_core->dev);
 		rproc_del(r5_core->rproc);

base-commit: 8fa5d65ee3f228ad8fb4a2a20cbd8cf7a1fcfcab
-- 
2.25.1

