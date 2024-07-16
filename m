Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66066AD24;
	Tue, 16 Jul 2024 01:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721094092; cv=fail; b=Pf1JdjCuEfqrmsmyEDwU6uRWp1G7Jr73viyCMBtSTZSkIXof4gAJgOC/eADgbCw1q9sU5BL9A1sRt8s64U+1f7sHTBCf5PVHH1dMPLYUIJ5Lcpr8gM61XO3PtQqqXWtbNUbPxCs97V3aHFXG+KbMlDmmbNFBsRRXpa/LW72GPmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721094092; c=relaxed/simple;
	bh=jyASvbKyABRt1xSqhX5gmuu3NHaerhI7KZvWypYi/b4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Dej+c/c0s8Tp17sIrIamt65r6kqUTVUkEFP2SRjVcnuO74KPRnSOK9NecMLkX8zfi8c1mtS5Bzgo7QRVx2H9U5f6BEsbDDuEZSvO6b+gcVox3lox5JUpVveVzyE080f9l3czv0oQrfsuqX6TtuETx1OTibA/GQr5XDsXNZFd5U4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qqNs1RZn; arc=fail smtp.client-ip=40.107.244.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qqNs1RZn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRcB/fuJjHMtg9VX7eta6cPs5fh/VtNK1KSZbE2OSq1VoB+NMuT92fO8KDVsWITH7cqZC44h4xwwl0dYCBXG84izmHrKYD5wDRRFh+gVO3K3oq1xcrDdmIj2xmBpVfhXz3NusR3BB/3O9freh5TFD6CMdobMTvYIUCQXMYkNq2r5cqccqoeBt9F+gkz/9gWbXsgf5N1qZgqHgU87W5kWVPjIVn+OOy9458aojhcP7ULgJiRKWfPEeSp2J9veTI9zpXVK9sajRg3aN6KDVSBz9/hChzleQ7yqRHmcmnMDGcmWsznIX7YoJBufPEFedEsLR2fjBqXHmp0QDViT2SNb0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxVnnacxoevmPdvMWUzBsxqOXKEWbnlxFkCfqRmRX1o=;
 b=PV9EZ++BMPz6cMqDAo5DCLwDsgsu7d0jD9mB024gt08oGnbqRAoq1+hqxfI0aDX4IzLODgkLCRo4nUsdHaD1tGNklwoqlpozvaNlJGyaQdG3n2inFvqcbzu8GskiHZgT168IgvEOTd3OVm6wWYLzi91/IKmDVb7i5VWyXzEteqmWB8mg8uGawO5XlCsVuOFV4vPTS+2v5ybuVHsJ0VNpcMF2obdJZUekBFXnO/TIJ+fMZbEcwWs0O4EpKhItfQM7thY0KmOOlm50P2xSXFLnEGZmiuPiYMNySVk4+hrgywzQJB3VFZz9rzgpGnEKViDNKryaYzhAxbZlPmABlFGE5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxVnnacxoevmPdvMWUzBsxqOXKEWbnlxFkCfqRmRX1o=;
 b=qqNs1RZnkQXB9W2lYplv2cE4PALIm/Er217O/TMCMFOPcLuVyaD/wCg40aHxBJT5KK3ROGHAUx5gjxBVUsuuBmCBnjdnuxOtl5mcn7LVnEpkoU0ZSVNXLN+UqIJSlRRwkRBAsweHdpSbnPl2zp6Q3I3em+/XeFUCkwntKZiWqeY=
Received: from DS7PR05CA0022.namprd05.prod.outlook.com (2603:10b6:5:3b9::27)
 by CH3PR12MB8236.namprd12.prod.outlook.com (2603:10b6:610:121::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 01:41:27 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:5:3b9:cafe::17) by DS7PR05CA0022.outlook.office365.com
 (2603:10b6:5:3b9::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14 via Frontend
 Transport; Tue, 16 Jul 2024 01:41:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 16 Jul 2024 01:41:27 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 15 Jul
 2024 20:41:25 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 15 Jul
 2024 20:41:16 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 15 Jul 2024 20:41:16 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v2] remoteproc: xlnx: add sram support
