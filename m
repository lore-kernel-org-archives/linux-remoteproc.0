Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2086.outbound.protection.outlook.com [40.107.101.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF5722626;
	Mon, 15 Jul 2024 23:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721086104; cv=fail; b=pwBLIzFfO1Uzo75ooGVMnpeEuPkOvUOFdJ4yBgLfGxnF1QhJVGHzKk8//uFWD8fcS5+HXwUUPhGg72MkWkyKjbuY+G3wQRgrGK3CuDHmnJaJRTP4gPnvQv0chJ03AjCd/y3ZUrDZwMcyGgzlHdyk9PW7oRiRVZcT2j3WCK5iQE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721086104; c=relaxed/simple;
	bh=WxIjAqWrRmP+XI3KaFEAvsYI4JtKhTYMDTZcSAfDkOQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hfX9RXDqM0Auk4QAdBZPjKxBgPzBqi1YQBlT271YN3I3LtkUnhGmaA4z1WJD0SWZNb7MhJHjBs6mgbiD3NuzlfDuAP//eRt/3FD4/t2XqIu31YmyVIcGlHUIl+oX0xLz/shLtOOZp7ft+LUeqK1srl1aLEUZHgHuizEopgI1rSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DgvvtGvw; arc=fail smtp.client-ip=40.107.101.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DgvvtGvw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0klml68nutOm3OAympOX3dBbYw0ht8o4vzYtrFLmt+iWmrH1XJIV2fJKLKPqO5hLGRu/PqTh7sY1aFCGOVSncQTqPYlB6/vgK+QaabOLZAgsvLRVBD2KzTIqaOBR2j+yyMhNdznkq1XLKDFHtcq3HZBbor9DSu7ELHi7Ae7OpuipPPwIqnWseeTQznvRHE0DXIOON8qJaXbQNZcaaXFkHOdDVD2bgCLjzzCTlq8VEv9j9GBAfk/o0K5JAM90keQw4Ep9fXmOfN2xHWFN3wCZ0Mgn9VhngzkmZTTpteg4PlDhY71zriznmQSd2rXaxuo9MRafq4RWaxP5yVifX6pUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8UGyw62SwqqmQXqIQvE3gumqzGkSpCCBHKCy85H+MY=;
 b=j7fjdS10wvKQVBdWuH5f0qU/wx4DTNoyF182CHcTXbbTAahkcWzngWe5Ua8xfJmqn50FG8hPJDuUI4+TRXpzWiFQnYDvT+oiai4riBpHun6mmdxF4WznYMqDfTl8yJXCJ0gpjCfEsiEruh99f1PSY6bixphLkdIBqPrtdqI2AG61b8XnJ3ETDtY7XWriUxK+flhyGioP6Kh5zfjSqP9gCc/uNYMZNfTKb2hMpeXasanw9dP7j27YneFv8hgODpQHnX7DU0qOANEe/2olXIGhQgvGgpQki93x//ZbPdjqqeF2mjF9tcwKc8FXyujXucYO0XdSAJLU8nH1i16tukF/5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8UGyw62SwqqmQXqIQvE3gumqzGkSpCCBHKCy85H+MY=;
 b=DgvvtGvw/wT/piNUyTMlzP77BJcD9wiiYEXvxgoE2kVrJa0WwjrIcEXtj6Q9QRrDE2Ibw/Zl2orHzMve+a3HGOeKv2dXzIaKT49eKwycGUkKSvujIRmkLyBqZCrOMSZaOebdWRK6qoo93VKSvxz4zK5S3nUlHFEhTOyisBXIf/c=
Received: from SA9P223CA0018.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::23)
 by PH7PR12MB8793.namprd12.prod.outlook.com (2603:10b6:510:27a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Mon, 15 Jul
 2024 23:28:19 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:26:cafe::62) by SA9P223CA0018.outlook.office365.com
 (2603:10b6:806:26::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Mon, 15 Jul 2024 23:28:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Mon, 15 Jul 2024 23:28:19 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 15 Jul
 2024 18:28:18 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 15 Jul 2024 18:28:18 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH] remoteproc: xlnx: add sram support
