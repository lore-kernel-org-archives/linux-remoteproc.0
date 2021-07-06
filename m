Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D52C07E96
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Jul 2021 14:43:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C651619B4
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Jul 2021 14:43:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232972AbhGFOqU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Jul 2021 10:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232134AbhGFOqI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Jul 2021 10:46:08 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:7d00::620])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F9CDC0613B4
        for <linux-remoteproc@vger.kernel.org>; Tue,  6 Jul 2021 07:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i59Whg0diMdpX/+IakUSokxGaMc2gju8V5pQ70/IxQAnuMq9iKGsjVvhWiOkj5pDjUZG0Kp6ZuZTOa1oKpH/swPUISCADJiTwCkpHg36BdeRYkJQtZzlGzXo7Pl9osaG95KSGsD78thoqyZ5qEh7QRJkiQKVXPpqrnpZW9orLmsFkM/pcrkDWzSvyX528mCACQXtmB8vIG6nWF2xVenzF3zSpGQhLG8vVMPszTpXUvVyBUlksFzWk1wvymBMcWpwRkwvqd/x0b0IBV43fl0n1JWAbeO4xovz0tMv2Gku3QNG0qrFCeV57ahlUMMsW7LI9X6/HUlaGys0AZK4sVSF3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIoYm2BFuThDlBnufSToyjl+gtLcGeZhOl5kc3VS5U0=;
 b=kIi6gXWJ63Sjam2c6Csc6VPPf0xdtDQD9mJOSYaqvrbaImXx925XfuT+6MYKHDoI59X7EhNzIGp3yi2v3v3PaO1dWH6QdAWAZ8RR1LY9/sfEv1pvioJGvcm5RlkFbIhK/CsP5BhM0FVFDRZw78w+AgFJp1ESESXsSECK1A+C6Qtjqnmi/ESVE2zgynYXcIXKeX+/g+fkWM8loR6lCnwqa4ke94WJ5p2+I7rVqPEsRaaJr2ptO+sOnahdEPrm8OgTmyZyX3NerfCl4KjtMcvn3asVR1Z++6OmzTivuUqrIfSMf4/noVhypfjFws+IDmA93SbWaMgAEYGdrcXCriaOpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIoYm2BFuThDlBnufSToyjl+gtLcGeZhOl5kc3VS5U0=;
 b=SlzIsBFbJxWap+IEMxMFFpKccTvpKZIyjY4j1QY+WU+lKdwEgH4L6KS3ytE/xbcoDoICHqFGv7T+ihWmuTDHb4TXY2ghU+za7cj9az/iYsh0wTMccqQP8lwc6GdkbvvnjhVv1aGyWY9L559ef5iw9xywMUCnk9W5eIwrJ0b+0ug=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8853.eurprd04.prod.outlook.com (2603:10a6:10:2e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Tue, 6 Jul
 2021 14:24:40 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 14:24:40 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-remoteproc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, ohad@wizery.com,
        dongas86@gmail.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, Dong Aisheng <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 2/4] remoteproc: imx_rproc: fix TCM io memory type
