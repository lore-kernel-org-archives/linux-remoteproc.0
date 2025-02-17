Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2074.outbound.protection.outlook.com [40.107.247.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E42D18FDC9;
	Mon, 17 Feb 2025 08:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739779207; cv=fail; b=pbrldxKuMJHA9F3Jbk+rZSmSo1N/z08rEAZ9WSaACAr8BpGP4ECSS1IOfV3Hf3gUnXM/DAtn9ErF5h9aEk7/OxXT7t7AO3JajDZndcp4HBK/fednbOx4FDyvGGycpcVi4Amuc3EyYb8PTY69vOW4mZAVWY3y/NOZWxrljL55OjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739779207; c=relaxed/simple;
	bh=ct6cECCJFTVeKa6sXFVE6l7rDzhNH2c/EbH3bcFK8aY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=CurndGrjIOiRTBS0COKKg0i0cUdwjquC50lwqHYFx3YzAbzu3Q+OopL9EoRIiaPS3rTgPBm5QYewnt9EeeyV+vpP5fQUd9ttLFPWL/hpcb6ErUS3SXTLf5BmeHvXE8K3hkQfARTrFBfAx5xPsXRs2krapPecjLQicXSWeuxtgxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=p1IOxXYd; arc=fail smtp.client-ip=40.107.247.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="p1IOxXYd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmMghOFIVH6vqKQRrE0JakAw0OIYMERR0jrV0I3iZ7V7c7gHoY3z7mH9CpYYHHe5/PYax4lxadctBeQpSlYMW1EkC7grhnamwjyfLcHdFnvjrFsgLad32B+D+Ho4xYdrBHWdzpvMh0IqpnUr83zZ4MI5GldUASIN++Fcaz17ILCKTp2XhH22cQmLGtaOD/Sb6VAz0rJrPCCt1RoYUogxIXoQEzC4xIqezTd7QtOaH/UFdaj5Kl33OvL7Z5tAAKrUeStOomFnJ5kInjRcpWjcLvPdUMYV068ee/rdV9LQd6FWih1hTzF9tMi/fkldRhZ1hgsji0JWlR3ofGJX0HIm6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RdByNu7zKGUKqdANz/0YLgVa5t3XeMyAIHRzeCLe4k=;
 b=t1HGwg9nI6OO7lnwwigEfMnTK34aW4ACWOtpxO9HYEGxI2ywS02OG+FmNGBoENsKw7UohQIXTAaI2HoIJ9uFqv88R7RaOFn/XqukZ7nZMS/DmRWsHDKvqUgjVoqEIrEahovwR7PJr1p8qBx5rtww24g52aAFJ8vUwSC5cRAG2JVnfsUTozhrUUdw2Kj9M3kiIcb2W2nu+zfaJdJFVnLP27OEovJ0E1YygNz0uvhgahpG0mat/wFFdqBLLCjqfYIjtXo7G7uuYXDFtnlNRSO0kEG/+eoQuDLbLE+tIKXla5b0oIl059AFh23w2vZxl2Ig/by0oDRPHDBPsayyPReNRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RdByNu7zKGUKqdANz/0YLgVa5t3XeMyAIHRzeCLe4k=;
 b=p1IOxXYdl8yyJNslVKRzQiwlpje5Mv2Mo/bTRy0P49Pv+FlniLU2YRyrtO5af6pNPZSZiMj/rgvjzLfVf1lJcCYKG2OEQCe/UcIc6DLP4ovUJqW/JueaMBc6o9XfZzkD6lnJZowLuLa/IqaPb6m9r/7skBhtmhrHM5fFa0TF56CLVhdEll4qSjGqDb3O0/fKwsOjNHNJFqTOUJ95XxguV38rToSuEGzETLxDnpm7ifauBra0pVSsIi5DbcmatyGG2BH9avzgw3D8THY1AZIWsp/RNkQTChLY4XK7UKCTw7xDEuyQ1eccfqBG9FN4eA10Di9y5Hx7EJqdmnmT91ZVPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8435.eurprd04.prod.outlook.com (2603:10a6:20b:344::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 08:00:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 08:00:01 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	kernel test robot <lkp@intel.com>,
	Andrew Davis <afd@ti.com>
Subject: [PATCH] remoteproc: omap: add comment for is_iomem
Date: Mon, 17 Feb 2025 15:58:58 +0800
Message-Id: <20250217075858.616737-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::7) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: b2daff4c-ce68-4eb1-4aba-08dd4f291482
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1n1TkoLOjdvF/hSrWFPZR9fXyjh0/SE3hwUUK65bv0RJVDhDy34YDeZFGnVF?=
 =?us-ascii?Q?oEfqqFGnNfIYGQQHLR7b6ITRURIuBpLB/OrIYbDFErWH1lPrvCRwf69dFYXx?=
 =?us-ascii?Q?LBVmAS0bUCU2waEFfWLXsmQjr+NyPFLX1RpwswZyIYCFyGpFBa/7heUkH7rJ?=
 =?us-ascii?Q?7DHbsgpLnvPMfqstxh0EHX8478wQgx4486iipTfNrPBiaMgFywL0wTmqoK0k?=
 =?us-ascii?Q?sEh0Jtqz+w+arrO2sKDKjI2LrrdfEgd4zXLkpYt/6To0L5I5CHEa6WLvxSaT?=
 =?us-ascii?Q?8z1/6ITGqgDDbPT3Wiukc6WYcRPIh9ZobrFPtM74jFPSBWTmyzt6pkIw7h6D?=
 =?us-ascii?Q?QiwmkuG5s5ywSHXsw5YkfLThKhCDdTd7QaZJZoruqSly+NpQ9s7VdEoRDZWD?=
 =?us-ascii?Q?n4PJBrIdch/BQPzS8KfYPzDNyVAlmUS0mEjTwKfD5XvLHOJT+hIo4jhHZPxi?=
 =?us-ascii?Q?SziQUh/N/tO+VqttfD/UbDmRheTe4PML8/jz5EQFalsHW+wWIXHVM64sIKwl?=
 =?us-ascii?Q?1sUhkjBXHwM7gjVJHH1UThq55R5vP2//sgheEurFBRjf51nvuGvTfxpySuDn?=
 =?us-ascii?Q?Dh1aUQdRLYUiJP45P4EHMVEDpcz9WrB2KCxl8Dw00l6yyCZAdbcsBaVv555a?=
 =?us-ascii?Q?W8dpQji5m55/DROn0Zvrj34Xd6X9SCHQrjOHwdYHmj6iP0ltKJV1Pfq2ZWBp?=
 =?us-ascii?Q?eJ/e2zcUI8cXIGcdE5MGtdEEXBBf8h7PY0QNNU8LFoXFGC3/kfJoEYm84Vt/?=
 =?us-ascii?Q?d0CbUrDAPoaSyxT0o48/Adi1ijmKyvRkiOEOs/zRrUdn9jx8cajFq16Ifjaz?=
 =?us-ascii?Q?OW+LsqvwCSX7qtlcwaAtQKdE5oObrDqlI8wZNKxmefOIaxSqgwXH7KBWutlD?=
 =?us-ascii?Q?/CCd1qPZUpOC3eSzIgGRtFX0dhcBQ42016EIOrB9TRv/xoSNMW4bdhXRCRcv?=
 =?us-ascii?Q?24K06eHLZbpQxfcTUFOxIfCHLRXASnxlJdWoH6OGrAWbuTApQEsXNljO8NmO?=
 =?us-ascii?Q?pYu11ueEF6BW9Jvb0w0cmgyDZtcFuWNyfA3E+3jCGHRR+nXyXC0hrerwWdbk?=
 =?us-ascii?Q?KOheB2wqmL0wQf6SZ+/Brv4owSxopkfua3cetL1SrMucporxe//Mk2xM5WCK?=
 =?us-ascii?Q?4O4R7Y66oW8tmYtt5Ag5dDKb3jr+ukLrMxEp/obz5wEYEYTcvwyHL0Iz0whX?=
 =?us-ascii?Q?CrAkP0CArVcZo7Vvh1rx35NGsCzzFLD8NdZH7vrGIzt66XS22k2R4mXGOJuU?=
 =?us-ascii?Q?NP2WO/2zfpi3hCyJBlFK3OdEY+MWJWy6dxooxtH2yiN7HM7arns+dJYUC6kN?=
 =?us-ascii?Q?G+EXuxCMA/FLKUEibPG0FDLlJLwQBSVM1hi9HNfU59YK67bJlYB//lVX5zd3?=
 =?us-ascii?Q?XfJoukwCvgjs6wiCFvIZ0qnHss71xVZDGd+lNX222jQnFWcJlvuo5Lp2N8m9?=
 =?us-ascii?Q?/IJnEBNXUqN/45LOt//y7jrVryPz9BHp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NCrfoClAUisxypvig7YFnb5yueW0Wh0VCfsHufpuOFj/63HegKFGzvcmHJD5?=
 =?us-ascii?Q?tDKiGm4ICn0t5UoRaZSCsNQTYM8eBiZKX2+YwRwLhVJkkI1rgyEBbY6JPylD?=
 =?us-ascii?Q?1sNNXm5BTd7v7u4ge3bekQUvzrLgHVwmEJ//ZiAmZoEsMXXV+YNIgzu796Xy?=
 =?us-ascii?Q?7f3sD7Ht3PTIIsSWO1ER3UuTCn+aphi1el1NVUC4JuqJjjoaqVnuwBIYTBhR?=
 =?us-ascii?Q?FkrLzlMw6RyN9D+084+zxT59Czv+SnKvq3ctQzN0oHhbFjJXFs69ADVqdqKr?=
 =?us-ascii?Q?hgrphHVUvpty8LqgxVykXgKhCsirjHBTdet8Ce6ptO5FnqygO+QWitR7EGiO?=
 =?us-ascii?Q?B6uE3xsHXR25Vbbzz0evcA6EKE8hHwRlVQ1iidsXeVDW4fwaeGyo4dUbA5Lg?=
 =?us-ascii?Q?EadZ29vaWWF1zWy6tbet/u/LmKnWtEBfqM8hwYSCN0sfwcPNObd56VUCKqFD?=
 =?us-ascii?Q?uPiN/KAQ+N5mCqLQvUCHfzIeTt3JBixLcDLDmB9oz1wO5oaNZmlN/JqS3h/G?=
 =?us-ascii?Q?yqk37DXZGcB8ZAAzghAt2VnEaq0Fpfg5swJYIzGryRSuRkOXvScPvUpxLKUy?=
 =?us-ascii?Q?eDmActmTewIFR7lZ3YOhEUepIgZUcYERORmp37ZtEVwHBulbqxLui2P70Nxt?=
 =?us-ascii?Q?1xj5NQ/E0gjTRP67feyXOq/9pnPAZc5w2AIuiTAIj5I0OMAiHQxvXTqT6q8A?=
 =?us-ascii?Q?jLa3yvTvr+oOXFcMr4r6eOpGQdAy9mRgRVEV3v8ABYoJzEXvvi+szHZfetBf?=
 =?us-ascii?Q?fbdudHuNU8Ee0rvjE+mLlyV6x8VesXF/I1FCBwk1P27pyY6VJrL03+U3VXsG?=
 =?us-ascii?Q?3dEt+op6DSqKqZZIdBTe7ysVQan4BXx5yzXD7kIHjLvBX29ZIuUJYcmJ0rtl?=
 =?us-ascii?Q?Xwj6Do1fshqsXwWNNv+OdQI3Lb07nw1EZhYWoNGkjCHdrBPrV3Jw+6MUHbhm?=
 =?us-ascii?Q?6ca4bw4XFMGqzc4QM7uUuV3EO7rweG4cUuR6WsSki7Ql5k+T6O85fVN2M8N5?=
 =?us-ascii?Q?n1NRxs7qjkXGMTwdZOdTqlCE6ZIwWqJ1PmKsKoJJHQiDkVTGZ9Ho1pSvAK/L?=
 =?us-ascii?Q?NdxuKysewWiVHnYCPNexZisqvuuTnbE8SNme9EImoMaLMRypso+gT0SoX5qD?=
 =?us-ascii?Q?93q8DqGlaVZmmNIrfeY68AmbogbI5YlGpgFl4O4bY0YJdskrozqi/BJvXARo?=
 =?us-ascii?Q?VxE14SmDJhk6Gycnmc8Pr6KjNnfWgTWJDi60RqBap0AXVy01aE8T1srfP89c?=
 =?us-ascii?Q?J+k+/X4flpoFuHVlbNBef8s/arFpRa6XqCWYIFidra50bXTv8Va6n9FjiseL?=
 =?us-ascii?Q?TuyxfcXjsUCyYoNyIZe7w5qp+oIA7YLFYfm9rIIEA8nKdUI2qY3f0XW1yu6v?=
 =?us-ascii?Q?mVvh/5Q1bWOXCHSoe9F5gOdDVq2GMWro0UZBkfvYsA+0GNfnX4LMGMD/XfXp?=
 =?us-ascii?Q?dBoK4ARkX4sLQa9gD2MjO3g5E77CUIfa/pWSTaKMagS/ry/0M3JyRgOIdkd9?=
 =?us-ascii?Q?unxktyfCMgH40ekSUgCrJPsPqAeyOcK2JZiIeaE5naphI+Y+0rQwWvzTl+Rq?=
 =?us-ascii?Q?1p92QCpiAP0oi734fcaixaYE/dlgxrvPvp8A7e+j?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2daff4c-ce68-4eb1-4aba-08dd4f291482
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 08:00:01.7058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nuTM/3O93XlmcGPvBNaKz6AR+FWe/iU3gs8Bnie1awbnG6Os91k7AwLCViHHmWqklKlSD3AKZmWeSzSu5D2c+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8435

From: Peng Fan <peng.fan@nxp.com>

Address warning: "Function parameter or struct member 'is_iomem' not
described in 'omap_rproc_da_to_va'" with adding comment for is_iomem.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502161648.WZWrFV7I-lkp@intel.com/
Cc: Andrew Davis <afd@ti.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/omap_remoteproc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 5f463937cbbf..9c7182b3b038 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -724,6 +724,7 @@ static int omap_rproc_stop(struct rproc *rproc)
  * @rproc: remote processor to apply the address translation for
  * @da: device address to translate
  * @len: length of the memory buffer
+ * @is_iomem: pointer filled in to indicate if @da is iomapped memory
  *
  * Custom function implementing the rproc .da_to_va ops to provide address
  * translation (device address to kernel virtual address) for internal RAMs
-- 
2.37.1

