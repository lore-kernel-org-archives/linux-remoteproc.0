Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60F6C4338F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 03:33:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABA0760F22
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 03:33:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238513AbhHEDdR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 Aug 2021 23:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235289AbhHEDdQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Aug 2021 23:33:16 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on0612.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::612])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0AC4C061765
        for <linux-remoteproc@vger.kernel.org>; Wed,  4 Aug 2021 20:33:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xr4rFWfCqY7KVx4tI/NP601KH7W9TjinQyhI8PrSDAsZyGWuFYhfeVOqxg4cRJG+xQ9rwuY3e1skgUS2ma/CWT1uNkuKxFbKGVOGILqEFBkWoxqPmIEWV6LyFC/H51s3yMWK4HMJ+a22I7Vgo0FpR9Qi2hsCgf3qugsJ/coMl0MYcjGD0O8bgXPrDRSAlxK8kmPZPG0JIEQ/q+dLXbwhk2LB+uwbT45bCBrw+8Yz/ARYUR6PMrk7jNTZAY9xA0K6857uFaaSxjyvKg7ROPM37KhJH3FIbTDA7LWxprRRPGIP1YwaF3/KsIMG45lFbX406umyZYpvLfc1LWPUJ5V8DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTj/rFzXsr0ViQlVtC8kOS1uA1z15u8wzxquuYhrtzc=;
 b=g58/MZGUvRtM6tItltdcI1AX6dWxMH2rgPYabWrPZ2UxS/Onl8t/GxSuobv11eyz6ddLc8o+vtQJ/kPv/XXbQN9yV8MP+xZ5bgy+zsYQNnG2efQb9g0DVqEtUc4JI1wMFEOT+zwd2OBvw+hYOAA9pvM+0w1zX+Y/5j+IAmPyAsTrfI3tL+70c6ms5aBD3j2CCk4vWQgoJbve3oPvO0PLopHy/gI2APcGu+/Y5xEXAnw5dCXRnMjVxpXu2FhnxYFZ58UNrpwZVlSCFD41sVgytGBYPuJ3mRGwrBalVG9XdCkZLcUguANhQxcNJTOoc/EyeLvpPF1IpOGXDeF3s3CqMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTj/rFzXsr0ViQlVtC8kOS1uA1z15u8wzxquuYhrtzc=;
 b=CZHqGCJ+wmNtYhBYT2tLxDRNA/LRpRq0+GxINVh3W7yz2TLNVHTF9j4gWT8fsS5qOrD0rr9drYtOiC7HvoggUJK6Jikli++xhcSn1BLztIr70ncxfmjRb0uszCMJmsXT4ggCpqUuak+CHY6JoPUr7Ar66lmBfEmAXKXQd2k4KFA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DB9PR04MB8448.eurprd04.prod.outlook.com (2603:10a6:10:2bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 03:33:01 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4394.016; Thu, 5 Aug 2021
 03:33:01 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-remoteproc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, ohad@wizery.com,
        dongas86@gmail.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, cleger@kalray.eu, peng.fan@nxp.com,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH v3 2/5] remoteproc: imx_rproc: fix TCM io memory type
