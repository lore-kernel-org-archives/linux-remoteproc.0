Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B282EEE49B7
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Sep 2023 02:43:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232447AbjIMCnz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Sep 2023 22:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjIMCny (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Sep 2023 22:43:54 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B7E1713
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Sep 2023 19:43:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTshxIY1fZCpau0dKC9W899w3RiweeJakw3EWSixwEJXJJzTvKIrkDoh44NMtZZPge+ihRqmqHEe6OJMwhHqBrclk5gh0Ch3ZsxXczAaD/H4nMn60+DoqQuIdSE83zigul5US0U5B1kkhYlbBgZl5GZ4Pb8HolEwIY071oC8ozALoF95rkn5a4EpjQCWH4tLKdUzkQfLNR9Of0bCZcRNJzTfT/OiQDMGrERA80LOy8hQmc5pEfo/O243/sqvG7HhhhLEUEV9rkVeOXjfPqjgcoPy+P4ftWEKIcXz3VAJa7MhJsrv8Es5kyJTxG1bHQgvfQeSsUEfPeIPv+8OqqeDHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOMOu2ehpMARyQatOpab6aPqHvGrQ2+CqlwGhkv4nAA=;
 b=fgTzfVteCqsjzpPcouDK2uudcTi7IZ0j43K3Z2em6rkvAjrzD76MENPbzpvoOZRNuFMYo1KqxaPujscr3C3HFB38aAfZHo6S57H5Kq9LiowWkCQwDHhoX53meqwjtzuTkcVlUGN0fTWpqR4OKZS1jBgeDkNVdSzMMVN6+1HO6eKk5JAkzZxTKoC/5dNpxrQdrf4c/zDCOf34C23Tc+kF59SjnBW8OMkJM/ed8O4G80z2fagZeAyXSMpbLAEDkddJnKR1kLjadlkw8xA80QXDSrZfLwhWPgLO/IyrwbNe1XqdBzLO//p8Cqvn2O3zct5FtlwcGehcKh+wmxccEzKZ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOMOu2ehpMARyQatOpab6aPqHvGrQ2+CqlwGhkv4nAA=;
 b=BtvuKQhYWmsQ8ieR/IxcDnVypxx+OKozj74YtB0+p1HQzV/mOsPgN9ue6fmZVOxQ1xYIxj3TccADMRUAljai75X9fmmbxpv2rFVD2J1rdsCet9ZGNPsDW9XVttV0oAeMZ8b+5lVAAPWxJe+MZZlWNh3VMkb5rIxxm3EurwQKdgU=
Received: from MW2PR16CA0011.namprd16.prod.outlook.com (2603:10b6:907::24) by
 SN7PR12MB8819.namprd12.prod.outlook.com (2603:10b6:806:32a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 13 Sep
 2023 02:43:47 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:907:0:cafe::4c) by MW2PR16CA0011.outlook.office365.com
 (2603:10b6:907::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19 via Frontend
 Transport; Wed, 13 Sep 2023 02:43:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Wed, 13 Sep 2023 02:43:46 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Sep
 2023 21:43:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Sep
 2023 21:43:30 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 12 Sep 2023 21:43:29 -0500
From:   Tanmay Shah <tanmay.shah@amd.com>
To:     <linux-remoteproc@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <andersson@kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Ben Levinsky <ben.levinsky@amd.com>,
        Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH] remoteproc: zynqmp: fix TCM carveouts in lockstep mode
Date:   Tue, 12 Sep 2023 19:43:23 -0700
Message-ID: <20230913024323.2768114-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|SN7PR12MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: d277e1e0-e396-42e6-de1b-08dbb40340f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hu1Y5paNB8Zuyzp1p9GZIinDJSmVpdArl9ZmiDfiId+o7x+RHPutd8xCFsCXLf693pK62tTqsV/8TLJ2Ih1f814ZI6bKmnOrX7N2frrxlRFecacO/Pl3rxMBPQ7W1UmaDuTMSJvfhjJKWXH2vrUcjyPdq3V879NcwQ7wsGCxdbdSKj6Piapk2jOh320CLTxmEweYUBi/z8s/7VKbhkCVJ6Inh8W0MibqoWIrbyewQAI7NYeJYdLWIfn3CV36dSHGwily6yQPoxQWJs7WRuHRkedBS1GvMMzPx74eM3jS0v2bkJlECqXMGX4fGmcp0vuRkvj3fUYWwWSzKG2YwipxWYpJlRYrM1xr3mhiiGl3wGyfTHWQPeuxFGzBoA3Kl3BysC68MBY7LdWVcVrSk0C6qxdmu78Xe3lTrfSLV//CNzGexifgzeWuUREac9mRwkAxbgKqmW0QpJahrzdSyDjrKA+QW/hR4DH96Ojp/L12zjGfCJF3/f+kAIDpKtxZVSAX5BtiWI3xXvIlCTjNv8Qol1hTeikzlfbuyECmnYkvgEHGSu/Ism3lsSWapsBrgHxTx3hU9XUmi1frRd2SECP4bmApm2LJw3NiBvEqmYxnMGGIOkSynAZA2XIoqfk09fLRxJS5X6Ig764iU2UV6pHFeymkrcyeBWr5NgGFubcnaZlK3jJQtFrUd155qm0XKFyUknF/MWCWs+6vdRttvmh6fSxkvzoyAcIoTC+d3yKo8gwtB1yjOOSYcRbr25j21O5Jip4fCs1hXKPN/y+5HRAi8A==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(82310400011)(186009)(1800799009)(451199024)(46966006)(40470700004)(36840700001)(2616005)(356005)(40460700003)(81166007)(26005)(1076003)(82740400003)(36756003)(47076005)(40480700001)(83380400001)(336012)(426003)(36860700001)(86362001)(5660300002)(44832011)(41300700001)(110136005)(54906003)(70206006)(8676002)(70586007)(4326008)(8936002)(316002)(6666004)(2906002)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 02:43:46.9160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d277e1e0-e396-42e6-de1b-08dbb40340f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8819
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

In lockstep mode following is TCM address map:

|      *TCM*         |   *R5 View* | *Linux view* |
| R5_0 ATCM (128 KB) | 0x0000_0000 | 0xFFE0_0000  |
| R5_0 BTCM (128 KB) | 0x0002_0000 | 0xFFE2_0000  |

Current driver keeps single TCM carveout in lockstep mode
as ATCM and BTCM addresses form contiguous memory region.

Although the addresses are contiguous, it is not same type
of memory. ATCM typically holds interrupt or exception code
that must be accessed at high speed. BTCM typically holds
a block of data for intensive processing, such as audio or
video processing. As both are different types of memory,
they should be allocated as different carveout. This patch
is fixing TCM carveout allocation in lockstep mode.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 66 ++++++++++++++++---------
 1 file changed, 43 insertions(+), 23 deletions(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index feca6de68da2..efd758c2f4ed 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -75,13 +75,21 @@ struct mbox_info {
  * Hardcoded TCM bank values. This will be removed once TCM bindings are
  * accepted for system-dt specifications and upstreamed in linux kernel
  */
-static const struct mem_bank_data zynqmp_tcm_banks[] = {
+static const struct mem_bank_data zynqmp_tcm_banks_split[] = {
 	{0xffe00000UL, 0x10000UL, PD_R5_0_ATCM, "atcm0"}, /* TCM 64KB each */
 	{0xffe20000UL, 0x10000UL, PD_R5_0_BTCM, "btcm0"},
 	{0xffe90000UL, 0x10000UL, PD_R5_1_ATCM, "atcm1"},
 	{0xffeb0000UL, 0x10000UL, PD_R5_1_BTCM, "btcm1"},
 };
 
+/* In lockstep mode cluster combines each 64KB TCM and makes 128KB TCM */
+static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
+	{0xffe00000UL, 0x20000UL, PD_R5_0_ATCM, "atcm0"}, /* TCM 128KB each */
+	{0xffe20000UL, 0x20000UL, PD_R5_0_BTCM, "btcm0"},
+	{0, 0, PD_R5_1_ATCM, ""},
+	{0, 0, PD_R5_1_BTCM, ""},
+};
+
 /**
  * struct zynqmp_r5_core
  *
@@ -650,14 +658,11 @@ static int add_tcm_carveout_lockstep_mode(struct rproc *rproc)
 	/*
 	 * In lockstep mode, TCM is contiguous memory block
 	 * However, each TCM block still needs to be enabled individually.
-	 * So, Enable each TCM block individually, but add their size
-	 * to create contiguous memory region.
+	 * So, Enable each TCM block individually.
+	 * Although ATCM and BTCM is contiguous memory block, add two separate
+	 * carveouts for both.
 	 */
-	bank_addr = r5_core->tcm_banks[0]->addr;
-	bank_name = r5_core->tcm_banks[0]->bank_name;
-
 	for (i = 0; i < num_banks; i++) {
-		bank_size += r5_core->tcm_banks[i]->size;
 		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
 
 		/* Turn on each TCM bank individually */
@@ -668,23 +673,31 @@ static int add_tcm_carveout_lockstep_mode(struct rproc *rproc)
 			dev_err(dev, "failed to turn on TCM 0x%x", pm_domain_id);
 			goto release_tcm_lockstep;
 		}
-	}
 
-	dev_dbg(dev, "TCM add carveout lockstep mode %s addr=0x%llx, size=0x%lx",
-		bank_name, bank_addr, bank_size);
-
-	/* Register TCM address range, TCM map and unmap functions */
-	rproc_mem = rproc_mem_entry_init(dev, NULL, bank_addr,
-					 bank_size, bank_addr,
-					 tcm_mem_map, tcm_mem_unmap,
-					 bank_name);
-	if (!rproc_mem) {
-		ret = -ENOMEM;
-		goto release_tcm_lockstep;
-	}
+		bank_size = r5_core->tcm_banks[i]->size;
+		if (bank_size == 0)
+			continue;
 
-	/* If registration is success, add carveouts */
-	rproc_add_carveout(rproc, rproc_mem);
+		bank_addr = r5_core->tcm_banks[i]->addr;
+		bank_name = r5_core->tcm_banks[i]->bank_name;
+
+		/* Register TCM address range, TCM map and unmap functions */
+		rproc_mem = rproc_mem_entry_init(dev, NULL, bank_addr,
+						 bank_size, bank_addr,
+						 tcm_mem_map, tcm_mem_unmap,
+						 bank_name);
+		if (!rproc_mem) {
+			ret = -ENOMEM;
+			zynqmp_pm_release_node(pm_domain_id);
+			goto release_tcm_lockstep;
+		}
+
+		/* If registration is success, add carveouts */
+		rproc_add_carveout(rproc, rproc_mem);
+
+		dev_dbg(dev, "TCM add carveout lockstep mode %s addr=0x%llx, size=0x%lx",
+			bank_name, bank_addr, bank_size);
+	}
 
 	return 0;
 
@@ -895,12 +908,19 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
  */
 static int zynqmp_r5_get_tcm_node(struct zynqmp_r5_cluster *cluster)
 {
+	const struct mem_bank_data *zynqmp_tcm_banks;
 	struct device *dev = cluster->dev;
 	struct zynqmp_r5_core *r5_core;
 	int tcm_bank_count, tcm_node;
 	int i, j;
 
-	tcm_bank_count = ARRAY_SIZE(zynqmp_tcm_banks);
+	if (cluster->mode == SPLIT_MODE) {
+		zynqmp_tcm_banks = zynqmp_tcm_banks_split;
+		tcm_bank_count = ARRAY_SIZE(zynqmp_tcm_banks_split);
+	} else {
+		zynqmp_tcm_banks = zynqmp_tcm_banks_lockstep;
+		tcm_bank_count = ARRAY_SIZE(zynqmp_tcm_banks_lockstep);
+	}
 
 	/* count per core tcm banks */
 	tcm_bank_count = tcm_bank_count / cluster->core_count;

base-commit: 6995e2de6891c724bfeb2db33d7b87775f913ad1
-- 
2.25.1

