Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DC4C433B4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 02:36:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CACAE613FA
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 02:36:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234783AbhDUCg5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Apr 2021 22:36:57 -0400
Received: from mail-db8eur05on2067.outbound.protection.outlook.com ([40.107.20.67]:30941
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234739AbhDUCg4 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Apr 2021 22:36:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzLUhYMRMkcNnmQHt3RtXrqCVha17AChxQe523yJdeCMrQVhnY3NEMdxrystw97D6eSGn/uZrJWUt5gPi3Zx4CIofrA0Vty9tpIwlJzDyVtTVA2SQ4332uuTSx8Ms4f7ZD/g/BeoBb4PzWJdA2VOlH8LDt49JZGaDLTLOauTB8rCiy2Qg5z9AID9qwFnU5gJmXIPBfkBj7PbTS2Adm3lj36ACiosUhJ8zLM5bL1qzDAMWvCWonwXBG85R/Am8mXVbNZgvoAcsr48Hv10z7MtnfdT1nsjnTRczOAvPhS9kMBGeMvccFHZsVN/ehYmPW/Khp75VmhH2CNC7nIqCsMRyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OixwFy/wa21b++X4r/qZTxLEQDqzfM6PlpewOGtoI5o=;
 b=lJzaFTdkHGSc7p/p9gKfCLWQhjm0nAqhPRBhyaOCOgJicRwQaI/qy+QO5PeSAokNbxlOkGeEqh053mq0oozZhYnszpzQ70ryqSvFitlhjPis/LRsZkLbqKqTxO/v21iOIWrcy0p3H4bxxp45sdgdS30uvpwpFc2X96lJmLhNbHMpgdQ8ltup5ig9mJ09mm09uXwR6jUyY1kDmMJLphthh1N/T0UmBTlfEsFoDdGW8usbXcZkHRoi8Iv8Hh244wzCOp9hbM+OX9ooqQWXms+ZvQLL0NvA8uPACc4Z+znhpbynO1hjJpUbInOC8pGSuFtysyU/hoRy3xKZzBxR195+6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OixwFy/wa21b++X4r/qZTxLEQDqzfM6PlpewOGtoI5o=;
 b=SEKNcfNHWOsMCYIOKk2+Je9rcqLer2yum184yjlhR0okcY6xPwfEyN1hLJ9x+qni9wl7z6QisTzHKzi6iPaRHWFQvaTq2EU3Spe6fUYtcuR0ENse3Jj7Ft6ZCqjKn/BCILbvMH5ciU/qGaI8sZ4/r80lFZawv9Yhaq0oX4J2poY=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8313.eurprd04.prod.outlook.com (2603:10a6:10:241::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Wed, 21 Apr
 2021 02:36:22 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4042.020; Wed, 21 Apr 2021
 02:36:22 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V5 8/8] remoteproc: imx_rproc: support i.MX8MN/P
Date:   Wed, 21 Apr 2021 10:20:22 +0800
Message-Id: <1618971622-30539-9-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618971622-30539-1-git-send-email-peng.fan@oss.nxp.com>
References: <1618971622-30539-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0204.apcprd02.prod.outlook.com
 (2603:1096:201:20::16) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0204.apcprd02.prod.outlook.com (2603:1096:201:20::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4065.20 via Frontend Transport; Wed, 21 Apr 2021 02:36:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5c2b272-2cb2-44bf-1a0d-08d9046e4013
X-MS-TrafficTypeDiagnostic: DB9PR04MB8313:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB8313287D10353E14FEE7CBA1C9479@DB9PR04MB8313.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:335;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9ANvPLCe/Xh/f2k/ts1Nu38M1dzDO/e/1LmDuNx7PkovlZ3YXH+LUgXrfpoBnAiOVJn4eQIKM07Upy88QmX7kM+Bd4QyliPdTNrW7HBiB7b0LjD0B9VoI9tQYn/d5R6IVGB5oejxIqOpKRbqxvGSG5ltOoUn1cjxJwfMKthPiwKPOS4HbnPv08diU+EonFh4wFgDn2yf7yRqOGMPMsGAsrO9u47f1aNw4h/xLSxs45c6mJVKNvYBK+dlgtYJpcrXUef/gHw1nJ+amidk1gkkYGXBDVbrAv8Dz4xQ69gfN/6XyY5xB/NOfADgIPdSqrcTTtvkdtpOu7dzL3tn2J/1dqqlCK9Ii23SJ96rzc1sIRc9itNjlWkIfpZ4xiY3FHJ1VAEH6v67LzG6zfPN59tprX1ksmstq1wAn93lLhV5h6Gd8C/SEkZu+58h1MOdKs9owjxAeDD7HtECwQnHRVg2xpYEuwfhoqbqFysIJ03Ixa8br2y2HCbREl6apHTIjih7tAUhmoo33pnaswSbjBYGpoG3y+/hiQSo0778ToepfbEPT2rmz2SkuR3rHUFxLYB7AatGOu9nFD5xwifl0ACu7+jRBT4UvkOB6sN5By9cHOG6ZJxyOnERhS2nDf8ht2sY+mtEztIBZxIJHgWkBj0/IE615HA6fmJNQq+sCDoCBEiE+T+Zxh3lJtamjuNeNFud
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(38350700002)(26005)(186003)(38100700002)(66556008)(52116002)(5660300002)(956004)(4326008)(8676002)(66946007)(8936002)(316002)(86362001)(83380400001)(6666004)(66476007)(7416002)(6506007)(6512007)(2906002)(9686003)(478600001)(2616005)(16526019)(6486002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MP+QpeN8QE08ZipcA3rvPUEgDq5Q3fnRVrOy0y+Cd7WM8S5oCVm4EuqnXWCZ?=
 =?us-ascii?Q?YsixcWKSMHZoY3YDQCML3lvxCHwm+Fd7CnVDuywxpIxp1XBUXWCEE2093/L7?=
 =?us-ascii?Q?QyVRjh4ktY1OD8+hPU2gs9lJ2vBTo7wwUQltAD244zirB0fSvqJLxQ2F1trJ?=
 =?us-ascii?Q?yiX52isktxAaAr9rP4sCqN2bOwIwVZAbNAk1Eq/do4FcVuK8a2gwcQpODSq0?=
 =?us-ascii?Q?61q883eHcMMYI+H3iouqRCV0xAeDtctt7xMJqmm+L9xgjT5BV0LHLIC7T1Qb?=
 =?us-ascii?Q?pxF6/tPyaSMEchs9fV/Ta2D0ph5i+OgkycvRscNrXFiKPPQMNptzCI1IVlMp?=
 =?us-ascii?Q?BNQ0YMk0hN5jx1crsM6jfjf5dQyVoCOzDEtTaT5Fe/IedJBmEomlchtvreWi?=
 =?us-ascii?Q?fGfM9wVFDaLqAaEgBYYQ7VVr7ebcn+QaM0ce72wkNoucD8bkyoyQCvNxpkLa?=
 =?us-ascii?Q?IRCx2HfeKnOsXAfJQTP+fGXtzyWr/HWU+7aLjhY79SiHLOJvLxED3pronf4l?=
 =?us-ascii?Q?FPa+6+aqZTy5Gxpf9HDWlHMlrbWE5Wqsbjuulwi55quoO+G6mrMk28u9qTYl?=
 =?us-ascii?Q?pK3bQyNNl3HrLEna3fpVxvKRsMuXCRsxz1TGE+GVMfDkdDB/LnG1yBVQgPI3?=
 =?us-ascii?Q?SAvfWUrjwXlcCds+lJIBIeG5uu2V9uKS3fvtk0c8XFVXHdrYFyityFlPNEIU?=
 =?us-ascii?Q?CNe7HRyxH34F88GxGxZL94IBllFH6JEXB0Nl/XcdlTC31W/1qQ5pj6t2JBLU?=
 =?us-ascii?Q?dJZsHCcfWVOlaM9YceEztP/zH+fxNPZ4/63yWebr5q1I4iSgQV+z/7+Khktd?=
 =?us-ascii?Q?XKrfkSnvf98/zuthFDHyqUT48ntU6GsEE3dv8CiJZipuPNFonqHwdO+GcASn?=
 =?us-ascii?Q?5I2zBxdsqEq0pgzR9XR4jDd23J8Vje1tfYcQMeuxpD8fsYmDcqHDd8q9fKHD?=
 =?us-ascii?Q?Jmlq7LaL5DUbMIxKPFXgKEaYSo8HbMN4TtKt0lNA4cjrgeN60XASqR2/HwML?=
 =?us-ascii?Q?0v/uD3v/ZB+ONNL57Qc60F7PGZdUTqt27gWprduUpu3cMvuDwog9ZmUeCK2D?=
 =?us-ascii?Q?2f/8dAMsEuR7r87wBUHbCQ1GuLYLvrvs/DRyUDX6iehx0OE/FXEAOR7hGG3e?=
 =?us-ascii?Q?O9NU9qGDhLG49J22I+64C9U9aN5UIdPlqVZ2l9KM2nNhgiTgvtjflqUAmTOQ?=
 =?us-ascii?Q?GZoIpMCOsNVjEcUoyssx6Jr5MT2lp/zHg4tNlXJ2jYAwPJWiFhBvMXDjyOls?=
 =?us-ascii?Q?hxVkpSlyuCOWZL61o5x3HETQrIiz/kCjuNKdCkIWxyR2GD9dvhuf5TyM/tbg?=
 =?us-ascii?Q?rKXNpgUcQrIwg9g7tkuI+NMU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c2b272-2cb2-44bf-1a0d-08d9046e4013
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 02:36:22.1121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mN0EvG9qIE3gnQIALMm75yZQUZPe7IvDLyhK5wZuAnu/UAK4pzFaUU4mrGA/xuEIs8qBhEEeRWXo2rU4a+89+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8313
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX8MN/P remote processor(Cortex-M7) support, we are using ARM
SMCCC to start/stop M core, not using regmap interface.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 87 +++++++++++++++++++++++++++++++---
 1 file changed, 80 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index d26254609a52..3cb901c87a7d 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2017 Pengutronix, Oleksij Rempel <kernel@pengutronix.de>
  */
 
+#include <linux/arm-smccc.h>
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
@@ -50,6 +51,11 @@
 
 #define IMX_RPROC_MEM_MAX		32
 
+#define IMX_SIP_RPROC			0xC2000005
+#define IMX_SIP_RPROC_START		0x00
+#define IMX_SIP_RPROC_STARTED		0x01
+#define IMX_SIP_RPROC_STOP		0x02
+
 /**
  * struct imx_rproc_mem - slim internal memory structure
  * @cpu_addr: MPU virtual address of the memory region
@@ -108,6 +114,36 @@ struct imx_rproc {
 	void __iomem			*rsc_table;
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* ITCM   */
+	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN },
+	/* OCRAM_S */
+	{ 0x00180000, 0x00180000, 0x00009000, 0 },
+	/* OCRAM */
+	{ 0x00900000, 0x00900000, 0x00020000, 0 },
+	/* OCRAM */
+	{ 0x00920000, 0x00920000, 0x00020000, 0 },
+	/* OCRAM */
+	{ 0x00940000, 0x00940000, 0x00050000, 0 },
+	/* QSPI Code - alias */
+	{ 0x08000000, 0x08000000, 0x08000000, 0 },
+	/* DDR (Code) - alias */
+	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
+	/* DTCM */
+	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN },
+	/* OCRAM_S - alias */
+	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20200000, 0x00900000, 0x00020000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20220000, 0x00920000, 0x00020000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20240000, 0x00940000, 0x00040000, ATT_OWN },
+	/* DDR (Data) */
+	{ 0x40000000, 0x40000000, 0x80000000, 0 },
+};
+
 static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* TCML - alias */
