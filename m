Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2076.outbound.protection.outlook.com [40.107.101.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30661BC23;
	Sat, 11 May 2024 00:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715388704; cv=fail; b=K9Bsc0DnDu1pgRZrNMJ8usSEQN43ibOTGK6iA+wYgBqALJZAg5osNhma4CJW4xW+hVqGdcXJPqTSyKyclijAAH0KCOnwtyJmnwddaeoyjhl9Zf7p0QmSgH5RXB+XDfJ6qpwVnY0jBmed8KpWKHw6jmC1RFXvwILDGbuKwtf0eUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715388704; c=relaxed/simple;
	bh=cVJZqCQjEJhn6OQkvk9AEhGNtH+6XdglD80lzgA4QTE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WuvEpBYQpaLdOR08rNUFUNXIXmXcfx1KgV/FAm/C7Vv1haWRN5r9F0phDCA96Gy+zCwIa82RK9KWU81xdY814J4Y5bfBlmRwG5hqy3GOKPt+KGxPPKBerZPcReKSIBB8jFaIWg74Jjsn+Ka+wIFESKYiqBCSjkPFxk6Gw9fb7ac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vb5F+yB+; arc=fail smtp.client-ip=40.107.101.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vb5F+yB+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aztX6vvkNTGijwzag5ujN6oVw8cUrNsecIqTRYp3vYMTH+MbAOtQz68lssb+JyEsBRjtkLNyE7rrkYXUyQzLYaRUpoxQdVOy9pK72SMuq5NpEGAwLO8uZH+wyCRqNuUguQOceGgNUgR2NWQKenLQuG9dEdS/zNPKg1MUuqMN5T0QozpzPcIuHGvmWt0/O3NvPpeulERnmS5AEx/VABV6kDXvc3nOPUrzuKOokAReR8K0gkBNBX1bVEWlKOpMJXZDv+pqLtcKFyhMtn/4slXcZKHFSHbBkd4PAzE20CgKMVu4ilAANgHwbltWymCTOmvjTdqYIKsTzFVNUHINKn7dOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLqraH1LbZAfwnWgbabbJXaISHvZtDduP1Y1XTSLfhc=;
 b=O1tQsCcteKmADDR7/1ENYjNauIfSDQVcxRAYwk3SFuN8ScQ1RdKeEdbxwzofYQjkd0VfL1YTrNPXyxh3/DtmS6mwasObMwUW0zljrFT3tBRU1AEyWj3pGVMdUws3mEQapFsG4RL+n4eApljLdw0D63/tyMCZ+03gKwFsmsxYykFrlvb4Z/sFLRLb0QC3V56wvhjn+cxD75xDq2EI187cE2D8DhuQ3PXy4Pk8kiETFEbxby0nodL3yXfBDwgD4dxmL+rNAdOqu4TiElFyNLyvMPtGSNdPtu7WxGg6cEMaH6XqDPactVGfstxPck+DchzxRHAltpZZ1CB4njIPK/BD/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLqraH1LbZAfwnWgbabbJXaISHvZtDduP1Y1XTSLfhc=;
 b=vb5F+yB+vDEfhynF3XF5VN87eZ+VOQw8lMQmZ4PmxQRN+/h6/faS+IzdnitDb78VdWRHrn4sgr63Z1Ahyjsann8hLJT9pI+DPYJKAl58N5EdrdQQ9EBPuzHir1YNJ2dMdf/95EcLDA+dBu0D4tAgrdsNvr+k7d31QjK6VJUXroQ=
Received: from DS7PR03CA0250.namprd03.prod.outlook.com (2603:10b6:5:3b3::15)
 by SA1PR12MB8723.namprd12.prod.outlook.com (2603:10b6:806:385::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Sat, 11 May
 2024 00:51:36 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:3b3:cafe::9f) by DS7PR03CA0250.outlook.office365.com
 (2603:10b6:5:3b3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.51 via Frontend
 Transport; Sat, 11 May 2024 00:51:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Sat, 11 May 2024 00:51:36 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 19:51:36 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 19:51:35 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 10 May 2024 19:51:35 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v2 2/2] drivers: remoteproc: xlnx: add sram support
Date: Fri, 10 May 2024 17:51:26 -0700
Message-ID: <20240511005126.1240430-3-tanmay.shah@amd.com>
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
Received-SPF: None (SATLEXMB05.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|SA1PR12MB8723:EE_
X-MS-Office365-Filtering-Correlation-Id: b92d6ced-472d-422a-7280-08dc715482c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|82310400017|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b6YV7VBEEp9osJWolaVZaTCZO2Ah55O2vpf22GZfTrF3WSzAVBELVOr1dNNz?=
 =?us-ascii?Q?ebPwdhjy+HrvuHb9QKxafcmWtEd2HKXT3GOqUK9zlqv185/+fWdmIQ2a5WSL?=
 =?us-ascii?Q?HWg87FmIQG+r+1iogxrNMKXMnUuPrudhe4JyFvaspBC0ANQNkjWtDQTUE2Zm?=
 =?us-ascii?Q?YAAHtmJi1ZC5Hh/2nx3bWnLU+wGnqtVJUH+s8x64uHA43SCD8gtiLRlzA1lJ?=
 =?us-ascii?Q?gMm16QsX+46PWy9xioXVWLg6sBwRY8W1XoChFVOXlWj3KXEMr0HIxx/9u8d4?=
 =?us-ascii?Q?m7/ECrJg11oA62ScCaXrMKSml9NISx8xOT5MlyvBlXv9v/UUkxT6yPsgpTPF?=
 =?us-ascii?Q?zEhebBlsg2PVgvqtXk34TtoNpjNFOaxcABp6N9H/SybZlSEiItcSmsZXig8D?=
 =?us-ascii?Q?RpRGTZIdjh5BKXOsoeshB1Etzy7p63rHqa7+HbET4i9l48yd0VMKkoLcPgaV?=
 =?us-ascii?Q?5tDq9ILwK2O9/t4/d83UuQl50QsAqcMkX8URnqrzn02yZ4QwWSP2DYYbb5iT?=
 =?us-ascii?Q?8DYdZEwEzdjDz8K0yLFkWlfCGpZHYmKrxpv+0XfpXlD4RViHlKLNKmPheRvR?=
 =?us-ascii?Q?rqSaKUyVZSS9NhJTO8iOlO90GXnq3ePLGEYLgPvfA4JcHV0ROeQ/fJrpW1zy?=
 =?us-ascii?Q?lr8Fmxu38tqdLQlW9AGqoD7ec3adZ/aWjER0LnyofvHztl638dkA/5Ipj+3M?=
 =?us-ascii?Q?CfuVZ85gGrFfHbhmbCTai+Ifxtzv+P+eiWjjG/1yjL7MbVCqpYdMgICbU3qv?=
 =?us-ascii?Q?Hw6jFqz+fxskTQ8DNSnFpgGUL94pWATAt5tP0qVzpm5VJGewlo0ci5nAHLbk?=
 =?us-ascii?Q?WGXeUIRHxoGy9iWk3k3fhEu0Q27PbCy7xU+YNKxcxXX2kv2e9+y7w/A7Biy1?=
 =?us-ascii?Q?lqmcG0k97CAnRvtg7kXbEdPo60w9PVy8Y2GlFSZUK/vajRVTFRtx0FAHbyQq?=
 =?us-ascii?Q?fxBIJIKOWMGy5N5lfsJq65DJNMWZHSt0QMjdOLeNtswOc9FPsELzZS6kH69x?=
 =?us-ascii?Q?7LQc7WwpP61KlNLZfIBwj9C0LX4Ge9DTweqQKaIKvDhOQYEJtt9HMEzJ4qQg?=
 =?us-ascii?Q?tf09QbyyLNpfptT+D+DIiSRXlG1uX/YFucrUdADcVJ34FfzfX7sHXG7FjQUt?=
 =?us-ascii?Q?fAUKmF5sY44IdRbvQjs0bS9b6BrWOt5HrLY6lR+ZNLMxTLRnuKvnNFyWPFZQ?=
 =?us-ascii?Q?egKU36rB85zbSjV7wkYkYpQOx1bjzPVVeapLOSIX1lhIquX3kFe+8b+jy+ud?=
 =?us-ascii?Q?OB+HrMsd62To7D6iGuOyejTH600NoRhpQZyq/r2ObypUne+f97mjUUeb6mtO?=
 =?us-ascii?Q?1cJa5DCUAtwAs5NyjoRQMv0jDYDjLIcUr4AnyDClfC2Xxcl5cTLCGNhH9Ppz?=
 =?us-ascii?Q?cah5DmOrc8FCOTsuO5fmq2HFOc6P?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400017)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 00:51:36.4196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b92d6ced-472d-422a-7280-08dc715482c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8723

AMD-Xilinx zynqmp platform contains on-chip sram memory (OCM).
R5 cores can access OCM and access is faster than DDR memory but slower
than TCM memories available. Sram region can have optional multiple
power-domains.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v2:
  - Fix integer assignement to variable that also fixes following sparse warnings

drivers/remoteproc/xlnx_r5_remoteproc.c:995:26: sparse: warning: Using plain integer as NULL pointer

 drivers/remoteproc/xlnx_r5_remoteproc.c | 221 +++++++++++++++++++++++-
 1 file changed, 220 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 039370cffa32..e0a78a5d4ad5 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -56,6 +56,21 @@ struct mem_bank_data {
 	char *bank_name;
 };
 
+/**
+ * struct zynqmp_sram_bank - sram bank description
+ *
+ * @sram_res: sram address region information
+ * @power_domains: Array of pm domain id
+ * @num_pd: total pm domain id count
+ * @da: device address of sram
+ */
+struct zynqmp_sram_bank {
+	struct resource sram_res;
+	int *power_domains;
+	int num_pd;
+	u32 da;
+};
+
 /**
  * struct mbox_info
  *
@@ -109,6 +124,8 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
  * struct zynqmp_r5_core
  *
  * @rsc_tbl_va: resource table virtual address
+ * @sram: Array of sram memories assigned to this core
+ * @num_sram: number of sram for this core
  * @dev: device of RPU instance
  * @np: device node of RPU instance
  * @tcm_bank_count: number TCM banks accessible to this RPU
@@ -120,6 +137,8 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
  */
 struct zynqmp_r5_core {
 	struct resource_table *rsc_tbl_va;
+	struct zynqmp_sram_bank **sram;
+	int num_sram;
 	struct device *dev;
 	struct device_node *np;
 	int tcm_bank_count;
@@ -483,6 +502,69 @@ static int add_mem_regions_carveout(struct rproc *rproc)
 	return 0;
 }
 
+static int add_sram_carveouts(struct rproc *rproc)
+{
+	struct zynqmp_r5_core *r5_core = rproc->priv;
+	struct rproc_mem_entry *rproc_mem;
+	struct zynqmp_sram_bank *sram;
+	dma_addr_t dma_addr;
+	int da, i, j, ret;
+	size_t len;
+
+	for (i = 0; i < r5_core->num_sram; i++) {
+		sram = r5_core->sram[i];
+
+		dma_addr = (dma_addr_t)sram->sram_res.start;
+		len = resource_size(&sram->sram_res);
+		da = sram->da;
+
+		for (j = 0; j < sram->num_pd; j++) {
+			ret = zynqmp_pm_request_node(sram->power_domains[j],
+						     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
+						     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
+			if (ret < 0) {
+				dev_err(r5_core->dev,
+					"failed to request on SRAM pd 0x%x",
+					sram->power_domains[j]);
+				goto fail_sram;
+			} else {
+				pr_err("sram pd 0x%x request success\n",
+				       sram->power_domains[j]);
+			}
+		}
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
+		dev_err(&rproc->dev, "sram carveout %s addr=%llx, da=0x%x, size=0x%lx",
+			sram->sram_res.name, dma_addr, da, len);
+	}
+
+	return 0;
+
+fail_sram:
+	/* Release current sram pd. */
+	while (--j >= 0)
+		zynqmp_pm_release_node(sram->power_domains[j]);
+
+	/* Release previously requested sram pd. */
+	while (--i >= 0) {
+		sram = r5_core->sram[i];
+		for (j = 0; j < sram->num_pd; j++)
+			zynqmp_pm_release_node(sram->power_domains[j]);
+	}
+
+	return ret;
+}
+
 /*
  * tcm_mem_unmap()
  * @rproc: single R5 core's corresponding rproc instance
@@ -659,6 +741,12 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
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
 
@@ -673,8 +761,9 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
 static int zynqmp_r5_rproc_unprepare(struct rproc *rproc)
 {
 	struct zynqmp_r5_core *r5_core;
+	struct zynqmp_sram_bank *sram;
 	u32 pm_domain_id;
-	int i;
+	int i, j;
 
 	r5_core = rproc->priv;
 
@@ -685,6 +774,13 @@ static int zynqmp_r5_rproc_unprepare(struct rproc *rproc)
 				 "can't turn off TCM bank 0x%x", pm_domain_id);
 	}
 
+	/* Release sram power-domains. */
+	for (i = 0; i < r5_core->num_sram; i++) {
+		sram = r5_core->sram[i];
+		for (j = 0; j < sram->num_pd; j++)
+			zynqmp_pm_release_node(sram->power_domains[j]);
+	}
+
 	return 0;
 }
 
@@ -887,6 +983,123 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 	return ERR_PTR(ret);
 }
 
