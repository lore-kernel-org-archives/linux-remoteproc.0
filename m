Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2B1C433B4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 02:36:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0DD0E613F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 02:36:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234758AbhDUCgw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Apr 2021 22:36:52 -0400
Received: from mail-eopbgr150088.outbound.protection.outlook.com ([40.107.15.88]:34783
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234745AbhDUCgw (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Apr 2021 22:36:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3/zvzHK6c5pSPtK0nD0l5eSfMOPNDO5ClPxt1YYGUoZCJfP/0YqRqxQ6h9tKZDywsXwO7JhfF4zbhGmnDsx5td0zvZeGgNiOmkYP99gMYjPNOOpz9sOKswkRQxxlIB7pBnykLhaIISyjNPyhMGsTpOqFvqXKPfI4ZP4sOob2GZc1W7BqJFO7+XprO2BGeCL/3CrDCL5YNmgZWZyjNtoOVfDVmd0PNBfQK84Ysr0WQCMuvDyjdrxywlDKoqMsFAOW9CtbHLu0N0Rsrhf8jnEltGjDGRkuDpJ4TQaXY/ettdTG9EA4tQX6KWnxCyQj+37obcgX8Vq/bivRpsjZoWalQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyC632MAwv39LiQVDogDEQqiXSuIKRXd2m7bNuWYY8Q=;
 b=gc+fLAVzxIVqq5VL++rFJpf5LGJ5mbSaPO9YhpcDf0gkjsrKatapiqAL7GXME221cH3CpNfD0hw/yMl3N+gDV7edDuwpL6VFuaczZg+bIYDOnVYLiEfGj6zdMLGOQLjh+5gD9r2d0E+Skn4KqA0O/7PBG1pKMs4Txd0/hN+y7hvpzLoxZfm9V9RFbFt/7T6GTXGIBFX9BllS7XVi0rixizslaLULSX+/K7o8GweSrCozQBhW/beUt4gc3Q44z6skUxi19qMcoh45A3lmPLyTg3EIQNIV44jyg9VsVnycPsUaFU7XqWQgu3+GKk6t1mLcQUQezHLidat3CmPkJv0MtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyC632MAwv39LiQVDogDEQqiXSuIKRXd2m7bNuWYY8Q=;
 b=k7dJYgzo8F7ckbZ386xhpMnzZsZMCq6WkWoI5BkjiuyLnHPGJfnG7KRm6kmcjCzefs/Ci97mh3Dkw3mOI+Eqz5OelbuL9YGe1iytUXYz7DJdt/T5CbofmZuvlcEUXKX32CwxVRZd97stOrSKoernTcAC2ez7Eo+kO2Whdx45oNg=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8313.eurprd04.prod.outlook.com (2603:10a6:10:241::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Wed, 21 Apr
 2021 02:36:17 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4042.020; Wed, 21 Apr 2021
 02:36:17 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V5 7/8] remoteproc: imx_rproc: support i.MX7ULP
Date:   Wed, 21 Apr 2021 10:20:21 +0800
Message-Id: <1618971622-30539-8-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0204.apcprd02.prod.outlook.com (2603:1096:201:20::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4065.20 via Frontend Transport; Wed, 21 Apr 2021 02:36:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af8c6e34-d858-4875-904f-08d9046e3d6a
X-MS-TrafficTypeDiagnostic: DB9PR04MB8313:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB8313A81FFE67254A1D2CB0D4C9479@DB9PR04MB8313.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:208;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gozex77vbI8qbUabxXKWMR1wA8y6dgUXUyEkrzgZqtjk/VUK8rOsfbze3DMU9ky0uiDgWBhoTf82hsjMuat+DdYgpgUm3FoadxptLO6FVA1iAM3itjV4d+ZdJ85noXPERhXmUhEh6TeNwEgM1ZujEjTXFpHNQnGNRfO7sNDdU/8gWac6OtRTnxAWGzQ/RGBF6bvSogGw56uA5I7MQYEiKGmBjHQR0fIvK0HyZWwe3eFZj3ljv+Vb3UXAFAl6hzZlCZRlRMdMOgrhEhYoJ+lvpGE/sjRYRHNiCnGdfpFWvHaqy68F4GcgPEIj0EbouSp5QFq0o2r3FJZ9LwpxBT7/+8eeJOxBPG/5CcwaeyFZKkw89Ady/SO48r4uPHkIO8/GIV4tcT0w7s5fnEgVanXyR8BYScGEgxKcKkEpwkFdWmIwn4+5QKvJsjKG4cuK2zU5sDA0D+8gSSh0H5xC7gJbitRGVz9hbypcGFTRUvR0KPE6dJ7RBm2hkkExWfB/2w56l6n7aqQaGn78ZHKWXCATe43iOnQGnHOgoKZ4MBYLuHCgxrICfZfRjzTBQjpPel/UYb2HM+dHQUWMBKRYyRflsdvu29L5OhY8mgtlnA30rioGzBAQvW+JVaigwGafKsb+GrqYFX/ZvuKeXxh+Wv7elOuffDP7RXGDjHT+8XBhjEj0CAZdxGnIru75gsi8p9/J
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(38350700002)(26005)(186003)(38100700002)(66556008)(52116002)(5660300002)(956004)(4326008)(8676002)(66946007)(8936002)(316002)(86362001)(83380400001)(6666004)(66476007)(7416002)(6506007)(6512007)(2906002)(9686003)(478600001)(2616005)(16526019)(6486002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?LpPpq1U19HjZAxE0EMAFAH0OQwBu9Ulhw/hiNYpqNs0MK6oMexPbaAF9W75i?=
 =?us-ascii?Q?vhG2IDS1FH6jQdqzDerQVQUw52pCo8ee4EsTdQohP/zo+A9spWEZx0RmtFCA?=
 =?us-ascii?Q?fIENkc3ALXl+is0KMFuXKsCi2QESAzcXMYxpUNzPJ1N0PQfQtlAxEoNVbjAI?=
 =?us-ascii?Q?5xJCPfs8xuQgu6vRJSJErsxUceF7wnDg+YCQXuz8Jq0L5Me+JKQsBmzccnoV?=
 =?us-ascii?Q?TFEJK/6NvuELUkFEWhkyPXH+pyIRgUu0YkU7fPQ8MJNVIF3/qIK9ye/PWZ97?=
 =?us-ascii?Q?70Pq+W4YGeYoFAzxpv5/hk0yvRfSYugx0zo3VveHcxnLYfscjfqb9e3zTIj+?=
 =?us-ascii?Q?A1wekdNGvYFxki1vfSVLcKhIxFqUz+ZY/1MJNrmWViJnaRtExHGSF3v+cEmI?=
 =?us-ascii?Q?ZzK1rKAvh8W5oTVIsaS4rD72sAX5KnT+awWWGRoyQu3sgY2VkCm19WwzI0a4?=
 =?us-ascii?Q?yJv9JShZwbmYchsG05Sv1XtdtEKpOUUWMKrqkGMspTB8bZJ9wjXsZI0F8aNU?=
 =?us-ascii?Q?6RJ4WFfm9pmhsZUv1T/lQl167uKSI/mDmdxKvU3Z78B57xXQFi6TMdfEaLli?=
 =?us-ascii?Q?egqygrXDzdhqBNMqg9tC1kRVqvNLtz4eKcxtdPYmNU/aPnmGb1ZFGQiK0qxz?=
 =?us-ascii?Q?YfW7zbJfpW2H27BRrTuaGLQO4Gm5i94fM+WCwEz5DVsF/rg2+Y3Fl+T2m2XH?=
 =?us-ascii?Q?84MhPs+Zw9/5/Za+kNoGcPl2mc2AWmyscxm2dtY3JXsBbuTiMcX7n6rTCZCU?=
 =?us-ascii?Q?hYLin/NVobT89f39MmD+HZuKnGhoUQNJjNmz8ocoRXyoCNLwyUvNDLewo3gN?=
 =?us-ascii?Q?unLkaqLpUJ8jpuvAvoWyfFVpM+niEbyD8R7+o+ecJkZST5MielYAkJ0STrh/?=
 =?us-ascii?Q?jJR9K1N9K6sD5nqbVuIEON4d8pnkVs6cBGXGYgUcsRHgqJ1A66QaaKwQ29wE?=
 =?us-ascii?Q?xezD5z1Ou+UGd2KqDglJXvXaLuIbCq6uI4yRrOPZ23p1XJ9FgFvbTpa378pq?=
 =?us-ascii?Q?f5kyCbTdd5in5UiPqDSFYn54573XnECvZfsiIH1prGPgbcWVKGkxjW05VShM?=
 =?us-ascii?Q?5MgyqXvbQDYugAyb0ny50Jmd0MjcXadaKqWmkAyvDiI/GEUxwdoZQRGk9xFV?=
 =?us-ascii?Q?t/Jesa+UcEeEAzSLPqMX0kETrQqnjDM7mEuwXJqpZkD3ndXhKrxAnrFRQBJa?=
 =?us-ascii?Q?2D2fRez2eosPV0fG13V/ilVBS02HlDidwLkT4EZJ3iAxK1PR0vLA8rbpgAo4?=
 =?us-ascii?Q?r7TgQekTWamdvYqWKaN3WyIJI5R/ijGX9Ay1GvZCDewe6IsYnpLBgiJK3a2E?=
 =?us-ascii?Q?Mt/lnvrgLuh6yRtxT1J9eTXn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af8c6e34-d858-4875-904f-08d9046e3d6a
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 02:36:17.4652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGrv9CSM1F87IGnKgbfqfTXY3YCaWtPMH7C8ib8Da3ptL/TZ+05EhPSGXAiw8xF5cQh7ns7UiVoBDOJ0KOG3Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8313
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

i.MX7ULP A7 core runs under control of M4 core, M4 core starts by ROM
and powers most serivces used by A7 core, so A7 core has no power to
start and stop M4 core. And the M4 core's state is default RPROC_DETACHED
and remoteproc framework not able to stop the M4 core.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 49 ++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index e9d9860e4fce..d26254609a52 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -136,6 +136,14 @@ static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
 	{ 0x40000000, 0x40000000, 0x80000000, 0 },
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx7ulp[] = {
+	{0x1FFD0000, 0x1FFD0000, 0x30000, ATT_OWN},
+	{0x20000000, 0x20000000, 0x10000, ATT_OWN},
+	{0x2F000000, 0x2F000000, 0x20000, ATT_OWN},
+	{0x2F020000, 0x2F020000, 0x20000, ATT_OWN},
+	{0x60000000, 0x60000000, 0x40000000, 0}
+};
+
 static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* OCRAM_S (M4 Boot code) - alias */
@@ -196,6 +204,12 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 	.method		= IMX_RPROC_MMIO,
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
+	.att		= imx_rproc_att_imx7ulp,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
+	.method		= IMX_RPROC_NONE,
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
 	.src_reg	= IMX7D_SRC_SCR,
 	.src_mask	= IMX7D_M4_RST_MASK,
@@ -238,6 +252,9 @@ static int imx_rproc_stop(struct rproc *rproc)
 	struct device *dev = priv->dev;
 	int ret;
 
+	if (dcfg->method == IMX_RPROC_NONE)
+		return -EOPNOTSUPP;
+
 	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
 				 dcfg->src_mask, dcfg->src_stop);
 	if (ret)
@@ -573,12 +590,31 @@ static void imx_rproc_free_mbox(struct rproc *rproc)
 
 static int imx_rproc_detect_mode(struct imx_rproc *priv)
 {
+	struct regmap_config config = { .name = "imx-rproc" };
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
+	struct regmap *regmap;
 	int ret;
 	u32 val;
 
-	ret = regmap_read(priv->regmap, dcfg->src_reg, &val);
+	switch (dcfg->method) {
+	case IMX_RPROC_NONE:
+		priv->rproc->state = RPROC_DETACHED;
+		return 0;
+	default:
+		break;
+	}
+
+	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
+	if (IS_ERR(regmap)) {
+		dev_err(dev, "failed to find syscon\n");
+		return PTR_ERR(regmap);
+	}
+
+	priv->regmap = regmap;
+	regmap_attach_dev(dev, regmap, &config);
+
+	ret = regmap_read(regmap, dcfg->src_reg, &val);
 	if (ret) {
 		dev_err(dev, "Failed to read src\n");
 		return ret;
@@ -625,18 +661,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
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
@@ -651,7 +678,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	priv = rproc->priv;
 	priv->rproc = rproc;
-	priv->regmap = regmap;
 	priv->dcfg = dcfg;
 	priv->dev = dev;
 
@@ -720,6 +746,7 @@ static int imx_rproc_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id imx_rproc_of_match[] = {
+	{ .compatible = "fsl,imx7ulp-cm4", .data = &imx_rproc_cfg_imx7ulp },
 	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
 	{ .compatible = "fsl,imx6sx-cm4", .data = &imx_rproc_cfg_imx6sx },
 	{ .compatible = "fsl,imx8mq-cm4", .data = &imx_rproc_cfg_imx8mq },
-- 
2.30.0

