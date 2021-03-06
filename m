Return-Path: <SRS0=jP1a=IE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C724C4332B
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Mar 2021 11:38:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3146064FEE
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Mar 2021 11:38:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbhCFLiL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 6 Mar 2021 06:38:11 -0500
Received: from mail-eopbgr30065.outbound.protection.outlook.com ([40.107.3.65]:64994
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230034AbhCFLhz (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 6 Mar 2021 06:37:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bq77aFN5yrvgDPwPSSeONW8HiDovOHIKXwr6zwHmQLgc9KLc6cQsIU6hsYbOpEmZlMcGoBEL3w21ebCflg4Qo/6SQLELOH0AWcjS8NGJWB3+97Kqbi6bEbG/2MpCetwhiyqPlgu/q9+/IXjoXlIlkNa8oJWquzBeMk75BFJSjUSQQr3P1z5qw2BOLkI8yz7uBEaKvvVK/ZtJgeq0BiZOCjdug8i/b13Myft1FulE53eFB12YFAA+ovNUu8sK9IF+QrVatmDkjDwQn8th5C09jAJlur+mVsNnHyJHfyr6p+zzsiW5476Z6Fg4HLcHEBQXz8j99r26MT0Z6TiewTh0FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKTgz6g3bhbNjC5jn4bZA+1dkA94Q3va0AGpybirrtY=;
 b=Zutg5/W2i54M0toGPgl7NTkBrxcU/KtK+kN0zUl6KVqCoAbC7aIRA6H1XMt3NEsI/gHFV1wuNbaO90EbNNvn/LUUwF4M6s4BiPEqyw01hDZJXFRSAwx6QYjbu+a++RsjEfa6+RXpLWNgHS7ScdxnEBaQ0ww8t2f2jORsh2HzPadInTR8zfjHLu+KrJCfrTBQzoNaxTRzEBNlABblq/4NKvnwtpzXtODTwRyNzhHhhKkTBeH+5CEI8aQJkri5kBEQwWF5E2p6oXaHtNHJh+jlu4q40vx0at8VjLR1HJc7xrI2/z8eVecLFKQNBxYu276SqyWhxZt/SaUjhmQuHJVSug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKTgz6g3bhbNjC5jn4bZA+1dkA94Q3va0AGpybirrtY=;
 b=EM+s/sUEmtAK4oeJfw6q7yGNQItArmksRLNFR0tO3ssZ/TkUUZfpUKXB+IHkDgVgn34xHSbucrNelxibe32cdJEHu7qzOSYSVoQIjd6DvamheU8iMQFTC2JpUNspa6ghzSPXpbqHnBxpJXMANAJL5PaqOyaz0zPZkyjcHoSrN50=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6618.eurprd04.prod.outlook.com (2603:10a6:10:10e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Sat, 6 Mar
 2021 11:37:50 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.054; Sat, 6 Mar 2021
 11:37:50 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V13 02/10] dt-bindings: remoteproc: imx_rproc: add i.MX8MQ/M support
Date:   Sat,  6 Mar 2021 19:24:17 +0800
Message-Id: <1615029865-23312-3-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by HK2PR04CA0047.apcprd04.prod.outlook.com (2603:1096:202:14::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3912.17 via Frontend Transport; Sat, 6 Mar 2021 11:37:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 09ccb520-783e-4c42-4b1a-08d8e0944592
X-MS-TrafficTypeDiagnostic: DB8PR04MB6618:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB661884AD1058916520BDD656C9959@DB8PR04MB6618.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /qIXMe+AlJJzGE7ugD+0Escm9I3znGzoPFIK9apZJyUzThbWQoHEfLngMYbxqlEdIYQiGvZXJjo5jFkxPgdPeRVxkxtpWFs7GV3g5QLMUh7HvF0+20L3nDK62BirIIJ9mQKEpM8uutUoFlnXowVWwqDjQdKLDeW+8whboFu9bA22uFCdVkN+z6Y5LIsyrznvTMl2Et0ky6+bk2Rmbf6g1VYzYcCnKkTIF7CuqYTx08bUUNoBCsmaYb2hMV8x1eIZZrMyBywDGEk19lGKqVPAVbYjNtpvANMMQzOwlyftrNuVxvJBry/nwL7tR+7KLaGvxmH94l6QPbhoYUfCloST2BQVWVoekLcPV/eZCokys2zejEjXKb2Dr2Lnid9xV3lAFAz5ogZkHdypRZB94s8ME97bxKeEZMkLnJhyLTJmo9bLLgkPunhfqvvE83rY7iRfp8lxh4Zct6jez7Nsnd3XlbFpaP7ymcAUeRvcEPvlCWiAThSaSYV7qY7wtx/qe/P1pVc5PBX62hIjzjHmtiPrHfxk0wTNJKGKzu+jrsSICogAa5YOaru7/3/BqchoRiPV4eraaa6ujuCwLYZaygVJlmLcDISAoh/f7BPpElupilyOJInn+obG/czuqDlk3rZJ8aw0T5trWU1JVVKYhtXRT/7XrxLvyy42saiS3efApeE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(83380400001)(6486002)(9686003)(6512007)(2616005)(956004)(8676002)(6666004)(69590400012)(86362001)(4326008)(66946007)(6506007)(7416002)(2906002)(52116002)(186003)(16526019)(26005)(8936002)(66476007)(66556008)(5660300002)(316002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2WB/+dFbzRvIm+N62tuucSTorEz3nJNEZ8uU3rgC69xgY1pRK+EBE0uY0t2c?=
 =?us-ascii?Q?7I37Vu0kGWbVUziKLUkqE7dQ1+Qw55vA4nL9+lglx/R19wU1/NNJundz8SuG?=
 =?us-ascii?Q?AukwNMN2EVDYzC0VG3a8rV6pGcBiD+qGzNWKMw/qiY73P6BVOU4FhQsLBJ2S?=
 =?us-ascii?Q?kg60Krw3Y/cvieHv/zjX+o0+Ykf84cyxBgb1VjG2YCemyO24VQA9TH4jhn7b?=
 =?us-ascii?Q?UOUZogRvSlRVxitMnMYOcu0UBA9DZHsj6DyNoAD3/KuQKj0qqT307rePRnjj?=
 =?us-ascii?Q?pt4Lbs+gfXJVViqCm7FUhFsrC/IaZDsTL9f5mvX0hWHJLbcZWvqkqLToUaSk?=
 =?us-ascii?Q?y5kc/SK0b9GMife6mriju7E6O4wlAzKMXfCkK3WBqyXfKjz2/+bqarVcZSca?=
 =?us-ascii?Q?sRrEem1Rsi4a05xaM6tXgIIs0c2NKB4FPry22g0QOR66XWsTL/ItyeOJoV00?=
 =?us-ascii?Q?nBvKSW6ihXmJ0IN35djCCr6u4tdYTEveFO8BN5k22BRfkxAXQFkDr5TqpHGH?=
 =?us-ascii?Q?YWEEjDhZ9hIUw0EhnHmELEq5TxBY7C/HS8wm/LEDQDO3lOpFBypTJgfpNsgn?=
 =?us-ascii?Q?FPBoaLd7BW14Ufx+RAXV5Ud4P3uJH1U8GU0Gl1lx8LXFbdAfIrOg3s5L10nz?=
 =?us-ascii?Q?bCOFjgZIXE48xtdof8IaT90Q7IykN4wOqO1zXftMYFJmenkAJ6MR67aVeeeB?=
 =?us-ascii?Q?wY+uCyE/wX/UPUvXntlDULiRtxLDrPp6RHQ1dJAyQzdz0xAw1EMf5dpOpgnE?=
 =?us-ascii?Q?bMhYadXMXrLFbfGLAOLKn2fWLukzAjfK/aDM2z07rzzjNBFx0H7nksFc0H9Y?=
 =?us-ascii?Q?rULBKgkQM77vXmls18HjhhuNJUZrWqVdgpUpEHzjwxz16J33Ylfp+esaIO6x?=
 =?us-ascii?Q?2ed2gtwz3OeEk1u2rL7dTcMqcOAz5x4ozxJh73Y6M9cnV5jO/CQGvvrNDab2?=
 =?us-ascii?Q?ktGG2/2sfHu5RU2mlopEcWNscboF3M1GYxars0+XsaR8T97w5x7tsIEQxA7M?=
 =?us-ascii?Q?P4ROKZIRpd82G0t8lHVGWB9dHHGdDoLYxvfWpcOahysV0EkQtDgbLE8cONAf?=
 =?us-ascii?Q?SDQWWdE14+UbkH29bWxH00Woqkqmbc65ZXgvyjQkd46r3vNnEvyQqtY3sCI6?=
 =?us-ascii?Q?w1HVCS/rfxN9J5GWMZApPTSArHBV9usQwsA0gsw5VdJ8E0bydFa98NPZuQz5?=
 =?us-ascii?Q?ugJ1Nagd7N5HMZIlVzP3ksdATh2C+SfAbD2j00+uOGFAWt61XHnM347CQne6?=
 =?us-ascii?Q?EJMDcsWVp0VFsIltf4OHvnulLaJF3PhNXYjTqD0yOfMO2RZ/dP06wi4NMPmF?=
 =?us-ascii?Q?yiWprrP5xH6GG/8P8aQHi9yw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ccb520-783e-4c42-4b1a-08d8e0944592
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2021 11:37:50.2081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yy0eba5YqSFV9oewW4hnHBD992rAz2untkf16+yuB/kxnh1tCWib84PF86QQUASw1Fgp0SNnvcAa28dzFdelUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6618
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX8MQ/M support, also include mailbox for rpmsg/virtio usage.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 31 ++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 54d2456530a6..208a628f8d6c 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -4,7 +4,7 @@
 $id: "http://devicetree.org/schemas/remoteproc/fsl,imx-rproc.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
-title: NXP iMX6SX/iMX7D Co-Processor Bindings
+title: NXP i.MX Co-Processor Bindings
 
 description:
   This binding provides support for ARM Cortex M4 Co-processor found on some NXP iMX SoCs.
@@ -15,6 +15,8 @@ maintainers:
 properties:
   compatible:
     enum:
+      - fsl,imx8mq-cm4
+      - fsl,imx8mm-cm4
       - fsl,imx7d-cm4
       - fsl,imx6sx-cm4
 
@@ -26,6 +28,20 @@ properties:
     description:
       Phandle to syscon block which provide access to System Reset Controller
 
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+      - const: rxdb
+
+  mboxes:
+    description:
+      This property is required only if the rpmsg/virtio functionality is used.
+      List of <&phandle type channel> - 1 channel for TX, 1 channel for RX, 1 channel for RXDB.
+      (see mailbox/fsl,mu.yaml)
+    minItems: 1
+    maxItems: 3
+
   memory-region:
     description:
       If present, a phandle for a reserved memory area that used for vdev buffer,
@@ -58,4 +74,17 @@ examples:
       clocks		= <&clks IMX7D_ARM_M4_ROOT_CLK>;
     };
 
+  - |
+    #include <dt-bindings/clock/imx8mm-clock.h>
+
+    imx8mm-cm4 {
+      compatible = "fsl,imx8mm-cm4";
+      clocks = <&clk IMX8MM_CLK_M4_DIV>;
+      mbox-names = "tx", "rx", "rxdb";
+      mboxes = <&mu 0 1
+                &mu 1 1
+                &mu 3 1>;
+      memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
+      syscon = <&src>;
+    };
 ...
-- 
2.30.0

