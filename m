Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0391366;
	Mon,  3 Jun 2024 17:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717435217; cv=fail; b=k1qh2HJV+evzbwRYuZaHx/buA1Y1AF1n7CbPZCQ94V4l9lviY+jgiVjkrAOrWiFFM2UxPMpX3RaitDCMnZ+thFehT/3sK7+hBYq/qMy3ZdL+h+fRW0caJSQ+icqCekIMLbnttq7QM2vspELOnLx8Wve+6Jq/6hSlG9XY/M9TTmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717435217; c=relaxed/simple;
	bh=NOuGWUEomH1uVsYBAzov6xKOyFhpEFC9JkCFvR4UK+I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YEpmOUJZC24VCHTpeQlnQC1AQIMfcigIDGyaze1TivR8nDnSieevyn6JE6vf90MofTgJgUjDktPDXhK3IGNnCZqSFTDqHNX+vV/+uuAaL7/AkDikf46ksncv9bHyhDsqsLtzqNNq2O/nSL2sJuRlSUOJBh9c7Ko21YogPNguNYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ovApsCAl; arc=fail smtp.client-ip=40.107.243.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ovApsCAl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPUa5xiJZnwo22galkYRrhhhlfP1skP/JEchxJ+DMvgceCoWurjZoBn4pMhqpQPg7h1lxCjubb43xyaEtA/cVHQ7Yg0nJhcK4Kvd1bCW1JRd7KQ5d31LzjSt+zoghgwgG6V+oE8pjf6JeH/WNnapXg+lOx9bh6REyPEkB53zuHw2jR2SAkd7y2GMOK5NZJZZ/QdlYpSkS39FB47IibxCSivebCyz0/hPz+Dflucg78HxpbDtrXzL2hR4Q+t4kzXLooFfxedf4sEKGZqBMtyYNgOJ+kKYRdNy1J/Fitf04vZF213peaz+SOtipOelc6gxHQVJ5xDAJ81T7yIR5C+gpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckTC9QEXFNWGn6HgXrxthk26+6Gnxz0KNk4xuzTWRG4=;
 b=LF+lNOsU6gtxHpAC9DxeLu5P94UxNhAHaGm+IpdI7m/PV3X0ydRPi6A01volAs0ZtPmTqdds9zcsx28G5Sx8fvloUxGlWqtkGDBfet5rcMPRfY9IriHIfCHQOhYIIpqnIG+b+D3KTHTJoAFcA82UGdIyZ3me8gom/1lA6wlnZvVwIKQDQoSQzjDxz9+/FRc295BhCGJmPUPaiA98RrU5z1sTD8bLfKs1Lk9uyFRGdh+SDT1m9Hj9Bj+k2VfWEU+365WSzfwYFxmRTejVjNXJFPsj9HYL0AJc6VKVoQlVGCGSi67RFAn1j0Ky5zrkpCs4xHdXDa2mOMMIazHuwF26JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckTC9QEXFNWGn6HgXrxthk26+6Gnxz0KNk4xuzTWRG4=;
 b=ovApsCAlYczXgNllUewdIAJEFHiaETuKzc1gH4Zfyb3u8/4DuIB7SuO/P0MlnlQEV5UzpXxwHDJI9M/ZvjKyw9CTXD8PSXaequGK6D/pzyxVkhdZFfgq4sqbOHi5LgqaiVwKNJ7wLkdjcUxBrOhS22icpDjPhE9lws7Un3srhhI=
Received: from SA9PR13CA0075.namprd13.prod.outlook.com (2603:10b6:806:23::20)
 by CY8PR12MB7561.namprd12.prod.outlook.com (2603:10b6:930:94::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Mon, 3 Jun
 2024 17:20:13 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:806:23:cafe::ac) by SA9PR13CA0075.outlook.office365.com
 (2603:10b6:806:23::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.15 via Frontend
 Transport; Mon, 3 Jun 2024 17:20:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Mon, 3 Jun 2024 17:20:13 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 3 Jun
 2024 12:20:12 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 3 Jun 2024 12:20:12 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH v3] drivers: remoteproc: xlnx: add attach detach support
