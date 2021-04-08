Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DF1C433ED
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 02:09:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85DF7611C1
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 02:09:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbhDHCKE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Apr 2021 22:10:04 -0400
Received: from mail-eopbgr40051.outbound.protection.outlook.com ([40.107.4.51]:14055
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229601AbhDHCKD (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Apr 2021 22:10:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpiNp0P5aOhu4IMRNceZ8cU3xGbftsqvSPootz3qLX4I16K3AfzU3UXkjId2Otqun6v+eRqZqXXsLO5VwEwqT8qevg+kqq6/ehVG1CABrrBDQKOgU1ZoRkI/HaCnoYuLSc/3VeTeKnBSkdq0Wuq5+xJm9ShW0PyAyrq0TpMChzaSlZVkEum+2FqN2ZeN65s211ilveNQnKMCFzxPpARurZyAL9c8V7RasJq9T4TbN8HCuvNl4bDLvOZwTr5ogaOBuq3wqWU8I4PVMEy1IGc5zms3owQdMrFFwHTCy5kjE3q9wAVxrs9US0K1DgArn400Bye6dCEFbZRGxM4W9nriMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpSkQDxdTUnkZi54DoBmuWUwyFCQx3+SWd8YixJUpzA=;
 b=B2emJIouqKaF/pBz+V5w0LX4B4x3qo1UpOW1bOAgRVYmQGDvvpRghiPjsPrWJF9FQDbbqqNPKdBg5jQuFSJtzZmq+ibUPpQApL460DHrZ40oZpg8EiOO2yT9eIvLhFBYRzmRzbctW8uTYOnVGvGSSV7KrZyl0TcOU7Pw/1BCcZwnSQa/RSQwS6txNvM5xZHuzQxgVrUq8aPn4JM4hv6QZV8A2vvItuL0rQoGXymaMdLPCIxqT6KMQ7MvplTJRGmshyRrfSo9JV7sSjegeY4YMyCnrxwQZpujJt1FVjS8yjEQiIwemWnxtEhXvImryo1w2azcS6fOvaRmnnMaC0kdqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpSkQDxdTUnkZi54DoBmuWUwyFCQx3+SWd8YixJUpzA=;
 b=EEfzzGxFELH1rlz03FiuK/UGN4OK+Osm6mvdNhV/7BtPs1WsaAVJZHbdAF9r5WUY82E/1Y/AgMsXZLTSaFbdgpFdkV4HUs9v36WIM2QCPhdx/7pj2IaVpcf56DeqZz+fdqTxIghIdC95FQpeB003StIWzWyj8QEok4HNzCkhKRc=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR04MB3128.eurprd04.prod.outlook.com (2603:10a6:6:10::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Thu, 8 Apr
 2021 02:09:51 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 02:09:51 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 2/8] dt-bindings: remoteproc: imx_rproc: add i.MX7ULP support
Date:   Thu,  8 Apr 2021 09:54:52 +0800
Message-Id: <1617846898-13662-3-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617846898-13662-1-git-send-email-peng.fan@oss.nxp.com>
References: <1617846898-13662-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2P15301CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::29) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4042.4 via Frontend Transport; Thu, 8 Apr 2021 02:09:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b404c2a2-cf01-400b-e851-08d8fa336498
X-MS-TrafficTypeDiagnostic: DB6PR04MB3128:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB3128C1C814F8EBB148C9467DC9749@DB6PR04MB3128.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C5V7WjAv+etgQRh+rj59ghxA1RG6MHvIrdyTsDSzlocQobTorLk2IM4nYG9rbOwjv2V3QWYfO+GRil4jTid3intdzHFRYThsP7OBvfQFkKv8KNEkOGSXFg7WPVFOBicOpCfKrxIVWJ1xSxOFE1qtWVxo8H6o5iwAF/+6MaXIbRErLXHBR+f6r7GVW93NCKR/Vbdk6n4zdM/VUsBdz0aVCgkhIDUmhR5dcdom29tQeajNvALSQ0JV4drg4xMqeJPDd8371oLnMHm1ep5FAwtqxbA7AQtuLhtYT3pkbNeYtvGOKCUGaruRu/OCMKsJTek06uH1tW+W7V8xjcjlnGN8/IQrCd7iYyBHZitupp1tOhtEtmirEQugl8HTldcr6cApbLqLZgLk8v9ckw2lItHWu3kHRzn6bd9HlJ3jruFZyHi4aWcAU0Wv5++FewloEM9tvzZhysMdduN8Fd4THz8UxesED2wg4dH5+WtQ2uZ2h9Gw22sfGo3lbiH9TT4WL3v/D7NAYM179sB0abOoOpEUeeheg05Il6c72VVgexDaCOIeoQ2Iz8LLMhPY2R9/tWTMmX5E3AxLxsV+cGy9sFNm/+00EMjPpcg8uR6v+Ed+JPV2lLmakoFIBd++stvjz10K/ZttZGeOXrAl6pQBq4a+WJqzBIACS05knt8gTZrVdlxQOzwgQmGyp1g7UkBiQpzNI+yvmfSPdECC0hgnf6oLEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(6486002)(4326008)(478600001)(8676002)(6666004)(8936002)(26005)(16526019)(186003)(316002)(52116002)(66476007)(86362001)(2906002)(9686003)(6506007)(66556008)(66946007)(7416002)(38100700001)(2616005)(6512007)(956004)(38350700001)(5660300002)(83380400001)(69590400012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9n41qO607vyErS0brApWsFZhU+CNKdgLWG8SBS+vKQApE6tybdYqor/Lnedc?=
 =?us-ascii?Q?J5cSltkHSBxjk9dseMlpbfMEsjw4mAlbY2ng/7CAMFnObtLkgeyOM0SSQzVq?=
 =?us-ascii?Q?+A2KdH46Ls2VG8zkWasDe28StriNDNa7CKj4f/dHJkwUdEwkHhG2q/E0NKcK?=
 =?us-ascii?Q?w6k5cAFA581eUvYoVA+NX095znCBVChAboG3j+5FDdyhS9o02PgAGXv+pCw9?=
 =?us-ascii?Q?HswOjwGGumw7AQKVKgnKJN2qhzSy5PvBw6K2IQLrTBlQYjNVNba41yitTBP+?=
 =?us-ascii?Q?n943Yr2HLjcreLBfcft+ROO7BlhKCa27KPh3M02+UzDoyZW9EkVvR3Ztdmbh?=
 =?us-ascii?Q?SLyAJP7iWcajAY1evy7hWbLdgjVm/yZVya813vJux+nxcQ4c8g3BVZGbYT4u?=
 =?us-ascii?Q?oVo4TPIf15DTvfq+T0VLYmTf3c1PJ3oVtQMu8dp92e+F/EYeqOWcs5gu2wWT?=
 =?us-ascii?Q?Uo3bKzRHbCyjZsgZTCAPu18jLDvKPQIc9KlCvgy6UBTuC8lnjKqJcvkZFGrA?=
 =?us-ascii?Q?FWTeXNZXvZCg54LKwEFzoQcn3GIzdgm0DlcAEv92+/ldSQFpj8gSkS89Lal7?=
 =?us-ascii?Q?Cmdcf7nKpK2zCnWduE17xWAMDEp7dVv38S5JBsk+pBNhQZXCgwcKIr0Y5OEx?=
 =?us-ascii?Q?8bQcUiCS6bvI5lTgijsb5ff+Mw9fC9dxBomI7hHZVTAZhmOr4ZXPjDXnFMfX?=
 =?us-ascii?Q?KDUtXujk5j1AcTcWMnOpo8AJnDuaoOTtL0p+L4Lonwod3M1zapiVoOpt30FO?=
 =?us-ascii?Q?CqVCYByxuDeAMcCm+MocEAh1McikM5vdcbE1xfF1BlLYgJxGVFAyCT904MMT?=
 =?us-ascii?Q?do4UTkVK2KpxLWYbZkKHgvOoyhnPmak1rujGZtyODugy/3RiIsLmheEXFU31?=
 =?us-ascii?Q?kX+Di36U+3saG6tRsAD7yQXva6sp/SgHPgsrgXUmISpSjzAmkv+B8W6fRWq4?=
 =?us-ascii?Q?nuLwDL9i7B87/ZoI6PzXsUrywon9rx8b20nj45U016jtF3pKIcSulUnFZ2Xp?=
 =?us-ascii?Q?cnG3UkjDES9TamU+9UPbD/vN1DyWT1s3BGT1SHz2S0FBxLq+DyyONRpPkS6a?=
 =?us-ascii?Q?12GfDhIT4bNAKWAuU/mM1AcZ+ucPwjVQAsAuCx03DoS9MlroJ+tM4juhGx8n?=
 =?us-ascii?Q?JGKGbgyXp89r/WMZUaqn2Gs+FoDg0MDDn9jUnmRZIq+f7egudVSYG9hSMu//?=
 =?us-ascii?Q?MiPz2FC/FO8sbg6/Nb0vRO185zBHMondDUOGM9TWSwQDn1lwtgdAOhAMcAQ0?=
 =?us-ascii?Q?emrstUn5d1eE5Q78ihogp0+hxgFT2vLLmJuKLqPGurPX4ypYDyVvaeSeBFyS?=
 =?us-ascii?Q?o58Q37Avh56QccZpH3L5Kko/F665XPKDF5A1YsH+Jwgd8w=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b404c2a2-cf01-400b-e851-08d8fa336498
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 02:09:51.4492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHvmQAXoGDCThaGvV/KToYFaJc4wouIfQZSCGqJRfKpTqlq+pvd53Qw9DE5NaA3l0RUBI2KPRu/BXr67w3ZzQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3128
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
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml          | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index b13bf8d70488..58bc2a23f97b 100644
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

