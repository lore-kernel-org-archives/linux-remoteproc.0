Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3002EC433B4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 04:25:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1496F613B4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 04:25:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232831AbhEFE0p (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 6 May 2021 00:26:45 -0400
Received: from mail-db8eur05on2055.outbound.protection.outlook.com ([40.107.20.55]:21472
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231407AbhEFE0n (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 6 May 2021 00:26:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOO8/+kMMbgqqN6cB3+MZTPuXWojbUPZ3LBBAxPBISAXkBMbf1mwMTUKaLUigVQEhRRhwJTyl9XUHt4Lf3AJtbulmGNedY19dasikW1FSLo/IgixGDs4Oh1P98Imt2zNSC6fFvc5jl2OAys9L5hxS/HG1FB0rrRdfSGP17inQ9uQn2M0oDXhhNY1I+rLogu/euuPb9infpAtfs/eLIuoTClRXIU2XoIbFKXZ5lQujK/B8Bvmd/AK161pRyLekSRiWHA19X8PYOggGixn7Hvg80tYJEBbZdotJWTc2j3F8eEmY9gKbKJLkZ3XHd2FVW8ZyV678k6eP7oW5yp/YILKEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+f2shXecIZnDZ+S4uhohk7pr+CquYnO3csfOkvbeX0=;
 b=dybX88V7umUOsvQldcfLFlMRdKNt4cgmfHYVcp4XNGlGU/hilteqYcYdHt3epvhws9rU5QORBoEwyNI2Gkn6O4ARoyiGRKxbLPmQbaslBPiUqSIBK3bQYYcZBwAFhH3YAtq6BaoQYdTGsuNMFoDIrN2edu7ZwfMliYL8c1f9t4VUBwLVr6Hjw+gySEYUXGqqiKT4DBh4iv9QZHQDJbzkiDSwvSZsL+BfHwsNeBnxFTmfelOuTF0SSGOTDUs8zI+Sm+b3WUJAAjCWbFqt0CX86yskAAsadE1XIR2lizL+uxAKmzrBgIgBfdjd21BJUIEaW4mZEok2Z4mzqyk5xTpoSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+f2shXecIZnDZ+S4uhohk7pr+CquYnO3csfOkvbeX0=;
 b=aKn8whlPi2Oc68d09wg4HOp7+XMH3e86OyoVnO7Ovj2Jz0nIvO4owHpZoeagV/UGAXza8PT6PCR2fG0e7Gv+3cVLMzsOL6eeQ36ok1gQ//+3f7mTwghTqNL8EAcMnVVzlzeX/fpehZ5l8UZVeDTTHafIeCDCSfHWjKV8vKUMC0M=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR04MB3126.eurprd04.prod.outlook.com (2603:10a6:6:7::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20; Thu, 6 May 2021 04:25:28 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4065.039; Thu, 6 May 2021
 04:25:28 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V6 8/8] remoteproc: imx_rproc: support i.MX8MN/P
Date:   Thu,  6 May 2021 12:08:43 +0800
Message-Id: <1620274123-1461-9-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620274123-1461-1-git-send-email-peng.fan@oss.nxp.com>
References: <1620274123-1461-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:54::19) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0055.apcprd02.prod.outlook.com (2603:1096:4:54::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 04:25:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8049edf6-9bb6-4eb2-b734-08d91046fa55
X-MS-TrafficTypeDiagnostic: DB6PR04MB3126:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB312618E75F0D486794D0ADB8C9589@DB6PR04MB3126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:335;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5FI5pdB0fUsEtz4k4vwD5MzfgEeHx6NnOMRp4IJBNc+cvavBimMkYmh8exGifc5X2j/ziIaQuQimKSaDRZkYRPsYWAumZDwd2GeShRB6dNrcooxYuCFJPHq1kvcexkbuGKOknVo/u1OD4cKmppvK5fsnrmyRJnxXQ052cgOE6X1sjcPJIQ6Pl8NbpKmYxf6fg7gi5iIOrxZTT8lFu2mxOLIzfvZe/5s6y5qJ5x3ebjUgSlz672NMq1Vt+OKZ99WCojanb38Yl6EP8+VziVIgPjgbo8v0vpsopaWkOXVUYgF9VjslsC/cgMUHirxjZX8C12UdGMMCTOq8NasH8S7/ZWHaUavQWwXa5nmF2ylZWcNGWvfPbt1P7/T9bhhyG8Ey0x8CXgYToG/LWUQqoqvjvdha68WoshG5zwg5+NLnXYVFWuPi/ut3Cj67L45mdAMUv3gxAJs34Px+uLRIZCOzy/VLxkssuER2BMuFJsVvPeoZXHbXTEQ1jsqYSj1mQnS1I7f4SbFDjLs0GLmdPdjPEFseqLX6HHIr9ko4julQ0QC9uE6Rgs35oxbdghdZaNCjvqg3FOJz0SNbsHmb8ouNzCKrRkEbhsZ3uSdXiwge9iXEb8eTNVj2HQOCMyThKKl8lswlxSGijqVauhdeIVyL0YytI1XtnOi6ugmYOowNljIlH/gjMl6xKSIlA2Oww2XQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(136003)(396003)(376002)(346002)(26005)(38350700002)(52116002)(9686003)(2906002)(66946007)(6486002)(8676002)(6506007)(16526019)(7416002)(5660300002)(6512007)(38100700002)(186003)(478600001)(2616005)(316002)(6666004)(86362001)(66476007)(66556008)(956004)(8936002)(83380400001)(4326008)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4g9h+pziX7fokBjld2Mta+pIZNq0sveRM6hg3pN5BYnjkPvrvm/zRYH5IXHn?=
 =?us-ascii?Q?QCCkJevzlb7UW2qXxEXRhlTyXrkE0b3uyk7p3BlBZsfDGHZenb/NGsJ4KdEh?=
 =?us-ascii?Q?mfC/h1kOQvew9nb68wFqWhXWgZOSMV2xyOOrdLpjfQywZ4qd8gQqm8acqZRl?=
 =?us-ascii?Q?+YieIo5T/i0HSHRFEa3GSlCekRJwmeW98pg5KQiJjUj6A0+kiyaLkHxMBaj3?=
 =?us-ascii?Q?iqyEXk1wC2xgYYu7uHq3UguLoYxaAbSlAUCZXXRrxWbt83JQ9ptP3m0/3ZYs?=
 =?us-ascii?Q?Xab2INGb6my41UwHt76siv9HiHBIKs4Qw3mbQg/GGcEKq3zgGFtfE+Z2CahS?=
 =?us-ascii?Q?zyu9UKgrsDGieSY3vzCtS2OD9bvbZWPHhNmo17wyBJmilKvG9xCY0sUeT084?=
 =?us-ascii?Q?Xn7T1hRm+B3+QVfh8pbTohzgP5ZTWoWnCypPzxyGL7mF9S/KMrVJ4HsQVFc1?=
 =?us-ascii?Q?gSCJQ20cbgiteTMlg5hKlj+c0SMxEHba5RUIqPuQELnauBiripaVtXhAPElO?=
 =?us-ascii?Q?6NQPS4j58gZYzcqKvF4KgA8/PJnogVe0VvzBI2ya49PPOHBMWKA1sPRAvOfa?=
 =?us-ascii?Q?NUgiMkT8TOTI6/6iP+NSsYr/f1FhbhRrGlWCl8pDLHzWnXepqBLBqhjmp0PE?=
 =?us-ascii?Q?JZcQFm6WlCGZmpxpC4WJMFiSrNPb7gZaxBisPboQmwqIxrISyibHOfCRihSf?=
 =?us-ascii?Q?k1N6qrRo467LRfR72GVGE30L7H0YRzBW1Cvty2isWi8A4e7I0EsCZvJjIEgj?=
 =?us-ascii?Q?Jlgt/3dslGQB6++XW7HD01h4Ow44sukJvIvnZeuMyXI2b96jyhmsD9eBK6pH?=
 =?us-ascii?Q?RwMrMqcJ501VtvSV342L+Zw+GKKpVsN1Qcg5FgUADuFmwPFuCNUTHZue66hk?=
 =?us-ascii?Q?Ap+d1g9v/FnnOJw2RjiphwTmj+dw4PmXomMkQmoCoudZ9aSBIJY5W2j/KXO4?=
 =?us-ascii?Q?MenNJgXWcxPzaJtXhYhFi1U/W3NJiQmBrXrYa2VlWedjPbmR+LhfHWyexzsR?=
 =?us-ascii?Q?h3fdiWSaGmhzO9P1egtIRnYuPX5pUOj9T/XizB2sSiZJzHWkC2hU3OLvXOOG?=
 =?us-ascii?Q?KCdXjKLrkrgvyEI6zTS9BeROhwMNIQ3Fg45m5lqPz0+ecGQIr7/LIlCMwuUS?=
 =?us-ascii?Q?TUSZsXHxNDuVS/jT1i/vQ3xf8LM68dbF185saq4HlNuukzcFnP/4bxT7+ibA?=
 =?us-ascii?Q?eSX43a99wn3yDcHTbYutkLZuENFKZ8X5jy+T21Z0jF66AjwadkHarsFn5dWR?=
 =?us-ascii?Q?LJiTW2npeEpGQxChwiyovUswddSFidwNK7j9NKIvw+zZX0tFvJ+qDaiG0zvJ?=
 =?us-ascii?Q?dXU6A+V43+1QLQ+YEaaDuVag?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8049edf6-9bb6-4eb2-b734-08d91046fa55
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 04:25:28.6291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vm5icW8wRtRi+AFXlFGovjzo1UGnWHUr3iJLM28Y8aD/BUD0njr09tQUlglUP9N4L/rz2V+2YB+EMldfcF+hnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3126
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX8MN/P remote processor(Cortex-M7) support, we are using ARM
SMCCC to start/stop M core, not using regmap interface.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 87 +++++++++++++++++++++++++++++++---
 1 file changed, 80 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index d26254609a52..7cc0cadea1cc 100644
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
+		dev_err(dev, "Failed to enable remote core!\n");
 
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
+		dev_err(dev, "Failed to stop remote core\n");
 
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

