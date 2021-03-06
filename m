Return-Path: <SRS0=jP1a=IE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F4F7C4332D
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Mar 2021 11:39:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F7A665023
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Mar 2021 11:39:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbhCFLis (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 6 Mar 2021 06:38:48 -0500
Received: from mail-eopbgr50085.outbound.protection.outlook.com ([40.107.5.85]:40014
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230234AbhCFLiZ (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 6 Mar 2021 06:38:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMZTbel6vYBiKxpW77sLuuR3Fqs8IkXLqVh8T4bXdCZ4h1eVap9XcDDja43brq0LSpP7nFRnRicPy4vdK6dmAFTEp6fBQe2l4XPBU+JuzFpO+POqrQYLgodVKfOM5vrbq0AlIm28CUTqJQdLuAXZy814ablaRtPgP5Pgs5BbialR9c2qieDe6S1qY0hvCKogJ14wfv25OXfQG2vdgt/8UyPHbR+OEUghFkUnKV3M6wCXxRZlPAE+QiR8XOJ1zjuLJUsgBiBv6mymTnWLDRyQbM3d8zb7UlSbOuzAW9d2HBmqU6Kr+6HWVVf+Hvkye8Q1UF/HY+MuRlzpjY4TjpjckQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hO1+r3GoanYoQG4pSNUPhcwcRzBSJ+js42Xn0O6ntMc=;
 b=FTEXTMM21dctpuUWJayKEXufi017rOXVNuKj/hGYU1U9NU7R5Qo+YEa+vCy0UMkiXDNSRZuiUQKczhqWooQLNUpmgXrPNGevRIycZesyJyrThGjKg+v7+79MPZt4dXuf1dZicDrpyHIAiEe7JXZyej5TzGBNDPczZyUZSJLYeGmlvMILmumAkrOYkmEQ3fH9ESVnvDS8rLrc9A499a6ceQoaVNFx9IV5cMtF6Ib5tf08Cc+qn9u2ZK3gdJ+rWEc3BtculiyAEJEbx6FvLy/Nx9d9rS+FC9ix9FgVJlCdeCAZclIA4SHiCUjpgoeNh2uiaEZexR05eow69ZaBeCVWzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hO1+r3GoanYoQG4pSNUPhcwcRzBSJ+js42Xn0O6ntMc=;
 b=exehiUfqBDrezHu9+s3XCQ+SWOx27cjJE2dn3VrF+hxH4SgJtTFMARoOq8Azlbwp5DP9DThmdaH1Q0qmOOLK9pyt11ietD20r+hZSEUtmRd2zHQzLrZBNk97kd0Y1pgnQ0LdOICHqbZbbamgni6IEfIxoD+YKSsDG8T/Uu3fsGk=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR04MB3016.eurprd04.prod.outlook.com (2603:10a6:6:a::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Sat, 6 Mar 2021 11:38:22 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.054; Sat, 6 Mar 2021
 11:38:22 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V13 08/10] remoteproc: imx_rproc: support i.MX8MQ/M
Date:   Sat,  6 Mar 2021 19:24:23 +0800
Message-Id: <1615029865-23312-9-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615029865-23312-1-git-send-email-peng.fan@oss.nxp.com>
References: <1615029865-23312-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0047.apcprd04.prod.outlook.com
 (2603:1096:202:14::15) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR04CA0047.apcprd04.prod.outlook.com (2603:1096:202:14::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3912.17 via Frontend Transport; Sat, 6 Mar 2021 11:38:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3722b901-19ad-45fd-7347-08d8e09458f8
X-MS-TrafficTypeDiagnostic: DB6PR04MB3016:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB3016E77A80473D01D3551DEEC9959@DB6PR04MB3016.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:158;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nWAQNFSL0cA6guSWZmo+CI0bTdgeBPs0qU8e5dFFcBmwuWcqticoZ/zV4hEnwh0XSoNDyFOAxtl1Vr/ZxouPXfTw8im808c1AroPGTj+/6kigoVuEsvTDP3ImM0lOm/fveaTsc7MZcwjfHiOhs2iNsCoKfSyfA05OzNPtEOM7vtUayHs/mpSDQd1YD5uWiLuVV2jM7KHvUCnKNALFXTyZAkm4yUKiD7B6jU/KdV4vxwrUodm/2+pOMj4VlSuSzFAbzOYo0RdewKzeVOhmpdv9RnIspuKM3BPi/hareADFEdJUbMbjZZH41pI4vW0kP1QgK12ooV4GSBo40D/sGat8GewlMu+tHVVCt2r1zaoZQ5bHNlTEDCytn1/zhfVXKjebJUUP2692BIZ3Ntrdg+YdblGHf2vfWJnWa6xPJZ/VpipbxKhyEROHYiRScOnwPq46JoauB5/Wuzi58qLH/b2ZxvJzgqg14m3us7ZKUhgc/B3U0VBApghDQX9JDb5zJO7x2xmgueXbmkNDL+y8oErzt/4oNzYsbv73RjEbQb3gmvFnVSeJv6HCwHYigJaZHkcfPrSclfAy2akPUl2zj8Nyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(83380400001)(8936002)(69590400012)(8676002)(86362001)(6666004)(52116002)(956004)(478600001)(5660300002)(6506007)(66946007)(26005)(2616005)(4326008)(316002)(66476007)(6486002)(6512007)(2906002)(7416002)(16526019)(186003)(66556008)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MO7gjz4MqzwfAZ7kFTQ9bNX9YPud/c8r9NZ2rSUXKaH+AqLeQUSuU52ce0hL?=
 =?us-ascii?Q?1hmPz2PuRMCIXE95fh4qJ3MGQtRGyhBP8JoA/b2xVzgKIHIYP8iOi196nssE?=
 =?us-ascii?Q?bTuvfozGdWe4KZT1PQaH8bV6QS0ehP5PIIkSXNP54hwkC1jPxmSCIu+f8EZJ?=
 =?us-ascii?Q?owf2krC704klwNatYdaKkf6b3Yae3I6L9b3zmAWCQuF4yHei38U2Oypj+AFG?=
 =?us-ascii?Q?Ok3JsBPTLOxy8iFbRM7GMwXsrcvA96cVkG02tbgQd1LnpjLKAqemVg5HFgnr?=
 =?us-ascii?Q?T8uStUnBeni5MOsNP1ZCORJly87G9cK3//t+cr/RMuu4I/VTsS7yBFVZPn8C?=
 =?us-ascii?Q?YgrGr2G5UThX+72faJo/Y9BMU3lhAG+GBphwqYcx26YYUP+b70BASp3EfIPC?=
 =?us-ascii?Q?d5JcxvCExq3XXiRxcht+4qRQZP1tirvqI2zJL8IpXetEu5XmQqoD51/BFU/z?=
 =?us-ascii?Q?IBZURpOW0hAolnrjhNjwtL520XzHAhpwe4+CTIv2ihzX9RzsKH6uLLZ2yMu2?=
 =?us-ascii?Q?r5YPdB4e9cykdIbih9WCokP3kC5a4LqX0T+bnklVgFjwMalD8H467Wx0jQdf?=
 =?us-ascii?Q?+H9rNwIn9ILBv++1ITWxS1fj2LiljEv/VumGDhAqx1EyDSmFaXPo9EHYEi2O?=
 =?us-ascii?Q?X8jo29I9eJCV3/+J0YZlwA/oFp0UtShS36ysqP3N98xZMb7I6ZA6RhozvpQ0?=
 =?us-ascii?Q?GcLKMlYPRgfuNaNAQyOT+28MG5weZayAsHypA+d1G9RiIWrdg6v62OSceTsQ?=
 =?us-ascii?Q?PcDEmJj9uyxXU61nSNZbtw8PvkvVXqoJ9irnwsnD5b3ByZO8ACW9VIteLEI8?=
 =?us-ascii?Q?LzAUdAER7OJ2IhybMqgKWjAVl4UbB0x+eHR6Lv2gkFBfWlMeDx2+idOG9M8v?=
 =?us-ascii?Q?RyCUiyw1gx3UErtjPuc/P+lkLE4h1lsTGrpozg6Nn58x0DF9R8zaisFzZPAJ?=
 =?us-ascii?Q?qXrZIIyVDg+haUNp+Mv0hUKeQsBX2GLFDGxVLpWu6dVRH+JzS5ET43q1r+cn?=
 =?us-ascii?Q?GcAplupFfBdZVu6M076PoYt/1VsslC8FHG1KUDAhTJ1KkfFueUiLNa3U3DWD?=
 =?us-ascii?Q?h2da/pcHDtJ9N3/JgL0J0VbhKGYWEvKIsJd2ITJQtII3nUb5mPVBqewGEvtz?=
 =?us-ascii?Q?+xr4m6pAdh0BYf+yUKE7BhtVzrIcn22oDRZ691s3WaibaxcR76pUPxLeJOfr?=
 =?us-ascii?Q?8oHylNPxewy7N0bZAhxlD0IL6K5g+ISZEQekfZpJt9TTgUPYO4JfsEcn3wKc?=
 =?us-ascii?Q?pXMMrikV2CSJ+5xJmkmeklRNXpJjf9pnQ+LNPnO99uAhYU5LdXLmwL2K8o89?=
 =?us-ascii?Q?hcRiksziOXPtefNejxqn6Py6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3722b901-19ad-45fd-7347-08d8e09458f8
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2021 11:38:22.7153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jrTGhjY055Ob+M9Z9woomQhSX6A19kwL1tq3EDKIY9ugUT/qQ7WQy9YRbSNtaTpMyRL5pHrcCJBERi16ecOTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3016
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

