Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB44C4332B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 12:50:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C93C164E32
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 12:50:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbhBOMul (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 15 Feb 2021 07:50:41 -0500
Received: from mail-eopbgr40065.outbound.protection.outlook.com ([40.107.4.65]:14406
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230473AbhBOMtx (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 15 Feb 2021 07:49:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bch6H8a/dPrYrZ3Z0pi029EGRLiWUncjYhO6sHIXke65xGWXDp3mf9QSwgZByYM1vclhlIrkJease6MCyoy80Vs6LWbH6CSSF/nIFuBBvDdY7hFbKWQ8UMxZyEZAOVK0F87UhadFbJlyUQvRae0w1LHZnGTcIc9TXpS28y70BcShpDw9+hyg35MEQHsF7YuPCHOjha9jITVCf0a7ebDexWR91MXzJZLNb41Dm5ghTxJXvZot8TAX2fC0RitMiab4kQXV1f8VTncii9XJ0hxNSqXIjEhc4Hvl5HxEkcEAFZWO0P/dPSYkpNIWRo4UdOejxYHpiUBNwCmeK8mcVK4Vcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hO1+r3GoanYoQG4pSNUPhcwcRzBSJ+js42Xn0O6ntMc=;
 b=cLmvZfE0voawMar2PHk99ALuovFlkQV5/ooZZ2YbU066Xk2YodOGQs0EDT0aznyrYIEhhM4HAlNyudKxRzr7dcgCPiUHihhaU2ycQpD1wX130cPSP7cVMaM/UiZAOGqOx2lHIeUBiSOMaCxzI3Nwtnj4X0QcGMOs8nCBi5lVbx5BG9CietAq/WZFRg+gAOKFYF9sBVDqFiTfWbvgsCRTTZWUG8ecMuN2atX+PPS1bWSdjRN9rttFgjYZglWt2ctjJNS8JEv35JKTgQ2KEH7kfTNi6PA+MnDGfJBO7JnqOBUw+UDeRjnCRKEueGYZsFJ/R8oOVEyt4XpNFhC0CzlcqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hO1+r3GoanYoQG4pSNUPhcwcRzBSJ+js42Xn0O6ntMc=;
 b=a1F3h9Olwgb2RNZaNlEyDM1fkYwPwdPJKQQOjTRCDgAYFqNjiObLn5qbTL3cUKeq379yM0Hys0g5LK2BgVD2uO8LqeEukuCEpZhmirt+pIKZNtfHgHHWSeGp0caReLwgYrKHZbDx6XH9PQn5W1Xv8iw6VBsA/I6o1gsuT9G6kkU=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4091.eurprd04.prod.outlook.com (2603:10a6:5:1e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Mon, 15 Feb
 2021 12:47:07 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.027; Mon, 15 Feb 2021
 12:47:07 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V10 08/10] remoteproc: imx_rproc: support i.MX8MQ/M
Date:   Mon, 15 Feb 2021 20:34:21 +0800
Message-Id: <1613392463-9676-9-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613392463-9676-1-git-send-email-peng.fan@oss.nxp.com>
References: <1613392463-9676-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0302CA0019.apcprd03.prod.outlook.com
 (2603:1096:3:2::29) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0302CA0019.apcprd03.prod.outlook.com (2603:1096:3:2::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3868.12 via Frontend Transport; Mon, 15 Feb 2021 12:47:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2324151d-430f-4b80-f1c1-08d8d1afcd92
X-MS-TrafficTypeDiagnostic: DB7PR04MB4091:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4091BA88DF521F4971BADE01C9889@DB7PR04MB4091.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:158;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9BDGXpJYMk6eKYxx4OIqMaONMHCadXTkyqBpnUWIUhe4uQNsx2VPrtp9Cug03KgQHlrYXy9NdtPMr9YmW65Pc6jP8gidQJ/K2xePkI88WT2rEJqFqI+2vE3HYa7jsFh4qvTSQcfSoomO6Ukr06GaYy53qC/h8IXC7FIFF+7wdkFYgIJyGnB/4VocFlFlX2jBjlv/TeQ34jaaWzzLUXtL5U3u38uYPC75KiiRrFXr0G57+R4IwYWbwXyqeOmfJgSLopnhI9l36h/s5BIBeOQXXUpj+mHr2wbX9QQAnHshVATCNip/9+xM33zON7M+v+GdCLwDvj0hjptdx7VpA7gkypEkVciIOwFa8JILaW4LcUr+vLnOOQToyVORl35gG4oe8r9nIAcGl9ZsWN4vRewfDBZcM2TRJIb2xpcyLncRQ0Tdudv5MMRS3YBs+o3Y/tA1LfBF61UaAIfuq/jRzhnBsjdUu+2/YlvLSu2FwiYsL9cSoTJ4p4FyaEDq1gKWC9LEHNRctEFnk6pZR6LVmvB5xgfd3xT3xM0aoLqs6IPCNL9xBgyeBtZDS0h0BPKzzrD0yaVN4lq62GcBwogW0Zorjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(26005)(6486002)(9686003)(478600001)(316002)(186003)(52116002)(6512007)(2906002)(16526019)(4326008)(6506007)(8936002)(2616005)(956004)(7416002)(86362001)(66476007)(66946007)(66556008)(69590400012)(5660300002)(6666004)(8676002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?mE9shQWeF1iDFwRY1gbGJoh7Fbo+nIfl8Cs9JCuilre2GkJ8QngOk4agkS5g?=
 =?us-ascii?Q?bLuwrKFyyYPPI7P90msC55bwujfyRKm9l5nAHaxuhH5+F9M68n4KjJczD08x?=
 =?us-ascii?Q?FD8aIzw/Oi6py1mQwuWdpl2NIxMHkILhinVfEsOKeUbmJQynuzpi1hw50Zch?=
 =?us-ascii?Q?M8ZWtYvGwuXtcyA+iJvKJLShy5r9gXUwv5kXOvGXBa6kpAayTrY3v/GRYHnL?=
 =?us-ascii?Q?+1IdlIhEeEe2qGwYebFFxK7C6BG600rC1Zhy/6AYy98FI7ZTi6f+TgXxsioE?=
 =?us-ascii?Q?fH/skfKQ2bBkKwLsrotQUiQt8aPMfdVn/NafPEIVRAZYzkQ3yz5LL7Ia7BcP?=
 =?us-ascii?Q?eMCbg+ms3uoTuw9b58PsKvIzeXQV4cCsE7pPPujTlmtdnBT9mbsuUry4Knk/?=
 =?us-ascii?Q?MRpC1yT1V0C3koxHtXteQj716ld+x6nU2vHxQEPsAYt+mLK7QpUEXEg/eNbK?=
 =?us-ascii?Q?/Zi5z9r/PwpH6gLsXJtrrLxlxWiKpQEobhrXEhBGFkmoh7iGiBSmRjF/n0Tp?=
 =?us-ascii?Q?rnQ8gvVIDYyLusK52/Ri4BQjuPFwHajC/3YLAIcm4ALRmF1S9F4RHYlRYRFy?=
 =?us-ascii?Q?d+2F21WX2e8N7VgsZYFO7vBGKeKZ039dnA9sq9IRZlTQYLv0o2xcWLqufHEO?=
 =?us-ascii?Q?t+UdcnTz3GHK64GKDMtBi/q2aCPr/phJOBMqutIjF5DXdzfcJIi7Btww63fc?=
 =?us-ascii?Q?hiJFoWPBtrRxoM4kLp2NuiZpXGEbWl3P3fYytCjkorxA1jkg0FQtX3W5VkYX?=
 =?us-ascii?Q?l8tKeKwZ5Hcm5LgfelmeZ+RmLDBeUcpCFHgqFGAwMR0mT6Iw0gCXaFtwPHzK?=
 =?us-ascii?Q?rb93afqX7mSwrrMtUYHJwj/wpC9OdIB0phnATFj4hyx9LRnAXa+1GnYYvRz9?=
 =?us-ascii?Q?sj/qC7MWxDoqqWAlUsXlr8hcNaoBwplYIXxrbYC318GU0bjfauNKpWOpkSgJ?=
 =?us-ascii?Q?rzGfA0KsKwW5X0pXQrbDQD3cnWzuPDH7NrjIa1QSHTfso+Qq8Q88zQgvHvNo?=
 =?us-ascii?Q?0sMPNxZGCPoGgU+dvkqjqjXKWevMArgt6ylIqj4WmGwuM0mUgEoBWqKqbQDZ?=
 =?us-ascii?Q?iDLECSvU1H7uWaRfGxGxHiSM42NeH2QLbJvhIYEEM8x2tb2/FoVl7WShz2Xu?=
 =?us-ascii?Q?51CwwWsTUWExNVKh5g0+wdAHzX+dDVojW98TMf1rXY3QkLC3M4u75rhWaxcL?=
 =?us-ascii?Q?8GyNiSELAQoXMXv6pHIK9frUUgJfJ0JmiSCwVIWxvmrALEQj5Rp+T/vNMVfs?=
 =?us-ascii?Q?s3ZzJXskT6dU9nGchJ2OvyC0r+wYQvaXz0o/YRZ47wekMmt7sJSo3lmhSGKO?=
 =?us-ascii?Q?eU+ntI7GVsQ0e0qxpTXrSo4C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2324151d-430f-4b80-f1c1-08d8d1afcd92
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 12:47:07.7893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/zvyspGQMohQhRw6Mikqas9u0VSWjw9nDI5im+dtAmZ0mLYr+hnzK9dmNVxbktDF8Ccj9V1K0jAHLwWOAWv6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4091
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX8MQ dev/sys addr map and configuration data structure
i.MX8MM share i.MX8MQ settings.

Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/Kconfig     |  6 ++---
 drivers/remoteproc/imx_rproc.c | 41 +++++++++++++++++++++++++++++++++-
 2 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 15d1574d129b..7cf3d1b40c55 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -24,11 +24,11 @@ config REMOTEPROC_CDEV
 	  It's safe to say N if you don't want to use this interface.
 
 config IMX_REMOTEPROC
-	tristate "IMX6/7 remoteproc support"
+	tristate "i.MX remoteproc support"
 	depends on ARCH_MXC
 	help
-	  Say y here to support iMX's remote processors (Cortex M4
-	  on iMX7D) via the remote processor framework.
+	  Say y here to support iMX's remote processors via the remote
+	  processor framework.
 
 	  It's safe to say N here.
 
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 5ae1f5209548..0124ebf69838 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -88,6 +88,34 @@ struct imx_rproc {
 	struct clk			*clk;
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCML - alias */
+	{ 0x00000000, 0x007e0000, 0x00020000, 0 },
+	/* OCRAM_S */
+	{ 0x00180000, 0x00180000, 0x00008000, 0 },
+	/* OCRAM */
+	{ 0x00900000, 0x00900000, 0x00020000, 0 },
+	/* OCRAM */
+	{ 0x00920000, 0x00920000, 0x00020000, 0 },
+	/* QSPI Code - alias */
+	{ 0x08000000, 0x08000000, 0x08000000, 0 },
+	/* DDR (Code) - alias */
+	{ 0x10000000, 0x80000000, 0x0FFE0000, 0 },
+	/* TCML */
+	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN },
+	/* TCMU */
+	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN },
+	/* OCRAM_S */
+	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20200000, 0x00900000, 0x00020000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20220000, 0x00920000, 0x00020000, ATT_OWN },
+	/* DDR (Data) */
+	{ 0x40000000, 0x40000000, 0x80000000, 0 },
+};
+
 static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* OCRAM_S (M4 Boot code) - alias */
@@ -138,6 +166,15 @@ static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
 	{ 0x80000000, 0x80000000, 0x60000000, 0 },
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
+	.src_reg	= IMX7D_SRC_SCR,
+	.src_mask	= IMX7D_M4_RST_MASK,
+	.src_start	= IMX7D_M4_START,
+	.src_stop	= IMX7D_M4_STOP,
+	.att		= imx_rproc_att_imx8mq,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
 	.src_reg	= IMX7D_SRC_SCR,
 	.src_mask	= IMX7D_M4_RST_MASK,
@@ -496,6 +533,8 @@ static int imx_rproc_remove(struct platform_device *pdev)
 static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
 	{ .compatible = "fsl,imx6sx-cm4", .data = &imx_rproc_cfg_imx6sx },
+	{ .compatible = "fsl,imx8mq-cm4", .data = &imx_rproc_cfg_imx8mq },
+	{ .compatible = "fsl,imx8mm-cm4", .data = &imx_rproc_cfg_imx8mq },
 	{},
 };
 MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
@@ -512,5 +551,5 @@ static struct platform_driver imx_rproc_driver = {
 module_platform_driver(imx_rproc_driver);
 
 MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("IMX6SX/7D remote processor control driver");
+MODULE_DESCRIPTION("i.MX remote processor control driver");
 MODULE_AUTHOR("Oleksij Rempel <o.rempel@pengutronix.de>");
-- 
2.30.0

