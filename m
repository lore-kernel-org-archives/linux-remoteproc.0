Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0E7C433B4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 04:25:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5DED610E6
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 04:25:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232915AbhEFE0S (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 6 May 2021 00:26:18 -0400
Received: from mail-db8eur05on2055.outbound.protection.outlook.com ([40.107.20.55]:21472
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232847AbhEFE0O (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 6 May 2021 00:26:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMe41RcOSY18+O85qhg0fd/cZdaBlPm3nvPp6CdmJ6UIssJjjGv5xV0W2JBDm98WYi3lz9kKOk88iBVvs6Z/raU5l01sajAlGWrwVr+UeCSYAdc5KS5yz222Vot3xuWNkuOCJinylUVsTsoSX6tw9eCOCYhWSYwYwG2p296RfjTizyOgH8P9L3HMrQY+fk4W4FtThd7eAQj101usz5WJCqeGv9GJOawJ4cNA1dpEI2hSzgTaP+x++ATCUJpGDjqfILBf7QCdfkh0TwGFnit6jWPi3blH4qDHMumbdq0YDEBbMA0mevOYSOVZ0MMgHvbk5B3h99yoGJBLnxRFtY2+XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIJPvyXTkoBhcPI0vQASlR3kY78KULzsmBHaugDn8KM=;
 b=G0GGWww7xpXWsOR79LydFqyHZibiz1CO7ipNxIyuui6KWkpW3SGSGy1GWCzRW8QPWMta40eyWfOyE7Ztjq7e7gIlJS2D6rsfuLHr+rQHrZU6Y+i0MbW6ixLaBbZ3GECjkp4TiVYIjiPFzXvB226M3vGRwVj7vCtDw7IKHP9LWtgHlhypRc/bWcHbWjNTYDFZ1Lmk/zAPLJ1SGshV4YV4gYV3js8SzV26XJYD3KIBkFEHhO5/MG4JW99AkMeRSBJLQ5lMm978nSoom8zMIm48HU5y2/RQjEcP9Bh1WjcW88AhMWNx84A+7NlnzPpp/Y4EvlEsYCozPLes/MGIZuMA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIJPvyXTkoBhcPI0vQASlR3kY78KULzsmBHaugDn8KM=;
 b=eH9jdsFztbgTLJMlHHPdqyz9ya50rh32SY+dCv4wRr6dRgLJHeSlSejM8lPBAEEaDMBWvI9eJ+YYuvHKcCRKtS0nygeedIUZcL59CjkyRYthFXMG8Ph2SA3Zx5VjqyC8svJ3a8Cw1QWYsav8RUNLyb/VD6kpy482DFMVRXpGrXM=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR04MB3126.eurprd04.prod.outlook.com (2603:10a6:6:7::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20; Thu, 6 May 2021 04:25:15 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4065.039; Thu, 6 May 2021
 04:25:15 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V6 5/8] remoteproc: imx_rproc: initial support for mutilple start/stop method
Date:   Thu,  6 May 2021 12:08:40 +0800
Message-Id: <1620274123-1461-6-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0055.apcprd02.prod.outlook.com (2603:1096:4:54::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 04:25:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a7e877c-f490-441b-baf9-08d91046f25a
X-MS-TrafficTypeDiagnostic: DB6PR04MB3126:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB3126178ADD3702F975F5B67AC9589@DB6PR04MB3126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:153;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IC8Z1KWviBBQot74tCp4FTxI68R/r5drN5eWOUDHcMD8iH2RxZJlu0WaaQ812ZWTwzT8kV54qkdqVlygkINv53z9xvvOs6hxIKK8xZlzvl9/xYVfqCgx/g2RGYu7OHBmczjMo5pkq+eGWaq5bOJITOzeOD4zKhmNYTWqcKEsu8qwiTW7qXf0KZhGgu+OUv+/F2sv6gZE9UEG9N5sCZndVoakPBp5Tm3uvME6VhdrKcUHX+wLvz+mHVWQlWf6EUP6P/PdMrNN0tqY3cTpW9WpNXVe8kzbqE7k1XwWJR6e9xHzs4OxMJPTBgMndve8pRo7CItZlqtF1kVwd5c1rHnYXIsnBB3xLVi4lXwe7b/a1G8dtg1Y+CZ5Iu5R96DDH+1C7UtAJeMWI7dJH5CVhmtoYRKFx1cdxWAIAVsUhCsOwYnHj5/r6/uBwStp5XwufoPa26oVOZbyktqXe8UAcUlrf7QiWARTjGIj9bkaQxJwmQyqI+MP/ync0WGf7MwOvePfBQn1FZRexE6gW9Qsnj65FvLpC1Mv1efstX8J307p9syFaBlTmZc0MdB/GL4dLDYzqFAxGv7DsEcQfhqKAli9OYRE50f5WWTm51j8s8UCVoQO1nIAKow2LsoijjyXfDsGauwLR8wAtM4eGCpx9xkNmOG3TLqDJs9/YgXZc9Y1EllkfNrx1ztHQjyOzb/9XneY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(136003)(396003)(376002)(346002)(26005)(38350700002)(52116002)(9686003)(2906002)(66946007)(6486002)(8676002)(6506007)(16526019)(7416002)(5660300002)(6512007)(38100700002)(186003)(478600001)(2616005)(316002)(6666004)(86362001)(66476007)(66556008)(956004)(8936002)(4326008)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2KW4wOzG0KWO7+njDF8mWYoxvEMN/OY/NxINRa9lwTtpmtPT6+/itDLtnWtm?=
 =?us-ascii?Q?MXES4yGvr9Mi4uat+Kr5pxlGwGDPpcgqNDMPnntZL1ihyNTSqwmnbL9E2Nu4?=
 =?us-ascii?Q?33XYxMrHjKgEC72ZDylyFOEEtvuXiG9nreB2LKvFGMUPkLFgvW9vnMzXf3Ib?=
 =?us-ascii?Q?W+qRGu+1sGcBFS+yaQ6YNUcy+6pLOzsp87G6KTI3EOTEt/JbRBEE83hG04c7?=
 =?us-ascii?Q?AT+nhElYheiS8LP/IyfB9OsGqp8kys7QRH6+6FcUXd/B89wWLolpmq6NJdF9?=
 =?us-ascii?Q?n2VSKXeVJcOZScMG96m97ws7ljGwdxbU9Ujj+mQ4zQv9j9RXW997fyYvgZaB?=
 =?us-ascii?Q?/bjuLCZy8SWRy+AVEds/H/8Ict6rhyfnbKFpe3+vw/CSl6c9J9T29Wf9jeWn?=
 =?us-ascii?Q?seINK+X4P59zz7KLwh3jirzt1s+/A4g8pvWEttvIejx250sw/0WvuAsiOSdD?=
 =?us-ascii?Q?Pz/iIO0SGUlg9lSEx39Mn79pufkDcLcBEzCLZvwZvdCnuRWp3DqAWixvPLnu?=
 =?us-ascii?Q?CtrV1zcqLx3dFzipQ2u5ZoFHCHBrWvPiOOQosQJkA/0MmQ/x/sKyIdKoksXA?=
 =?us-ascii?Q?++Id2RRT/OFS39jhOnm2noo9nq4BoTuaYvEOFGx4yCSLh8sFSH9+D2Pk7cWs?=
 =?us-ascii?Q?wfJ3PZ9JJGn3Q1M/OzOQeoY81y+7omKu32lAi/JExgJs8QDEsG/0gHHyXBJT?=
 =?us-ascii?Q?nWuhChsEGzBe3qpe7/0w0JCS3tdiiCsx4Qm8clFUnsvz9Siha5XsAhUXKoiP?=
 =?us-ascii?Q?SbIwjuSYRZp0fg627zMHDjXkwSo7JiWl57zOYeiYNxcZCAhpOnNQ1i2WgiXg?=
 =?us-ascii?Q?8J73oFzHUjB9vFOO+iFRPYzIxQLsLdYHQKtx5M9oGXOFK6NJ8LP4BV1tBHAf?=
 =?us-ascii?Q?Bg2FBDXJoFhxZ0Hf9B9TQrIgfsvicOSK9VK7HiusvOocZBBzVBYB8rF1ANxO?=
 =?us-ascii?Q?s1ezxemGfGJHEMfivIFSAuAZcuQTnA503d3AWFpeKyBwD4eZ+pTr6zkg73vD?=
 =?us-ascii?Q?dhdmu+X0arG+yfrV0CJDzTemYNhIC89/1iknWmLt64mR+v3P74FXheX5bkj6?=
 =?us-ascii?Q?Fyz2rLITql4+BuqbMUc3v1t4g6WZZudE23Z8XE5xjLnWTenJg59inaW1MXPg?=
 =?us-ascii?Q?VLEiahf/uRTacv25zFkRayi2lncNFvfJ8EFw69Du9sEXp+tlmJvjToI/jpao?=
 =?us-ascii?Q?6mc737qvzRzQofFCXYAogE070ZTYCtuM2HjRotFxAYAI6BRwGKB+qnrOqHA7?=
 =?us-ascii?Q?RObsXV+nmC0bFMKtguWaGP7KTj2/L/68J8WG7+vr4qfp6gvFmAr1XKCr2gZp?=
 =?us-ascii?Q?yiNKNaEyKE+thnyosLDCm5/Q?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7e877c-f490-441b-baf9-08d91046f25a
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 04:25:15.1342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gd5X8z1ZsQJ57tw09D9tfauTMHbMy1pA3AivMbaYLpAlGLkDYEajWHEFh6ZB5rKULDOneP5qNHAszLRIuEdCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3126
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add three methods IMX_RPROC_NONE(no need start/stop), IMX_RPROC_MMIO
(start/stop through mmio) and IMX_RPROC_SMC(start/stop through ARM SMCCC).

The current SoCs supported are all using IMX_RPROC_MMIO.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 06dac92e98e6..6289aeae95b6 100644
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
-- 
2.30.0

