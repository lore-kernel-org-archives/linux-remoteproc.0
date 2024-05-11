Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9603E1B7E9;
	Sat, 11 May 2024 00:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715388699; cv=fail; b=dqywOgCJ6lBpBkYkf8QLUEPPN3AFvD/1QoR3XTep3MkhBRWFEoM0A7RJSXV1ec5KRiGP3pG5YaO5amapahO3QJDB5rX4lZJiCZs3xg8nwbfQETRjT84W9vbQpXteAvwVuUlPxlnAtBGIcE5dcITJ9wZtAvy+GE/853fkuMf+AZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715388699; c=relaxed/simple;
	bh=9qkcSuIbFuZTlEsL1iwwWYbDZxX3vd9VWkdoUo+thHo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TbtzZ6GEKp3+DxB2tm4jmafEwv7+zG3VYtQ/tt38uif0VUy9kKV+wRgUdNx6H70BVkcQRIsc1EdQRORzHUM4ZCbr/rGhWAwziQj6vLKs7/XY4d64OMnz0ZKjlPBvApZxTS97yM0/JkJOIpIdSj+LtOPgqd+6cOCcbgOwh4iVDr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=t4xBbzlh; arc=fail smtp.client-ip=40.107.93.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="t4xBbzlh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QE0bFF8oEZmbz5Ge49pIMwSFiR2la1fcwfM1nOA+7LemH0o5M0Mu/2mfcChb13DJTgETg92ASun90rNkRWn614hj2gSxSHqo+NzOwD6F3xov/pob6XhlfoFi0p1Vg2NCktqDFynXmwzn734QVPAkExL/r1buorbzlgco1MSz99gHA03veN32VxMn4+iHUA6OLNknIwHQKB7Vaa4p7WvHdT4xUCF3HY4Cuaa8TpWVxxQJKk0sa72+y0mmLHq6UEPUY1cHuPO/LCF1bjOZ9kPnQPUd3fakyyWNyUBa+ER0BhG6G5WS8Q9htJ7e8astKHiTH4ABeqZOkmIP8dVP+U1MvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZE8lhGUfRKARCrEYdO+HJ2L+qCSe7dZhpBPvf7aLCC0=;
 b=S8CSoxJ5gy38J/Rl5OmoOZOEQCbbfcN/Su6bGozjHIRCc9fIHih4B/Ul7SbL0ymIuymedONRLaJYpCMai+ETOlxJGuyZ/wc3CcLpaN6bBbtEy0hxY7XHuVbyJ4pgYN+eIlXKUwET8sN+G6YDn03reLOrtepTfH5K9hJYZUkK8jPwOjBiJoolGiL13kj+ERjUD6P0GhvmmlBbe/GBTh0UemvxvJZVSVaaRnDRdPIEJ5prVLn54uDSJ00Hw8u2V44x6yCyjWxHf3REY3lERtLYZlSZKIaiKKX5+7ZVDjSOEhbO3OVu1m4oKpwM2zeOf6yCEbAX3We8xnwQv5WJYn3PFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZE8lhGUfRKARCrEYdO+HJ2L+qCSe7dZhpBPvf7aLCC0=;
 b=t4xBbzlh7BggZv23j7oS4bmQm5Pr7/IujcAK6eEeunfsJoEXJVJibk5invXoA+uiGHvy5BO2FedkXsr/qsZlbP6IFWwQ+J41W8whOao3wO/KorFuMTmDEXDCeXcr6W1+CzNNZJxnLQtk4G+5AJEQNF7U1EtiPqdEWMmM+9zs7Fs=
Received: from DS7PR03CA0246.namprd03.prod.outlook.com (2603:10b6:5:3b3::11)
 by PH0PR12MB8127.namprd12.prod.outlook.com (2603:10b6:510:292::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Sat, 11 May
 2024 00:51:35 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:3b3:cafe::e4) by DS7PR03CA0246.outlook.office365.com
 (2603:10b6:5:3b3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Sat, 11 May 2024 00:51:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Sat, 11 May 2024 00:51:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 19:51:34 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 10 May 2024 19:51:34 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH v2 0/2] remoteproc: xlnx: Add attach detach ops and sram support
