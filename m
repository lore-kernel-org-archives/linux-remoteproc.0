Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012010.outbound.protection.outlook.com [52.101.43.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF34347FDE;
	Wed,  4 Feb 2026 20:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770236868; cv=fail; b=qesyExWDJjTs67ZxHa9pvZOzKM2RqzC/RVJcL/pg1NPV9GDkdT7pGCVsU0DYqCc+uGD+3UQDbKHfh/lvqEagqStOdJoNkSk7ZicfUbIYuNCa4Tges/IlIkoG/MiuEZnjScY9qEdcEjfAV0Fw9cnE6Oyu/6F+3Kalgh603pmCHkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770236868; c=relaxed/simple;
	bh=O8ETE14GmfpKbgUe2TWZENmxFZDRjrnt9LNMjUzdSu0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BhfXSzC2h7ihL5cUc4Zsq5AV3rggRsaQ5svKNusjvSa3IVbH4Fbc5IC48wHjxXLa4Cvl7eKQiI8ZbJSQWckP3CYqdtCJ52ZC03O7HDkd4+kqL1gA3pLSPm33SYj0dLhYm71kDkkguHUSC2E/GuzthfbRfZjoKnW7lXgw60Ok4NQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=niLBeIsH; arc=fail smtp.client-ip=52.101.43.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="niLBeIsH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+7k/jzkorKn4ZpiJlSXnhhmJQZcCEEIcuQ8dgHhx3UbvCNFNcOdTwG9E3q1MbHtHEvHdWpCjK4BiMIbLvVAnt8DLnJDE0D/u3ibCyQcMdW2R0+O9xVJ2m8Al3QRLCt1nytKm2lUcMNP6oLFfaT/F813P/3AUc2qbph9r6ZRP/b3QUJUQuLFPnnVnPjLrJtKZD9xf0ypjS343QT1EKnIPo8LhUUSzJw/JlRRi1dL9ouEK0RuWIv8B4FIXbwAcU1Jccd44ksdzBQs4pS4wf5R0dqw5DiErTQahraz/vUPgAfoJ1ZyyNehFOoEE7zeUj03n9G3vIetd92T8eX1RcAJng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RklLZ5D2lIJcTyaJr4Y7U6705BVeSNkfN1DIo5zO4gE=;
 b=YN8mywwfWTK221oZQ2txf+l6qvPLW8LPpo1gFjDOe1TmzdZ/4OKnjJlYK7VD6denZEB8RXmIF0mTlx88IMeDRIwOBSF6NZg/OJnd89QGOHn41SjwAq0hHgES4yx26Vr4rn/Q3vMiiVfxgMXCtHRtHYKmftQSDqwuz7fwoh3Unn3/qwYG9Lb7Jpznp3LTefxNolSetPUe8P/q+eU1jd5UBdxWaSNUNgGe9T0OiufsU984H0vKKFJgDZ9M9lpWeoNV+yS+Rj+y4tTyJj3QptLhhKoiP18nP/Bz3GHdJQ9cUgxsScpIJS/uXWILHlFpIUs0AnkUmfSZ/KL57QnNRgSd+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RklLZ5D2lIJcTyaJr4Y7U6705BVeSNkfN1DIo5zO4gE=;
 b=niLBeIsHi9VDH1u33S7CNEy+pCjq+jTGmpk2XnmXYxjQO8Be2AYG9iIc9wcTtuw9sEhDTA0+QrPImWCo4+sPQBVcLMz2ZjMWUaydSTnDFKEdhRv4g0pRcGIPqNe5PK6ZLBbIPChoAX4QHFiDLy7S22HTb77R/pyFJCNBLK8Mgq8=
Received: from PH7P221CA0086.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::13)
 by CYYPR12MB8731.namprd12.prod.outlook.com (2603:10b6:930:ba::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 20:27:44 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:510:328:cafe::45) by PH7P221CA0086.outlook.office365.com
 (2603:10b6:510:328::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 20:27:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 20:27:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 4 Feb
 2026 14:27:43 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Feb
 2026 14:27:43 -0600
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Feb 2026 12:27:43 -0800
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<tanmay.shah@amd.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Tim
 Michals" <tcmichals@yahoo.com>
Subject: [PATCH] remoteproc: xlnx: fix sram property parsing
Date: Wed, 4 Feb 2026 12:27:30 -0800
Message-ID: <20260204202730.3729984-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|CYYPR12MB8731:EE_
X-MS-Office365-Filtering-Correlation-Id: 489c45fb-0acc-49e3-73a0-08de642bda88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MsZkZvZ5NdNG0BtxtuF3xHYkW598uOA8fF+I7dItp8jhGopQXYDwvsq3hyzN?=
 =?us-ascii?Q?1pVdb3yfS7bOFmtvu5j5z5v48lsrjR5IoMOiyrDtum2HYEE++mu7v4ED61Eu?=
 =?us-ascii?Q?l1UIfuSQ5PiK2y2gjr+uDOTZmwFeJ5ymwjVGu/wIVH9cdssE0id9aW15fQ6f?=
 =?us-ascii?Q?a0je+OfJBQURCXvQcCYXLvBbw/VWZNt4WKCIF73QNtCL268GCD1LtnTHuI5T?=
 =?us-ascii?Q?I9JbBX8lDsC/fIShj814HmrixQFMiyiorYofXsV5PEj/lrpDfB3cixfsWP8d?=
 =?us-ascii?Q?+wArqJCrbLjE4th5qTbIgdDLXeM78HCLxoPcMA8lVrjBnAGZdtO5GuiFFK+1?=
 =?us-ascii?Q?6g+ZW7E24py/s5sempAkmcuQUftHGNxXGMGix2hJ5jn2X0iL0629ocTHJTyC?=
 =?us-ascii?Q?ePWZQYH6HUduWHyhTO+2rNEupWCA8+wahGcwAhwZxFR32Uz7YiOEf67hUBXX?=
 =?us-ascii?Q?wRIL7RdZjAaDBh2bmmztgTNeee5+RgebjiuBMxl8125Bu69gVzeWJmhJu9XA?=
 =?us-ascii?Q?4GKNI30oiWO/V2KOx+P/ZMUWsuYvicVh0mv6R9gXPwrXaLuApKhUPvzCoeCy?=
 =?us-ascii?Q?YOy66L16KTQOlrlZ0/JXUvrlpfdQTnEjowx55gbyC+vJD2rffpfj4uaegAWI?=
 =?us-ascii?Q?00koSwQn98oV7XgD6TrFJ/TkHPAE1iuFEeHXmV1fVW7k4no9jOOM7gCtQjX8?=
 =?us-ascii?Q?5g0MhQUOFXa2MJKhgCQEVvOoNG8YeFehwBTDQjVaSzTN3at7R4MiYq50t5do?=
 =?us-ascii?Q?U8mto7v508SbTKwlaQc/gLWCJFm5UoPrCRBzP1KUeRW+XjUfFCrR12toLer6?=
 =?us-ascii?Q?eW6XGgOpgNhH/rNF56EMoopCH5NUJhMGYApTtvIJ13WDRQxSxfUBwBh+F8/7?=
 =?us-ascii?Q?kueimXlqzIycklDWlbv4ULpkfO/7vAKQweHGC6zWpuJec4Dp5tB6lAsn4F5r?=
 =?us-ascii?Q?nqkR7tDbqcE+WjkE5YoX6rjm8TR9B8kpxXxVWV0YvZtSfg8qu6RAoqEsebZf?=
 =?us-ascii?Q?8Qcw4N/CU3y+qVlZdQRx+nVCptV4MGxTXZViLglzPkx6rzyBRWb8fOzqqY/4?=
 =?us-ascii?Q?MOd54TEtpJz+sbczOoylzrJSHKWZBH9HVgTTq2JVJfBRQe2OfRdwGCL6Oj3k?=
 =?us-ascii?Q?k2QO53KKFytXSCkWuSd8bAGHQ4Z+3L5oSi/e7mJmNlkAA+mxFA2F0uDfY6up?=
 =?us-ascii?Q?XVkjewrNBQ5i0eg3YqBJn3pgfTKo20Oup8qsRZf3+zGhP2SuGTtGap06TaRs?=
 =?us-ascii?Q?wRY6sxWeMkdNWWSIYaQAvmqOfTpKKLhbnXupQTTv4sYryaKFUgzdUOdyzoRT?=
 =?us-ascii?Q?ovOamOURTqBUQ+gSrNI+rR5PGfkYl2on4pCrdOI/Mzl5yt1U1DX7ixFX8SC5?=
 =?us-ascii?Q?soGAPLiZe78kpgf2t9ztW+EfG4y1Hq5CczWpAnFXV3U9gjAsfeZChpXiP2vR?=
 =?us-ascii?Q?1b1/2HMXbat9lZJ/6MqLhfpJ7YL5ZO8bNToZ2ezgoqxGo3HUGnNNPE+TlnlH?=
 =?us-ascii?Q?9ZXJo0vZUOhafzvdbQFHx5h1Aj+wCzXotMmMtaW5YiEGE859b+i0Ud8s4JkN?=
 =?us-ascii?Q?zaKn0TBTkWwEjk6rj8PtLTZlYjbVCWGL7jf/n5qeMpzJitGFQbD6wHBJR0FD?=
 =?us-ascii?Q?3WPFNcvvhou9RWnhYkxJ70mXTdjlYITGmPmJqZG53bTP2Z13j4uqyRKLsaYj?=
 =?us-ascii?Q?OgQInA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4g/oYnrG7ufBqYr9N1LbMtjNy55qhYhzzZJ+2Dadq0iUEyxvX1myxkupp4fMs4SzSqttcPSUKI/Sdh8L6RzTaKL/32k5UZcMs94xyNk82gZY6JmHPnwwa/oVCzuO+lKdlHu8X0b4OsZx4Iwpv8E4n0TJuxTZaB2c2DvfSAkFwzvrUUced3YB0kZ8oArDRw57gbM7TuP98cbY+9Y4mEyD7IO3KnVTj+jY+kSs/3CSN9/ya2Rk/KMlcmEzCLr1+kETIQAFGADa7HTzcDTmgPjhsJISSd1p8QK20ZDsp48q0OWcYczCYarR3xxLpgCW+FITa+5eQuFnrks0BBx4cOTUbsg0ybBdqrwm6GgKFhQads7PnOOI0LRNSVqdr0exZpAATtUwTcTcbSNu8330BLjMLh6Gmm6qIkxD3Vj4nRNDPzLhVH5LL+rANiOED2L4NiAe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 20:27:44.5059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 489c45fb-0acc-49e3-73a0-08de642bda88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8731

From: Tim Michals <tcmichals@yahoo.com>

As per sram bindings, "sram" property can be list of phandles.
When more than one sram phandles are listed, driver can't parse second
phandle's address correctly. Because, phandle index is passed to the API
instead of offset of address from reg property which is always 0 as per
sram.yaml bindings. Fix it by passing 0 to the API instead of sram
phandle index.

Fixes: 77fcdf51b8ca ("remoteproc: xlnx: Add sram support")

Signed-off-by: Tim Michals <tcmichals@yahoo.com>
Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index bd619a6c42aa..970a9ef97945 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -1005,7 +1005,7 @@ static int zynqmp_r5_get_sram_banks(struct zynqmp_r5_core *r5_core)
 		}
 
 		/* Get SRAM device address */
-		ret = of_property_read_reg(sram_np, i, &abs_addr, &size);
+		ret = of_property_read_reg(sram_np, 0, &abs_addr, &size);
 		if (ret) {
 			dev_err(dev, "failed to get reg property\n");
 			goto fail_sram_get;

base-commit: 85ab651885e1b542ee0bb9ec4642ef0b11716997
-- 
2.34.1

