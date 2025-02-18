Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC0822FE19;
	Tue, 18 Feb 2025 08:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739869086; cv=fail; b=lP9s2eDHbku+Nkw7bT0yR43BdBLyOJdtMN7QJiatIZq3aqiP3Ga9gxU3aH7F7DBeWgj/sz+eOto7viycWHC78O9VacqBZRXAUKOgSPqgHeSh++7YQTyf5yw0MtFDtYJEMfsTUp9qr/erW6YmeLAaR+BmplLqrhJOF98KgHuDH1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739869086; c=relaxed/simple;
	bh=IIhoINaHdbmXzJOzwnW6npY/qO04kVEIvadRu4WY0ag=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XrKwGRs6/IHecc1abLRhf/mP0NWJAita9Bd+O6NVBL3Vx5yBrO6b8tIqixooQxrt7lmtCp1YPKerUeUBKt4aluxl4kmZ9bw6MuzbaBZHxow5jrZnzYw+gd33Txn8zGufsin2rBNfdBic/26KI8ZTXGN+9VejPTGDMB9kgXrOcko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fjcMvZYx; arc=fail smtp.client-ip=40.107.21.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fjcMvZYx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eHelgkp+tlAnJkZLTbFfilJbDnCCnOG5QTycJYF9tSon9+3IGEwlc+ByZwvEtbtYR9kP8mnKObtI0huUyjwLD1kaKib4IwIF/JlylCNM/vJ7YU61bUsePa/GYDxGQCDgp30p6+34oO7ATa6brV+b+y7uzcvUIbd86jCScUoB8hOHF5Rjb8Z4DTxwwETR+cdHu2aBAyA8u6AKSa5+Ob8ts/w+bR6ZKwJV/MH3kmQS8lOPoe2hTitLGg7bspp7cNZQwkfhNr3F2S4+adIlVq18+FSEQ5qK08zWyfFVNbqHXmCQ44Oq9gMgaWa11ngk0+aiVhJzaNDHyQ8vQJ7UgBfPNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOHt3iDB89h6JJKR5Dz0sefDRH/Dw83Al5OyEdeUXNA=;
 b=WZ3f0pXmd5x/SBKCGdjPoGKkEuUnKCfIwTNxl2gMaSXJVoeNn6slD05wpyCDukpxHZQt8I+ZRiOJOVdv7E0dS4qguo7wSIGlfAN10VrQISB4kuxVn7G1si2BfFnlCIa04b1ScdUBr4mZvj/le3VNIfVIlf9Afx8I/EQV/1425Cw2EDWZ+7NiaOk5rQLa3l2Ag4MdIe/eQOsHw3p+YtAKyO9rmVir7+pfhBRb4uUFBMurPK8w9eISFw5dB3/+tX88LqaGT/ya5VUjKFW/GIYhcAkC16/8MXpMzN1qqg+05Wo/6ao7VMv+0fXxe/PjdNSUGn6wxH/75fyCPWMLkJAsHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOHt3iDB89h6JJKR5Dz0sefDRH/Dw83Al5OyEdeUXNA=;
 b=fjcMvZYxm1LgLdZ5yD4gYNbDKFV4CB1AnGV/OTSraZFeX1Tvy87tvvHRXcsdIyCDEYDVghdDzPR320FeUv2AGNaUt+KeKMnub4kuhS1Ydc3tDHEhgiBCjb6B8GkWK9d30SnWE3t4xXEOzOAa33fprprhM6Kiq+wESntwOBobE4fwK43XfsGgClOM0Uda7d6JyG1HWgf5rw56neCTChMDkiscGEHaNeh+2INVarzjBpSJKT/v+s29nND2NWMH8/3kf+o3jnDyay5Erx1nODxN0hO+Mkk962AeDcfGeAqlU0z6pJw/grczZsBz1k24LjfwHeuAR7+R1vD4ZPRNRnhKiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS5PR04MB10057.eurprd04.prod.outlook.com (2603:10a6:20b:67d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 08:58:00 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 08:58:00 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: p.zabel@pengutronix.de,
	shawnguo@kernel.org,
	mathieu.poirier@linaro.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andersson@kernel.org,
	linux-remoteproc@vger.kernel.org,
	iuliana.prodan@nxp.com,
	laurentiu.mihalcea@nxp.com,
	shengjiu.wang@nxp.com,
	Frank.Li@nxp.com,
	krzk@kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH 3/5] reset: imx8mp-audiomix: Introduce active_low configuration option