Date: Mon, 15 Jul 2024 18:39:54 -0700
Message-ID: <20240716013953.1715134-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|CH3PR12MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: cb9076cf-03fb-4b6d-c7b0-08dca53868ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PLtabaXYJVzSqWHj7RhqnA1JqAULJK5I+ujALcdX1UGq4KDzy1Ryef0LWPX4?=
 =?us-ascii?Q?1wAGrFfyCvWSJ/Qzr+GkmefwPr1yzCTfI4aQaQ2I4X2YSAOaNkQsLP0Rg72Q?=
 =?us-ascii?Q?NQAR2Ig5TwANYwqEBt06AaXy35G+9IDeROL7lWLta0lai0yUyzrM2zuZJmeU?=
 =?us-ascii?Q?4Ta41tskAK+vuhaOXAa2aqpbfO06/UoLwgJH5ctRjsZ44gIBg007v92VTf3c?=
 =?us-ascii?Q?miVvkMwqoCB68WUUglEA/jl+fiHdt4aFftP7xVAfkkIDWVXJ402PE8EL0R9q?=
 =?us-ascii?Q?0Z8uYZWg22t0NHccDEyYc/uvSWpd4MJITOEytOrdN2FsWSUtZs8kOBZSnz5b?=
 =?us-ascii?Q?1ghTowWAFcWZheRpEwadgSP8STRUtwppZZrKxrwdoNzdJz4L7UhCyInuec1+?=
 =?us-ascii?Q?Qi6UGhwYtvLMCn5S5nos5U8/IqbwdXk9essSweFvuH5lNKyW1QYPNRoiDLwQ?=
 =?us-ascii?Q?uc5JXtb3p3B8b5ESGDwhSsfIqR6eTvAIHCt3gj6aagj4oAd2Ln2dbDZbqJj0?=
 =?us-ascii?Q?8m3XHw/MUQ/DXX/f2C2PNbDpYxLpWE/ht1CF4BaIizS6hTncFWR+7JEAs1d3?=
 =?us-ascii?Q?ioM9D+KK4qeU6yf9he4syxLgtsN8QVYXwdwjMVzObGi2iNFG+X6yzo+OCE97?=
 =?us-ascii?Q?LB3AHfX8miysJafcZznJZgtdzBlBVOoNPsjcaQ+Kg7bpsIGRwQMC7kiJ199w?=
 =?us-ascii?Q?A4nHmol+C744IZptx2iMhytmsLmrjQmTPlgpKjVatGrPAnDnbFcWYenYRKMB?=
 =?us-ascii?Q?Y2xRIOQz0SOmQoY/M5seSWx5Iv0KweAE6AKtR8TeNFjKKzXjJ9HgTM++64JS?=
 =?us-ascii?Q?f9IDN+FDc4RgCfobnKAEbmPgO7+Xe0f5VRXTMf/kSuVQ1H1h1gs3S0Z1GyQg?=
 =?us-ascii?Q?wpf5suF8Yx3sIc/NTIUXQALUYufqiWTzSU7FynX6TeernoIRiChfahUuIvWQ?=
 =?us-ascii?Q?Vb9qpQjU/7IfnyrQyiW/3Tl4dIfLp53Sd3VHMo61JqsKKccQspcscbtOVf/c?=
 =?us-ascii?Q?TYj5eIzxn8VI0GBACPwZkJFXeo6UqHrgYaAOcRxG9H6nLOxRx04gZ35D9ezz?=
 =?us-ascii?Q?tkoUYwDZh8y/pvqO6UgXPCHcpKYtjvDo/BbjJz23lZilX7m3w+E+58CMrwon?=
 =?us-ascii?Q?xtYIXeqExauMTROHyPWnXawknO1oYitbkWSNAFWpOLVsyaH9R68g+/VRKyPt?=
 =?us-ascii?Q?+0BjXxE4503KR0CPjIJE3zIoqvI3lTNPJzpC+Kl+NJ+QEdWo7U6+EeTJFLBe?=
 =?us-ascii?Q?Bq8wJGQtQfjQv4i+h1lAY1+upYJxyIvkMJImXOC1hIrmxWyloA/2WKpsdyB/?=
 =?us-ascii?Q?82VqeApsSko4yjectd6IjTcVAIKHfX9atjb53WwGxtzuHIH+/AYefIezQ5Lg?=
 =?us-ascii?Q?sakWoxDRjhz49gDj2FW4anYEitHVjJJHAZ1isCR6LpC285PhgG47133Lc+7N?=
 =?us-ascii?Q?V2SMpH0UA0m2HWyOpDCpntMroLSgrkVR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 01:41:27.3545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9076cf-03fb-4b6d-c7b0-08dca53868ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8236

AMD-Xilinx zynqmp platform contains on-chip sram memory (OCM).
R5 cores can access OCM and access is faster than DDR memory but slower
than TCM memories available. Sram region can have optional multiple
power-domains. Platform management firmware is responsible
to operate these power-domains.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v2:
  - Expand commit message with power-domains related information.

 drivers/remoteproc/xlnx_r5_remoteproc.c | 131 ++++++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 596f3ffb8935..52ddd42b09e0 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -56,6 +56,17 @@ struct mem_bank_data {
 	char *bank_name;
 };
 
+/**
+ * struct zynqmp_sram_bank - sram bank description
+ *
+ * @sram_res: sram address region information
+ * @da: device address of sram
+ */
+struct zynqmp_sram_bank {
+	struct resource sram_res;
+	u32 da;
+};
+
 /**
  * struct mbox_info
  *
@@ -120,6 +131,8 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
  * struct zynqmp_r5_core
  *
  * @rsc_tbl_va: resource table virtual address
+ * @sram: Array of sram memories assigned to this core
+ * @num_sram: number of sram for this core
  * @dev: device of RPU instance
  * @np: device node of RPU instance
  * @tcm_bank_count: number TCM banks accessible to this RPU
@@ -131,6 +144,8 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
  */
 struct zynqmp_r5_core {
 	void __iomem *rsc_tbl_va;
+	struct zynqmp_sram_bank **sram;
+	int num_sram;
 	struct device *dev;
 	struct device_node *np;
 	int tcm_bank_count;
@@ -494,6 +509,40 @@ static int add_mem_regions_carveout(struct rproc *rproc)
 	return 0;
 }
 
