Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675E11B4C2D;
	Fri, 30 Aug 2024 17:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725039525; cv=fail; b=PovDTkI0lMLA9i4DRDCskpis3IvwXxaZd8OFvcZ0PBmcHKVRmc6ibAhMzLN5qgNrorErn5ZkiriKM/OM1YNu5f0uTVNPJS+96GDb2hKwubgmg7J7JOtPR2fwHQHfzvPKe9/Ls34R/YzFkUZokrhg8WvH6qxjs5pq9xz52OqOeFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725039525; c=relaxed/simple;
	bh=Fjxms/JqjF5rxKqGh/GGZZLFq+W51MdU4g5uo64tJJ8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RyyV2nqoIBRvMkcFSdr9mSuJUCJ9aVxOPeXGyfbcOumiPpxZYPRR0AXRUah0+EDj3CrMZHdyy8semeC+vEd9Re88wbF6wLQsniCLDcJxSYKCNMsERDFgyqK6nn3Vc3XOa/Sg61O4zwzgb6mrtb8P51uxRnT6R1qDIijdzV9H99c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ppTFfRVR; arc=fail smtp.client-ip=40.107.244.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ppTFfRVR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxHeNfoo6aiEjSPgm3WMYaWEuzFS/QQHNT9dkOYQgeb19VQlXa2WlTmLu8utan4KihZVLpkuZfJcWvTziX5wfg4gOwpeKAQiIw4e4KbIDeIuVZ6/9Y1FmSNPKV5qZjLUTAhkTWsh4nkWAgPKG3q0UR94YKpqH02pd0Pr9oQoISYHYWcbTFH1yQGxXHlDpH/A7rAX+oCKjJ6LyUfXIhmTMVcyAOvNeL+UN/rXUKkYxI3nvM17VfuFynBchQUihFTEn/5N4LZ593AA3AY4OgyRL3SEmUXpwERrFXbGgd79DrOVsci89GNcgXADTKw3lIGBVVS6+gkFZEWLEYOY2AK+MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DFTA+BhjL20KP3HMRuCTDLqJvUb2S9vW9KeUR4VZ6A=;
 b=DJuQDZlKdwtEEWQO3uQGHbdz6N99S/RQA5mELLJHpCF1JXvkzz4ErCj77qp4wZ9CyohhoIx4l/B6UTQz9bneTfWGYpNJFKgAOWJNsR1NWea/hNXfaaEfBcLCTQrmo6AKXpP1naZ3opJAVCOaDMnFMch0QLICsWw3bkTVc0Tu5dkzfv4Y6znbnfnCzbqV35O4Zc8vIfewqxjWKXILz2/PB4YSlWJFirT2UXVHnO2tnze/Kb9s2EK6d7j1jVGxgLBRGSwf+eyPYiwDOpGseW5zJ4Lrsv3AjoP1CbfIHZekdvEh5BeH+sawQYgAK4YJ6KSk14MJ9J5xmsVI6O8QPmI3Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DFTA+BhjL20KP3HMRuCTDLqJvUb2S9vW9KeUR4VZ6A=;
 b=ppTFfRVRB2UrjvhJB/I5RK54JQLW3gmdvTiR8GCo8XIblyKRO23aVBf48lojJXe0ub9tQQW2F9VSwsWNRiuAKFz9C9HXhASgKYCFHC1hvdcJY18sg9EbEt+jj5At30U7rtIlZfYojZII+kugmRKDp6RgajEdH7yxTq6MdQ/hl5o=
Received: from CH5PR04CA0010.namprd04.prod.outlook.com (2603:10b6:610:1f4::18)
 by DS0PR12MB6488.namprd12.prod.outlook.com (2603:10b6:8:c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 17:38:38 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:1f4:cafe::fb) by CH5PR04CA0010.outlook.office365.com
 (2603:10b6:610:1f4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20 via Frontend
 Transport; Fri, 30 Aug 2024 17:38:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 30 Aug 2024 17:38:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 Aug
 2024 12:38:36 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 Aug
 2024 12:38:36 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 30 Aug 2024 12:38:35 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v5] remoteproc: xlnx: add sram support