Date:   Tue,  6 Jul 2021 22:23:33 +0800
Message-Id: <20210706142335.952858-2-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706142335.952858-1-aisheng.dong@nxp.com>
References: <20210706142335.952858-1-aisheng.dong@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0145.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::25) To DB9PR04MB8477.eurprd04.prod.outlook.com
 (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0145.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend Transport; Tue, 6 Jul 2021 14:24:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5376dba-7606-4833-e5dd-08d94089ca54
X-MS-TrafficTypeDiagnostic: DU2PR04MB8853:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB8853C5DCBD858AB1E122BF2A801B9@DU2PR04MB8853.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:397;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tmGOtt+L7bIXc5wQ1OjyJdwieeldPh1w21kb7+qUtPbYPJ6eSBZdaiClid/Z1Xi1MABI+TOTAmfrmGnNrS06Yu7XoTSP8IH88ZUXtcev8HFJPSA+XAHZP2ltOCVUOMF0EVk83h0/3zsv0hL1QqN3EPj4oJPL7ERLRnsuk9R28vjvWskTXtyDsIb4/igmpNuNSFYtBy1d0Sj8Yyi15r2Qp9MdBt3+16jTbDMnYK3EQsND9nGlftsY2FURsW3q70ckwOQBlHxv91axXHS76Aasrb+FqWMDwDyUTAgIdh7xIdX2j2dFnejNvgLEOP6m7lf3zlkk3TCBJ9veWUfmCWpEulmdy+TRlskxeLTatg7EXEBjicRNwEXKsp6FLgTJ5xbGk/nj39P/s525J57KBnzDLweKx7RuX+oFKR3fkpS8+vZEFZMyRQ5AjcWLkrud8t7+EK+GRfwxwNuknItLyj5mryIx/fb0rTDw+MSgq2t2V3lkc3Jm+SQDGtn5rzNL+G9GIbHDPoq+rQGoHhVjf7FMZxQ3CazW00P8he6ON7H6sJYDSWoIl0HwWWlmDu823B1cnvd0TP5BDQn+I30ucAbZoFD9wY+3S4jyeyvD8edvQ6cxblqMsQKpi4VtbNWS6Uo3Y6KhZiqTLQD/L6MHtpH7D8+UDqCsEnvDs78+88DWLh5G8U3zGwf/fUrFo9lDOdqR4h8ZijgwZ+v7ITZMZ/wSAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(66556008)(66946007)(8676002)(66476007)(1076003)(316002)(83380400001)(26005)(6916009)(2906002)(6666004)(38350700002)(54906003)(36756003)(52116002)(956004)(6486002)(8936002)(478600001)(38100700002)(6506007)(2616005)(5660300002)(86362001)(186003)(6512007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K/oGt/YkP3Ga5S7+wSH6Cab2axp1IFw42Fm7WwGCfVRWtc0V2MxflR4HUzg5?=
 =?us-ascii?Q?9vZakTCvi41h66EfU8Yi/0TRmbn9fPp4kx+sj3Bpd7M9GgrTqtl/kgBcw83l?=
 =?us-ascii?Q?XFmBLg8Lrxq6nhj5eJiwNEB5m7slp0CuPPqGwYZqvmxrjiJTJ2YiiWyljMlw?=
 =?us-ascii?Q?PFX2Ki8lqb4sN58+AK/p5CRsdNqsLl/37lGN7uCiSJi5ZDYQSRA+t5snb00C?=
 =?us-ascii?Q?KDEe9HoHo7ApRZ18MD31TjmMTh4siIAe9lrLckqPuA9K+X9C6UIbMIz0wFOf?=
 =?us-ascii?Q?hX9boHwUeCwP7dQwcir6ffw4/fc440IjzJloeieRnAUTa0oqJOHFSTMhr6WY?=
 =?us-ascii?Q?mp6U66ZojHaj3OvLjJpIX9/gR37zHQQJ3Lmd72QZC2uPC01XHSY6pR51KXIh?=
 =?us-ascii?Q?LCTukI4l5S72wQSm7QooOJ89Ammnp3UGGESEUmADoS4P8r0RMbu3lcFtr5L+?=
 =?us-ascii?Q?7Zfi1EmunhX/j8Bn/VWACveA8Jjv4iLxOmaJLnDDDztJ7hdgyBHIncdeSojy?=
 =?us-ascii?Q?D0zlKxDzLmHXJuXFSKyGcHvxsd7HXdH9TOnbUhXGVJeYOPfDTu5ZcMVpvr2R?=
 =?us-ascii?Q?fupwn0PBIds4MFuCPOhDtNTlrrZ6YvIdp20EcAwUGsTiV7JA6psq7/D1+PrU?=
 =?us-ascii?Q?FU72DySxhK1+eYjQ6E9/k+I8oUKQAt6HQEdsM5TrGZGKa8auO+wUqbjjWxDL?=
 =?us-ascii?Q?yl+hExjbT4VHdgqdSDbtK0gaq3sscIAsRHGUBPa4BTGcfsa3Iodd7UObbXBO?=
 =?us-ascii?Q?pOR24JRf7A0MINmmy7BV59MfH5EIkF/fRMOW6vBLPAJkMRvRef4RZM/W7oei?=
 =?us-ascii?Q?RytavcIpPrjeXWXw4/smdU6+Fu4HewTyQhh39XF1/0BqOpIHYGuXOlVV0kvs?=
 =?us-ascii?Q?1N8m36BnrjimWRPP8KLN40gNjP4KgmNS02dohRsddMbWJ8aG68YPhzBmu/lm?=
 =?us-ascii?Q?pA0o6u4AVhbHGmrY2FmsGOP6s1Mt6tbl7nKbDF374uEKexoORYOBl9YQoMqe?=
 =?us-ascii?Q?K2CHOuSaEerIwYzfnLtW/xVtnQ7weKQ1fJtxMFmxQWcqoTdP3PTTCCggwNKr?=
 =?us-ascii?Q?S/is0VGwjQJn41aYaykq4qe63Vw75p6EGpM34iYm/oiawmVTfTTu1famljx8?=
 =?us-ascii?Q?/fUbg9tBWIvsTLNFjEmSB88s35wFxziLxIQRE6hgRZpChac8WGpwgYv3yRAj?=
 =?us-ascii?Q?N3oxHjHAJa3pPhisb+S0rKyINkH9o1qdpS6KxWUW9AJiK7cEXQJxsDPOIOBn?=
 =?us-ascii?Q?DW7mLZqA1dvc7iVL1IPlTnGiD5jErQxzeDqaRhmh5omLt+pKexaEuaxG4zLK?=
 =?us-ascii?Q?T2+a7QSMmLF3jTdidfdaJCQp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5376dba-7606-4833-e5dd-08d94089ca54
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 14:24:40.0457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lo0ENq0WOrMmhWKly7dXr/e+OqPIVSdEP02hWzIfPXXoDgEcyFAFm0vqB0f09XpV290HPA0B2EeRLY7NYweLjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8853
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

is_iomem was introduced in the commit 40df0a91b2a5 ("remoteproc: add
is_iomem to da_to_va"), but the driver seemed missed to provide the io
type correctly.
This patch updates remoteproc driver to indicate the TCM on IMX are io
memories. Without the change, remoteroc kick will fail.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>
Fixes: 40df0a91b2a5 ("remoteproc: add is_iomem to da_to_va")
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index d88f76f5305e..752f8ab258cf 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -71,6 +71,7 @@ struct imx_rproc_mem {
 /* att flags */
 /* M4 own area. Can be mapped at probe */
 #define ATT_OWN		BIT(1)
+#define ATT_IOMEM	BIT(2)
 
 /* address translation table */
 struct imx_rproc_att {
@@ -117,7 +118,7 @@ struct imx_rproc {
 static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* ITCM   */
-	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN },
+	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
 	/* OCRAM_S */
 	{ 0x00180000, 0x00180000, 0x00009000, 0 },
 	/* OCRAM */
@@ -131,7 +132,7 @@ static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
 	/* DDR (Code) - alias */
 	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
 	/* DTCM */
-	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN },
+	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
 	/* OCRAM_S - alias */
 	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
 	/* OCRAM */
@@ -147,7 +148,7 @@ static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
 static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* TCML - alias */
-	{ 0x00000000, 0x007e0000, 0x00020000, 0 },
+	{ 0x00000000, 0x007e0000, 0x00020000, ATT_IOMEM},
 	/* OCRAM_S */
 	{ 0x00180000, 0x00180000, 0x00008000, 0 },
 	/* OCRAM */
@@ -159,9 +160,9 @@ static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
 	/* DDR (Code) - alias */
 	{ 0x10000000, 0x80000000, 0x0FFE0000, 0 },
 	/* TCML */
-	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN },
+	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN  | ATT_IOMEM},
 	/* TCMU */
-	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN },
+	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN  | ATT_IOMEM},
 	/* OCRAM_S */
 	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
 	/* OCRAM */
