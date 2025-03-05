Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA5F206F0B;
	Wed,  5 Mar 2025 10:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741168879; cv=fail; b=CKyAS3TQhf1agFGHt93kfjsES5XqfpnnMSqnQsBceHi800SFkOATYWEddpVj81FEKoMayabISGmyg5VXZq93SZfu87gGbiNjMvQzEAKglPfZnnbIU5xZC3ARzgNYNV7hPnbranckKiZrTgC9i+GSqxufHKues/yohrQ3WEvwGFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741168879; c=relaxed/simple;
	bh=nNET2o9MG/DnbUz8RuWW0mjS/KloCcBKeipsuWUAI9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BhA8jKd8rHOWeM5076XvEHEh4E1eSxYdSvbtFExZGlajp9x07CfsO8jFvMQO6GkKudccvDu8O3wkh8kUBsIhoEENtDzEqM9mG3mlZbyKnKBKxvS7JBB9f8Z3/0TVpYcV/04b9J2IVbg8ySzGBgacX7a5ys/+HZjs8VA9LxU0GjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=i9R/SIe1; arc=fail smtp.client-ip=40.107.20.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="i9R/SIe1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bo3vNq2dkSpyXSwmyF/9o0nJ/o7gcyestTZeY7Y4gHaSOVfr28tA3VgfoeWa9Gk7a6jv+J2GsIlDCkNwqMX40E4lE54jDznmrCXx3zmSrqpE8y+6+hzyaDd0U+q+pio8HWP6UdBTBvxmvosrGwFozKIc5mQv5QyDBX+GEw2nE1ZwxG0aW38ytMHEF4dYNUbKQHuYvRij6sAqejAgZWtXGKlyU7JdKCfxVcZ9KjheyCrnPuOHEU4Eq58/U9cXSWclt2+u/TJyvV8R8rSMZgzn0qmg+GCeTDJvwFO/BeJTCtB5//2GlUuGgxZDWt8GROMGzp8xXtAx3iA+p8I56q0lsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SufzJ/ZZ1nnO603FcFiql4zJjMiX33sMOeIReWG+GmY=;
 b=PzF0OLoCpnXPVJfXKVxoT6Ws/rWRJOaT3/3lv4xtzsf+klSXLeCRogCLh5xK9/vBJMRTYs8G/oQ8VtsJh3R2hxndl0AN4oSfCMSrUNlV16h9/3juj0wW/WjKVn1BhIsS3pJK7zOK14ST1zANCh7EnTutgEfbf2v9JcNJOKj/ClqT5+9joVTw8/ATeVZIXzUpFoYUr65EHdyXLaD20gUjAA86vTZffVlNMOH0pb11TVIEcWxqz2MVAOPQb21uEmZ3u9/xkxGxuvazpwKHHBeeqz5MMutXDBZ91+J5nVaF2G36jlpwRCkdCEaMUgo9KAT5F8zyzM742fEAHqnL/Gu07A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SufzJ/ZZ1nnO603FcFiql4zJjMiX33sMOeIReWG+GmY=;
 b=i9R/SIe1Gn+bpPvAkyndF9K4VCCog9EBeUomcG75G9z/nkoCuR1ezmhIUskN2xB+7yyr+J6niKc2c4t/AvWcqUcFGuf5cU0NCN2LpL/SHYGbHcCkh7SZYnDKUmd7VEuRNyBec7rvrVzjBL+Bn4R6uanBSMFvtgKtj9QQJk4IpVHC1QpPNzhlkzk//0mjvXl+j+RxrC9aSkZNDRcUsNaKQgYfjvmT+QrsKzmguAQrGCwrq27P5g7kPKgA+D8NsUbQB+xpfIhn6eMG9mk+LMwrcI4FUd+Tmp4Odwy/L606b7TUdUQW8a4InG3IzLAuu9+UvTJa2gKY4xSHj4qgXHYQHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VI0PR04MB10541.eurprd04.prod.outlook.com (2603:10a6:800:26a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Wed, 5 Mar
 2025 10:01:11 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 10:01:11 +0000
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
Subject: [PATCH v4 5/8] reset: imx8mp-audiomix: Prepare the code for more reset bits
Date: Wed,  5 Mar 2025 12:00:33 +0200
Message-ID: <20250305100037.373782-6-daniel.baluta@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: a8e90186-5a78-495c-5191-08dd5bcca830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AcFcVJ2uit2xhnsHrczFtKnR5qi7F8o8pnQ8QbTkUBFDqSmFnC+GbndO5oYS?=
 =?us-ascii?Q?okaUc5a8CnD4G9KS6CNSbBoy70DREvfFM6PjNN5sn4ErbN0ZfWItm/KwJLgF?=
 =?us-ascii?Q?xNHFyzzFngde8eGL2Um3NpENdFvrFZ6zbrzvi8XwGsUMkNGh6nZ++Ya/AZF1?=
 =?us-ascii?Q?dbVCm935YMD2YywbaSPc7OwHJaXTCqGQiTwBbSclAeyJyc1EofeMG6x99SGb?=
 =?us-ascii?Q?7COV0/IjNbXGSa0NOS3Tm3BRIbsw7BSADiWbwnS4JtN3haZZHcQBZqSf/Aoc?=
 =?us-ascii?Q?HHPgvCou+kAwbxtCuDuSJYUOCxKivCDwjXnGGF4b+PMPY+pSKja0Quy5AWYd?=
 =?us-ascii?Q?nEbsNzGIGyWjl0CO0S7BMQbICF3C38H267cL8dJMbBn+99pbNsVKfpMwDK8S?=
 =?us-ascii?Q?7zv2AuQmLg5ZWfxxzx9VM1IHekft8P/fLcv6wskj3z62w3zItxFaWaB7g3Yx?=
 =?us-ascii?Q?f1bNkRSljQ/QO3zOMI8Mgry6k0e/aPOtjKcYVYVpk0FgezM5G0buQo0EPE9D?=
 =?us-ascii?Q?Ckd7KgyZs3REGU6VT5bYYztsaDON4Id008WVT2EUKPxyhJHNltRJgeAnvPlP?=
 =?us-ascii?Q?XmcuYN9TJ9jUZ7BIqU4xg7fb070qatnR/bhxhmhz/SuwVkMxMUWMZr1hX5n6?=
 =?us-ascii?Q?7NkjwM4rYtQmVCCjpQMdx6EaaKzshNJAvH/xsEjojPHrvK87TENsHoqBms8q?=
 =?us-ascii?Q?jmLn5R/wEDP1EktTvQYoFe/pH/Y3UdvKzozr90/KzY75L3EgiKslBSpB5KvI?=
 =?us-ascii?Q?R80TBfxDT/BKoldLNN11dJ4HtHt5lJjIHJJ3HpxVL4rqGdMDZfuEq/er0IDh?=
 =?us-ascii?Q?P1cP1dCjoNSolskwh5fR4VwrAN6e6MHaHB3cCV5HrjgUw12GOrX9QxV+hg3h?=
 =?us-ascii?Q?qJdDvOq+OF5YXDeyxwD3/9j2xX9i59BD0pkllZM2xdNiYIC0J9pnj///zMbJ?=
 =?us-ascii?Q?AGcntpAodPxCXUog48EnmcROcCT1uMAA2W65BzUYfQqrEY6yEy1Vz3CqypoW?=
 =?us-ascii?Q?M2lZdc5MJaGbm4E/YPKdvDdpFV4Pm9t99DgTYWIVQgwE7vaob6h+ouVXJWhC?=
 =?us-ascii?Q?If3wrGvri4SYPr8EEC2/cs+qUDzvBPks25zmzkYRK9g011L7ykoV9ezE6ImQ?=
 =?us-ascii?Q?GG9TTtILCS9hre8FyIRm4dXrKrOWsdwSHesxrzIRGirbFJBETQUEdjZcIZVv?=
 =?us-ascii?Q?QFO8SaI5VIRNJqZWgzPGWdMG5C6FmiD8Gmkf2rr+knuckmU4cPEIQV27TJpp?=
 =?us-ascii?Q?Ur3YUBelWF/yMdb9y8cg5FayfV8oQXKQUNLblGdp9+1ryb7haf9DnMXjjjzH?=
 =?us-ascii?Q?daTXU2Vsi1eLOx6SEmlwBTEWnMFTYsZjMgjvejq94Fw/YLRhvmHItRWGtuE6?=
 =?us-ascii?Q?EP5rO1VLcnfwWaQwVFznE3J6TNPQiimJCPqpgClEmuRnA5GtT0XUJLSTNaLn?=
 =?us-ascii?Q?5R8GS0UrFVNih0jI8d1mLzc/qvkirDrR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xk2xn4H4B3Zi1nObPCzoUVwyP2MsD24pZnl2Dp/s1Z230SSOAuB02uxYiqC3?=
 =?us-ascii?Q?qPC874RT1uZEI25x+V6RtnYr/2iS/RLxR4wkXH4Qj8YcY0RxgGh/P3vwlFtH?=
 =?us-ascii?Q?lo7p6VCrUWtikcv9Y2GUXJ9aw/SwjJdXvh1LYn67m6w6Pqn/QaZGMlgMLDJ4?=
 =?us-ascii?Q?24fiZCUtvF/tmdn/35QWbENyr/jdMxP0mn0pwBRrwiEuDJ2BdG09rbtriJX2?=
 =?us-ascii?Q?1Mf3lfAfKeqx+K1VreF/k0X0mXioEFyjCE0WQZXSvHbC1po/iaUxdWDrOgvD?=
 =?us-ascii?Q?cbFoCxXSgJXaEr6IvC0uutZIybcvQBejR89RoZjk8knSQ/AAEJike5/uxdXm?=
 =?us-ascii?Q?G/rr+Nojgkw5Fnp8Qaw8S8efwP5sBMz6Xhq4JuNryjfg6cXip1cX6/1aJ4On?=
 =?us-ascii?Q?yDYcCUE/InvhU4DnyL0LklgNMTM0a393X1qgFFq4yc/kYJT5lRdxBHB/bDph?=
 =?us-ascii?Q?OBQz/heBhk5b3CIM9kOPOpSnA27Q7HoatVZq9oCEDnmhnO6/Lo9VcCLCpJpJ?=
 =?us-ascii?Q?NYDmKdGzxibxha7OIoEn5F8yor0RP6ROABy7rBrsebf7uWS0DAeEJdUEdjac?=
 =?us-ascii?Q?OVtPPOnDXJZ8jUtsMClzyhYKQgROiZPG7mNYMD/C5BCBhuw8crAGC9ntZ0yl?=
 =?us-ascii?Q?vfEr6rSh3ptVl5LBNxVaeEsKJTzIGnY5U91O13I6CjjGs+kYwCuFrk6FnoO0?=
 =?us-ascii?Q?RYKMh4kLjwdXowYdZ4lps9RPZ9fAHHhdq4GaYy+BZ/AEcixzNSzCr3XPZei/?=
 =?us-ascii?Q?ZYdvRzraaoB+furP7wjsK6HI7AYkCn4Rt3qIASP2xA2Xv+eYpTc4/Tdzu75w?=
 =?us-ascii?Q?gAeCB7LG4JR5kIKrKzVRN5/mdIcWkugdhHMoG7+4/7Uxc+9lZRTHcOyFrjjR?=
 =?us-ascii?Q?u6PKspoRPZSY+B76m/sOsu6asSaVWaABIOVpAX8dAjKBoeS3tyT0WUsim8qB?=
 =?us-ascii?Q?K16OdhMx7Ne6byKry0+Xtr+X17JhsMgGrOlQR7Av6juTwWgKRU8SzuDrLULK?=
 =?us-ascii?Q?59Gi9A0ahrOjF20B7G2kOuBRXVVEHyRyBjWIepTrSetZ7hKH0lPleq8jbHbJ?=
 =?us-ascii?Q?omvWbWMwHr4GkU/kqLmERNUW/EYSqSNRMRECZPRpaaXSu//7AzMteWYWEnDa?=
 =?us-ascii?Q?3mU/dPmWIDSkVn7j7rZYVWt8fFH8JVoHxXLewlznSClA/7k5l3jNVX/5VNfY?=
 =?us-ascii?Q?WYcHMasd1Jgu4TZE8XlRpqaLiqYY1iU9xrvqwrv7MheXs3SULdIt6H7rQn2x?=
 =?us-ascii?Q?JvsEtppBpZnSxsXwDtZVu3lGtdKtyOXlzOKYMEe7KUGw5skBwEBtvMxHfPnz?=
 =?us-ascii?Q?mIRp1dyjfHpXDzOM5r7KVT/FOC8a/eMX6lAbMJ0DKo8hWNSyz2MG1KTf7Hu1?=
 =?us-ascii?Q?+9pRTTjVc13MJnPWEyCl23lNad6FbDo5amcq69FtEzCFl+xVI0vXGH1hoZ5F?=
 =?us-ascii?Q?2rYFhoNgaLtjckL2Q90C9NUf0GjXc/+CZrMLWJsaln69RRXnVVivJtXF6Lln?=
 =?us-ascii?Q?GEQBv3DIloobPVei4pLubkuYbUBbQxr0Yj0w9XvwvfFw1roN4JNi158TL803?=
 =?us-ascii?Q?T3RkxvYCeUyyN/K+HWz2jqy4mg/sxF4nj0gllbCt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e90186-5a78-495c-5191-08dd5bcca830
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 10:01:11.2817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFMmrFG1SDQcoawzuHgClBhywAcdkx598OBH4AOwZ8lHQfM2Ft48B0hwU3vn9NoHmUrBO6WUVFARN2vw2JciEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10541

