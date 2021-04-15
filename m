Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26EEDC433ED
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Apr 2021 13:43:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08CFF61008
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Apr 2021 13:43:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233371AbhDONnz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 15 Apr 2021 09:43:55 -0400
Received: from mail-vi1eur05on2045.outbound.protection.outlook.com ([40.107.21.45]:36352
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233345AbhDONnr (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Apr 2021 09:43:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0nFBuX+VLde/I+nYwddxocP/qW3rFyvO0U+vTwFwo1DQhv+kMP2sHKGqHyJ2V7QUB3W+SHj7Hg4WC6yk/BCW5XhKKVzFsus28DazaIdgrhDzJjy/SBO4gbZmKTqNaKWaF3EOdk1NKZUTNyQfmYT3AJxe+avyOs62NnBLgKuHNJKo9lvLWdSReV5/YYg9L8J4A05yC/fUm16c4V0XOM7JiuHCjuWISdz/6MPBxRipj3tQlWIPSVyUknuxXMzVCShz/eh7/NmP1pc5D3dOcshYmF5ZkfoE9vGRWtYid0Zs4ctHanM4SL215+0bF9pifLjUm7dBtCWxQ8BEQcsOYke2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJLIjbPa54dlaXsDAtGgzgGh/KNZl5uyh2GqQiGBs90=;
 b=LROoNJVoALlriCXSkWXXlsu6raMe8E3XJBZGD3CZeGL5cuFF48Zy2B6ZsVtyxmwIpfaNfMFpGa7LSXjx8Ha974SZCN3YzzEh9nOTxh7BPE4nJWq00curJSyeDxNtcvXdK5Ctgjnsh9vc3eeQSM1ir7dnQC7IjrzvgsQHhUiXLmGZPAHAwql0YeM+OLJ5DcCU8M1eFH7tDj0TbHBexkcyUuue4/CX0lxF+jmSqmGnyAn7e7WH2ivix8j2u8AS6C9vsK2xeUyhnFDpkrxDUz471514nEkzl+vC931abc1FgMg4x2qT7+ypcZB6B6RVW30wIlfJ/mVCtbay3vC2uMxQPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJLIjbPa54dlaXsDAtGgzgGh/KNZl5uyh2GqQiGBs90=;
 b=KOw34Q5CO0X2I118uNNygr5HCYfWoMGLe/K6P/ovUUCKzfY+EGprRXrK9KF7T2mVkqQyHCYfd0X5Q3ZpZ7g/n29Jzq0dQDDHL4huFPZyJ0tRsWBQsRV0Jgb+BXtqQOwnCqQl0+Bc2C+Zoy/rCnUqdhAXiOLx3fs1lD1UWjGMtLc=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0401MB2534.eurprd04.prod.outlook.com (2603:10a6:4:3c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 13:43:22 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.037; Thu, 15 Apr
 2021 13:43:22 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V4 8/8] remoteproc: imx_rproc: support i.MX8MN/P
Date:   Thu, 15 Apr 2021 21:27:41 +0800
Message-Id: <1618493261-32606-9-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618493261-32606-1-git-send-email-peng.fan@oss.nxp.com>
References: <1618493261-32606-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0132.apcprd02.prod.outlook.com
 (2603:1096:202:16::16) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0132.apcprd02.prod.outlook.com (2603:1096:202:16::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 13:43:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04c781a0-57a8-40ac-44e1-08d900146f3d
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2534:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0401MB2534E0BEEF52D0ECDD71EB96C94D9@DB6PR0401MB2534.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:335;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e2YM+RPN8jSqd/nrDO5Y2pXk/phoonwgIvONQYo8D8q+3c8URE+RBdkTnoRpoP+UHN18154XUbOVgpX4wUYa6DamevO2oLL9hlBSLUTIOCOLyjUOgD04tujQZA0FR/hBHoJMsXQ6FdBiim8Mk6h5WYh80BYbLVxcL51P8kBTmW6ApooX33Fw9JMu/7bvanfKYQl93+pMIQ2TxlZlQAYCOYX4TKQJNVsDTcYLYi08mlY7eUPsTkOqZy1qBuEEG3dhgRjO+fsLWHo04OGFS3PX+zOuZ9Pf5CnAbVVebYzCeM92h89uUoR1BFrZuEx/VlxGKXRRl/uA5pu5lNJMFWgJFSqv1wqLFKpwJlnWjCS8pguoknli4jtssqyiluxDPJDJ/YnqGYTo+MRDOSqpQaNiwWNNrTWcRv8RkdC3xgN+RN1QK5BG5i1/CBqiQ0rpeJNzZEh9QyYuOIHpV6FpuvlZo9TxcGYQyvHofPXRMzKzwEqHtWwhGaMlrn5EeCXMc+NrSa5FT6+60Q2yEfRGriZFLd4eaOFD3a58u1OMBuOigOg4q0kmdASL+WQh8Gif87ne6PAEojwgx1RPDaKEM9QDj9HUKF4vEv4DC4/8Qd8l5GnuXr0qbEJjOeha//gvutWKMln6h9Uknc/qc/1xBzE7/5bzNSJJTl12vJ8uK5NcU8oC8aUTBF5Nj5eby/YlxCpu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(26005)(6512007)(8676002)(6666004)(2906002)(38350700002)(86362001)(5660300002)(69590400012)(38100700002)(316002)(52116002)(478600001)(16526019)(186003)(8936002)(9686003)(956004)(6486002)(66946007)(66476007)(6506007)(66556008)(4326008)(7416002)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?y4j8vWastT+D7ctkMp7luQxRQ2WK8H9V8v2jynd/rRY9IqhT15msCAOEocqz?=
 =?us-ascii?Q?ZJ1p5bO3SulhZyjXPiT5k3dnqlPqCUA8hsdex00j3fyyqcppN/WUze7F/iEp?=
 =?us-ascii?Q?RP3/8w1dHEERQa6joqAJ9qGvmb1JHdsM/NE6QCtMeh8UzOL+bqzeFsYlaDjA?=
 =?us-ascii?Q?PZEyI6oFkVq27j2x86GqjW41j3BpY6p8iiDduqFq2auIhoNhWAfot47r+ae5?=
 =?us-ascii?Q?bRn/LEPLEwPGMHoDyP8AjSGl0kt78w2Ri4SSxvRakSnBveM5XJIF18eiKThL?=
 =?us-ascii?Q?yAbyhz1HWoFwrzl9eGhMQ2fQM77RDTjAbuFKG0bVhputZvnNHFYN7x7GNyby?=
 =?us-ascii?Q?OZBk0eyHz4aBXSK9R5TmVS7TUihU3k5ALGbSOMkwuaLoV2NIkYMEqe7TRfyj?=
 =?us-ascii?Q?9YcPfcwkE71QjxViU1iK2Dce0kbBwtOylmfdWPjNocoOkO6PPuoy1LX6MWlm?=
 =?us-ascii?Q?SbGFYr5VzMzwPckx+gihydhJiXR36p6C/6I2EmsjLNjgfgmw1R/YDHgWzPrj?=
 =?us-ascii?Q?Y2WRSpm8yVMRpRd6s7tt6GIlF4gQbQBlLUzdB5mNcD4OJ2Nq8QYenE0Jg/HG?=
 =?us-ascii?Q?R+tzgLEwgdqj5KCsMpHQgNJ0ADb4GFO32Mp6PGDx3x/4ZQFTP3hQa7Cy3cSV?=
 =?us-ascii?Q?vEw27BGaEmqkuAwwkUyjmpuIq/sI0iKkjCp2fbYJ9Ql7bOIlA0MyrN2B00b0?=
 =?us-ascii?Q?OutWr9cIiN3ZyVla946yrmyypxtFYHEztTPwlk+IBOY/wmMdIOgWHDpX2gla?=
 =?us-ascii?Q?dRmGPH4HJXkBUM8JgLZYhZsp/YqoFB8HCNop2TbwGmlsZ1BLeUJ8zcLcIGOk?=
 =?us-ascii?Q?gAODUz9jSetutNW+ascHUBXtoBGz2sj/4GcIKpu7HGO0eqaT9Ecyj6CSkbGE?=
 =?us-ascii?Q?yTN1NuhBla+EO96ir07sLSvJSZXROAk3Z1VVT8+6cRteafoAprpXPp8bEMc8?=
 =?us-ascii?Q?7fVPmUFCYjmPmErg2O3lAUxoQENMWXOJTRTcX4FrSo5txhi9faxrRocGXyJ/?=
 =?us-ascii?Q?Rb/rW7zO2e1nkFT1qXCpGCFzLrf7gce91b12/8untKLriIDo7SPLRnVsZPzw?=
 =?us-ascii?Q?NLgmRyeBcUlhIKGxpiNTh7U/SC8mgHooOEjHZkqjhdxQIga3zrsXI2XBgEi9?=
 =?us-ascii?Q?AWXpZ9QOJ934hbj3N9kWtWCX+5T8dZzB6q22NA0WBTZ/lb20YoInxxHBelGl?=
 =?us-ascii?Q?Q06y8VFIHrhK9TwRFYZoA7iDVmZnoq9+Kf7TS3NzAI66fwfcYWyAbtkozpuv?=
 =?us-ascii?Q?1eorsL2Qk+fsav29gx6IxBmQhc8O9T2VIfKSh+G4FjdW0k/PgvasbPBgfPKw?=
 =?us-ascii?Q?QA3M5f03YiJEFgV3OD2bEW38?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c781a0-57a8-40ac-44e1-08d900146f3d
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 13:43:21.8876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivibDmSt6cuJhCcGMfpgUDnAHgTDtTsJyvPmViDVbwPo43eZxch1tUd8Gmkux7/UoBvfOpluTYsCUzb3S9tMbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2534
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX8MN/P remote processor(Cortex-M7) support, we are using ARM
SMCCC to start/stop M core, not using regmap interface.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 87 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 80 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 0592865..0ff16e3 100644
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
@@ -753,6 +824,8 @@ static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx6sx-cm4", .data = &imx_rproc_cfg_imx6sx },
 	{ .compatible = "fsl,imx8mq-cm4", .data = &imx_rproc_cfg_imx8mq },
 	{ .compatible = "fsl,imx8mm-cm4", .data = &imx_rproc_cfg_imx8mq },
+	{ .compatible = "fsl,imx8mn-cm7", .data = &imx_rproc_cfg_imx8mn },
+	{ .compatible = "fsl,imx8mp-cm7", .data = &imx_rproc_cfg_imx8mn },
 	{},
 };
 MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
-- 
2.7.4

