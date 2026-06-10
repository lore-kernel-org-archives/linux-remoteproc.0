Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012036.outbound.protection.outlook.com [40.107.200.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6673546C4;
	Wed, 10 Jun 2026 18:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781116088; cv=fail; b=lA83wiHKum92VbBOvgtq9FyfD7RwWmezrdzCJzKUt8ciVY68Sts59nqOa7hKG3/hNSr6AqDy5VSHVYYzLb5+Arw5boUfIb2zmjmmND+NGl2iSHjVhYtNrQ2U1AzE5GBrnoOIumJU5h0QC7fTiK1PxYdFVWPSRrcNEWwxhq0G83M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781116088; c=relaxed/simple;
	bh=JeZWrAkpT28HlDYLafknjQUUJ3hLBjTUSCrJ+afgm9A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rq88gmBgQywizoLz2qKyfwnJ/AepeSjHQEbSHLSf5P+/6uprpnl94XYW3WmqAp27sc4CElShszAqtJD1NtCbVkhqhAnODrIzDiTaLzTgba2kNzIywf19hp4lls7LygQbenbBxwn+HjzNLaEwllFFFROL2DANUXyseyWFP2IKvkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nMqwkyCe; arc=fail smtp.client-ip=40.107.200.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nMqwkyCe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ki/eLnJdf3cNzysemjye64VVdE83i4qG2Ra0nPDRPec0cYn5PJOAEVgg8j5NqkcqY8biLksAYRxPjc2kd1If+B7ZCtOOCI8519QIGklc1cUEZccNzJ/+nxp96B2DUDmurp6UAbIgg8QYCIddAkYh7fFDEosNdn/Q4VS9XORgppNoGp+r72yWUcgwmn3YeYG8r5/yNqv5HErGv6ze9tzoOJoWpNvvQ2U/ebaUNrvJM8+mGbKs9W55hO5mkvN2cPC2q4X4HVdI2ZkwW13e5xypC+MHBTlkbEZYT4eq+hoROD1mbV/5r67r7jcjETQtF1PHiSYhAPoKjPh5uIaG4uhmnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDrfqeXTeSDBhgdvSql2q2wxo6MasYkoo59Z5v/13Tg=;
 b=Ttx1tNmB5MJVKeAtJZmiIOoroAmjYE+aXXe1uFGXfUElFzaFkB4ZuSWdBbiUZ+u+miT3k56OOQxZWlbKA99pPfZ1qVR6/BC4wa6IZzu2zqQqjKHPU0GEd6hgRSbwCqyc6svTKA7Yd4fso3hQ/nFdHBqvoHES6lqXtIWbwAwZtFbveZ7/ineQoIY5ysEBYvFGshJLojjQ+g1ijS+ydGv1X3qDdttfcyYiW2ZGCcw0xHCTvWi7eepcQYdDWgPKCONBzvBfL1sX+TX2jkFJ7cx3O3eD/0JOquiuwgPCBWwGIMrqzBYQKgZ3OtyYHQRr5CQAOMMh6Mh1h5hZUC1gjxqDpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDrfqeXTeSDBhgdvSql2q2wxo6MasYkoo59Z5v/13Tg=;
 b=nMqwkyCe69U3uUKMaWQq9VgvfqYDlW+HOxhS7citnmmUwLOUpj++BDI8Xc83ItexMBCC50KOIChteOK2denipkbhWe6K1YD1MXjLG1uh47NZ9aPZKTlfKmXPagkXoI1gk2SoMN9As8cXfORavESb9u70Y04DcMkgllwz1VrSwY8=
Received: from SJ0PR13CA0097.namprd13.prod.outlook.com (2603:10b6:a03:2c5::12)
 by SN7PR12MB7884.namprd12.prod.outlook.com (2603:10b6:806:343::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 18:28:03 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::a6) by SJ0PR13CA0097.outlook.office365.com
 (2603:10b6:a03:2c5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Wed,
 10 Jun 2026 18:28:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 18:28:03 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 10 Jun
 2026 13:28:01 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 10 Jun 2026 13:28:01 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH v5 1/2] remoteproc: core: full attach detach during recovery
Date: Wed, 10 Jun 2026 11:27:10 -0700
Message-ID: <20260610182711.1758544-2-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610182711.1758544-1-tanmay.shah@amd.com>
References: <20260610182711.1758544-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|SN7PR12MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: 79aea3aa-ecbf-4f72-6f53-08dec71e0225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|376014|82310400026|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	9b0c3W1F6R92OqGNmp4ctSfG+VTh7FHuFgT4uIm0is4F1EtYa6X4UwoeFeACdb/5nLPQDJJRSCaM45LSH3TovMruSrJogDpLB2Qc7Ao7i0boOuASf63jQn96l3GffYKSq4utMu0OM1kvMOjUjVeKCNlDLDSjyuW4MvtYUM588WZDc+6y97yiKkxObXmzQ2Uk52o8g/NwhTUlrMelIKadKH4QQgvFm59rZr2+j8FP33mECo+mWegWGUCqAq29M2lr438A5bDBmUAI6jh1Qaxj6KDSUJWIYUvwXtow1sR1fAdxT3e374QiKNdVpAxyaeZ0kWAx5/JKerAJey7Tzg5HTZqu9I63/70h7tNfSa8VvSqLjpsJa6HOFAaLUFQ7rxEBZ/gkaJyGZAzXFtT17deHnUMZDYClJdFRQLq9cHkqQ3xHtcA+1anJU4hYpB3DocelyoC7RO9r0a01uDMM7wQmLjAiBjOJnLUvpr/OZNeMOBXrxC9Nm6jprl6nEkkRPbngC9ONM+bHDf5bSv7kpFAP0U6yCPoNVMr5OjOSJdBznZsgksFddnWv69vXrZGKpzZxwXdTr7D7NNRvHn3UTbzomca03hxR4wPjSwKQeorSwSNsgniVU1GGZRr9gHO4v+4EVMPl9TB9fON9Z154N9hinrxebQHyhuilke7jQ4wjyCYMGOwUGUrDJzXC7zvvVSXv2RfbER4KFm8kZRgMCGvNTSujX0W29LkmCJ3NPnZrZWA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(376014)(82310400026)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U1603k9sAUDQrMm2OK5Xx3CkkpLliHb3ZjUO4/ytVB/ckPXi/EvGAPYWDGhtJhZ2W+FnpycXaA+qvvdxiO4V7qQdzx6BvUGN/s/v0e8ZkR99uvOQdh/PHJ7jxBwmw7faofgJXXWbKizl8uecgePCBfkAYRKLOP2Lxr/DQVhpTWoVu2Q+NWY83MiICc2do7DDYYhg+EktOXUJ4u9Tm+tdtNNlX+EJy8jbhIjw799YpCzRJuSwNhQii5Z95BHeSEEI/5GEk7INrzGOCha8+SfLzE9kgAw9+I9yHqGXCt/B9v0ALjCos6DHnJ3bptCm8Hh5GjRY88tDalovbvd5UCbYrjgXHTi3EWBds0DC6HVR3KDZBWzONy8gKCu7jCAnBmb9EVs7rouxEX7qO0Fhfxc1CLB29NSXKDTGv/gUbNmTfd4CzjyO4iB6Y7qIRUtpsx5w
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 18:28:03.0793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79aea3aa-ecbf-4f72-6f53-08dec71e0225
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7884

Current attach on recovery mechanism loads the clean resource table
during recovery, but doesn't re-allocate the resources. RPMsg
communication will fail after recovery due to this. Fix this
incorrect behavior by doing the full detach and attach of remote
processor during the recovery. This will load the clean resource table
and re-allocate all the resources, which will set up correct vring
information in the resource table.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/remoteproc_core.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f003be006b1b..8393468fa1ee 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1776,7 +1776,20 @@ static int rproc_attach_recovery(struct rproc *rproc)
 	if (ret)
 		return ret;
 
-	return __rproc_attach(rproc);
+	/* clean up all acquired resources */
+	rproc_resource_cleanup(rproc);
+
+	/* release HW resources if needed */
+	rproc_unprepare_device(rproc);
+
+	rproc_disable_iommu(rproc);
+
+	/* Free the copy of the resource table */
+	kfree(rproc->cached_table);
+	rproc->cached_table = NULL;
+	rproc->table_ptr = NULL;
+
+	return rproc_attach(rproc);
 }
 
 static int rproc_boot_recovery(struct rproc *rproc)
-- 
2.34.1

