Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CB720ED;
	Mon,  3 Jun 2024 20:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717446900; cv=fail; b=YaNpZJ7ImUy9UBe+L2PfDAD3BqoNDHOXaitmZVL3P3MFn4HfvcEry7ot2Usy83Wu7SXaxY9BLg231ZGuGaxnZbRbidg/W+BVokeL7D2cdDblrXjsP8zBrRym5/zSoCm3MBrsnN+jGjDM4R8E7GowLd38Alw/BoRMhen32wC9zhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717446900; c=relaxed/simple;
	bh=2dhypqHUuACvyG/Wq8dzmTcOrZUd9A1rl+PGrY0zpp4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tQJgkkmgf8BPl+sleknviOzIcvbUw2TZOUEDvUWH0yjEAXsxFYXlU0seSwGzlAT/RBaxR7ahSV7i2CWQrRB+B1QynpGFWVrLdXg0ywokpCCdw+YNLWCFFu0K8jXAibznjx8Sio8Dr5LSMABsuDl2ovcFmuEfTtoT3YmKRCkj+Ho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pPc9JVan; arc=fail smtp.client-ip=40.107.220.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pPc9JVan"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMdpk0/paMkcK9cAg0V6Fbpfshx6+j11/IQVKlZeX36UJnzh84m+SrFj1YlgsxNEPX4fV32pc9V/vMMaUgz8Ropmrq9994swkIXOWvxxFCocm9O+IFHemFWvvZvhpUm3AjCAg3QMERldenCjjhNZ6nAg1UBJUu/Q83pTsv0uSxZEg7zcl9V2oVkRrcyGhczCZbsn0cKYuCipeiH22gCoa19HYA/evYEc9uSH6x561zkZ2N0kvq9f04AdkJY0tLLpVH7KqLbajorXOCZRL2olMfac7P/xwCX3HHVIEjODlI8Rd4Wi5rKDPE+wPlzTxGKJJ6/AYlBnbHK2XLUR4+3hmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bge3AnqPlE5lKTHw9SgmPyoH0L5CJu6tvw7UX7pV5xw=;
 b=T4Vv80UT9bP2vFh/L5m+3EikYlvE2sHA02jisxzbl3fDYKer569kNuIcd+Nz79ALkFvRUKMCp60GllBP240+VPkNibmWbzFCyLDlwnQlTFnvH6W48B+fSMDTiUVTJMScuksxAHcxpV3Lt1x6EyJpcb7YmRJBLcAuNBgni+YbLCPIuNfqpSXITwE3EctGR4CTgnBzEOVZPq+czvnVuBvb5zs8pFlHlCire+tWR1mY2klApP0txVsLLlZxMm2cAkcU8hasFIM72Gf8f3vGEBMdSknqBkK0qMAnUkQIuh5x1zlRyLv9VXM8mp3svU8I/WzHhX8+QvfsL6ituQlW1VBdYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bge3AnqPlE5lKTHw9SgmPyoH0L5CJu6tvw7UX7pV5xw=;
 b=pPc9JVanvlHlhhWMA/amAhIz3oXSdBO4YNDkN0s3iqdiV5DYRdVgLMFQ68ZTDuvXKbb9Ls0lASEIbFVzol3Q18XpdIx5fF7UARdBP5UpI83+osD9TIU+ka0jOpHylB7fCGd45bPyPI0TYqsMOlJgPE+ImwQEDq7qcTorKCvklDQ=
Received: from SJ0PR03CA0140.namprd03.prod.outlook.com (2603:10b6:a03:33c::25)
 by SN7PR12MB7132.namprd12.prod.outlook.com (2603:10b6:806:2a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Mon, 3 Jun
 2024 20:34:55 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::9e) by SJ0PR03CA0140.outlook.office365.com
 (2603:10b6:a03:33c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.28 via Frontend
 Transport; Mon, 3 Jun 2024 20:34:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Mon, 3 Jun 2024 20:34:54 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 3 Jun
 2024 15:34:54 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 3 Jun
 2024 15:34:53 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 3 Jun 2024 15:34:53 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v4] drivers: remoteproc: xlnx: add attach detach support