Date: Mon, 3 Jun 2024 10:19:51 -0700
Message-ID: <20240603171951.905905-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.37.6
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|CY8PR12MB7561:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a7c61ab-d851-49e2-1044-08dc83f16dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?38KE+0eo8aIoTPJc76zsa5G9RZx/ibsYZ1FUfDlHxqkZEBwDOIvbZc9INVHX?=
 =?us-ascii?Q?Zk6BdLexPEFXcjHm6OoRNxSWsm5OeDGzZyaWdq4Q7y62sDy1dM+l3qsyVSAA?=
 =?us-ascii?Q?IgZAGde92OfN8eavcmUNmsV6f/c8RMoAcf75iqZPwAPMhn9BT9Sbj5caKll8?=
 =?us-ascii?Q?iPUxje4fWYf3BE6ubbi/UAdavPt62/K5oaDXod+7Htkk2VubLAeYZYvXLCHa?=
 =?us-ascii?Q?5tl0PElvIRd0e/dqtJ19J1zeMJ1FpWdlDJr3R81wF8wNHKzQRsDjsgQLNtFm?=
 =?us-ascii?Q?EjwIUf0qFO7ZN7dzFCxO9bMK02XzujV+sh52jaGefU+TD8lR2EZXByZdmxjs?=
 =?us-ascii?Q?BRYb07tJOOUhXsJXN1UF9nOilMtV8TQHJ56T/c87nv2ROcniiPjHHyGl6eaZ?=
 =?us-ascii?Q?nqqrl+ZGR19GEgCYcSVqa+ss2NIsxrUASwv8iEj/WSPXFtmlDsPH9yQ0Lxti?=
 =?us-ascii?Q?BXwcVxC4VXMP6BR1FdvvcENZjoKPBmZYhTUCvQh6WYe1azOpMszC6t7ma0hM?=
 =?us-ascii?Q?D5xT/oqEnKEfwJ2sp9W8uMF2zgfhckZjn6BQx33kfyXn6GGuJki5GpJpUcwW?=
 =?us-ascii?Q?tgpRLTMTehhvivv370q3B7x/vtxO6GxH7cVcc+Tlnugq+9PGr3XfcIoslQlR?=
 =?us-ascii?Q?IDsqPEVCLc+uuCiLjlPfnwnVW/LH3jPO8GkHfOc1op0rqt6TJg334EXEsv9z?=
 =?us-ascii?Q?fEKuB0+aaoSbmO1rYmfpuK9Z+dO6Q7ZggeJSgbi02F6BMPGWMAnGrEC5H7lT?=
 =?us-ascii?Q?mZWAV7RAPwriG+1YpHM2yZ5OeKDftk0PgJdEeeDJtM7GAW2gu4n81ap9dXKf?=
 =?us-ascii?Q?CJANvkgVvc3XSLcSSC2ilg5544n4KBLA8CqLnJh4+mCrlKgZ2wMNyZ39lAWv?=
 =?us-ascii?Q?xZzRB0DMJ9BjDpeWSA8S6UPbI1YsNr7vuZk/izN0YZOMYfYpxA3q7dfaLJDb?=
 =?us-ascii?Q?h5ae68ihit2r8oD7rGTwjAumgrVSt9d+0oldOec8+JcIhianQuhAlmfpTHcF?=
 =?us-ascii?Q?x+itZSctMKuNSwLCFhP4zWfXFQMn3bJrBeZlxaZKQ7dcf6WDVxouotiV90Mu?=
 =?us-ascii?Q?ONsLmeM+PCu9XNuYhg6LhzXyKirZOZm08ly+7vzpqSLJ6ygiLgk/PYF4g1ft?=
 =?us-ascii?Q?lKkOdnLZ+YM3+sw9EqrShDl1OpLejTo0VIAyB+g4SuNOL25PssSuD4dc4Pf7?=
 =?us-ascii?Q?foSCN2TjuM6pO8CLEXwGfsSdpBzVI57uY5cIJhAhaiRx2cuhktZ68ltjAVR2?=
 =?us-ascii?Q?GjDsjjx7taf+bfb5i4MA1rBwU+BhfjtoDo7lZUJiLEAJ64YYBh/uLYi9AKv9?=
 =?us-ascii?Q?Osx/Kq6gcePLr/1PHlxLUFFeWdQEgCboM81ir3JvKb9D7zO4ZTyxm/Ncxx0L?=
 =?us-ascii?Q?Foo5Ue6qCNV4gZEpqckmrx5A80IF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 17:20:13.0631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a7c61ab-d851-49e2-1044-08dc83f16dbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7561

It is possible that remote processor is already running before
linux boot or remoteproc platform driver probe. Implement required
remoteproc framework ops to provide resource table address and
connect or disconnect with remote processor in such case.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>

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

drivers/remoteproc/xlnx_r5_remoteproc.c:827:21: sparse: warning: incorrect type in assignment (different address spaces)
drivers/remoteproc/xlnx_r5_remoteproc.c:844:18: sparse: warning: incorrect type in assignment (different address spaces)
drivers/remoteproc/xlnx_r5_remoteproc.c:898:24: sparse: warning: incorrect type in argument 1 (different address spaces)
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 173 +++++++++++++++++++++++-
 1 file changed, 169 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 84243d1dff9f..6898d4761566 100644
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
@@ -621,10 +649,19 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
 {
 	int ret;
 
-	ret = add_tcm_banks(rproc);
-	if (ret) {
-		dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
-		return ret;
+	/*
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
@@ -662,6 +699,120 @@ static int zynqmp_r5_rproc_unprepare(struct rproc *rproc)
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
+	iounmap((void __iomem *)rsc_data_va);
+	r5_core->rsc_tbl_size = rsc_data_va->rsc_tbl_size;
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
@@ -673,6 +824,9 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
 	.sanity_check	= rproc_elf_sanity_check,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 	.kick		= zynqmp_r5_rproc_kick,
+	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
+	.attach		= zynqmp_r5_attach,
+	.detach		= zynqmp_r5_detach,
 };
 
 /**
@@ -723,6 +877,16 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
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
 
@@ -1134,6 +1298,7 @@ static void zynqmp_r5_cluster_exit(void *data)
 	for (i = 0; i < cluster->core_count; i++) {
 		r5_core = cluster->r5_cores[i];
 		zynqmp_r5_free_mbox(r5_core->ipi);
+		iounmap(r5_core->rsc_tbl_va);
 		of_reserved_mem_device_release(r5_core->dev);
 		put_device(r5_core->dev);
 		rproc_del(r5_core->rproc);

base-commit: d7faf9a16886a748c9dd4063ea897f1e68b412f2
-- 
2.37.6