Date:   Thu,  5 Aug 2021 11:32:03 +0800
Message-Id: <20210805033206.1295269-2-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210805033206.1295269-1-aisheng.dong@nxp.com>
References: <20210805033206.1295269-1-aisheng.dong@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0085.apcprd06.prod.outlook.com
 (2603:1096:3:14::11) To DB9PR04MB8477.eurprd04.prod.outlook.com
 (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0085.apcprd06.prod.outlook.com (2603:1096:3:14::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 03:32:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b88d01d2-621a-4b60-b979-08d957c1b9d5
X-MS-TrafficTypeDiagnostic: DB9PR04MB8448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB84485E059D26D315A407EF8A80F29@DB9PR04MB8448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:469;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gWUnkEFonmGVFr0CWA9HbxpHy+3XPQczMsYLMK58E/7zbMtoWTFNbUXWTeRjMN9TYmerbzcmNxvslJ5c1JhDJwjD7tXR3BcdsbiQSplrsWjnTlJVT+WugCsNE5nWDrC9lhUWv1bMnq6h3Y5HjzUPBX2k/0a2aZEWsPmI5ytiRfWFTK3cMyBlYye8q/NUqcdtiC6h3X1AC6UAg9mL2WWKuX1sxaWiwVxVh4/k+AlfnEv3dvZVnnAcGsM5ewb9ebWiKFaN1rewle5ykX7CJ300/Eoe08N5nUteKbBAikZeqAExtcrHG8Q1HR60GkOLZ3fw9+IGpeeHllpNnpasThbSzGzp7aQVXOs/pbNV1mw/vn8bO0pFMkZDHMWQZcQemBRYiqos0lJ61YfDaNcB1XDRwwSYC3/SXfCZrPlAnb4pdYU0nrFqi5OLs1PLTltsjGryt4SJ5TBZUHd5pZq8AnqEWhu5DMLa15mZ6YHPheXVGznuZME1bZ29PI3IrzirjqQeDwM3R6kJRJ8vkNNb9aWjUFCHt5XDTRItASEOaksTwP5GBkcp8WfPLRHqn79h0C03nQO6Kfmq9RNzBILmNSqSSrnJo2OBU1sVtXye2R/XbkvQpnDjl/yhJncRtk6w8l2Ooh8zZmhb3wBG4Bg+zTXAWic48l+VFc6syWTmnCvzeIa3KmQqP0FeGDxt4znMGzNr/lIQlscDgWmTQjVeDONWnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(6916009)(6486002)(66946007)(8676002)(1076003)(6512007)(38350700002)(38100700002)(66476007)(66556008)(8936002)(2906002)(6506007)(186003)(2616005)(36756003)(86362001)(52116002)(478600001)(956004)(316002)(83380400001)(4326008)(5660300002)(6666004)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cXibNH5dVm2ZaPDw2/voRWJQEHbs4frGfUSpy12JbC5ypsKBQhScnjgJZutT?=
 =?us-ascii?Q?KbD0plwNzmGR2zyixYysOjx1XywDjXdB6U+pUEle6gGIKchWIEP7E/W97M5C?=
 =?us-ascii?Q?LNvPghPEoytl024XedMAF2PYDkcIj1MNyQAJHpCnclmnI+/E1UCiEFLgDoY5?=
 =?us-ascii?Q?n4GZsOwTkQmiFchsWSq4Uovf8GtkKz5HDevkszBtnEAKWnSCscHX5WpxTxUv?=
 =?us-ascii?Q?jbiibByn5JsBUn8oqOZIWFlycFj7HippJuAe+OAPc9Y3cbsyK8tzWo3lY5J/?=
 =?us-ascii?Q?HwEYPChuQxwsGkzjr9VOVtG2Awhe9i0Ihj9DIDRfXxJQf3lMTtKs2gR8drsD?=
 =?us-ascii?Q?GdcNnoy+9Iq9zdCpcs+iW4QUXlolFXDqZdERS3rwLr/HRcr6TApSmtnPlPJu?=
 =?us-ascii?Q?xgQC8NthIv6ym3M78A4UfgMHCjhkqFGHPk/LYFF9hq8M7YOLd0p1rubbOzDq?=
 =?us-ascii?Q?GE0MgLFLVQGa7ppwV7lTkOPiuIqMibXDHFkUxX5zxRcr2Dm/jmBVYhXe9eAZ?=
 =?us-ascii?Q?fz71Pnn38W+5/d2Xw63Q52smeshSldBxXBPuD39Q9CAqnhLnezU8T3HY7uxu?=
 =?us-ascii?Q?iglN7lBBd5Ixn9C4PGMkmtGo2xng/94llRcBLJY1xb4+dUo4H1qhc57GfEtq?=
 =?us-ascii?Q?fuY1EOSMD/seZ4VmRKUcrQXOW+F+N3yRgD1eN9YzF9m9Fu1mlqWXg2T53yUc?=
 =?us-ascii?Q?gLRaBLRhXe5VtaDselpe/u7brdr+s1sQZvkzbS1Vhncrl8dE2E7GXbAWKh0O?=
 =?us-ascii?Q?eWsNncBclCFb97AJMDgxp0IW6ogJaRDMb2ro4RuUVvRsq1qy52UgFkM4CVzf?=
 =?us-ascii?Q?fXdZtrkkLkUleQzpqpIO1lRlFTNM2dXCVOT3htI0cDWZ4abLGxTX5zpIY3pH?=
 =?us-ascii?Q?v1CO2GbcfY/Y33SQZ4o8rimvF6AW1NEjMqgFatEBZRee7J5sM94UUSD7xSqL?=
 =?us-ascii?Q?K4XZZuV+oOBgT1UBa4GPNHnWQFUYgYD62UB8lHRRSxosOv5Ifqvw/E0E06Zp?=
 =?us-ascii?Q?1VwFFJGg24CYdWIoyKTSw4UH/DE+p01SY/Aej1SBLIcPlo38fBubj0CpK3YK?=
 =?us-ascii?Q?Nw4n2pLD9/NQpRVWq3zwrSHwSd9LFsJuZk9cpDXqWTaRtvR4NBc46irPXfUG?=
 =?us-ascii?Q?vsHnZw6cEKpgcV7Z+HyAq/TeXYJRRaQZbq3PWR5y1elHBKI5xmUAyyj879eJ?=
 =?us-ascii?Q?difDFJi1mt441vhg2h2jnKnE0Gl8KQIleWE/z+ustS9a7LKEldNHVwTBf9y2?=
 =?us-ascii?Q?Hzgb2lc8tDsjBKw+kKdR9koWviedlQ0sbL2OvVPJ9YH+v7E3A4HT9o6vDJWP?=
 =?us-ascii?Q?kTcpX7OgdklJy5DSI18UaVBo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b88d01d2-621a-4b60-b979-08d957c1b9d5
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 03:33:01.0131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5BxJPHUw3ylw+ZsHEA2vQ3SWNniw81OjkRpl2/G2PdcLAuwQnojhYnm0UNkYx38+Viqa4ST2/udrg8FWelQZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8448
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

is_iomem was introduced in the commit 40df0a91b2a5 ("remoteproc: add
is_iomem to da_to_va"), but the driver seemed missed to provide the io
type correctly.
This patch updates remoteproc driver to indicate the TCM on IMX are io
memories. Without the change, remoteproc kick will fail.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>
Fixes: 79806d32d5aa ("remoteproc: imx_rproc: support i.MX8MN/P")
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v2->v3:
 * fix commit message typo and drop imx8ulp fixes tag
   Patch content unchanged.
v1->v2:
 * using ioremap_wc for non TCM memory
---
 drivers/remoteproc/imx_rproc.c | 35 ++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index d88f76f5305e..71dcc6dd32e4 100644
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
@@ -553,8 +556,12 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		if (b >= IMX_RPROC_MEM_MAX)
 			break;
 
-		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
-						     att->sa, att->size);
+		if (att->flags & ATT_IOMEM)
+			priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
+							     att->sa, att->size);
+		else
+			priv->mem[b].cpu_addr = devm_ioremap_wc(&pdev->dev,
+								att->sa, att->size);
 		if (!priv->mem[b].cpu_addr) {
 			dev_err(dev, "failed to remap %#x bytes from %#x\n", att->size, att->sa);
 			return -ENOMEM;
-- 
2.25.1

