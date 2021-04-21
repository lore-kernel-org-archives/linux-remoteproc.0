Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD26C433B4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 02:36:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81B23613F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 02:36:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234724AbhDUCgf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Apr 2021 22:36:35 -0400
Received: from mail-eopbgr150059.outbound.protection.outlook.com ([40.107.15.59]:47783
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234695AbhDUCgd (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Apr 2021 22:36:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3D0u75vVA8c0U1wGKCRRurV94ZmA1MsJjr3M1SQ9/1o87nns+y7aViN8zDWuUorCBw+naEJI0mWCwN11MgmojBT/gkWGTARBR7HQb4h46uB2vuhu9sLB4noe3qCEwoyDbU99UEsX4ovLs0VNfOH4NoWjupnMTQIWMfv4d68pENzXAM7/EZxjfTvRJPuyYDESTmyTQjyhsF6z/w0J1+T6VNLT1Jov/o1AP+S1+KZSEKMG2Z0U8blI+4xnUhH4sMcGokUUjJcB4xTMD8VLi8O0auGyU/0q8xnOn/atSN2S8i6jXzT99gAwMwh3XIcoGVz6pXpg9GUYrVeHgyfFPFvmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5r2YS1IJ7iZGrBoTfdGtwCXcI68fncREV/Lm1YGhqas=;
 b=Sn4qZ/MmMbbWzMPXoB5WerTnR61bIhX9jkisRkOqdPASHXeo3imHowZZslEaDdhlT4jmPdRBVO3Hn8oSlk2OvdsKvdQHsZ22HyeAd6OJLRcQ1OGUgsWABN7MhHPKBkmd9w9dmX+CPJV/ocMzp/EIZyf3r2En0hWl4WXUD98PPGs1E+b9GNId3/6deXQWBcZrftT2mtovl1ImPRdsfFULQOXHWdGWBXD3LmGLvXKRxM8fKsOzydtxumEEVW/ZNercP5EjzxpLOXQt3PKD4uPkLoPqAHSQ0crKqN59859yYj2H9Gv0HXb8gpvfPMM6PDB90rEivinN4VqiQryPjIGq2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5r2YS1IJ7iZGrBoTfdGtwCXcI68fncREV/Lm1YGhqas=;
 b=i5e0voEhmkG+g5tnei2TAIIGEYHA8DJcrny32I3kaGOYws0qA+YGEQy+S11vHoTCGiniu/IoQF2oZWAp7inyQRLdcLPDJ/vKSHuJxhdRtQxaONQdGj/1HHBQyDKBMnyMAuFNN3UkktnzV7a//A/RphvrU6cApDtPI7bzBrnUZrQ=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8313.eurprd04.prod.outlook.com (2603:10a6:10:241::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Wed, 21 Apr
 2021 02:35:59 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4042.020; Wed, 21 Apr 2021
 02:35:59 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V5 3/8] dt-bindings: remoteproc: imx_rproc: support i.MX8MN/P
Date:   Wed, 21 Apr 2021 10:20:17 +0800
Message-Id: <1618971622-30539-4-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0204.apcprd02.prod.outlook.com (2603:1096:201:20::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4065.20 via Frontend Transport; Wed, 21 Apr 2021 02:35:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71f91437-4829-4a60-74bf-08d9046e3285
X-MS-TrafficTypeDiagnostic: DB9PR04MB8313:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB8313AFF6CAED757275976F17C9479@DB9PR04MB8313.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lTDG5ai9mUgYOgLPmB/Y/xfWHtvSogZSFvezQx6WH8rRTM/x+kLcjMgw966Y5dVU7xfYcPLQROSeGZgq6VNu0IJp6m2eFXhQExwJfN0/llfgDnwhD7cPYsI+EirKElmukF3vXNKqzvTZRpCKTfzSglYXsoP9Yqy+p3hgNT+H8OcejTB+Kjpjb78Jyri2jGWYb858yDYP1Rbp7l+bRZnmGfUVRmQGbvvWj0DDdXhRsfL8m+5UP/1VH3IGar/2HhdJnEqBCfGU0a0k/iELKUsqUsR+QyG5sT31KjM8Fzagn9OkoQCkk7nIgYceWnMmswmtV08bXVEMLwUEiW7uOygp1c3LRv8cVQKrPG2xkAzPxLNB1qiHzHQVoO9LwHGn1FexYxiuoEsr2Gzmv7w/6b4udhJouGqSIUtI0iesUrtqc/SAwoBo5LeC7M4lrfXotD+DMeBI8FmsIPm44lps682CRSg384xLcUz/5AaqQeRIClSP0d0nKDdB7Ho41VlMKaagBBUoFlsnGZEw5uSTWDK2+yRz77hh/Kq1dDWAFLU1KF9PqcUzPqTIb9udDtLGazqrqpKmAQ8Z3XL9JEFyNSDwgTRqwVIiRGuyOVpu4GjjWe+4KCDvIUsfrOgPZtbpzIQ7xKMNC+tvQ2cudLUX9sRdir5swpTIzhk9QGW4mM0lx1V5TaRI8aN22tXgfjPc0RWm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(38350700002)(26005)(186003)(38100700002)(66556008)(52116002)(5660300002)(956004)(4326008)(8676002)(66946007)(4744005)(8936002)(316002)(86362001)(6666004)(66476007)(7416002)(6506007)(6512007)(2906002)(9686003)(478600001)(2616005)(16526019)(6486002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qlkQZzkDUboiV8KZpWjLIdKryefb30aYqsv8mr1c+x3lSblDti4tsuTWyHKn?=
 =?us-ascii?Q?nkdKMaZqx3j/z5mTbIFst5jPahCpRWTQVNsBoW3sfIQYNOevMxAv7t67yQU6?=
 =?us-ascii?Q?DOt6Xelf5y1SGjou/LWp7/8wk74vO8caMG7H4z6GylPEw3l3iiQ4WWjBllse?=
 =?us-ascii?Q?XArmcgsIF9H6cXhPM9rsNm76RUVDfpzQZWj1dw1LXApW5xfa7rT74UccBrP/?=
 =?us-ascii?Q?3r8MUxRgnGven1SZ8oiNg0HMlD4cVy7h9tI8vsa21HswkvIfnJdUoKtRPk5l?=
 =?us-ascii?Q?i7hO45AzXvMy+J+/RiAQiiHp6YOtlN/TQbdkfeIXiKYjcm35gKkb+QWu0yTc?=
 =?us-ascii?Q?J1EoK3u7X7cOlwgD3+m6M4w20+hfrxcEg50v+mnN8IuRhWVqYase25m6d4Qf?=
 =?us-ascii?Q?ERCM/vFLzJhs1BiKgPX4mOeeB9YLTJPympQumxxi+/l+77CddDoXLInYzDJl?=
 =?us-ascii?Q?OZ0v82DFO5lOsKDd9j5L+KF6KCcr0yIJSd4DCTcKP4QbmmrN/+6Glnctuesk?=
 =?us-ascii?Q?jDutx61khSVLsg/NL/itEOHrw+ZqevTZYT9BUxu5PNsf18vuL0IKZ/4lTGqS?=
 =?us-ascii?Q?HtAE3ZILgI48laFktzNmhWDQf+XBKfJjzRcWdyuuNMlfoMJISvM2CRFuo+sH?=
 =?us-ascii?Q?NPG1QMGtQUD+Jmt3xAGkynVKQOG3chHy9BrW4PoAbWiCbVny6n+/tOgyCMF2?=
 =?us-ascii?Q?Grob4h9Cu3IGqYk8kRMJxB3XiERcw50NPnNZx4av62blffNFeboWCpIL0DvQ?=
 =?us-ascii?Q?LOWwNLQtmigDJqx9K5NQ960nrQQpW6lOnbmaZCOhYl+j15+Qelpd+gsExJwF?=
 =?us-ascii?Q?jbO/pkbM7REXxR7ePxt9tt5Y1wAP2n1owbd0WxXm2l8vBS7W4i7GNWGnmfZh?=
 =?us-ascii?Q?yDO+cWe+2kWgJo+rIDhu16+HgxKtj7wOq1KHv4N/+lElo9MSVF8PlVxQLtYZ?=
 =?us-ascii?Q?6S5SljLcQURQy1t24DyxEYh9X1QYkjNZIfx8i1+51X5SlRmi/lwHLJvbNT1c?=
 =?us-ascii?Q?RqpnDLT+K7T4vWy7C3WHxC5fvbtNab64X+gFt3kVfa0YzMgQF9XO1Ay32liB?=
 =?us-ascii?Q?sZy2xgbfC9X9gGcaJ3dvB9Sbg3hdOEZM2WcY0LqkpO/bffnif0VCr9gWjcER?=
 =?us-ascii?Q?VXM9FPArqNpm51B+1hFw7qZW3TyiLVTA2z9T1G+h8qf+KSNDdP/hKykUxHZU?=
 =?us-ascii?Q?g/nrxP5Z0stmVDiSnRUMcD51YO9GhyT0gdkceScPMhalvwVj9Nd+UbL/SVW7?=
 =?us-ascii?Q?5szqnfGS1rp9Qg4orv20RtwgJEMyUOHcLc1QTsjlS6Rq9u3Kltfprkdqxcfc?=
 =?us-ascii?Q?6iWsF39MitmCQB+DRlnuTbfx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f91437-4829-4a60-74bf-08d9046e3285
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 02:35:59.3704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjEVDE2V/wbQyNziaXgMXsywY5lbbozr1SBxc586UFY2ydj+5AHNqio9ZrXf/tzrTdptN6548axw7xf4wjYkBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8313
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX8MN/P remote processor(Cortex-M7) compatible string

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 58bc2a23f97b..1dc34cf5a4ea 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -17,6 +17,8 @@ properties:
     enum:
       - fsl,imx8mq-cm4
       - fsl,imx8mm-cm4
+      - fsl,imx8mn-cm7
+      - fsl,imx8mp-cm7
       - fsl,imx7d-cm4
       - fsl,imx7ulp-cm4
       - fsl,imx6sx-cm4
-- 
2.30.0

