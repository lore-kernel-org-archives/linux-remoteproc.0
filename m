Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C5923716F;
	Tue, 11 Mar 2025 08:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741683431; cv=fail; b=GEdIkjccUwZugKlpMo2Z7XU3MXsPjBjZkUHeRMMu/pcnft0ZqHPfXPB+gtzmkYsW11WVuLBxbo/YzzNR11XTn47jMmv1vMLUIwHbk5GddQEaJU1lY996wpM85KA1BRKGNhuM+0gQWPCpCDLLyofhjipqagUxaijtbrNr+k+E4vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741683431; c=relaxed/simple;
	bh=eMyxcbuGhFuc5uWZeBh6mo38S9vkW+6B3lnYaXFKcT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=btpAiNzPj+Z+q/hPP1ZJBeVz/XIjTaRblyYTFP7cfsAdJV0Bd74fxUIG7/vO9CkXsKQdMOORfv0JDZGlaRzro2hMMFyKYzNen7ahaEpdnL9LtCIPN6G8pr57Z3weDJQKtndiws33WohlE/LpwesXsz37ElPJScAS0Ek7Osw4QJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iPfiqf6Q; arc=fail smtp.client-ip=40.107.20.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iPfiqf6Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sju6lXkmCNsIftNt/g9knlhg8VzS2OOqulWr77Zq2utGHAFUN4Kg0HlSDsbkhK8FVldh2S6wzhGahfCY1dM6YugOCH17kd1YYzDtxoh4jx6LUIHDlrmQ79XwPh5NkM+Y5XEBINLevtFOvvLKTG42vqEI8iWzYZilPGqdWNOOxP7PICjzO+rUXS8BDVxphtxLuA6Zfy4LONI8VkmBtnVVEpJEFCozaZYybOTEqvsxWP3gipc0BQkjiElz/f7EA6c3M0/2kMPjlhB7nE0OWQkNick7WWy5VkXZA7K3op/uJ+vikBqyBCFNP4epd5zlf6ZZrS2+3M6MlCqv3aepduF31w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GG7qQFsseihYghgJZMieyE2pxHQtzQLouq2IgDV0wes=;
 b=lpsZl7LV3TRHHTWJ8km9UiqrZxx9yjtZq+fSDdz6WHsWCMrKjW48swi9VEZqDejXXFm3XquxcclNB6vO/faz9iL9e9ZDwRCaU9a7P4yyP66Kdukw7F2FGzPUj2EhopO2pNLYvOEGzBO19cltykMQDFKcEENiAsxnsnpsgsPMdFQGXyVC4xgF2uQR4aoy8dVPRGBEyOvDFl/QQXCewrqzJ84mJ/oxXeLIOSP/9AmLCBGRPwWiDb6l2N0eQG9I3heOofX94KwRgMdNAhWts2a5NgoUgq9BMH+Rnw+hVnu3R/NXJ/FnO//24quSfjx9nAIWVayZLIR9vNwV5So5WM6gWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GG7qQFsseihYghgJZMieyE2pxHQtzQLouq2IgDV0wes=;
 b=iPfiqf6Qq9dXBkWfIsKBJXWWzivLY6T49j0frcLIRLVzzG2yYPHsu5IfKZLDBvNw6fnh+SJJr3hmaVGIfBeOBfhki2oQigXAri1b0erNz6+ErOBZUfHnQ+ljES7cK1gzssHoOtIA9FFpo8pGqn6XQPqc423myrWsTEn5QqwVgCbUIS2sqAsLp2ACT9pd5pjG6RKWAjGi3uSEKUzYcSxQ5Ov09Nnwf329KWt62YTji/VqNHmMT5ER6rFnbY4gzGIIReCGvovW2PTRyrNEeDwboxu46EQiNkdb+JDhW3IVS0nmd+IdvTCGuaiq+JlYqXkaZ4cCMTZ2IAzfmDnRSkMctw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DBAPR04MB7431.eurprd04.prod.outlook.com (2603:10a6:10:1a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 08:57:02 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 08:57:02 +0000
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
Subject: [PATCH v5 5/8] reset: imx8mp-audiomix: Prepare the code for more reset bits
Date: Tue, 11 Mar 2025 10:58:08 +0200
Message-ID: <20250311085812.1296243-6-daniel.baluta@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: c942a2a5-be6a-40bb-b7c9-08dd607ab02d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8ofEJhX7t+4zs4v2Py+I8qCMwBMW0S9ofshIeKwtfgYh3IWI9ewB4S7UMfO7?=
 =?us-ascii?Q?NZqRMKACzbBb05TG9ciDnvnZ/2PfXUNrXkxyWHvlMKjXLUZqEtL8duSkB0yw?=
 =?us-ascii?Q?FyfOj+CYnRJHwmzMUXTPraBNM1ubZVqLnRuAs7JvACeS7thCtRnnsWE0IE0W?=
 =?us-ascii?Q?5K7o3Gk8fRsLA402W/K8Nmo/Z4x6EuFRerdsiVR+4Thkk8rDv4DU753+Kvxm?=
 =?us-ascii?Q?xXur097t0Jkx2qjRX5Cv5WIWLQpRRRXZWzg45L8bVSvYf3Xpf+Zscwe44WUo?=
 =?us-ascii?Q?Mx+E9OeeSVhASqk4pQ53PaPQNLmgZOOnyPHP+BTAU5uYUmC5wiMcgMXBgPe6?=
 =?us-ascii?Q?mkw36L3ftSGPPtrdeCtzDCWDpKSyxRHNAXqJGEiNd3ezn32J3qgBbmMdgusc?=
 =?us-ascii?Q?gtwMOiUuSdisL8wnGDesXY2BxgqF0reFPnoemxOp3BvFVCAF0nHLWBEYn+q9?=
 =?us-ascii?Q?7rFcfyeCgV75Zvv4ooD9D5V7zBc7N0wYLeuCHQk512VwxNmWGA09BNYPhaqc?=
 =?us-ascii?Q?Rag8okVyrkYmHKJCoGcCFz1HK5if6Nxq2ebAh6NP+L5EuhDgt1VDtwAk8yq1?=
 =?us-ascii?Q?gsqO0753NbdagaBbzAL+U77Vb4vbcc/fdc0P5kjzMW5ZoztvwxxczvwLdLOc?=
 =?us-ascii?Q?VHfJe5RKDWNtKhCOfLC7m+95LpzhRczLTtj1NyUJBXY1OpItDyHDqvlq5Wut?=
 =?us-ascii?Q?tU3Wvh2kg9nOU1xjFBC0SgqfbuijCBcbrzuX8hTzxTogjUzx34hynBhzAkqM?=
 =?us-ascii?Q?9rn9MJukRe2JT8moVihFmzwoTW4gFJSp9wz+sFQ8qgQHzPdzKglek+li+5Aa?=
 =?us-ascii?Q?oyoi6+HIKehsFLRh2eQAJ0mv6O5V4azq8ekbItfRlR0WVM01JxWzxfJTBWM4?=
 =?us-ascii?Q?KUPwsd1MJQEbydwS3zKlC/OfhkUAF9f0lIch/lEUOpcP4sNMlHiBiiyBlCrX?=
 =?us-ascii?Q?u3GZ7EXnSM1AoD4HRo5E07obxSKrjLrbLTeUao0Ic+Es2WntZRtKL8eOdMtc?=
 =?us-ascii?Q?oAITgBe/rjhscsoai208XIhVcB2WHMLfmURlIyjypVXhueiDnIaS9Wxv28ul?=
 =?us-ascii?Q?DIzK1l7WLM312uhSfdQYWe4rpkORLdsJfMqsbckGbXvrUUpa8L214OqF198z?=
 =?us-ascii?Q?IZKXkg66RlVrhYXAugjdw5A4i5nGbYxXyLtLFX3O9PNWjVHkfW5Rl2NHHxUQ?=
 =?us-ascii?Q?dHzdk/IRy+enTwCuxL/9Cr5SS6BAherwqnoSPD2PScjJu3P44UvuiiJUlxAF?=
 =?us-ascii?Q?wgK1HFQnE+ZiF6lZJ5cLqAz3pUyp11cW0hohz1/XipkBblJExeRGPaU+FvGH?=
 =?us-ascii?Q?Hdr2vgUGOlS7AvaAKBPqpxL3gKjUUcl2CougWL6/3Qc9Ing5mkenkNM/FNdn?=
 =?us-ascii?Q?Pov1j3jN63dad/+99d9ckNP05dBRPaQpJKqjqGRRvr3uBytIUtKxKm8aW/0g?=
 =?us-ascii?Q?S7PZxJe6lGVcxOkMWe3vBg93km8kQ9Xm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ly5AJc5PzreUk0+vLdl17iPzG4otP3Et3UUZzp4tk+706m6rdbrRTPgPBqTY?=
 =?us-ascii?Q?8zdCaT89G4auErrgRzFJBO92y3fOpmCg8tJo6AYiacFGEkjwHE8GiTtFKilU?=
 =?us-ascii?Q?EFDQYqfvMYBU+jEWp8d2BuTf/WNnfKIBgA6QDx+6sjyOULJTZHp9q7Lk4xyi?=
 =?us-ascii?Q?yluWm/Ro45g0IIJbBPDeMP2sw3lGfNlLnBRL9eoOJioeYrGG+81Ucgmifo7/?=
 =?us-ascii?Q?aTo1xGE5ssvAM/bzYlhyY8TrhINQs3euVY4Rt3RWkG8weK3ObmiXnbE6mWsp?=
 =?us-ascii?Q?TxzgcwW9biyPEwTh4QAX8UZjSCMhy+/8yb345IHrOXcyjkPMr7vRkWNHEWdi?=
 =?us-ascii?Q?p/uh8ktzossdoRdI3fDCh6bCElP20amLcAxG+pVV/EKx593Kut2dHDfrz3xD?=
 =?us-ascii?Q?9Dxq3aY/it63Gy2qkOqt8rUPwxEVBhWf50aj3eMfrGY5EAKG6E+oVcLlmKI8?=
 =?us-ascii?Q?QhnCKydkn5gkm54SQjnWUljkURRdOGPi+is8wO6I49uaZYhHo3SgLAHWQHuY?=
 =?us-ascii?Q?B7IrBb5t/PY2Rz+bVMoKS2Xn8KIkPvo1N2z9ZtU01os3nynMMxkfgj9QULWg?=
 =?us-ascii?Q?H60HxeKG+qfgP2EA9zZb81jcXSIIuB2oWl5QC7Cc1lfY3n2L4/1B4jMkP/nv?=
 =?us-ascii?Q?hz/cAd2ts72O9pBMEUablPcCeO7FIQ+jB8EVFJAu/Q6YcKpC9lmS+TARG7di?=
 =?us-ascii?Q?7M0GWNiGEFB695YYBJibO+gCtj6Yfi/DlAKeyDGmZmRmfRaTncnkh6RLy8Wt?=
 =?us-ascii?Q?GAwADmVYFg/rcD7whydLw1mdjdGUDtwAl2mAnymK8olO/lECqWm7I/wqo57p?=
 =?us-ascii?Q?NlIh5U+07PdlWUsVuOZDpBpu+6sEd5ZuuCh6sZxkxwDXBybWU0++f6vlh93J?=
 =?us-ascii?Q?8ZkPyiYj12vh8v57zAhfNyFwHvqVJQriiUmJwLBBCttdpRuIDKIZayPWiO4H?=
 =?us-ascii?Q?0J8MUt+ohfYl+dxI5ESDRB9NruZy7CUk0cAVWw2rfklG0tjmHhxkIMAo2s3r?=
 =?us-ascii?Q?0gCDbux0F2N1qIggeE81o2v8CCk/KfeO08apnzcftNvf0XZFXZrWeYWX3yrL?=
 =?us-ascii?Q?qOFVD+iGCJCNy2eEc0Q/NHQFr0RSRvAc3qShdTsgLGd8Zei5VIah78MaxKcS?=
 =?us-ascii?Q?KkU2MhUknwSEXZyJ6AAe0CArwUHVK+7ukO0FVSNBqWKJluBmFhrrdW4FFk1Y?=
 =?us-ascii?Q?qPg+csGx7hS1p6ANOFZFGEBmwkYKt4UXahsAidvoskGX5IeHLtjZKmlVwB1f?=
 =?us-ascii?Q?nOQJuMUXeKgQRW8cTqdBYfJREqEXXplTSFJP+B3LAPBPqMrM61fRPwIlQqya?=
 =?us-ascii?Q?V9RhoJe/UrzAHeHr5ax5rQFeTA/A03c7HWMu0H24/eBhGVYVYmTHK5hQLnhF?=
 =?us-ascii?Q?OkiZGun101+YT7qUgagkP6KcsdmmNCrCNKFkwEUzqLqvNyJf3XBYOq/E/vMw?=
 =?us-ascii?Q?azmE/Pi6y6K6/vk3BTwy6qnvdMT3F76Rau8P/vMYBOkoSM1wGzNSlCqHZwuU?=
 =?us-ascii?Q?FowN4lGMXRii0HW11hjgU9pk7ZrcQ8r7mLDQm+LSMx956TwocYVSwUHAbJhc?=
 =?us-ascii?Q?2A3fGeTcC6jWjgn6CrmZisA6BMVKXfpShU+dMndW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c942a2a5-be6a-40bb-b7c9-08dd607ab02d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 08:57:02.0439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0yLVwRGgGvC7adl35Iwn3K1YvAD+FWxdLKcANfYoXzSIdE9qgyVYvsd8kNMphCXV5vLJYxWZglDU7Y3G8JG8hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7431

Current code supports EARC PHY Software Reset and EARC Software Reset
but it is not easily extensible to more reset bits.

So, refactor the code in order to easily allow more reset bits in the
future.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
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

