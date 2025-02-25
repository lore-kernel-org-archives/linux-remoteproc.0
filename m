Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013004.outbound.protection.outlook.com [40.107.162.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06231267AE5;
	Tue, 25 Feb 2025 10:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740478769; cv=fail; b=H26HsgH3D3RVpkmUc6cKuTL9J1HFVc11gJE5qnJL3wqOMrq19vFxetZI+OzImpCQGGvruKI59Xp4y4FJROuUQXV01Dj7QnIebn7KYVFvhUTQ+/PZQ+em7xQFX8w71C7AS3qT9ohXmWVuYWR9521cI8CoqJVDEILTJKl67jrf0xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740478769; c=relaxed/simple;
	bh=d3SqRCa5vdnMkPkAiCbizMEXD/IfyvNr/228oEYzvPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RwJytcPz0WvcwPdn/D69tvE4lahOa1mnXIeq7YNdStLH0WcVRCVJW3CZgY7gtxivF4+RvwcKWvVYGe32knPU1NoY/61PENKzylw8eubbpsrAZA6/54jVutg16+kLMX/GyHRWla3vo5Nee3QEgo+RSdzy1KRpZLssRgf2AdMxBHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WgATtwM2; arc=fail smtp.client-ip=40.107.162.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WgATtwM2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tu8OwbHPyDltyBmIV6aFdiHmd4UlJ4MpE/4njyWHl0V6POroHgHn8r4tXT3npQjaVg/QVfISBS+zsPXnCNHwrJ0c3h72S8Fnq78usbaPVKX/5G+kQ2adtEd/ABma32KnSsp0TUmYWbEUEG1uBRY169K4ai7dNF+8RqFw6yrjwFAtajf0DcLWU8CRI/RqKKPW7Eo3k14/mLp2xZ7toI46wu0xfz+8w/M+Arsqmkjjszbm4PULpRl6em2EF7g8KhU/vtAg32qlHzkCZG0fb9RsZjmVzpPyqPYUpJyDHQ8GxABkEDcHfStVip3duemddymd5/9YsrL6SAYQ2CXKuYSwAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZS1bJZ7ztJXE7TVXIaNxGeTzXo9+XmDFx7noMbbauM=;
 b=kIIZp64wHmjeRP39JN7/aFjpkmqTgvlViBJeXrUu22j+5mpt6+7R6X1KUEcHa9+fNTUQVaiaofbwYu2d7vd1H02nYbh9LEaOCchKuJdkxsWYPDtdAlpPkRrXny3cQIrWe8K7okykjhBCBk+HVpUNwrulersL69irfRHf73I7M1Gr8QT36mvohBkpqI6K5Bl1hd4Zq+9cSFY0yGpmVpebm78JLhl+M0jgaqijyiqLO2ptZ8Ac70dz7p9eG6AypYrkHcofr0d7koSFHZ+hCZgdJ4zOIC7aTX+QmDsuQHO05VYCJA2CJHBTIG3WOlSGpMrn0tTcspiD8jQ1Xaq3h9TOjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZS1bJZ7ztJXE7TVXIaNxGeTzXo9+XmDFx7noMbbauM=;
 b=WgATtwM2CRm6zAdaCpvt107vqGhvz6e09Z3XURVgpLjohGH1JnNyFE5yLz5UysxvbtiW43Xj4CDeTrT0QrWbXTJzUiGAtzzo4yMTABnoYbAHFsIvVeUYd309KgLvMy9AANS+U7sS/R/s2tXhaSLaDlJJxyja/YK6f2XFKUkdX88aTPda5+M6iRSy0rII50h8Me7UU+FL4zhXYgeo9b65ky/MOKsFItEGlg7DtPt+A3Do/2dOqUYf8tSkKRjn3FDSyjmgyQfoyLO+oWMtepE4a+gE1hkdDxfol5+FpTCVffKzSAHEdwrciRUrZI55TTkDoD/49QgD4nbg4oi9bKqhdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS1PR04MB9504.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 10:19:25 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 10:19:25 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	shawnguo@kernel.org,
	mathieu.poirier@linaro.org
Cc: conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	andersson@kernel.org,
	Frank.Li@nxp.com,
	peng.fan@nxp.com,
	laurentiu.mihalcea@nxp.com,
	iuliana.prodan@nxp.com,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 4/8] reset: imx8mp-audiomix: Add prefix for internal macro
