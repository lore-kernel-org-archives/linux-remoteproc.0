Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0D922F19;
	Mon, 19 Aug 2024 03:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724036504; cv=fail; b=YD33xLhLBleFa9Mj615mrWjEH8CTDdVlEiW+OwbPhvztcsY2CrcpngO5o3rWzvRzcRZYlZN6eMzJug1+vWW+Ev0uUE8OHGMmOxjyLwWk5wkGfuM9SELxSx+8nzfyB5HxE/yYP+xRL8GjtaCO4/F6NwQEor/VB6EM4Ze1tKnDzFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724036504; c=relaxed/simple;
	bh=T7n+UXOqXjhjkHUQbnyb4gY/ggBIDNxiwA1Ur395K+o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WkkOxYGCLQA0foIzysfIiFOp90lWjAQ22u4TgQmdS3XN8Mjt97g/DicB1+bxr5jf21X3tQ5jGTGnPjc+uX7drF6TyOxg8ycK+7BF5zinXoApsgXZDhTs3pwEhRDY/ypVabykc0UbEGrr9Pr9v2O5OH9lNkwjE+/2VcQzm/C0W4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Tph5QIDI; arc=fail smtp.client-ip=40.107.92.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Tph5QIDI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vh4I7uemfr7P+FtbeiNlspOgglEpLjoFdWEYSt6DUlYPJV0jvRsQAYIQmMlkC2gBsXHzkToYyD1rXgXx8niP1habA+OPMYg6oCXJUqvWmzSpqumR98bIbzM5WUcydUf/A5XxpNxLxiEopcPlIm6XzlQ7R5BdOHDqC2LPLmASUR7rpd3Yfd1EN6Kxj0rj0giuOwTbysDTz5UNlAnjilzVvsD7sgxt9Yx4AkWb5bUVyb22f9TItQq9UTJhDUwgKaPs+T4aXWRdvOcBNReKPEnxRY2cpafblzou1FWsz07kBMJYc8N5kBDNvdjEwDF7T0MUI4GjJ13RVIud5nzVLjp3TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sz6BICPrZX8Z2aCPNHvuBpLaUK8ACnAu6PpPVs9qC5o=;
 b=b5HUV1NtSvaC45m7FCjaMw+76DEkaTG6vVerK5Y+aLqV9KipMNe8MWTFDzYJj4ZIGYv9PlIM9PiYCwGOXrVYhhfTAMHmZkf/iVRbKY8WWfwO7/yJD3cTMDCRLxEBSALNBVVT+Hwd1WiuobIn3uDVtDeRpOGGf1+pfupdzDFc+J6LFPS+36gzHLgJiOIQxRNSb1moOSZACMCveWjtR0P6YWefkbUbc8RPcwQs+/2/Y9Fxegru766lkq05EJOWRIOlcY7GqtizTiOQBqnfuB4nd+7tanXaJVoWK9U9y0jqKkoTDJXp2jW3tUZbZe5i7jy4GUx6tRJV+xn7voeCx/3Q8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sz6BICPrZX8Z2aCPNHvuBpLaUK8ACnAu6PpPVs9qC5o=;
 b=Tph5QIDIAb12JFTKzxLtZkN3UmXvffzEjC0/rZO9RUdHTR5VwKFSCNghh4D4D1ZR3TJgoWMyr3kHBompKPuY/dOAzug7POb1lHfS+AKHdzicVi371MVWZg/cELUjSAprnL1iaUheDJm2eIxqpJoBGR/U3+ZMlhEwmd8ktzUMV1o=
Received: from SJ0PR03CA0253.namprd03.prod.outlook.com (2603:10b6:a03:3a0::18)
 by PH0PR12MB8152.namprd12.prod.outlook.com (2603:10b6:510:292::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 03:01:36 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::f9) by SJ0PR03CA0253.outlook.office365.com
 (2603:10b6:a03:3a0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 03:01:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 03:01:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 18 Aug
 2024 22:01:35 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 18 Aug 2024 22:01:35 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH v3] remoteproc: xlnx: add sram support
