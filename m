Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 371B8C43461
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 02:10:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A5C9611C1
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 02:10:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbhDHCKX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Apr 2021 22:10:23 -0400
Received: from mail-db8eur05on2056.outbound.protection.outlook.com ([40.107.20.56]:53889
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230443AbhDHCKW (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Apr 2021 22:10:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pr5a/1fAN8KCsR0r36HPU31VacZfS4nZ3Sc7vqDi2FQhCyQezaKJoE5oJqycP4EKlPFjNZV7cz9yerV3EGT1D1jwdWG+Tp12bD4G4qeZ3gHVqW26KgNS447Y8q6TeifVPzMGfTARmu7h8W4QCBfNZh/Oogde0MYfS0ycyGx99mWxYlWCW5FhztgcRuEYHMg90jfgcXKTXa4Wu8h8r2GN1Ts1347L+XfP5putfm1HgM7n3sASAq9B0QNzN9Kfg+cL5Moua+LRedgtHeXNaFnLfjgWEXPCtSPMeDiQiLVVgjyGcc7/RxWIFXTxaMGSd1azK5rcUoTiOs3TetRvIVrdZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hlw6bD5f3VQNDpLGcX682U3Y++HsROQl4hj1JDzYorw=;
 b=EuzbuYTVmdl9TjoiNCyvBcKbCwhmYyCND6fJVGBRXeMGqHrxXy40w6iaZpsGYIChGH4hpTPR2XRi9iJuj8h3zZ1nSqIgZKF/Q1056yiyAuH64ZXv7DzPLOnzPL7WHwIEcFLIL8IRakB4HnpMmYQi+ATB/OQpZTIFFtuABujooH+nwktYwIo7/RAgGgqFwCSxa9Z0lJLcB+j6Uf0nw68Evg1O60vSlUtoOcdlg4kjvBXSg5ZMokFr9p8Vxc7Ly7K32aMnaUExi0/phExO0MWlBolW0wBuJ37c3AEWR7g3lM/vgqQ6EdMJXTbeSFQPgds2EoXa98Sadrc6bLi2lcCejw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hlw6bD5f3VQNDpLGcX682U3Y++HsROQl4hj1JDzYorw=;
 b=cnKLVyO4wB+EdlIvXShnxlnQahfWsABOFkG2HzxFi6bktvN6aL33ZPBjXaD9XdDLYLNdQWMIckpxqt9Kvg5IvxQBc14Ja/VFHXYWM6VHnbGAIDCBbsehB93tBvqUa2BqE7OanjmPJZPi7fl/U/s5POfXjyQwfUhyF2SVM6o7hFs=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6857.eurprd04.prod.outlook.com (2603:10a6:10:114::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 8 Apr
 2021 02:10:09 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 02:10:09 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 6/8] remoteproc: imx_rproc: initial support for mutilple start/stop method
Date:   Thu,  8 Apr 2021 09:54:56 +0800
Message-Id: <1617846898-13662-7-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4042.4 via Frontend Transport; Thu, 8 Apr 2021 02:10:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93e5d837-f425-4876-0864-08d8fa336fa0
X-MS-TrafficTypeDiagnostic: DB8PR04MB6857:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB68574AF738D87F9CDCBA537BC9749@DB8PR04MB6857.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:321;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TeFQ6QYN4aLh+j/uwwuhoyINdUK18JYcu9Hw+nF6y3133/aY/o8a3GQH++LPr4BOc91vh08LP+vrTz2R7LKF/3xxHlU5TsHx8rNawcOS/BqEm2SLDUFIS2bpKEf302GoJYhsF3P4PZwQW9i1GrB42h5ubVlr93WUmCXgyUGXcitN02vyhsXgY/ils1t76DdIyZBySBlzbt2SYKj3+Yp69MCE4LlZA008A2/vgY41nuutqjdKgaEmsMN6JFkOtSLrT55fyxzpOwpiJTbBRVVd908lNR1UEk8InjdZa+k5x4wSruOKsgPIPWv2mf1uEAviKF0VOvuHQae1jhvR5J7fQrfWPTSLJypZqLWGrU4z/UjahaGjfdpF51uBPRUcv9v7/am0tm0zPzJ7vL/4AuS1vFPyX+8u145uahB8Uvog8iiI8R411I2X520WR95I8rx/JQyHgPnx4kxo7SQimvKaRyPl+y8mLepJ9ED+D+YhJlL3e+oIgOuFR+5w9XWxvxB81ZX/aqYyoV58/5/wAsAEdzDaDyMQUyphA3VyzjUBGPaaH0yOwcxIZimQw1+mABDuGVVXN+3BTVqnLhP4YCBnBiDMRMIxDu0XzzN4h/ExNUIcn0BZiFZFGu9hF9MlHmtNu/bN6xOBpFUBLyPRu2Vy41qN8t6OsaBuI+Fz1BfWqwNWHSNQayJdvEy/zI5HZ0gEyFVmeb2Bwbny3F7k8702d4YC4nyCUbEKPomX/NBYDGs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(38350700001)(8936002)(6486002)(4326008)(6506007)(52116002)(9686003)(6512007)(8676002)(2906002)(316002)(478600001)(86362001)(69590400012)(2616005)(7416002)(956004)(186003)(16526019)(26005)(6666004)(66476007)(5660300002)(66946007)(66556008)(38100700001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hWc7eh+nrYBYIcQed11V0JEYtCvlkL1NvArnsJgpYr/Y+eSnicOTEeF9fAel?=
 =?us-ascii?Q?lZgvK4WNplrYhxEOxDaSxmwqOApBUFufMeNa9V3p+4WqtVPRSiu9nB3eF9T4?=
 =?us-ascii?Q?ntbuqAKLKsYdnwaoCeAG5HiCvU+DgDNa7Ba+8WkUG8xIDTAJwQ7EIe53anM6?=
 =?us-ascii?Q?MnElMj5W4kmbp6K2nQQIHkyNF/BJuUpftxWSz7MeuUNwLcR6ZPvngs32qv+X?=
 =?us-ascii?Q?S9SchuGHwt25YXYEei+wYvbOewR73Za/lEYP80CCPg5MgSLYe8A2cgHpnDvT?=
 =?us-ascii?Q?JcNJZtlKC+SukYSF1W3LJYXxtVuRWAT0zZXmmiKsqy2iCokF/uB0B6IZGSJc?=
 =?us-ascii?Q?YGeWWUnkiFFqYSqvZLf6HGooGEF9U24V0BNva9d9ougbqV9sNEBW1iSPOt0N?=
 =?us-ascii?Q?sB9DEXtuMz3wvbPZy8fBbvgkQV6Mhl+XyGWbd/VVkFwJDSHUUW6oST3S6fq2?=
 =?us-ascii?Q?C/MT0GGHlXvuz52ct1s8yLIMoU/JkEQr1or8JKeAm8QZgkizSKT9dDEA9gaE?=
 =?us-ascii?Q?43AzHFOHZ91cNKhUrokUniV4sJn4KkucDqQFO5YUCJzNMuA95cOpJJE8NY6x?=
 =?us-ascii?Q?iB0IAMzkjxsXvwlf8/rGBR3iwrv49Bi+KfuKyaAhfvK1MPhW5cX/WTC91J6d?=
 =?us-ascii?Q?GVYxx6vJsLVR0HDWa40BQ46ctDW7aI+NhebDRh8nTVDLjTMBrUscbZ7Xy3at?=
 =?us-ascii?Q?MYSZZ/6B9l44ftlHjX2btGv8/QaaZR4fMK//XGLSzcuwtr+DhIXd4rnyeiQg?=
 =?us-ascii?Q?pVvGFE86JBEiT60kdzvtCe7w7gGlNeI0aD0L4XCmFc0yO4w00/1vx6NxZAti?=
 =?us-ascii?Q?ZD9KzGngjHm/vO/AzY7xLEODYROsXk1BwSQMGfKzM1NqqVfYZRXmg4yJ/aA6?=
 =?us-ascii?Q?kj9agcxBtGcPEpaI3wMBAzsjdOqHjegS3oDswdp6dfT2nSBfVy73iRr7T9dT?=
 =?us-ascii?Q?0J1vO6nlxCUvKRs8EyXhUCzapXZlYqBKfBzRQbp8AIUbMN58xbpAgam9cuDr?=
 =?us-ascii?Q?y1k9PD7mPrNOwVx4sqK7XjX1xbTy/fR7/a21R/ugX2CFOj7CGy3EwkXltxZ0?=
 =?us-ascii?Q?lsp8DYs7BOFE9cZU57wQLg4Ep4yUS0P36MrN6G50j+lhXiLLg8AHY6x9AzSX?=
 =?us-ascii?Q?3tv6bHwVRbFsJ8bodfVgfuhwdZWtdfONiAzGPXV8vGUM95mwHJ0gG5/M/KLh?=
 =?us-ascii?Q?kDAYYXp0+FG5jLCjZY4RPqDROVfoGEgsjOHiGt/7P842ULcH423nrcbJbOsw?=
 =?us-ascii?Q?tkTCgoOAAMxaJ1YjvrSPsOoM8Ns0wOSZ5E14c+SE6g8lRSm42DJP3qWOOjZY?=
 =?us-ascii?Q?MXRRodw34x0w944xYeyUkoDq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e5d837-f425-4876-0864-08d8fa336fa0
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 02:10:09.7659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JA1ZzX6IpyqI0iazmq8PD3esJuhVz/BkAND4McCbR11cKbMasrbFBr3rUA0/IYt7x++m0fazqW+mVy1oN3Af9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6857
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add three methods IMX_RPROC_NONE(no need start/stop), IMX_RPROC_MMIO
(start/stop through mmio) and IMX_RPROC_SMC(start/stop through ARM SMCCC).

The current SoCs supported are all using IMX_RPROC_MMIO, add a restrict
in probe that only SoCs using IMX_RPROC_MMIO needs syscon regmap to
access registers.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 50 +++++++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 16 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index c576e12d3817..a7fa9d7fc2d1 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -74,6 +74,15 @@ struct imx_rproc_att {
 	int flags;
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
@@ -81,6 +90,7 @@ struct imx_rproc_dcfg {
 	u32				src_stop;
 	const struct imx_rproc_att	*att;
 	size_t				att_size;
+	enum imx_rproc_method		method;
 };
 
 enum imx_rproc_mode {
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
@@ -578,15 +591,17 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 
 	priv->mode = IMX_RPROC_NORMAL;
 
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
 
-	if (!(val & dcfg->src_stop)) {
-		priv->mode = IMX_RPROC_EARLY_BOOT;
-		priv->rproc->state = RPROC_DETACHED;
+		if (!(val & dcfg->src_stop)) {
+			priv->rproc->state = RPROC_DETACHED;
+			priv->mode = IMX_RPROC_EARLY_BOOT;
+		}
 	}
 
 	return 0;
@@ -600,16 +615,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
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
@@ -622,6 +630,16 @@ static int imx_rproc_probe(struct platform_device *pdev)
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