Date: Mon, 3 Jun 2024 13:34:38 -0700
Message-ID: <20240603203437.973009-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.37.6
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|SN7PR12MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: f112cc5f-c5c5-4cff-fff1-08dc840ca081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sR0NtrNAxo/WS9mZ65rJ1S0sGtII4W5oMUI0ntW3MtbXLab73+2h7O5NoJ+f?=
 =?us-ascii?Q?IJpZZryZ6PzY/ElZYCkTYsnFvHA96EI533wFA0jkhGgfyv9PyamocydI++Ir?=
 =?us-ascii?Q?sdg4hylvNUDtVnFBmQlIXwsKO1YYpTXUaVxlSOqsGFMR2tPoJsxYQcDVNsUY?=
 =?us-ascii?Q?Pr0EVNjm+9Y0yoeK1FAfWM1EhscXF5JkM0l30RNlUN+C1CrtRKCpoBEHJk/F?=
 =?us-ascii?Q?I7BZ49DIokSLaITb1hnOhFGDkcqvm2pDj9YCeq8uFrw6fIQqWQVvF89lApSv?=
 =?us-ascii?Q?007PnyEj/6ptd7HteFlHkVVeKI+gXYjkgxreLMuJwLZoN2DEZ4BvKloHEhHY?=
 =?us-ascii?Q?AFNIUiRATFiJJmo/P0z4Fgoeh2GeRTrV15vVPe+uOsYNRDd65jsBhG3KYlUu?=
 =?us-ascii?Q?pyyQDJ+JWsuDd1qCwvFsYYZ1mfommZGoeZhIOBgVWVbP07v8Il4sEccbQAlp?=
 =?us-ascii?Q?2PC7lBwaCqZ0RAxiAtxUPuQrUNELDRbzUF1CtKib793rOMQjlruBK/keZJ43?=
 =?us-ascii?Q?yAEyhbSuKwBk7es2YnEcbpI9DGbTdYL6OidUAKqXZpNq0Pn0gjdmi1E/Wj4F?=
 =?us-ascii?Q?pAiH6DU6qxok03Li7WMr1+rZVdsBGCRGU1JbO29EG8YJNGbzHvleAG9aOnXm?=
 =?us-ascii?Q?+S0HxmymZAKE0u0pSQuduu72lcBg+WwO2ooQT7Fjpo5PDCohsIv3S0wUqpS/?=
 =?us-ascii?Q?Lfd39VdBqFJwU2acGcNA5DCtwIwOi3tbnK1i2DGYHxHYynGUuVlc5axlqp+g?=
 =?us-ascii?Q?JexaJbanxcQpCxu68dmaOsW+rBaXbGOwSp0JNbCJ+jcPJReousft7por649j?=
 =?us-ascii?Q?nFYa0tpAsb2n3kG6Z0HB+MCOaXVJZgHHmh71HhIfaBlBJNBCIYCix2poyiXG?=
 =?us-ascii?Q?ijrgMixgnhRF5R1G2IQASTWFbNfQmkPdWVX7e1/tt9fjq1oEpPpySKY11o3u?=
 =?us-ascii?Q?PsFAI3TfJsp4FamcIAwYw+sAa/xpIVfVj8FQmpIAGDYrRnO0JhPzsoU3D7BE?=
 =?us-ascii?Q?B74OGIO8LSYbsMPKbhrylTqYEXUXne/zzAnDgwxAHOYkvXXC23fzWiw8Q9qH?=
 =?us-ascii?Q?jzNN/p7ogOqOAlEvlIh7pyPgYrIG4mIc0w3CzUyD7j+H1QKrMDuolqYVSUJZ?=
 =?us-ascii?Q?obTEJ73XrUOGodPooCbHVRUOL1RVH3n9jtRaXnCeFs81z6ufsyJBIAv2VlWA?=
 =?us-ascii?Q?Dg+f8mSXEgojnHm/dbi8KKP6DuOD4EC1eFDp6wc3cGsH19/glktT7fNxRVJO?=
 =?us-ascii?Q?bH5ZLAODNV758tbTWiHioKmwnBTEdBe0/siYaTdqe+yc7m5wvX+tt3rY9aWR?=
 =?us-ascii?Q?oyPmKXlcWaOBDuLXjJ6ZzUvWDq7Cq9tLrVSpPgiJWuPENLJNDDide0Bk5jHi?=
 =?us-ascii?Q?KEXZx5JE+GPIpKTLcn4yzG3rb+0i?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 20:34:54.6491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f112cc5f-c5c5-4cff-fff1-08dc840ca081
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7132

It is possible that remote processor is already running before
linux boot or remoteproc platform driver probe. Implement required
remoteproc framework ops to provide resource table address and
connect or disconnect with remote processor in such case.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>

---
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

drivers/remoteproc/xlnx_r5_remoteproc.c:827:21: sparse: warning: incorrect type in assignment (different address spaces)
drivers/remoteproc/xlnx_r5_remoteproc.c:844:18: sparse: warning: incorrect type in assignment (different address spaces)
drivers/remoteproc/xlnx_r5_remoteproc.c:898:24: sparse: warning: incorrect type in argument 1 (different address spaces)
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

