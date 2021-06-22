Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B4CC2B9F4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Jun 2021 03:40:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B129A61164
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Jun 2021 03:40:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbhFVDnK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Jun 2021 23:43:10 -0400
Received: from mail-am6eur05on2088.outbound.protection.outlook.com ([40.107.22.88]:36072
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229904AbhFVDnJ (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Jun 2021 23:43:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrOGBX+cDz0Ih0nrQrxjimiEGBmN6Z75YdcmQZzXPbkE5vqjSYCbJqCZl+HMGIlDHjRseRyz9TUJY+7hI6Dbs5qpqtGzJ4l1YUbr+ryQdNGmnDMgiHeGYDXdT6jJQ/jxki+wltqpSD+H24uQEU/pR9ojbPhv6iykgU2SwJC/dN+5B9DZ2icrt5mmHyUODD/hhJ31qouoo9zELQXKTh/0ShikVEYKtrhRy4hfAS1wLSFUfrI+URTULZ8UEdKD8dOmh/UQAqicomVr51OaBrS8NqBi+5iGKceCN/+LlbIlwkMt/pFXzPvyHmXzEdMZ0vVGNmEyENtOVHechbUDJ5gwaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nl7kdnrmjgjMzeAsyZRRe43Smm6nZuCGyAnqgNkyU+Y=;
 b=H6nD5Ot8UFO1tHw9fYi5B6Xkr0GetkolrpDZ+LTaSU6cXZqSodqx9RPWd/oN+j3H0MuXfVr0JcQGHH7oufZ6oufh9bdyP6MklCeu+HhdeysI1VwSu74wUPfwIRFleM6NzSoe8HfLJSq2Cwaz85ItcGRvjhp6x5Myvj7fABxih2INRxHPFwgc/fYEvP0w3ZliZ9/2t6fitUkH1dHAOtOW3JQbhtmAzD2J3jpsdanQM9IzzaNL0HO3iOwMNYSC2+2wHuWBGRnuhJ/p8qg50UFrCdwunMGItDHYNtTt7xdH3emU7HlZMFqaggLL6WKCDeuI7l7N+rh8bYttqE15tfWkog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nl7kdnrmjgjMzeAsyZRRe43Smm6nZuCGyAnqgNkyU+Y=;
 b=GSKoZJ68CJq90wJQdDH0N77R+s0c+GS1S40yJqo49XVvUM/lR+3/FavYAI2O/E+nzIxUVE2j0Pq4wDq6WKXBHYKQNKmHr+A6sxHr4gH/2KwwGF6vuDLDLWpFlZFLKD7wozo2vJkxkDhbLTEQP0WArBFCpqlvIFuXw2XmlTcwGU4=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB3PR0402MB3913.eurprd04.prod.outlook.com (2603:10a6:8:3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 22 Jun
 2021 03:40:50 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd%9]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 03:40:50 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 1/2] dt-bindings: remoteproc: imx_rproc: support i.MX8ULP
Date:   Tue, 22 Jun 2021 12:14:12 +0800
Message-Id: <20210622041413.16992-2-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210622041413.16992-1-peng.fan@oss.nxp.com>
References: <20210622041413.16992-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR0302CA0014.apcprd03.prod.outlook.com
 (2603:1096:3:2::24) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR0302CA0014.apcprd03.prod.outlook.com (2603:1096:3:2::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.9 via Frontend Transport; Tue, 22 Jun 2021 03:40:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8457ebfc-6bd5-4f18-e433-08d9352f874f
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3913:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB391399CB4E2E6DEE031B46CAC9099@DB3PR0402MB3913.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: quyG7/HFgeGCUYXtRQpG5Ujl+ydMFrVvfube1Uxo2OvzgjQQRiIbvPhH+kPJZw9Y0UgcmTEcFCt4jeJftAvRZdqypqlkqEnFIX0AqL+oMEvSyEOMwEU845xKr8xn+v5dy/NUBLRm8PW384p/QX66g7Gyv7mEdY96CO5/NTcneNBFyDLVjCWGLrJ0ePe+7RArFpyEJfdHL5b46sLMQr476UTUkyiqIMMzx1mFZ4OcF7ya9uhqBJAO1AzcsNhvZA+maXF7RVLjEI45GqjYjWRYQrvV+2snLSzzT155PhraoDXT3Qz9Wscr4IhI/jpouMisU/O0QU1bpgtZo0A4ooXB5+qjDQRCYthyrgrkwfeJ4c7YOAujos7AowGrxjBsg3rSFE550htytZoWBwasf9SmLABGRiZ4PB1bQodP4J+mvYTjhYTsbPTX26qe+PtRVIavRb5qPAP3BbRK6hw6MIdI/qzTcHQxJg/w1w6/zRthK1kxRcMBd4sds8pm/gZvyZeq4ZM2Tb1ZQQE3+RWQbELpsRktbwyBGFsuFR1xpdKZ4EbB0/yG3DxwCVBw1iCyvC2sJCQNo+3aXnK/W/uyzIWNmrN+hAOBJqvp0oGHzUyvdf9sQG+gJBixBbP6lppQmn6YL601pkKskgmRcyggpHmiRpDYuGhETr1HiTF/rPwV96s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(66556008)(66476007)(66946007)(6486002)(8936002)(956004)(7416002)(8676002)(2616005)(316002)(6666004)(186003)(6506007)(52116002)(16526019)(26005)(6512007)(4744005)(2906002)(5660300002)(86362001)(4326008)(478600001)(38100700002)(1076003)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qCnF+WoYfW/Y1P+K22Qjm3X6z/4i35IcgNuIGB014gqNQ3W1oQO4W6HiqAOW?=
 =?us-ascii?Q?Wvum0SsMRlCv7qxRqFIt9xBxM4lU+BIW+azqpYnl5bLANt1SCWAdKfRIgyVg?=
 =?us-ascii?Q?ci9BIimadNrW/G7uMzL+5aKTTTZ3u61oU5xNTM1yQjOMqX25YbBG09vS/WLr?=
 =?us-ascii?Q?TNDOA/A7VzMUrq3/sqZjgUbHajzF/rx+Pu2n2Pevu3GZlfaW3qPZbPo3/B6i?=
 =?us-ascii?Q?jA3q4Oe+Y8EkiXRknSmwY3ROH8UX9cqyyotIH7HcC0LRbY6FPNtOuaAUThCf?=
 =?us-ascii?Q?hoKzz2uyGnb5a8d7ayLpGb/I6PPbHfLUMdtkXtx+hW+RwU1GjDvbKHHcUhKd?=
 =?us-ascii?Q?JdR0BSD6Vt/soncIN86DLfBSejrfkLfTycTiahkYYGAiDq0xswjkL1J5BTB3?=
 =?us-ascii?Q?kv1zxHpppWbrkvEC2VYzJeKs2s2eHCvSkhg3pnHyux1h309/+eXAmu9wE1oa?=
 =?us-ascii?Q?YiBSibbTgLscqyagRgBUGbwnsgirhbG7KrA0Iq9Rs3fRoB1U8giMqGt45YyB?=
 =?us-ascii?Q?GKtL2dmEpJUknAJ/kYFhJsi2s1ESD+iE2E8vJ4qrNtcReo7fgYlNYwFGqnl6?=
 =?us-ascii?Q?lYfPimPIjPgcuUxqzRAUqw3iE1Ys/03TR3GXXvCwQ1wYZxKDvhqTT9t1waN1?=
 =?us-ascii?Q?Fb+QN9epqTOwA8AL4ZpiWrBJMolUvy2Oink1FLZPlT926MZeRDYymhJmUlem?=
 =?us-ascii?Q?8g7dl+j+50b3M+t2M7Fay6Nrt/MciWxad4/bT7tCPK1K6Hbgo604LbgQY9P4?=
 =?us-ascii?Q?kQzkxNsKk4Pdw32u5754I5uNrs5tv0dHDaH4DOCAo/AzZTYork0gYoslxRFO?=
 =?us-ascii?Q?PWc6fp3sQCbxEc3xTjxSmuE+eYVdyWZufG/bNGRZLVzSjWJyBjlQQoGy6+Jk?=
 =?us-ascii?Q?tkkj2tJErHcsx8dmBatBMT30MtlgQzODjWOPyyqdR+H+TMN+1Y2+3nygaLkA?=
 =?us-ascii?Q?P4xzClNVokmVUNwTZpWMbX/5duHFM0Ew7vMHd5E9kb0Twqfvnw92+SLnaVB+?=
 =?us-ascii?Q?nQXWEx+uEZh9xI5hfrLDlyHbYZtkSsGdfxI2hEBaW+Zcm7nTwfr6mUDlwmP0?=
 =?us-ascii?Q?LxjZYZ+9sJI8SrF1fQNTDhGsNmrV8/DAV1HHN/VsEAH11s6jGv/hqAGRBGgn?=
 =?us-ascii?Q?hB4FyPJL0wDc5KOcnYu7JXPE/zmE1+EnK1UWb1Ybv6q1cp1wav1hEOHWqkfP?=
 =?us-ascii?Q?+oWsioS65owg7ipy99wvwe6rHcxy30ZWZCgLz4AKpt2JkvsEgmvpBIhSfbkU?=
 =?us-ascii?Q?NB/BmZQ+eIEf6y9+ihQ4JNXL5gIb2LEgXgFB8M/T0kJHjk+EAkne3cvwtYub?=
 =?us-ascii?Q?KkmZEGPDdxZI3iijgVetoYVjV82ZfMW9aVH7i9TDBjsfeQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8457ebfc-6bd5-4f18-e433-08d9352f874f
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 03:40:50.3059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zV9YNxcbbOTqPXpoFQ3Mh4L5iF5D9N0FX4FmAaVzi6tpggEOM4xZC8q+MmRA1jsUXfRQIRTnJbNIJJwtu4Dv2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3913
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
index 1dc34cf5a4ea..c28b767d246f 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -15,6 +15,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - fsl,imx8ulp-cm33
       - fsl,imx8mq-cm4
       - fsl,imx8mm-cm4
       - fsl,imx8mn-cm7
-- 
2.30.0

