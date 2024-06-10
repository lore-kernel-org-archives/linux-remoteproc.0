Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E4385626;
	Mon, 10 Jun 2024 15:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718034170; cv=fail; b=nevtwWfkPicVh8GW5pibl/vPcKkYpJ4um3gvW3aR4ZT2WeVmt4D/OgMOVEyPYtBJa95TdlwQgnssrew8mwuMgXVuFFMvavL5Z32asx+H+QM2ogoU01kQFc3P9eDHal34OgCpR4ZW1DnIapfZUvzfRulLE9Wp8ph1F6wfuHfa1NM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718034170; c=relaxed/simple;
	bh=ttpWnN0qQxQ/dhISN9ShWJ3viUSKcuMGYlRg3J3pKtE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Mq4TDlT4bNYjqd4YD4MBDqRB/zEm3QuwQE1IzDc8Rut19MbOJ7jZammEOF2Gnv1Gx77id2HpsZ2ekKhoXEn8h6JRzWvQTlIIgcB2ONUTDpPFc37cw45LIOphGYeuQW5/lRLtu1UuzaruTBYDwseLyJRUuz8nUJ78+gH1gowZq7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dEao/mkj; arc=fail smtp.client-ip=40.107.94.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dEao/mkj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vt36hTjsG2u1tap1Onl/8RNfBdII6EMD+PIioe/pDo7nNm6jdBRb8VrTdur5GHdcQ+pb7y577Rdr/R89cSivmPhEQ8Hz4jjHau4NeHi9QDP96G8pXwau4Yqe00+odtBTwVepQjtwomsFjxwcRU6c2RLy5aCslB57vfgo9vhdx84ejfneEgBIc3bnASN5AG47hpSxStPNFpfaFmFNvYCt+/r08RdMl2RLCHC/Hvl+lf9wmlBtxM0JmlUg/fnkiRl4Y7o5mcYtGP6vWjqlO0DPHzgWOUYKkpJ3gdtA+3cDYTnV9pMrY0aRyXZXCCkXgK9bph0xPI9fumJz5oB9S2fxEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEDfqlRTFVYX19dpi+UDHynDNGnQCgcz+iSHMe2RG94=;
 b=bET0kXUQ4oCvZDHmqvGxIElTMUQHH5mnVqTuhc+XWMFiGJNogFmmPAMYh7+ZfX5IeR3WWwvQBQ+9zaBDvIVRehKmtGRnRVcUyGCGg53RnoC8SLAFBfRsCupSGQnH1iUVpXLFZ/NZ9Cj71SRAtdnRNPYkR/JEfI88Yzz9mCZpg0fgTIazqKxOa0n9FxgwQCtsTS9JMzJ6FtcPFyabvPwm43Q76uidVjE76yEkIA+YrwkmuBbPs6BK8V+GxYsUN9CH2Fxb8ZxeitdLM/tpIaxpXJOdfWG/llBts29gkFyxjA0oV9tslTIk54F8XnJ/wAXq+kNd5VqTmC4rcmn0kJLaqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEDfqlRTFVYX19dpi+UDHynDNGnQCgcz+iSHMe2RG94=;
 b=dEao/mkjD2FMg7x8mmxfCCMyZWvNTM5RRksHH7rTywC2o/e0mNxcaQYvRM3foCtU0K2XKBvtQUTgefDJ3febDXhuFvWBO7kU/FBtOEgKDQGfPY3B/GblUmLxMwB5lOQ4p1iV+fxa8LiK9/jLsZ8pofyD/FaJEr1eRKUnaP2lt2c=
Received: from BL0PR02CA0012.namprd02.prod.outlook.com (2603:10b6:207:3c::25)
 by SJ2PR12MB7962.namprd12.prod.outlook.com (2603:10b6:a03:4c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 15:42:38 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::e6) by BL0PR02CA0012.outlook.office365.com
 (2603:10b6:207:3c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.25 via Frontend
 Transport; Mon, 10 Jun 2024 15:42:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 10 Jun 2024 15:42:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Jun
 2024 10:42:32 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Jun
 2024 10:42:32 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Jun 2024 10:42:31 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v5] remoteproc: xlnx: add attach detach support
