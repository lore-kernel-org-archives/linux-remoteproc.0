Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E103C43461
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Apr 2021 13:43:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41D7161008
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Apr 2021 13:43:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233309AbhDONnn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 15 Apr 2021 09:43:43 -0400
Received: from mail-vi1eur05on2083.outbound.protection.outlook.com ([40.107.21.83]:20416
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233312AbhDONnk (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Apr 2021 09:43:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fksAX73Q8d/chpKyAq7Ey8VZgLW8pGWlU6VeYZit4VmzFRzlhjBPm/4YSp9hLArdLyA0Sq8lOLPQAIYQnuvBPupl1I/3f3OYqKgvy+pf8JmofhiymP+0P2x+bHVgWvRnrNLRm8Txx9Le/Ets5PI66esyoEI6mcinYluqZf1JWygrGeub5u3FkNgotGw2tmFdXBryQGSgOMpGD9R8WAlQ/FFgEtme2c9ehsWsY1hNypYViF54TjCPHwvAyOnhlvcHjoH80mptqDjqYYsWX3bAUyMQoWxVASuM0FiW/mCumvmoUZY3DCnJul9mBQSFpZxA0zszx6asozrfeS2dW8pcxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Irswd7lUzB1pM9KD5IwiTaCbYnT1kuWoR+EHA/da7s=;
 b=AFwNdvoT25RqwgnIjC2/Xs+QbefxgSVzwjqd63cXmuAB8VwOP7tQZgTd1RiIA3NZyyKqzKU++dYuoF0bPEvOf+HyQ8oUMXr/tfJWwM28+56R/WrLn/QxI+lrMxNkj7jjoUOvhFt0ywblm7Q2IiWgoIWn8qmfABXjuC4/vnByRmS1tg2Da329RJEzyGJJTLxQGlSu9J8eNgPGKO0T1+YRO9Q7qyE28YMFrfmZAJFHBwgqi1NYH43y/bYYUW6w2zaw27Mfy3piE3c7YtA9F3iMwSJJwKPX/XDworoOIkOWHbhZ9mq61XTY9ECv7APicrqPeAgb44tZ2SmQk2g/RZ927g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Irswd7lUzB1pM9KD5IwiTaCbYnT1kuWoR+EHA/da7s=;
 b=TwadtdIcFywuuRXXwsTKkv5MxX2iVe4JiBTk88NGycs6YwUdZ4M2tPcqkUWZRXVnkzJ5ZqhHBeKZfPtCsWQhDdvKdHWQLBlKmChN1kB+Mw8Cn2p6Du1prGSA04RcmvCD/G1KxDko02NRe5qQAFvpjC6WclvFq0LanBrXSTYCeh4=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5241.eurprd04.prod.outlook.com (2603:10a6:10:1d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 13:43:08 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.037; Thu, 15 Apr
 2021 13:43:08 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V4 5/8] remoteproc: imx_rproc: initial support for mutilple start/stop method
Date:   Thu, 15 Apr 2021 21:27:38 +0800
Message-Id: <1618493261-32606-6-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0132.apcprd02.prod.outlook.com (2603:1096:202:16::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 13:43:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b5b5b53-7d28-4658-0814-08d900146757
X-MS-TrafficTypeDiagnostic: DB7PR04MB5241:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5241A13C114F98ACF49C665EC94D9@DB7PR04MB5241.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gg6BcXCxmFThwXJdj7uufLfchYHm6rglahHY+vcEnaGpfu72f5F6PU8OGwiXq4fQY3tAypOxkIWl6ARW11hd0lexYBZ7E/HfbN80PoSUKl28vYNwT82lY7Y6SHfUQjRcC+qzoDY2L90t16/eh+fIwA6LpqT6JnQ0NKNcm/C/uQRo3m3tCBMFgp0YCKpwhYZn3VDbVU3nRgO/sFO0QrNx9ny84pjErZcACJepNSkU5RT6JakltD3TqQrDYzn+2Tjd2WjLLSx/fGZpzpBczKkkgc0coW/x3BcxuYECvHcPHbfXIWJDHOSk4djVCIVOEvLcjZa7IaS04yP+0K23e9YTCm00hePo+f08kuYvwM5nyzsbPyXfyZMaPVsH3fuhVEANHV+OVytyoQi+yfk6ejAayNa61O0Cc0LEKpBd5Zp9Y14sNWqEsF2GBXW1E09jmmEmW1+zOK5FnuhA+GLEaHRoOD1aCpPRCy42xRZQJF3x2dM7AdtItuRM4Ofp77INE+i/FxVn2Xq/83kUTyfQNTeR32fRZW03tLgoglNYVHqlT/wJKWaC0D3BJU7JIdJ5b4T5mKWGqspx5mN91x/V2IEsW4KHfXpx8vLaLG+/zayO/wdHV2gMYR7e0XSkxIb48pDPBGW22h23blHGdAtK64tvdwIH7+ODn+HNb/6+1ESqvbT4lS1Rln6deXFRzL5yeK04
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(6666004)(6506007)(26005)(956004)(186003)(8676002)(16526019)(6512007)(7416002)(2616005)(4326008)(38100700002)(38350700002)(316002)(69590400012)(86362001)(478600001)(5660300002)(8936002)(52116002)(66946007)(2906002)(66476007)(9686003)(83380400001)(66556008)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EBohXX3DstWIcqqHK4O8WyDSPXPR705xFuqkS6EsigEdQztadhUF69syf8yU?=
 =?us-ascii?Q?zGZKO6W5u165/AUh0vjlc1YiPfo0CoARqazbyXD2Y68BW5sSGIn4EI2FtAqe?=
 =?us-ascii?Q?PaWczJe2cZoCpcBUtiMTH6agoJlNzx9AA5nxb6d0wQ8mqIZuiz/izBYPucpl?=
 =?us-ascii?Q?jLKkBpFvuOii6IKZqaaMjwE8oHuHgsHkLmTWXJT7qhlGxesWnrNrHQ8EwXEq?=
 =?us-ascii?Q?rC9ecx5bcGiP2Wb00JHd106axIEubqnXCXh1q5DvUSjEopdNjK/mTGbvbA36?=
 =?us-ascii?Q?oywxMTORkM2Y/+KJhg6AzD/qAlp/EYQHH77XiMfKR3yvDBjg2uZXcnHyCCwq?=
 =?us-ascii?Q?Fr28JQXQR7AAnndNmMitClmtEtivWvHhlGeyE/tja0fzzPv8xYHoant1aBJP?=
 =?us-ascii?Q?CgLznm7H75luDvdE+tFPnOEiQZQgtNEdezScCJqIPpA1VNii/OoRPY3ifnmP?=
 =?us-ascii?Q?YGnKjt2zWL1a22LCYIR5o7cKf44A5nV5HkqAK5CP+wAcJfTButXOWPcuTGr6?=
 =?us-ascii?Q?293kgGTag/HO2R8iwff+ztelV5RMq6uR8Go4jW5+ib9DY+w8i8GVzxLQIY9H?=
 =?us-ascii?Q?5B5wz3bK2n36Cr7D0Jt19uNuY9RFuY8TrZRwyYRGuSRyfezlgJZ9E58Erb+v?=
 =?us-ascii?Q?u180eJZ9sAO8OS1ep+UOnnPbaUGzqt4LYvhGeHqwiFIOyXBzl2paRs81idbD?=
 =?us-ascii?Q?jIz1/4AQJTHrnBsuFaIMChVdpwYBbRNLcIL2MEN8zLXabAQXIdHT0TkUkzaN?=
 =?us-ascii?Q?Ry4qPiLacH4cfgAfM1CnPyQjHjVjT0+HMzhnI4dKmtLKAJSgfKvQ4EYw4Fkn?=
 =?us-ascii?Q?dSjhVhOhNmCXvnT3lRpUlDWaIqiJEplDyfyyszGORDhJ6bnS44EIrBAvv2we?=
 =?us-ascii?Q?JDlh11dboq+7jQ93HeMbSf1SY7qxoM5EDx4tyMIFvjj9cg/pDj1KBgI2RJBc?=
 =?us-ascii?Q?2dZA7ZXqMeuaXAXNy1xaMgzTvOchnTRLoswSIxzNDMsSENOZMG0zyXibAdqr?=
 =?us-ascii?Q?aEQCmYFCxDmHMdVQfVmWPXaAF3e8mn0A68zW90of43wg9K2/wlt6P0pOHXWN?=
 =?us-ascii?Q?3Li4azzgTnUHvb6CB8Og8jWBmen9c+vTA/zYZpO4U3vVKnwd7LgGE4Hm/9XS?=
 =?us-ascii?Q?Erb2XEWw5J3UO4VOy5BTOVrtBKqucw3maJhCrvD1vsIRS+awZUJe+Xz7FCiG?=
 =?us-ascii?Q?wOqvTf2ienLznD41uesiJCjezmCQeGpZDfkMzCNerfeW98SOKuTnbp/ifJG5?=
 =?us-ascii?Q?LCgO2CtJNL5NxhhhPvtaBSB6AcdXQOWy3v41HwM3yivKWk/eYHxT1F4Soxad?=
 =?us-ascii?Q?0ztZ7dQkcrbbPs2wkmhhhLBQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5b5b53-7d28-4658-0814-08d900146757
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 13:43:08.4168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9a7RefcUq/pMox3u483bTnTZN+XLgDfw1/mEbp0sFHbRkcILUcKebPCVpFw8204S/B5T1GFc/elpMayAI6vhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5241
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add three methods IMX_RPROC_NONE(no need start/stop), IMX_RPROC_MMIO
(start/stop through mmio) and IMX_RPROC_SMC(start/stop through ARM SMCCC).

The current SoCs supported are all using IMX_RPROC_MMIO, add a restrict
in imx_rproc_detect_mode that only SoCs using IMX_RPROC_MMIO needs syscon
regmap to access registers.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 51 +++++++++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 06dac92..2b633fd 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -74,6 +74,15 @@ struct imx_rproc_att {
 	int flags;
 };
 
+/* Remote core start/stop method */
+enum imx_rproc_method {
+	IMX_RPROC_NONE,
+	/* Through syscon regmap */
+	IMX_RPROC_MMIO,
+	/* Through ARM SMCCC */
+	IMX_RPROC_SMC,
+};
+
 struct imx_rproc_dcfg {
 	u32				src_reg;
 	u32				src_mask;
@@ -81,6 +90,7 @@ struct imx_rproc_dcfg {
 	u32				src_stop;
 	const struct imx_rproc_att	*att;
 	size_t				att_size;
+	enum imx_rproc_method		method;
 };
 
 struct imx_rproc {
@@ -183,6 +193,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 	.src_stop	= IMX7D_M4_STOP,
 	.att		= imx_rproc_att_imx8mq,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
+	.method		= IMX_RPROC_MMIO,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
@@ -192,6 +203,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
 	.src_stop	= IMX7D_M4_STOP,
 	.att		= imx_rproc_att_imx7d,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
+	.method		= IMX_RPROC_MMIO,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
@@ -201,6 +213,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
 	.src_stop	= IMX6SX_M4_STOP,
 	.att		= imx_rproc_att_imx6sx,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
+	.method		= IMX_RPROC_MMIO,
 };
 
 static int imx_rproc_start(struct rproc *rproc)
@@ -560,19 +573,35 @@ static void imx_rproc_free_mbox(struct rproc *rproc)
 
 static int imx_rproc_detect_mode(struct imx_rproc *priv)
 {
+	struct regmap_config config = { .name = "imx-rproc" };
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
+	struct regmap *regmap;
 	int ret;
 	u32 val;
 
-	ret = regmap_read(priv->regmap, dcfg->src_reg, &val);
-	if (ret) {
-		dev_err(dev, "Failed to read src\n");
-		return ret;
+	if (dcfg->method != IMX_RPROC_MMIO)
+		return 0;
+
+	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
+	if (IS_ERR(regmap)) {
+		dev_err(dev, "failed to find syscon\n");
+		return PTR_ERR(regmap);
 	}
 
-	if (!(val & dcfg->src_stop))
-		priv->rproc->state = RPROC_DETACHED;
+	priv->regmap = regmap;
+	regmap_attach_dev(dev, regmap, &config);
+
+	if (regmap) {
+		ret = regmap_read(regmap, dcfg->src_reg, &val);
+		if (ret) {
+			dev_err(dev, "Failed to read src\n");
+			return ret;
+		}
+
+		if (!(val & dcfg->src_stop))
+			priv->rproc->state = RPROC_DETACHED;
+	}
 
 	return 0;
 }
@@ -583,18 +612,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct imx_rproc *priv;
 	struct rproc *rproc;
-	struct regmap_config config = { .name = "imx-rproc" };
 	const struct imx_rproc_dcfg *dcfg;
-	struct regmap *regmap;
 	int ret;
 
-	regmap = syscon_regmap_lookup_by_phandle(np, "syscon");
-	if (IS_ERR(regmap)) {
-		dev_err(dev, "failed to find syscon\n");
-		return PTR_ERR(regmap);
-	}
-	regmap_attach_dev(dev, regmap, &config);
-
 	/* set some other name then imx */
 	rproc = rproc_alloc(dev, "imx-rproc", &imx_rproc_ops,
 			    NULL, sizeof(*priv));
@@ -609,7 +629,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	priv = rproc->priv;
 	priv->rproc = rproc;
-	priv->regmap = regmap;
 	priv->dcfg = dcfg;
 	priv->dev = dev;
 
-- 
2.7.4

