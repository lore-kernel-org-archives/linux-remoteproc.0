Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744F017335E;
	Mon, 19 Aug 2024 17:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724087479; cv=fail; b=kQ8mFfkJQ+i9tbuIiOh8JVZ9Yo7N1JuqSA+yGuGwCvb/tShgklzfW6ExyY/6Ulp59XNPrugRh9aQbk7MsaprWkXHbU4akKB3tiy4phyhjJkwpflhfUZtyMH/pUD7yuIRsBZz47i/eSJtMp/uORWHwInaOOjhJM27UocH6nSQP4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724087479; c=relaxed/simple;
	bh=pjbgv4dUNAcOsjDKjQkS7t+1GkVWCt2wECcQuLzo71A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HS+iv7dI+BVIYRxT/kGe+Z2eawaenY09f3YR+LB4O4vZdhIaBn42hFoqlfbKXVXtbepdouVUZ0YymdftnkbU3S68ZEJch/CvR/WVg8ZSGRLE3fNadmnXTC3FS/UfhWht685xSH4GQOH7Nh7RGuVQq7jfIylFlIR8NLodJUI+vj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WpcSqYq7; arc=fail smtp.client-ip=40.107.236.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WpcSqYq7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THfS2ZXo8Xo1K9KDstx0e0RwoQn0l5KQGnHcsyf/LJdUABvO1qNeet+sYDzu/P2BOB+W2zwKG19mnzaA/3/NeROcJs0qcyB6Ef4kwJbTCSeTPMeXgJw4pa/VllQv8iEypOcDyLOCw0tNlZEIpInLtpt1Dw4tDqunti3VkAmMAeBGh/mBqMBLBu9dDxhf9NSfkggWaEBWxIhyaqoGJwa/PG/GqKymimEpQCaj3Ye+K7HJNVBzxosvMBo2xwGfv7jYW9xGl0W1Pnm9XWAKdmW7/2dIWmsLxzPULNOlxPQghUnTMU3sOtZ0EBV5wQC0EnNy3QPQwyZ5R6+piFTzh/747Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zcp0/hZ2aVSu17/K24KOVs0eMgbfeVh73rdfRWo3vfw=;
 b=l94bZxoi0STwcimq9Kp/3h7B2BMrbuZuGg2qEJscLWYhNUfU+FuLlXKhkBQvb+cWMccymB8dkQpvEGpgG4VZcJGN5+oBe1y6fuZOe0+DrF8dv++qSx8CLaJ9qB8G+vwSDAF0KX2VGVLaCMYG7wuFfmcdSzNbX+KQAawvZnOBJj0xQBRcGLPT4mRTfaMMEhYB233abwxkQLhxksm1enrQp/aaxxr6zfMbPSP2aQNCfk52l/PVfOX57qFYJijt/0j0M3ATDV6BObZeAHOh4/0CLOz/eL1IuGSssE5lvcrHxt9wfiV4GVpq4q+veeedB49qCDY4YudQhz+Dd0RW3a2pyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zcp0/hZ2aVSu17/K24KOVs0eMgbfeVh73rdfRWo3vfw=;
 b=WpcSqYq7MLjpodFuBcYdy1nMvQvsKDBPtIXapFTRhftUPJ447HJhnzOhwreRjo/i5Y5SG0XogudhvASa9TeqxxxfF2FNXLgHMJQtVqbopsJZXUpg0B7HD1HBAdWPbzlDw4Vxycz+h5YIwtjgduj5ib8WVciAfkIUQocpxODivpI=
Received: from SN6PR05CA0008.namprd05.prod.outlook.com (2603:10b6:805:de::21)
 by IA0PR12MB8351.namprd12.prod.outlook.com (2603:10b6:208:40e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Mon, 19 Aug
 2024 17:11:04 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:805:de:cafe::c7) by SN6PR05CA0008.outlook.office365.com
 (2603:10b6:805:de::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13 via Frontend
 Transport; Mon, 19 Aug 2024 17:11:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 17:11:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 12:11:03 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 12:11:03 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH v4] remoteproc: xlnx: add sram support