Current code supports EARC PHY Software Reset and EARC Software Reset
but it is not easily extensible to more reset bits.

So, refactor the code in order to easily allow more reset bits in the
future.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 43 ++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index c2c3e8113182..abef6d768e62 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -3,6 +3,8 @@
  * Copyright 2024 NXP
  */
 
+#include <dt-bindings/reset/imx8mp-reset-audiomix.h>
+
 #include <linux/auxiliary_bus.h>
 #include <linux/device.h>
 #include <linux/io.h>
@@ -12,7 +14,24 @@
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
-#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		0x3
+#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(1)
+#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(2)
+
+struct imx8mp_reset_map {
+	unsigned int offset;
+	unsigned int mask;
+};
+
+static const struct imx8mp_reset_map reset_map[] = {
+	[IMX8MP_AUDIOMIX_EARC_RESET] = {
+		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
+		.mask	= IMX8MP_AUDIOMIX_EARC_RESET_MASK,
+	},
+	[IMX8MP_AUDIOMIX_EARC_PHY_RESET] = {
+		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
+		.mask	= IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
+	},
+};
 
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
@@ -30,13 +49,15 @@ static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
 	void __iomem *reg_addr = priv->base;
-	unsigned int mask, reg;
+	unsigned int mask, offset, reg;
 	unsigned long flags;
 
