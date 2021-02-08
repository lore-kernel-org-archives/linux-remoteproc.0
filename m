Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF6BEC433DB
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Feb 2021 09:14:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A964F64E8B
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Feb 2021 09:14:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbhBHJNp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Feb 2021 04:13:45 -0500
Received: from mail-am6eur05on2040.outbound.protection.outlook.com ([40.107.22.40]:52193
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231433AbhBHJM2 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Feb 2021 04:12:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpWP9A1tpWXbg0ONPuETcPTsSo1DJmTL2s0kCcKpav5HDtyXsxSbZgCYsHXNMAgLDZKqMevW4evBOy0Hl/kpHjM9j4jYlJp5KaJ0yEYPZZpC1y3TKIDwOPxrPBViOb4Lwihac1xo6wGfhRNEI/cYWOknoJIG/PvvvipaSPWYMStQrk7cDXbTCigiZrxvA9y4bpreaRdWY/VEU3nD53fRxpmnTP5nIU8bnEOd3foBE8s7pgElq8UWcve67e9BrWyeq+FaMXl7FONk+REGywbDDEGGfhhDYZK6LLqzt+MZToXlpXy8oefsFK5EQuCLu9hBmEkHHjTJMpScd82uCFjGQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylGtRczgykA3LROiqvT5P1IRIRg5xXAemZjMRiCZwqI=;
 b=WVy6NlKkoSYfn310GLFw9f3D2mCiblJvlRgzRERiR2txh3dWuN814XGNe4t1Cw2anuIqvVkf05vUe7bN8o/7yTuKU14H4nojW76XUheGsQcHiQWAZW2sTcqcYtkTdgzLNhrnedkCeRqpkFJGd6H7tWAAsYENLYC7378TZW9T7xAx5VD53+I6H8aiH9MRSLZ8LjjWJx8Z90mXicA1lt6YxBBVHFn/u6LLz+W7isHN2EfV6euVmOt1fAfqhXCO572YbsJBSpWWAXBQKsMqYQyfs8hTFl7fxyL9nQnlWDbxdwW3uwwTkUol3SWAHRBcm0PuTCk/UligOFHZns5m8u3Kdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylGtRczgykA3LROiqvT5P1IRIRg5xXAemZjMRiCZwqI=;
 b=QcKG7efVRVY6bx6zk/meN/xuHtE0yr3CaVwCuhT1fL4zlyQcSxLK/QD7gKjbz/+ycYUpYtXGj6VZCbcGDZ8ByG/vl/wuRJXp4MtgoHROvgyoQA2LyJNB2qw82UUdY9QXr6YH5aZqFZaSY44CrgvOxu/gjPbBMsKl7TnHX3xClNI=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2933.eurprd04.prod.outlook.com (2603:10a6:4:9c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 09:08:30 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 09:08:30 +0000
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
Subject: [PATCH V10 09/10] remoteproc: imx_rproc: ignore mapping vdev regions
Date:   Mon,  8 Feb 2021 16:56:10 +0800
Message-Id: <1612774571-6134-10-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612774571-6134-1-git-send-email-peng.fan@oss.nxp.com>
References: <1612774571-6134-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0102.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::28) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0102.apcprd01.prod.exchangelabs.com (2603:1096:3:15::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3825.19 via Frontend Transport; Mon, 8 Feb 2021 09:08:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e6234469-db39-4a9b-a8c1-08d8cc111a27
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2933:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0402MB2933C8D7EA69080C563C54BEC98F9@DB6PR0402MB2933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UsQ+Wg79VRz9IlU2EKlVzB3s9BrhubtvVMdJf+g93VtSOjOxPepOj74+g1s5dLH0N1eYZ6F7Xx5SAQyaLwdG55fpPu/wHo1Hftuvf1AoeQvGWyR0LOXt4G2k1mDcllmBtBRtIRLtyuxvrsd3Ypke7K12PcHo0moCgWekDFFpBlCijs7Ikuz85PRwotA7BoEpdkGtJ3ZMNMjIa2+cfPv+8650R8aNphqtpuQOCeD/7XzZDIxpxtlm8BNDUUO+GjHHFJ8UMX9arKs1wOAsqHTNsF51hNtWTRMmTZQh9S8P6W295gFZRJZwh2+fowoQ8yZdDJTC/xH8hrK3pRbL4ah0W0mkuHtMqnC+w+7YqXb5BMwvCFe1E9IPK/yvtfROkGRLN9rq7MdO/yMHgvUcRNc3rZ7QxLF+Cp1/JbkWvFTN7uiPGX2ec+gJL4duR7XgpT0HK1lRur4/R3LDeWiYq2c6XA18QRhjnbzV8g9q6iYs2U9TIIhtYzPouJwJZVNekMqtt3IIiCvc0N9AQOEyzaN7jVTbqvEpFibxIGEbs7OLvAKDsj86iZqyjq75hDdcKdZ5KoqEIHZCLv9Rf+5DCk20XA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(7416002)(52116002)(6666004)(316002)(4326008)(8936002)(186003)(69590400011)(86362001)(66946007)(6486002)(8676002)(6512007)(478600001)(6506007)(4744005)(26005)(956004)(2616005)(5660300002)(16526019)(66476007)(66556008)(2906002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6hcoGq63AqMWfBaVMaUPsEh7qR0V09cPhMUlB8ZOJ6nw0nXcJ7JRrTYQt32z?=
 =?us-ascii?Q?yRLeXZatu0yESQHO11C6lugJKPPnh/jt2eTavUbvVaEFCAuOoigd08ceufn1?=
 =?us-ascii?Q?ObxaqyX5xLRdCV5xJ2e9ARYmxOM8TZ43OPqEpYm82E0ZkYMexoMr88UZlycd?=
 =?us-ascii?Q?5YKZVb16UAzf88tXaQRl7N8cbwU6jQzrX6tvsEY06XaPQnCHxL3jSwL2oeS8?=
 =?us-ascii?Q?SDxheuyUlD+Zx2mCz7DZ+bhLX+splxSZwr5Zbq7zJzstnHffCUYYR5HVjS23?=
 =?us-ascii?Q?7dyNzcMSkUxE3H+wMOwd8mS9n9CDljFxG2HdlG3NtnJbrw54p5EkSzHQMxIf?=
 =?us-ascii?Q?EtMlpXvlU4yhrVq5CyrSa5u4jcjDlDUAQilUDL3Wey4R/2lc3F0mQaPyKj5u?=
 =?us-ascii?Q?6fwcUM/G8LcumwpjuUfvBNjLlNyBZYO4kYcvLYQK3NVIUJmPrAMyHBzd/Opv?=
 =?us-ascii?Q?6ibzn0wG6DDB9fLfHvD8UGja7NeTYmZ7kefRgtQ2oBqzyL71WAIQh5ONxp55?=
 =?us-ascii?Q?4SScy4MpaSxHMwO7GjDAG1BqWB27554iX2+IjEQ10BkoMMaw4NpaAGao6HL3?=
 =?us-ascii?Q?b/MWElbEhajbw3xoZU9AiCHzSBZQ4bESKbA6IAEi8FsTme8LkNdNqYC7hRhk?=
 =?us-ascii?Q?8YNzbV/jTPGMzetUdmFKrWqsrNw/6OGllyoRkfKI3iVHl89Q5Ez+rdYpLt2q?=
 =?us-ascii?Q?Elg/I8UHvD0HaSUhs3Iq8XV+O+s2zLwHNHIYJgkMtsoPPmiC5cp6eECubbuw?=
 =?us-ascii?Q?Ksqi8HjwvaxoklvFiYyMlXv2zDQiAYV38FFjot2QbqTePsSLdetfL/Wx6LHY?=
 =?us-ascii?Q?TnvJYGVHJ5Cix6dEVlcen8Ytfqis+pPlnfjrdjX3FgcQfud4oZ3GVoHn5Iax?=
 =?us-ascii?Q?6XQImjbf+CytrNtjq6Vuo5dMoXnE40vfOXyJDn0dwtpKJH2Kfv0diBXX9T+t?=
 =?us-ascii?Q?eADml7wccVXjTLIs3ppdkJIBJtAhz9aGIlhlzjUmM6YVunqRh+gt9c99I9t/?=
 =?us-ascii?Q?eKkXm5RtduqK/upXHy6YdysoTGF/rSDCAm8ULZayTQVxOHmOSA2R7VPLpFji?=
 =?us-ascii?Q?VJXJhQU71GdAl5uCR/mXoPFhSm2+FAWi6t6c8/j8czzkLpNTeKnOqRqHKhDd?=
 =?us-ascii?Q?hqe2n+ayZZpiMc7drIVtBTVqDGpdZCHgPuqliCKEr2dYTxZC5m57yCRKDgMJ?=
 =?us-ascii?Q?MzXYZCgVR7JFeugRbSXuwNUyPXNcuYFow7rENUxbcQS8AWooEIeMnL+CXWVy?=
 =?us-ascii?Q?i/rMWHzDbFCOS/lDVdDjiRuphVLQMq494Aq2QIZdAeK4jioFKuCzNlnjd0Kw?=
 =?us-ascii?Q?wdq8Dz8izY8FmfAS+LTUr86a?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6234469-db39-4a9b-a8c1-08d8cc111a27
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 09:08:30.1770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0O4pJtpPr4ljgj28HQAovK9uyMDpDHRfKU1kGJ5kvvyfmm96WC7GxXI5mBM9/6cF0WV+EczMoyPEh/CKijyo3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2933
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

vdev regions are vdev0vring0, vdev0vring1, vdevbuffer and similar.
They are handled by remoteproc common code, no need to map in imx
rproc driver.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/imx_rproc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 0124ebf69838..3685bbd135b0 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -417,6 +417,9 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		struct resource res;
 
 		node = of_parse_phandle(np, "memory-region", a);
+		/* Not map vdev region */
+		if (!strcmp(node->name, "vdev"))
+			continue;
 		err = of_address_to_resource(node, 0, &res);
 		if (err) {
 			dev_err(dev, "unable to resolve memory region\n");
-- 
2.30.0