Date: Tue, 18 Feb 2025 10:57:10 +0200
Message-Id: <20250218085712.66690-4-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250218085712.66690-1-daniel.baluta@nxp.com>
References: <20250218085712.66690-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0286.eurprd07.prod.outlook.com
 (2603:10a6:800:130::14) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AS5PR04MB10057:EE_
X-MS-Office365-Filtering-Correlation-Id: eb45b44a-f089-4425-93ed-08dd4ffa583f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pue/rGRpdNie1V1uhxflLYR44lH2+rAQwPVNc+l80DlIaforsCK9k7U9CM74?=
 =?us-ascii?Q?kN7Tyu+QKJ+JDKpwcuvtMMbaRbECmG3InXFxul7G7FvcnUaD0amnippSwoek?=
 =?us-ascii?Q?h9Ycpj9oRxeVSw2LDF4PomL6PRlOo2QmPTy2rAEm7bC5xWoU3Am+p8bfefBm?=
 =?us-ascii?Q?QYiwyqSiBGd4J3v4H02pHCJmWPZadCO9UYe9N6OX2AjeDK6QfFkOCXGRXUVM?=
 =?us-ascii?Q?P8GfZf67t8oKK81cbmLn/46ciDL+900Kp49aUn+AMPF0Nl7qnIvALF2hTl42?=
 =?us-ascii?Q?H1R7dlDx5Zil9585pP0n/DtzEIamS4jAkXksrTQn5srhr1Ez+pO1KIl5aC8L?=
 =?us-ascii?Q?B4cqYX1+y9ugAxEBDWhwBp6+PbJ1XfIJP7ntyOdGwVt4ge2ieZZjs80uAVbN?=
 =?us-ascii?Q?/G6yhQCiLlTsRV8ZO9BQflj18xqZ2rxBLr/3JShyiDnEvDKqNKDvkB/iYy53?=
 =?us-ascii?Q?gF0N0FMRA1HqBKFhfTCtg+/GXjCO+rk4AswYVwHSxG+y0ly0V5wFOlOu7y4y?=
 =?us-ascii?Q?+A9tVU+sP/KyKkTt96j5/XjqK0gxNLeSHFsQ9txe+F5IgJ6if49Djs4L2vYY?=
 =?us-ascii?Q?FIHx4Zmyfob+SnhDAU0JrBpaYsFpgy6vkshyiaFpusJJGxNcOb7IUZQpuKw1?=
 =?us-ascii?Q?w4jRDJ7yH+9wlvorDfC+PEUvcZMYQ/BLmHAkG5n2JZumk98+cQGd9q4F7sWZ?=
 =?us-ascii?Q?bvKxJ9geCitukPtdZInZbvS/sGMqyYbwhOFozS5C/yNB5PrJ03RpcatjPocU?=
 =?us-ascii?Q?Qsjs0u2Si22YqnD7YclOXn7xYFnQx4IG5BT5F/F1ZDDwQmbao0ao1Kl6MgGI?=
 =?us-ascii?Q?WMCSvStcHNA5sn81s/o83HZupDSTHb3u3rgLBrNp07DPrvYtpyudNvLMVsXL?=
 =?us-ascii?Q?8VF0JOJhKCbC/p1mqFW/eqQezCBMnhW5GMVy2/uQW5MC1yF5+O49hwEyYRft?=
 =?us-ascii?Q?8N6yt0AnWM0LhjrZ0DR6h0FJ34Wfdd73I8uqKDrQnn+5Y2yDcsF/Ld37NdUy?=
 =?us-ascii?Q?gYdBVoDxlhVOm3ahkIVcAWkGgUAjmp33OAx/mJssd723xQHf5bZGepmhyhz3?=
 =?us-ascii?Q?9WJA53XFzxXN9RKiRS23X8qKIfl+Xiy3L0U7tObdodIgM+x8rmzSrm0hspXR?=
 =?us-ascii?Q?hFAGMvDrMSPTk0lWRs3/iGhHXYEtAf2xI8Zm5LNT6qeaEOg8yIKE5yxONHmM?=
 =?us-ascii?Q?TxPTWB+W6voYScLfoZsqXQuLm44Z1QQFhweBtWWojaFWIOhzjdFJ5G6VGNfi?=
 =?us-ascii?Q?0k9q1BcYEkt6fnXQhkpUTrIVK3511LlCFwklo2GEzEYbijdcnXrT8cbbq+NN?=
 =?us-ascii?Q?QkqURmU4yaykGb1X/6c/pC43cL9u6a/amVojHF0AN7V8Pr155vquhrm5zHG8?=
 =?us-ascii?Q?WzIXoJYu/bcDG5gn56+UaPtEtoue?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3J2z2drm3SBDJfu2uuKwI0TsorJMH0X6epPCxG1CAh5nlTijwna+0My1y+c5?=
 =?us-ascii?Q?Lwwhe1bA+Q1MpBUREE+bJrNMuo91ZMJD6Pylf5wUBQMRn3/7dllmF4HACwxH?=
 =?us-ascii?Q?KgLj9+nytwQrpsoBLuNQEjXI/XkD3ELTkF/Lr94T+sUZoXQ08AozK3W2JGP1?=
 =?us-ascii?Q?uaVHupJEYYJZJaRK+en257EplZ18PO/MT1EmkDQAz5fkNWmON4tKKHEWiS72?=
 =?us-ascii?Q?4o/pqi+AuNKlEiZBYaZgMxq/LT1BGYWzK0vFipkdwysRCvLnQcgdo7/mkHUA?=
 =?us-ascii?Q?ru2h5QwUgM8cbCTVZNuNWGwBpbH8tZMNE2cK40IyVYx2bZ32TQZecidRM844?=
 =?us-ascii?Q?aYPZoZMkaNyobJNKas7X9ehfPSQwwp6+NBHVNaJS9DoognDNrv/ewi4LEqU/?=
 =?us-ascii?Q?YFjnDnQvzynQkmAXa/H+U+TUIFwgxJUpdJNiamsc2YOWghcAKaPyvXmqlbK8?=
 =?us-ascii?Q?D+aUMT4EXKFQllh2keWNVktpB60rGkp9gxwm10kwQcsPI0Rzsm2ZrEgeu4JU?=
 =?us-ascii?Q?YLn6lhXYiduLXV1cIripyHdlVFfDvBtjsJv0ETndVjXFXIfX3LZ66jJk5MF7?=
 =?us-ascii?Q?UsBygVy7xjRdHpQQi0n7mWXqSKo8UfdDixSFg87QPRh4gB32/qjQKSd7+xj5?=
 =?us-ascii?Q?LEbIL5X+6gbwHxsgI14Oy4Ij/ytBmwTLF4v4m3y+7VCubhqlKTgGEiaMlgMV?=
 =?us-ascii?Q?nY44Jqf2cgnNYqX3OCMp7C9pATDfrnzj0Wer0oV701CDx/gK3OzkrlG2piGZ?=
 =?us-ascii?Q?WR0IJVIn17MvkkDxpElo4CQp6lGXB/3FDaMmdQHZ5FaTHUvHaLwPzwkuOH63?=
 =?us-ascii?Q?gLeWdLjzDsc6Q5KYpWlDCFAa0zQKHIXaesWvPyLfpvFRgq7uhyAVj4Ibzjh2?=
 =?us-ascii?Q?fWjUqbs8OtoFLo1NxkCiP0+ifZAALwHA6tad8d3RnYVdMP4U9Nm7hWJ/r3q4?=
 =?us-ascii?Q?Nh6/VMe9F+uROlCVNgVjjKz9gp10oc8Dc8EedUOvV1P05QPJbAdW+xCluB2o?=
 =?us-ascii?Q?Xz5+tTw0zXP4JmwjldKWsz1Ptx93ONV5YFLeJy4mHwJnDy6Tfl3WzkeNn2zk?=
 =?us-ascii?Q?hjR6adhm0BZWMbtBo299w+zMhNiK8gn3IfjHZt4c4g6z42mPrRmwUeU+hR6g?=
 =?us-ascii?Q?n3o7rpK2O4OGlhPy5UITBMsVSivPAoHD0oIry9zcheDh3erV/wsmARgNREGy?=
 =?us-ascii?Q?H6Cv+rLaOzGQ8+frZZX/TnNn1bUqjTQ7XSeRO08BxEQD6AYeksqCn/Stv0Ei?=
 =?us-ascii?Q?9jr5lJNPRNoopdL99p0M3/v9ndiREuAxepzNEockr9aPsJ3eC/w6tBteXQPp?=
 =?us-ascii?Q?05W3jGjmPSZQxIw8HKrbbowCjmqSqMXsIaIWgS05Q+QTqh8b1/7ck7pL9t9p?=
 =?us-ascii?Q?TKRZOn0IRme4ip/ERkWbQQHIXTYCnA5LOOXMFf81bAWQii+HGGs4/sNaTctT?=
 =?us-ascii?Q?xmaPayH2bJcoHsnsPRiwFf15arnSQZQsZ4wJIXHDVhEagBFeo5c4kQgtYkFW?=
 =?us-ascii?Q?tNlD08jxRPLxGIwTOgHEJCiaT3WuogBOkPfXBmkR7ZRP26MCaBsQ2nSl195Z?=
 =?us-ascii?Q?7AxVXl/qqzmU2fTQo17SsxgIicvY4hU4jNB/a4HFtj/b/B56E4T1qWKjKGSt?=
 =?us-ascii?Q?D/TFFH9AufrOzBWWjyrkovfhGIBE0ACYaKlq/D1gjlXQv7KRTg1m6mxJSYBD?=
 =?us-ascii?Q?3sLLug=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb45b44a-f089-4425-93ed-08dd4ffa583f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 08:57:59.9514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yw9R8qJN0s7D1oSrxG1bxF6bKvj+JirCf4oJsM86CYAIduqANCaMyiSAPF9QyFkU8ns3lXJuRVnLC2Ad7ISXcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10057

