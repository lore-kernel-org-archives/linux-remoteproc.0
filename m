Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3E722D4FE;
	Tue, 11 Mar 2025 08:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741683428; cv=fail; b=rKvQNVFOzQrkdzpp5ZKq1rLdMya0Ck59i2Rcp5CSMhO4ZULHyo6gpN4pNytwRgcHCGY3+yqxhklyn08Mz6nq9THjNzX4/EGgwsAI8CJ0ecK2ZVUmS2bFqJOXHOc1ErTltTI608IBIBbSJj2nvFrkGXztzLVKeUihH4OoW2U1FIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741683428; c=relaxed/simple;
	bh=259dYXLm+MObzu7jGv5+ZR/+ZkrwuIkrsl3svr443uM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gAPyI8+anU6Dun0YL1nROILS3XxXP+dBJkxQRoWvkLJV0Oh84scpk3oYzzwjEkGf3S7nXNF6pWNrDJknliYQZivFB+P6DDmVkYioNHDKA8TP+sFar9JReQyj+f0kb0LzDfPmIKMpRYgPQGHeHoSiWKTrr2Iy4N22a99o2oQtDNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=S4StQ1RL; arc=fail smtp.client-ip=40.107.20.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="S4StQ1RL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSSZZfr8vcyVCw2Fqjjnr+42OPwp6dYJFlJJVA/lLaMakDYTCjBpw7fZdEc/fAQRu4C5Zxv6enIiy5NroNzEcGsUCKLps2ZTDiXkWXS8crCvl4ZRtAcfjuVHBK0xZdTWwIIcxC+CtCIACzHLOAtTKceHCn16esJzEf+v+tqg20XpAWUCGGSSplZxS9iVPvGlPBBOTUgURFn4aCojvoeFR8CWeEQ9Flj7eCJOagHigscJF5UzjljHP6bardvBYrnTTu3SaPT06zs7dNnRY/E0JZK1mLxPM+QKkdbha4S3iuLJgExsJ9QviDyl2zlxQVCJwgzlflrjD6+PRT4y7XbQig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1UCzXUHSgWcfQB2vGcwiagSt5MUWom2vNc5p8g8uLU=;
 b=v+U1/zw/5v1WCd3D6ixA0h8ZoeVQWI9v+YENhvKG/e1RjSRG5A7AOg+3MF+KWMShTZ0iwdiu+QhcFCSCQxnFRpg7EHpDPuXSXFP3x5P93uImakBKP3pADrkeaMC+sucQV9IYOu2do/6aZn2Ri9DdlSfH3WZFzxAwfvCYjrXzkGwC5TaKDaamYPfvTmnCGc+qGQZwq81cIXFNyoA/+0BiFIjuPWTjyyeoiubWLyWGNb8ZRDpzqSoq36nmhcdZZ4wXhBgvPa/9Plo1/1Kb7e6Ar4+vSZYjxivaZn72+YLSdlLYvsp1wUNACeE5qM5qDJa1OVODQJ3pg2Tn3+SIGIfi8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1UCzXUHSgWcfQB2vGcwiagSt5MUWom2vNc5p8g8uLU=;
 b=S4StQ1RLW+DWnxI3sZitC7N/BmEYtmZlMjhkRBKsdbEwIwvezqr1fgwdfeu+JyZZdJhhspNkR5HQv2zXQZFQEKgSp0k75F6aSrhG6jB+csydCGqIfT6DUME8ICYZ5y2pDh+4omDCPgqmhY8MTwQfLZT7i+/k9/lVeedhSTJu7twUgx5PxNZa/FeUiVe9r5DRRDf1PDC3gDL+oExZHsNTtoZmWpuLNiS0TltqwLD4usJ9ljkYgdOJgu5bwbgJoigF453IW6UrBFzJiE1SfJgdDQUKPI3qn9KmhAmSaPLGtcP5tkpCdkXqPpKk1ApzF4WdyOHjiR5BalO+clF1EaxJ1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DBAPR04MB7431.eurprd04.prod.outlook.com (2603:10a6:10:1a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 08:56:59 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 08:56:59 +0000
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
Subject: [PATCH v5 4/8] reset: imx8mp-audiomix: Add prefix for internal macro
Date: Tue, 11 Mar 2025 10:58:07 +0200
Message-ID: <20250311085812.1296243-5-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250311085812.1296243-1-daniel.baluta@nxp.com>
References: <20250311085812.1296243-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P195CA0009.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::14) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DBAPR04MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: ea565c49-4df9-40ca-19fa-08dd607aaea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pvx+LW60MqI696d+pKxk9vub9nIQTBZv2hYSQPiQluf2ctH2HKdPqIyHWtm0?=
 =?us-ascii?Q?wMiKlcMKJqLYjgoAO0PYhs7cqJkUv6SQq8yLydQMqqPfV5YS6v5UWLYZenR6?=
 =?us-ascii?Q?mfSLc0Ye1aj20AgxLQsTK8FcR/Pbrsxhu5kVssw8EM5JkgpqD3sAcm8pmG59?=
 =?us-ascii?Q?1notD6gGGHhdxcYswqZRRwVdiUEVu/5giMFAXvlSFLch6sROAF8+PvPLXq2Y?=
 =?us-ascii?Q?mB6UqzX0x4dWDZamyBKyg3cIC6tmZ2kIkEpnA9SsVQoAv5pf2XIckcHMYOsi?=
 =?us-ascii?Q?rjCzFRn9haZHTAIaKQqqpSTNUNv9fA7bZS40vvs/6npW41V2P3Cb+fAQd4Ex?=
 =?us-ascii?Q?S4GzJ6mG+B+FwKZcaTL6OgmAw5YFewiYV1fwTtvmDFEL8rfCeGCReqD77gEW?=
 =?us-ascii?Q?cgJCb73eURtz+lGRoFaHdS9aWJOjeKu+yc0EW7Pu5fg9A1bd8GH21x3YockB?=
 =?us-ascii?Q?2xQ51F8kIVxdwfjOUnE9mLNld44gNd+fCNghpuzqEXfbL3N6x/wyKfceXNZq?=
 =?us-ascii?Q?8YjM+7OxMNE0OCJEdDoRW11sHsbTqN6ubuPRTVB5BehNt+psFNk2j/lMzVba?=
 =?us-ascii?Q?NDZm3e5gXJgvTidecgMgO80MEGe7K5PX1F5m+c7Gy/q1sRi9rkeuCi5yU1Oe?=
 =?us-ascii?Q?kNKIk3gYVWcDu0F37xzM75Jvcl4xyObK2SxhSWTTRGb2/Sg4la7sV4EefJdT?=
 =?us-ascii?Q?SLU9P525CDSg0aSiHv62HbOg10Afj8+8QvsdBmSKWQ2Rbl6FLMmXkMuwf3Y5?=
 =?us-ascii?Q?BygFHPENUd4d45IMeVaaEm0Eb79KHk0PlYKFFmKcUGk+JvaqVxT24SWu0bJT?=
 =?us-ascii?Q?3uEub5vbQTn+GIxrQ4yZq0LXolvmVwPNHzAMuRRPXbWpOR8mDQs+5l/HVVA/?=
 =?us-ascii?Q?G8OtgXRTM8wRP4le6PFmcTPu4TNDOM1eg6pL3A30u5KyNszhZRoNoCkhWUjX?=
 =?us-ascii?Q?xDG2cIZ5iCmnceOVtrJ58Jyg8l/ZriNvaVy23+5lCKOevvvGh6GXaMavxdKg?=
 =?us-ascii?Q?BGehjgdQhHytSBq8alw7/4b99cEMpWQcAKhfu0Ns4z3bore/8jjkZqT3mkGF?=
 =?us-ascii?Q?CId+YZrBgUN/EE4s7RehInfQmyuOfmdkl/w92QS0MQGH+52jA1HWzfywwFIk?=
 =?us-ascii?Q?zaIvaSQKnp6IUp8kZNKbOtZgd5faSY7/Yh+tIt0CoK3hQ1v+Cqc9DxAj/UiI?=
 =?us-ascii?Q?36lIlK9VlRGSbhG1rFWzDIP7bc9YziG7URnRLV77iIuz6niCMq7yyv2KsG5t?=
 =?us-ascii?Q?nsxnoJGm5/WivbKVZxAbo9wLh56X580TsblDLknIJpL34j3Np/jDrdIALz3h?=
 =?us-ascii?Q?usix1EalUl+eO/9eMq9sjYJlpBBJFHcfBXuOPb+g0YID7EztScGupkfeu/Zf?=
 =?us-ascii?Q?VweLSmkZdvds7r/FFLhXJA35Dx1qvEJOmL50SiYplOd9adGDxzmGfvzw2dK2?=
 =?us-ascii?Q?uyByS6kC/vS8/60Qi2EsXf3zjFX0mBL2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ia1E2eKjQ3nB8a6Z3pJNHZDBaYaJCFnU6EQBUrevOZo5z4n8LPqiYYqGuVDY?=
 =?us-ascii?Q?mo3essXmFJXD+0TmazMt+bsZmyx6fv1998IT6uy4oCazSWwTn4VhmWh/I4wH?=
 =?us-ascii?Q?36R9hjUtzHEnlc+QklwLwhmoH5eeN0M+AfHav1tfTYTyZ2iXg022GuZx2wRI?=
 =?us-ascii?Q?bKfjtTvDdQKuJt1yZ7Gje2qldiRf6hq19DihaFM2s06PqR4BTSqqoSNZqT0E?=
 =?us-ascii?Q?CohmU0jT8IsPvMsksCjt0PGVG/EIcVljyvsZcmTUqApJkPrHUQt2DZpCtu5g?=
 =?us-ascii?Q?HBO7BP662+CPASN8G6PfcHuWBQ5tlp8Mq0L3Zj7P9Ygjp5skUPYX3N0xwh9w?=
 =?us-ascii?Q?u+ZHpl3si7TTsyiXkrkHolPu5MJBvCDq1WJoaaM9ryp6F8yfCDY8J5iq7AMZ?=
 =?us-ascii?Q?df4gNojVWLToCb2qPslZnGEoMW/mll7Coux81qH+rcszSsHsHLlJYG95fa8D?=
 =?us-ascii?Q?nQ3y4CFhAuca5aV/UBFzCeakfBgdH7CVSd8hYBEqJtNCz+45y8FhkmDNNCiT?=
 =?us-ascii?Q?lZ3ZRMdkWWFrWxeOZyLkdcF55Cmk0Yp+pM0oLAPOc5yNuhHP7PDCIPFalZp3?=
 =?us-ascii?Q?ZrD9No7l17MPhPwsMcIKDlGoWmeFX+rKxjg893X7r1yIYvwOWogsMHce3hiP?=
 =?us-ascii?Q?5VSpSd8G7dXEcx7kM8z+oaPqITbarjYqOXRKq4Vf7RtLuK2hM0iBSXcLJzLU?=
 =?us-ascii?Q?iCKooCGMuORjYFiTQ+25nIqex1xfRup0JAoqmrrdXp+oE9wIf3+IwHcusnj2?=
 =?us-ascii?Q?gsHtMxrVc+yGTTkANAmxVljCOuEBTmKLDbkz803ByB/oifQTw7+2X404/6ms?=
 =?us-ascii?Q?1gYqFtjQWMmysrcTHCO3QnwN+ICdqagneYqF8+hAZMlGsPPK1buzCws+xEUT?=
 =?us-ascii?Q?Apxd6c6UE82US8+DbQlU5/TNRRi8Khyy9E0ReeJJgqylc0EZp9L2F+QxzNAM?=
 =?us-ascii?Q?Fud/13UH7D3a15koadS3TRnhaFWnPMKbEAeZK1hWrTzIgQWMhJF1HjGX2won?=
 =?us-ascii?Q?bMaeGcieXP48E0ofm+ofiQagidluCLADw/N9Rkn2oXJB2QDksWtRjuGEuDvu?=
 =?us-ascii?Q?ml8ul9xHJiDf1RnjveVblJFLnOHF8N3+AhHbLYJDX58j4nfgz6xyAnpn/WWu?=
 =?us-ascii?Q?k6eX5c4fF/nCnVFzwaxhdUL57xOhWJBbsZYXKZvchK3v+XaZQVYgMkSyCkra?=
 =?us-ascii?Q?Az+YGuwpwNJGhmzstbbUTMv1Esh/NkKv2SmEr3yZD9/H5NLVUlTGGieI5+8s?=
 =?us-ascii?Q?thRvChuXFzDktsnaCJJ18f4apMhEpaBGbRRQTTG5He/VLXfvcJknUsjEQXAr?=
 =?us-ascii?Q?lGQg55GLhQAiJ6f+hb3o1zXogrLEYdmCwYJYndSPsRmfDNF8g50V3/66Tk78?=
 =?us-ascii?Q?Z2sP7Ww1BvTNMkOP9qYVW0cWHIi4qMr/+W4anRoY7nnlEKHkg1P2QHMPqQ87?=
 =?us-ascii?Q?KGKYABydNrENwMXtE1E2ySNfN2hGCYJRvxJ9kTwpnaJoaNbmUfT+FIARTVqP?=
 =?us-ascii?Q?+5ZAODfdjBzUpU7UY0NerDJAamDVJ7ilyt3aYSTNlJWYCgFPYyprg6ijUe/t?=
 =?us-ascii?Q?Zp1+STtzlqhoGG3lIavtZloqWCVXXkgSl6y61XFY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea565c49-4df9-40ca-19fa-08dd607aaea5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 08:56:59.6290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ss4rDPfZyIsQdkMLZ7QG65AXLbdQdaFEMMZQMvWXtcPossmij7ZPn/VyICAfroupkC7nm3GJ904nvHP8qv4gaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7431

