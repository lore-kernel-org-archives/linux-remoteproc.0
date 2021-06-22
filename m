Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B82C48BE5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Jun 2021 05:28:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3975B60FE3
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Jun 2021 05:28:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbhFVFar (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Jun 2021 01:30:47 -0400
Received: from mail-vi1eur05on2045.outbound.protection.outlook.com ([40.107.21.45]:18431
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229873AbhFVFaq (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Jun 2021 01:30:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xrzm+ekCnu1CpzDOKTYESj1nL1ApQqsQPrUyJqN2n+sM5/3wZKsGx3mq0laFlQfWUcWuRjEnYNgJN5aJ71plYGJ5fAPUoVqH90GGV/Ptx8pNKEs7XWrrsYIu87SYkjGqqEiyCo0HMwnqwhpiBOXDhneKhxdejNwG4asYKU4AyolOmx5kwK7/pFgLPJQ3p3EMte4ACZ5dwQ+cKIH+W7T+RlJzhxN7zLQhNhxYrni8WRrkki1aqjQkpSSqXLsJnHWJHrcbNpkaJhCP6vfZ88Lji6eFC0LfZ2om3ZNq8pd6Bg05Fnm6asb6vbs/s8C6UVWog1KspeDMs9HddXhIXGp/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fQ47qfNTdVQ24pblvmKzuAf77IiQycsu789zHjxGCA=;
 b=Y2X0tKXCJ0bWFv2qPzqv2u3V4WkdwrvIRulaQak2OoMjlqkJCpCjHniJ4tbSVxABqphOpbt+99abUUKxUZ8zfvzYmtTQng9XHGDs2BsZow3/6Ix/5OC+LfwJPd2ueLYI5Iq6CGsYWKjN0ISsZQYJ7fOHeUXFHkjsltWNcqehfQL0kZfu4QdX26Ic/yACfvdj2RxfqK1/hVxdvlzTN8Own9x4sYig6cAXd3PzqyrCWi5mVLmZyF93CldVYHljkxq1L+inW/kVVOt6hNMI5Oy3RVM8x0u4hLxTWN/0cgdn97n7obx8Vc8vQDyf//RZRnDOsTwHX2Bk4AyephzAlXVUxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fQ47qfNTdVQ24pblvmKzuAf77IiQycsu789zHjxGCA=;
 b=I35oXEDxJCNTEkDFVn3g0iklMaNVzXq7Gp5xqFw7SRHYaB3mOAbHGM6YWlFXzOmK2I0FgaD7kwA6d10My7wB3DUF7PITcR1LOlIdkf3bJkR/rlpd2ZmLi/vu6ueKExJ+pmFSk7wHgnjjSUdsR4G0RQyFruRr9/IpMVIwZDOqFC8=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB3PR0402MB3659.eurprd04.prod.outlook.com (2603:10a6:8:5::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 05:28:29 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd%9]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 05:28:28 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 1/2] dt-bindings: remoteproc: imx_rproc: support i.MX8ULP
Date:   Tue, 22 Jun 2021 14:01:47 +0800
Message-Id: <20210622060148.18411-2-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210622060148.18411-1-peng.fan@oss.nxp.com>
References: <20210622060148.18411-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR03CA0133.apcprd03.prod.outlook.com (2603:1096:4:c8::6)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR03CA0133.apcprd03.prod.outlook.com (2603:1096:4:c8::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.10 via Frontend Transport; Tue, 22 Jun 2021 05:28:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8dcc46ea-333d-4de2-0f26-08d9353e90e5
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3659:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB3659BF25CA66E85634F6973DC9099@DB3PR0402MB3659.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mzl3KAG6i+Yajth21sRcZc+zx2P9yNVRokUa3KaXQHasFdM/I/236EmRIVOYdy+uYGcnnWsOAtwlRSp/QYMLlt61rcOhzaSDPusiUPomvSHGocRARts/8dariI+iQYx9X5qpm5g82L0BmQLhNjIYCFFDAMLyMtYXD6QbXQ2ZZwVQRGJ3wZg8M68HGPR3vC2r9kJjR1eHcHSWxyBKd/bI6hmrKvvN4VWl+n7N/ec0qqgXQDgHUyUjaJW65XyowYT7kJSIkVpnRnJ7UrfxNUfsEkQopXmiW+tfPP0tHCqXGgHXPTlAnfLstHVSljLd6C1COEF7IsnbmiYMYlVpPq5S4e+4hnYDNXp/wMZq7mk85k7McLp/wmJejh5PEMdPbdceFlT8Eb4mKp5lHBnPhcwmpg+7Lwdjm2xSSA2V0BWmwsK2S6DyS64HpC8ufIF2m3FR7n9GZju0tfw3HLvoP1urIi6lP3AEqluNXYIkEIrTCh/aCTlbY9ggpEgsITIyizilCFYzolmxJL9FcKZWZnKfi3bftAXc9qKPgGo6dSp3nhoxklI0ZiEktMPktmUg5YpTPyDRrBTnI+I2V6iuqcEq6wMefg7j1aUK3tv+QK/AFo2D3zMxlIE2JZQMMII2FQhpkQ1RA7n+xqrGDpofbeQ7XX/QtCc64In1AhW5E1OzLKc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(5660300002)(52116002)(38350700002)(38100700002)(1076003)(6666004)(7416002)(16526019)(6506007)(26005)(186003)(6486002)(4326008)(86362001)(4744005)(478600001)(2906002)(316002)(8936002)(66556008)(8676002)(66946007)(66476007)(6512007)(2616005)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8pz9j7c22YhRxrCbP9a0csY/v7pcGX+09LwchHk5pfYIcqWDlyLMUL5giUdf?=
 =?us-ascii?Q?8yNjrrDxW8DOz2gVHszLGJUfb/nR7bOZ/PLjrG+UKLCB+/NG71yslOw45Jvh?=
 =?us-ascii?Q?nb0bDm70QNOmiq4k2R8PrZ5YRiGoM2uPGKfQ7NHmo0gVQWv1j3EY7AwNAT9Y?=
 =?us-ascii?Q?QOkzyZQAqNuB28I3Iys1yyChkRaaqfLeccbI8kpXq4mJMWkMkRVl/UbQhAaI?=
 =?us-ascii?Q?RYfLi8lKMCLMrJNbOGt+2aGv2PH9Ik2pQ2fW/1umdan0a5PeL55AF3TbeJWQ?=
 =?us-ascii?Q?GVLneizCqo3pp3NIeHgY/b1S5G8WZopRpCVw/PHLNmUpYZXLuS4D4/30+jz/?=
 =?us-ascii?Q?40Q6YG/PXOi5nZna5ntColSGk45XxgMkxqsgiyY8dHFxCJ5wOHekssbz2zC/?=
 =?us-ascii?Q?uQyPd1ec+Jp5L++J62X2RX6Of5xcU5kk2N9y18BEEYBDXzT/bwcVywTXcrjb?=
 =?us-ascii?Q?SW9oItQxfhyX1vgCNN9TswmGkEHBsy/RHWuH6JZI9ptZ6Ycdx4CCkpOgKyAC?=
 =?us-ascii?Q?DHkxXu1djRGG/PLrukQep+V/h7JyPWp6obIkAXRkvY0/prc0D0OydFziY5NL?=
 =?us-ascii?Q?Za7voxUsKPgGWXGXVBJHkOKkJ6NAieaMk4Qce/jjeWLpMvWQ9JCsXNAgLWhe?=
 =?us-ascii?Q?egJ0UUjO0d66vlcwel/eQeRiiQKDUo+iEBJf2mLatlXlQSSmcUNdgtD8QkaG?=
 =?us-ascii?Q?KIviWzpw5dK4QPXl1KMSnQehGq8BySOuUEDWVarzhLoAbElE2u8o6SSCZuAO?=
 =?us-ascii?Q?6N9afR5DihNavXI6z7YWg3i1naDuFYW2adb8K1l+XFjyJNvDNrbTo6rzjv2A?=
 =?us-ascii?Q?PGGeorLKwKR8grn5M9sUuMbSl33HZ98FxPPMYim7EBZEKDGG72FtIIozYW3N?=
 =?us-ascii?Q?jT6hBlAcFPea8d1IjwjqKN2vvkyXuDik47akDY+yTWIGRygn9IbEQ/Xrwxf6?=
 =?us-ascii?Q?Eb9zwJ2I8+pB85DVmMpV5jyBc/wYq4agGkpd9SKo3JiP6DgiUYzgdC+CNBfs?=
 =?us-ascii?Q?srd9jyRwST1kAda7gJ3SSDJfrFrY1/PO+siMZ6RM+cl37Ax+o9KM71XzN/Ss?=
 =?us-ascii?Q?0BNtvfhGXerAHLUjWOFDqfID3iyhgvoXW4MLTCAHx9dUGyZsaLztltEuVsRs?=
 =?us-ascii?Q?VNszK3l4n6oQ+G5NENWTnq1CUdFZD3SoGLjudxXK6d+hHO3SmKWN1OBG7TXf?=
 =?us-ascii?Q?EWV14aL+hXbliSftTxrYybHAlxQ532lzdCvxSbWoVMeHDEtcnq9Nf6UkIAo9?=
 =?us-ascii?Q?kYIdCC9NHSxMmpElmj0jINxDIb4I+tP4HfW3oXBM7ztg526itU6LAl4gIYWx?=
 =?us-ascii?Q?3Dsq4Z6WC2jYMVklJiaq4ySemjiJN8RK02F91Zb/kYIanw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dcc46ea-333d-4de2-0f26-08d9353e90e5
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 05:28:28.8699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+4O62dsg1nD54wQ5wO9/MeH3pqj6+k50og0LfP40/xUbqSpOwOZCz062KHyxmiV5+9eLnDP0rxrFk/noH94fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3659
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX8ULP remote processor(Cortex-M33) compatible string

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 1dc34cf5a4ea..fc16d903353e 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -19,6 +19,7 @@ properties:
       - fsl,imx8mm-cm4
       - fsl,imx8mn-cm7
       - fsl,imx8mp-cm7
+      - fsl,imx8ulp-cm33
       - fsl,imx7d-cm4
       - fsl,imx7ulp-cm4
       - fsl,imx6sx-cm4
-- 
2.30.0

