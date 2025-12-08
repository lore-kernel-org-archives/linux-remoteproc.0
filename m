Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A0D13AD26;
	Mon,  8 Dec 2025 23:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765236817; cv=fail; b=TjjVGa9R6AsuuwuJnw2lqdQAOQeH0qm+lXP42RNCeY47R46Oqt0oN97+qjg+lTRA6RalHJDNjVsCT1bGAq0phiIIuve/8nQYcIJCDcEV4634kq4q7edgT1ntB53ybp/UkUoDL/8j6rSThpLavv/o9ri8u4Qv9V63LSnz0LfME4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765236817; c=relaxed/simple;
	bh=3V/ye8lQISgK0FlJIx7qKXuDPbrJr7w6lJhEpfAiy40=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=K+soK2PjNqie85s531/5gDO+9avq5FbaeeE4ED3tn0rkFO6IJeQkY78ZHtS4UkZ3co2H8UfLV4xHzOsq7S8o+/Siu7uaOisMVlqFZx4pDZwLVMSIhNV89dxqscWK4lvNatfPhS5GviEPVmvL0lcC5fGUOmn4jsCVGfu/3PH09js=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Eq6qaTYg; arc=fail smtp.client-ip=52.101.65.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Eq6qaTYg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+hBie1se99nV8Tvg6zf63jEqY2TjihdL5MYbP4qEGxgAr0GHn/U3tVnsQqyejY46UeML1AnfhdA7WF7Ed1R4DanBzozS/uNPVYXFC4koh+cwFSkRwyIOq6Yokmhnw7ygrgcDFH6s4zGLiAwFM+glYRTT/XuCby824MLsAPaRMPohL2PFlEUzkKPDZEY0NRwa0N/p2AVy0AEShd57g3sc9MUEXtO71qOA+SzHKF2quG9LF4il1HGluGbvJ14UhvPFwAX7ZIWdWA3DKorWi1FyZPA2JyzzrD7jv5F649u//fwNJbD/Y7fFzFU7BT+wgO/M0Djyxx7AzknR4158mpOrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HK749NKSXa7BEB0gHUvmTmpoik9cNE+JdOwbQju/zVQ=;
 b=fyBOvKq8fqUHlpIQBIJc1giREAMvvUQdidlDqTSqWoxayoFX5qBFqEolmpKGNw46BWepM6LVG+Lkps/zpT+q69cGTP8HyboeA1bFGo0qIB07Qatz2iNoyXWfMHlrzYLJdt3Q6pVm1U5PdgkTRMOyUP5PkkdnTEfnNBQGlKBU3Dt9HrWW+W7oUP3EVRbbJxVEIujNM+g2ouFk58rpcC7yD2sw5emG/Neyq2ie1g7SeUVF/iGzgTYF8sXLfQhti7mq7JaH4lE8R70+7/qrXdXeGnuHsNE5U+rbhwM9CqZThiAMA2ud5ryxdIkph8cmex9ShNtagDmE4W815axOFoUdIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HK749NKSXa7BEB0gHUvmTmpoik9cNE+JdOwbQju/zVQ=;
 b=Eq6qaTYg1L50BX8QKkUJ73cKvM0u3C2ujMaZjtKx5G8geX7UYGppO8772gkHO9bfWahfmxrYsYZlDu437VZCp/8guI0ZzRa95wSNGdmk+9TQLJ98fZ6lIpfOXLmju78iJmOxV9ghCzFqwkj09DXqkg2aLvqkvVf0UV0m3oUXz0SHrLzk4zdvRhi5ij/yZp30mmsNzR16FNdxDVP1jG6vK1EurkbyKUqzf9DlyIO+o6r54eYo3skwAobCtcB0Fv+bgerioCHfU+KINdBCcupR8CQnFOc/29h5iKifC+MfVsRoz4Roa7jZRv6qblFeXj3+vrd3fhA6gFCRdbrtx1kU0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS8PR04MB7733.eurprd04.prod.outlook.com (2603:10a6:20b:288::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 23:33:33 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 23:33:32 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-table" check
Date: Mon,  8 Dec 2025 17:33:02 -0600
Message-ID: <20251208233302.684139-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0250.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::15) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AS8PR04MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c3f62b4-4393-47a7-e0f1-08de36b23327
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|7416014|19092799006|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bxd1HSg9fPXlyrdCXO8hzmiXd17rQEj4JgPvXA17iPHmBgxCsIN3fPA+a8gQ?=
 =?us-ascii?Q?MuJ8SluZ5e40wsGMRE1XD8NfLTswP4USj7Xxy99dUiy3bMcJbqyg0LGDcDhc?=
 =?us-ascii?Q?NNthXToYl/sDd/P3061sbVYLZoPqeRbsiEOvN8RgdcxWefYBs/0nO9e45n4W?=
 =?us-ascii?Q?KkYnpYB2+JdNHdr4xoPxjjoVdLzh0GnWw/7kuz43m3nk5CWYZ0ZRTmjJQz5o?=
 =?us-ascii?Q?m/DNQNUo5OI5XBKjFOK4Yk9kQRYJtO+L56L9Hh16Ezmy6TWJj9LQKLdz9z6d?=
 =?us-ascii?Q?FzsqkVmQFmZGahf9IV4ZDCWalRGTSx5r6sDLfB99gLdw8K9BxyoRagVAyN60?=
 =?us-ascii?Q?CMdX7+D4imv01gWDjvEW4LbmGiLlZouJvxmWAy1LtdxiJkiYyjVuMLRhdm74?=
 =?us-ascii?Q?frlVxhnHhW9ySh7D7kL/VaTbdof4Ew/R0WyByZKEM7zCUonDdJsFmUmkDCpQ?=
 =?us-ascii?Q?CZ1MZYBvxdsznK0ZDmIXg7pEAXqIbU8Mg7x0ZxskzTOkDqtSSq2Nvqjueq4U?=
 =?us-ascii?Q?GrWQ1B9TrtxEV4wjVGhDCcsyCFe2BLvlh3n9d5bBK7vwt6tmJp0ShOON95Co?=
 =?us-ascii?Q?S9WQeLGQsINmAMz2DRsSZlbaBpnDHJykC2iqCGnFIv3ThdAP66r633ImCRDr?=
 =?us-ascii?Q?tMDwghQjdYfBV3uBAKmSmBv2IXJI1GyuQdvidcZYdmPA4aP6OiG36mU3pdbZ?=
 =?us-ascii?Q?EnutpDvwFVSKq1xrVq9LJgbzOJOaDSA0kJdW8ZkZMUKDMBTcBLDm0CsNVnIv?=
 =?us-ascii?Q?FiAhR3D40K3GjbN4jQne3t3D5dS6A3VSqoFOB3R19HBm9gR0I+geXrbzcuFN?=
 =?us-ascii?Q?2QGx37tIg72fI93XrIK9Wr6z0zN7abkn7jBvldZFJFchOkFZuAO8+La46/TD?=
 =?us-ascii?Q?3B32vomqPR5152T37URlp4tXatU4xoGyHX8ag318WEz+CReHk7be/KTYAkRX?=
 =?us-ascii?Q?5vY9vKV/iUEu/pY7XUjLjg+Ncj4ANdQdaipMKr3Y3pcy2ejcS7je3dhE7Xkd?=
 =?us-ascii?Q?P0etUPQiCDEbv0uScYl2233X5gtNiqAfWwyFvZg+pvgvehltqzrKciATxETN?=
 =?us-ascii?Q?EBjnRfeFyG9rH2SpNWgG3RM+e98DgXtmKz9w0t1fcOciKjobGESADKO/i3kr?=
 =?us-ascii?Q?k2to9BcT7jtGC/mKpTJ7h3e+79UenSG5aA5VqEQGXs+YZA24MfaFQBjIuNYy?=
 =?us-ascii?Q?as0lkngtlbjTRGfO2NcCA8FicE6/fOiI+LtWWLBRqELGBW+6LZfiisoO3r1r?=
 =?us-ascii?Q?L7TuEnrqkicZrQTI8zMl9eOM1AQaAifiBER2tlI1fbH0L5OI3ertEAtGu3QR?=
 =?us-ascii?Q?qSF9i3Mo8OHxgCjl7ffZkCxtRB2518IP5CMPXD39wCdRDoUdUReXeYz27Q8h?=
 =?us-ascii?Q?XSXjjedS6caehlJhbX1JQn3I6klG0ZD8R1xvsCfxr8Fm3PojU86u3LTY1GYm?=
 =?us-ascii?Q?p8z9Of9itQqx/Mx5MvmzjpxW0/yptvNvDWg054TRTZmih45K2rq9heVm9gr2?=
 =?us-ascii?Q?EuBF72kWuj3qN629k+Tuf9OIDadLw+POrbu6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(19092799006)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DmfwV9El+KUJSHzkp66zJn6FSLl5jar8HLktfrBXBFSgLhNzCy8BW1e3ykqZ?=
 =?us-ascii?Q?Bdt4UK1juZmBWIBhH5e4Ae5yH2s/ovEGVfjVP8lppLj6w6FdBKcGRyhXrIgW?=
 =?us-ascii?Q?IbeYL0L3duBrZep23vD77ARdv2kbtQaN6NmghGb9uFKriOaDnkOFMkj4IltI?=
 =?us-ascii?Q?Zv0RqCQm1g7kNxVe83wZIB6F9VEMAL3QZFSE3SCgyrHqg9QbTUGdRVj0LZL1?=
 =?us-ascii?Q?2TR2COYM7HWwbnvZ7TE9csVCaax3Klv5QKDeiHA1BVtFgcN4EDfztBUWgtB3?=
 =?us-ascii?Q?5Wsraa0I8qHTAsgFLRjmYXDHK/PU+5rdN/eV2q6fyIxl7v73dJQ3uPlB/Xxn?=
 =?us-ascii?Q?ZQKK729pMOgrYJOGupWmfs65m4M8rIezhpAf6Fb+e6ZBZ1I6GF1ZhnOIK1Yf?=
 =?us-ascii?Q?w+ScJ1HPyJeSQnkTqi7gqc0Sr3YxXPNQVFEjqKSaraouthVv2sOAoljsCP71?=
 =?us-ascii?Q?ZlVtDWezLElZOl8xCLvba++b4tzl7xVAMNQJ8aLNDE9qRSxoKBtaNElzn1dA?=
 =?us-ascii?Q?E+xByEg1XRYpuJ6kyi0RaFA3WCPHuJEf0/YkbVrtc21vIqys+BVpU0i7VrBS?=
 =?us-ascii?Q?C3Dxy6x20GlXaYMGCzk6s1EUorYOeYv+TLjylmvfK9ItQfQK3GtcOpKaIDsD?=
 =?us-ascii?Q?7WT6h8+4/Y0tzcaHKJBrTrZcVjbzfLFKh2UAqaKPqJStYxRZSAiONPDyNYew?=
 =?us-ascii?Q?6odyp+CTyRHp8xWOFjpCA0QU4dQO7IYWcyrZrRwDk1Ay5shkrNgJb1bS8zqX?=
 =?us-ascii?Q?QigaOmoyuG1+Ht9Vnayd4dZpmEMu8CVXpNxO6dOsoIVpHDFyNNwxCNW3E4/5?=
 =?us-ascii?Q?MI/2d2CV8Qz0G/0ErA8hOwFv+fCBBG878XwFKp7sFsa+j/NncKFIsbL2b7KT?=
 =?us-ascii?Q?sHRsJrpnGmv5cdQVWxw8yzyArHVpUoWVXQVyCyqasUJxlFlwg2nPb6w2Yokh?=
 =?us-ascii?Q?6ywsl4lwyt66wxp0FcPYwI+tutY7WrnQExhKHmqykRPf3EUG7DtkqmMf1cvi?=
 =?us-ascii?Q?rIPMMMa5g0pJRHfjz24cBbgY4bfhBEj4WI5sN8+xHAM+JSNgPgF/+mTNI74N?=
 =?us-ascii?Q?lcUoFqFJcWL8fcUbI7OikrDT9hS7gwk4OK9TLm80FCwmyde4untb3V3rxY2F?=
 =?us-ascii?Q?3upu7/4Gx/rD1iDTUSJVHHHHwxBFVYELvaUnYWYSOJAb0zHecdQR16GbCE99?=
 =?us-ascii?Q?Mi4mmTzUPGt0CMq2NwiuObcwxkxRZnoHW0Y78DvqxCmWivvEQKPz9U7lBv6D?=
 =?us-ascii?Q?j1gM9NaCCaxcB3VyOS+1j0Hhbx0Imo44Mva198SXEVyT/ghDDYoiOp9kNvwS?=
 =?us-ascii?Q?FCtw/t3xi+bU+FqPri2eAj4L/RCqQMpiJ0MWzM4ReOMJ/6xypAaZJaFMFYnE?=
 =?us-ascii?Q?5t5l+0vf+gE5D7ZZGhUFqPElccT1Tb+xY3oFRQ8BtMCb9odeRQpIVMOfJqFM?=
 =?us-ascii?Q?bm8+PHYioyBv2rj4v6r9ntsw5tst+dn2jmkI0A1S+KuXyN8DBMgEr4DTcHbh?=
 =?us-ascii?Q?tUZTUjxc0+seOgndMrGxGVXE3DhkFYvKPOLc5O37tDgI3IYklCg2ufbQ7Grq?=
 =?us-ascii?Q?uWV4KcFCUPRhYAYyF/VEclN84rHEZWauVdi9o/zK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3f62b4-4393-47a7-e0f1-08de36b23327
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 23:33:32.7110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QuYeCgwwyfn57WseQ7yrBboKyANf/7OmFVltNGq6x9D7ht6K7k2ji6XVblyCZeqwkUOzXTU0DY9VbajTUDpjiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7733

The resource name may include an address suffix, for example:
rsc-table@1fff8000.

To handle such cases, use strstarts() instead of strcmp() when checking
for "rsc-table".

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 3be8790c14a2..33f21ab24c92 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -694,7 +694,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		}
 		priv->mem[b].sys_addr = res.start;
 		priv->mem[b].size = resource_size(&res);
-		if (!strcmp(res.name, "rsc-table"))
+		if (strstarts(res.name, "rsc-table"))
 			priv->rsc_table = priv->mem[b].cpu_addr;
 		b++;
 	}
-- 
2.43.0

