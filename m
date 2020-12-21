Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219F9C433E6
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Dec 2020 09:55:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECAC922CB8
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Dec 2020 09:55:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbgLUJzR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Dec 2020 04:55:17 -0500
Received: from mail-vi1eur05on2046.outbound.protection.outlook.com ([40.107.21.46]:24288
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725775AbgLUJzQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Dec 2020 04:55:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgQLvTb1CQcrU3gWDEDBWkLgH/894ItvS/F5uU7V50XYziLIWTvP5JkUzC1US2yrxsFvo/THp3Q427c9nf70K9A+6QNVHvMhaCDgON46gSSWTXa74AeDivu2ddcPH4J3U+izLMhu9qcZdgZvSr6jM78LsuRIlK5YYuKaIbdlvJMBKBvzfUXVSXIiLVBh9xBjMmFghWZa0+6Yc7ttzrHo/5nJRnwpn1x/BFTYMxGArpja+Ua2NlZj2VctnVBpdtXWE6pzbMPoI5eq7641ZVyUPSu7R1m6AUtErYeef+Ah01y4XHFbT0mU4GmDhjA4kRmW4XiEXGp793n2jFCnMY8Ftw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rACl7NUtcasQV8MsH72KsASEecE9FcoCPyFCBMwS2bA=;
 b=hA8g8r3DsjRbmXYpDOx9X3uO8eb4w5ncBOEAA/2sVFxiWVRRasTSeVQmWEr7/XEqzZwgVWZqKDkVZa3M5uLRpanie+CTHGP8fETfHIAkmKOzhCsfm3yd1z3G4M+DJZbvc/ZAVF8HswHUL/G80SmAD51x7uh7NQdTJXfgsHUymsqEiaq7RFXsqOIVrXCb+VciZlG+GzrOdQoaHGqWJv1TLnCCvd7fXLB5xUWtzjMS1YkVPfilrhQh1pVD+oGjyY0xKD3Bbv2kGUeRfWw2evlNCn0LYRzgX+Li6lvm8U2dZgzuNmgZwu9GmyScdultN/qGF7mrPtCwQyKu4AN3YPvkWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rACl7NUtcasQV8MsH72KsASEecE9FcoCPyFCBMwS2bA=;
 b=cLfOl6Z+DZgVJxemGul5+rfZmStRO86r+Clh/SoGp849T6LgZYCEXBVwyPEvqHw3+p/WFWwBOD9wNZvIpatjQcGiVnt6yT48jklvJjwQuNe2TQ3jCGutIM/Bm2d8GHDJYlvESJXWViQfawWeU2LIf+C8jIiIGYI9cpl19naCaqQ=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Mon, 21 Dec
 2020 09:38:28 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3676.033; Mon, 21 Dec 2020
 09:38:28 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 3/8] remoteproc: imx_rproc: correct err message