Date: Sun, 18 Aug 2024 20:01:19 -0700
Message-ID: <20240819030119.3590783-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|PH0PR12MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: a941a374-ccf0-4b2f-7f6d-08dcbffb3d3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+1UQwqBL+yizKhy6XAKuNZVMizFe094wWt45L65oRwA3RTfZYog+Z/4pbXdo?=
 =?us-ascii?Q?7Zgsm4GSb0tcM2/qmZrAC6gg6OcIbEFDps2CQqQQ0ZfoaG4Xqe+rItZIBqTc?=
 =?us-ascii?Q?OryNYoZTwqxlRyDCrCYsPa5gzk+HMN7m4LgeilUhmGI6MxClhgftRdmYA9/g?=
 =?us-ascii?Q?aLQN+wQ4c9CVtPBSawbr/bZfwCCohpdNRodz4RxdV0g3HPCM72pqTb2U5Wd7?=
 =?us-ascii?Q?l1RrW2B0MPzmXE+ZTtwXqmxMIKhUOU7oFbUoGzqnPtzUY/6kKz8KFJ2aMfkb?=
 =?us-ascii?Q?J3HHzufvW2zY0dCR9zUCpg3JVlEb4Jno859ZFIISkwMz+3YFN7yKflQ7hrWy?=
 =?us-ascii?Q?vm71vuWYWMHX4J+i+cFEgcZA7HIgHNBEGmF2S7JgMbTFukHRPmTgw3FIU4LX?=
 =?us-ascii?Q?torlUDa/uI/MLwHaEIfp9yI8Bir3AhHCAcbhliy9MwE6pqN2yBtb/QjXjIYb?=
 =?us-ascii?Q?g7/6u4kIO/ZzWu+BDhTJlDva5cMhHasBhiTb+czNLVoqjVk1sBUW1LnHollW?=
 =?us-ascii?Q?z2KSkpbbSiM7IaRjDR23WZmwexUsOSeIrHlsNGuyxo3UcY1owdIgz3+SoHlJ?=
 =?us-ascii?Q?NqZQ8r9bMockqY/8ScOAOaCKcJFOcWX7s8MELiwBAXuzzgxZxNqBgntGksb3?=
 =?us-ascii?Q?pNa3Yjy8sS/i0X7p9+fZhzHNjl6lOLBknxViqSe4wklaqKIJIDY1N7x+zk5U?=
 =?us-ascii?Q?YJfH6g87xQ9PHG1TS66ZQnlJpsXjr1qwRroTQ3Xz6F+yjOb3exKfeQ7h3KQE?=
 =?us-ascii?Q?928r9aO2G/LK45PgcpMGO8M01z//qK1V61VekH9iM+0VdjwHpx3MPG8fOjnv?=
 =?us-ascii?Q?mRRjY3Ta778POyxOIlIC7FSjDBua5ebA3kLHA19TBXkZQ29AtVhj/X9HnD2w?=
 =?us-ascii?Q?0byTrH1bjrXT84j2FxwOAq38DABl1nzAhpfgFnQH73TkL5NypKQs1X8FKwLc?=
 =?us-ascii?Q?xScQLNYzEmsrbFY/XmfEKYFA6H6rMVmcb3zLwghQa67Q4TGOmrgqoN0+QBuq?=
 =?us-ascii?Q?eptqqWxzAAXrn2Ne8MqJkb5rpeEnNjovyrK2rSRKxxJKsyMWivM2SC0RVI7m?=
 =?us-ascii?Q?qp/40OqSDPr9ctYXjSudNGRibYVjZxV9gzxH0kRt+84vJIS7yRCMAjk5350e?=
 =?us-ascii?Q?7uuDxFSUqtHGdZPlmOSrd0W6AGvL9p7Fktr9qAvORkjpyWE3Y1YyfeZpoVg7?=
 =?us-ascii?Q?2cgdfjOS3lmlLnLZDWyve+1xcyTJ8xYMAGK4HjNebWskxdhCRUd2kBwbL0pt?=
 =?us-ascii?Q?Xxee2VmxfLaLuoN6CZswMZ4x6rDSfQXiO6cdlBaZLWz2CT5hXENVK2ob5SgG?=
 =?us-ascii?Q?ARuR1VuAiqL081U9Qs/tba84WjPb13Kc8y6A38MWYNtE8pqPa5xslNZ1U/HR?=
 =?us-ascii?Q?8/2daKH9Li9CdIauPeJcpmN6KexqkcJygLYhg30eE1JEI28sSzXGYf3VpC/+?=
 =?us-ascii?Q?S/rTYuQfMXfg+rlNAoGyFGfF+/CWsrRu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 03:01:36.3367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a941a374-ccf0-4b2f-7f6d-08dcbffb3d3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8152

AMD-Xilinx zynqmp platform contains on-chip sram memory (OCM).
R5 cores can access OCM and access is faster than DDR memory but slower
than TCM memories available. Sram region can have optional multiple
power-domains. Platform management firmware is responsible
to operate these power-domains.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v2:
  - Expand commit message with power-domains related information.

Changes in v3:

- make @sram an array rather than an array of pointers
- fix of_node_put usage to maintain proper refcount of node
- s/proprty/property
- Use gen pool framework for mapping sram address space.

 drivers/remoteproc/xlnx_r5_remoteproc.c | 155 ++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 2cea97c746fd..1f704b99a67d 100644
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
@@ -494,6 +514,46 @@ static int add_mem_regions_carveout(struct rproc *rproc)
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
+		len = resource_size(&sram->sram_res);
+		da = sram->da;
+
+		pool_size = gen_pool_size(sram[i].sram_pool);
+		sram->va = (void __iomem *)gen_pool_alloc(sram->sram_pool, pool_size);
+		if (!sram->va) {
+			dev_err(r5_core->dev, "failed to alloc sram idx %d pool\n", i);
+			return -ENOMEM;
+		}
+
+		/* Register associated reserved memory regions */
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
+}
+
 /*
  * tcm_mem_unmap()
  * @rproc: single R5 core's corresponding rproc instance
@@ -669,6 +729,12 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
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
 
@@ -695,6 +761,12 @@ static int zynqmp_r5_rproc_unprepare(struct rproc *rproc)
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
 
@@ -881,6 +953,85 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
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
@@ -1095,6 +1246,10 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
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

