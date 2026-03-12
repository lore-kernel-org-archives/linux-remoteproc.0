Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013022.outbound.protection.outlook.com [52.101.83.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF0532D0F5;
	Thu, 12 Mar 2026 12:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773318961; cv=fail; b=cl0TKJ16ijqrYfcUNgFBiqHxJxjSJdBFD6EuS5Mtm/Y3LT+fR/WzPrYida1TT5tkWQZQZeWlm6vfdv4C4cu7YQG2PfN5Fm9dH8+1Ixt8m1Q0Hz4FxlobNXq2fAolV0tI79RsnnYxAkze7pTIlxOkP3mVyQQbG7zn2mqZDPFbJFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773318961; c=relaxed/simple;
	bh=uTm4CxIUruwD2l/sSIljrLOJfzJOo6MfIDHcGTr/Rmw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BJHX8LezJJ/eWI/Yx5BwEAqDsGcbjIXxesj4d149gLUSU5XAjW79JJLbA17PrD3zAJvJLn88ELlWMDD00sJ4HhGaGAsIoYqGH8dUQU4crmOCZPFFMe4gaiNZAeqaqpDx9aoKZNzjUNOHcsHIf5qOnvw5y+qyFZ9MvzqVK/EbUCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UP6Yetew; arc=fail smtp.client-ip=52.101.83.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UP6Yetew"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIS39jY7VA52CMitK7udWW/gOUGQUuUdfgh2IF2rEdn2bfC2xtaHAqNRqG0Sa5KGtOnGteta8lFND3/yeHcV6jCtDAoj6v6MRNc+61mHlj8d2OoF2ZLVJic2X4NVohZlIkJXUzZ4d6/g4FGvsdEmtSbc+Qt3V592Ji1csgR6/oX3z/AdgjRBH4XFTMB4ZRxPH0OFVZ1lJTChg1Tvl8W7DQ8xx2SsodJKfB+cePL3FxGHP1wn2uBLoEK+47I4NnM8NvvPbKeKQHY6MS/jkXpa6efg0Wv+aLN0f94kBnz4z5oiqPGswiPTyK3bZ1Q9IhRg/ql/2a4GaDTK40fOmyzlWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKLxxEU65SlqDngWWvRHgSKqsWXkYbLkN9S5HA9LstA=;
 b=alvwRHgow5tS/Iizsul6k6JPl/kOU/eL0EHrKoXq6hCiLOfkAQAH40AZUSV81+aMa/OkbbXO+gZUWuKINTe7lNGZxHoWYB0NmkbPzu4/QjzJWc7nqY2FtaE4P+wrO5xqftx+V+wAoXjNCJSttkkKeI/KIivBwctrX2prW0qlz5tbUVE2wvbPVGJbPLe+14Cgxn+tSDG7J/7XlYhP1IKb6QprMexzllJVYvPrCBEkDp4KXP6w1fs7zZNVXaddKZKXLpXwdEgPoqOzZ+HBYO/s2nY7VNzPRqmpdbWh+gR3BYdosaKAXeD5PhwRoA5RqAbolrzjhKTnsziDe6BNQzGzuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKLxxEU65SlqDngWWvRHgSKqsWXkYbLkN9S5HA9LstA=;
 b=UP6YetewcdzUbLUr+spItZyKiqI7rYbxjaBPm5uM+Jy3/SBMs8BZO8Uv+Hnu1qHldXJGUNXFYMsevDjJjbUnbOk4IRRNbCr8tDGFpz5YBMoxQCPBwQRGvy9KL7mgyi5eAF2Kz8bfcoSLccNPaZZcA6+fmSz0Xqehhu2GfzKQUuXp80FsM355iQXjp856G8iYU88QlPaY1cnUXjX1R8Qw7+FbtzF0Dbk9dWXVQgfdj5mgnhXH3D/pedUyqf6GSHB92Wrcx1RJ90unbS23GuO0hzCoKxmOJOZRXa7lhDW7TOHOFmB0AbZS3nB4IKy8Op1G6i7yTlFBLpOP2V4O8zQIIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by FRWPR04MB11271.eurprd04.prod.outlook.com (2603:10a6:d10:19c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 12:35:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 12:35:48 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 12 Mar 2026 20:36:59 +0800
Subject: [PATCH 4/4] remoteproc: imx_rproc: Add support for i.MX94
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-imx943-rproc-v1-4-3e66596592a8@nxp.com>
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
In-Reply-To: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::21) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|FRWPR04MB11271:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b7f230-9e3a-476d-c8de-08de8033e364
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|19092799006|366016|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GSvPKAYfvC1wiDxM3YUlVztsameaDxL2LYFVVLi/qCbmXBPu/ffLLHDdyqQuembmTQiewMBNn69hlmFehmMA+8QlBkX7FjgcewMXBk8nUC/LF7s1kNxNnproygI8IUYh/9wsw3/p0atwnWYcomGw0SVlMDiMb67xdDfcLe5Vh5I0GZIwPkAjvJIJqgqE6RAHpU/0h4iUd7wv7g2bVi1f7UnjdrGJuuzsxWqv+W74ubD9XjYrW0Tx77ZnwHizUNPTsFx/CgqJaHrzpCCGwBseVoMt/yYM7rN2vYfMOGgQut/Pc4y3Qo6YBE8vySWJSkSVLra0e5OnCFTD/Ufyo72tIj8+nNHqUd5HcxteT62H+r+4KimSaoqdoGeXiPf4aelecG0wIFnjONKMnQgYteoMR6JfVzEzVFnSZvv5PjTKCyfkvgUnpmp025JCxavG+RDUbwmakPgdQXdF7HcqSzcSmzvf9RMZPTMfRXPdMBeVGmhtpTUWdavQiKTEqo9yXaUinpmF2HVsi3uCEsgVFXGkzDlI7oYSC1TTBA/aomYuLYCXuO483p03b78KEfimQ7V6PSiFR93ZwH6abtF87cXUX+agD9J2sQqegFdqKIX2zJ51IUWwmWL6Pf9UfAMNFBtV+rELTdAxeOFOOBd4qAcpFfaPHaMrig3oMp1R9LRZP95rpEZBuOebPgjZ0wQ73FfHWEvg2OzEOyH8kg9TOiu73OXQs0KeLPncs0mLk9l3Vz85tWH5w8IZo7j7ggY0iRvntm8mS/KXDEo5NtyM1D/rXSWf+KNTW6Aev7yR2MOrBBU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHJNeTE4anBnWkpGekJud0p3SnBaVnJDNytuZVlvYjc1ODVIRDh0YjJvMHFS?=
 =?utf-8?B?SkdUVWNLTGZML0ZHTWxnVzRmRGJvQkh0ZEREdE8xM2VkUEloRXk2emlZa2d5?=
 =?utf-8?B?MXNOSTVQZkluWElZZHprRWUxVzBBcDFHSWE3OWZsN1ZmZFUrUTE5UHRaTk5t?=
 =?utf-8?B?Q20zbGhEUkJpMDYyUnNTUDdPZ3d6Z2VjT3pzOXAvSXZoZExCWWlWdWRNK3cz?=
 =?utf-8?B?enBzVWsraU05TlJlY1RsL0dyZ3U0c1p1bE1BanY5bDBZT2lZdGFSOE1lUG9Z?=
 =?utf-8?B?NGdDaXFvNHRmeXJvcDZLc056Rmh4NlhmY1hTT1BTT2dyaE5WMy9lWWhVMXNh?=
 =?utf-8?B?MVZSUUhieXZOU2Z0bWdPbjU2OUgyaDRjV25KUjFlSHlzRTIyTzlFSU9yWUg2?=
 =?utf-8?B?Nm1FU3l4cGY2OHpCa1YzeldWZWRpaUY0UTJCckxoVVFvNjRHRFdMNk9rYVB6?=
 =?utf-8?B?alBiRFA5N3d2WWtZSGhlVkZtbjQ4bjIvNUJ6TytCZTdUUzFOMnY2VU9Db1hZ?=
 =?utf-8?B?ZUdtNzN6c0ZvUThmZWxnWnFIL1dZUDNLWEdCeEZ4QjJhdXVhbHFXZjY4Rk9O?=
 =?utf-8?B?V05zVGlSd2tzOFE2T1hRVFc2K3B5akorTW1qU1BLVlNnbk0zbWt5ekx1eThF?=
 =?utf-8?B?TnJYK3FBazJ2WFQzNXRRaG40RjVTQVF6SElBYUtRNUVQS1cxb1Y5SkVKU0Nj?=
 =?utf-8?B?eEVyMjVGWEVvZXdkQWdhOUcvSkVlY0RSR1ZJZnZ4SndUeTk5Z0d1Z0M1RG8v?=
 =?utf-8?B?Qk1KSVNIVmV0bVBmbGhDOFF4aHJ6bDl5d2V0SFpQNnA4bHJpUElMWFpFbTZa?=
 =?utf-8?B?Z3UrOWFmT0VvR2hNbzVCejR3RWQvWittY2tqRnhUb2E2MWNhTGd1UVlzMnRo?=
 =?utf-8?B?YWUvQW90KytPNVFPbS9xWFhMZ1Y5aW4xVWM4a3lGM2FiU3BMQlJadVVUaXpY?=
 =?utf-8?B?ak1tR0JMTFliLzhpOVNTWGFqekhsRmZid2djTm82cmgxNUtGbGF5RlgxVlV4?=
 =?utf-8?B?RmgrZGp2Unp0STFhOVdHOFU1WWhReHVRRlBUQ00zZ1lBYXN2b1FQY1NiWUR1?=
 =?utf-8?B?Uk1BOVFTcFZoQ003cFY1TkxyOHJZOGVJa1pIS2Y5Q3h1MkFjQm4rdlRWbkJO?=
 =?utf-8?B?NEM3WEhHa05jWVJ3bENkRm9UYXhRMnZXYmEweTE4Vm9SVFp6SHc2L3pPTm9k?=
 =?utf-8?B?S3lDeEVBbEJKMi9LWlR6SG9rR0FHT3pEZ3dnVFVQUmpZYTNGaGtIQm41T1k0?=
 =?utf-8?B?QmVlQTdYcG5IeHpqRFErT0NOUnZvaXJVU1RkYWdTVWZqei9oOEUyZEs4NUZ2?=
 =?utf-8?B?S3Q4aDlXWHhiTG1mWVhFNlZ3SElxdkU4elBVMDRHVkprVFZVZHdHdzFJY0Fv?=
 =?utf-8?B?aVMyMnluSEtIWkFCMHBEZGtXc1J3V2NVNlFocG5mT3hZQnVmYUJQcU5zVHox?=
 =?utf-8?B?eTRyeTk0dXlwanVZOW1Od0ZoK1o4dk5qUnlVTWExVDFKODlPeGZ4ZGhsM01J?=
 =?utf-8?B?VkVSb21GYnhNdXVONHpKT3YrL1NXY290SXlETWJwUU9OSDliZ2VhNERGUHlD?=
 =?utf-8?B?YTg0d096MU52WTZxMGNraktZY2ttazZJbnFWSzJIdm5tZUtlNmw2d1NDbXM4?=
 =?utf-8?B?K0d4R1BHRk9kc2llNTFuMWZteXFBYWVyelU4WnpqVjhRcjhsdzY0MU5lY1Jn?=
 =?utf-8?B?M05NaWNhbmZqQUNweWFhOWY4eUJoeGNOV0hxTFNxTWFsbTBRdEF6ZDQzMHBo?=
 =?utf-8?B?VGVRSjVMYk85cXJVdHU3REZDSUtIcW4xK09HU2hUaFFxMEg3OUh4dVptallV?=
 =?utf-8?B?WEx1WUh3ZTZieXNYeWVSQ2VvVzc1bHJmNktNNFRPNFpLSVpRWi9UZ1MrV0xK?=
 =?utf-8?B?RVpXMFo2UVVrRllBRHlQU2pjZFUvdHV5RjdSYlRzRVNmN0gyRStVODhpMnl6?=
 =?utf-8?B?NlBzWmx3ekd3cTJBVlVzazZFUTVnZ0NOdEdVZG9IRUtXcVA1OHBWaWZPRmxE?=
 =?utf-8?B?c2taN1VwTGh5SHJ3Z3oxYUVQYmlGa080UThRaWRveEoybFJZR2JZNHFaVVhP?=
 =?utf-8?B?RUEydFk1L0NvYnZ1eVU0Z2Jkdy9WYWRCYmJkS2ZyTUVCWlcxRyt1SnhqK3JR?=
 =?utf-8?B?MUpLSTVscG11SDUrVThXRklNTWl6d2dNRlZoSmdQNGxFM3hTRytWakc4aWZG?=
 =?utf-8?B?SU8xSU0wT3M0QmVieGUxdWtJWkdVSE9veHJFNDdXMHVNaFJ5SzdKaDZma2tB?=
 =?utf-8?B?L2NRNXlxSXpxdjR2VkhYQlFtSitJMitGWTNmUFc1NCt5MWsvZ2hZM2dvWUlR?=
 =?utf-8?B?bkt5d0g3YXdZeWtmTXp1eExoa0t5M2RFbzh3NEZ5THptZGkyV0I5Zz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b7f230-9e3a-476d-c8de-08de8033e364
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 12:35:48.2759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0kYVZ5s7oOSj/JPeRGjgGUsRr/bxLlvRuiDrivlsPKL387vk5AKkB24lauVcWVDYKoGLjTQa75MO+lOa/Qpmtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11271

From: Peng Fan <peng.fan@nxp.com>

Add basic remoteproc support for the i.MX94 M-core processors, including
address translation tables and device configuration data for the CM70,
CM71, and CM33S cores.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 68 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 9b07103857b13018bdf62431cbfeffa3e3c1a15c..8278643eeb390518981e8beae086b73be265f50b 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -146,6 +146,47 @@ static const struct imx_rproc_att imx_rproc_att_imx95_m7[] = {
 	{ 0x80000000, 0x80000000, 0x50000000, 0 },
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx94_m70[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCM CODE NON-SECURE */
+	{ 0x00000000, 0x203C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+	/* TCM SYS NON-SECURE*/
+	{ 0x20000000, 0x20400000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* DDR */
+	{ 0x80000000, 0x80000000, 0x50000000, 0 },
+};
+
+static const struct imx_rproc_att imx_rproc_att_imx94_m71[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCM CODE NON-SECURE */
+	{ 0x00000000, 0x202C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+	/* TCM SYS NON-SECURE*/
+	{ 0x20000000, 0x20300000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* DDR */
+	{ 0x80000000, 0x80000000, 0x50000000, 0 },
+};
+
+static const struct imx_rproc_att imx_rproc_att_imx94_m33s[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCM CODE NON-SECURE */
+	{ 0x0FFC0000, 0x209C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+	/* TCM CODE SECURE */
+	{ 0x1FFC0000, 0x209C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* TCM SYS NON-SECURE */
+	{ 0x20000000, 0x20A00000, 0x00040000, ATT_OWN | ATT_IOMEM },
+	/* TCM SYS NON-SECURE */
+	{ 0x30000000, 0x20A00000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* M33S OCRAM */
+	{ 0x20800000, 0x20800000, 0x180000, ATT_OWN | ATT_IOMEM },
+
+	/* DDR */
+	{ 0x80000000, 0x80000000, 0x50000000, 0 },
+};
+
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* TCM CODE NON-SECURE */
@@ -1466,6 +1507,30 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx94_m70 = {
+	.att		= imx_rproc_att_imx94_m70,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx94_m70),
+	.ops		= &imx_rproc_ops_sm_lmm,
+	.cpuid		= 1,
+	.lmid		= 2,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx94_m71 = {
+	.att		= imx_rproc_att_imx94_m71,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx94_m71),
+	.ops		= &imx_rproc_ops_sm_lmm,
+	.cpuid		= 7,
+	.lmid		= 3,
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx94_m33s = {
+	.att		= imx_rproc_att_imx94_m33s,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx94_m33s),
+	.ops		= &imx_rproc_ops_sm_lmm,
+	.cpuid		= 8,
+	.lmid		= 1,
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
 	.att		= imx_rproc_att_imx95_m7,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx95_m7),
@@ -1489,6 +1554,9 @@ static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
 	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
 	{ .compatible = "fsl,imx93-cm33", .data = &imx_rproc_cfg_imx93 },
+	{ .compatible = "fsl,imx94-cm70", .data = &imx_rproc_cfg_imx94_m70 },
+	{ .compatible = "fsl,imx94-cm71", .data = &imx_rproc_cfg_imx94_m71 },
+	{ .compatible = "fsl,imx94-cm33s", .data = &imx_rproc_cfg_imx94_m33s },
 	{ .compatible = "fsl,imx95-cm7", .data = &imx_rproc_cfg_imx95_m7 },
 	{},
 };

-- 
2.37.1

