Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C85FAC4332B
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Feb 2021 01:38:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A418364E42
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Feb 2021 01:38:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbhBRBid (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Feb 2021 20:38:33 -0500
Received: from mail-eopbgr80057.outbound.protection.outlook.com ([40.107.8.57]:34274
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229876AbhBRBib (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Feb 2021 20:38:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PoIuu/pB0bEhJJTRZAGoKW4whuA3jyysuXgK2rKv5AebGU8A2VCwAXagLW/zzpimlmpIU0YaYpr0s6knag0OzwBb8OPxh1xrkefTOWgyN4Qhf6cR6X+V7lU3fX+NkXQrc+RUqrxAi9QA+bKj1KFcVdDCOLLOsl1QvZcKA8mbGxMPyMaPZSSPBkHWeP3bYnxTJy+F8EXcKVkXE61uCkKGac2ysn9bbwD+uLm5vnJRET8pBtfXjKWVEo5Q+DCTQVz6Fkj44fdXOnPFAEpUSjQCrCTEPQhVCiYjLs29mgVZ1h9r3jpHk6y7QaP9a2wCNohFZj3s6w4wa7n670jy2tHeoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hO1+r3GoanYoQG4pSNUPhcwcRzBSJ+js42Xn0O6ntMc=;
 b=VO10y/XpqwZB3dea5vOSbHVJ4EmblRIG3gkAL9hmp0YZRIfWHlzirNaFiw6aOrAGFNclNmzvrFVk89WZFkdr5y92E2sO9b6sCm7rUJYfP6rTmxUQKlwhc53bYF6XC+Do2JOP0FkHqzvprzAHrUqAf18kIJWz0FwhdlhMiS7gdVoo0P6FVujkU4eqfgtIsbJw/m3hmartkfnoXqYVFt6cK0Hhn7MMVgiGbIzZXEwGNLK5U+oPMbjeARYoq7HboJ3r8/npX3O+0bN0YXQ3pLBX6Y382ohS3r3OMP2QqSuABFe5kZY6Z/U0Z+O1MZqbjId6hY6L3DNS3jXFRXjzwIrDgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hO1+r3GoanYoQG4pSNUPhcwcRzBSJ+js42Xn0O6ntMc=;
 b=ZIPJOuGJBYG8UV0AC3l6v1Wn3FU8WkOZKYswsJn51LZN8tjmmj0JyWnqfJGOoL1MgqsfIkyOfshROYVtoH+zMMFT1n+e8fFz6PllrbUfYdjoDu0RhHfZB9APT3s4SW9/dHHAbtmTJpQV40SFvVR9GY3qYwglt560hQWTb7g16UQ=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5244.eurprd04.prod.outlook.com (2603:10a6:10:21::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Thu, 18 Feb
 2021 01:37:39 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.043; Thu, 18 Feb 2021
 01:37:39 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V12 08/10] remoteproc: imx_rproc: support i.MX8MQ/M
Date:   Thu, 18 Feb 2021 09:24:58 +0800
Message-Id: <1613611500-12414-9-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613611500-12414-1-git-send-email-peng.fan@oss.nxp.com>
References: <1613611500-12414-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0401CA0005.apcprd04.prod.outlook.com
 (2603:1096:3:1::15) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0401CA0005.apcprd04.prod.outlook.com (2603:1096:3:1::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 01:37:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 340b27a6-9d96-4760-86e6-08d8d3adc6e4
X-MS-TrafficTypeDiagnostic: DB7PR04MB5244:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB524450242C092984E3A36282C9859@DB7PR04MB5244.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:158;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RSGGooARJs8LeumNRYhXYbyNkSdVDzU4VC3/R0q6iN6elJy5ttXB9xO8QKpjPR1RBoSs5lCFWkJV5dfI96pEmHnwTJPGoNnAi2QqRjA9C/1OT0ZhJt0ZuGPaJRzb7Gnp0r2hKqQKKZUwoZrfxcs5HzG8jcSHS+1xhGBlV5bbmk/t1R92WQI2gF74IeE+X9pJhqi5MojILk5IEzEVR1k8/RUodrhgjitYXhMfpKSeFqUN6tYeRRYGyUQ8/lJD2hc+kiqVJeLtRRQCE31jwFD8IBo9QLoYmukazQLTCrYqgV7AtLd0zQfaZv8pOEqsbR708nrHt65VlsQJD7Qxujkghkdu2lb9uU/UgUpTuiMBWnqg/dr0YZtoi7FU72PM+zSsIXrvjBATaOYY8fn9Gd05VwE/tj3gYnSSzkHs7n9021OfBVGnsl64ZWpcfi0xCQmgnS+MLAudh1pmuHvzdJ4TZrbWvvABiLU6P6f9j8ySKUNYo8XY1+RXeeTl8e4LuXruEHfUW/R/qr7h/78YIpedfXFLYhbOx/Yw2+RUTy2wSo53vNR78/c/MPvcQlaYC8e7ScQN94EISEcoSJGC07E8yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(86362001)(186003)(5660300002)(16526019)(6506007)(26005)(2906002)(7416002)(83380400001)(4326008)(956004)(6666004)(52116002)(9686003)(66476007)(6512007)(66556008)(8676002)(316002)(2616005)(8936002)(6486002)(66946007)(478600001)(69590400012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1uxQzqeIi5zzeNi+nfR/5sJc6RdfvUnZ/z2JgEoMZTF03tKvlCkWlUbGO5sO?=
 =?us-ascii?Q?sdkPh+0A0aOAu8dvIcdZWMmN6s3t84Hk33FPrGD7EjwBcO2JLQFpUEZCrh5b?=
 =?us-ascii?Q?qqEDKJgpoyfprfzLtfyUQq0B3iuskBaUoke+t4ltMWU6GEsM6i37FaickHIf?=
 =?us-ascii?Q?vpdLXoKZNllSDgm6cPWVU+kOsNnwKpx3NjUWuFQ2jjA5ByJWolof+evnE7Yp?=
 =?us-ascii?Q?qCBTrhU2legAaorzx818yjPmWMHcZGZQhCdXySSIG1+YC3q7mi9iU5qF3m2y?=
 =?us-ascii?Q?+3Yd0nezzZWOdsc74Coj4wDD6Dt73YVDA5uH5w1l0yAMNsahINf8pQbw9pN9?=
 =?us-ascii?Q?RDCsHpFi4exvz/JhzIIPBXjsPfic5/CMv7lxNkTMr4DSpoKGYf9uAkLbew0x?=
 =?us-ascii?Q?nwFU3U9d/GJ8AihJq8eji3eBRSNB95BU541keGNJuWsZEA7VNkfJYHPz3vHT?=
 =?us-ascii?Q?61EUcClKr7zlQvIADx2NRY5oVR8OsLyp61det1OGYWVTw/ktFvl6T9/wVP1l?=
 =?us-ascii?Q?905ilMysBrk4Tg0xd7iBDP2ZNTtGsfDGChRdwS/VtzsCWPaaLd2oDVhq9p+P?=
 =?us-ascii?Q?hMg4gkKUfVzygqrZ9LTZe5rPYsy0RTwzuWgVky0bjDfGr35RoXcOEgQkmWnZ?=
 =?us-ascii?Q?poL3BZoznU+SCo3qAvDEgRCEqihwf2oNI9NDLnp0wjljYHbQw3Iwdo+kIIBu?=
 =?us-ascii?Q?C7fIi8yFzZGgnTUlfKH21sd26M/7hTA8qaxs8I6wGR7e1Ik7aPW/auIC4Swg?=
 =?us-ascii?Q?kvGNjEIGPy5cT9i6kJ/2IElhwx63lW825pNV6qpIkFYCSJM/+FHrU7cymWvT?=
 =?us-ascii?Q?H+b9pCBB52kWBYqVzJQnt8GiNc6htwaRVgK2VJySiu9wCgWCbDqWQFcgc9U0?=
 =?us-ascii?Q?77if1Kst/o7NQUleEIkv5JfetZlP/Wa0mLwpH0FILjG3w2D7S37ODyTkpJNz?=
 =?us-ascii?Q?Epe1FhTkUJofw29KvtbXcy1JHoYOlPsDyUeaMK39UeXdENsUwkN6MU034vGW?=
 =?us-ascii?Q?cb9Uj9nECvjOmhEOZLW+qlkw4O7CboZwbun0HbtMWWkWpw+SzR5iXcWl5t6y?=
 =?us-ascii?Q?oB0T4PQjluKJqXR59H8N0pYYvVslqBL+F/82HS84VmoXY5Ftzw+zUsS2p3o+?=
 =?us-ascii?Q?1Fitsk1sTaelo4PeCus0CHJ1v6dkPrT5CPKgpNlGt6A1ivdb+nQMjAfOEpxj?=
 =?us-ascii?Q?8IzGf7VSjLHqVq9HdRTZnVu5lCJbVJz2e2ftmnBeTVcFexO1PWIhL08W3fK+?=
 =?us-ascii?Q?a262BAY3TYRP3LbEIvSZS9TUABALDmPdXfr32O7bfXhS1cDkIaWTx1Vpjps6?=
 =?us-ascii?Q?CVnFRsKoZ2WY+TBCZ8Vf72dO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 340b27a6-9d96-4760-86e6-08d8d3adc6e4
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 01:37:39.4702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n9dZqnEHlpB6POoVa3wpikH7FL7so6O65VsnEPFo2ZtSEBlGHZzt56RNYunqU8SMFD8uWpxk60+mpGsnOy6+Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5244
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