Date: Mon, 19 Aug 2024 10:09:38 -0700
Message-ID: <20240819170937.3666806-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|IA0PR12MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: 88fca1b5-79c0-4b19-39a5-08dcc071e874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u7Y9JmmyORfmfcpVgB5tprqRr3/2Xnt89CUTxVnzXFTl6459WBUBFB+TpuxE?=
 =?us-ascii?Q?RaS5Bnyare9StiZvqb7zf31h15YLQyPQh4u/BLKcD23Dfy3qKczg3bOEvC88?=
 =?us-ascii?Q?gDHjPuiyPrt7xz3NogDW9Ib8qRHc3TUbzClQmKlET0EWyabizIgVdJxkJ4mJ?=
 =?us-ascii?Q?eeIRsx7pNMwhny8+pKUV5ZAOKy1mMbsTw8UbNFNBv4mI4ps3yvU6hPgXU5uC?=
 =?us-ascii?Q?Ywd4DH2yr56vK3B6oUghWn6l3juA9yFuPR2GtzQ1Zk0gfuqt7GVM8kYOAIJC?=
 =?us-ascii?Q?jfl2+PKuWR9slWOShhaSpr0+FX5Yi13CejTYn+UJSCctEtDUoIGPvSb278zs?=
 =?us-ascii?Q?mmYisSHoHELy0jgVqJO+m1zZT5HWWsIZW/fsKow582YmhfHIk9/633ADCzmG?=
 =?us-ascii?Q?cx0Elr5W6dmaSgJtdaF9ygcPArg4laPX2T+0WRSaDjMit7h77fMgMFfVzWhw?=
 =?us-ascii?Q?GdoQnUMWRvmEtRPWUpyF08LZQHEjBbxObMMsEJt8ODVWSnu+4HjrRD1OkAXL?=
 =?us-ascii?Q?D8LsZEMJXhjMkEQPupYH0LDsedG84jVqI4eqgXmqACTLccyXePePEPy8PaQm?=
 =?us-ascii?Q?YVH8QfD2BaiBOtAxaqBAbOVecBeJB5lvlbaRTlMTi3FAoAenY1+VhcW7o80s?=
 =?us-ascii?Q?UAMaG1+D4hDDE7xzAKO1QnO9db3PKjO9OhWQoZZF8IPv0C03KQTmt/Uqbqn6?=
 =?us-ascii?Q?oqOP9nbPRhc6fYpBcLGp43HUvetLUO+oYUCpinLVRm+H2NhS0bBRmTEXUrEe?=
 =?us-ascii?Q?0Od/aVxz2/tRS5UBW8hawQXwx7NwhClu8/advLdGfVNoHCe0Xf/jf4e71tHV?=
 =?us-ascii?Q?BQGrcVEWeV1hifq9mcGCB308I5kg5Z/R5VJCVN4VT+T5MrDUuP1rT96iJgEY?=
 =?us-ascii?Q?ZKBJTr/4aHrBGSbgwKhQt6OobsPIzsViJIf/R2pU7V4wzj24akoa6lNQfeWQ?=
 =?us-ascii?Q?FGHVBT5h2HvgoslLYOYjl43WCn8hvw4vQWnU2Tjno0e/HjCm+ecY+A1VLg4Y?=
 =?us-ascii?Q?1HnAMgsta8nU1hmffZ1Q2oVx97SaYRRSgQupC0DmLPUGUjjdE7M1oL9yBx1O?=
 =?us-ascii?Q?zrK4CMQbuhLyoTdQ/ui0nfEIrF5x+Lli6ZEoBRHLtgKC9EzFoRVLFB1fnpRi?=
 =?us-ascii?Q?iTALKrMaJ88MgkCAagytdLfqlQKCtzFuc5Ln+DUB5yuNCOgKt7ySCZxmZG4N?=
 =?us-ascii?Q?zKwqZcSmtQFDX/+HcfTznEe5FunV+mg6cglKc9+LxACk6AXeK6kYVpR95lvG?=
 =?us-ascii?Q?rlgI8/vI2GvyhK0FD/tAMrESS0krRU0kga7k4PZBQNj9xvpiOZqqogzxzuvU?=
 =?us-ascii?Q?d8qr+TeTvvtc8eE9+R0jnPIFuGnNi/1n/1LFLV9yyLaRsVn+hLXbOXi5Wdjl?=
 =?us-ascii?Q?RjS5E41sBeL5f55wqKiOfYlly/meIaIkH3Nrx2MUGcbyWZC0AbF92YioFi7p?=
 =?us-ascii?Q?+G8TFl4ws+YeuYu9BSOfSpBzdGdqvexX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 17:11:04.2755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88fca1b5-79c0-4b19-39a5-08dcc071e874
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8351

AMD-Xilinx zynqmp platform contains on-chip sram memory (OCM).
R5 cores can access OCM and access is faster than DDR memory but slower
than TCM memories available. Sram region can have optional multiple
power-domains. Platform management firmware is responsible
to operate these power-domains.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

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

 drivers/remoteproc/xlnx_r5_remoteproc.c | 165 ++++++++++++++++++++++++
 1 file changed, 165 insertions(+)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 2cea97c746fd..6d2ac7b85c8a 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -7,6 +7,7 @@
 #include <dt-bindings/power/xlnx-zynqmp-power.h>
 #include <linux/dma-mapping.h>
 #include <linux/firmware/xlnx-zynqmp.h>