-	mask = BIT(id);
+	mask = reset_map[id].mask;
+	offset = reset_map[id].offset;
+
 	spin_lock_irqsave(&priv->lock, flags);
-	reg = readl(reg_addr + IMX8MP_AUDIOMIX_EARC_RESET_OFFSET);
-	writel(reg & ~mask, reg_addr + IMX8MP_AUDIOMIX_EARC_RESET_OFFSET);
+	reg = readl(reg_addr + offset);
+	writel(reg & ~mask, reg_addr + offset);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
@@ -47,13 +68,15 @@ static int imx8mp_audiomix_reset_deassert(struct reset_controller_dev *rcdev,
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
 	void __iomem *reg_addr = priv->base;
-	unsigned int mask, reg;
+	unsigned int mask, offset, reg;
 	unsigned long flags;
 
-	mask = BIT(id);
+	mask = reset_map[id].mask;
+	offset = reset_map[id].offset;
+
 	spin_lock_irqsave(&priv->lock, flags);
-	reg = readl(reg_addr + IMX8MP_AUDIOMIX_EARC_RESET_OFFSET);
-	writel(reg | mask, reg_addr + IMX8MP_AUDIOMIX_EARC_RESET_OFFSET);
+	reg = readl(reg_addr + offset);
+	writel(reg | mask, reg_addr + offset);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
@@ -78,7 +101,7 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 	spin_lock_init(&priv->lock);
 
 	priv->rcdev.owner     = THIS_MODULE;
-	priv->rcdev.nr_resets = fls(IMX8MP_AUDIOMIX_EARC_RESET_MASK);
+	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
 	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
 	priv->rcdev.of_node   = dev->parent->of_node;
 	priv->rcdev.dev	      = dev;
-- 
2.43.0

