Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 708E8C433B4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 04:25:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5228C6121F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 04:25:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbhEFE0m (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 6 May 2021 00:26:42 -0400
Received: from mail-db8eur05on2055.outbound.protection.outlook.com ([40.107.20.55]:21472
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232848AbhEFE0c (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 6 May 2021 00:26:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dnttg+UvEOnIlzkRTnalaXPIOHu+EpwywNLykZ1rEIHczd0qKzITtepEOD0Y5gXiTxnOTlhJbXcYArTFhWkGr6b6sGD2ojOE08YgsYBzUMZKqxcQC6M+gNMTd4GAtYw0iLV9XSKXdc8491COcKkaBsYDm37qRWXRFghgVoXqcCmFRJflXh0SyYxGnbUJAIISZQS0UpKOQr8TExUBUY8kOgrAqzwZ/KO3zdupBMnYdv7TEvqD5FCcklA9w/x77AcdJIihd+3I6PWVCjC53PZbBFOE3z1Btrnkc0TWyor1RWhsEI2QpE4160Vk6ugWDt2a2bZXp5kjQfjVi2mLRiIpmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfYBa1daWkLa/S83Q2i3o1uIDSl9rdtzZmjwwoixPgY=;
 b=VxDBxFZGZm1DRwFDRWfpyyXGlamLb6KOX/oQjlF+jpBEKyG3g/MY+dTz4dSWp5lvl/0DH8TY+Y/48d2p9oMlhR5aknIixoxLr2WuJ3awBKCSDOtiNrFVUgWTSRQtkPkhERZfjzO8opO/j5IwVKbI5AENJV1mWcOeqGoqTFNrnIlXRw8JejSsvMHy/3LXAgjq1781pRlSQ8vU5d6HZHoGnnxDfzpd6m86Tod1YEl6nTNn+jyFdA9IqHg5OGx5x40ySTF7CWk63LCNad2uaCFT34ymxmhGV2f9qgU55+AkzdItaOsvsrVr4lGu4Xe3fO0zJcbxlET0aEn/zJE7H75dhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfYBa1daWkLa/S83Q2i3o1uIDSl9rdtzZmjwwoixPgY=;
 b=CjqmuXyVV88ZqNx/kL2vxks7C/a4fvgjWZF0ah/GA4Wtat7S607K+PewaItKf8Nkgh113h5qdPXbN51AURFyzrVE3uejVE8Wq1pXIaeDNylJL2uNzUCEWHWtVRMoIEndDB8zl8PS9JDpRaKRAmwPpLZguNk5p6T2MMRrdrrZUnk=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR04MB3126.eurprd04.prod.outlook.com (2603:10a6:6:7::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20; Thu, 6 May 2021 04:25:24 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4065.039; Thu, 6 May 2021
 04:25:24 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V6 7/8] remoteproc: imx_rproc: support i.MX7ULP
Date:   Thu,  6 May 2021 12:08:42 +0800
Message-Id: <1620274123-1461-8-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620274123-1461-1-git-send-email-peng.fan@oss.nxp.com>
References: <1620274123-1461-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:54::19) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0055.apcprd02.prod.outlook.com (2603:1096:4:54::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 04:25:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e342db9-3388-4036-8018-08d91046f7ab
X-MS-TrafficTypeDiagnostic: DB6PR04MB3126:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB3126102C044067BF053C8AC2C9589@DB6PR04MB3126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:208;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4UlHyaDrbjDKVvciZg8mICievaCRuBOVknjjjEgstJcJWHN7GqlifqQzJO2NNLkFCi7XwDP4u1iAJgRjgXZv1IhWc0F75v1q6SQpxniLurxGwAApfkkq38JmLauvQeXB2PqqpOspLR/GjNxgq65jc06bf46thxcBi2HbHugwFSgw/szKBbrqC+PD622lmRr6vw71XRlLcXlHWCsdAG/1VV6EVql8+g7swJElohGIhH3QXiF6W5kXf6ZnCyjzcW2VleAXdn2rwsHq/gaAISXsGoWz3mskBhNajX/I3g007YBLm7YeBcMWp2AGMX7CwBrveKc6Xx97z11V4ZO8Btpq1H39MHZTfkHog88/sKy9n6YIOck7BL9JtunI4W2xiWoagIiFPhaG7ziQ90IokmK0+KBlEPpbOsWmp2Z2H46YFr09dKJk822hPBtM2s0mL2poXqV3ysh+Qn2vrz8L8+XqzXjgSKRMpWZ3HuwtVzTUusKi67EKeYwVwGHLJQ+L8OIJt83qp3UMMhyIlur37LsQ9yxdFZ6LVKru019O1PduOubxDlhLeD1Bbyen8MkbKzc8O5McsvMjmkJDStdHSsQxv5H9jjUxSadvNpNrJ8UkQOxLAfGYQzaZNoj90C9gNHRp6DIc7F6vbPi02jfioX9vNAh5xPaLrdv58nvsdEDquU4WtnrNo+v04WEj/bejYDXF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(136003)(396003)(376002)(346002)(26005)(38350700002)(52116002)(9686003)(2906002)(66946007)(6486002)(8676002)(6506007)(16526019)(7416002)(5660300002)(6512007)(38100700002)(186003)(478600001)(2616005)(316002)(6666004)(86362001)(66476007)(66556008)(956004)(8936002)(83380400001)(4326008)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ffxRW8/pqJotC1m5STE13q7VTulIDmirGV5RexpMp53+4ow2XVofFPCmO4j0?=
 =?us-ascii?Q?vkxwtapHFKudwi+BgXbmbPKZRChQEIOktauuhWhVOOBn+J33UtoAegGnN2p4?=
 =?us-ascii?Q?k9vVX5T2KB9zkXjFeaUaP1+gXot90f9no6ia5QNdYSzb+wNEpTYmKnjUGIaa?=
 =?us-ascii?Q?rzGXATT1hC2D+7ya3hzVSmBkoN/U3l1fgtU1J4ONDJ2KV5Fsvbm3ZNEvrvDP?=
 =?us-ascii?Q?rLc6bNWAmC19VZpnjWpUv/h97PkLjdROm9NunrqR2dQloRidtkzZuBH6kauB?=
 =?us-ascii?Q?ZhaLoH26KMgBuY4FhKgGHGE2JlqGxOSGE+ZuQSMZV8DLsWuxqqvtgL/fvpvn?=
 =?us-ascii?Q?qFKhvLbdE2M0ceGz//bHQYyPhv/bGgTPqBbDTo44XeLL8g0/cv0s+93P9iRi?=
 =?us-ascii?Q?pJ0gNeUJPXv2nbs2guRpXj95RZMeTByTGovtOf5o9AXECeAviL6AjbPeA88j?=
 =?us-ascii?Q?nMlL+iVEsUpVd/7KM6d9HZPixgis2/egF+2xWJRXm9mZ7uMwztqcgPotrW+V?=
 =?us-ascii?Q?G/CtKCX4ozYVF365laRKxgReqfVTAXL4gPaFELqAcM17Zkbu34M/MwlFE0c3?=
 =?us-ascii?Q?xZ9n7uIUEQqQwTMC+Q6xZTexj+Io4t4I6MZvafQs/Ow+LEF0qxQACFQjPK2W?=
 =?us-ascii?Q?GIV161A1JgwvnOARRWZ9TWX8aG+gI9H1lx05a4QId9PauBkLczxAQrQNYtEK?=
 =?us-ascii?Q?VgwiEZbTZ6QPi7e4kV/rG5aC5zzMXTT4fXlYIyufUKMc2Bb7zxqaY4fuCdEH?=
 =?us-ascii?Q?CUxrhqHdKKOHsNFd2Ulcfccvvh9AvOx3x9kiaBBZ51Ef35yVVLvvooKPCtUQ?=
 =?us-ascii?Q?INu4jAGU0B+b97+x/eN5vZ9p0JkLFzefazYujAgOqBAClEq+EM8KFhvbam/C?=
 =?us-ascii?Q?+l1QD1ZaIt02TJjLe+8Q+MF1XyyV817yzG1YbpQs/EJjY2Ap+U+goyMg0pU/?=
 =?us-ascii?Q?Jq4XCXG0yMxWVR7XBGEY+5ktdr1mB2wUWitozEw0c1RETRgtkdkvAEAmWxir?=
 =?us-ascii?Q?5dRbEF9fUmXpzP6qrkZy73oVDQGDpyY1kWPBK3bx0hsbzHXwuTUOq36wp1T4?=
 =?us-ascii?Q?R85yP37WD+2ilaVFyA7Ltx3iI5pU0OC3+lrW1hxsY03V1+YKuzTzuzYYSmWQ?=
 =?us-ascii?Q?7QIb5wp2/RjzZKg8HScU4uvlMCie3O6iMKiDUrMTeakmAaMkg+kbmecPVIe9?=
 =?us-ascii?Q?OOQSdNNaGKr5eeFYBIbm3T2QBkNuWDC7Hhmq8oBsuw9mex3IHrEQFg0DV39l?=
 =?us-ascii?Q?EdwxqjvE2QubCclI5znVA5ATXf/RNzmxKpnQR5DLqtKwtWR5EM6qjkTSoTa5?=
 =?us-ascii?Q?hyaa5H7tQf+sxNcVn/7AAGNG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e342db9-3388-4036-8018-08d91046f7ab
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 04:25:24.1291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ap4Dh4O7LgYGV5B06AsXVuGDGlMpXzL6PEIWvBDv5imef47Uv3OC5ydDLzHdIu1cGBijMToOy8YEndSaTwDRNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3126
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

i.MX7ULP A7 core runs under control of M4 core, M4 core starts by ROM
and powers most services used by A7 core, so A7 core has no power to
start and stop M4 core. And the M4 core's state is default RPROC_DETACHED
and remoteproc framework not able to stop the M4 core.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 49 ++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index e9d9860e4fce..d26254609a52 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -136,6 +136,14 @@ static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
 	{ 0x40000000, 0x40000000, 0x80000000, 0 },
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx7ulp[] = {
+	{0x1FFD0000, 0x1FFD0000, 0x30000, ATT_OWN},
+	{0x20000000, 0x20000000, 0x10000, ATT_OWN},
+	{0x2F000000, 0x2F000000, 0x20000, ATT_OWN},
+	{0x2F020000, 0x2F020000, 0x20000, ATT_OWN},
+	{0x60000000, 0x60000000, 0x40000000, 0}
+};
+
 static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* OCRAM_S (M4 Boot code) - alias */
@@ -196,6 +204,12 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 	.method		= IMX_RPROC_MMIO,
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
+	.att		= imx_rproc_att_imx7ulp,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
+	.method		= IMX_RPROC_NONE,
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
 	.src_reg	= IMX7D_SRC_SCR,
 	.src_mask	= IMX7D_M4_RST_MASK,
@@ -238,6 +252,9 @@ static int imx_rproc_stop(struct rproc *rproc)
 	struct device *dev = priv->dev;
 	int ret;
 
+	if (dcfg->method == IMX_RPROC_NONE)
+		return -EOPNOTSUPP;
+
 	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
 				 dcfg->src_mask, dcfg->src_stop);
 	if (ret)
@@ -573,12 +590,31 @@ static void imx_rproc_free_mbox(struct rproc *rproc)
 
 static int imx_rproc_detect_mode(struct imx_rproc *priv)
 {
+	struct regmap_config config = { .name = "imx-rproc" };
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
+	struct regmap *regmap;
 	int ret;
 	u32 val;
 
-	ret = regmap_read(priv->regmap, dcfg->src_reg, &val);
+	switch (dcfg->method) {
+	case IMX_RPROC_NONE:
+		priv->rproc->state = RPROC_DETACHED;
+		return 0;
+	default:
+		break;
+	}
+
+	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
+	if (IS_ERR(regmap)) {
+		dev_err(dev, "failed to find syscon\n");
+		return PTR_ERR(regmap);
+	}
+
+	priv->regmap = regmap;
+	regmap_attach_dev(dev, regmap, &config);
+
+	ret = regmap_read(regmap, dcfg->src_reg, &val);
 	if (ret) {
 		dev_err(dev, "Failed to read src\n");
 		return ret;
@@ -625,18 +661,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct imx_rproc *priv;
 	struct rproc *rproc;
-	struct regmap_config config = { .name = "imx-rproc" };
 	const struct imx_rproc_dcfg *dcfg;
-	struct regmap *regmap;
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
@@ -651,7 +678,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	priv = rproc->priv;
 	priv->rproc = rproc;
-	priv->regmap = regmap;
 	priv->dcfg = dcfg;
 	priv->dev = dev;
 
@@ -720,6 +746,7 @@ static int imx_rproc_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id imx_rproc_of_match[] = {
+	{ .compatible = "fsl,imx7ulp-cm4", .data = &imx_rproc_cfg_imx7ulp },
 	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
 	{ .compatible = "fsl,imx6sx-cm4", .data = &imx_rproc_cfg_imx6sx },
 	{ .compatible = "fsl,imx8mq-cm4", .data = &imx_rproc_cfg_imx8mq },
-- 
2.30.0

