Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACC03085D2;
	Wed, 18 Jun 2025 18:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270788; cv=fail; b=SNorx2P2wCPM0Ts22oXHTvlyIFohG1QzIip3/3YzxjJL+S0679NKVZd5qlDZEBZJGXlSkm6sW4tTPfBeYHy7ADlQvJpGcKgYiJm/9klBYZlKBoBhrwcoyCFsROSctSHIYR0xF9MclwZTuXiIJltCoSwq/YL+vMhiKDbGO7gehj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270788; c=relaxed/simple;
	bh=sKuBHuKP+wUvo0bVUwDMtBuhSZEAp4QBk4BjywwZBX0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YhvYrL4GOSBUvpGiIfeF2A1StLHfBGlFg4hWGfiuk7VhkBSfgEiwMfbAU635wPEqxPECG9pLKi/4a8Ke7CjKjB6Y2UlhXSdfy87Bfve4W7oN6k3djLbspLW/S9tnL/TU86n4HIUlJR+/f6zKzaRqMeBwsjjgsmsl53Y4SECSiik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RpVHEfEQ; arc=fail smtp.client-ip=40.107.223.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RpVHEfEQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCwFUfiB20vQzEtEHG0xKOBnciGwuJv0IeXweiTDfK2uVUCCephBhBDLEo5cddMmaE6Csfo9ih32jdQxvW/Zi2ocspLcu+3ctHQkPxXVNsIMzg+kQU1geb2VkVXNv5hQmFrLpcC1jVyL63EJan4WeAu0mOaA2iHkckJwnHDuoTxgDSg0ryjflPpV+YeMIPORWAV9BmzXJ9s+L2wdnTfG3tOOt8nyGvMmnxSXk/jQri0Ip645luiE+WFtg9ilv6tCn/8/CqJYDdmYL6pqo6exONkv92ynkbPGvNOKu8SNjkzJWq0PeRsWlzhNg1hTJrzciijgk2eJoKtnhioPQl8Zrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJBYUme/6FspcbncmaTHR1T13wg/R9PVnWpF1C7HVzE=;
 b=Jq7aAlfFuk2Cn0YooECFUuIlsOHso6oY3dmKeMRgIJqZsMrIv7ihlMzcL8cOgfYKdr0aftn45DIbXZooPAhy8K4PbpMC72YHmRQiZsn8WyzzARLdC/no8/ZK2khW6llajouOstboXvyZln5LnOA9It8URFeojeVGT2+N9djZ6r3WwVlVi8cyaIMxsEieRqc/XS9BVw76VT8d6iz9yC+wIBXjqM/fhr5mSYIZ25FBdTnRdsidwDE9r6xo0tdw5vokra2bG341n3a7VWY154dgcJC75StXFs2diKg8Cs7qbXN1QTQGiDc9dYq4itQ5bzeDpgCqgpbPTXZytqPk6UtqcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJBYUme/6FspcbncmaTHR1T13wg/R9PVnWpF1C7HVzE=;
 b=RpVHEfEQqITNW3x9bsv9wEkcJvWyUjcipF2+61fYxlT6p8pBdyC9eyoNhAekRL0cUChqMGMeDze0K8jr+R6EA9ALchbCMB4vl+LdailyeFqPEOUZFqhTC7c2PIB94/vQIwNUEOOSbV/8Fu1sVHYarvmRhnlXcGirz4CnxV5dG7s=
Received: from SA0PR11CA0096.namprd11.prod.outlook.com (2603:10b6:806:d1::11)
 by DM4PR12MB5721.namprd12.prod.outlook.com (2603:10b6:8:5c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 18:19:42 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:d1:cafe::c5) by SA0PR11CA0096.outlook.office365.com
 (2603:10b6:806:d1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.33 via Frontend Transport; Wed,
 18 Jun 2025 18:19:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Wed, 18 Jun 2025 18:19:41 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Jun
 2025 13:19:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Jun
 2025 13:19:40 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 18 Jun 2025 13:19:40 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v3] remoteproc: xlnx: allow single core use in split mode
