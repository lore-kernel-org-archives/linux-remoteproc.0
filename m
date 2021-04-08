Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E160AC43461
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 02:10:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC195611BD
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 02:10:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbhDHCKd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Apr 2021 22:10:33 -0400
Received: from mail-eopbgr80070.outbound.protection.outlook.com ([40.107.8.70]:48299
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231172AbhDHCKb (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Apr 2021 22:10:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMjca7fZGPaMXSmSNImLVFUWUHegVeI7pT+7oIQqs3KvegIbFNQs3Tou8eMXJs8MrSvZRku1kWyf+XjMSuMtxeqFdX7j6sIY6haDvfXnkx8qP7jA9grKaX3xXXbmB4DvkueEfbDItc7aq8H/5jIBMuYkWqRS9auytpLMt+tZKjfOTSNBM2aK4+RDNwz5OsPytENQ5c3L/I6k7KbzLTbVZExgIoaD9HKyTvUjOuz+kkEISf1GB6n0NPpkX9tb6iSsmBHcpfh2ZqTDcK5A3jRw0dJgKqvFLIHgHQ7IfWYutzofgWBqmgLxz7VCoY4kJODwUEND40zvGJl3gJiKUf9FTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6hgxxzUs6gIT25T83HtyTNU5IP1a4BOxy5KV+3jOzs=;
 b=CwlQ8EttgX6NCgYf75ILKry+VtF6H6rDecVNbLokprhKXnCIzggLXdvRuD4gYYWWDZLliIX/LVwMc0g+Miz6PVMCjLUc9gpNsPbDvCNUIQmMyAxd8Apre2LbtSyMnclYvftF9vDh0+6RNAIrAZhz4KnKn+FrfeZ1UNrt8O89PYJbSGLIP4qvGgjU6UO5QKbyM98pp42TjGhxixkiDiSPFiY7IaAi5v9Y9J3hGbjNAPxsZt+VDu+EWtm2zjhBujASm5BIVBUYBqXGPvE8yF7omDWt4zG4wg82JpNn1Nz+e5fu9KYDs0nfKZkH0KwfQAobooqBxtptJ3XUGAv2Olmt0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6hgxxzUs6gIT25T83HtyTNU5IP1a4BOxy5KV+3jOzs=;
 b=jImZXxionhIh86YAdLPmCL015lPaaNusEp/dl+It8uXVcP8Q8ciFRuFO5rODOIkmgVYLpfeGg1kFGiv1xuuBuVahOuteHxx6sgxjxe1zw7pMWLdtTh2f+H8H3lwQ0EPiJYsjnrzLKodKyxTpSsPK9KPfl/XvPj1gjmI464ypcZo=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6857.eurprd04.prod.outlook.com (2603:10a6:10:114::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 8 Apr
 2021 02:10:18 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 02:10:18 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 8/8] remoteproc: imx_rproc: support i.MX8MN/P
Date:   Thu,  8 Apr 2021 09:54:58 +0800
Message-Id: <1617846898-13662-9-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4042.4 via Frontend Transport; Thu, 8 Apr 2021 02:10:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7cf626c-626b-48a4-b0ee-08d8fa3374da
X-MS-TrafficTypeDiagnostic: DB8PR04MB6857:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB685786C29C87B7ADAA03E490C9749@DB8PR04MB6857.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:335;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NWPqSiyZuBnzCJAQV+0DzBBlccbE29yi7GizpBrU/13khSsTF/2B0+nLLpTqHQL250bKXbMTaMB1vBP/PQCKels6owb2X7yfBxihbC+nlmgx/BAe0vM2kEjsD7D0Mjsz+r0js6EF1D+YN9I/tbnFFPP3YiA9M2M//IrHlFYki5I5l7HEcjsKhXzsqriRGFENCFHW633mabdvMjeJmx8xahb7LtL9gOyS8ps1nemMZQfHBuZFLsM0EcpvSc5/RmkrGkChntsvROGL9QcyRyO/RbjxlApou6K2ZUl6NtiUGeZ1/aRpNcezmQfNSuH1OC4YBIS7jMe/Cn1w5QZyLI5eQd9bPe4CLja6IcfEN4VvvyPDYjiVxm1EHKKIwhxTgz9G0/P0sL/43zqoR9U8jR+C6auNwDShAfsUeKKoB59LU6EkBqASFAREcWJLbu4Lkzse5hLW1lXiNxw7plPLBNd6MDwAkJmHRyMqUkd82KwHyBjezUsjLWmHLp+YUT+rrV20tEPNZxTthH1GE5afq6luLGt56KeHr1ZLzXQioUtkzC7yJ+5q3G7FuDxU3NnRSgnNDl+DRB9xM6SshbmjsIyiXLMoMjxw1XvaVxQx4nyuC/dPquaCVCbuQp7AoZPFn1jhxUBBmIGrU8OG0YRLlWb7+ZVLrwguqVKFPuhPveT56XPkkaSEMIDvPda1zxoS4XBjaKNYSOR75nHBuceuZvAlL6ysbjFa6f8z/bxhehHRoiU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(38350700001)(8936002)(6486002)(4326008)(6506007)(52116002)(9686003)(6512007)(8676002)(2906002)(316002)(478600001)(86362001)(69590400012)(2616005)(7416002)(956004)(186003)(16526019)(26005)(6666004)(66476007)(5660300002)(66946007)(66556008)(38100700001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cwdOnGlNopu6zdQ8mmgV+ydsZYvlsNbcnuw7YdKOrdF8LUzTb5VPpA997KAM?=
 =?us-ascii?Q?KOP7CrEbHTac2G3eL6WfoJedE2SHLtU3UuPyjNtNHWj48vbAVwI1rSmVeFvk?=
 =?us-ascii?Q?Gsx4Aj0jn/q9dp9qWeuV96LAoZRU/rK8XkxS9NzQCt9+2Lmk6qqE2FyfgsgI?=
 =?us-ascii?Q?wos4WLii6dUKO/P+npobaryKujeQ8l47DTur2sk3vYqiLM5Pa69tCeD3qF6w?=
 =?us-ascii?Q?B0eJZkhfp+9RCkkgqG6CP+yPOprEmBsh44oGcgyw7uGpwwIcbB+3uM8yUXeH?=
 =?us-ascii?Q?FglQPC+PkfYjKeIERx5ZhdUQ4ULPXd3ypEsIlVWNdaAALcCK6SwyQNd1t4xc?=
 =?us-ascii?Q?Yc8mQdkPjir9tFo7ekeOih7IFn7ANL+szIeyJLzN7s09ZzIglvPnrQyucv7E?=
 =?us-ascii?Q?v5t+m74zvDV0ILq1jMTswN5+B8A52DWelXkGlt6EfiV6/u+3fVbruNd/0I2h?=
 =?us-ascii?Q?Tjcn9zwhdUV0RWWnbdcQRRMqk7DdyLASzMU7qfxsxRCBNKmtfJ1y+nwIEoJc?=
 =?us-ascii?Q?Qc3aHVRA7jWG7VeDujPSKP+xvenkJPkuk/fAMkhM8g5T061Li70hLh5ulvKb?=
 =?us-ascii?Q?Y6zz1rO4ptAwSze7jeGDhIhEp5kVaXAlfe91kToDbJZXHEgv0SLU9iFfiCuD?=
 =?us-ascii?Q?j113HYH8Vjq1mnv+Cs6Cz6hJSzDk+wj8i2sDGP/9drf1GxlmhZhEKJTcNUL3?=
 =?us-ascii?Q?/Jbxb5U3zflDAoAwcOROIRpsSUlqPNzl/TdGRwskp8YWiFdn3oT9ErKQU9oU?=
 =?us-ascii?Q?iPN9duvfFWOmz/RPhBnKSgkSza6RO8Mpo/zlihbfoaML4n1l81DlKl0JrgLr?=
 =?us-ascii?Q?uFOzycaZxbS/sP0NBm5N64KSYNETOm3BcjwZf1RMzwcVwT/v7zQLPcl056UG?=
 =?us-ascii?Q?MmH4LLDwgFqD75A1zvJuX412JYevK0X4efNesg9zWCx9iYQDkHVvI/TKmX0a?=
 =?us-ascii?Q?HElOXoXFxm+S5kx9KRzRUzvq8gn35OFjTSL5AqEGK2xO2uShrsjPvvcLdIA2?=
 =?us-ascii?Q?qFKtOaXjYdJ6g6iZfrloRT69bqk7GilDOpKH2VtwZH3shgitnfqMxsxVT/Ve?=
 =?us-ascii?Q?MAKT2hvpvkMnmnFquN1o1mPI/VAw+AVYaDnPP/XsTMRPOzk0jORtnGta9Ehy?=
 =?us-ascii?Q?HOlThk/O2gwwdHqQJRvUbETIpf3zN1KnVVXwYYUKkmdT4eP3BiurIX4RYo83?=
 =?us-ascii?Q?A+2MG+w1ZnAt4kxiUl1+IwgfTrI1xPUH9rWECXU3n0V+e4vooRwzuDOX0PYj?=
 =?us-ascii?Q?bM81hQGNeHMeZ+hdArKw3+FBF5gCX5SGIVlKALNQZzqnNeHJYTWjFbvLBPhV?=
 =?us-ascii?Q?2KUxBw/lepdGulOaE03lvtHL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cf626c-626b-48a4-b0ee-08d8fa3374da
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 02:10:18.7268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2F4oGPCsW04jr5JmjKwpes0wleM4IkHjqTPYgnrAej4gXXXaQmalN+6qFjNz/aUKJCxL959qiIcIqiPMwtJeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6857
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX8MN/P remote processor(Cortex-M7) support, we are using ARM
SMCCC to start/stop M core, not using regmap interface.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 89 +++++++++++++++++++++++++++++++---
 1 file changed, 82 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index b911a7539897..9351626f09c0 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2017 Pengutronix, Oleksij Rempel <kernel@pengutronix.de>
  */
 
+#include <linux/arm-smccc.h>
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
@@ -50,6 +51,11 @@
 
 #define IMX_RPROC_MEM_MAX		32
 
+#define IMX_SIP_RPROC			0xC2000005
+#define IMX_SIP_RPROC_START		0x00
+#define IMX_SIP_RPROC_STARTED		0x01
+#define IMX_SIP_RPROC_STOP		0x02
+
 /**
  * struct imx_rproc_mem - slim internal memory structure
  * @cpu_addr: MPU virtual address of the memory region
@@ -119,6 +125,36 @@ struct imx_rproc {
 	enum imx_rproc_mode		mode;
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* ITCM   */
+	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN },
+	/* OCRAM_S */
+	{ 0x00180000, 0x00180000, 0x00009000, 0 },
+	/* OCRAM */
+	{ 0x00900000, 0x00900000, 0x00020000, 0 },
+	/* OCRAM */
+	{ 0x00920000, 0x00920000, 0x00020000, 0 },
+	/* OCRAM */
+	{ 0x00940000, 0x00940000, 0x00050000, 0 },
+	/* QSPI Code - alias */
+	{ 0x08000000, 0x08000000, 0x08000000, 0 },
+	/* DDR (Code) - alias */
+	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
+	/* DTCM */
+	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN },
+	/* OCRAM_S - alias */
+	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20200000, 0x00900000, 0x00020000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20220000, 0x00920000, 0x00020000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20240000, 0x00940000, 0x00040000, ATT_OWN },
+	/* DDR (Data) */
+	{ 0x40000000, 0x40000000, 0x80000000, 0 },
+};
+
 static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* TCML - alias */
