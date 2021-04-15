Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2AF7C433B4
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Apr 2021 13:43:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C67C061249
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Apr 2021 13:43:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbhDONnq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 15 Apr 2021 09:43:46 -0400
Received: from mail-vi1eur05on2042.outbound.protection.outlook.com ([40.107.21.42]:9729
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233295AbhDONnn (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Apr 2021 09:43:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrSUvHYZW9LbMbYNUdWxN0RQqT1U9AmjlSkFKZgK9h2wr6FR2kOnOs4JAN3m3hGR92yP9tJX9QClYwdHGmGRXS7AzCkHwO19QsUxDafOgGNG6j5BBnHeoANd/Ve2lIcKW01VWEfRHqfjAZHoKlG5cKtXU6rZ773P0NQU+b6ULqe/EkNbTrXhCQsvEMOX/zNCaMA/WUVnVUSxZqt9ak7cVfunkbgCb9YU1vVJDyT+TrA8TwTt4KsdfeBnCS738grJFSUCtHLzzwApjChyin8U1Fhtz0Fr2UwGpsygBwKTMf7ilp2uivvwycoFzbjX4oT4sJsWWrVkSvumUX5rFMxSGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuFtijrZbJ8trcFN0FJOo7iX+iSDw65FhNhl95XA+fY=;
 b=SwFsTAHIdK66vveZ9gdFVsstXIV6uB3wBemMtwJmb6NHiG/t7GrflyO+VACZH3kYOLjTJtKD8jr0N6oiDgfwUgXNKfFg8VOpGX851UsDRHY0qbMzyIBRn2+TbtslwZbjRyU6HdMe8uSa0okWtSvNH1SpMKWRq/pHObql4PPFC85XhreEVZRLQzqRvoaxcTTm88z6x6Vnz3izn0d40KySjREQTkBxRtBVbALxwXqxhS1LSUjWh0QI9MVC86L5l9OSepkXqJEFoqYO3XrB70qvD2/75sxDrhwtVYm0mjaGqN8/MLagEbdktKhqFsAmGBQdul/kZ6B2Q8G3WdxKFZkrKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuFtijrZbJ8trcFN0FJOo7iX+iSDw65FhNhl95XA+fY=;
 b=EHHRTOz5fJ6eGFAyaZ6V8tZovQFAmxl8G9XQCQWqZBvwa3wVfHzuoLJmwmIcs4cSHNFghUFwRczgwFtIRRigxUb4vHvlYab680LBiWOb7KAP7BnxRLm/ly/pa+EURHJD1W26sD6ynK93qhtFE7E5sH+mR5wtiPSPF0KamUKQ1JU=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0401MB2534.eurprd04.prod.outlook.com (2603:10a6:4:3c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 13:43:17 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.037; Thu, 15 Apr
 2021 13:43:17 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V4 7/8] remoteproc: imx_rproc: support i.MX7ULP
Date:   Thu, 15 Apr 2021 21:27:40 +0800
Message-Id: <1618493261-32606-8-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0132.apcprd02.prod.outlook.com (2603:1096:202:16::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 13:43:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 369de151-112c-49ba-9d7a-08d900146c90
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2534:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0401MB25348B94512E2AE791F7BF4CC94D9@DB6PR0401MB2534.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:208;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hF4eD6aDYhZ42qHWs9eV6qj5QUMdrkXCrLyazbage1dRc2plqoJH5fYabb6VyZNlc1VcUFLvG+SG5zwvTZD8n1+vq1o2h6V+APfTifcdG6TAxXVRLQHaeJkPKz9PAga4Iz+Vg6/fXZx75M8jCsRQBq0O6MmNGxN+neJn7IhUL5ah/48/qSfyG4q2/KVYLcHaEdqt+PSJMeabw4g6dtScKXIT5pNHhMBOM+dFkqoP/hyPeTc8pccz4FzpoyIflixzNA8aOXvwlf1ji61pR52inehBidT1YXJyAQyxnEjTe18UZiOnnwzWlRJzTE+FIbmNGhgF9ETB4HbtXOEnL3w+BbyrmfB6u5VY229VBUVY9LNkFI+fYtZ9x3V46fMAj3Z4Ph7Qp1r14ZG4P+Yhhmh0Gjt/BxhlHi3o/r+kwCy3U5CuMzl34hfAg7r4wlV4QDtrK6q/Pc9tAZRMrnuNIb14/7+b45N/O6muavfvCvH6ZYX+l2nZdnuJEF9RosLfgFv/5EIE6Xnke8sNSVCUB0lwk5sVfeGP/rYTLBqhij4fW73bH56zwnlPURX8w/ROTZtRDBgkStQMs7Hv3tHxBGQPAdVcgJBRNGDbngL/X8CBmrS21xomWqJ06pI6o7RNs6nkmyh9GBrzrGh3ZRtJN40JUhrfwTsQEWjq3/LSwfg/PZjL9s/NvpAu0meRG1phuC1R
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(26005)(6512007)(8676002)(6666004)(2906002)(38350700002)(86362001)(5660300002)(69590400012)(38100700002)(316002)(52116002)(478600001)(16526019)(186003)(8936002)(9686003)(956004)(6486002)(66946007)(66476007)(6506007)(66556008)(4326008)(7416002)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3PR/UUAneGez+5fzdNP6NaHuf2RoYNZBl7ScFQMPsl3OCyedO24wfwP9hMXl?=
 =?us-ascii?Q?QHVuarBISrlpuuNpRK8D3aEKRZUHcQjtfh1utUbm52hhGG6Dtg/iimbUyli+?=
 =?us-ascii?Q?qqQMMqUnsp+F1gCXBYZ8GXusTznKFPB7dGBdW/rX7wMMzB/tEpz2+EtCvcRO?=
 =?us-ascii?Q?mTlb+wj7NLP4Q7/55xUeAMmxq7+eHXtpTUiEUjn50+z8aFMLwEjgdg4Fw0XM?=
 =?us-ascii?Q?n8Owlz0q9h6FBkJ6ynpf9AYTaKdX1FMlJYXYaujTfxvWsigrHJzM8Hpuf3nw?=
 =?us-ascii?Q?Cqf8shMP/85JLPAqTNWog1wkEQKjVP/+fl0BtJOrSjyX308Sg/mj1VJ9BNZo?=
 =?us-ascii?Q?U9a+zd5WpOfxpPR3xykbSqiEJOtwqwhjjjL5LX4BhKyAzIU2vlkNQYVwpAN0?=
 =?us-ascii?Q?ENBsXsZmvMjdU98xe88CqmeiMzjRF9kiP1Kzi9MY6FxR6ulrDGtFqoiZrEdw?=
 =?us-ascii?Q?GLf7nMrMBVApvIFQZNjYfv54dO7+gKhi2N4KMSPfcplmuRnR3AkSse539Bep?=
 =?us-ascii?Q?SrdwZSHpfgdzch/ULLJe5Idh5Vo2kMpHVj1n77mzgoaH0JlEQLawwSHMUJWR?=
 =?us-ascii?Q?RnNSBBce68ViIBe0YmIavi4uFYoZqjVBGDQQF4Nz9wU/mOjQ+wPl0PvCg1Tw?=
 =?us-ascii?Q?WBFnJJo11cJSelDO+q4renbTrhtEiYSmYK0KAb7aJHdhnPLe/M0g06Cf5ail?=
 =?us-ascii?Q?GuBeeWc9ra48zWPO3HOQnstXJj3376US2sy0Rj4XC5slH5Thg4XmiYn90Ka/?=
 =?us-ascii?Q?zx2Y6dWnEkbIc1ZSZUgTecY9DQGR9R6wAjnBLH+tze+7K9n1leg+OTrksGml?=
 =?us-ascii?Q?I4UlXuTPowSULQLq+das6GCMyTnsoDV+8Qox0YaW+CDjZZadPZDjsDNI/Ydn?=
 =?us-ascii?Q?wJ2olKrFAtJT2WC+wZxipSKMexd8R1mu3mgOfNYrrEIDdGSAYe3rSCYJp444?=
 =?us-ascii?Q?WCIXByO13yUWPw1LBB4l1BaDXqsy4srGbwlk/3XZphviG0fmvbQK4L2wHm/b?=
 =?us-ascii?Q?wcIvXXvf/AcgIcXcfF6kDHwbhe9KfLZCV21pso3Gkywc0WS1OjHjxfXGXBrG?=
 =?us-ascii?Q?0mY0n4TpE3dtoBsyKsUz0fnOqnrlxyD6GxTdcHHjsjeaoG7skOyn2M+mQ74j?=
 =?us-ascii?Q?JgS4KpZ8QTWGkdcAjXfA3BxBYM4dppKO/7dMouzckkG8zCOe3CGxcQQCISRT?=
 =?us-ascii?Q?AbIrRKHJF4FkBfK7l7Q/I0Cn6dX2NYNDHL2HUloDLlnDPcxIS9Qq1ByyvTxT?=
 =?us-ascii?Q?IUVeuvONuhgkfW44HqLu6ssI6fKcSPy/oe33QyKrWcmNInew2uolGWjk1ypl?=
 =?us-ascii?Q?BzmdMs9TQijYM7Vwog6Drvyb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 369de151-112c-49ba-9d7a-08d900146c90
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 13:43:17.2587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mAqxM8zttLoKKotu636im3/dGGzZ/hmjQ2hvA/adaHNF8HnHlc3gcQvxUmtjRmbLF1MVitEU7bEG5tRnqrjSQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2534
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
 drivers/remoteproc/imx_rproc.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 56dfcc1..0592865 100644
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
@@ -580,8 +597,13 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	int ret;
 	u32 val;
 
-	if (dcfg->method != IMX_RPROC_MMIO)
+	switch (dcfg->method) {
+	case IMX_RPROC_NONE:
+		priv->rproc->state = RPROC_DETACHED;
 		return 0;
+	default:
+		break;
+	}
 
 	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
 	if (IS_ERR(regmap)) {
@@ -726,6 +748,7 @@ static int imx_rproc_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id imx_rproc_of_match[] = {
+	{ .compatible = "fsl,imx7ulp-cm4", .data = &imx_rproc_cfg_imx7ulp },
 	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
 	{ .compatible = "fsl,imx6sx-cm4", .data = &imx_rproc_cfg_imx6sx },
 	{ .compatible = "fsl,imx8mq-cm4", .data = &imx_rproc_cfg_imx8mq },
-- 
2.7.4

