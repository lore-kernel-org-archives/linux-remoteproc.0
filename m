Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12807C433C1
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Mar 2021 08:27:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C739761967
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Mar 2021 08:27:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbhCVI1K (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Mar 2021 04:27:10 -0400
Received: from mail-eopbgr10081.outbound.protection.outlook.com ([40.107.1.81]:50146
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229455AbhCVI0l (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Mar 2021 04:26:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyapJXqGHyS5F5Z9uvBDAvsFHs1rbpV04e73sT3xU6liW6rjR56bo1Cui0Nfa2+lULXhghmx/iQpYevNfaaxPg66r4N4khcFp9hZB7ObEkHFvRlb5cxKC/+nY5HHdnXf4mjzg0qIDCNSgKRwI3ePUbK70S+KwMi8V/R7WqxhuFLVXD6GLztqjr/98TcoFXS6PBrw0HwZkjr39Ixwyk0NQfN8rhi9ogF/4A3R2losF397ygQJZxxiC2beOmWT/QM1girmPI777LNKdLXis7TLz8LnhPkuIM5R7aKXpm6na+j3CakHSnLOBDTvghjN69Pl58786ajEjV9ZdlZOsJcR6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qY6LsdA5/8HJeb3R+ChK1pz73fGxLYmYSSDZI67rwo0=;
 b=F6Oc1iPdObweTOqc3TLKVNyQdqFtj0FjXroBOc8jwS8pYg2MU3Gm1fZDBUYo0Tmfz1ZJT4GLeeasryjQnqT3xpOBGHYdio0Y4o0us4LtJkF9HFrW0kcH2aIkNqLtaMpRnmtOru9VCcJqsUXf0mhXgs1mSD/tx5e/FTUpKlHFn3fU8Ijjtmtqp5mBum+xH67E3wFQCxXbKZR7dkgZGlyM2GAeoIqm5UUXiVXUzRjOZCjrE2j28YK3j9pJvh41E/ovXAIWdxsu3JzCWC5oYaCughY/O4Mz1AT8CCFctrhYadsAblpsGIKgNNSzxDbEFWqujHpZOATmdCNgoxBcExQj9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qY6LsdA5/8HJeb3R+ChK1pz73fGxLYmYSSDZI67rwo0=;
 b=KqBDSDOLratdQ3xpqHxz/WPX+yTqDZ8L7iUxUf3iQji3qiY0uTzA97Gp5V+CLU8ic/HVhHDJ6X8NbQ5Lm3Tu9Y1E90fnjUXaWVHciZb9ssvDrMFD4GC/w+UlaxGfueD9PDOV2BXKsmfxV4Ej1YBBiNhtbymoQGscYSteFEgYKog=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8316.eurprd04.prod.outlook.com (2603:10a6:10:246::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 08:26:38 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 08:26:38 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 2/8] dt-bindings: remoteproc: imx_rproc: add i.MX7ULP support
Date:   Mon, 22 Mar 2021 16:12:37 +0800
Message-Id: <1616400763-16632-3-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616400763-16632-1-git-send-email-peng.fan@oss.nxp.com>
References: <1616400763-16632-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR03CA0007.apcprd03.prod.outlook.com
 (2603:1096:203:c8::12) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HKAPR03CA0007.apcprd03.prod.outlook.com (2603:1096:203:c8::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.9 via Frontend Transport; Mon, 22 Mar 2021 08:26:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3015358d-4788-4499-7c96-08d8ed0c3641
X-MS-TrafficTypeDiagnostic: DB9PR04MB8316:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB831658DCD7BF85C4F1C40BCEC9659@DB9PR04MB8316.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NJMubg5in8vmhcsCRIAzW4NByhHbfMG2w9RdnOXfRqYdJkhJTvl9YVDDdNqzr91iY9Vcz2k1Zpf9cmKP4Bsl969XvNma9D7y2c6bUrXK3SiSz/Bjm03xdjUoWYfmR1zCjoUvBAIoAcvHhHlDnlLcSrsb32fveTyru0Yx6CpSNmnK40/svt3I5fqMqoc2bfk+ZK8od2Ooe87TWsaWOaz/16ahXAYhVXGE3IZd2RupZ6E47CQRkH1cg8xdvFteKKNWqUUN/lDTVwMPPKcZakFIylUcEwfAFwktfo+cGsktBmPUYTZ7W4yTcrNE/xvbApqaZ9gzcZ8pDr0dL7hhu4zjJqHCNwsgY254LqaH07wp+VlS0Pl1uwhpGFS8YDwt/Uu4DGJUm0kQqPM+dB2Dm2iV4r2qKu7ShXDm9HmeVVCXIZ1LZoxG5jnoQdDKKKoX+qg+3GZcvG/srP0Vm6fil/oXmOITsU4vtIMDIr9u4la4PNkJrsRoW9TUkG8f2cH7tyYR8U+Hlk1zAJzqZpOmb01o3/wWpQfgX8AuFLOXlhMrGK3cCzHuw746vWX2an8X4TKKOTxH6r+YMhZ5vYYh5KxGU0lAoQUjbKa62kV5xhqnj0sAbbK1LENCAulgoi+f9K/yWAj9cZf/SeKJoKpaL1OIkpeHRrDbGe+vR9Ord1O7WAd8INuQy8Kxu0Xi3XzcWHp8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(8936002)(6512007)(66946007)(66476007)(5660300002)(83380400001)(9686003)(38100700001)(86362001)(8676002)(52116002)(7416002)(6506007)(26005)(4326008)(478600001)(2906002)(956004)(2616005)(186003)(66556008)(16526019)(6486002)(316002)(69590400012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?k4eNw+vg0ZD2S+hg5o7Z8qllh5waEd2ou1BcJ0ZioL8ObubBVJ1Rc23ApDj0?=
 =?us-ascii?Q?H1/aIas7Z8xN4sDZ5StSkSDRnrB3ea4rsb8hYipfaogFJXiXS1rh2lSL6BjU?=
 =?us-ascii?Q?8AeIvdM+U3gETst1uuWLC8XFFhBP4bliUQiEA4OI4E6XIGaDngl6LU4AVfnt?=
 =?us-ascii?Q?q2XlGEAF87nE1mCko/ctGRJrJuSFBC6ELVnq3Vwv0uYPTClg1CkK/5Cxdpbn?=
 =?us-ascii?Q?6Gk26e/AMs8L8tynM/9jDqpfTtmLCaRb9XTPUJiDM6VUFGuo+4n04lwPf5gn?=
 =?us-ascii?Q?4IqHA3Yyr8V1/hPw8ybvhaV9SPnL8bFCoYqsm116ZKMDkQM9IqMb4QpBtH54?=
 =?us-ascii?Q?vj2OgZXNoywdebmmZO0uCEXkERsA6d4JlXecQO3VnK9neDtI+47r6h5JVZ3+?=
 =?us-ascii?Q?SF0PW9Xb3JHiUmH7XPqzilpHV22vlKDu++ZHoeyV4+M48qnXvBBaDjmFRgPy?=
 =?us-ascii?Q?a/AfBfUAW/EXRSF7aZ+/MghIz/ofY55EE5iVcs06zWrXEcZ3l9Ow2HUsxyf3?=
 =?us-ascii?Q?kZ2OSb041NHXntmuUK5hOcEAz+dyQqiC7yxWhvQQRdSBzCAJUU+sXFKFoA2L?=
 =?us-ascii?Q?K19Pzqn3twIl0BNXKAdt8W0m2EaCZk3ZqLZSf3JSs2VtDGJS8E79hSMufwax?=
 =?us-ascii?Q?WScuU14lRbhN2Z+dLrUNm8YFIwuzUHE/t6NaAkzXsI7/D5RZqIz7jYWAe3IC?=
 =?us-ascii?Q?IkcGeIi7dlmqhX8zi2X/Pvy/FG0IDGsqNdRwiuzyK1hRJ9VaBq5tQLvYXmb3?=
 =?us-ascii?Q?eli+633H8bA3FySIERw5D3RxGfkYu4BZcil+rb4BwgGmKlIGVshlVT2xJUUe?=
 =?us-ascii?Q?QVFwCgqOx1JDXxir82VoDyKO92yqi7f1NAITsOMEWV/gKS9ZgSBkMLBK7AkL?=
 =?us-ascii?Q?ofT3/P0MWO3QipEEct+B/UegFwqdCsrRgqyZy/uqAsv2SxE7m7Ons3hP/66/?=
 =?us-ascii?Q?MZc8vb/vu3ru9JIrgOLexiNXsn0KV0+MAHiZ3RxcUKWfWvyWeIGsKI+jsV6E?=
 =?us-ascii?Q?iWs5zxEWmIM/b1YXfLBlFO20XASe/jLsAaztVnzLkZREOyRGtoAVMRfgnkHq?=
 =?us-ascii?Q?9zDxhZH0MCmv88/+41/W+2OdRO6QwD60pn7HNoxC+8eJ3LQO7pK5bqnzu0rD?=
 =?us-ascii?Q?e1iQDPUh2g7xXnAyw7jbNZAmm1z49408kwQBQI5ovys3L7v/BA+jBRTKiEjY?=
 =?us-ascii?Q?NVy/loLgfJT10u2FhVHKAateMm4CzyubsXSXsNmzEAZ8nmRBOVf9Tvs5GSvQ?=
 =?us-ascii?Q?b2G4moeldBRdxvYWGkwWAhp+ie2divszvKncQbyZpdzoM3tkSinpokMXGmOr?=
 =?us-ascii?Q?yEEyyGsJMSGQLnQH5rsdYDwv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3015358d-4788-4499-7c96-08d8ed0c3641
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 08:26:38.2125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LNOkTAuOhwd/N5bkTG6DLGtbhRUcbiMB+ciQPQrQaqxYstuzBthGy2jokC3xxyj9LifII4gO9ZwskO1C24moZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8316
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX7ULP compatible.

We use i.MX7ULP dual mode and in which case i.MX7ULP A7 core runs under
control of M4 core, M4 core starts by ROM and powers most serivces used
by A7 core, so A7 core has no power to start and stop M4 core. So
clocks and syscon are not required.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml          | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 70aec1a2e86d..3040420ad6a3 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -18,6 +18,7 @@ properties:
       - fsl,imx8mq-cm4
       - fsl,imx8mm-cm4
       - fsl,imx7d-cm4
+      - fsl,imx7ulp-cm4
       - fsl,imx6sx-cm4
 
   clocks:
@@ -57,8 +58,6 @@ properties:
 
 required:
   - compatible
-  - clocks
-  - syscon
 
 additionalProperties: false
 
-- 
2.30.0