For EARC and EARC PHY the reset happens when clearing the reset bits.
Refactor assert/deassert function in order to take into account
the active_low configuratin option.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 45 ++++++++++++++-------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 6b1666c4e069..8cc0a6b58cbc 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -23,16 +23,19 @@
 struct imx8mp_reset_map {
 	unsigned int offset;
 	unsigned int mask;
+	bool active_low;
 };
 
 static const struct imx8mp_reset_map reset_map[IMX8MP_AUDIOMIX_RESET_NUM] = {
 	[IMX8MP_AUDIOMIX_EARC] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_OFFSET,
 		.mask	= IMX8MP_AUDIOMIX_EARC_RESET_MASK,
+		.active_low = true,
 	},
 	[IMX8MP_AUDIOMIX_EARC_PHY] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_OFFSET,
 		.mask	= IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
+		.active_low = true,
 	},
 
 };
@@ -48,48 +51,46 @@ static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_contr
 	return container_of(rcdev, struct imx8mp_audiomix_reset, rcdev);
 }
 
-static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
-					unsigned long id)
+static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
+				  unsigned long id, bool assert)
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
 	void __iomem *reg_addr = priv->base;
-	unsigned int mask, offset, reg;
-	unsigned long flags;
+	unsigned int mask, offset, active_low;
+	unsigned long reg, flags;
 
 	if (id >=  IMX8MP_AUDIOMIX_RESET_NUM)
 		return -EINVAL;
 
 	mask = reset_map[id].mask;
 	offset = reset_map[id].offset;
