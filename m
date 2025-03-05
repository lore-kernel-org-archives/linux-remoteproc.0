Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0522207658;
	Wed,  5 Mar 2025 10:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741168883; cv=fail; b=FwkmbaODHAP2bdIbvzY09XAF9zR1pgg4jIfq3EFIdXCoj+294nuFPfQ2MfNCAZ2kyTvV9/9oH+PGKr3T//3Fjw02YnQX+g00WASSDZ4xOFlg+mJi6It6ZC8pWcdmsoVRP6pu4oYqV2n3P5lntowRlva6NAnjPgxnEa/KhWU5+0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741168883; c=relaxed/simple;
	bh=YritmhOjf3ccSOJ4/GBJIlP2XKujZqfFBfTVQgNfMyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mffQv0flspUZw1Dd/ePuR59pxQTCwp+tK8jUCgfVJiYcvoMW/okqc8CsAbKf83RGpgIMwEUzGJXFv8e+8vqcoMniA0HjxLzzWusQXfOwDlLncZNQSW8mJ8CeXbwzv1nUqm97t+m7WczXvLiO3swhqH/2B/A23YChoatYG6ey3HY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ds2OR/Oy; arc=fail smtp.client-ip=40.107.20.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ds2OR/Oy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exx2OCgRzVJQLAcxxfoEw99q8sOogq/BcqkhtB3NbAenbVSyyOgPeyUdBTnZ+rsxITcyqxhUmvrRI87Uoszg3pcpwQDTImEPYx1NkqlibVmle2r1U38rB6jId3K27TbLIMKt465c0IEUove0+1PRTL7QPKRkj6wUdF2wqpeDKc3R49qZnx6Jbaw9f7PHI4HV1XAV2Ea4Gi5FHT3P/B9mhePtOqaZV6oCVo4WI0Zpq1TQ2OLg8b0EufTRJwLn46nZX6sM9PDserAkQc/1wodW0gvdbp2OBMMaOSd1XdvE84L9Ql6KB8TDdfsPTlxsnKDIJFut+jY7SeDVQHockr7W5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTsrVbs71pSl3nHVoYW7ycmSUiuNwFBNK93g5XNbbZA=;
 b=Fk4s1h91DMrXxWy2Vb8R7IiPzc2rjA20T7qeKoSYv4kuPfS7xQRuMcxP8vKv3eylB0Fb0Ipd9CCbZ9MiYmCrrEQlQ4bgqpzU54G72KOtuurLi/Y2DcUTUVYM9MbYbXkFJfERg8UQiYTaS1hsELe6O3XNmKgf7cutRmgM6KInnQ+NGYIA9t2pAJmChJWTvotKZlKKazswv912HAl6l2Xzy/NzN9Gzzm3p3yQUt7AqamjPUpzA/NO+m2u6kbNKigpchKZKa4trfskni4EFXIkQrxue1R2zXw0mLwbBG7czN/31JjZckvmB0/X3niae8nEeZ4q0RLjX6MhjNpXIVS6kZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sTsrVbs71pSl3nHVoYW7ycmSUiuNwFBNK93g5XNbbZA=;
 b=ds2OR/OyZwfkD+OBOGhCNBhfDEwGefMY/dq48fPdtNRLzy6FD9D2L9dG7LZi2vYoD9tb7quU/NmyCDyWWuaWMbCvmOhhk9EV31WO9P6mrjjevwE9H7G95pUhNFioDpON2clJxyafDcO1EroIQA8QYj7+JdXZ2xRAiRAt4BbL8bomYsTZi/sJiqGZULRROWIQ/w7r5fEUGmGDNW0Q3ug9LiNa8AcBFolYuPf7dMPjMA2qteZLuWoQTPNdhR//TgR5aODs10vI4Ekz3N3bmJBVNitIZktqSNjBDggmDTwTW3XudDjR+rTeaeKJQhHUvvJKnKV1KenRzHgT2NpJYUCKlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VI0PR04MB10541.eurprd04.prod.outlook.com (2603:10a6:800:26a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Wed, 5 Mar
 2025 10:01:16 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 10:01:16 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	shawnguo@kernel.org,
	mathieu.poirier@linaro.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	andersson@kernel.org,
	Frank.Li@nxp.com,
	peng.fan@nxp.com,
	laurentiu.mihalcea@nxp.com,
	iuliana.prodan@nxp.com,
	shengjiu.wang@nxp.com,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v4 7/8] reset: imx8mp-audiomix: Add support for DSP run/stall
