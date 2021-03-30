Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D151C433F1
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 09:28:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12567619A6
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 09:28:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbhC3J1t (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 30 Mar 2021 05:27:49 -0400
Received: from mail-eopbgr50042.outbound.protection.outlook.com ([40.107.5.42]:7464
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231814AbhC3J1m (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 30 Mar 2021 05:27:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyrh6pbA+ts63ccSbdDihdj8xnk3RrnSrXgPFoxempLhQxIjt7F6zXXshHkwUCV/QD9gD5J7c59zp8/xaSCel0o7OsUjGceJK6dayvWM4QnA6C4jwMwcs8NdOkCIOTXM2ACDoyuEc1WtQ/LL604K+QriQRNHqZbICKt/jWm/GoFfknNovVOeNgoh7c8g2IbAqiZimkV1zsLcxfxisuFC4r2fG36SjwgJodr2Bs6JuEMngPHQjQN2ln6PUZsh4N8C5Ioc9XToTmeEiTLXQ6dDTDG+lHdvr9IV9JUigjmXxlLC4RkwAxBT/2pVleMMxVT8/8DowXHKtDvEZGhiPWfUaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KDbe6usScPk4BqCqIeicXhKTWCCKT5EravEfBo1a8U=;
 b=bn1YFrJgJxcYNr79EankPteV11s40jd0deVJuGHidkc3lFB6PSZ/HWh7xZxypasFJiMe+2zc1oyTtB7UkBjIkeWDEZ9F5Yrpi57gv6wOeko/Zclb8h8D/z1+BiQnBU/OhnQiWtmkd5xOIpy8nbZS/UtFMafDbZKaOHFNj0s7/NF4/L7BWM0u0+LSsDtOz2VqOXA59B3Ir7MBoCm+uF6ISpmAmJOZ1xCnXDS5GOK3xJTFZ1xphfaYDkiMe4c6n/zhK+rrzgXY2d4/QeWRF5bb5mX52O4RubGUNNISkE1VwxN/q0YsU5oYnWmLwRAmL6/frOujgmSFLHWmsDRs81xz4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KDbe6usScPk4BqCqIeicXhKTWCCKT5EravEfBo1a8U=;
 b=NzXrF5f41zYTA20alL9EVHiuXvn3c+t3qKfufVeRmtZtPBYuNKDNZwl7FXBGJbj6gmppN85l6edIwtnn9xFjwHrB1lSH/LD3a8kUjIPvdPBw+0MC0TycMijxxQexd+deGP4q4dqtN2W2FAU/HATQeYbXpB3/GI2xevXQkXO1WYY=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7595.eurprd04.prod.outlook.com (2603:10a6:10:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 09:27:39 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3977.033; Tue, 30 Mar
 2021 09:27:39 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 8/8] remoteproc: imx_rproc: support i.MX8MN/P
Date:   Tue, 30 Mar 2021 17:12:54 +0800
Message-Id: <1617095574-6764-9-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617095574-6764-1-git-send-email-peng.fan@oss.nxp.com>
References: <1617095574-6764-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::21) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4020.0 via Frontend Transport; Tue, 30 Mar 2021 09:27:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d586f34b-0ddb-4c80-6286-08d8f35e0fbc
X-MS-TrafficTypeDiagnostic: DBBPR04MB7595:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB75958691201682F172CACDC9C97D9@DBBPR04MB7595.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:335;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rHGVLRYWYGKVb6npXfl1ztdP6jKIa622qggNSeuaysudi7zAp/NYq7X3ZBGlY+0d2GNNSpCbZaYKFC8KLC+qTjcTWYVsProZq6NfBnnzBo+PNl1d9l/Rbt9BprduiTsYpb/zhhYeeqLxVAmi+krFTm+U/0pkujAsCis/9bPzMXRxHVy6Y2Hg2znhO/chDg5ZD+UXV65AEABEwN3gqD/BiqINvmIR8Y4MmRxzyqC0P5vnLz+9a6ZRSWzvov/inYKCmhK6YalaJshcTy9fT9GRXKiaTq88tzKBl+ICzKGhZ/o/7ZXu4kytpl6ci7iU0sO+UJ2sxfUUc1EXgriHYP5s/D+1FJ3oYZhFT1mg00842oC2zled2yHe1NBmXn03RV8yaZA1uplppH9UPX3DFiY8x1Xa3HRf6VCuMA3vzGU9jazw+oloo8ylqNJSJSeY0q76EbJ8jzixbOFmgYbgVF//f+UzGyQGuEi38YTer9SC2gvRdC9//FDvPpB26bELCd3GrZ9+u3tUAUq55bFgXBgmsxKHytyz+w5LBqxAjUfuiIU5QMPPTb8dYbdD446LR3/u8tjhazuEA0CMq7OP/Vzin32FrlvrN9ArlQ07pKP4AhWF5V7vUI0Tko0BT0bNOppDfxTV6Em2/jSpblvnbOVC33laOEwkkRWU0/LF+i3OgJWUVnV6z6TJUGbN7/0gnWCJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(9686003)(66556008)(2616005)(86362001)(6666004)(6486002)(52116002)(956004)(8936002)(66476007)(38100700001)(26005)(4326008)(6506007)(186003)(83380400001)(16526019)(478600001)(7416002)(6512007)(2906002)(69590400012)(5660300002)(316002)(8676002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?U2yNEbfVhbntWUmTlJS+1Fmpgqlpf+RvbazWC4Y7yeZFBbPzuB1xN7VFOiTh?=
 =?us-ascii?Q?awmDF65skO+PVErWIearReAgXYIC9cOrm98yv0BFG208BplPMHIhjU8O5V7V?=
 =?us-ascii?Q?CUEoOO7r9J3YUUItsBLyRvdn3NeixiLXRWncYhpUEOLG2Rl8kOdn6+YY2pn2?=
 =?us-ascii?Q?nDBt91fMoq/1q1xQZ7ARS+SQd4Hp7jFWkwPYWvOq5tpCisIyAdQIAIFJUV+0?=
 =?us-ascii?Q?ees84AgIvX/ZAnho8JNFrNPkeMW0zw6VrA1nT9wwNpXajGEdKKpp+mXSHSaT?=
 =?us-ascii?Q?uEujNlwbNTVvcGrY9EDHP8YL3hLFVKQn93CfNQi+2nqq7xy3Dqjxz289+TFx?=
 =?us-ascii?Q?ZO5TO/rZNBU+KXTbdBMcWXnOOtHtSULb+LKEKuMRP6yjOwOJNVXuul7FslJb?=
 =?us-ascii?Q?yGfEiRcARnQ1KASCE14u1kBLYzYGmdiXYEK2OAAtzlhK0FIB1gZ6qqsxw5P7?=
 =?us-ascii?Q?OcTDmALitfYM7/kX64dzN3k8j2scuhJZ/VzUZi5r/10G891M0jotyp9As2Ee?=
 =?us-ascii?Q?DcI/VdpX68cwS7rS+s6FeIv1nt7S0CzorN0VjKFL92xoAqyOspXSl78W0h9g?=
 =?us-ascii?Q?1TLmdOIB/Epf5Qf+3CWTTgOu5q1w5rv0dZljTk35wqNRDYP1oZe+JSkcsfQy?=
 =?us-ascii?Q?mXyevg2Ggg4g/kbQ4p96aMm4wxC6PjAUBHO+nmijzlL0mlXlu8JHb9n/iNmo?=
 =?us-ascii?Q?fr+teoCU8VPh7H71Nmvplwqz8ZjYkrd9o5IZ1+W2sldDtkQzbp/cNzRZo6g+?=
 =?us-ascii?Q?T5GuiiqcpEOkxUsRsbI19ReKD+pgSAeAZswWLgEdGbSmAmDEBEoIu3Y+NhKQ?=
 =?us-ascii?Q?mmpuDqV/UxnHwIql6n1+1BeYyO3YcI43SectlMZPowjCzgj55QOyUaYJnpwp?=
 =?us-ascii?Q?1SX8fpop2SL81PLksDJJfmHtWFZwlxXy1jv9L4aLVodl6q4BpIA3Qgk3/gcb?=
 =?us-ascii?Q?/jrR1qhZeETdC5gVpUP9ItIv58Yb/pnMROxznTUCohSPM/op+oez3cZk2/Os?=
 =?us-ascii?Q?lNx31eL51lp4WNcURxxyQ94urI23tHx8ZNrvAcvBOmYuQEbji7ohuAPx4SVq?=
 =?us-ascii?Q?bATwH3V+x2wM6KIHq/APdf/XXr2Iq1yufmFosLm2p6UgdEUo2+AlDVHQQ0tE?=
 =?us-ascii?Q?H42Irjj+g0JrpZAYHUGD1IyrhfNDOGV7PUbMs9Eqvba842Cn+O6yq3o7ULcF?=
 =?us-ascii?Q?mU/w7ng7k/0+dbdb0+iYiTXkHTngB26rhkyzcenG8civ4LHD2fOZ/xz7EiUr?=
 =?us-ascii?Q?2vcEyT+bNuGr5FjidOFuVUdL1Jcsqmo9Rmf/l+ZBtrw3ND60uRWG9WlKKMUY?=
 =?us-ascii?Q?sU5B0upSJRRUN3uSqP2PLtYP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d586f34b-0ddb-4c80-6286-08d8f35e0fbc
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 09:27:39.3552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q1PFm1BeqXHSSH09dQoxOnpc2Dp8moFySSc2Ldmg0683mvYV60a/zgyo8zKcLN6xvpM1udqZXtdTZKIPl18a1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7595
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX8MN/P remote processor(Cortex-M7) support, we are using ARM
SMCCC to start/stop M core, not using regmap interface.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 89 +++++++++++++++++++++++++++++++---
 1 file changed, 82 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index b911a7539897..c0e96defe2c3 100644
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
@@ -119,6 +125,36 @@ struct imx_rproc {
 	enum imx_rproc_mode		mode;
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
@@ -205,6 +241,12 @@ static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
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
@@ -246,12 +288,24 @@ static int imx_rproc_start(struct rproc *rproc)
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
+		return -ENOTSUPP;
+	}
+
 	if (ret)
-		dev_err(dev, "Failed to enable M4!\n");
+		dev_err(dev, "Failed to enable remote cores!\n");
 
 	return ret;
 }
@@ -261,12 +315,26 @@ static int imx_rproc_stop(struct rproc *rproc)
 	struct imx_rproc *priv = rproc->priv;
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
+	struct arm_smccc_res res;
 	int ret;
 
-	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
-				 dcfg->src_mask, dcfg->src_stop);
+	switch (dcfg->method) {
+	case IMX_RPROC_MMIO:
+		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
+					 dcfg->src_stop);
+		break;
+	case IMX_RPROC_SMC:
+		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STOP, 0, 0, 0, 0, 0, 0, &res);
+		ret = res.a0;
+		if (res.a1)
+			dev_info(dev, "Not in wfi, force stoped\n");
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
 	if (ret)
-		dev_err(dev, "Failed to stop M4!\n");
+		dev_err(dev, "Failed to stop remote cores\n");
 
 	return ret;
 }
@@ -600,6 +668,7 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 {
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
+	struct arm_smccc_res res;
 	int ret;
 	u32 val;
 
@@ -616,8 +685,12 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 			priv->mode = IMX_RPROC_EARLY_BOOT;
 	}
 
-	if (dcfg->method == IMX_RPROC_NONE)
+	if (dcfg->method == IMX_RPROC_NONE) {
 		priv->mode = IMX_RPROC_EARLY_BOOT;
+	} else if (dcfg->method == IMX_RPROC_SMC) {
+		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STARTED, 0, 0, 0, 0, 0, 0, &res);
+		priv->mode = res.a0 ? IMX_RPROC_EARLY_BOOT : IMX_RPROC_NORMAL;
+	}
 
 	if (priv->mode == IMX_RPROC_EARLY_BOOT)
 		priv->rproc->state = RPROC_DETACHED;
@@ -747,6 +820,8 @@ static const struct of_device_id imx_rproc_of_match[] = {
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

