Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B14FC4361A
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Dec 2020 07:14:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E528D20639
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Dec 2020 07:14:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728538AbgLDHOv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Dec 2020 02:14:51 -0500
Received: from mail-eopbgr60041.outbound.protection.outlook.com ([40.107.6.41]:50414
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728473AbgLDHOv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Dec 2020 02:14:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fj08DOpBJGmaeAp18dKPqw6E6C8p606eB21liAtf2/L9vIwKv/XSPcpzpTAaBRjrMFv0SS+cnibV/7PSg4R6c+QXkyekAU7zI/rfHncnjtqRzhkMEGoZ1qAK8lOA6gyzwX8jk2ld5CNYHDE5UfLfiMbIrPBbumFms1ow9EyzulHwAnrca9UN01ZzNKpfnBYiRUcMRaVfMXlCEgxMkxkC1kT/M81V8CKt2xVXN4ljTLBh0/o5XRsCLtSNxR5tl525ydKaJhkifmFTCh6d/EOaQQVOSmrlQXHuyIKzKq9N0sHPNbdNyuBXxkDR75uojb8CiBHJfGb77z2cIUkvScy4wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=id4kNbQUHWxiXZqg9n6qNuHlA2iTEWH7H9YHzE+KI70=;
 b=mYYCaXZm0uaQ/KAXe6WX6m+3gDVDkxGqvnbMnd1niM344d/yJbaBfkNBOWo82MA0TyVAhv59pjx1+ouICscljHc1G/JLvxlW7NPMSzFVoMCVlU/kYhsiZ9SspdeYhrSiBKlEap75dU5g3zURkjkwo1FlN/5q1DueKYN7W67gH8j2k6J6VZCF76TTDoupE5MnnRnivazSjO6fKBH4fGEuYvUGwbY8amvLXRvJVxj0ynLcMjyKjH45OizNXKwTdnzplpfZiDrOWIZmQtkfhTe9KaNppbtrzOmwcQSNxS4wMucKYLVKYmU9SvObEhi/aEYCv1AQTASoeSLfzb0cz1YL4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=id4kNbQUHWxiXZqg9n6qNuHlA2iTEWH7H9YHzE+KI70=;
 b=DKZZ5Xj1MHcUXVqd/SrcRBXwT0fyHYvXFN9L6IfobWJiahFA0Z6AOkx/p1UA3A9NAOpPrF2WauvdbKI3ppet6xn+emTjMSzxBRXW+848lhduYVPLrSEagOMWhvhlhW+2mBnl3lIC4RBW1mcpZP4rBoOwO05Ew3tHFM0IP/X+cWo=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Fri, 4 Dec
 2020 07:13:16 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3632.018; Fri, 4 Dec 2020
 07:13:16 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH V3 6/7] remoteproc: imx_rproc: support i.MX8MQ/M
