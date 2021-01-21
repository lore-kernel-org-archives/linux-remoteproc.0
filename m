Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE42AC4332E
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 02:09:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82B132388E
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 02:09:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728298AbhAUBpX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 20 Jan 2021 20:45:23 -0500
Received: from mail-vi1eur05on2053.outbound.protection.outlook.com ([40.107.21.53]:14177
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2392031AbhAUBRY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 20 Jan 2021 20:17:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QF9Hy5kcLmIwhdYdFCyiIVcJ6f+lGaYhrom3ez7cqEve4ep9uUeHEU0GK8RkTg5miEjTRHJVh3ll+eMZeVDnIK0sqI9KsXR3ZcZvQb5E3je/3CNGH4Jx+5ySUQQMyQlXoUyTWjcKcTf5PE6PYhybcD7opVVAVScqnS3+kal5rEGQz4YAAAVeiWcVc/ds8qdM1UKL643LBTynXl5p3Wslc2GTdO3nhDFx0aizjHk7ntfZUfIpTQHRUpD7VzlsueJbH5yD1QFmnPY3+ojKrkKc0kwPejY6hIbREn+ZT+Q7hUdmjDDJG9Fbl2xJ/Ji49G9HMRutvM2xS44LKduOFryXeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EMRt+7Vmm+PEYZgd0CpWpVOf1tt9M0R4iS+C7cKihw=;
 b=X/Y0eSWgGonGxntKQ5uRCXI1D1uogJIqs+w9v1X6sHZH5Cfu9PCy+uDUakyeez8kDLvhNqhH+pMcbq1dVyVlQcUhn4wJ516x4KuE3CNQ2t105l4YzG129OxNRLzr8rXrz57isYL9QJKAecc0PqXpTCdOXCe7WYoiQqaZMYdX+4Jakaz/KNgcsnmoouj9sWlM+uhFRyRbH1ZNv7DKFak0CfJt0LEMVNaS+RY8wQ8Oz9tmOb8b12Gskw9Z7q+FDFGRVt7Jyi4yHZriQrXLM/eqOH0IAHHZtPKV0Jw+w1DikielUN/+/fxPV64X6Ay7NhC6D69naB1D54R80oZitCc1Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EMRt+7Vmm+PEYZgd0CpWpVOf1tt9M0R4iS+C7cKihw=;
 b=OPDA1Lu3YLnS99bN6cfSN2R+UbGwq48JTyVquOXMF0Ywdnq/K9Wey+CFXLmaunTb8gc/o7XGitQMOfTWVp1waEfffKJfLURRZDNPWgGe7aa2XlPfvL2dp/IigSlmg1QC7jp9wtsc4fD7Op3SSI9JX1MB03hu1xz8ZBQPDXnmS9U=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7948.eurprd04.prod.outlook.com (2603:10a6:10:1e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 21 Jan
 2021 01:14:57 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 01:14:56 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V9 08/10] remoteproc: imx_rproc: support i.MX8MQ/M
Date:   Thu, 21 Jan 2021 09:03:33 +0800
Message-Id: <1611191015-22584-9-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611191015-22584-1-git-send-email-peng.fan@nxp.com>
References: <1611191015-22584-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 01:14:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 88895b26-4e4a-47ab-6e23-08d8bda9f722
X-MS-TrafficTypeDiagnostic: DBBPR04MB7948:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB794890F26AFD2DBCAAC30DF488A10@DBBPR04MB7948.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:158;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bCuYMllAcKvtDwK0yguKbHF79ZYLM84vXAUAWHV5VqBBOwOhH3lKhOJ5ihr5LzDsEgY03gD4UZcsyvbMtDFT2U4rzPl+gLjON0WHcuRnz9ryTwTYBvq31hDZflZ0fqieLo5XM/5Qmd7N9y0Aea2wePCRtZZ4s1cmbIanPYyxSRVWAKKo9RkWjyJuno4tDFfbrKLN22sp/oiz/ncw0g15uPHKrC643UCjRb2S4iw/v8eFArBx5FGXYsQc3wCcxmFMQV4Fmb2vzOp0J7FJqW1Zz2mABTVba64BpGACNg87uczdEgu2/4hFqf5DIRVlZw5HGd78oDISe1tG1EPv7BtG2zHGxCmAx6cAUj4HuTp0RTB+cg6veGsYCCoi4976V6UWTKOG/bQXACh2TKMBb4xjhklIldBu50GAombkP/sG/8dX7cvf0I5/zBbeHf2pMOuz6nAl7S5dIBNjGCL+5EH48g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(69590400011)(66476007)(186003)(2906002)(6666004)(52116002)(2616005)(4326008)(7416002)(5660300002)(83380400001)(66946007)(26005)(16526019)(956004)(36756003)(316002)(8936002)(9686003)(6506007)(8676002)(478600001)(6486002)(6512007)(86362001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?z54onQsVZ8k4cy6NiQOrPXSs41SgXh0PVpA+Q0xO//MCrWf4ddDhBCPoRq0k?=
 =?us-ascii?Q?b7HrkPitS3KiNYxUK2LJONeARN1qtez8bxW82VRk5JCh88SbcY7P8VX8HR71?=
 =?us-ascii?Q?OzY43isDBoFwwPtd1ZeFIFODrXORR5yy3sYPy8F/lNM8TE0/5eKPS3TCxpjX?=
 =?us-ascii?Q?iuJDgi9xQnTNt6ry2UWmzJX0GBH3902c0vwlkLKpez3b5ozOtaLDAaJdD0EI?=
 =?us-ascii?Q?N2axZyMFI9DwnBNioEgwwPD8wXTSCx19rXuhlSp+vhatcPvV8dbUXjCvVHla?=
 =?us-ascii?Q?fbZXTstBOJA1Nx5BCs/WEFNFohf/65/HGm0dKn9p5ZvPN27i1Wg3sF/y1dcM?=
 =?us-ascii?Q?X6G7irpNuLuojAL7RhX5OEK5S5nwU9LVFc9KpMU31Qnwan0zvJ1JqOzQHUaw?=
 =?us-ascii?Q?O4z6zik1qgw5siqSpbmXdfvOpmSu8yZB9agxUOK9Me5y7pL93oninCca5ST+?=
 =?us-ascii?Q?P0AzFK3+J99OBueYuf4+eWoLkLuFh0wJV3HSHKP2nQCf/pURg0owBw1w8b1D?=
 =?us-ascii?Q?/Q14x5VnNRKSgzLXQC+XyddC03wOf73j3bn97iZv8AKH0huZGEtcDU5ndDVz?=
 =?us-ascii?Q?w1kAqkhkv6b1n+g2Yahp4yAXITESQ9hCAl0Jh4b9XwHXGhlQDqHnqxPUbk0k?=
 =?us-ascii?Q?4OCO3AndzSNft5CYBZN5bs073Beef4waig4gGIMhxpbzlE9GIZN1Dfleaxpp?=
 =?us-ascii?Q?LftUMvyoD9qdHQH+/BFZbrFV8zqiuoPT27FsST05EAa6LQwRTqCjkC6r7pK5?=
 =?us-ascii?Q?wt7ZdCuZ4RF7Q01twXUSWl0yFkHh94FS7trn4Rl9HOcLkmjUzIFQ0nPILOCH?=
 =?us-ascii?Q?wIPS2gm2/0UN9YMcRp8/6bRuqiCRfA4ogdjTbCGeWLVOikW8WFnAbRUfftBD?=
 =?us-ascii?Q?tLqeeG1ghdKL2GT80vaNyCa/J8r6PE+LKGevBlANd+AQuoTXhntGCAFsc+6B?=
 =?us-ascii?Q?e1nEKTaLcjr5Kvr4hApVaOq49LQuUS3DfVHrT9eKhDfyLKV1pBYiUPff6rZ6?=
 =?us-ascii?Q?mw5s?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88895b26-4e4a-47ab-6e23-08d8bda9f722
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 01:14:56.9245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7A+Fjx8OrUqgu/AJ3QdJEA5UfN4YQoUYpjqhAeOOA6V6nEqsv7QAH5MCuCU98d0CjV7l8EbXkyKUfMGbzkfW9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7948
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX8MQ dev/sys addr map and configuration data structure
i.MX8MM share i.MX8MQ settings.

Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/Kconfig     |  6 ++---
 drivers/remoteproc/imx_rproc.c | 41 +++++++++++++++++++++++++++++++++-
 2 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 9e7efe542f69..86d99229e8ab 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -24,11 +24,11 @@ config REMOTEPROC_CDEV
 	  It's safe to say N if you don't want to use this interface.
 
 config IMX_REMOTEPROC
-	tristate "IMX6/7 remoteproc support"
+	tristate "i.MX remoteproc support"
 	depends on ARCH_MXC
 	help
-	  Say y here to support iMX's remote processors (Cortex M4
-	  on iMX7D) via the remote processor framework.
+	  Say y here to support iMX's remote processors via the remote
+	  processor framework.
 
 	  It's safe to say N here.
 
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 5ae1f5209548..0124ebf69838 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -88,6 +88,34 @@ struct imx_rproc {
 	struct clk			*clk;
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCML - alias */
+	{ 0x00000000, 0x007e0000, 0x00020000, 0 },
+	/* OCRAM_S */
+	{ 0x00180000, 0x00180000, 0x00008000, 0 },
+	/* OCRAM */
+	{ 0x00900000, 0x00900000, 0x00020000, 0 },
+	/* OCRAM */
+	{ 0x00920000, 0x00920000, 0x00020000, 0 },
+	/* QSPI Code - alias */
+	{ 0x08000000, 0x08000000, 0x08000000, 0 },
+	/* DDR (Code) - alias */
+	{ 0x10000000, 0x80000000, 0x0FFE0000, 0 },
+	/* TCML */
+	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN },
+	/* TCMU */
+	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN },
+	/* OCRAM_S */
+	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20200000, 0x00900000, 0x00020000, ATT_OWN },
+	/* OCRAM */
+	{ 0x20220000, 0x00920000, 0x00020000, ATT_OWN },
+	/* DDR (Data) */
+	{ 0x40000000, 0x40000000, 0x80000000, 0 },
+};
+
 static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* OCRAM_S (M4 Boot code) - alias */