Date: Wed, 18 Jun 2025 11:19:33 -0700
Message-ID: <20250618181933.1253033-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|DM4PR12MB5721:EE_
X-MS-Office365-Filtering-Correlation-Id: 8acbd49a-7829-492a-1358-08ddae94b1d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QRiMhxidYVu4p9yv2URcXb7Drm3Dr/4UFCcigpFhba3TbInNrYnTZ3RGLy8H?=
 =?us-ascii?Q?l02isIwlfvCAQ2RYbEVYEVW/r0WIj0lE1lQUN0nA6aWSMG/L6Jcx38un23+R?=
 =?us-ascii?Q?O1c8ApXLSzahsO4Op96ECb/C0VTLuxgIAHt37qYYnBWmOW/4+26zNromsKB/?=
 =?us-ascii?Q?zmyFUWkXo5e1Zd0dQ/idr6MoYZB3jFy/8oLkVofIR/n2Tx97sXYJhEevHpzq?=
 =?us-ascii?Q?0wvuR7W7I0Uujq3qNx29Phb09xz7y1KVxhJgvgZmCrV0Fjtw5dCMm9ykzyug?=
 =?us-ascii?Q?HaO1lCvg2ngpfG5LQLUTs3pCBQFa64iGHH5Yf2EgvYrncIrD38gzZiRF99TK?=
 =?us-ascii?Q?9IDwfXA186F9X7/7BinPVEDPj4ccDL4k2TvW9qAaFJ1V1AEHKblsHySC2KRB?=
 =?us-ascii?Q?s9H9TZmwApR3KPwSRfhwMzqo3KpKj6aO7u92Inly9PwNv/qbK8ATZfrLo9hh?=
 =?us-ascii?Q?dGtIje4AAmtuj+WRdcOoGUZx4riljyvdHEi9EP3aizsm1n2uQK/cBEmU9uGU?=
 =?us-ascii?Q?JXbYbLN9cyj6FOehMiYeP6wjg8N60CRb+qssxDcTQQTc+V3wyRw30U6Io3yk?=
 =?us-ascii?Q?OprfiU9Fpud7ZerXpUsIkIq2SLcb31xcbu5uUjkLkWGMHQk2RscjIpts+MxI?=
 =?us-ascii?Q?uTMIUkDsF8NWMnPv8tAjaDbDv1gzgtONv3oYHec5G8jdGgtKgcrTMcLm3Nd1?=
 =?us-ascii?Q?IM52HcwGxHMQn3tFIfDFmvfALYO+c7MASZ8WNUPugZ/Gn+CH+GKVI5pzby/0?=
 =?us-ascii?Q?Ca0l2GKNBZHdLQCmAvksh05uA294fHcbJA5t9Vt+nsK+7AqzmiJAvstSToa6?=
 =?us-ascii?Q?79lo0P/0XX3y+jbneZg84j3I/GlXa8RaccZgkz2OTzIEK4AKeyFwFm7MinLh?=
 =?us-ascii?Q?yZnEvimKsilu11kSS+aLokmArGO4mFD4sRwU0IZ7CnNAsH4mmXtwpg6WtsZX?=
 =?us-ascii?Q?CAR4msTbpt+vNZ/iZL6s/lWPmxBIu7fEeA3xMmZ7EyxbT18cVdBgyk/iLjn4?=
 =?us-ascii?Q?iUHPaL7FW8ePc6+DA5ux/+QXNwq4g1wIjGmJw/JmmU4WCw9AmjrpBuREoS79?=
 =?us-ascii?Q?gewRPla93MDxoItqiX6OyCKgg/y2uNg1JeyurJPEcp8yHeLu9QRXHd3NSjwZ?=
 =?us-ascii?Q?/BhYnxuaVo/JU4bVLHh11H9A7Pe9KT2SBP5lY6nRP+fs+LNtGzKVzOi5eKV7?=
 =?us-ascii?Q?L/2lrNvGH6nCG9X/NXplLw2TSABHjsEGrdIBuTd9/Ux5zKSObmy+/0h45lsZ?=
 =?us-ascii?Q?flcIaXDvtThWAsLC1rNryQYAGmeuwdZEP4Y/OdUWZSAHTWbfU+aOj4xuow7v?=
 =?us-ascii?Q?fkodf0dnO8BtOs2FNIWkq3EpKcbO5ty8P/9sDB+f5noIHBlnpZwikYVXJ+zz?=
 =?us-ascii?Q?/tkS3WYwE3AoU6+ZPCf5jgVr7VJcRLjPXO+Mx8kQ9K3huoqo+6SfUINzLrS8?=
 =?us-ascii?Q?MJml+DiuT9VFSGPBKGVeqDdy1fWBF67eeVxyzU+Umidx2BhIq41tbLpJcTTA?=
 =?us-ascii?Q?CCm8fnuGuC/N13oA7FtGEL/EVj7v3wLIPBrr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 18:19:41.7899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8acbd49a-7829-492a-1358-08ddae94b1d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5721

When operating in split mode, it is a valid usecase to have
only one core enabled in the cluster. Remove exact core count
expecatation from the driver.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v3:
  - Fix commit message
  - Add details about split mode configuration in comment

Change in v2:
  - limit core_count to max 2

 drivers/remoteproc/xlnx_r5_remoteproc.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 1af89782e116..5aa3fd1b0530 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -1329,19 +1329,23 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 
 	/*
 	 * Number of cores is decided by number of child nodes of
-	 * r5f subsystem node in dts. If Split mode is used in dts
-	 * 2 child nodes are expected.
+	 * r5f subsystem node in dts.
+	 * In split mode maximum two child nodes are expected.
+	 * However, only single core can be enabled too.
+	 * Driver can handle following configuration in split mode:
+	 * 1) core0 enabled, core1 disabled
+	 * 2) core0 disabled, core1 enabled
+	 * 3) core0 and core1 both are enabled.
+	 * For now, no more than two cores are expected per cluster
+	 * in split mode.
 	 * In lockstep mode if two child nodes are available,
 	 * only use first child node and consider it as core0
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

base-commit: d293da1e4dbebb40560e4c6a417b29ce3393659a
-- 
2.34.1