+static int add_sram_carveouts(struct rproc *rproc)
+{
+	struct zynqmp_r5_core *r5_core = rproc->priv;
+	struct rproc_mem_entry *rproc_mem;
+	struct zynqmp_sram_bank *sram;
+	dma_addr_t dma_addr;
+	size_t len;
+	int da, i;
+
+	for (i = 0; i < r5_core->num_sram; i++) {
+		sram = r5_core->sram[i];
+
+		dma_addr = (dma_addr_t)sram->sram_res.start;
+		len = resource_size(&sram->sram_res);
+		da = sram->da;
+
+		/* Register associated reserved memory regions */
+		rproc_mem = rproc_mem_entry_init(&rproc->dev, NULL,
+						 (dma_addr_t)dma_addr,
+						 len, da,
+						 zynqmp_r5_mem_region_map,
+						 zynqmp_r5_mem_region_unmap,
+						 sram->sram_res.name);
+
+		rproc_add_carveout(rproc, rproc_mem);
+		rproc_coredump_add_segment(rproc, da, len);
+
+		dev_dbg(&rproc->dev, "sram carveout %s addr=%llx, da=0x%x, size=0x%lx",
+			sram->sram_res.name, dma_addr, da, len);
+	}
+
+	return 0;
+}
+
 /*
  * tcm_mem_unmap()
  * @rproc: single R5 core's corresponding rproc instance
@@ -669,6 +718,12 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
 		return ret;
 	}
 
+	ret = add_sram_carveouts(rproc);
+	if (ret) {
+		dev_err(&rproc->dev, "failed to get sram carveout %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -881,6 +936,78 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 	return ERR_PTR(ret);
 }
 
+static int zynqmp_r5_get_sram_banks(struct zynqmp_r5_core *r5_core)
+{
+	struct zynqmp_sram_bank **sram, *sram_data;
+	struct device_node *np = r5_core->np;
+	struct device *dev = r5_core->dev;
+	struct device_node *sram_np;
+	int num_sram, i, ret;
+	u64 abs_addr, size;
+
+	/* "sram" is optional proprty. Do not fail, if unavailable. */
+	if (!of_find_property(r5_core->np, "sram", NULL))
+		return 0;
+
+	num_sram = of_property_count_elems_of_size(np, "sram", sizeof(phandle));
+	if (num_sram <= 0) {
+		dev_err(dev, "Invalid sram property, ret = %d\n",
+			num_sram);
+		return -EINVAL;
+	}
+
+	sram = devm_kcalloc(dev, num_sram,
+			    sizeof(struct zynqmp_sram_bank *), GFP_KERNEL);
+	if (!sram)
+		return -ENOMEM;
+
+	for (i = 0; i < num_sram; i++) {
+		sram_data = devm_kzalloc(dev, sizeof(struct zynqmp_sram_bank),
+					 GFP_KERNEL);
+		if (!sram_data)
+			return -ENOMEM;
+
+		sram_np = of_parse_phandle(np, "sram", i);
+		if (!sram_np) {
+			dev_err(dev, "failed to get sram %d phandle\n", i);
+			return -EINVAL;
+		}
+
+		if (!of_device_is_available(sram_np)) {
+			of_node_put(sram_np);
+			dev_err(dev, "sram device not available\n");
+			return -EINVAL;
+		}
+
+		ret = of_address_to_resource(sram_np, 0, &sram_data->sram_res);
+		of_node_put(sram_np);
+		if (ret) {
+			dev_err(dev, "addr to res failed\n");
+			return ret;
+		}
+
+		/* Get SRAM device address */
+		ret = of_property_read_reg(sram_np, i, &abs_addr, &size);
+		if (ret) {
+			dev_err(dev, "failed to get reg property\n");
+			return ret;
+		}
+
+		sram_data->da = (u32)abs_addr;
+
+		sram[i] = sram_data;
+
+		dev_dbg(dev, "sram %d: name=%s, addr=0x%llx, da=0x%x, size=0x%llx\n",
+			i, sram[i]->sram_res.name, sram[i]->sram_res.start,
+			sram[i]->da, resource_size(&sram[i]->sram_res));
+	}
+
+	r5_core->sram = sram;
+	r5_core->num_sram = num_sram;
+
+	return 0;
+}
+
 static int zynqmp_r5_get_tcm_node_from_dt(struct zynqmp_r5_cluster *cluster)
 {
 	int i, j, tcm_bank_count, ret, tcm_pd_idx, pd_count;
@@ -1095,6 +1222,10 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
 				return ret;
 			}
 		}
+
+		ret = zynqmp_r5_get_sram_banks(r5_core);
+		if (ret)
+			return ret;
 	}
 
 	return 0;

base-commit: d87dbfd31796f810ed777aee4919f211b4a6c7fb
-- 
2.25.1

