Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FBE6C433E5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 09:28:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C80B61999
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 09:28:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231837AbhC3J1q (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 30 Mar 2021 05:27:46 -0400
Received: from mail-eopbgr60076.outbound.protection.outlook.com ([40.107.6.76]:27668
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231802AbhC3J1X (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 30 Mar 2021 05:27:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obgxkbiELEHWyHh+N1Q5ifi7Q/nYgFp5RpM1qhWEZ6BKlOrGIiBCs/7FPh0QB6Exl7VAu0RLzYd1MrdGgmdvYPSvF80yWol7JXyCFX7kdfvYKMaDPB6HwmIk5tzLsMosFz0i6TNYkVbkCYJmUNhRhiGcGlk8RLFvXR/GLuUOGw7kMst/Q/eSHnAJWnV9Ip/pzaEfS0G29nJwkugEVvUHlN3NFCrd3RnDduP2Hv+Cg9e0zOPeTKqBiq2BugGly4Dac2csPjvYqc+YrRvS2aZoZkZg7S43vzja86vPeqVId8IIJxzOXgVlVuXG+AtWMNS4HyWdpSIQZsWaq/B1TduH2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JElioquqRM3seumWkbwBkQc9IvUvCox/SuXmtG2RAiQ=;
 b=FjoBCLVzPXrGYdD27czeOBtUK/k+hUKGmshIUxVAVPNRMFa6sUob72xhgSuVHSA/j7WCIFSTrRRzJLqfRVlbvukTg3psvPLCpqc0d4DfwZY5uauGDDez8mUY8jJskjHH3dWOhJMqSbSE4sPHXJqfDlfOfuqSCc6o87GzHk7gnUQxG9/AbwVYo7NUCmC2OeR0Yb0nbfE1Vtw2YjpwcEeufivtk8RgJLJiGQbC0SPvnduw5FUMtimEU4uMrItRA3n9TeJeI5Uz/oFGA4RmnZtuD7cUp8nRIm1Czdot9uWvXbOlWWbWtRvWgar0DtEkc1fSn14mfAe9s9xY+9v9s+kM2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JElioquqRM3seumWkbwBkQc9IvUvCox/SuXmtG2RAiQ=;
 b=VZXl0v1oaKV09iFmDyc09f+KJpLtfX4DqRu04pXyFKJ8QNdIqWbfTqC5jJsxkDz3ORFCo64ecfhqwFaUaCbAhqzNWzfgiRYPp1QOrDX5+GQLViSzdfblk8f+8Tb9Btyko3P9qtPgdSUmx0qoq2lrfNx4Nqgd6J1bjp10qNAosJw=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7595.eurprd04.prod.outlook.com (2603:10a6:10:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 09:27:21 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3977.033; Tue, 30 Mar
 2021 09:27:21 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 4/8] remoteproc: imx_rproc: make clk optional
Date:   Tue, 30 Mar 2021 17:12:50 +0800
Message-Id: <1617095574-6764-5-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4020.0 via Frontend Transport; Tue, 30 Mar 2021 09:27:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1915f0cf-50bf-47ee-084f-08d8f35e050e
X-MS-TrafficTypeDiagnostic: DBBPR04MB7595:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB759507618A85BCB6D4C40297C97D9@DBBPR04MB7595.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HAmIllpyZLl6ANFNj6bMcM4gwp99wuXuOT/TC3Y0yyehiP2/M7Ns7aqT/mTbbra523cv6lJ22TRYWu0JszROQSmTJCy7Tut+JkiZl8B4EgWvs4cAAlk/Yn3xobvDYpzu+4boLdCiydsLReslxLZC7tyBBTvZIvUtif8GKY/4K6iVcVF04A6wcR4jYf55qwN1VD7bzdSjJANlShLOpZv0uaxJcNumeGaQGZDy3ixpoKPqJEfJT2r//0LSa3diFQqzzmO6U0UgECDACZdw22i3N3XFYELA8ArhEHd45M1Lg4NSMPnvVurcrNP3/5LUuj8czqRR1FrqzxOaWIbCiUefbZ19ijmcjsWXZGalpnzi8O2Ii4nsuXKLg/5P0cJy+98kfrAfjnlwP7UPXarsc9kmPyf4z7Jq3Qvmmu9YXL/f37f3IRYyW19mpt2VH6BeozwmHwCyY2rvc2R56IL5JMnKLayUsQukx0mPw38hi3CoNABqngegqpDdfyhJy91uEEtNtemwHlv0o8zq2bz3IwPHubmIKA7HbzZ6aImmWitZ89RgyyOLQfrj0xDhKxadrWGSu0oojGVYAc95sv6IUSqMzDflGwDdMPIeJM9dVizTDfuQlWYg1ATwd/5clb9xkR3HYVxc5XaDtkUsWSaT/vPG8ybR/SsAkckh6gpYvGUujFpwF+Yw2dg4lEK24EdBeweu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(9686003)(66556008)(4744005)(2616005)(86362001)(6666004)(6486002)(52116002)(956004)(8936002)(66476007)(38100700001)(26005)(4326008)(6506007)(186003)(83380400001)(16526019)(478600001)(7416002)(6512007)(2906002)(69590400012)(5660300002)(316002)(8676002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BRo4Q4g5n7DP0YR/NExsZl7rEtoHtGU3ksZ8lq5AZ4JCJsYO+lZJ08zFO8PG?=
 =?us-ascii?Q?YddHA34RCU7DUuVz5q7cD0w0lyvEAfIqPV0rwvZDxSfg8wDhKOhQugqscheT?=
 =?us-ascii?Q?MKMg8UvWecyKy0UaTSojNX2g2DWMgESkKxwGDE5oD6SDke3MQJcEi29M9F0U?=
 =?us-ascii?Q?r16H8oW7P/6KMVnlADO5ERIj8ecCMnoEpq7s6ZyBtptX/6NF7UH8BBoqgqDT?=
 =?us-ascii?Q?xqpHNzL8ppmNpportB/urX0veunYvAMyRBG2R1/vMC5zm0RwwCq99s9fEypb?=
 =?us-ascii?Q?Z7rUFChpIdzYm4mCipSolhYzVkY3Bhgx9dVxkryOULOcOdJYosDQE8fBJ4ec?=
 =?us-ascii?Q?foB15sFkinbANVoYkg6pggz7jV/cNb1FcCjt+3ri35QEh83kwVcGYKU0Gukd?=
 =?us-ascii?Q?TmHM05fOlPLz1fuBeMZ+jjhdO6snlCSyeR5zGpILJgDHOTZiPZRM4F2lx/Lb?=
 =?us-ascii?Q?qvoYu/zqy50Xrr5PYlc7pBJFiJ/H6WwAzg1k3miblxG2efk6EnUBGLGbY1+p?=
 =?us-ascii?Q?khD1lSf37L/rXbBqSYYfNQ/f2xFaWlT+5TnjSpzgCcoMWJyqxwIefEA70jhD?=
 =?us-ascii?Q?7egvGhLM2L7Yk9mVu8VNw3mBcyMgk0XQ1+V/D62OolWyIdCXHv5kA1imIAcz?=
 =?us-ascii?Q?S2smdTCRkI5cShT1f9nIby9yqHK0lku+7wF4QUTDQzj5Rh2G0vqtjzcfRt1q?=
 =?us-ascii?Q?ypV1n2S9ZaR2f3q2fJsA9yeN0qtCy7CVkvVvAEXhnLXHRXBW4IX+1vzIkW4n?=
 =?us-ascii?Q?T2f8xeDqyIOV9FXKCE8fPmkpSqMmCtYti7DmDIPw23Ar65O4SMpzM8jAs4Rz?=
 =?us-ascii?Q?5lJVKZkqr7SgWwnWHG5wxZr0pH0RgrzzpFybGxaLadgf45FjaVGrpauRdbKz?=
 =?us-ascii?Q?77JamCWUReuhMM6wQn3d0tKOoROUtTwXEZQ0xI8WJPpM4kX96ENKvsB3eSFF?=
 =?us-ascii?Q?ez0KplPSVJ7XJht99T9YLdsDOniK2M2TxrDb6yBKIEZNhJb2wMIMgMZRDpen?=
 =?us-ascii?Q?QnPcHLxfokztuToKGQbm/8Q1VWgDDdX5ImqlJ5DQ0g4WOqrDyQQEfQfe7o5+?=
 =?us-ascii?Q?0GBnBn9VKu5UdcTd6YeCXGCOlrkyln7EsYlULlv7Ux7SRKz7pLceU4I7mOu7?=
 =?us-ascii?Q?D9B/ZXvfAagxV6f0DT/X0fk3EBVnt1efs0dsbs9HJLibFWfEL/D+rgFAgqoP?=
 =?us-ascii?Q?lz24C7bdgrO+SrAocQHt1EkaswnDLzgEjrfpdxrIzKqvggMbDjCL+9tdn7eD?=
 =?us-ascii?Q?OFwB8beGF6EKPg+AztEvJwsOfyG0qiI49mwyLsm/OLxaQ/aU5ZJT3roaDI07?=
 =?us-ascii?Q?WNn/OKzxs2nf+HHZEyKOuCaNlyv4KJRFGkQkyZ1D1tIP7Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1915f0cf-50bf-47ee-084f-08d8f35e050e
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 09:27:21.3864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ILrhZEOqryZrHAQE3THQgg4w9T9kEQdsnlUysoYOMTfwCd/XztgjnUaiC84XMCET5wwrSR8RLgx8lZuekjyyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7595
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

To i.MX7ULP, M4 is the master to control everything, so it not need
clk from A7.

Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index d6338872c6db..ca17f520d904 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -635,7 +635,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_put_mbox;
 
-	priv->clk = devm_clk_get(dev, NULL);
+	priv->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(priv->clk)) {
 		dev_err(dev, "Failed to get clock\n");
 		ret = PTR_ERR(priv->clk);
-- 
2.30.0