@@ -138,6 +166,15 @@ static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
 	{ 0x80000000, 0x80000000, 0x60000000, 0 },
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
+	.src_reg	= IMX7D_SRC_SCR,
+	.src_mask	= IMX7D_M4_RST_MASK,
+	.src_start	= IMX7D_M4_START,
+	.src_stop	= IMX7D_M4_STOP,
+	.att		= imx_rproc_att_imx8mq,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
 	.src_reg	= IMX7D_SRC_SCR,
 	.src_mask	= IMX7D_M4_RST_MASK,
@@ -496,6 +533,8 @@ static int imx_rproc_remove(struct platform_device *pdev)
 static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
 	{ .compatible = "fsl,imx6sx-cm4", .data = &imx_rproc_cfg_imx6sx },
+	{ .compatible = "fsl,imx8mq-cm4", .data = &imx_rproc_cfg_imx8mq },
+	{ .compatible = "fsl,imx8mm-cm4", .data = &imx_rproc_cfg_imx8mq },
 	{},
 };
 MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
@@ -512,5 +551,5 @@ static struct platform_driver imx_rproc_driver = {
 module_platform_driver(imx_rproc_driver);
 
 MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("IMX6SX/7D remote processor control driver");
+MODULE_DESCRIPTION("i.MX remote processor control driver");
 MODULE_AUTHOR("Oleksij Rempel <o.rempel@pengutronix.de>");
-- 
2.28.0