Date: Wed,  5 Mar 2025 12:00:35 +0200
Message-ID: <20250305100037.373782-8-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305100037.373782-1-daniel.baluta@nxp.com>
References: <20250305100037.373782-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0031.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::12) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|VI0PR04MB10541:EE_
X-MS-Office365-Filtering-Correlation-Id: cbc3f511-9828-48ef-699f-08dd5bccab33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GuLkQ3s4MHUDv9BgBKV9vfzEYwoowk4NRE7egOHyH0Jg7EbSTNQoScFw6B1d?=
 =?us-ascii?Q?EDOqPILzS9XDm7kcQxTt5Ca2angplN0vUxZ3Tgu9vT3eqcHVB4BzcGkKPu/d?=
 =?us-ascii?Q?vbdu+w3cG94JEMc/VqUPiNWHy0dbKuC8vfJrnDlWsSfRtWMIfrmUIHDLSqiW?=
 =?us-ascii?Q?Ap/kbXv1DTTnHLLi09Z9tP0jD1siaqu+MHM5yL1igncjmR5zaszYVCDf32sg?=
 =?us-ascii?Q?wfSy3By0eQ0dqMjrpSX4u7uxKUF27CJu/IUPgEzCieskq9QDTqjTF4qanvUa?=
 =?us-ascii?Q?1w1jgywBLotxoesy/1Dse39hYNlRg1J/Z4mu9AqSBj7Qv6KDvKTYghwG5G8s?=
 =?us-ascii?Q?bS5YU3DXdj/Qq1ysptFsJc7UcPLsDJ1PQ1D7RhX1B+Sh9fDNDNE8apjp41yC?=
 =?us-ascii?Q?0JVrloYwb8ZGZNmyjJbSjXsT1zKQVN0Oi3cFwrH0MjIOatabtxjlYdJKogFF?=
 =?us-ascii?Q?Zn6aMofVFeuwhm0haQpOr3TkSrdrZRKYuVIiPL+Ym2hkTDH0e/rNTUxnJCqX?=
 =?us-ascii?Q?tiF5h5qkhuWKA2kfo9+N8A+nOiTNvgrkPjyuKhSauG3zRFoqJHksatnMeEcY?=
 =?us-ascii?Q?zt4gzXfyyPv338DDS2l/LdYkAZKwfH2XzrZ4guH5bdZrONFrAMC9kQMfCDhI?=
 =?us-ascii?Q?ik0OIYCe2tT//ZQe5Dqk3cQrmXaC6pw1341uLOUg9dUUbzWF6WBmLqE6QyAS?=
 =?us-ascii?Q?nqmPf+KtAcNq9OgTHxefQDbIlhVWNtmizDvbtlzdV+G8tmJC/W1gyQXHbEhv?=
 =?us-ascii?Q?OLSvBRxuJl81iozwXseFSZe0AgWZwvG+UcUtawB6gxnfcBpsS2Rp+8AUxV5S?=
 =?us-ascii?Q?jBRossEstDm/+O4WrIb+PuBw7DGOj+kECK6EruqxceGhRf2kvM8KFmPkQsJ4?=
 =?us-ascii?Q?0KwvL0GkTtNOW9CtE/lcdnW5JMdR/6flTGeYUwqEQK5Rg/A99kTpXumM0Q17?=
 =?us-ascii?Q?nGoQ6J8234l4UBnIGi+eW4jUPZvcw93uh61I0MCS0i2BQrIhYuLQXwpwixHH?=
 =?us-ascii?Q?30cXIhjI1PpuUs13T2nLiBrd/fkjqvYgk4ucEoDS04SUN/nqF56X1elAZ5Az?=
 =?us-ascii?Q?UjYYogvFpd8x8bR+4mc41U3tgrKV2r2uaArTo4ozWFJ7NnsLZfFTuyODlDLb?=
 =?us-ascii?Q?rJuxVUdF7NzbYDF8jaFC/fiQCHJwUBHWaEfYRBYX/gYZlsToU8Anatz1L3wk?=
 =?us-ascii?Q?ul706MP0e/Fbg3UTWIicMxX4P7ecFuQ6C7V93IAFxIhV/oyeahmx1ouYYAp3?=
 =?us-ascii?Q?NLb19L5Pnv1CBcLNwiLdc5NjPIK4VMrcde6YOremRZ45/IpmwYS9l4+moz39?=
 =?us-ascii?Q?U/oxLmtugPalEsfZ92lEEhO8FltKHkk8sj0U34j04IBHalJcr6ddE7uidYBW?=
 =?us-ascii?Q?8aZ0/8TYtB1p2PHdrHlGQmQFuIhwmiZlblOjAoPQm1SvQPEkAIwNte4kw/xF?=
 =?us-ascii?Q?uecuVE2wU0Zi5g8vnR+THm66GTjyY0md?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8yW3Y0lTHAa2bwN8dDtzlVOKSNOU4z0ALyHYs7pV/g8xdstwFz+bE7oVs/HO?=
 =?us-ascii?Q?wFWB23+m/K2hHxJkf4r361r1sKBhO8aW34wqt+iCMUgNmEdbOq03HZJgos3L?=
 =?us-ascii?Q?tEQJZoo7+VfR4NubkjwAcaUxLnohHjwwrPutrTRFhTpDsSLee4CkqhgPt1UR?=
 =?us-ascii?Q?BpKSN6qmcgN6nVMUGNKfLGiUZ8YvfTGyVMvPHg/mwzglipe+GEVfcWiMSBJ7?=
 =?us-ascii?Q?R1K9UN1WlRr9lPkfdze3ciiQ131b+YSrd00EpEXZH4UD8NKgSHFke2hoaW+a?=
 =?us-ascii?Q?Rd2IYOGR/yu9I7YeKvPAAKBauzdsm5k7gsuzepEgAqkXbzYaQyq10tX4403o?=
 =?us-ascii?Q?IstzcpPSOvieo+H0ZZef2MI+8zikFH7ya/TTcAPTmvt9/GI6o1GS44EbfNGJ?=
 =?us-ascii?Q?A3XlAgaADtVpWFiO77nVc9qSlrSytfEb3+BfEuaSsroZQraLavpZPoHhbBp+?=
 =?us-ascii?Q?gspU7vsUfLwkZ0fkE+1sEaPahry1ysBADIOVs2/ZIvMvXwD961qd7BVx6F8/?=
 =?us-ascii?Q?3gaz0PshBWrNG5nGTdDcb6F5MtZTmmG7udXTsq9nMnqnelu1g4kn/0zwmoCp?=
 =?us-ascii?Q?fuGq52BF9kDINQYYzNvlN6MTSkyaHYqODJXLO9wE0tand4cSwF6oMNz2/McP?=
 =?us-ascii?Q?SiaLM7kpkqS25cTI7XroiB0IHGGwj8tqxbcJok0/sPRcBQHG/EdshGwH1wxw?=
 =?us-ascii?Q?m9GPYq7gitG/eCHPhzYy9HQr4HwLrybMcMKLM+JkDYsyi/WZqkZfRIvSIja2?=
 =?us-ascii?Q?acneCSTkRZHJwE5iATlZgmQl4bY41f6kBBNv6ludk2NIhUVmb/pqvuHgl5zz?=
 =?us-ascii?Q?lPdEvHZwcZTcIo5hObNrewmIJ9VQUk9lYZxhNlNyT8uZRjmvzGAxV2bFjHoB?=
 =?us-ascii?Q?foh9dSTKRwFbpOAVf8J3xr7bHvy1/W72EXtHSH3Mu8ZMbiNX8XKq5D2AGfGg?=
 =?us-ascii?Q?uuaRD0O9Ba1iD7p0HMIGvqWHWiO59P5cnRpgplSSQG+IqWr7NIgmZyi44gOo?=
 =?us-ascii?Q?vxaT8qKMKpoKIFjmz8GbP8dKyAVzs7YlV6Py1F1/Tj5HPxp4eXTh5nyalvgK?=
 =?us-ascii?Q?tIJItOYgl1G8NX2k5PsUEsmNfspaKVk6USly6SIe+jQAIgHcVd8Ilrit6io7?=
 =?us-ascii?Q?5REHViQUtdsSoaL0qvOVaD1PHop/AdyAl07BsjCFcRi0JlBl81KY+m2kTJKa?=
 =?us-ascii?Q?nZWTa9VqCX19CjSBtgnRyJa72PhzOvj73RQuxUOgykzE7P/w2xcZAWNEjx1Y?=
 =?us-ascii?Q?8edmSUwj82Sla6BJw1ihlPNmJ8D+meVIs+cvuC9/D5GVjLLeLpUeUdooyidM?=
 =?us-ascii?Q?Vdvkf9nZo/qUVRABFA+cyk6Y2GoovdMxF8gR0vYl4gFAIZpZ94XbnM7Lgq2E?=
 =?us-ascii?Q?fjZsMtHbaBhJ1Z0ySX1qTJPK3RMfEHYvKbL8V4lpPs/PCLStZ9TZihC9ea4l?=
 =?us-ascii?Q?sxr/97HfqtfwdOUh4ZFWf0wPs6hn2z6n5YCjCFDQwPAwH12IU1TXofLMQEEj?=
 =?us-ascii?Q?ukpdurIiKxAYVa9k+t4PQQinBlIR2+w6EptMrQaYxTxtSiKNEbcY5Y0qMPJs?=
 =?us-ascii?Q?nv3MUBySFLqacq45MR7Dy4aZh+4CcBVN/iFh2Y7J?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc3f511-9828-48ef-699f-08dd5bccab33
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 10:01:16.3262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/lJLZ66E+CkX24lZE9EW4SxWo0yT81w/BAUNbSZC86cwkaSdotNW52GejDOCGWwpYMl+MlOe+cp8oODIFzS4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10541

We can Run/Stall the DSP via audio block control bits found in audiomix.
Implement this functionality using the reset controller and use assert
for Stall and deassert for Run.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 04ad27aca806..6b357adfe646 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -17,6 +17,9 @@
 #define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(1)
 #define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(2)
 
+#define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
+#define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	BIT(5)
+
 struct imx8mp_reset_map {
 	unsigned int offset;
 	unsigned int mask;
@@ -34,6 +37,11 @@ static const struct imx8mp_reset_map reset_map[] = {
 		.mask	= IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
 		.active_low = true,
 	},
+	[IMX8MP_AUDIOMIX_DSP_RUNSTALL] = {
+		.offset	= IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET,
+		.mask	= IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK,
+		.active_low = false,
+	},
 };
 
 struct imx8mp_audiomix_reset {
-- 
2.43.0