Date: Fri, 10 May 2024 17:51:24 -0700
Message-ID: <20240511005126.1240430-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|PH0PR12MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: 077eff45-8a91-494d-b772-08dc715481ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|82310400017|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TD//BkmJeeQZ4LOgiuiovn2m3jaWzoRM4KxI9IttAPETAuIriTosxlYcmgIN?=
 =?us-ascii?Q?3qyq3PZwcL83/xPtg2q8QOAAMA/wEPpRAksvTHitnsx4f/skfK36oy7sWf9H?=
 =?us-ascii?Q?Jrc2OfH8qg6Bf5iqL/sO1KVgGINpMnHM/YdCUoQ3F9ydodvl9GeDT/HT2X4A?=
 =?us-ascii?Q?0jmxVqGy2NRI6RH7g7oePeVIG2nhyTPrpzlpIbo1e1o6qGIRUXMezLlmQEAW?=
 =?us-ascii?Q?70cNdPLa+r0FJCyrzaxGC+LPJtclDaZptrR9uKIlpuG0EaFgSU16yAPIkbWY?=
 =?us-ascii?Q?LrgeVmq6tsMWKBj7eUUV+sXcR5ygjVUW3V415kLxwHtru+FKYiWLdWSP4rCi?=
 =?us-ascii?Q?/bN0xh0OsmNYLEbOQ7nU1XR2xLXFMUbQE87LCWgqzeTl1DtQ7eQpmZ2afql7?=
 =?us-ascii?Q?ZMk8NkfEAfC7Tuf4Kf/IaSY/SGwqTVyRbk4/IFR0/geaVVnUfNWkL4mLCsKo?=
 =?us-ascii?Q?gkebj7751MOV+hsejXJM30nmhKsWU72nZcoy7fweaiwn9ui3RYxWLu2EyVza?=
 =?us-ascii?Q?3mM72ZPOgxtqsWg1QIdUo5nlfCUQn+33qiHzjK9JT1e/YF6eWT7x+hH4+KE1?=
 =?us-ascii?Q?dSZ1QLVYyJH3gbibqpTp2vpCdHe+GxZA9b05qHBYxpqNW1RjmQ4WN/a0F9L5?=
 =?us-ascii?Q?YgXaVgTWeAFs500jlnk8OKbF+haLTsIWE3IMGpcfgSZ99yeZrsfR/kPJhm0K?=
 =?us-ascii?Q?D/49eOf60Q+lHWi5t7CBrCLjz9ZCZ5B5o00pLCzo4u33shGGWZKNPC/3epDZ?=
 =?us-ascii?Q?sobCrjBQxFnU64vNn+alUvg1FyWJxiGyo/yrI2uM8nyakCm8IDfq9YJ1delx?=
 =?us-ascii?Q?PTO1HL3GbyNebIrmxm7Wp5vdvmrLMMyEiwIJCTyt7J3UJhCCwAuAtNmmBJJQ?=
 =?us-ascii?Q?EcJGO12kDJ7JIxfNLb7XbCDYEI8+KtbyoOpfFPT4xS7GlBlkpQZEi8imXNuY?=
 =?us-ascii?Q?jF8dlPta9T76qxOjeO6aap7gD0qtC2OdH2s7XSsiV/iaoILEAk4XQs+yWoOV?=
 =?us-ascii?Q?+m0MSdfdXi12GC4xvjK3PTkgKGqyTQxgFiJ4tt4fduy78FqiS3yA3oTAvYzS?=
 =?us-ascii?Q?vjmwSomuHvxO4wrpK+G6lx9tIu5G/Y9IZI+fSFxZfohC+yRVfll0ePCUv826?=
 =?us-ascii?Q?NqMHBFOdkZx/4A1nuhLn9DBDR3721ZtiJ0+VonN5ZamVoJVtcO7te7MAtdYn?=
 =?us-ascii?Q?dETwT0pWAWx09Iis59EcAVKC/bW3siilWhjcjPY+f+Hukp3FL8YfwjZVBtiA?=
 =?us-ascii?Q?owqxtmQjTVMlOXzG1H13SyznIMvs4lsfvJu8trbxiO4d3pnBl/wZU9eThbTO?=
 =?us-ascii?Q?AOgtico39sWVf9mnCVt80VMgyu40ELjM5XnPZkAECKn1iln/DuBbqk5yvRpb?=
 =?us-ascii?Q?fu7w2FrpoxdM4Vu4H56gGcxgLIMs?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400017)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 00:51:34.9665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 077eff45-8a91-494d-b772-08dc715481ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8127

Attach detach ops are needed to connect to remote processor that is
running before remoteproc driver is probed. Implement remoteproc
framework ops that enables such use case on AMD-Xilinx platforms.

Remote processor can also use On Chip sram Memory (OCM) for various
purpose. For example, for fast code execution or data access compare
to DDR memory. Such sram region is made available to remoteproc nodes
via "sram" property. Add support in driver to parse and use OCM memory
via sram property.

Changes in v2:
  - Fix following sparse warnings

drivers/remoteproc/xlnx_r5_remoteproc.c:827:21: sparse:    expected struct rsc_tbl_data *rsc_data_va
drivers/remoteproc/xlnx_r5_remoteproc.c:844:18: sparse:    expected struct resource_table *rsc_addr
drivers/remoteproc/xlnx_r5_remoteproc.c:898:24: sparse:    expected void volatile [noderef] __iomem *addr
drivers/remoteproc/xlnx_r5_remoteproc.c:995:26: sparse: warning: Using plain integer as NULL pointer

Tanmay Shah (2):
  drivers: remoteproc: xlnx: add attach detach support
  drivers: remoteproc: xlnx: add sram support

 drivers/remoteproc/xlnx_r5_remoteproc.c | 385 +++++++++++++++++++++++-
 1 file changed, 380 insertions(+), 5 deletions(-)


base-commit: c8d8f841e95bcc07ac8c5621fc171a24f1fd5cdb
-- 
2.25.1