+	active_low = reset_map[id].active_low;
 
 	spin_lock_irqsave(&priv->lock, flags);
+
 	reg = readl(reg_addr + offset);
-	writel(reg & ~mask, reg_addr + offset);
+	if (active_low ^ assert)
+		reg |= mask;
+	else
+		reg &= ~mask;
+	writel(reg, reg_addr + offset);
+
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
 }
 
+
+static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
+					unsigned long id)
+{
+	return imx8mp_audiomix_update(rcdev, id, true);
+}
+
 static int imx8mp_audiomix_reset_deassert(struct reset_controller_dev *rcdev,
 					  unsigned long id)
 {
-	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
-	void __iomem *reg_addr = priv->base;
-	unsigned int mask, offset, reg;
-	unsigned long flags;
-
-	if (id >=  IMX8MP_AUDIOMIX_RESET_NUM)
-		return -EINVAL;
-
-	mask = reset_map[id].mask;
-	offset = reset_map[id].offset;
-
-	spin_lock_irqsave(&priv->lock, flags);
-	reg = readl(reg_addr + offset);
-	writel(reg | mask, reg_addr + offset);
-	spin_unlock_irqrestore(&priv->lock, flags);
-
-	return 0;
+	return imx8mp_audiomix_update(rcdev, id, false);
 }
 
 static const struct reset_control_ops imx8mp_audiomix_reset_ops = {
-- 
2.25.1