Date: Fri, 30 Aug 2024 10:37:36 -0700
Message-ID: <20240830173735.279432-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|DS0PR12MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: efec7b8a-b6c6-4bf0-4243-08dcc91a9492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u9XefQV9QY99hYBBGjgzqun1+0Yzopl/2W2ttRN/HOfnphbIc5W621K9ocvs?=
 =?us-ascii?Q?H8tAEHVxXpkSTbbKcDF/4zWhdu6L74MGiri787H5utDJpvXWxJ5JfOAtQUWe?=
 =?us-ascii?Q?PDHAijqAs8wYEFKKYBSkW79OQWaWLfRL+itGFJR7tNNVUj/rrFGrzmKzelrk?=
 =?us-ascii?Q?U2SISuJHe3hkd3VBnZqtSv+NHjj+/qIJGms3DuTTJqUO1mWfmItHSbvFI5xF?=
 =?us-ascii?Q?ScVLwTfFGWW5JnLGvBNrZLGChL5i5tv6rqXPuRAIeQyo3vdvQXf87bhzU5sO?=
 =?us-ascii?Q?KMWe5vfLZyuKCcA+lr7shasY7dARpcXuqt8UDv3rISs78HRH6NbvXsX4GK9y?=
 =?us-ascii?Q?n3Cx9qAto0OCjMGcI1x8gf5sr0EvivyiVKshPOJitaibgalveY4r7Y6p+b2v?=
 =?us-ascii?Q?a2Zoy+NassiQPpNzKiQwK99yChPu11E6HNgkezhldOmTSL6oEi+0DTs/WQx+?=
 =?us-ascii?Q?AKOrzC0KP1kGse+bngyaPzXCvY7EUupb70bkvPJV3+wzlby5s0Na9k4kKp9i?=
 =?us-ascii?Q?Wgws9OkmWPIJ9mdWFh4abdnh3Fbkw8lnpdv7Je4DPqnSdJ8NOrJbRgFyVJhS?=
 =?us-ascii?Q?O1ZgqzpLYChN+YnRxZ8pE21GsdKvQsqoddLQJ4BYKsbDYMbIf7nVqtETvLEW?=
 =?us-ascii?Q?McrTZTnzrH1LnTlLg8N2nnkFR83DBZyBOUU6t6zMbF+PIZ4/sui31DnYtRA4?=
 =?us-ascii?Q?b6Seg1DY74XJ+dQjNVRS7q9Mif5VNVj1rz8CRNB6q1PgH0vR7CeICE75PRlo?=
 =?us-ascii?Q?U9xK3hgzoEe3rafvA9xv8EjhIggppiJau4eC8AalOiHaM3P9uBFZqumIgDQH?=
 =?us-ascii?Q?5p6pFCqVr5ne2/Q7IashNmrrGS1RqfUC4ZLxAnll6L2arV98Z8bC23K5GR1n?=
 =?us-ascii?Q?FRN4xAyh1jd0I+CNGHDfWd4g0VoUUSg5VhekXVLljlGZnTvgekSrMhMIB96k?=
 =?us-ascii?Q?K3zWE+xteof4TdVEewvpd/utqnEOj+qfSs8g8zssl2rE7jDjWXPT7iCgvC7W?=
 =?us-ascii?Q?c2Jw+d3GCiOI+gaDzTCpzNsK4GxIzeerPUci3XoKT3V5YvxJp19SlHA149Qb?=
 =?us-ascii?Q?RIuNLP5oxCGR7DGPHmhxX3ttPlZno4cbEQ8zZ12pAVCANsaoG/iGnnVkZRjK?=
 =?us-ascii?Q?DrWP20zq47gDBeV0aYQxgmF0xyQ7MZ1NMzxKPjFPZnahef3hZR407OwYM5N1?=
 =?us-ascii?Q?GftXLfhO7XVjCjh/hO0J898WiMwe4PnVhmEeSt//EhDjsOUDUtSR/xE13WTj?=
 =?us-ascii?Q?Qt0nJBQ/gtVXdl6m+6qY+5/8Evx0FiW2FG7rITyUV1w8j11uUXWP48uYN7P1?=
 =?us-ascii?Q?zawkLmIIyv8IK9DhTQrLzzpDT2b6eMLOr/TyJbAFM7VlkjRDAVsn6qNVN/pU?=
 =?us-ascii?Q?v7TLorjnfMrj6MzeCS6OLtHB6gpNYYK66e/Tkfn6Kswj1w1ll1PzJRlM7D6d?=
 =?us-ascii?Q?PbZT/ArKk5ZqKwi+NlwaInzzPypgyGUG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 17:38:37.5432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efec7b8a-b6c6-4bf0-4243-08dcc91a9492
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6488