Date: Tue, 25 Feb 2025 12:20:01 +0200
Message-ID: <20250225102005.408773-5-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225102005.408773-1-daniel.baluta@nxp.com>
References: <20250225102005.408773-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::13) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AS1PR04MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b4ccf57-6f0f-4c29-1b4c-08dd5585e105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?99GYONf/VCAw9xCzl37I3j73dgdfnnVAlCVBXYLZuXi8Sf26eFytUFBluzQ2?=
 =?us-ascii?Q?xUGlhys6tZm18yybRmHDIztokPTEoCmfTl+n+UyTXvacujH3IgM4ujwYAdA0?=
 =?us-ascii?Q?XGG9aOmvCCF5EybItLxpiDCLtoUr03AduKoytJxRZnDSoHYCtdn64p6cwrCj?=
 =?us-ascii?Q?RIeRRaG05TWFLkxen2a9jOPN093CBnd61lwf7RbvaLbkeUz2CAEWQTRpegwd?=
 =?us-ascii?Q?cMXiYKyuExxb7yhDiMqjBlVO1qLCUNpm85Ok5Fk0yWBsionEkKAHtJbnHPB0?=
 =?us-ascii?Q?gSCOYPF7bozy2pEDQqd9DIqaQw6ywJd31Lkbq8vfEkFxfvXQefut6+Yf1Vxx?=
 =?us-ascii?Q?zD3ClysIPEqhSFM49G8JvgZWCmsixvN/YXiY7bD8l9305+ORQ4dj1i6R0sjd?=
 =?us-ascii?Q?6vUht58qZ5LAyBUveksdZW8eOGXlpkVSq0y5HuhmO9LeZd8s5GKAJ24BJ6LK?=
 =?us-ascii?Q?JO6bTbAo4eaPwxR0PQkPNvBIOnD5j2lZMA2Ffy+UfrWov06cP8Av+9nSubqU?=
 =?us-ascii?Q?LeTldTDnuT+eJjt1V+5gObmrlHxAMg+WNEGLp+p3EEUl7QIJvF8NDS3rXjSA?=
 =?us-ascii?Q?YSq0V+neRR1VgFfXKuAGUPXa5ph013cEKu4WtliiN0OYIdqIFXARHux4ld4e?=
 =?us-ascii?Q?pBvGjSoLwmVJNDsph6PsSdgZwsvY/7pyyIA7GwFnOgnjZKIbnRs4yPjvF8Vc?=
 =?us-ascii?Q?91EPatXjIS1MohvJ4FMG4YpgCqFSLybcALHILjyKp748otu5iTYrj1AUCY2j?=
 =?us-ascii?Q?KA/jPyZBJVmjO/9n2G7yFI0spsQ9faKuyYBhqNiA3kPkTaZakLAWsoGMVdTG?=
 =?us-ascii?Q?t1PSo97TdmqKirzxrkXZ0KYbFt8tM5XSC+krXLO2NL/PZ9HrP5kA9NnqNLiG?=
 =?us-ascii?Q?V/WZOj6nqT1GVDCvIL+PKeuZmoCPpYVYAFY4jrmRAaxU/XrB05RDRf5b/f/l?=
 =?us-ascii?Q?50fA6CXQuJffUXMbQBsma/usLcmIEe3wWXu0qKSm5TKT4QVFaBYJe8qVkXq7?=
 =?us-ascii?Q?71q9DThH+U+e6kHS/0MN3qgWUMUEs803VF/cGxZ6F3bH/iJVvoQLkJFl6qnI?=
 =?us-ascii?Q?gjZRrBkvd8EKR54C++BW6cZCFN0VBEx5vNzbAYWA/8GW8GsWy43X1V7pymi5?=
 =?us-ascii?Q?vUhm0Os0uTutNGOagMiOnN70OX4kuLdcuWk1wQ5E37Xdj+n4C842tFpEz11G?=
 =?us-ascii?Q?VMB8EaBWU/EItTh0No4iDd0Dvokfsrao4tli90uL7wQMgbKpjxpd4JamWvQs?=
 =?us-ascii?Q?YaRWrnpnicp1oQbxQ0ceWUr4VAdS8q21Bm6n2wR0BcC5cYj9jjG9ZirhH/5q?=
 =?us-ascii?Q?xrxd672zjguzUX9qGi/KAMAONnRilnzISjOMsdqUAU5oqnLh+zCR2b9qfH7R?=
 =?us-ascii?Q?61cUWsqpAUP+2cciqFxAja4bG7q/cNnLGzUpHKVGJK+Q3PMlLSkgHxOVVJCD?=
 =?us-ascii?Q?5vgF/zqCmg+9JiejtmglsoxsJisWhP7t?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZbGthtiM0keoDee1jWNfTAKNU0nuJQHkDRNkHn2tOI/ZCeYAOrLOj926EsC4?=
 =?us-ascii?Q?bLZG2dfJgwIu+MuquE5mEpWQ4YKLdwcXNXRSNo0nUK/XoBFtadkjGJaFprL2?=
 =?us-ascii?Q?DHDuWgI79X0YUSPLIkM2nWQqGIFPC1EP9Qu/UB2+YLsxxWFx+HehTkFufuYb?=
 =?us-ascii?Q?RCwJMqlaxpwMqDrYQUpsBwuDy6NvLDBPrV2dW66ceRySEYCSgCiwL8uC4o7l?=
 =?us-ascii?Q?Mdpy7BKvxf2FzAld8209u/jwt4qAENMhRSZzQhDE6o7Q0mdzg/3TgG1onGU0?=
 =?us-ascii?Q?B95x7TCU8yw5z0kQh1jyT2Pae/HS2v3xI/o84DDSuYC/jknqv8jQ47mbsfAr?=
 =?us-ascii?Q?d/kngEwBsge9J8TxHuWtBMgziU20V5BFbmCq4rjg9Lfszs2aVpaCDc3x92Wn?=
 =?us-ascii?Q?XQCXVwXMIZD95GHsBh6/KD2UbnSm6sazKsBgNDABbP7U8URzPdGqbXGN1phX?=
 =?us-ascii?Q?Y8o5ZCffuRNF9NZDHbe+W5z2R+6kSLNswtRSNNyz07YvUgShPPTlweHOKh0n?=
 =?us-ascii?Q?5epgzDW6CtqLxNoe+fYWtG5vrtRWGOlS+eYmoOggnRVJj+ulYtNgD0UotVgm?=
 =?us-ascii?Q?zooEh/nQUr3DFFQh1sq7MU6wM3a9K4aemy9V87eUWwdegaCvsXPCFjbXJxOm?=
 =?us-ascii?Q?O9DBqFkq4DauTATMecUXK0KIOTd0Dmdr6nGLeO/St0OG/16K4A0O2/POZcQj?=
 =?us-ascii?Q?VAn+yr8sHwJiPC1jF11bDlv6MtvYRKpwS9JR+pq1O8HQ6MozUvbVBtRQAZQq?=
 =?us-ascii?Q?riu8WinBX1HFqq1njzpxpOsIXP1GtubhWct9oejmNTZkKBLx+tdtpc69T2Al?=
 =?us-ascii?Q?9oAUf9pCJZXU9QhPKrZ968osu3LQtPVAMy2Txbl1/2wsczOtA+IRx4ibcD2M?=
 =?us-ascii?Q?mthuFff+dkeDVNmD4vBDKNHenwOpZXJzsIuX9F9uTjL4YmquxhKVB+9UelEJ?=
 =?us-ascii?Q?J8gdmi57nct/4HiGrTtptjX+RlxM0m5d0AE7p9n2qfZjKr643rfF5Nx/uV6c?=
 =?us-ascii?Q?7j3lLPv/g5ZAS6NvbImVrqlBxo7Kxoaf7Ya5YScEt9cnuGQnRgBWT3gn0yFt?=
 =?us-ascii?Q?w3zlrCuABMtVx1PywWdohBexFmVMGBA7sk7eTpcGf7b1VySuKn7o8iEhjM9t?=
 =?us-ascii?Q?Pm21FvSn2X8Gp05GhC6B8jXRVUEqyMA26ND5fpBVGvTtWGEv96poGaXppNTo?=
 =?us-ascii?Q?5hnkS990SkW0t7eIVN4BRZTd9JtGBsYGVCJXyyHfhdj+niwKjnUuNa/fuFTW?=
 =?us-ascii?Q?f1g0d8mREq125K5jozBAFyuIw2bDTUNyxtU72RxCT8CAFyaCT+aksRwhoi+m?=
 =?us-ascii?Q?LDowqKY7J3S8LBpUIcC7UwdUWVaEf7hNbPK5ktcCcQp0Vi4J55wVi2f50Ea8?=
 =?us-ascii?Q?NSALt6ezWSrTzk+9jSxwfl5RWC0JGGaWbrdXyjeyv3KIAYWY9Yzr883q1oeg?=
 =?us-ascii?Q?BiKIXdvWUOhF897mk9pkAabKeHM3cESBkMruYuTWDnp1cGC/vvsuCrJDoZqs?=
 =?us-ascii?Q?Db070md94iTOdsed82A9Cw7ddsdOKt49fd97xuXPimlM/Ww2OExdfu01Uv10?=
 =?us-ascii?Q?LN6BYfrvZiqSi1BtzgJxgX2mlFOTmLaqys5TelnJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4ccf57-6f0f-4c29-1b4c-08dd5585e105
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 10:19:25.4114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8HGBFROFafpKDU16M2wQmDQpcQWJOr8zmovvUgq2qkjH7/3tY02owrfNKqfJ8m9m6aY6TVTe9IgZ9JMeug+l2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9504

This adds IMX8MP_AUDIOMIX_ prefix to internal macros in order to show
that specific macros are related to audiomix.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 6e3f3069f727..1fe21980a66c 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -11,8 +11,8 @@
 #include <linux/of_address.h>
 #include <linux/reset-controller.h>
 
-#define EARC			0x200
-#define EARC_RESET_MASK		0x3
+#define IMX8MP_AUDIOMIX_EARC_OFFSET		0x200
+#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		0x3
 
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
@@ -35,8 +35,8 @@ static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
 
 	mask = BIT(id);
 	spin_lock_irqsave(&priv->lock, flags);
-	reg = readl(reg_addr + EARC);
-	writel(reg & ~mask, reg_addr + EARC);
+	reg = readl(reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
+	writel(reg & ~mask, reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
@@ -52,8 +52,8 @@ static int imx8mp_audiomix_reset_deassert(struct reset_controller_dev *rcdev,
 
 	mask = BIT(id);
 	spin_lock_irqsave(&priv->lock, flags);
-	reg = readl(reg_addr + EARC);
-	writel(reg | mask, reg_addr + EARC);
+	reg = readl(reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
+	writel(reg | mask, reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
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

