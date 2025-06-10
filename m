Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD26523AE83;
	Tue, 10 Jun 2025 19:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749583668; cv=fail; b=XnadMQv+V5TG8JU+gAvaczOi7gJunhLXZlTnK0QAXrVH82qlyn/Jt11M++PtENx0j3JII6dMGieJj+JEyWqRBIPg9N8bAG44kP4R2EEOCE2ermv2yBALf6ZcljhHwtLugl+RDS6YzTTO/1ISYaShw83yV1zN+uATMblL+5/HloQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749583668; c=relaxed/simple;
	bh=6XwIbdLm0BcLNZKlpnrVGiT/42N4jiR48qzVJnvbtL8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kTrYbYHX7tbAb+jW+1SbqjGNE8/LJuv3d1P+MI9d3eDIDOwVCRtFdoPNQKkg59FAn7PLZzCFNbQtJ4heY3ZtaqvY+dKU+YmeOKnvh7VRStRoXgldqdEr6r7EQvSd64njferbICF++qC3fPE1rEYFL7aiwfIQ7CqE8My3QAeq9+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3kZvtlre; arc=fail smtp.client-ip=40.107.93.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3kZvtlre"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDiIghdlvS7qE2ZL8Yf8xo0CPGYssrIca4O/lcjlQWuZDjeKIqotlMJIzxu4R2sAv1AvqA1HDNZOxPPsQqBVrwdW18hbDQp9lcRBbus79FD5+VHwPeYw5y1j68FD1iuqa4ku6/tSMQRU5SnWaf+pr0RKpaQ9HkOcPL5x3xNTohUruIF7LTNbneGNtgxsl4bgDT7Cf8cOCkvT87mE2EfLx4P0tV8EugkJYgKIDDlJutQdAeoKw0/wxbkd9ZKezlVZeQ+ETaSqjNWWHufjygjnd7k26oE3I9KQX5ghhR4WCV/YfZARaJLO2ILfOgKHMGMOOVTFcISNynSPQtIX8NB5zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLXZ2sPlpM7jz4jZeALnWHW6tf9O+FO/KqahxGUDMgY=;
 b=TRHizMLLxZmqlL+JFJlDNrNtRw0vmHjuMEUBD1f2Mol9Sw1o5cF/G5jS6qTWRfgRx05Pi5qvMwbKif61BT5gDa7rhM2eLYFRnW/MdUhbGxlehIFaU8duka+NYGJqyKcKbX5lu8lee71H5mSQWff5AYr8O0d2wNEwr2vU3d8AbEfSlYEy93NzLmafmzZgUn6pKYYTfBJZWhJRadjjT0T6xi9/+flParGn4SG2l9C7Jjq4FKdNEKMoHknjc9UkyV36wBnUN/KOOnnMCcKU1Bc4vjeUHpeMDRzEneNt8U5QJhTvqu950mZGeoSBakrlpbM9aOIXKxBMkJQrdDs75GDmng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLXZ2sPlpM7jz4jZeALnWHW6tf9O+FO/KqahxGUDMgY=;
 b=3kZvtlrefl76DUhThv6bSCm+E7NNFDv3EIE537diQMlTe/t7D3XsqmGcZsNt48tAaNBUUCF/pwaJIGb+S1/XASlrcwohEQgOGouzQjvjBsDaS0BALh/9QWceGHCY6KJpVG0p2EMVIe+lpvHzyzV9QDJ/V6mj8AAAVBWRqbnSY8U=
Received: from MW4PR03CA0184.namprd03.prod.outlook.com (2603:10b6:303:b8::9)
 by LV8PR12MB9083.namprd12.prod.outlook.com (2603:10b6:408:18c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Tue, 10 Jun
 2025 19:27:44 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:303:b8:cafe::aa) by MW4PR03CA0184.outlook.office365.com
 (2603:10b6:303:b8::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 10 Jun 2025 19:27:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 10 Jun 2025 19:27:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 14:27:43 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Jun 2025 14:27:42 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH v2] remoteproc: xlnx: allow single core use in split mode
