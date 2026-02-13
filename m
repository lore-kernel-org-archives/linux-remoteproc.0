Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012058.outbound.protection.outlook.com [40.107.200.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15073BB4A;
	Fri, 13 Feb 2026 00:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770941546; cv=fail; b=VT6Qs2viPfn10dlzy2hy1lLhUbZEZ3kVunYl1rLF3NYP1g4a8F6IXqCfRK6IYF0qih//8zCQN3R1AOkVyueNTysAZnVrCJpdRQq92jnmhlC8EgdXvdM8nFg7qETZfJwJ41QhztvMYHTmITn4WkGPRdNjwaz1me+IVbxdBmEasGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770941546; c=relaxed/simple;
	bh=vCg2/4GahioIBwdraJ+VornoVtiEVKckyJ2QB0xVBr8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V8RiNDM89XQb0/zAPC72gcynEXJ8y1tkyTP4Xt4NGRpNi6RptL4rTSDHzYmCW3IoNrUlGzezjwDyeVERVdsJgCGPBYF7KvpX6AT8pfbSio5c+9eaLXUXAJT/mvB4hLirrMig04vVDgWa5LSkdOGStrjowyqFbyPBtZIZkO1ATwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OYcBX9zj; arc=fail smtp.client-ip=40.107.200.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OYcBX9zj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cqSNqUyBAR3qcw0Yc7ni9gVvkol0jLOV0feuxPgf0XNMIIWDWFK2w2fp1LNWJt6nvHOt1tMjK64RChQ55nu3QT9gTayHzhX75/VEIse6mMbrw14+V9KcKjkvRmHv8g7kgxKm4ihv4JRrlgJZXMWXxIyoeE3TnLTWtGJc0ESAIo9/249IyRnQ1xuRMYWjdxmduYiIBg23bd4hWZx8wtv/3kzy1ecqqyRio/xJncwjLSIDpcKWWpPYYTzFijSfXppNN34+a55N061gH8ZDLmqXpttpjAjpylL70ahsAZUn2h51hKj4z9Tu26YBcgOrR/mIPHH8JWdhd6FqnOR/QTi/Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t91UVP9tU+pIsAnnSvJCtyUPC7V1YqvNdfZnE+NNHUc=;
 b=CIH5fHX1jIhww291+eGgAQbj8bABGEn7z7Y3DOjd8Q9v0RYHXkknnus0daeVyelsAsQftWBVpfTOCSjo3hjN2P1s/a9lLf1enUKYyJPlnYXJrkZ7owvdVzQ4dZHNeQdOTYHx+aFspFtQf6ws5Q/GSIgwfzCcM48A+sRvnMNItjNzau1PqAtYt1M2arX6mLSWBvUg5V6aiLZTyAs9l3WxC0lzCYm28DJStHPdVvr5qiI5Gm2I6RGDkkCAMq2VsfiJKn0SbkBypbzLL03xHcr5kxafR/be8FP2Kh72PqP2FKTc/0adp/PMxZU0GFDacQk99Ov0K31v7DcVUSp+wDGn1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t91UVP9tU+pIsAnnSvJCtyUPC7V1YqvNdfZnE+NNHUc=;
 b=OYcBX9zj/oKqRIuxUvCVa4LVevjMvXADHlPVH9FALPm5md0S0ABeCdTs3011plL7q2r9IA4kJz364acdNqj1IjXUNrKSE+3uyWCcbIaiin393HJC7vD3DM+tezoXtNzFkoEKvbWLxNNrxFPE00V5emtnxA/debB13CHT93lsft0=
Received: from CH5P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::11)
 by DM6PR10MB4363.namprd10.prod.outlook.com (2603:10b6:5:21e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 00:12:22 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:1f2:cafe::bc) by CH5P221CA0020.outlook.office365.com
 (2603:10b6:610:1f2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.12 via Frontend Transport; Fri,
 13 Feb 2026 00:12:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 00:12:21 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 18:12:17 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 18:12:16 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 18:12:16 -0600
Received: from localhost ([10.249.48.175])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61D0CGco3962077;
	Thu, 12 Feb 2026 18:12:16 -0600
From: Hari Nagalla <hnagalla@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>
CC: <vigneshr@ti.com>, <s-anna@ti.com>, <b-padhi@ti.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kristo@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Hari Nagalla <hnagalla@ti.com>
Subject: [PATCH 3/4] remoteproc: k3-dsp: use local reset for C7XV dsps on AM62A
Date: Thu, 12 Feb 2026 18:11:50 -0600
Message-ID: <20260213001151.17370-4-hnagalla@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260213001151.17370-1-hnagalla@ti.com>
References: <20260213001151.17370-1-hnagalla@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|DM6PR10MB4363:EE_
X-MS-Office365-Filtering-Correlation-Id: bb28339d-573d-444a-fb3e-08de6a948e9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WSWGC89K8i5WA1bwkky774n94Zqfy3fDL1ImACHjq7AozmE1QCTClqUy/2O6?=
 =?us-ascii?Q?lWVNGCJ2eiUWroa1Nwi6fjZGyA2oA+0EuH+/V5DuPAbC92i4Kwlzh0s5Ex/q?=
 =?us-ascii?Q?J4H/cQxHrQ5JfhAzxbFlIQk65tWQDVAEFjA4lLtCqzbfqIS7UbJkabvtjTZj?=
 =?us-ascii?Q?GI+rbJSdkB/f3pqkVOUcFaTPnheWf9FRNWeHUXsWIeI4lwnOZsiLPBWFBS3Q?=
 =?us-ascii?Q?ArDYQiIuz86oPb4yS6xkLXV3i/suPobsbIVS7q5VRgNIkruGiZJ7kD09IRZX?=
 =?us-ascii?Q?FR2cLNp9pL3EwEjZIJQir7Xj5t0eRBxtJ8JCAiQfDq2455IuUZ3YU6FsRaZJ?=
 =?us-ascii?Q?lHz9vSyVI54Si9Pqlh7op0q43gCxUIXFG0ViVbD8ysnCengeUfqDCZC75/fC?=
 =?us-ascii?Q?QWXzCHtvC2bzPK6KQH1Ik9fEN24NkHVSTfcM/gk3+DGxcxwyUPBsedru9Sud?=
 =?us-ascii?Q?rkrli9sxJq2p1mdw7b/DsehdsR5kgpuboxOvhfaVeQyxK9GXnLfr0ys0KXZG?=
 =?us-ascii?Q?W9KJO955ahwituY2GXyB1u1gOW9rhDcNrNKhlNO5Rjgqn68akMWTen1GLFzR?=
 =?us-ascii?Q?TLTIyNHcDf0jRq5YD5Ogb4ZQP0z2WGL59cXz1t2xKXzXoaRRvdiP51f3eXqE?=
 =?us-ascii?Q?d6unJzpUHNQmMFc+Koff271sL/1c0aUloOaRrl/vN/tEPxEhmoyQdU+qmeSf?=
 =?us-ascii?Q?8X2yOq7JeNFbl6+8PM49otERzP6B43heMwPEqoiitikZ/2ZQh+oG0pomTK1P?=
 =?us-ascii?Q?ObRLl3INRnfDjAvnWfwl6Hkh+CEkbTqwF8egkYMETw0SfhIpu6hU0PUwxa4O?=
 =?us-ascii?Q?5KjmRbLJvZfY9jMWGByYCk+pp1UJPcZDX6amdggbC73dJpfhaKEOmlqevUJA?=
 =?us-ascii?Q?b8XzLaJwEDkoX0hG3QO/AR8M8T9t5VkfXZhXBf9hJjSGSZmPdt0Mi4rU4chm?=
 =?us-ascii?Q?GoQX57xrL1sXoQy7DlPEZWc/FoDNedC7hl19sZsQI4tUESQlZcLUYceadBQ4?=
 =?us-ascii?Q?hSzdfObkERV2zcthwmfe5LD3bVGNIfKse4HdMOfN1d2RVx+wieVnKq57iTTV?=
 =?us-ascii?Q?V8wnqs7TmV8+ap4l4lOppn5NtP6ptqhJrcFo8g/IeYcbRkUVidawjmD6nPfQ?=
 =?us-ascii?Q?VmYwHM526Fe5pLREL1sRDP6YJQHRXad+tY4pQEl7/UGvIU3BUPSzVaD3XAWr?=
 =?us-ascii?Q?m4kSsB2srZ2x1qYuf2MJLnbFN83vMt0Ar1+PqZsYdcTuq45t+jwKNS+8UoqT?=
 =?us-ascii?Q?K6eKz8BWL9ArWIU4k42k3HES9cy80k21RLfOfK6gNLdZ3ZkQuAfs/JpRgnbu?=
 =?us-ascii?Q?TFq0h30Rc2qcstK6qI7EDMuk0H5lmV5omo8on61PIs5wC2776//mhCCXhwSR?=
 =?us-ascii?Q?xZrj3TN4zu1NvL4uHxrQShCXL+jxCcx0pu7i9UO0N2D+781hONxrntLCAqVb?=
 =?us-ascii?Q?aSDGXjgrxgzYlSMq8Sp+6zMZ+df413Cy79PAi1Ogw7rSwCUnLpCZ4nnOWUXx?=
 =?us-ascii?Q?xCcwWvgc1NC1T4pAooj04ND/Vdjfu/oWEEoHQqdR/XV0JGE/p+HLHbwquoJo?=
 =?us-ascii?Q?7nBxu4pnGxDX2tsGxdLbL03peAfMtFHNGGlnG/PXZrVE7Ai8n+kzcA3ap6r3?=
 =?us-ascii?Q?VyVENrr9Y3toAo+4bbvnDkLUn2rKOGNWrmnOPInVZhrobc5noaZRH0steX7Q?=
 =?us-ascii?Q?1/lnhQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aaoMunGxpbFMZGnCX3mLN4HOEAgrwqHcgtpAO4DFQ+/CLgyQzBMJ+Wq5ZHp1L7RONAJO2aImVEyv5D9yFTqUt0UN9lczTFtLH4DFD+IkHo9aG4EiCyjXRsW/fYxZYFh8pDu3XYikqiNeLYQG4iMkbPqiYpzCIzlIF6oqQmLbv2AQzcWNlE5+CxH6ccpcSGmQv3eyHKQlo9Mbu8gdMN5VUXM+raDA5jbEmjjajYvdp6UwVX3HZkAylfNWO+bUiH3XUlxR9DxvPuwtVuPJoDLhtFfGtXlZTxRC0EzqcYcGeuURi2zDe0IAZwMCJH2sb+9S/NlB8ked7VIRMmaauTg4L+LohdyJsiIZsJD19n4IGXLNlruzySvFNOa2T42BQgkynX4ix6acJVu8TsSNvBnEMa2Gp/zk3C6VmsLnd+X/ZZdq2ksngCfbCK4nuG/6pEk9
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 00:12:21.2674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb28339d-573d-444a-fb3e-08de6a948e9e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4363

The C7XV deep learning engine dsp core in AM62A has a local reset line
from power state controller. In the absence of using the local reset,
it is in an unknown state and when the module is turned on, CPU starts
executing and may go into a bad state. Set local reset to 'true' for
AM62A, so that the remote proc driver properly asserts the local reset
before enabling the module to load the firmware. And it is deasserted
after firmware load is complete to start the core.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
---
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index d6ceea6dc920..7881c711d872 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -211,7 +211,7 @@ static const struct k3_rproc_dev_data c7xv_data = {
 	.mems = c7xv_mems,
 	.num_mems = ARRAY_SIZE(c7xv_mems),
 	.boot_align_addr = SZ_2M,
-	.uses_lreset = false,
+	.uses_lreset = true,
 };
 
 static const struct of_device_id k3_dsp_of_match[] = {
-- 
2.34.1