@@ -199,12 +200,12 @@ static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
 	/* OCRAM_PXP (Code) - alias */
 	{ 0x00940000, 0x00940000, 0x00008000, 0 },
 	/* TCML (Code) */
-	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN },
+	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN | ATT_IOMEM },
 	/* DDR (Code) - alias, first part of DDR (Data) */
 	{ 0x10000000, 0x80000000, 0x0FFF0000, 0 },
 
 	/* TCMU (Data) */
-	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN },
+	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN | ATT_IOMEM },
 	/* OCRAM (Data) */
 	{ 0x20200000, 0x00900000, 0x00020000, 0 },
 	/* OCRAM_EPDC (Data) */
@@ -218,18 +219,18 @@ static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
 static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* TCML (M4 Boot Code) - alias */
-	{ 0x00000000, 0x007F8000, 0x00008000, 0 },
+	{ 0x00000000, 0x007F8000, 0x00008000, ATT_IOMEM },
 	/* OCRAM_S (Code) */
 	{ 0x00180000, 0x008F8000, 0x00004000, 0 },
 	/* OCRAM_S (Code) - alias */
 	{ 0x00180000, 0x008FC000, 0x00004000, 0 },
 	/* TCML (Code) */
-	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN },
+	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN | ATT_IOMEM },
 	/* DDR (Code) - alias, first part of DDR (Data) */
 	{ 0x10000000, 0x80000000, 0x0FFF8000, 0 },
 
 	/* TCMU (Data) */
-	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN },
+	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN | ATT_IOMEM },
 	/* OCRAM_S (Data) - alias? */
 	{ 0x208F8000, 0x008F8000, 0x00004000, 0 },
 	/* DDR (Data) */
@@ -341,7 +342,7 @@ static int imx_rproc_stop(struct rproc *rproc)
 }
 
 static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
-			       size_t len, u64 *sys)
+			       size_t len, u64 *sys, bool *is_iomem)
 {
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	int i;
@@ -354,6 +355,8 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
 			unsigned int offset = da - att->da;
 
 			*sys = att->sa + offset;
+			if (is_iomem)
+				*is_iomem = att->flags & ATT_IOMEM;
 			return 0;
 		}
 	}
@@ -377,7 +380,7 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
 	 * On device side we have many aliases, so we need to convert device
 	 * address (M4) to system bus address first.
 	 */
-	if (imx_rproc_da_to_sys(priv, da, len, &sys))
+	if (imx_rproc_da_to_sys(priv, da, len, &sys, is_iomem))
 		return NULL;
 
 	for (i = 0; i < IMX_RPROC_MEM_MAX; i++) {
-- 
2.25.1

