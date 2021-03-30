Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF696C433EC
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 09:28:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D886361874
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 09:28:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231843AbhC3J1s (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 30 Mar 2021 05:27:48 -0400
Received: from mail-eopbgr50070.outbound.protection.outlook.com ([40.107.5.70]:61837
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231684AbhC3J1d (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 30 Mar 2021 05:27:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhoOpt+wUApLYhb5chxpwTPd0E5F91d2bVk57b9WqRp7qyIy9eIaO7m+LWtFSRTdoMk92gGYPg4H4pk8QDwopN2yUEvZ0+MH605n+UPT/n17zoaSZ6Kl5AWlVvgE8WmeP00oBBFVMUymYGh3jouPSoR6+UVTNKpHMzdGK04xOQwp2v4u22w6HXap0O/p+TfIlx3x+lZq6guncUwoe67Od7ksN9Cv3M9f/befzfMqn0I/Bc3f3xXje0fJakPlRQuT6yhWLsPVjUwUluqkPWwaKAVfvuVlft+MsB91pcDy3Y3rbvRt7337t4cmK4OVJfnz7n9rZNK0TYR0HMqOwdkDpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFbeFgmbBCaZCdjmxUZR3o6kMGOjNuL0AlxqfZTemxo=;
 b=PQsgaw6YESnpWJ+vGzFIwsOcxLlR8EIpz8hP0y7l3FojEyNUhIYepyUClaD9vuMc/sKPLYOUUM/SWiidZC7ltk8uQsGiZeMeX79dabPBrC9FalfGi7VrA97p5fe1K5hwxZS99BGv+u99nhFUto6EcXU55qftW+kOfpoJNZrcKSUDHNBkSEROjKr+I+kbZcmYGUrvkyFSwHWGfi015R2ZGBK77HVs5bzHf2Iz6/R+lX9VFViC8GooMeik+yT9ewBLct4SGCDDUkZPRMylDKpfZg+ECCm6v6KCUO1cTOoYdPxpJUW2tITZUZBTejwlRCjTPXwUnttsqAj6qKTvX2h2cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFbeFgmbBCaZCdjmxUZR3o6kMGOjNuL0AlxqfZTemxo=;
 b=VvdweBsz4CvBUBZVg0pIf0vygsQ36rv+sSnUxzUOibec1uamKFzw+MN2uSLxgCrgtLCmtM5slUCClsW76WPPw7wJPPP7A8zAcfzKt+NNBW7f8bCzgcecNhHeLhXbNkHqKXFfeu13A8990Ta4M2Fl93146tlMdN1XDfYTAoPOq+0=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7595.eurprd04.prod.outlook.com (2603:10a6:10:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 09:27:30 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3977.033; Tue, 30 Mar
 2021 09:27:30 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 6/8] remoteproc: imx_rproc: initial support for mutilple start/stop method
Date:   Tue, 30 Mar 2021 17:12:52 +0800
Message-Id: <1617095574-6764-7-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617095574-6764-1-git-send-email-peng.fan@oss.nxp.com>
References: <1617095574-6764-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::21) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4020.0 via Frontend Transport; Tue, 30 Mar 2021 09:27:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 11792d4a-afba-453a-580c-08d8f35e0a67
X-MS-TrafficTypeDiagnostic: DBBPR04MB7595:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB759573407F98CFCFED3A0B92C97D9@DBBPR04MB7595.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:321;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 40k+5gHsf+BgyQIli7/CA3XrLIbSfRlQwpfWzSFLk20RvZTnRjPf75nd9AT4qhD2JJWTGDy5SbSn2b5ktSI4rBWCTh+HBViUUd9/oGZpfv7QkpsmMiv6Uzgb92T3zt5k2dr9JF5UrSYjeuH+w03My3qAWc8pf3Sl5f7zvYPMDbOw2cACvfqu/hwVuh5E947WhsTbU8OUUFjMhQlPI31lZKxvRZgc/syrHNSiW3Adn+xu5/pDN7jIbVNde9ErDcpRD0ZDsYEvHrVVAsa3pgmLkx9e/5A/s2gDc3aPf1FRMa4GUC9xN/mElFvG6iujUdJrSSh+aCNklvQ1tlCk176uflOwplWGTaBCfCNyi6KQW/lGI+wtBZi6Z/No1xYjHB4h7jnHP1dX+cYMWm36UwJzQYTCI9q0WN3rlOA5naaZNh3NUzN1QM9KsIwSjZCe3rp0EAQLm7RMJGI6dDlmRaqveYwaYPAcJvYjXRA2pgHLCufugnYqV3xPK4q0I8ot83VytBJy3LcsOPKoNiBKsyc7gYv7SG1tZrgXFhFJDDzyCwnYn6fojO9yhYU9OMGS6E2vLdU/SFJHXGTv4TLM7SxXnYParjDr5H7IOBOSMOrXOIWNeCk163LsnmxSKPekFrfQHAKyQEG9nN8uoMGLuColBiNev0gFIyOnwUP1VH5Xo0+hJtAWDUFPp+B8rooVHw5e
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(9686003)(66556008)(2616005)(86362001)(6666004)(6486002)(52116002)(956004)(8936002)(66476007)(38100700001)(26005)(4326008)(6506007)(186003)(83380400001)(16526019)(478600001)(7416002)(6512007)(2906002)(69590400012)(5660300002)(316002)(8676002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?T+EIt01xJdy9jtkGKY1L+jcsMDdETv9f3jemscDArhVBHCYlkbw0wM9PnV7O?=
 =?us-ascii?Q?066PpncF/GeIu7AiA0aw8cvL2Rur7zSC06PgrP8K3BjXUBZp7lYzlXSBKvE+?=
 =?us-ascii?Q?fvYCDxg7gZZurtqEXd24Ad8UNwxasMwne3Z+H3T+VFbUMtEo1VkD0KYiLHtL?=
 =?us-ascii?Q?lLPIOkuiWaa9wEXl0zyqGR2FNqEBmru0oPKSYLSCW2DtfWCK4XqRWdGX/9Dh?=
 =?us-ascii?Q?1zQPsx8+1w9qjNx//zz8AeQTTUIQhLu236nAwxq9tNWHRbqJF7Vj703P6Fch?=
 =?us-ascii?Q?AEcCk8ocgqMlFXUiorH0A/2Y4bihfLklrMYOkEiTPj0/UU2SkGJu9GjBE+eC?=
 =?us-ascii?Q?wGQ1ve/N5G7IMIiyI7kM8D44H6o1LaOZrRKEfngvXIhBxHIqFgo1wO160DCn?=
 =?us-ascii?Q?YupTvlJotaORhq/2i3CGuTT8tjkOxG0ZuLWql8ikZuvRAF7PRRkXDddmpLAK?=
 =?us-ascii?Q?LLMvuNZBVHF5TTtjSPtrHC9BONN/Y3G8XF6DtpGUclwuWyEFEfsZIbR6P+pm?=
 =?us-ascii?Q?3YVjmxSwg5/n7rWgr3VY+oR312vUM0kk45m+lecqJv85akBXV8lOhcueFMYG?=
 =?us-ascii?Q?cWv3x4PEk+rMTpjr40iD8vZk4Y6rGzYBX6HCl0vdrpK34x6DzRrhpnqODpt7?=
 =?us-ascii?Q?CSysqL1LYG1oP12gMpdB2j5MOx/o5sF+NVJDOW2BG/F55W6gNcz2+XwF8nea?=
 =?us-ascii?Q?R0aB1s/lMxsUPP7yvpVoFaQM0mfozsp1B9qTyoXFD6ZJA626cGPr3CpM0aZV?=
 =?us-ascii?Q?89UK+YwCVY7fV0PJ2OB61TUSOt+34q6XVlJe8kOjp/MrzRbDC6XDi3vQ3ijx?=
 =?us-ascii?Q?SrS76oq987sGjUYQxTiRqcP0+0rV2+6XZS4IlyLLaHnE8TCwJpxgoPNlsmaB?=
 =?us-ascii?Q?KCF0P9REaPA6HZTt4HiVa9fGtZj4yxFBmOC4Adtf5dB2w2dHK/GpwF9khGGh?=
 =?us-ascii?Q?4nGzkauIeYjo2WRM+wRvOiHAiKaQzvzWBrSRfXR+G1HOE7yr6FsweV8NUlmS?=
 =?us-ascii?Q?oPoJTMCEw67NWR5310pZpGSGd5fY58CbDWvvim460fOHYHndLmS4+aU+2xjO?=
 =?us-ascii?Q?TLF091DyRaCUh9AdgXfqAroKHMV+NODfYgr+LpTUZFqep/yY7GQVJGbruzQD?=
 =?us-ascii?Q?NZk3dVjv75DNsZu8UR5gLitfO7Tv+gVGTldjxnu+UKB2aGoTT5ikPJ5aDSyc?=
 =?us-ascii?Q?lTy+3PhMQCJZosVgbiLxgRhTjXjxbbS29XWeIvaB9AYjh32RRwJdryljqswN?=
 =?us-ascii?Q?mU8rYAVary+CS0S7lhY8AZUKHcazoZHzR9fh07n7HBm6PbD//EpTomW0i32K?=
 =?us-ascii?Q?X8aOzk6+GbBoEtdz5IDQMoVC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11792d4a-afba-453a-580c-08d8f35e0a67
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 09:27:30.2174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgxbsOURT3SnXj3lzz0K8gXrzntppKZ88V+I4fJYNQ8z5WCJvpnbnbqqGV7skff7md3iym2QnM07lpKS7aR9OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7595
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add three methods IMX_RPROC_NONE(no need start/stop), IMX_RPROC_MMIO(start/stop
through mmio) and IMX_RPROC_SMC(start/stop through ARM SMCCC).

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