@@ -194,6 +230,12 @@ static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
 	{ 0x80000000, 0x80000000, 0x60000000, 0 },
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
+	.att		= imx_rproc_att_imx8mn,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
+	.method		= IMX_RPROC_SMC,
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 	.src_reg	= IMX7D_SRC_SCR,
 	.src_mask	= IMX7D_M4_RST_MASK,
@@ -235,12 +277,24 @@ static int imx_rproc_start(struct rproc *rproc)
 	struct imx_rproc *priv = rproc->priv;
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
+	struct arm_smccc_res res;
 	int ret;
 
-	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
-				 dcfg->src_mask, dcfg->src_start);
+	switch (dcfg->method) {
+	case IMX_RPROC_MMIO:
+		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
+					 dcfg->src_start);
+		break;
+	case IMX_RPROC_SMC:
+		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0, 0, 0, 0, &res);
+		ret = res.a0;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
 	if (ret)
-		dev_err(dev, "Failed to enable M4!\n");
+		dev_err(dev, "Failed to enable remote cores!\n");
 
 	return ret;
 }
@@ -250,15 +304,26 @@ static int imx_rproc_stop(struct rproc *rproc)
 	struct imx_rproc *priv = rproc->priv;
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
+	struct arm_smccc_res res;
 	int ret;
 