AMD-Xilinx zynqmp platform contains on-chip sram memory (OCM).
R5 cores can access OCM and access is faster than DDR memory but slower
than TCM memories available. Sram region can have optional multiple
power-domains. Platform management firmware is responsible
to operate these power-domains.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v5:
  - remoteproc: xlnx: remove genpool use for OCM sram

Changes in v4:
  - Free previously allocalted genpool if adding carveouts fail for any
    sram.
  - add comment about sram size used in creating carveouts.

Changes in v3:
  - make @sram an array rather than an array of pointers
  - fix of_node_put usage to maintain proper refcount of node
  - s/proprty/property
  - Use gen pool framework for mapping sram address space.

Changes in v2:
  - Expand commit message with power-domains related information.


 drivers/remoteproc/xlnx_r5_remoteproc.c | 135 ++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 2cea97c746fd..af4e0e53dc9d 100644
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
+	struct zynqmp_sram_bank *sram;
+	int num_sram;
 	struct device *dev;
 	struct device_node *np;
 	int tcm_bank_count;
@@ -494,6 +509,45 @@ static int add_mem_regions_carveout(struct rproc *rproc)
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
+		sram = &r5_core->sram[i];
+
+		dma_addr = (dma_addr_t)sram->sram_res.start;
+
+		len = resource_size(&sram->sram_res);
+		da = sram->da;
+
+		rproc_mem = rproc_mem_entry_init(&rproc->dev, NULL,
+						 (dma_addr_t)dma_addr,
+						 len, da,
+						 zynqmp_r5_mem_region_map,
+						 zynqmp_r5_mem_region_unmap,
+						 sram->sram_res.name);
+		if (!rproc_mem) {
+			dev_err(&rproc->dev, "failed to add sram %s da=0x%x, size=0x%lx",
+				sram->sram_res.name, da, len);
+			return -ENOMEM;
+		}
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
@@ -669,6 +723,12 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
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
 
@@ -881,6 +941,77 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 	return ERR_PTR(ret);
 }
 
+static int zynqmp_r5_get_sram_banks(struct zynqmp_r5_core *r5_core)
+{
+	struct device_node *np = r5_core->np;
+	struct device *dev = r5_core->dev;
+	struct zynqmp_sram_bank *sram;
+	struct device_node *sram_np;
+	int num_sram, i, ret;
+	u64 abs_addr, size;
+
+	/* "sram" is optional property. Do not fail, if unavailable. */
+	if (!of_property_present(r5_core->np, "sram"))
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
+			    sizeof(struct zynqmp_sram_bank), GFP_KERNEL);
+	if (!sram)
+		return -ENOMEM;
+
+	for (i = 0; i < num_sram; i++) {
+		sram_np = of_parse_phandle(np, "sram", i);
+		if (!sram_np) {
+			dev_err(dev, "failed to get sram %d phandle\n", i);
+			return -EINVAL;
+		}
+
+		if (!of_device_is_available(sram_np)) {
+			dev_err(dev, "sram device not available\n");
+			ret = -EINVAL;
+			goto fail_sram_get;
+		}
+
+		ret = of_address_to_resource(sram_np, 0, &sram[i].sram_res);
+		if (ret) {
+			dev_err(dev, "addr to res failed\n");
+			goto fail_sram_get;
+		}
+
+		/* Get SRAM device address */
+		ret = of_property_read_reg(sram_np, i, &abs_addr, &size);
+		if (ret) {
+			dev_err(dev, "failed to get reg property\n");
+			goto fail_sram_get;
+		}
+
+		sram[i].da = (u32)abs_addr;
+
+		of_node_put(sram_np);
+
+		dev_dbg(dev, "sram %d: name=%s, addr=0x%llx, da=0x%x, size=0x%llx\n",
+			i, sram[i].sram_res.name, sram[i].sram_res.start,
+			sram[i].da, resource_size(&sram[i].sram_res));
+	}
+
+	r5_core->sram = sram;
+	r5_core->num_sram = num_sram;
+
+	return 0;
+
+fail_sram_get:
+	of_node_put(sram_np);
+
+	return ret;
+}
+
 static int zynqmp_r5_get_tcm_node_from_dt(struct zynqmp_r5_cluster *cluster)
 {
 	int i, j, tcm_bank_count, ret, tcm_pd_idx, pd_count;
@@ -1095,6 +1226,10 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
 				return ret;
 			}
 		}
+
+		ret = zynqmp_r5_get_sram_banks(r5_core);
+		if (ret)
+			return ret;
 	}
 
 	return 0;

base-commit: 057e5c17e29fe67fae4c2786d558c31fd3b106ba
-- 
2.25.1