Date:   Mon, 21 Dec 2020 18:06:27 +0800
Message-Id: <20201221100632.7197-4-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201221100632.7197-1-peng.fan@oss.nxp.com>
References: <20201221100632.7197-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR02CA0110.apcprd02.prod.outlook.com
 (2603:1096:4:92::26) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR02CA0110.apcprd02.prod.outlook.com (2603:1096:4:92::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend Transport; Mon, 21 Dec 2020 09:38:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 05d32050-dc9c-4410-abbf-08d8a5942bf6
X-MS-TrafficTypeDiagnostic: DBBPR04MB7930:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB79305DAAEE08786D34988B5DC9C00@DBBPR04MB7930.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UjCZ91CJElCHf4mGsLezjic3eqDBRA5+bWS5O5WP55cb1HwSRlmAepA0x9xJNAJn2nihEXRYTbZlaGPCFugatr1MrZjQlFBhKHJxu3A+OiGTk/5k8HB6dAKX4d66El+D712tnBdcbXgao+yj2jTw/qLMeYbUxJVshK6jWXwzt2UvCCGkUQcC/VKTfgFpEsiFTIcRQXmWioFrJpkQqCqeKyRnYhge67+WD8K7KwyrZl1IXZT6jDzi4jMmjqOfzqCvx2BdcnJDlBoFF+j0JJJ8h6SR0z0vop4BLIsTxwrb4+6uWG4ejxoG9uuL3KVl83nTEZq+r6eK3d50V74S0AxHQxVxsCYgnEuiAIT+jCf+NDMg9N4HwO6+RVUGen3hTxaro6bR/stI67FXSxvC41cSAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(5660300002)(66946007)(478600001)(6486002)(66556008)(52116002)(66476007)(7416002)(83380400001)(8936002)(6506007)(6512007)(26005)(15650500001)(316002)(956004)(186003)(86362001)(1076003)(16526019)(2906002)(8676002)(4326008)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?i2DiyvEuv8P+eZ9l5m36ApRX6fuVCPg8oi21X3KQ9/O9eKJw0WQvLhBnVLO8?=
 =?us-ascii?Q?Kt3Moqxm4dBQbY1qpwEhE6lKhvsAzuT1N6KgmXdsBgoGfjmoZMp4MD0CtNgL?=
 =?us-ascii?Q?WDyy/qKzHcemxco8d0tEO/MVMjGx97iS87NxMwhuoCGbHxyWBeObRsBCbmz6?=
 =?us-ascii?Q?he7A+FdkJ9U1riCW3DanDxbkUgIl4G8No/Pz53It4opyOa0bgnBRFoFXdFxN?=
 =?us-ascii?Q?nnE1/MIefGWyxPKfOHK4QzsZlT18Nxjj5954xJRcGQxQPud70d+ywRKNhPBo?=
 =?us-ascii?Q?Ok1NKzreR/ZEOKyWCjKuE7mlfvETLbY7fApEo8JszggFdPNqFDQSSAF9Appi?=
 =?us-ascii?Q?RvzhV9a2xn+CBOAmnDCWLJ+FwtFRDoaxM2DPm9cZwmoi07+igLgCjc7NfMTY?=
 =?us-ascii?Q?1qRta7XX8D94Noqq7aOOUhtUGYGkBV0NNiv0Yr2XQZSA15Ir8RqISv9bOV58?=
 =?us-ascii?Q?UxNfJs1eMi+xw8h0Is2QjpU0QdT28Uexf/Zs4NJzoQjiziP7a4aU4rRn8G68?=
 =?us-ascii?Q?mpxtsGOIFBtD/wiPZXhkp44Svr5WqGcVDhFU2tZZAnl7TThvCzWVusRy1HI5?=
 =?us-ascii?Q?Q/jOG6n5L4ohiGBrP7NWW/DB0mw7HE/zkE1hXdWvPvibMQvGSWBIxNkjNtGY?=
 =?us-ascii?Q?Nevljt9e3V6wwe219HapTHE5FYFvzCgDHjNxFYR7hcPuZBOPGDOot7pkv9nQ?=
 =?us-ascii?Q?z0p8282pY3w0giaidi3Jj7qOuyLiD7AAp+ma28Hs5xbYCox6Q3szgr602m2Y?=
 =?us-ascii?Q?lQOn48cPCec/N6q1mnquZCrRjZobs+n3I/Kj5tzP5S/zt2FhzyxBiaWAjpm4?=
 =?us-ascii?Q?XNmsBGf1w0/03XGzdub/kBqs6f5aW735k5pVaYRDj8JUXCrg+echCjywxf0b?=
 =?us-ascii?Q?vYUynOqwOz6sAl8kf1P25F3YVCZtG4qdkhgseuKx4gxUlb5GxPPAYlC98cuE?=
 =?us-ascii?Q?E14lSVM2+kPp6Vli5IwBOyKhPxEzys3Z/hqd29mtD52LQVvgVZxTiYbNqCyM?=
 =?us-ascii?Q?AwNZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 09:38:28.2614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d32050-dc9c-4410-abbf-08d8a5942bf6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDFveRh71w1wyt70uKWRa5684Xy4sQwnh2hMk7n4TZCEqWO6fQTjLKFbtmVUFtTWwCxqL9wC2pS1MpZjF+7FIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7930
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

It is using devm_ioremap, so not devm_ioremap_resource. Correct
the error message and print out sa/size.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V4:
 Drop the R-b tag
 Follow Bjorn's comments, correct/update the err msg.

 drivers/remoteproc/imx_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 6603e00bb6f4..fab772b02c9f 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -268,7 +268,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
 						     att->sa, att->size);
 		if (!priv->mem[b].cpu_addr) {
-			dev_err(dev, "devm_ioremap_resource failed\n");
+			dev_err(dev, "failed to remap %#x bytes from %#x\n", att->size, att->sa);
 			return -ENOMEM;
 		}
 		priv->mem[b].sys_addr = att->sa;
@@ -298,7 +298,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 
 		priv->mem[b].cpu_addr = devm_ioremap_resource(&pdev->dev, &res);
 		if (IS_ERR(priv->mem[b].cpu_addr)) {
-			dev_err(dev, "devm_ioremap_resource failed\n");
+			dev_err(dev, "failed to remap %pr\n", &res);
 			err = PTR_ERR(priv->mem[b].cpu_addr);
 			return err;
 		}
-- 
2.28.0

