Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9530B2EBB89;
	Wed, 16 Jul 2025 21:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752701472; cv=fail; b=Ys+aD8eVhzr96jmiYxSt8U/RVWZFByeXnGKf1PZtXNPBqWx1/EPsz9LZFtGivFKm+sBWH6YHpDbtseXHWf+3/BYIzjG/z+oGItTn4HiZ5FsYxQHjWi7JnBRA4bTkSp0OHslQt10mAlprXmVjhbcAgPLnMgwa/WGruQ2fo9qw/G4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752701472; c=relaxed/simple;
	bh=KcLaymDj5NgJXk7t4Lz2KNH0DN05DsdQIK0ypbQ6bGk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BGhwaObwfEcHv6674/b6/GggPW+4RkD4KUo1df50HPopSkE1ezU3cDzd79PeezCUwgsDFni4l+cIjq9IoP1TLDI/5D2V50zxTJPeZ8w2PeacyAxlOjZWj+fQYItyvjFlLk08+QAemfNzqNJmdK3Fc77C0OTLCxgQrfMkXEZbwQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wCDqRwYm; arc=fail smtp.client-ip=40.107.244.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wCDqRwYm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doBQ/9qrQ5KKSstLaelH+C9fErfxQsmys1ygQ6c7N+jrSMLH7nJipNBKyuGF1jwQPgTH0q/pLY9Ko33/poDs81qNACjULc2sNId6RGyTmW6TazquMtolDnuA8nZ32kvyDYlBBKRB7HcEKuApa17rNmKKrvXXfPTKN3a7yolu+IVby1QhuS4+vI45Zy9TL/dV4nNXQqJd9LUjCLWwN9UDtjHZXFFpZtRN7r6bs78o9B7MLd1COCaycnySS/fDhvoMbVyWyooSPyExBBXZjkLiu0Wv0Bkw1UEkxcOwEfBDK6TDmua6jNUQIfZkjL+obQ+bvBXc0RL2gU1TQTJ+vXTCcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRGyQIhtHBagstyPq0izT4hQEyKb4Zhir6oCi3BNzbo=;
 b=xs1DEngmgNnizg+9Ateo6WeCPs8T3RIpgCL3tCRl7OnFLP+DfV9KApus96a+JfvC5x27TCWZu9QurgZO7CSWKUFmFNxnavZMBXqHX5Vys9ig6wlBIKMIOXvl1tCwXvFvW4DbgL4ywgulhZamaUgnTr8r/F1GLM3eC/pP4/NRn9wN4GKnNENqAuQmZPT0Eb2W2wcJPxnah1YMV9ukeH0bgQZsd9dD/JUNzWUJDllfeYQWPdFB+joyw8+DrFKt+B3bawq3Z1d0b+MexrlpZUih2ghbHI1MLkGRM2NnFSHKkq5GlwZRjdudUKHtwonGPMzkLXWGr3MizgnaKTy5jgzXxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRGyQIhtHBagstyPq0izT4hQEyKb4Zhir6oCi3BNzbo=;
 b=wCDqRwYmLh6NqX8KUSSmO8ErcilIpFIhSkmwuikxfP97JXdY1JZ0+q4HQkj2lF32SB6yaCQgZKtpl+YCB9nD7iRUt3QMhRo2TNLM4wOwOoGmy5FI6983cSWNkT/P3A63pPz+D3KGUHLOQLvbEkfc22HSZLGVG2dAdQpPI71Ds+Q=
Received: from MW4PR04CA0111.namprd04.prod.outlook.com (2603:10b6:303:83::26)
 by CY3PR12MB9553.namprd12.prod.outlook.com (2603:10b6:930:109::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 21:31:09 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:303:83:cafe::5) by MW4PR04CA0111.outlook.office365.com
 (2603:10b6:303:83::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Wed,
 16 Jul 2025 21:31:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 21:31:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:31:08 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 16:31:08 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH 1/2] remoteproc: xlnx: disable unsupported features
