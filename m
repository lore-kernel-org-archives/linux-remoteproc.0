Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2077.outbound.protection.outlook.com [40.107.212.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DA154652;
	Mon,  9 Jun 2025 22:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509180; cv=fail; b=C5zkl9aG+Hsj3lHVSEoZTPH0cc+LBbOqsW/JtXRlo1/ChNmB0cs2SyXla1dM+x5FFmeVpw8vrOUU8gG9vyuiksrJiczhmv+U5gASQkYXS+U+SXYqwDtewpOspwhVxAH8f0rjTDyl+yRF8YTI8AKOYdrBB46H0nJu9U7EWGGbdV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509180; c=relaxed/simple;
	bh=TV6241gsF6LJ4bx/DnjORA+W3f151hCz4aH6vgI4rCw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X1v1Lqqg4I6uqD7hfUW6AQL1YJQ3odh2mpguCpws8AiUtecf5ksZjtVY82nlYIGXJETOY4NyMGxSB8NVth7Ihjl3q6jZerhn6QDpjK/SVhoU6oAfSylYy5Wjhmy5p6oTKjGaG/VRSBiNdsj9moCHm5NUq0Rdip70/p1AqieQhFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=epEE18qP; arc=fail smtp.client-ip=40.107.212.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="epEE18qP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSouoRosMxTvQ/PKF0ynkplNsBpe4uyHvVMzjH6Ql9diQAMuXtNaPkz5jn4fTKitvRSxrl/HDH11xXs84bUp8vHz/hPcMvea1RPPISZY1B/gdT1O/Goc67+/XrwbS6fEz2IMOusGE8w83xm4wNZV7wrAjWHmOVdCTBPwi1Dky9/euMZUEbpnwUbEPGOsJCFYjk8SJQgOvU22W8QmuM998zsHGVaF5+j19+7ySjCm9USOp2/qfrxsvAwJSGIx3vP4fu7Rw25GHvdk6Lw3d6cvhO6dGU54Rc7lBJlXqsOsFMmLIjYbIo7MK1sTpQnJvn6iC+bF/zNUb+0CNC+S+vx1Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzsKF1bUsA3DQtAMce0eY8vqhL7S2G9HaCm/h7sqN4E=;
 b=U5HIaYIXyB6VE4lhrxcDaptydTfzypqayDwHEjIpuZaVbrumO0LaFyC0uHthnJBmGy9d0OpDtxh+cXhbN6VwMBleQrlGaowx0YDeSH2M0/ine7pyuN8eRTl5bsD3TcsRUDRk45TBxmQpuTECKOYAorF5qyhH1Csw/KeiFghMiSh/LIE/dYZq7+8BzmaETapHOMn140I92JtM9wpg4QYgElpbsftt8wxBVFRwE7PKkHPEHjanPNri6nHAJKBaNGfaqXbUSegdvdz2FPvYUwX9e2/0TGeddZyN6vj8XIkxhNceGipC1rCrjKRBnDGqDUOd1S37Pl6xCWfK2FoB4XcHhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzsKF1bUsA3DQtAMce0eY8vqhL7S2G9HaCm/h7sqN4E=;
 b=epEE18qPpp6Ar6xBgF+xBVQDkq0TTL7sQR/FXy6a5oB6SHFiMNV4UaetndRkUv1n5t38LugVI0eC5XM6UmJlSXgayTim8mFQCYmDf+a5oPZcy8X2We+uWR4ADbiG3yIC3Tq5ylkQ+W9ZXaGX24Ylxo1vgHBE89pfRWoInMP0Wcg=
Received: from SN1PR12CA0081.namprd12.prod.outlook.com (2603:10b6:802:21::16)
 by DM4PR12MB6638.namprd12.prod.outlook.com (2603:10b6:8:b5::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.34; Mon, 9 Jun 2025 22:46:15 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:802:21:cafe::2f) by SN1PR12CA0081.outlook.office365.com
 (2603:10b6:802:21::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 22:46:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 22:46:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 17:46:14 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 9 Jun 2025 17:46:13 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH] remoteproc: xlnx: allow single core use in split mode
Date: Mon, 9 Jun 2025 15:46:12 -0700
Message-ID: <20250609224612.2428151-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|DM4PR12MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: 65690aee-516c-4634-3621-08dda7a77117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LS489Dqud8/RHu/n28D+a4cmpAUij7w5XKNJZ9GDFAx5jHs23BaC0MxPMFk7?=
 =?us-ascii?Q?zFl9va340i3C0cCCm7pxGeCSMA2C60sBxMwYH3U0GE+vrnDLmX9kDw2VAsoF?=
 =?us-ascii?Q?yrJSEfRq/HPT7LoOD7pDVMWzGWT25ygWV+bqqqOaXme0ZzM+V/UKGLDEnsun?=
 =?us-ascii?Q?gB5qN4lartu5smXYiuP5xhZ/vjsij4iuPR516fKL2v6WYa6hw5VGu4cSGZbv?=
 =?us-ascii?Q?zSpcyT6tPUqO5QALvv76JpsjWEbA3w+EGOo1OW5dLlSNTQqu/CxI1jdKteti?=
 =?us-ascii?Q?+rIISh154J+0TIt2C8oteMaKbcgTfhxm2evPqBDpIZYjw8I0lRSJlKtlmZcm?=
 =?us-ascii?Q?LIJS/mT3S5e2JOEIiDVRhdHj+5Aa7S9wLmJjQjycHP0hcO23OekodXnTY4x9?=
 =?us-ascii?Q?kkCRYrvnnPzXEVJ7qkMiM/tsO6jZbOmctHiVW0+ZQSkh1gq6cqelfDgCwHHl?=
 =?us-ascii?Q?07TZ/b+M9O4/Cu2K9fnYMioFaoRIkQ/J/2p2nWsmnsVhM+oHXYhFQTuMbWsb?=
 =?us-ascii?Q?zSq+tHepUfONnkwi4NhOT+gKhM8AgDjJn08G/JOEhsiEwLsr5+HXV5cQ0nvs?=
 =?us-ascii?Q?SXoDbqdDK6k8ZSGH5NRQF6Ak05XJssOquBeWTUsdEYSo/8xl6j+bWRr9sr/W?=
 =?us-ascii?Q?HI9UWn5cFy+zWn/KVBDPUghCotGEZOkyj1I3oO4Bkboom2Op3g0hwW0BB1AJ?=
 =?us-ascii?Q?gP8oCoxMOlRHw6quZsrXYhxeG0W5wy1r6SFGBEyasLAr0BHo/lNWGXJXmHLf?=
 =?us-ascii?Q?lB7ik954XijiKIjIrpmWLHA5CN5Iw7kNbKJ24HWTy/Al0Je8j65VigU7zL8s?=
 =?us-ascii?Q?Xq211dWl22ojG51M9o3v5UueSqzvFDOEv5H+NSpEBjtkuNUp7rdxmP6E7qV5?=
 =?us-ascii?Q?nOVbpvvG7JrHvlWR6R/Xx4qJvvG4HIl/y8ZIv+kG95M6tceag6T0sWOZoD1f?=
 =?us-ascii?Q?NtwArET/sCIY0wyGqlZM+YioE4dhCw/ULBnTlGMnuV5qtzKdiiPXZcvBhRyq?=
 =?us-ascii?Q?NLLf2h2QauoywcSWe9D9bgz7yBt1K0VkMs2xUf1KIL661pyMCvLarBOQPVBi?=
 =?us-ascii?Q?y1jQYc3PP1bKSj6bmE3kDvrfSQOnRxoZ6UkNDDmmNdhhNxwrmZG25PPJG3d2?=
 =?us-ascii?Q?manjQ389iq16G9vRG8sO7c15Y04jSgJWk7e6tZg/ZgmYpMC+NRmnxC0VXXee?=
 =?us-ascii?Q?RY8misE9j2wJbczOmqYSHd5QZ5OGnKZU0khKHUqjFoD13xUc2QnB0li59XMJ?=
 =?us-ascii?Q?F8fJkbOF6fIudr6WIZJBBXgZMtJNgvI44q+hh7vEAmLA8xUcdGhA0+MNtido?=
 =?us-ascii?Q?2PikQvgrKOgZGsp5BH8KpNf7LKtXYx7LStwbuieX5oztYZb/XKvMyYM4pJxl?=
 =?us-ascii?Q?lfX4FLnlTOO9x8mpKZvehot097oPVP3yhNTujMTAZSS4aQGtm0CvsW69ujLa?=
 =?us-ascii?Q?BGWKci+hM104hHXCMA1lCC3jDRtRNNxETBV8j6XW3qXnCG2S8OQH7z81dFgz?=
 =?us-ascii?Q?M5LV6BXTUtzgtAL4l7VN6MYKzpQCOcO87qDR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 22:46:15.4466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65690aee-516c-4634-3621-08dda7a77117
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6638

It's a valid use case to have only one core enabled in cluster in split
mode. Remove exact core count expecatation from the driver.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 1af89782e116..f314dd5bdb26 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -1339,9 +1339,6 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 	if (core_count == 0) {
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