+#include <linux/genalloc.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_client.h>
 #include <linux/mailbox/zynqmp-ipi-message.h>
@@ -56,6 +57,21 @@ struct mem_bank_data {
 	char *bank_name;
 };
 
+/**
+ * struct zynqmp_sram_bank - sram bank description
+ *
+ * @sram_pool: gen pool for his sram
+ * @sram_res: sram address region information
+ * @va: virtual address of allocated genpool
+ * @da: device address of sram
+ */
+struct zynqmp_sram_bank {
+	struct gen_pool *sram_pool;
+	struct resource sram_res;
+	void __iomem *va;
+	u32 da;
+};
+
 /**
  * struct mbox_info
  *
@@ -120,6 +136,8 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
  * struct zynqmp_r5_core
  *
  * @rsc_tbl_va: resource table virtual address
+ * @sram: Array of sram memories assigned to this core
+ * @num_sram: number of sram for this core
  * @dev: device of RPU instance
  * @np: device node of RPU instance
  * @tcm_bank_count: number TCM banks accessible to this RPU
@@ -131,6 +149,8 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
  */
 struct zynqmp_r5_core {
 	void __iomem *rsc_tbl_va;
+	struct zynqmp_sram_bank *sram;
+	int num_sram;
 	struct device *dev;
 	struct device_node *np;
 	int tcm_bank_count;
@@ -494,6 +514,56 @@ static int add_mem_regions_carveout(struct rproc *rproc)
 	return 0;
 }
 
+static int add_sram_carveouts(struct rproc *rproc)
+{
+	struct zynqmp_r5_core *r5_core = rproc->priv;
+	struct rproc_mem_entry *rproc_mem;
+	struct zynqmp_sram_bank *sram;
+	size_t len, pool_size;
+	dma_addr_t dma_addr;
+	int da, i;
+
+	for (i = 0; i < r5_core->num_sram; i++) {
+		sram = &r5_core->sram[i];
+
+		dma_addr = (dma_addr_t)sram->sram_res.start;
+
+		/* Use actual resource size, as genpool size can be rounded up */
+		len = resource_size(&sram->sram_res);
+		da = sram->da;
+
+		pool_size = gen_pool_size(sram[i].sram_pool);
+		sram->va = (void __iomem *)gen_pool_alloc(sram->sram_pool, pool_size);
+		if (!sram->va) {
+			dev_err(r5_core->dev, "failed to alloc sram idx %d pool\n", i);
+			goto fail_add_sram_carveouts;
+		}
+
+		rproc_mem = rproc_mem_entry_init(&rproc->dev, sram->va,
+						 (dma_addr_t)dma_addr,
+						 len, da,
+						 NULL, NULL,
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
+
+fail_add_sram_carveouts:
+	while (--i > 0) {
+		pool_size = gen_pool_size(sram[i].sram_pool);
+		gen_pool_free(sram[i].sram_pool,
+			      (unsigned long)r5_core->sram[i].va, pool_size);
+	}
+
+	return -ENOMEM;
+}
+
 /*
  * tcm_mem_unmap()
  * @rproc: single R5 core's corresponding rproc instance
@@ -669,6 +739,12 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
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
 
@@ -695,6 +771,12 @@ static int zynqmp_r5_rproc_unprepare(struct rproc *rproc)
 				 "can't turn off TCM bank 0x%x", pm_domain_id);
 	}
 
+	for (i = 0; i < r5_core->num_sram; i++) {
+		gen_pool_free(r5_core->sram[i].sram_pool,
+			      (unsigned long)r5_core->sram[i].va,
+			      gen_pool_size(r5_core->sram[i].sram_pool));
+	}
+
 	return 0;
 }
 
@@ -881,6 +963,85 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
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
+			ret = -EINVAL;
+			goto fail_sram_get;
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
+		sram[i].sram_pool = of_gen_pool_get(np, "sram", i);
+		if (!sram[i].sram_pool) {
+			dev_err(dev, "failed to get sram idx %d gen pool\n", i);
+			ret = -ENOMEM;
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
@@ -1095,6 +1256,10 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
 				return ret;
 			}
 		}
+
+		ret = zynqmp_r5_get_sram_banks(r5_core);
+		if (ret)
+			return ret;
 	}
 
 	return 0;

base-commit: 1a491aaf1d1ce3a1cf5190394c36f21d805c7e96
-- 
2.25.1