@@ -205,6 +241,12 @@ static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
 	{ 0x80000000, 0x80000000, 0x60000000, 0 },
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
+	.att		= imx_rproc_att_imx8mn,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
+	.method		= IMX_RPROC_SMC,
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 	.src_reg	= IMX7D_SRC_SCR,
 	.src_mask	= IMX7D_M4_RST_MASK,
@@ -246,12 +288,24 @@ static int imx_rproc_start(struct rproc *rproc)
 	struct imx_rproc *priv = rproc->priv;
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
+	struct arm_smccc_res res;
 	int ret;
 
-	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
-				 dcfg->src_mask, dcfg->src_start);
+	switch (dcfg->method) {
+	case IMX_RPROC_MMIO:
+		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
+					 dcfg->src_start);
+		break;
+	case IMX_RPROC_SMC:
+		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0, 0, 0, 0, &res);
+		ret = res.a0;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
 	if (ret)
-		dev_err(dev, "Failed to enable M4!\n");
+		dev_err(dev, "Failed to enable remote cores!\n");
 
 	return ret;
 }
@@ -261,12 +315,26 @@ static int imx_rproc_stop(struct rproc *rproc)
 	struct imx_rproc *priv = rproc->priv;
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
+	struct arm_smccc_res res;
 	int ret;
 