Date:   Fri,  4 Dec 2020 15:40:35 +0800
Message-Id: <20201204074036.23870-7-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201204074036.23870-1-peng.fan@oss.nxp.com>
References: <20201204074036.23870-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: MAXPR0101CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::31) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by MAXPR0101CA0069.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Fri, 4 Dec 2020 07:13:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 08044133-b020-4351-7978-08d8982411e9
X-MS-TrafficTypeDiagnostic: DB7PR04MB4633:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB46336FFDB740387E46427BBCC9F10@DB7PR04MB4633.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:61;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JL+xuYOSATXVJvoiGK5AZ94k9tumyBlF4yqk8Hw1sq+xMO8/DjibCI73m6COwzKpjgNHqC7bF3LdWtv59VU37QfpHyThVtrmqSWoa7gE2tiItMSbKCKvdag7+NLkHrnQ45h2x+WhPfldXMlHZuHG8N8p/DKWLx0NKVcKOvBWtn8SmBs9fsjZUNpI/e8MzIA2IPuUgNdkVKb5E+urYTV2aEDGyjExzaGWvrYXD7CLEo0+EqjT9WZS/GhdjGmPyQe0Tj1iVZlN65KkNRSObMIqlvU5sa1LgypxunjGRNYJ1W9TQZim+0bGMM89nmQXBGYOZvUQv54A71VhyKbATYbqDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(2616005)(86362001)(52116002)(6512007)(7416002)(1076003)(66946007)(66556008)(66476007)(478600001)(316002)(186003)(16526019)(8676002)(956004)(54906003)(6666004)(6506007)(2906002)(26005)(6486002)(8936002)(4326008)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Jp89GTwPTZPt1y28N9xdBfoFFsIfWxwI46kM40MLIcCqRXK+KAQLAyBgP5do?=
 =?us-ascii?Q?SbAhby5jthHeP7G9uuULmis9NTkwxaKHxJG9acozoTgwZNeTygVsTp4XPagW?=
 =?us-ascii?Q?x+EzEnIIaLz0nN9zIIbPPe2+AbUbFjo4xPuN7dMuY1RXPBpJxY1iClTfoi0Y?=
 =?us-ascii?Q?e5l8E9VDIRPRfCPpl3ftSkt+hdNq5ZaB+4ge0LAJr7sylaAUqxBZP3hUK3lj?=
 =?us-ascii?Q?6jFpLCW7gUs2L/gMs6p61ILpQtttQqdH/YglVNHIUH/0jn0xQfHjNCkfX2MS?=
 =?us-ascii?Q?9LS5jGvmnYYYDnK+GNPhl+lGcpP1s9fRTFDrvRRF39ehRwnX6QCgRz7wrlx4?=
 =?us-ascii?Q?s7hvYc1TFmN4Vb9bNu/yTzrhrHCK/8YM+jR8ipBeSmpsfRIOskgpdi3/5UtO?=
 =?us-ascii?Q?BwWsFJCMtiqyuki+OJw2tC4b0iuOQ33NqXE5zCd2Ag1bq8IAoOFZ5fINBn5l?=
 =?us-ascii?Q?rseAheo7YN9+yCpRDEJpm9XleR755p6G7D04qUWqS6WvMFRtasAxAke8eke8?=
 =?us-ascii?Q?QAzlB6iJdY42yv1RzlvXrE2EtYp9/mTd6Ex/s1ohTXwlr19VxEF6FUOIl1vE?=
 =?us-ascii?Q?OICGwGv7txpeAysHj1GGbYkxDS4Du+3DNCjImAlxd7vYr7WKJiBT31ojgrYz?=
 =?us-ascii?Q?3BQH+96AwCtITePH9uWg9U+++x/qOayvlMeyFMpZugOSw2nYw4GlCoyuPvLL?=
 =?us-ascii?Q?vl9QtnyQu1b4KJWzS1n1ItmmcFIms3Nw7RfvFa+6cOXpDOuGp33DHFp26eKj?=
 =?us-ascii?Q?LhFX9epN3YV0z2hqSASc5yaOrw6/fWCeIg5+qCYztL/xItO+M4f4RRhNYGQt?=
 =?us-ascii?Q?YnYWzfEHONW1xj1ygkWY/XqaGsJrl1CAUTOt3PaqsSkQkTNb7onwFv/E47Du?=
 =?us-ascii?Q?WuO9NjYYNWaXJIkojk1JXgtvRf7sa8JrJReXf2+7sdYdOrdgJ2genlIMB1jC?=
 =?us-ascii?Q?it4AXi8PtYitPcw5TEA0q3SgJA6XuXazbpTcNbClzs0BuDtG+iKrSTLWU3+t?=
 =?us-ascii?Q?FbH4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08044133-b020-4351-7978-08d8982411e9
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 07:13:16.3221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5DlWuoxVZy011VyYO8alrPltd7/2PvYS2SzqtRl8MYspP2sAG2jKtdaggEdy/q98yXNL7kX/4tOicnDoUko9iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX8MQ dev/sys addr map and configuration data structure
i.MX8MM share i.MX8MQ settings.

Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/imx_rproc.c | 40 ++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index de44b7d6ae63..afa650610996 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -90,6 +90,34 @@ struct imx_rproc {
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
@@ -140,6 +168,16 @@ static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
 	{ 0x80000000, 0x80000000, 0x60000000, 0 },
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
+	.src_reg	= IMX7D_SRC_SCR,
+	.src_mask	= IMX7D_M4_RST_MASK,
+	.src_start	= IMX7D_M4_START,
+	.src_stop	= IMX7D_M4_STOP,
+	.att		= imx_rproc_att_imx8mq,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
+	.elf_mem_hook	= true,
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
 	.src_reg	= IMX7D_SRC_SCR,
 	.src_mask	= IMX7D_M4_RST_MASK,
@@ -513,6 +551,8 @@ static int imx_rproc_remove(struct platform_device *pdev)
 static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
 	{ .compatible = "fsl,imx6sx-cm4", .data = &imx_rproc_cfg_imx6sx },
+	{ .compatible = "fsl,imx8mq-cm4", .data = &imx_rproc_cfg_imx8mq },
+	{ .compatible = "fsl,imx8mm-cm4", .data = &imx_rproc_cfg_imx8mq },
 	{},
 };
 MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
-- 
2.28.0

