Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7177C43460
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 02:36:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A041461422
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 02:36:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234716AbhDUCgi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Apr 2021 22:36:38 -0400
Received: from mail-eopbgr150070.outbound.protection.outlook.com ([40.107.15.70]:27812
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234706AbhDUCgi (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Apr 2021 22:36:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxusbGDBaMbPdyLqYblOwTIE7PEHTplT1cN6YuUi3JQtLAaEKqQn88604vCQJ15OQ2ZSwVWORL3uPX453tXq91fWeh+qo6Lizrz++GHsu6F+5zbQJ96IGqHZeIz88k0sxblOHDd8l2SU+iOkQeNEhQJX4JpfHEy65onyVGhnF4QRocBL/G2ncJ/yjv2BqldVq9ypRzwmemjuTd/Yx2PapPpB95xdLrm+gJv+LXwlaV61L7PzYczhA5ZtzjbjVd3k1OvZ5k72jYBLRiZcjblyKSYNwIwUKLTvXlITAMT0CAkN8g+5w0ayaF7dluaW1tabOQEtgtOru1Bmc5uzJzZl+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wDT0/duqjnGCPE6YxdFm3Sn4kEIcN4Q2kRMEQCwybk=;
 b=ie9CAKqJ5cXrrByFfiseh3H10a9fqta1PVCfs80tWWX45OjijoLH/ZX/Kk7/E7PzV5zfBBqUXdLKU93+YKC8Szo1KGVAoCotAGCHWlWwJJhrD1k6BKjoOCTC5b6ZKsD3mm42+d2yhjiSfIqmdkDX13YCkKb143lQVfTA7kIp/a365Kdfbq56egbm+HTdnoQZ/L7IGyBZ+TlxX4Q1sp4Fma8z04iHkNnCoV06J8kg8f6tJRbuQvwWqL3Bf5L8LpOx8SnbcKtondCCIscy7ctprIDMitHIty0tMkJ7cTIJz1ANGL2BqhZbMu+WRC9XdWPwKUzPv6ehflcfVvsrByXSJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wDT0/duqjnGCPE6YxdFm3Sn4kEIcN4Q2kRMEQCwybk=;
 b=VEYy+g3B4BjWcdxHicm6wrRqLgkJGgH9eAevWXQN8UYgxOT2pRjEjgxBC7jWNsyD2DRfB42JH9bQnvzSvUfIJlk34J0xH5FXYT2wwYBjFnf5SKFD05addnNrARQnFT7/kIb59DMBqzppCpJyMqtdWrAVMkHdKTQwsfGURGFWB6k=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8313.eurprd04.prod.outlook.com (2603:10a6:10:241::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Wed, 21 Apr
 2021 02:36:04 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4042.020; Wed, 21 Apr 2021
 02:36:04 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V5 4/8] remoteproc: imx_rproc: parse fsl,auto-boot
Date:   Wed, 21 Apr 2021 10:20:18 +0800
Message-Id: <1618971622-30539-5-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0204.apcprd02.prod.outlook.com (2603:1096:201:20::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4065.20 via Frontend Transport; Wed, 21 Apr 2021 02:35:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df599238-1655-4ef0-42a0-08d9046e354d
X-MS-TrafficTypeDiagnostic: DB9PR04MB8313:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB8313E3988F7DD4425DC7E7DCC9479@DB9PR04MB8313.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u5SnXG/UBcvuoVi8tSNFlkkhLG3mEXozCiJbgPBp0GKlImsi7wJ/c/PKJqfur+epiiunrm9MkS7CaJB8mWYu+HpJrQC2VgjyjYWJQM0KQ29P7twTHgw6aAbaliUvkysQFMoQvFaapNvVw6d2YskaVUT5v3tbopBj5Gq6PKArhrs6jA+D3+2pOgvQly1tZ48TIG6bkT2kFt071+ftxRk1g1FbVAqPgAolQldlH53NGYk4CqTo9LuOppNlZxY2uYJBZwM2j/dSpkmyFTG6lAwXrWNz2NyFY4FQpmrwFJ+ALHgnbWjdIUJE+c3cL3j2q3mqK1pGjFBxM9zaf3qr8FIT6kXq1AnDrZ2UgWwnw52w/aJpKtJStr+6h1WJ3WylhQ/Gjwd5jvV5uzTNMd9+zgzLqzYrMQ1CHRRFgWsIFv/qFVaJKTqYkX1aXBiOcT+i4KP4CJfJPpOrzAglsVMg48fMZu8UzquZuhVc6oVVtpo4PhunxGJQRYdvOlhA15TX/xPDmF6vu/G4Bo0KEtOCfnnwMC33X4AxpTWAExHzJ1W1WHlIET/PyU26AKvpRxeZFVxnTVFtuoi4TYsLzehcGhOD0ynzmJjo1md1yzw+Qit+Je+hiuYFiTA/RJxaWuk3Y/3BnwjMh7Ada+PJI6TUOYLGJhiYUM7E+yQhcF7LfkyiUy5kYqTVKfb9V8G9ZqE4LXUH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(38350700002)(26005)(186003)(38100700002)(66556008)(52116002)(5660300002)(956004)(4326008)(8676002)(66946007)(4744005)(8936002)(316002)(86362001)(6666004)(66476007)(7416002)(6506007)(6512007)(2906002)(9686003)(478600001)(2616005)(16526019)(6486002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cI1SKCqrBjLsTHtc/PkFUwcA3KVRB/ZcFAOhhUHKr2eFbrqfxNHpV7J/htWR?=
 =?us-ascii?Q?7qywtWwX4wvsH5o9wgATGh7IFk4AMZNQXPV/n9lA/s9mLNKIKe1j5QFVtGs4?=
 =?us-ascii?Q?oZX8JrSepo48b2cs1pzZ/I6TkS3QtkLm6HMVJoXvjUWg5vrQVS8W88t/oFSf?=
 =?us-ascii?Q?1GcLAnscjh/QFMy1XqRclYWaWr/XIgT5uzuLIrhlUrb5N4t2blLDZWtid2Nf?=
 =?us-ascii?Q?SZR61T4rdxHyG+dQYHlR7wQ07be0zlvobU/lEbW7p/qVRUBwntWC9/iwRg63?=
 =?us-ascii?Q?s8jgxZxZ4yZzwnbjZpsALFFIf2/s0WOq0SEH5bRXBa3KAEfyg3zChMUizbUC?=
 =?us-ascii?Q?vCcrEbAtpmzrJGc7I2Pg+9shBdngngy4shEA+52a8iMJhxYVY74pfCrnrF8E?=
 =?us-ascii?Q?b2D9weyxeNWJlyXIixL+jWW+Hmljz4wInPnzSpxFiYKOh01c8m7lwj9YoRGn?=
 =?us-ascii?Q?UbKD+M33kO7Ox/BFSW2vKzOwNR9lbKKcTGwbjq3mM5i9LwrSRLReN41M7VYr?=
 =?us-ascii?Q?UooI2CrNrrGJACmG/9Ee9tfvFXbbHpEyyWnCf04B1oa07HQe8oljrEA3+hVj?=
 =?us-ascii?Q?QnBjdku8mO9xJgi1tu38V5KEz3Hp+qXmBEsMESnFoEqaZbmCTgHD7ntqXXE+?=
 =?us-ascii?Q?aRSb2uNq0xEA7dcdBAwbmup+Mb/Z8OjqidxkW5Q12HHdD6LM2zw3k+20k96m?=
 =?us-ascii?Q?Y8YHxlx2+9ZBIOgq2nguk9qaLTaG877VdbqHYboJVrzI9Ib6AiV+mnR2Yy89?=
 =?us-ascii?Q?AJC/JDfeCm3zrwNy10Z7iiAy3z5bNN/32UBVH3r0KUDL0FnDAREtyWD/hNj3?=
 =?us-ascii?Q?ADFbkiOasBGFsxYvt6ogOSmDOe++pWGH6UctSgm54VxDpJPNl82Ztj2xAsN0?=
 =?us-ascii?Q?wE19YafJcJlrisP0j9mgnZiG9fNcePZENl4RNTEtgsjPhTryqDcDBlxwSm+w?=
 =?us-ascii?Q?Z73lsxzBdI5m9coGeOct5LkXdIN1vaaHxz47s8RtAAaa5qrAHNwt3wseEnqx?=
 =?us-ascii?Q?GfYjzkOUgThJhtRkRI1tfr/34TU+7IrQ8ghFLOsc9qI+6FTy8Vk2Bfh/13Ep?=
 =?us-ascii?Q?brDujuNvXai+3khzbIrLvq80fPTb4AKopQKg6Hvgp2YYop/K2PMK0Z+YE+KO?=
 =?us-ascii?Q?zVc+PKphfPZEPIWco+4HKl0rn2aPrMbWkIniifbJ5RtYcS49cEUv1ix57WhT?=
 =?us-ascii?Q?90NnsSBvRuCGmtFANDt9fp5JAcvLInPqthdAGQC+Z2SsL8EFCqjJm2E8KxU2?=
 =?us-ascii?Q?wCVMzzO8eIlto5MlMYRt68dRYi52Ii7js1j39yH38wnNiWJ1gsDUGYGCrkeI?=
 =?us-ascii?Q?jVF6XajXXBb8OCczZ8evp8LU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df599238-1655-4ef0-42a0-08d9046e354d
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 02:36:04.0333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHBIXLncT9BImjxyH61BCE9Gs/66DIuas2bofup4huC1PTYl7jTm7iwO9y+6GYUA4hkJW3W9AgK5eio88jhgpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8313
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Parse fsl,auto-boot to indicate whether need remoteproc framework
auto boot or not.

When remote processor is booted before Linux Kernel up, do not parse
fsl,auto-boot, so only need to parse the property when rproc state is
RPROC_DETACHED.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/imx_rproc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index d6338872c6db..06dac92e98e6 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -654,6 +654,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
 
+	if (rproc->state != RPROC_DETACHED)
+		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
+
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
-- 
2.30.0