Date: Tue, 10 Jun 2025 12:27:38 -0700
Message-ID: <20250610192738.3095247-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|LV8PR12MB9083:EE_
X-MS-Office365-Filtering-Correlation-Id: 7df50e8b-2109-4462-c402-08dda854dfe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DGt/l2iTwk6Y19FrU2HD3EqUDYJDCKBOkgNWrN7/qy6cIo45c0HD63K+dQHc?=
 =?us-ascii?Q?Bpt/dpXIbXnRkwskPcTGz5FehUy90SdWeUC0RFdDLEA12e/xSMn4avqVZHUn?=
 =?us-ascii?Q?Sl74HtBcKgeU4caWzcu362Yzx4TL7LCSd0blWkbdwbabbu3a7sn1OV/ofh9d?=
 =?us-ascii?Q?EwSUNFeU01oAU+Mt9S4PRNH+QfBWx9PiL/WLohPXBy0LmRpu1rVc0vXp8Tnw?=
 =?us-ascii?Q?Lo8D/77JVTkcNhCM1O4J4wuTpxa1lEtbBzkZNG9PH8Fw8CfI/W3rNZTl0vmx?=
 =?us-ascii?Q?LmjdxHXPGmyl9WR5CcyLCNUWHA+MvGjQv6pAqEjs9dG/kZy0EJT63os4QqRl?=
 =?us-ascii?Q?oXnhJYvk+maYIir0UMtYGxRzFgznV1GKdWN81I3LUwi+KrLHUhVRcp5qwwIg?=
 =?us-ascii?Q?C4K3+e0L+RxNAZ6M5RXjvuPutL3sl0YLO77LOU6svQfl9JZ+TT39GnQPbWB6?=
 =?us-ascii?Q?KE4ejYsUh3i6CIZXCdpxW8uL+JJwbs96n7r+GkIJsl1BUv6AGbmP6d87F2PJ?=
 =?us-ascii?Q?K968Azzb9e66jNHG17nagsqZDHr4lcroT5Wm3DD1u5qGSIaF3J3HBRp9T0+g?=
 =?us-ascii?Q?Blk5YL1Xx1IhMW0zzI4KXWNI1bZyewIBmAeDzJ51lq0otk6lBzXrT1tKTFoh?=
 =?us-ascii?Q?0x2nItTyQyRE2kUTFSL2zjNEpN8TxaIzpVOIeQqTxchUZkzNbGxz8/ImQnOL?=
 =?us-ascii?Q?ULghvtmRZKdFx8IxoyJt9OP4v8yHvKMkkakfPeSoNISgycGsZj5Ia85tlAZV?=
 =?us-ascii?Q?mHW2HRzAxqdv7Vjmb5TS0SGOQMo/B64MFSVY03X1jcUQqQSKd5Ssp1I2izst?=
 =?us-ascii?Q?BS8xwWW+IO5DdG1IqdnzXQ9KTfggAmbR77yz8Hup6Xh8w+tLs+sTjQVlRwcs?=
 =?us-ascii?Q?8bVF4V54I7J2qIlcuYsv2uweCoefTQ91cV18GbhwnDzKAkbLu3Nd/OcpKccj?=
 =?us-ascii?Q?64jCDJMLESr8+cKgGoC+6uxV7wj3CHxXHl5MVt/RNaFWcMho9NroMEuqSQWN?=
 =?us-ascii?Q?3PkDQNlehMZuo/5erEoRBatNZhcjuQuaHIEZOKrRhtpsvlYlgyrJZW2Mm8pr?=
 =?us-ascii?Q?SRRB2h84LPOTCaBsUlguDSTeIe4vtaq12r7I2Vw8QI4FJd4BuZ/YXwlR2OQa?=
 =?us-ascii?Q?r4Ny3J94ELHtMaX6XLCBwo3HcoS6uZj/7aTunMPSH4SuT9ggOER+AaJE75CP?=
 =?us-ascii?Q?PacNpO86PXzLfsFdf+dYiVO+Y6T4NjW6JbXo9svP+9rNkKqJkNsams1ZXF59?=
 =?us-ascii?Q?aDipdbeOStoUWz6AxvCZlrpBIGZdFf16dfKNJsF0SVtEfNWg71yC6nJYPYDz?=
 =?us-ascii?Q?clbvRboYrYua7aGjQXAsnyp/oWKaeA2ZMqMgfRNX7oAwyHXa8Xc6ebSijN6M?=
 =?us-ascii?Q?xMCu+SH7TNVWbzvOfMrcTr8oR9nSso+9Vb1bLsynPIXmeY7xIi1TPw27i7BP?=
 =?us-ascii?Q?3qmpQdx4QVwS+RWM7bok1jm3qS9uMEO8Ht9opNisB+Vi+1JHvSGtv2gKh1HD?=
 =?us-ascii?Q?DzijmMsgdpXJrIkm5biYd6Juja7YYEBwCYEb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 19:27:44.1765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df50e8b-2109-4462-c402-08dda854dfe0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9083

It's a valid use case to have only one core enabled in cluster in split
mode. Remove exact core count expecatation from the driver.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Change in v2:
  - limit core_count to max 2

 drivers/remoteproc/xlnx_r5_remoteproc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 1af89782e116..a1beaa2acc96 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -1336,12 +1336,9 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 	 * and ignore core1 dt node.
 	 */
 	core_count = of_get_available_child_count(dev_node);
-	if (core_count == 0) {
+	if (core_count == 0 || core_count > 2) {
 		dev_err(dev, "Invalid number of r5 cores %d", core_count);
 		return -EINVAL;
-	} else if (cluster_mode == SPLIT_MODE && core_count != 2) {
-		dev_err(dev, "Invalid number of r5 cores for split mode\n");
-		return -EINVAL;
 	} else if (cluster_mode == LOCKSTEP_MODE && core_count == 2) {
 		dev_warn(dev, "Only r5 core0 will be used\n");
 		core_count = 1;

base-commit: dc8417021bcd01914a416bf8bab811a6c5e7d99a
-- 
2.34.1