Date: Wed, 16 Jul 2025 14:30:47 -0700
Message-ID: <20250716213048.2316424-2-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716213048.2316424-1-tanmay.shah@amd.com>
References: <20250716213048.2316424-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|CY3PR12MB9553:EE_
X-MS-Office365-Filtering-Correlation-Id: b3997af1-d234-491d-4bb0-08ddc4b01452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NiRWSh/VvnUYW8u+jpOGmoxlwHGfGT7rXz5l+m2i4Pvju0n7vGz9BYi9Bb1C?=
 =?us-ascii?Q?Fx3I6s08GKx3lYMSrHPxjDgQa2XJQxGunjm1tgHsH67z80SX91l2L2qtKCp8?=
 =?us-ascii?Q?f0coDXngBz9uzJnyzqPiqOg5pNmIz6YpWzgM/ZX/6N4M88OhLHHRc65rs3hx?=
 =?us-ascii?Q?IdVt1wg9iPFPr5gCtsd08h9cS8gfljY6U6288IVsLBBMqZPA03DwY9xvdPb9?=
 =?us-ascii?Q?a+cbF+KBNRZlxsABvNV8Z7/stmdbWYvjoGhCONsfyYD6MWhByiPkeaKwILb1?=
 =?us-ascii?Q?g0DXp3SqPvG0s8/0IGlMZqiaxWEUFb2a9qpT3CbLMP42LZLSBADt3uPwXe8V?=
 =?us-ascii?Q?4iowz434f1PVSxGRiVm79Q9vKsMmczitcnzJYcovaqrvcQgHs4pFYVYUeL/d?=
 =?us-ascii?Q?LuFXFsVp+FLJ4uc3hI/M3iCR1RH+z88TR0kRsqdu4jWcOkuz2G2rgO+hpAAB?=
 =?us-ascii?Q?tL+ss6LhlSHqn7+LJFauc6ub8O29W+VhCq3hlWPBwhNdA5vVhBKMZpiRmZfO?=
 =?us-ascii?Q?Ua4M6wICN+RLc45xcTA8Ri92GSFSyM1Gr8SSVYpG8LA4XIO3o3dzAznDgDX9?=
 =?us-ascii?Q?LnYgXciEBI4A2N/3Ah6g68g2dba4WytNgaoqo13M2pyobFooYnwwQWwxdtMu?=
 =?us-ascii?Q?UwPGTcuN1k/LkV8cAqduBWrjyrqjupwT7sC1V8ghoJoqERq8Kxp0BZ/08Jur?=
 =?us-ascii?Q?Vkc3pcvDWZ7jq+s9/TsZLL4jBGp0sK1Q52h518TS+gUVqspZ4e7t3OFkPXXy?=
 =?us-ascii?Q?4hoOWJSo1k94kP2QpKfGpVfSHDtTVjiKC2a4IWzqlUqD0mKtPU1pJCsfIYB/?=
 =?us-ascii?Q?OUUVAZH/ri012pwmYGArCX7iboNyOSUh/1bzberAiEkUqGomtS6CzcldoFq3?=
 =?us-ascii?Q?n2PnWTr+O79G78kL4rTUUP5Hhuxbl4rnOI1LR0YlZMdFxiGE4F7T0VvZi+7v?=
 =?us-ascii?Q?gVSGm7HSCbL7kRQP+tIS8HjpU4yy+tyXyOr8l0CEJuGsa/mR0SLlJi0bpl32?=
 =?us-ascii?Q?yXjTuJZ5aTAE7ZY6TTE4OrOYtysAAm8i8TF6qYcEcIBzOS+0wOdZa0tRTcFd?=
 =?us-ascii?Q?Kj0ZtUgO6H86Q114rRx+sMjf4umN6npsMQXQz/u7AIiPKE7RZ0bTsmBWYK8D?=
 =?us-ascii?Q?3Y6VoGhvlxgBTcLdiqALeF45Yl2PbhNujfdAQQSJBNr2i1kQrA8aZHJW+vcO?=
 =?us-ascii?Q?mnEeZe2mrmw2m5rIjCHUyCgPz9HVOCIkQQnGCfZk7B8MW5HHFgYUfcds9TZf?=
 =?us-ascii?Q?OHrfo/tVSzUwcqVHAh5Y3oVnfjQMLmWQwuJf1EIWwIgXy82fkDcRQZHkWUmf?=
 =?us-ascii?Q?eqjO2OLsCXRBrknKzYJYjatyZ+/G84grlphwdo+mAocgN6AAbHm8jwt4NOqK?=
 =?us-ascii?Q?Ux7CBFO+jGxfLZIgiYZR7u1kMAzl6lod+aTsHvfvBv6W6hmRFqs9f5NvqyuW?=
 =?us-ascii?Q?ElO1QgFIAmNQvK73/ZYqHukLL9KnwIIkhhxAvPge87gneC4uuxpNvxMF4As8?=
 =?us-ascii?Q?4QeOXdNeOQbOHXuESqhBd8g67iEzekP9ST11?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 21:31:08.9441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3997af1-d234-491d-4bb0-08ddc4b01452
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9553

AMD-Xilinx platform driver does not support iommu or recovery mechanism
yet. Disable both features in platform driver.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index a51523456c6e..0ffd26a47685 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -938,6 +938,8 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
 
 	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
 
+	r5_rproc->recovery_disabled = true;
+	r5_rproc->has_iommu = false;
 	r5_rproc->auto_boot = false;
 	r5_core = r5_rproc->priv;
 	r5_core->dev = cdev;
-- 
2.34.1