This adds IMX8MP_AUDIOMIX_ prefix to internal macros in order to show
that specific macros are related to audiomix.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 6e3f3069f727..c2c3e8113182 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -11,8 +11,8 @@
 #include <linux/of_address.h>
 #include <linux/reset-controller.h>
 
-#define EARC			0x200
-#define EARC_RESET_MASK		0x3
+#define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
+#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		0x3
 
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
@@ -35,8 +35,8 @@ static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
 
 	mask = BIT(id);
 	spin_lock_irqsave(&priv->lock, flags);
-	reg = readl(reg_addr + EARC);
-	writel(reg & ~mask, reg_addr + EARC);
+	reg = readl(reg_addr + IMX8MP_AUDIOMIX_EARC_RESET_OFFSET);
+	writel(reg & ~mask, reg_addr + IMX8MP_AUDIOMIX_EARC_RESET_OFFSET);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
@@ -52,8 +52,8 @@ static int imx8mp_audiomix_reset_deassert(struct reset_controller_dev *rcdev,
 
 	mask = BIT(id);
 	spin_lock_irqsave(&priv->lock, flags);
-	reg = readl(reg_addr + EARC);
-	writel(reg | mask, reg_addr + EARC);
+	reg = readl(reg_addr + IMX8MP_AUDIOMIX_EARC_RESET_OFFSET);
+	writel(reg | mask, reg_addr + IMX8MP_AUDIOMIX_EARC_RESET_OFFSET);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
@@ -78,7 +78,7 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 	spin_lock_init(&priv->lock);
 
 	priv->rcdev.owner     = THIS_MODULE;
-	priv->rcdev.nr_resets = fls(EARC_RESET_MASK);
+	priv->rcdev.nr_resets = fls(IMX8MP_AUDIOMIX_EARC_RESET_MASK);
 	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
 	priv->rcdev.of_node   = dev->parent->of_node;
 	priv->rcdev.dev	      = dev;
-- 
2.43.0

