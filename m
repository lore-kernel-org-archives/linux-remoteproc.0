Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64EF1C433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 07:53:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FA1222D71
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 07:53:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730743AbhASHx1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 19 Jan 2021 02:53:27 -0500
Received: from mail-eopbgr40080.outbound.protection.outlook.com ([40.107.4.80]:64958
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731235AbhASHsw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 Jan 2021 02:48:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bi8U1JLXDqr15Pd+jjIy3u/FYekyxh5LTIduO0+n2qrH1Gt2oEpLsx8mtfB2ZPck86OgLFibgT+GMHvd6o6vXG8jI1pj4GYbui5aUAtMtrMPFmSlMdiR6gaG2crRdcUC2rQp5+oWC6DAaG9tzPcaLa389f9by1igRfs6nPXLwZOiW/i35V0dMSyEVFm0BQm3ZEbdjiJYAmYHT5cpvzdEX/3k12ERH/k30XfrrernwErNp1UlUSq26VVq56uFyheGvwrYiNNULe716st6zu1Cw8TMAAaYtWjyc6tWIl7c/kxsuRZKc3TQM8Qj/Ftms4sAG7BUNQSIMmkcO8x6AQ3pXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3tuhvC/l1aREUPXQgoj+YPRRpgkRpSwXiVrTNIubUs=;
 b=WTtBxGXZpd66dHvqOrzcePeemLofFf6U9blzV9tjyhwq23qmY/kRvNa4GNbl9epnJO9KMb76PiRB/T82wOmB34SLWwmbuqL2pAke5LOdztnZMNuflir9JakxSLv4omZH7JnTwgJbQwi5LbYQ/IZreo5xO1AFBCGVMQn08nCvPvYbfoMGRrSlt5sYc6gqN4ss5UGk7JYrtXNmKtpc+QHtpS3Doeu0KdoG55fhxapLGYIC7gpSlBuyAmktFHWFtonZCV/1fB5J5SxCJrVJ0cIWjty/wKhhWoKKoBP3mhVKuhyOxirmVXFN2ZfbgDPSwRiB07JbBoEou+UOOKO8NbFYnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3tuhvC/l1aREUPXQgoj+YPRRpgkRpSwXiVrTNIubUs=;
 b=XnCGgzs9YF0od4g+cffOCZc/NyFtMOwwiI2AkdJnlxkNhsRUeTAxQRj291IFm8+F8mSeveuT9Pfb8VL2jSI+hNveaXNrmEps/VKglTiOi2T2pil8rjHtk462wftxa8Lu0spufN5evQ8KETP3GCtucl0RJO/VZn9nlwXWJMBJl+A=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4492.eurprd04.prod.outlook.com (2603:10a6:5:39::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Tue, 19 Jan
 2021 07:46:22 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 07:46:22 +0000
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
Subject: [PATCH V8 08/10] remoteproc: imx_rproc: support i.MX8MQ/M
Date:   Tue, 19 Jan 2021 15:35:09 +0800
Message-Id: <1611041711-15902-9-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611041711-15902-1-git-send-email-peng.fan@nxp.com>
References: <1611041711-15902-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3763.9 via Frontend Transport; Tue, 19 Jan 2021 07:46:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aaf0da8f-8980-4608-7778-08d8bc4e50d9
X-MS-TrafficTypeDiagnostic: DB7PR04MB4492:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB44921D08021F6E410879A13988A30@DB7PR04MB4492.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:61;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D0AK0rM1wJon6rbfRA4cjwnFozCNaQZKqIImvrDAhWxQkzxztvHBOzM17fLdl55s0IRIIHpOJ5KPnHwgUt8xrtWK1sSKGa55vytdOnBnT+pah0ULdjcPom9/kFWbKMQGgOLlIUWD4M3h3JbmmJuRSY38v9MdLYpjUUTw4VSunJID6mAD+8sCENYvF+YhgKU3nYNAsvE5xMwIs20LkqD2+1mxuI4i7Ivf//TZ9PlrKNp6qAqAJI8I2WhMMheVm9wnQ65Gx9kj7gqsZKs2eK5ifUPESqNAzWfdFdjgY3kL7qFA1onguvzkkArDF+O5vcCMV8pPUZs3lgdeJXmgPh/gehxceQDk2PO09YfPWyCphMgJ2FunjIax0SqkV5KIIx6iT+uHrTA+7xCA/J0SEm1rQYUVg4G9HnP2mDhglBJRfYBPSpR72lY2iS1hqq68l3yM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(2906002)(66476007)(26005)(69590400011)(4326008)(6666004)(66946007)(186003)(6486002)(6512007)(2616005)(86362001)(36756003)(52116002)(8676002)(6506007)(498600001)(7416002)(9686003)(16526019)(8936002)(66556008)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qLqD2somTiNDDWc6DfjQGtrmIs1iJlekrrXEUpUDB0hNe1SyKBA25G9FRdUs?=
 =?us-ascii?Q?50t8HTtYxEkRXk9Cc3BneyjYWDlrjQG9o7Gs/jBJiLczIINmlDCTR8Q/DYDh?=
 =?us-ascii?Q?uy4d1fAaupwjXubSXfJuUmD/YaWK9+gsOPDjWE01zlPZGUrHGxs0jP/KhOW6?=
 =?us-ascii?Q?zXa6o30PT06uor1CbiEiLmTwgmkC+TVn+xnf1qAKa/ZzhHNNTUEXPzN5Pxzz?=
 =?us-ascii?Q?Kob8h4eQqccrzIdeielsczD7dUOSUAKJFydpyVkDU0sXmvvs3Vm1jOnj/GiO?=
 =?us-ascii?Q?PvhFEimDqC0mWXOko2axmhKZJ1gilTta4sJnzXdVV1EwpfUqBqPQu4/UXzGL?=
 =?us-ascii?Q?pqooTH9hIgpyJi7XYTs1vUeFQAaDH+TcCOfpd2K0pv6UmyDiIn1GFrw9L7ul?=
 =?us-ascii?Q?J4e03s+7ZXH+rngRDKMCMebgRhtmUCfVPcQri1NLNeLBLKYlAcYpl8Rk8oPK?=
 =?us-ascii?Q?KqEUvsIgFa9Rzle5uFv4nktk5YmjBcvBtMbGt2YVpbJWaT/CVixPGtg2Bgoo?=
 =?us-ascii?Q?qc7o3tOVQnJVz9csBYZDt0TJYvW7IlgogtxwpqF4gsMjq3NnIVfQZoyqFhpY?=
 =?us-ascii?Q?QUMJyGJRRT/xKGTbeSe63yHZyuqcoOqnfiuw0GqB1G/Uw9QrrF2bYFmlLJY1?=
 =?us-ascii?Q?/B/7VLMva+1eDtfV/tzC6AXcGcksPCQiJPw9NZNDzQim39vnzbln6Dncz5qT?=
 =?us-ascii?Q?fSq7bJGCaV/hL3hijY/nsVIV3/W8ZLWt0wgAV6b+xe/yPkvSnO6pwEXUiwDc?=
 =?us-ascii?Q?dYcsxR3NFuwCj62S2O7TTNg5BQAAgxyrMavF0YkH/GcWgMScaonY6OU2KE10?=
 =?us-ascii?Q?aPtUBW2KrIgOgqz58OAkyaQF7ip0/yDsuFdOgEDlmHpKYYFh5MOMdO4xQz25?=
 =?us-ascii?Q?CK+zPvNZXLjSMGZ7sUcO+YPT+4bn9ofHuxSF6IAzu4GR9mydkYxPmNCXsXB6?=
 =?us-ascii?Q?lx2f4DGrCarfHnjXLmd+0b83uPd4L9v2lE1xmDc0+lfZi+fgVe0/SEqD1WNN?=
 =?us-ascii?Q?sTzx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf0da8f-8980-4608-7778-08d8bc4e50d9
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 07:46:22.4924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7UykOXFeu5kweVdanrX5hw5d7yUqJALtapOQFKJMvVvopqJOYLenIfg3tEB1+Poi61JulhJkzTAxT6Bcn533g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4492
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
 drivers/remoteproc/imx_rproc.c | 39 ++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 5ae1f5209548..fa01e64cc791 100644
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
-- 
2.28.0

