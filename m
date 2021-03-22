Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67F1C433EB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Mar 2021 08:27:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E7A161967
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Mar 2021 08:27:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbhCVI1M (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Mar 2021 04:27:12 -0400
Received: from mail-eopbgr60042.outbound.protection.outlook.com ([40.107.6.42]:9779
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229875AbhCVI07 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Mar 2021 04:26:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGLZr+1tHqFNr6zt0aAtuzUPMUCL8XdiKbsm8ROz0VpXbRhOb4C5XKdSFgasKUM4HnrpID81ithmJAk3Jl7TBi4CjiMM7ICaSegXduAD9tv1G3e7waYI2E4IvOWkL2EX+jbouWic0aU9/940DOLIRoc1Nlmsw3J7zHi/5JpNSSv+DWnf/H6SLKc2IM5cuy45Ep5K/wRSlTeJBgoOLY50Vwx5AKBWgKZTmlaDxMJnDMVKQ+vcKWg8ShuAg9fQaQAna7cm4ORaxBM9ldgaz/RV4tA/5lWGNuDS9Jx9mlZi7v8nm6pxehS6Qz8lg86rCxWDcuRfTtZj6xQhu4ZNCtpFbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lxq42a/IJpARF9O5N3tTfkceJm3C5hgLuvt5ThCJCVk=;
 b=Uk3zcNZMo8qPM70/YohtHxFaG+ku3BFDE+h7OkVdbgM83CqLLbAzLCu+guPEglwvwCol6OsF4WTbnAwC1m1yqAPWI8JWW8k/yuWGDBZfuqAjBJTMxdtR5V0IqsYBbKTTp0GqDPjbz+yfMdIpzs4NDC0uszN0LsJnLgI8oLDXftVD/uaSbufWZpCySL1ZgeFH3cDyC0D2DyZs7wjXS70/q5iwXtIIbu5JEXQP2J75DhWUSWK5Jdla9RAMV1P/Mf0O6vbPyd8xMdXSAN1LBw9Py4wfRZrMsOk4Kq7zPJOiemqbnMjfQIISvuVabDYqGGla+qmGASgq3POtwNKEbVWwXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lxq42a/IJpARF9O5N3tTfkceJm3C5hgLuvt5ThCJCVk=;
 b=AvXdEQjj7EIrg6mLMryw71b32Ge8XlnyP3s0mVe4Q7Aq5RhLkKSworFbx1n8QX7M6hP01JGjj9ga5B4jZD6eylrKuXY7ivq/earwKwVgGGHMH8qrGeZT2sh0vqsayfZxToBdtBrscPqrSAdXRIkrAErFhhupE5QNNqPUqsd5Vww=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5993.eurprd04.prod.outlook.com (2603:10a6:10:8d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 08:26:56 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 08:26:56 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 6/8] remoteproc: imx_rproc: initial support for mutilple start/stop method
Date:   Mon, 22 Mar 2021 16:12:41 +0800
Message-Id: <1616400763-16632-7-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by HKAPR03CA0007.apcprd03.prod.outlook.com (2603:1096:203:c8::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.9 via Frontend Transport; Mon, 22 Mar 2021 08:26:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6b81b445-1682-4f90-e204-08d8ed0c415c
X-MS-TrafficTypeDiagnostic: DB7PR04MB5993:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB599310A871997061186D2688C9659@DB7PR04MB5993.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:321;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KJlBht+3sK43u3ckg2Jr9Cs57fLiQDcqlTIaESJ6vwrSRD/qTXTO/pSaxuD4TfGOmgLaNwjFmOyXsQOmpfKwdXkbVbKoDRe5lctDhs2HgQa97LriLJD2BgtBncRT1S+pt4T7n6dTwvmja/BmtPkq8Hg86IR8XrKXpwViSrbzNnwvjHZ+HrCR7Rca+ME21Ylg8+wmcW2Zakzsc0lopACONNF2NKgUAUT/Yp3TLMdMXwANWi9g3U/oUMuc0KCet4IbO5oS2+IOY9yJ73xc8jYsc4DqBia/1aK9VIRWpxhnvI8PbLet9U9Gclf+5vh6VRDonaSI5CTJpg29Nd1Bglx5o+2ezopDxG/b3t1yePxCB+DQNaeszKc9zwvYyT2EhFnjctvUFd73mDcfTAf0mv5UKcjpQhbnbosMLo6P0GqE75hyul7yLIllcyAB7/nD9OA1kxldRnp7DxsnL+RI0J4i/T03HSRiGolwujuNLQ9aSvjBQi57gBoB218qKcGww4kAqciCmT8fpFih/JGk1Fgw9J+/TMH/GITAwO02oUogSSqzrUNIZijCZ9K4g07HLgt1pxUnJX0pcSMBoF+a6hhjr14VdIujf2LGmp+LdAoNKi9+uqyinmkHUke2AzOJgi5bDNeE0VSUq5W5hH72IamvCCAiKwbkqiTPxb69Gafukw1T3gOKwHqezK5LrLO6obYK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(26005)(186003)(52116002)(316002)(6486002)(2616005)(16526019)(7416002)(6506007)(956004)(38100700001)(8676002)(8936002)(66946007)(69590400012)(66476007)(66556008)(2906002)(6666004)(5660300002)(4326008)(6512007)(9686003)(86362001)(478600001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1NnMz8WT+kD3xJQufWsGtfy+cys9ltoBJFKKZawB/u7IQ83F2YzV2yzvUlZV?=
 =?us-ascii?Q?b7v01FIW++b/+3xKJfgUvg6M8qGUjYccqPjaBBknsHehZhvB5WDpt0RXaWm3?=
 =?us-ascii?Q?CsncovZPFZO0JUQRhZsJ0gFKTZD2cGF56y7Nomb1LPzI6srLJoGeT9SEtB7w?=
 =?us-ascii?Q?wR4pEmt8pMXHMxVGbts6x9nYw79ymLurTHw78PXPrL/6yzLvY7tql0qYp2vS?=
 =?us-ascii?Q?qZp5M0TuBRuTd1TBKInySd7w4+/TLs7ir/xHLUIOLwQz0F34zd3D1Dl570Hw?=
 =?us-ascii?Q?exI5hIVj4Xswr0aBpf8xBUhbDaNwK/WPIUj8gJ6X1MFnC6LjldSGm8j9t62i?=
 =?us-ascii?Q?Yj5HgHhr0AweJtETDPbNaH9DNIrLNpek3YvWnPSdL3/A9jv960zUPSV9PTTL?=
 =?us-ascii?Q?8Uy3NEecbPhkpKwZzSjmF/HlrvPKH+6l+QHRrlRrTgAPbMu1hp+v5+JgnVxH?=
 =?us-ascii?Q?HrmT478E8wh3cf0dGoO8Uf43/g8Idwie+vP2O6gkZ2nkXU79lX6xfzpc9nF8?=
 =?us-ascii?Q?dg6ceUBcd+toifvvrb0fAhRdp2ajdqT07gl53JvHPCf9wXDfGoYp8L58Lqfu?=
 =?us-ascii?Q?DYbr4RbB4ZMS/gORs31lXWcsfezyJEWDb2vccbwwOmCtoKnkLjCBxS5fsnVK?=
 =?us-ascii?Q?bAl/N4yhZ2P5BQ5j2cssae8m91ZTjrim11SqHVc4np7JRTVW0xJbeIjlsQlm?=
 =?us-ascii?Q?np9WOfe6++UiM7qAOJsvraxB85Ho/PeDgkAInDiqN7cvf6nNLEHJr5Vq1GkM?=
 =?us-ascii?Q?C/ltBicM2jQOJ6OlvPK8NslPWJbBPgY1QX2D1zdUR5713iYpfqnROY3jPLd7?=
 =?us-ascii?Q?JLvdR2MKkm4vFIxAXR10Ja/uqTXerZIMc6dshF12wr58OYVxenbURl3qd4zk?=
 =?us-ascii?Q?BIU7R7fiolMtbNhll9MTd8JoDC5rbu3imhFeSo19lWuOPqWc1fhHT1al996B?=
 =?us-ascii?Q?NEY4jzX3sgaDn7eNI/aHOn945gujLhaoc7sjYpKBKBj1bqxKQUaqUudrNsdM?=
 =?us-ascii?Q?JF0SNuxvpMi70QeHqa1XH5xg11qHLbXO4LeXaTVYeb/Z/kNk6nVw6UNbcgBf?=
 =?us-ascii?Q?PHjcxl9RTgNDs9i54M+LzcgCh8pFsKw5PDkOlM9WH4X8/UOBvdKjA+MkSWLD?=
 =?us-ascii?Q?x8UnFsR+GWCo3flGzhNsDZBqPFOu3QnktxR41RSPdagi1rcIaPn/M+nh8y2C?=
 =?us-ascii?Q?mjWy5xH0cf6jgouEtGg9T6S6tWkeO7wrqM40BF0nZIvlTmr+2kdTpim5xyqL?=
 =?us-ascii?Q?hUhiYFkScS/Yx7YLTJhOh8Md38x9rfKgShbVCb6wFgfZzm4EDqYN6m8wMXbY?=
 =?us-ascii?Q?rb+q+wNS2BGuWbpjfbdnzAE0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b81b445-1682-4f90-e204-08d8ed0c415c
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 08:26:56.6521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9cfqVJC1AHrAMiZrgSCcjM7Ygy8pfEbX9Oe/9JF586mNjFc40iowXcKIMrYKKinlNTi3vJDc8mRk7ltnVk9MLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5993
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add three methods IMX_RPROC_NONE(no need start/stop),
IMX_RPROC_MMIO(start/stop through mmio) and IMX_RPROC_SMC
(start/stop through ARM SMCCC).

The current SoCs supported are all using IMX_RPROC_MMIO, add a restrict
in probe that only SoCs using IMX_RPROC_MMIO needs syscon regmap to
access registers.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 52 +++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 17 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index f31b258201c2..8e545b654e54 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -84,6 +84,15 @@ enum imx_rproc_mode {
 	IMX_RPROC_EARLY_BOOT,
 };
 
+/* Remote core start/stop method */
+enum imx_rproc_method {
+	IMX_RPROC_NONE,
+	/* Through syscon regmap */
+	IMX_RPROC_MMIO,
+	/* Through ARM SMCCC */
+	IMX_RPROC_SMC,
+};
+
 struct imx_rproc_dcfg {
 	u32				src_reg;
 	u32				src_mask;
@@ -91,6 +100,7 @@ struct imx_rproc_dcfg {
 	u32				src_stop;
 	const struct imx_rproc_att	*att;
 	size_t				att_size;
+	enum imx_rproc_method		method;
 };
 
 struct imx_rproc {
@@ -194,6 +204,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 	.src_stop	= IMX7D_M4_STOP,
 	.att		= imx_rproc_att_imx8mq,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
+	.method		= IMX_RPROC_MMIO,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
@@ -203,6 +214,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
 	.src_stop	= IMX7D_M4_STOP,
 	.att		= imx_rproc_att_imx7d,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
+	.method		= IMX_RPROC_MMIO,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
@@ -212,6 +224,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
 	.src_stop	= IMX6SX_M4_STOP,
 	.att		= imx_rproc_att_imx6sx,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
+	.method		= IMX_RPROC_MMIO,
 };
 
 static int imx_rproc_start(struct rproc *rproc)
@@ -567,16 +580,18 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	int ret;
 	u32 val;
 
-	ret = regmap_read(priv->regmap, dcfg->src_reg, &val);
-	if (ret) {
-		dev_err(dev, "Failed to read src\n");
-		return ret;
-	}
+	if (priv->regmap) {
+		ret = regmap_read(priv->regmap, dcfg->src_reg, &val);
+		if (ret) {
+			dev_err(dev, "Failed to read src\n");
+			return ret;
+		}
 
-	if (!(val & dcfg->src_stop))
-		priv->mode = IMX_RPROC_EARLY_BOOT;
-	else
-		priv->mode = IMX_RPROC_NORMAL;
+		if (!(val & dcfg->src_stop))
+			priv->mode = IMX_RPROC_EARLY_BOOT;
+		else
+			priv->mode = IMX_RPROC_NORMAL;
+	}
 
 	if (priv->mode == IMX_RPROC_EARLY_BOOT) {
 		priv->rproc->state = RPROC_DETACHED;
@@ -604,16 +619,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	struct rproc *rproc;
 	struct regmap_config config = { .name = "imx-rproc" };
 	const struct imx_rproc_dcfg *dcfg;
-	struct regmap *regmap;
+	struct regmap *regmap = NULL;
 	int ret;
 
-	regmap = syscon_regmap_lookup_by_phandle(np, "syscon");
-	if (IS_ERR(regmap)) {
-		dev_err(dev, "failed to find syscon\n");
-		return PTR_ERR(regmap);
-	}
-	regmap_attach_dev(dev, regmap, &config);
-
 	/* set some other name then imx */
 	rproc = rproc_alloc(dev, "imx-rproc", &imx_rproc_ops,
 			    NULL, sizeof(*priv));
@@ -626,6 +634,16 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		goto err_put_rproc;
 	}
 
+	if (dcfg->method == IMX_RPROC_MMIO) {
+		regmap = syscon_regmap_lookup_by_phandle(np, "syscon");
+		if (IS_ERR(regmap)) {
+			dev_err(dev, "failed to find syscon\n");
+			ret = PTR_ERR(regmap);
+			goto err_put_rproc;
+		}
+		regmap_attach_dev(dev, regmap, &config);
+	}
+
 	priv = rproc->priv;
 	priv->rproc = rproc;
 	priv->regmap = regmap;
-- 
2.30.0

