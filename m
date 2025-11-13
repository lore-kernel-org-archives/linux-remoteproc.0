Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010056.outbound.protection.outlook.com [52.101.193.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFF32FBE03;
	Thu, 13 Nov 2025 15:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763048700; cv=fail; b=bAe4Q4ClcbwWf2HP8M/suzoIsV3aKdyNOxLAyahlamu57ci3muif7jHiJYTxC0NA6X5DmxO1zR/K1Yur5nbPJGzDe7a8PiwChkAJaxRF1tCkW+808UI+CvEZF5L657rIyVuvj2ov0AgZDTge6cG5awo/PCmVsm05dNh48yMIVfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763048700; c=relaxed/simple;
	bh=LfA5iTb/f4I9PiKJEvyOWf/eDBdzUjSekRD5rn+O7yI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CTTRnF/7+CQ4NT3Oe24DxztktxwwoNfxRJFjnD+tD5PBoibovqBkZvsUBgErsQ1Co/ChUGEdGaRGKlIuXm33g9r3ScrtmcVNK2UzrIf02UIpKJ0OPjkR9YUFmoufoTIa3ENl47po+uuke/2OvLhs6pkXn+3SPbIwXz8zVkMEZgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bQBtqap7; arc=fail smtp.client-ip=52.101.193.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bQBtqap7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nF+xSbMh0yQTeqmzPxlrZ03rGVT7G/9wQ2CQjBIwBfYLYTATdWjNSq7ZHCHjtgZoRA7bZ7vq60HiVXSF6iUCu+is7XO1PRv9CSqSGe3vOiEGmor9+y9McU4RyL9Hra9hbGYGrcAGcp2AL/qL7gmrgfkD1Wc5nmIBTC/b92PskEvzsr2V9Sdl/lh6FGyLQQ81B5WsumUoQShNJVCV4G0HHf2TZZV8I+p4iWm86F04JiKuLtUDkFJdvrz2kIm/HHf7CrBUL4V7kK921Uhhn/N33vZdAjvariM/PcXDrXDgo5tvfKmAOEsqolxEQWARnYgmGUUKUPAQeqTD3eyngng12A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90cn9iDc44sV43FdxBt6q9VYy9y2RmhItfamIg/aJqs=;
 b=JX6PGsjZypTzSdjoYiqvXm6Ow9tSGZFOIrRQEaYYcyZTbjTddz/iWHoSfjZNwlFAUSXJU21POP8De6sXKVLnfgMFpD5XkB35bWozoYPCqb5DEUTpBc2OEx0vAqljPBHMW9wXkgVMvyvKa0RESCgu2CefeLZL709On9EykZ1PGxrS8ZRzJq1XTFiCF7cpC+5f8zTzBjlkQmf5Ju6dTnDTyXZTbioCoA2oR82/d9g6Av3tRqk5wCIRJjTiZsJ9+KSvBACJLX8YxIL1vgD1iwORKdtLmB3yo9OF4K8YveuJrVgOl139x1kgcLuo7KI8aUKDNxL5bqqtY7x7KNF/uJ9PSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90cn9iDc44sV43FdxBt6q9VYy9y2RmhItfamIg/aJqs=;
 b=bQBtqap7YvHOWYsMdNUohuuSoIf8fkuQ1FjX5MaVaINEhS3kG3sAfWZgb6gUhPYlbksS0hLF0MKP9k4t9Lq1C7pA/hpfeT2MJgAWBhDlE2KyE2wXLBdUoW5aPFYUwj47YO5+QR0M0lZqU9fJFhuf4nFpMF2E2q8odWzqtbibRBw=
Received: from BYAPR21CA0019.namprd21.prod.outlook.com (2603:10b6:a03:114::29)
 by CY5PR12MB6525.namprd12.prod.outlook.com (2603:10b6:930:32::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 13 Nov
 2025 15:44:55 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::d) by BYAPR21CA0019.outlook.office365.com
 (2603:10b6:a03:114::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.6 via Frontend Transport; Thu,
 13 Nov 2025 15:44:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 15:44:54 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 07:44:53 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 07:44:53 -0800
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 13 Nov 2025 07:44:52 -0800
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v2 1/3] remoteproc: xlnx: enable boot recovery
Date: Thu, 13 Nov 2025 07:44:02 -0800
Message-ID: <20251113154403.2454319-2-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113154403.2454319-1-tanmay.shah@amd.com>
References: <20251113154403.2454319-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|CY5PR12MB6525:EE_
X-MS-Office365-Filtering-Correlation-Id: 560d0266-55f9-4938-20ea-08de22cb973e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OgwGBoDguXLk7hS3kiZ5Mh1MLYszrNQSSRx1W4fwHCzMah40/NfVkz/zgchL?=
 =?us-ascii?Q?0JTK3d2FsaWvYwwRP6+5p+mgQUysz2V7IFBehu+Iqhl8XJVrY5hJRRz92I+j?=
 =?us-ascii?Q?rMgJCLArpeuMuRQAmo9o9Sp0yRUqGq3MOElOonOaXyWhVsGbpPtsQNxHkv83?=
 =?us-ascii?Q?90SjoenwhUoZg/eSFGu2yox0NSx/Mhp1ORlCv0Ev5OPhLdPRimvqnmD4MbH/?=
 =?us-ascii?Q?b8Sl7y+SiihrkRIQXnIHGBzt8nBXlDNfZPiEhcgU7/6f7tUm9TyRjfLaSgSv?=
 =?us-ascii?Q?iKU+JyGRE6A9Pre69a+gzBoBY25gvMhDXjU8kS3E3+SjN+GpyhrRt0oUTmiH?=
 =?us-ascii?Q?M1PHl9roEmjZ2MDgaWHeRCyzHJizJ6kVE7YwKQ2++0bXs/CX3XfUZd8hnkQy?=
 =?us-ascii?Q?9et4/nLoezjw4MQ7ocpOyi8xtx8s93Lmsr9FRB7Z5qoVk2/0MNuEXcX54c2F?=
 =?us-ascii?Q?sf3nEO/ZRqppqGmKAvMZoKdZr0roHAWe46YQ1Dg9Qnt2wLnI1MhpUyXUQgj1?=
 =?us-ascii?Q?SG4fUBeIADX+ffQlSLEzPMWAdBig6mNIsZgf5Bji5M+KMAPx4LqR6yw4CJnS?=
 =?us-ascii?Q?llEP4fk8bA0kNtc6PG88Rasj2Mga7vcL3e0PLcaTqOdNznRqluzlHX/WzJ/R?=
 =?us-ascii?Q?9kmdxA/xAayAGjoWf5wGxlW0ERO4HQ6Tq7ALiuny0DMOG/eaCh4tTMQa2UeO?=
 =?us-ascii?Q?y1gF6KJS8sOMALLOPYT9zp+3eUcYH1eJnNeF19INPlZgKVoE1rlD47hxjLPc?=
 =?us-ascii?Q?0zFXth8GHwwj8nzv1dqRZ6Rokm7xhyboSpZRUNomwBngPlUBjw9Qvco+lo0N?=
 =?us-ascii?Q?ElX+mmt1b4OfSxRhLbjdQnd48v45mDyFyGc7YSmi9vIWY409XdWnWXVYnsjU?=
 =?us-ascii?Q?T39PbCZjrPizPsFdL/5b1AIeaJQezTaAFOPxZRLJHZKaEzvBtbqT0D+OWwdK?=
 =?us-ascii?Q?fKeLjbmp38SAxpPSSSF80bzZB0X0QsJ3E6R2KNLbrrcYPqHOmvqzs5PljDN4?=
 =?us-ascii?Q?stS9Q0xJsa415EJe0rEjcEAHW20RX3FJYZbmwmXIRM0wX5iVaYGdHFIM2ZtK?=
 =?us-ascii?Q?FkL71Sro5j3JjbXYlWUERMzrBTzs8rZGRPSEVb4JmVJPapHmSekKsJ7o4maS?=
 =?us-ascii?Q?Gf90g7GyFimnqJFHGQmVI7XqAa2Lk2VaVXmjWSat6eC8FJNPQY+5NnmS/m56?=
 =?us-ascii?Q?M0fCWYMlCXp9E4doQtPyvnsnR5vst8bdfaHDlbuTY7VwufDlama5LF6hyVaC?=
 =?us-ascii?Q?k8r5gnhffY0NyZCBJfowiRo0M3y3pg0x6uZA616B+DMUDIDQK0rQOzdWpprm?=
 =?us-ascii?Q?Cb5FOh7gR5ZK6t1LvJ656iHgVkTopCElgi4YI+C0ZjewgNM4bdLBWLmoAcdm?=
 =?us-ascii?Q?AwEp79axr1a1JoB7jUlMfVKvSBXJayRx93wNNtk6AEvRmgnlt34kWbaWfgHK?=
 =?us-ascii?Q?Szb34A+DTbcN39oUvwQd/GusReZfVpqu5mrppsOXNcu6RE5fIjYRVL9NMwrU?=
 =?us-ascii?Q?4wQxeBGttCFCO18QWqMG3iEuiq01UmC76uuyFPlRmjtWkp9dNkguaV1rnA2F?=
 =?us-ascii?Q?YVJ7b3xJsZsBIyLULBk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 15:44:54.2962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 560d0266-55f9-4938-20ea-08de22cb973e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6525

This is the default method to recover the remote processor from crash.
During this recovery the Linux will stop the remote, load the same
firmware again and start the remote processor. As of now, coredump
callback does not contain any useful implementation, but this can be
changed as required.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 0b7b173d0d26..8677b732ad14 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -891,6 +891,11 @@ static int zynqmp_r5_detach(struct rproc *rproc)
 	return 0;
 }
 
+static void zynqmp_r5_coredump(struct rproc *rproc)
+{
+	(void)rproc;
+}
+
 static const struct rproc_ops zynqmp_r5_rproc_ops = {
 	.prepare	= zynqmp_r5_rproc_prepare,
 	.unprepare	= zynqmp_r5_rproc_unprepare,
@@ -905,6 +910,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
 	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
 	.attach		= zynqmp_r5_attach,
 	.detach		= zynqmp_r5_detach,
+	.coredump	= zynqmp_r5_coredump,
 };
 
 /**
@@ -938,7 +944,7 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 
 	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
 
-	r5_rproc->recovery_disabled = true;
+	r5_rproc->recovery_disabled = false;
 	r5_rproc->has_iommu = false;
 	r5_rproc->auto_boot = false;
 	r5_core = r5_rproc->priv;
-- 
2.34.1

