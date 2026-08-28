Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010036.outbound.protection.outlook.com [52.101.201.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8C9363C5A;
	Fri, 28 Aug 2026 15:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932740; cv=fail; b=k0eoMvAuaQDiKdg5B+MilBWFK0xCQHm/ttRW18nzjp54msI9QjGjV3BP9KQWgAcaxrNoLhobJqY1tjtcApZvcjpURQUaL9HkhXfc5y7hh7zIlGdXa9DCK6qA8P0AGwV4DCEhqQ11VmngUz8smc7iX7Lx3sbFRh5HWYmCRbzqJm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932740; c=relaxed/simple;
	bh=msQTHLfNigfRN1E0CKXQqyHZ+7Cjhb+qnBZJTELpgQc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gB2MI0cPamSl33CSKIyQlz/VRnSrFaJ1pImhkZZriRBHpfwsel3QudKgYSqFXJtk69ZgFESZ5bXYZ/LirIrLW6Pbn3Y8D+Wmbn5F7fbtpiu9OuBwo3tV+X0I2zZfn8ZV8LAfz2HUOAwon1K9QUShlFMFZMRckdsgs0xLUk/irxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RY90ggaB; arc=fail smtp.client-ip=52.101.201.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RY90ggaB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7b1kIsD3Hnohd0mNWAEbT4WBPdVbeV0U1eyy4EuFLMufJi02OsdhPKpaKp8Mi7cEmI8eyaDZ4NRURwtugSdsSZxlVJWKg4ypn/mSgTM5IaX1Ly+N34ZY8fH35k0lZ49GUP46blWTsnS6Pz/ye8PKQgLjr4wQsC4+JiFqsIXMqKtYLhFHKAQ398WhRa4fh7+KHUGr2NQ1oIspWSLsHGDIEKZUPAU0oy8pZLiOAgsJN3DHEBV0BmRYv7t2g+uiKwWvwnwMdmbihaRvie3mUvkgW8dDgi2KLEvSFQwe+Lxu1ql1G+TXrWOfmPOsAHl2sjd0/SzKqOgjyUMrSzatpxWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84j+bQJbfvihfJrNw1VqOMPjnu65Bgl81X3G39Ddd6M=;
 b=HJqxrYyadYxTjy9c1HuTrvUdFc3mvmBVumlc1QLKx6tSp5kowPKQUVn7Y/oekOFWav1a2jl5ROTr6Ty4YDzdboi4nw7QySLmc1bICpw04nPns53lz3fkacgweJ6D08CWphJ6hxYJFfcn8ByTYfGfKNI0Oez0sj6h4WqjlrXSHhzbMfioVlOkGQMUHz06BsSpH4qNHYJGfWSnq0TMu+WuWOmc+wJ0HG6wjRJ6/K70mYsCiHJyJWS2EoW8Ydcyw7TwwtukuKqKMpmarPac+SYYyHO9D4uLzsNSC3bFZXfingxc2vqc3cEexT9E1J30fDvkIgTrQT+BsFOvq3cxRJL6sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84j+bQJbfvihfJrNw1VqOMPjnu65Bgl81X3G39Ddd6M=;
 b=RY90ggaBiK82bI9EILYY8nM1gFfRT8BE0UtKlpfQzCxItYBofW5hQALdpJpfjZAGSjD9BcW0KYJ1AWi9r4GBzLsbcV/2QQqShsrTaitiu4dvWxV5PRZzjh15NGGUnZ5Ka752ARY+5xcATT/a97rBRm9Gyjj2DuzKmBi1I+FrH58=
Received: from CH0PR03CA0375.namprd03.prod.outlook.com (2603:10b6:610:119::25)
 by IA0PR12MB8974.namprd12.prod.outlook.com (2603:10b6:208:488::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Fri, 28 Aug
 2026 15:58:55 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::1b) by CH0PR03CA0375.outlook.office365.com
 (2603:10b6:610:119::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 15:58:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 28 Aug 2026 15:58:54 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 10:58:53 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 10:58:53 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 10:58:53 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH] remoteproc: xlnx: fix typecast warnings
Date: Fri, 28 Aug 2026 08:58:46 -0700
Message-ID: <20260828155846.2883035-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|IA0PR12MB8974:EE_
X-MS-Office365-Filtering-Correlation-Id: 11d48928-1b64-4ca0-3b9f-08df051d42ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|10067099003|56012099006|11063799006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	50S+A0YilGerYWSQj8oMvMZEyAmZHThK3nLmJj+bBIaeh2OKkxzxwyvwXG9VivG/sgUv7ihKkVcOG6laZwxcTU01W40ZEh5PJ6vLxsO/U0QSUjdBzs9hTADeq/Gra9TvS4M5jMNwcpnVVsk7Pky6IjHpIhy3yzapv3gSAp/SA3XtF3ZBseXMyW7AYVEvzxJxkRhePteoos0JW6gk7bpvP5YHribLk3LVfVKg9kpmvW4mTBchaJLrK8zjOVhVl9tREVjz6g+aHgcTdBx1KDQ6XLZCStEgAFDvLcOTOF0ZeHk6gDk1ewEw2nr6Y7MKw+GTyIZrB85+M8FsnsrgXksdZKB9rKNOlVmjEJ8T7KB9e48MqVKZR7IhVNSDdZVGcdABrUYexNXQK5t1V3KLMUXufa30ZB5vwRJRRYhfQcNgG7l2NcSFz8qyHnzGsMTwtopVsoLBGQV0YJloz0i8YGa1V6bZr+xlOjUfW9S0vscTmQ9zlDcsUrZT/z8N4fMfEB+aC8kaWfK3Pj0E0w/pqpx9rlkPWm0KiSZ2QDWQ8wzLOwem3mdupCJY+8mvj/c1SIBwHswmsE4FNYuvE97n4muuY+2gch3HpMrZ5znTSMcAEooBS4RNeMiYoKi/yBiSoLZVXK8w8PAy2ad3X9K+hPly8T2wyfmQhv/xzlCJYRRwIZqoGob4pR+Anppm/obYsXjK1Et+P85pXvJ8ce1mxAyuNw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AKeCoTq3CYiA80X790fXiRn+LZ98+Q5p6U5tppgToOQ5qMc7BAQI5zoY0eRr9dsoqRUyJvEuE/ZspefcDEYCXxh2RgcGZYhW5eHHnfKZaQpOw2Dy6btHL1L6nCfeg3O7QUNLHZMF9WmfPn8M9084PCjAqcjwTtnRUorNomIUxMzwZiHH3dZV2XSTzFIQhWfHcZBruMQX7ETIk1lB5ZCKS6gGqQlhftKFZ+8IsFqvsRIUlve8fvxDjeq1XV0TmWE7FJgSywgPwlNIVV6jA1VGzfVkUdZAQnYbt/HhZPM67K51vatReBZ+f90PgGMPFKGlhPrvIPMJt6/CM1gwv2LxnS9tRNUlKciyhYZK+SDtRQGKlXUv1CZJYFeuMgYeqh8fp2+4MMnpsm7p9egllwyA0id0ExGzD75AqibpbGX+V9tHi6gBCRupau3CGdcEyLII
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:58:54.4549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d48928-1b64-4ca0-3b9f-08df051d42ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8974

Fix following sparse warnings by using __force attribute:

sparse warnings: (new ones prefixed by >>)
   drivers/remoteproc/xlnx_r5_remoteproc.c:571:20: sparse: sparse:
cast removes address space '__iomem' of expression
   drivers/remoteproc/xlnx_r5_remoteproc.c:749:17: sparse: sparse:
cast removes address space '__iomem' of expression
   drivers/remoteproc/xlnx_r5_remoteproc.c:773:24: sparse: sparse:
cast removes address space '__iomem' of expression
   drivers/remoteproc/xlnx_r5_remoteproc.c:797:25: sparse: sparse:
cast removes address space '__iomem' of expression

>> drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse: sparse:
incorrect type in initializer (different address spaces) @@     expected
void *rsc_offset @@     got void [noderef] __iomem * @@
   drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse:
expected void *rsc_offset
   drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse:     got
void [noderef] __iomem *

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608190009.uCbYi1Y5-lkp@intel.com/
Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index c685bb5fa62c..f9cdd3c024dc 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -568,7 +568,7 @@ static int tcm_mem_map(struct rproc *rproc,
 		return -ENOMEM;
 
 	/* Update memory entry va */
-	mem->va = (void *)va;
+	mem->va = (__force void *)va;
 
 	/* clear TCMs */
 	memset_io(va, 0, mem->len);
@@ -746,7 +746,7 @@ static struct resource_table *zynqmp_r5_get_loaded_rsc_table(struct rproc *rproc
 
 	*size = r5_core->rsc_tbl_size;
 
-	return (struct resource_table *)r5_core->rsc_tbl_va;
+	return (__force struct resource_table *)r5_core->rsc_tbl_va;
 }
 
 static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
@@ -770,7 +770,7 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
 		return -EINVAL;
 	}
 
-	rsc_data_va = (struct rsc_tbl_data *)ioremap_wc(res_mem.start,
+	rsc_data_va = (__force struct rsc_tbl_data *)ioremap_wc(res_mem.start,
 							sizeof(struct rsc_tbl_data));
 	if (!rsc_data_va) {
 		dev_err(dev, "failed to map resource table data address\n");
@@ -794,7 +794,7 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
 		return -EINVAL;
 	}
 
-	rsc_tbl_addr = (struct resource_table *)r5_core->rsc_tbl_va;
+	rsc_tbl_addr = (__force struct resource_table *)r5_core->rsc_tbl_va;
 
 	/*
 	 * As of now resource table version 1 is expected. Don't fail to attach
@@ -834,7 +834,7 @@ static int zynqmp_r5_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc,
 				int offset, int avail)
 {
 	struct zynqmp_r5_core *r5_core = rproc->priv;
-	void *rsc_offset = (r5_core->rsc_tbl_va + offset);
+	void *rsc_offset = (__force void *)(r5_core->rsc_tbl_va + offset);
 
 	if (rsc_type != XLNX_RPROC_FW_CRASH_REPORT)
 		return RSC_IGNORED;

base-commit: d4d61a4b0a52e8f3cdb3e1578602850a3452ec3e
-- 
2.43.0