+static int zynqmp_r5_get_sram_pd(struct device *r5_core_dev,
+				 struct device_node *sram_np, int **power_domains,
+				 int *num_pd)
+{
+	struct of_phandle_args out_args;
+	int pd_count, i, ret;
+	int *pd_list;
+
+	if (!of_find_property(sram_np, "power-domains", NULL)) {
+		*num_pd = 0;
+		return 0;
+	}
+
+	pd_count = of_count_phandle_with_args(sram_np, "power-domains",
+					      "#power-domain-cells");
+
+	pd_list = devm_kcalloc(r5_core_dev, pd_count, sizeof(int), GFP_KERNEL);
+	if (!pd_list)
+		return -ENOMEM;
+
+	for (i = 0; i < pd_count; i++) {
+		ret = of_parse_phandle_with_args(sram_np, "power-domains",
+						 "#power-domain-cells",
+						 i, &out_args);
+		if (ret) {
+			dev_err(r5_core_dev, "%s: power-domains idx %d parsing failed\n",
+				sram_np->name, i);
+			return ret;
+		}
+
+		of_node_put(out_args.np);
+		pd_list[i] = out_args.args[0];
+	}
+
+	*power_domains = pd_list;
+	*num_pd = pd_count;
+
+	return 0;
+}
+
+static int zynqmp_r5_get_sram_banks(struct zynqmp_r5_core *r5_core)
+{
+	struct zynqmp_sram_bank **sram, *sram_data;
+	struct device_node *np = r5_core->np;
+	struct device *dev = r5_core->dev;
+	struct device_node *sram_np;
+	int num_sram, i, ret;
+	u64 abs_addr, size;
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
+		ret = zynqmp_r5_get_sram_pd(r5_core->dev, sram_np,
+					    &sram_data->power_domains,
+					    &sram_data->num_pd);
+		if (ret) {
+			dev_err(dev, "failed to get power-domains for %d sram\n", i);
+			return ret;
+		}
+
+		sram[i] = sram_data;
+
+		dev_dbg(dev, "sram %d: name=%s, addr=0x%llx, da=0x%x, size=0x%llx, num_pd=%d\n",
+			i, sram[i]->sram_res.name, sram[i]->sram_res.start,
+			sram[i]->da, resource_size(&sram[i]->sram_res),
+			sram[i]->num_pd);
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
@@ -1101,6 +1314,12 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
 				return ret;
 			}
 		}
+
+		if (of_find_property(r5_core->np, "sram", NULL)) {
+			ret = zynqmp_r5_get_sram_banks(r5_core);
+			if (ret)
+				return ret;
+		}
 	}
 
 	return 0;
-- 
2.25.1