-	if (dcfg->method == IMX_RPROC_NONE)
+	switch (dcfg->method) {
+	case IMX_RPROC_MMIO:
+		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
+					 dcfg->src_stop);
+		break;
+	case IMX_RPROC_SMC:
+		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STOP, 0, 0, 0, 0, 0, 0, &res);
+		ret = res.a0;
+		if (res.a1)
+			dev_info(dev, "Not in wfi, force stopped\n");
+		break;
+	default:
 		return -EOPNOTSUPP;
+	}
 
-	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
-				 dcfg->src_mask, dcfg->src_stop);
 	if (ret)
-		dev_err(dev, "Failed to stop M4!\n");
+		dev_err(dev, "Failed to stop remote cores\n");
 
 	return ret;
 }
@@ -594,6 +659,7 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
 	struct regmap *regmap;
+	struct arm_smccc_res res;
 	int ret;
 	u32 val;
 
@@ -601,6 +667,11 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	case IMX_RPROC_NONE:
 		priv->rproc->state = RPROC_DETACHED;
 		return 0;
+	case IMX_RPROC_SMC:
+		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STARTED, 0, 0, 0, 0, 0, 0, &res);
+		if (res.a0)
+			priv->rproc->state = RPROC_DETACHED;
+		return 0;
 	default:
 		break;
 	}
@@ -751,6 +822,8 @@ static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx6sx-cm4", .data = &imx_rproc_cfg_imx6sx },
 	{ .compatible = "fsl,imx8mq-cm4", .data = &imx_rproc_cfg_imx8mq },
 	{ .compatible = "fsl,imx8mm-cm4", .data = &imx_rproc_cfg_imx8mq },
+	{ .compatible = "fsl,imx8mn-cm7", .data = &imx_rproc_cfg_imx8mn },
+	{ .compatible = "fsl,imx8mp-cm7", .data = &imx_rproc_cfg_imx8mn },
 	{},
 };
 MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
-- 
2.30.0