Date: Mon, 15 Jul 2024 16:24:33 -0700
Message-ID: <20240715232432.1694673-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|PH7PR12MB8793:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b51174-94aa-44fd-0c0d-08dca525cf61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2P7aljDPKa2CnzvNJG0BkAfessZQpsDwXxjt2rxlJwzO9JAQfywVpnbu2aA2?=
 =?us-ascii?Q?6UwD0shsCTDYGPPr6gIrr8dLElE9caOI3k4eqpoos2xi+Oe2yne1PBPAE5Qp?=
 =?us-ascii?Q?lDnRxbfF+jXgVdRPRgekxIDsEPrtoK+YhVW3fGh7vpeLCeNMqpstFTHx1jN8?=
 =?us-ascii?Q?u+nPE/mriHCSNMH7bHakxuhU6lki0/JHQXFnQmOltN2BQGmuoE9EZ3fMACZq?=
 =?us-ascii?Q?yGovlxuMniFAAfKARnVfDOcb5ISrrQfzFmxGufg5HxGX/9pzB3Fz+fov6uFs?=
 =?us-ascii?Q?buD3UlZ9p7QxzkflTadOZSvXvXagazmzkfsM0/CCOEb/OeF2GDKAEvc63rz7?=
 =?us-ascii?Q?5ZUGlqYUqRz2LOFciffaoNdS1B/EZ8nedEVGaRICRPyDmp1kqNsZjM78FgO3?=
 =?us-ascii?Q?M7thAyEjOKjOnkUQBJl12MnQ6N54pytEhfLFWmQz23SzRLu1lRqZbbpvK6XP?=
 =?us-ascii?Q?o8j7gxZubEOJGRWU6D/KmFXfG2H11vYhtNW+33e2tX2gkl34qV5km4b+FjJe?=
 =?us-ascii?Q?EJG93EbJzYldRcnZeOm600AfeUcbDtu3tXL7aIopMZsxa/JqksFR56s/g30f?=
 =?us-ascii?Q?R4CMXtSeGwMqeMmHp/7JeHk6LCvQk5qAfFkebeHM7gmidnr4mU0LIXZQZJkx?=
 =?us-ascii?Q?klYRwx9ezjqfj1xVzPIhDxo6Tr2YRUCeFdAptvVuGPzkQUH/Q1ZeaoB3aYJH?=
 =?us-ascii?Q?A8chS8y3DYs/UtfzZSWSk4VYQOA1vt44sc1tbuv8Y34Ik1M466mxSxehIGDO?=
 =?us-ascii?Q?mD0HOoBJ9gFtfZP5VRDZyQ72yBsHFYMjjSwG3iHNhKG3U3jOL406/I3n25L9?=
 =?us-ascii?Q?R1He1I9TRj9Lo0qEBKl+QDO8OoP7W4FtKQEEgYro+Xbj35QPZbHQD1xBzpa5?=
 =?us-ascii?Q?s0YmTIRcuRZ91FQF17u5bIYFoLK8x85z4Yoa/dEQUOd+my89GgF09/CLJxnG?=
 =?us-ascii?Q?J2syrkKgvZATSe3kduK0BmO4vA2sMReH15k48xT5sZD0YNvHqL5m4En5JEoY?=
 =?us-ascii?Q?q63+ggP9jrtxAy/7X5UjOJKmswNK1gtQvFB6C4s0ag3Cyz7/ZPYGiYCPVI5o?=
 =?us-ascii?Q?TAkt3ZCpnNEePJXDpqZKpGrc8VqY4ilfMMT/NGnqQGUFEhntYT4JZrUxuInG?=
 =?us-ascii?Q?G1qMjqq7H6Rpejzjb7KVm0j7y1knuAa8CbHKYTuV536XM7DBE/6I/YY82/qY?=
 =?us-ascii?Q?m8ZqMzdY2uEjWyYBF9biZvlnv/pS9Fxhdtca83GXSiNLRB/+3sAMyOWde0So?=
 =?us-ascii?Q?AAe0q09dBmsPP3pz/VDQIOww7P4ypViK31LqmA92FSF0Rmfnxaty6jc4BZh7?=
 =?us-ascii?Q?ofLOJIz4t/DmycZqGf5x+HJRj52OE71fT3TCXBC4yOA7Jv7zhqyPkfhO+6VE?=
 =?us-ascii?Q?+US91ahMmEdNtQnRwIPSZQq5AUeVxK97dHyY1m0/FuITiPgrZak1BSk8JGnz?=
 =?us-ascii?Q?ggPlFnsjNDCkUmVyz7i7vDHRUlLCV45A?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 23:28:19.0603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b51174-94aa-44fd-0c0d-08dca525cf61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8793

AMD-Xilinx zynqmp platform contains on-chip sram memory (OCM).
R5 cores can access OCM and access is faster than DDR memory but slower
than TCM memories available. Sram region can have optional multiple
power-domains.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
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