Date: Mon, 10 Jun 2024 08:42:27 -0700
Message-ID: <20240610154227.3104790-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.37.6
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|SJ2PR12MB7962:EE_
X-MS-Office365-Filtering-Correlation-Id: cfd1364b-3e58-4c9d-9da2-08dc8963f22d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3dy1buu1PiK4dZZylF3c+2DzknPTFOiWXSU9fRE0oqTSA8ceeR+EAGLUL4y4?=
 =?us-ascii?Q?GbSokzuIN/GdsHJLE3tMX4NmWwsP390TQGz8jUyWO/otlAdM9Qo1aIss7/yh?=
 =?us-ascii?Q?NZIbX/j21AwCoG3LHDPIlEkcikz1KHy7+UJRq1BQCujlqmuTuv1FyGsNGdlz?=
 =?us-ascii?Q?ajAWj9iWKehhGprkhaWewrK14tWjk4TPSJ07XdLrqmgMsMF4HtrOo7x2CEUw?=
 =?us-ascii?Q?qHLR8JI650BmkmAdEP5GxQMGuTSsrWXiW3A3100eh8FryApWvuM+qBl31rUz?=
 =?us-ascii?Q?eFnZ/VSxtRMkVbsY29kYB1EGXeUy4SfNF8NQx8/vQImKH9bQjElvjgmEpWxw?=
 =?us-ascii?Q?rz5RqkE3/tVkgBZjUK2YndEhoHhA2Zrx1zfUatpCTxDVbLTLeUPe1tKKWNPs?=
 =?us-ascii?Q?ttn1IZ5n18IhNZ7ayREIj029r+Sgf/rS+VnXa8FFRA5ZAXl1ByRe0+i6vqiF?=
 =?us-ascii?Q?vkd0UgokHlsY9kk+law3NE86/DXXOzXkMmDW00zGGwKJGsNY7fcx4bHD2wGM?=
 =?us-ascii?Q?IHgtSuTnb47ONlnxM8tm+b0TU2y8tMWhr4gb8xawTP5N8UrZD30Tr20wrVa2?=
 =?us-ascii?Q?evH7XnDjEWfMeUA+BsEVvlVKy7dgCfpsYnZ7dFEKqwEYGQaP7BU2M278V33y?=
 =?us-ascii?Q?g7BCbVePgoyZ2vYq02jvbs6e8aKjk5AWENLYXgjdwO4UlzuhH41fallKytvp?=
 =?us-ascii?Q?CBV5BGLCZ4GbQM7byGuLqGr49INr7AC9vg1eVNmBX4gQRmy2rj3ZKAl/PaAW?=
 =?us-ascii?Q?2F+TumIZSXHoxuK+Awwszlh1X38l4shBSrRVChwtNZnvDqK9Tt4c/xjJkx08?=
 =?us-ascii?Q?IOdd5kE+qvpWhwXCUA3GU3w2G1F/49Xq/znfwUQZ7cMfDdQQ42q5IxjFykAa?=
 =?us-ascii?Q?+/1oohAq8I3RbOzVSlviDOdjxLAqHh73y02me7zuxNUQLvYfH62JWSLtlDB7?=
 =?us-ascii?Q?8SZ6EqrCgsUdzUK/NAOnCGqcpRhJanzLVW3U4NylZM+r+EzxEAmgsaPrj7JA?=
 =?us-ascii?Q?ve0U6GrP6LK7fMNRV9CRpX6pAyKuqwlCdelDIvfdu4Q4CThkFIw+AI6OQzFK?=
 =?us-ascii?Q?dg+CzwEh5/1JxKaaVQhI1Uc9fNXvcVv8wOl8kHyRJp2oiKbOMIl1O03T4TVF?=
 =?us-ascii?Q?v+S78a7XGTwrKPf8lhVjyRvex7prLq4z+5lbrZ5DCF+LjzD2MI25BhebPk9N?=
 =?us-ascii?Q?HaJhSSlGTadZjA3RY9qwbQp2aGp7ZwXIftL9Quzskb8ZHpyxz0TEgbXq/77e?=
 =?us-ascii?Q?UlLYRgykUPdJdYxfHPLopQ8e9XW6iFGVmPTRQuw2MNx73swCatqUD0c5RUZb?=
 =?us-ascii?Q?pWq5S0aq5U0gW0RhMoJvM7iB4nipD937cKr0VOMfjxEk4LOctGfQaW7Kmt/+?=
 =?us-ascii?Q?1L8bTJF82Zs8HF46vLKNql86fImVw+Z3NU6sx5POBjLRptFTRA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 15:42:33.6986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd1364b-3e58-4c9d-9da2-08dc8963f22d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7962

It is possible that remote processor is already running before
linux boot or remoteproc platform driver probe. Implement required
remoteproc framework ops to provide resource table address and
connect or disconnect with remote processor in such case.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

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

 drivers/remoteproc/xlnx_r5_remoteproc.c | 173 +++++++++++++++++++++++-
 1 file changed, 169 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 84243d1dff9f..6ddce5650f95 100644
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