-	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
-				 dcfg->src_mask, dcfg->src_stop);
+	switch (dcfg->method) {
+	case IMX_RPROC_MMIO:
+		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
+					 dcfg->src_stop);
+		break;
+	case IMX_RPROC_SMC:
+		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STOP, 0, 0, 0, 0, 0, 0, &res);
+		ret = res.a0;
+		if (res.a1)
+			dev_info(dev, "Not in wfi, force stopped\n");
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
 	if (ret)
-		dev_err(dev, "Failed to stop M4!\n");
+		dev_err(dev, "Failed to stop remote cores\n");
 
 	return ret;
 }
@@ -600,6 +668,7 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 {
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
+	struct arm_smccc_res res;
 	int ret;
 	u32 val;
 
@@ -616,8 +685,12 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 			priv->mode = IMX_RPROC_EARLY_BOOT;
 	}
 
-	if (dcfg->method == IMX_RPROC_NONE)
+	if (dcfg->method == IMX_RPROC_NONE) {
 		priv->mode = IMX_RPROC_EARLY_BOOT;
+	} else if (dcfg->method == IMX_RPROC_SMC) {
+		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STARTED, 0, 0, 0, 0, 0, 0, &res);
+		priv->mode = res.a0 ? IMX_RPROC_EARLY_BOOT : IMX_RPROC_NORMAL;
+	}
 
 	if (priv->mode == IMX_RPROC_EARLY_BOOT)
 		priv->rproc->state = RPROC_DETACHED;
@@ -747,6 +820,8 @@ static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx6sx-cm4", .data = &imx_rproc_cfg_imx6sx },
 	{ .compatible = "fsl,imx8mq-cm4", .data = &imx_rproc_cfg_imx8mq },
 	{ .compatible = "fsl,imx8mm-cm4", .data = &imx_rproc_cfg_imx8mq },
+	{ .compatible = "fsl,imx8mn-cm7", .data = &imx_rproc_cfg_imx8mn },
+	{ .compatible = "fsl,imx8mp-cm7", .data = &imx_rproc_cfg_imx8mn },
 	{},
 };
 MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
-- 
2.30.0

