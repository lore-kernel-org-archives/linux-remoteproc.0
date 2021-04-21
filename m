Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3700C43460
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 02:36:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A253613F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 02:36:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234748AbhDUCgw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Apr 2021 22:36:52 -0400
Received: from mail-eopbgr150088.outbound.protection.outlook.com ([40.107.15.88]:34783
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234739AbhDUCgv (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Apr 2021 22:36:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oaPAMIW7KvWCBQXp1SAIoM3YiA6Nyc2XwDgG+WaFacZ4d5Se0rLK1f4kOjJ+TSNx2dVF9SobeyPbqp4FlMlVu0Hw+DqjGdyVDJ2x1NnRKEsWXs86YPC+1hhQVuQLx8ahgX9woQdvO6ONiv3654lGHuyYhGlKYjRvdUGVHoa+pHT03ygoZx+Gp7ww9bXtXyh/yCgz7gyWwN8NGZ2tr8wkpQGG2VlSm01MDx8Ll99FiQPAEEZjgMdyl/fpjwq3bfyT1cIcaNoIxx/Z1Dkcsqtexgy/g4fzaoG0oqyyIV2ITGTNvCZeZifjXIfB4ElATTKE61o7j6MSifUr08ewu4W6WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzymBpZ5Ej2sizLxQ5Gkw5D8Y97LziPProGsnKRR5vQ=;
 b=nK/GDRXW4Q/eKr25KJN/4syrpuN2tMgoxAjPsN94S2vEK1dBimLmfzNcKuPRSr0SEaehi/eYMM0JJESMDcHQC1G1oPqWyBwraOhk7W0D3qyQRkhvQZRQmsDVABC+dPWcon9YLPtpL5wkGJbmr3aboseBh/EzCzLiffZzgsJx34vxrDIW6IWVQTlN83oBegqfHo2YfnNVIwc3xGtgoyX4IiVvzUC6UYPkAqXgKBvs/op5PRe1iy5+SPKkaPBIihKF8MHaj/+w0kfXXI0laZBI+oDvTbh+wS9Q3SbM5oxrzvZVP+qDzGYUUcu4889abQHTaiBs6uxZLu9MZlY/eSduUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzymBpZ5Ej2sizLxQ5Gkw5D8Y97LziPProGsnKRR5vQ=;
 b=NjtNTDKwYnALO7OT0rfhwBawpxD88DkuLuFsD/DxJd3NeVIltMu9O3SrAI2aHdjEGLp9hFoXM5wmUVPqhl/6f2BCbyj9G5/TkGHOmqvjROYl48FrzObLCgNNNsJj0S8XAS9P39xDf2nuzjw82sqrwaNR8w8hu6SRXJCNYqIoadY=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8313.eurprd04.prod.outlook.com (2603:10a6:10:241::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Wed, 21 Apr
 2021 02:36:15 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4042.020; Wed, 21 Apr 2021
 02:36:15 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V5 6/8] remoteproc: imx_rproc: make clk optional
Date:   Wed, 21 Apr 2021 10:20:20 +0800
Message-Id: <1618971622-30539-7-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618971622-30539-1-git-send-email-peng.fan@oss.nxp.com>
References: <1618971622-30539-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0204.apcprd02.prod.outlook.com
 (2603:1096:201:20::16) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0204.apcprd02.prod.outlook.com (2603:1096:201:20::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4065.20 via Frontend Transport; Wed, 21 Apr 2021 02:36:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cafafef-dc2a-4276-ed24-08d9046e3ab2
X-MS-TrafficTypeDiagnostic: DB9PR04MB8313:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB8313BB5738CDAC2F3E5F4537C9479@DB9PR04MB8313.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wDkMm3/NqcJnxu7RaHpPuoZaj7p5NE0meAJQd/Tu6jHR2ImBUEGZr+XgOFtXVMoysjdGc70XVLRy2uYRcDKISl24Ca0NQSCcvyzcGX2fG/JS5KzyhQ3l+n3IrtKoDlUEqjft5rDfcB8DklmvTPO36M//OORcWDs0JWWh9Rk+NhStDPDyAcaYqORxuqc3ZlKYA2CnGv+bB28ay7ZUCBur82HvUiF+0uxIGAVVS34Vd8YsHbShrlyGTZSnQ5qWsKHAYAFqgf8hhulJ/qI/1HxXU6Yxn/irMpNw9vE2wSCK4aN+o9YWBxnEl0IXgi/HXkT8Y+02yLZytqBecanc+T+lwdXX3lbe7Clh+zApqCS+0TogdarJ1tfchDRjNiPeYUz9u+vQ/Dh9Vace7sFCa4bKK8PdobG56ZWwCRmhfxzZw5eSn3t+FZe0UPzhmlwlokuedvoXEaBTWxotu4tFBhXYhIt5mWQtMF9PM2n3GHPHv7/ftOwYs+YRIKf0vvQh6tNKhQU9IHL0AghQFM0S1wQSKgpew/PJN9qGTL4QvAtrvDFvgmpuNX779jCWikE24ZRPZsFquZV8tmJ+8AxB5G+Uqfe68mAzI10GVgEh+SJdSTloDMlitSmCyjngGDRch0FDZwXJQvX8Z3TNgaztZrL4m7wcG+vv6ByUPv4rhXpvKb31RFHRA5bP1zEZetLa4M4d
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(38350700002)(26005)(186003)(38100700002)(66556008)(52116002)(5660300002)(956004)(4326008)(8676002)(66946007)(8936002)(316002)(86362001)(83380400001)(6666004)(66476007)(7416002)(6506007)(6512007)(2906002)(9686003)(478600001)(2616005)(16526019)(6486002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MpBH8tf/9/ZhtAib4Zn2DfHkev56K7ppW16kqeoobJ13h1Umpkdqx+m1RLzK?=
 =?us-ascii?Q?ZhnZS7fBzt16KDjhCu+AIO0fvw1Ico2yONkUOPkpUX3r8yvlZkjrIaUyT9Ym?=
 =?us-ascii?Q?5zMj3G/QRXHSj0IC3tseuSNiFg8yMBdT8bMEMwqnNFqkTod+InLMZAFj8FHj?=
 =?us-ascii?Q?eaRk/l9ZYku5DYPLRyq8VD96+62i3YOactsj64xQHvw1aCgk9F8/eZaHeElu?=
 =?us-ascii?Q?pHlcUmZSFkehaEyt6Bg6xce9ym0C1E7nBR2uyFXoE8Y00HcIa/JNRu5Jt0FC?=
 =?us-ascii?Q?5IRAmZWsNC1z8YjVoMxxA1hA0OkORPFxLGJasurUB2FeyLV/6ODWg+3Yq0UG?=
 =?us-ascii?Q?pmkN+7dR6etpiuCzlvsxhCdvqe3IMm+ZE8R/v05cHCiPzIDUNxZbX8w6AY9g?=
 =?us-ascii?Q?LprDfGLQSbE4yAd5OPqSQSBvcserBbxhJmdx0CXzRWVMkXmESH3StL/yMpZf?=
 =?us-ascii?Q?YXZ1nuWfgNmNB8sEx8zEFHce2d9d4k0h1dKvVUq/kmpSgkopwxLqbGH5VXhS?=
 =?us-ascii?Q?REwDnehnYB+cSKlMYE44JBVyvs2zhVuQaWA7WSqw0lvaSRZ69mM0gSaOdba9?=
 =?us-ascii?Q?uVwquGors7XSLjpwOtijm3qCdH2gz96yPDbL9ayIhIC1DntJRPkPEuBj2YH0?=
 =?us-ascii?Q?ESy80IlAi1j04seJS8V6U7adepg1Hb7PR5r+DbTPkb//9hU2lvEdsGwNxKsG?=
 =?us-ascii?Q?CQJ7cXVVu+J7+9VFAJwQFnhnphU0RUCq0xl8yfYgVWOJxuwtnJYjoJcgZ2bO?=
 =?us-ascii?Q?BA6jgOnoineqvZFHrePKmZsB4wQMmstjNgk7OPyfAl+bMSB/G/DCTz9JjlTF?=
 =?us-ascii?Q?lrjI/FtEuU4K1x5Mmc1B5IqWzkVubFXVgd/H5wB+FM70YH2By7eWE+RuuB/D?=
 =?us-ascii?Q?r93NRHWYKTOCnPm23v5lyINWAXsFsKPlPrB2nCY/39ZPo2l1uHyNWC3Lpatt?=
 =?us-ascii?Q?+A/EdQw2L6obHd6oPljj5XCxx5YxCpwEzyqIbXqp09Zxs1sjM8qh/IDKrwFV?=
 =?us-ascii?Q?zKdMDdkqCDXCqHskuYRZd8pMGhU7rkki5wVty7t2W3P+Ho63C75K7YhYUscl?=
 =?us-ascii?Q?vOgqAcThihRpJI4RsAqEpEQ1ktfYtqG/v6++Np1K923jUCkPPIwYLqTdFyZO?=
 =?us-ascii?Q?vkILWBNxzbFVr88yyncDQhBPT0QjAuW8rqYHgcU9A0KsfQzG2PLs1SUM0CCF?=
 =?us-ascii?Q?Yqx1/bUhhbQzWmMLAZDl/2uYheq6FP0OV/F4exVuNiF34W85wvWj49npAhC3?=
 =?us-ascii?Q?7BgEsBJyILQkL+Ucx+KcbF8Ugp/wmzCaY7pK6HT8YbWB8hBHG+0ZjlVc1YQz?=
 =?us-ascii?Q?v1xhHRuLTQjEJh+MqQxrS6P0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cafafef-dc2a-4276-ed24-08d9046e3ab2
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 02:36:13.0552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LLIix+yqbv7ooD4DLWlRsIWSTXVE4wJm+N81tYkX/FjVPshwlbMMudV8Ex+gyJpVkjb/B/VOGfbapPamEiTIoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8313
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

To i.MX7ULP, M4 is the master to control everything, no need to provide
clk from Linux side. So make clk optional when method is IMX_RPROC_NONE.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/imx_rproc.c | 46 +++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 15 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 6289aeae95b6..e9d9860e4fce 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -590,6 +590,35 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	return 0;
 }
 
+static int imx_rproc_clk_enable(struct imx_rproc *priv)
+{
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct device *dev = priv->dev;
+	int ret;
+
+	/* Remote core is not under control of Linux */
+	if (dcfg->method == IMX_RPROC_NONE)
+		return 0;
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "Failed to get clock\n");
+		return PTR_ERR(priv->clk);
+	}
+
+	/*
+	 * clk for M4 block including memory. Should be
+	 * enabled before .start for FW transfer.
+	 */
+	ret = clk_prepare_enable(priv->clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable clock\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -648,22 +677,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_put_mbox;
 
-	priv->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "Failed to get clock\n");
-		ret = PTR_ERR(priv->clk);
-		goto err_put_mbox;
-	}
-
-	/*
-	 * clk for M4 block including memory. Should be
-	 * enabled before .start for FW transfer.
-	 */
-	ret = clk_prepare_enable(priv->clk);
-	if (ret) {
-		dev_err(&rproc->dev, "Failed to enable clock\n");
+	ret = imx_rproc_clk_enable(priv);
+	if (ret)
 		goto err_put_mbox;
-	}
 
 	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
 
-- 
2.30.0

