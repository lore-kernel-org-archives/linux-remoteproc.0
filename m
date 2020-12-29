Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F73C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Dec 2020 03:04:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 631DE207B6
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Dec 2020 03:04:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727660AbgL2DD4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 28 Dec 2020 22:03:56 -0500
Received: from mail-eopbgr50047.outbound.protection.outlook.com ([40.107.5.47]:26094
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727524AbgL2DDy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Dec 2020 22:03:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ix222R9Pufn3opFcaKNhfBXaiU3P0q6xp68QEONMwXxlFXyEZ9FHhT3bEumIFj7Gm9nvzBWpwx5rqiEwiEGDhFXdDJ7xYdqv+exl5d9dkvjllEbxqExCQLDVquNZyY5Eo8Yjpn1iRQ3qpBCm4grRT01PKh44hsCHECoejyI1zGWRrk5vR9o9ea2TFUIX1hsJHBfj5qBMJrkfQ25BPeXZfivcEClIJeLghO4TmZdqkwiwdR5a0R/qCea4JNtJ1K3qjOn/ZGhL2xFGytfazxk/3faK52YGq486FxBxHfJxwqnbL786dai4SY5jnzosvpDRXxA2rME7/KmPqFwrT2WaJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtFEE6M51mDGF/Hl2oXngxif0aENCtRhvK9AUN8h4Ik=;
 b=NOge53yr2z2sWhE4oLNazumxME+i9Oh6SozVIgvjEY1kbpL9HZ65/fV7ARvGPr4hhYLJ318ZgEEY8BgFbFhIcYzVMux9MiDY+jw7srJmEOWT6wlvjptYaDYwVo04zzZC52f9hYdBVEZky8UPhDjjZIt1lSvtvzd5e6kav6jgG/qKXsYgAtJ9nLBcqfCfP1CCxmjWoHo3EBEzJJ7bn5hAjeFJk+eRV94rEPpyc3uDQDuoT01EvCCwx4YaKl/JewtToPrgAuZi/D6By1l8X/02PoiPXUTT10OQw0y+avCEKYrY8J14mgyLi3Ug50VauCRtkR2yJwUrlG905r1xLEDlDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtFEE6M51mDGF/Hl2oXngxif0aENCtRhvK9AUN8h4Ik=;
 b=c6MQRgYxU+LUMuEPNGJhwd6tonTK+TytUE5TviLBj5aPkuoZRZ3buP29gDO67H0XFDoDxgKBjUVNqWROlT+BhRlxbRqzEKmiQ0whM4mYXr/FRaVMd8wHomDL4GmooM8lW2HRC6LO4NwxYvc/KsKcxp6CCTp41VrKkZ8WIsDEh+o=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB7178.eurprd04.prod.outlook.com (2603:10a6:10:12e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 03:02:19 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 03:02:19 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH V5 6/8] remoteproc: imx_rproc: support i.MX8MQ/M
Date:   Tue, 29 Dec 2020 11:30:17 +0800
Message-Id: <20201229033019.25899-7-peng.fan@nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201229033019.25899-1-peng.fan@nxp.com>
References: <20201229033019.25899-1-peng.fan@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR06CA0178.apcprd06.prod.outlook.com
 (2603:1096:1:1e::32) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR06CA0178.apcprd06.prod.outlook.com (2603:1096:1:1e::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 03:02:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f3d298c9-74a4-4e66-21cf-08d8aba627a3
X-MS-TrafficTypeDiagnostic: DB8PR04MB7178:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB7178DBB5506DB783B7B4228888D80@DB8PR04MB7178.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:61;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QHXS81eo/zkDR8QmbXBan2DHZgpy8m/SEV3Lkyxnxga15Vk9wDtXnXbY4NaENyBmnNdO9/IgehdSaPcn8bL6bwPegVXOeWm23tJdjXNqD9OHSSG6chEJC1tkTHTdhhiDiW2tjNl8tRHCcGToMmj9UiROupO9+iYtrpzNL1qqV3rYZOme+g9dpKF0ONnrURuOJFtCp8D9iOqiEn6ifB600EmeuKTOHPoP2qf67kzW8+1ELSOFfVZGmzi3fyjREXU9AEc7IpQV8sOF6ip6e+mIJ0vqKvRercmg113ySzb+pgd9MpUXOiVH9XcA0IQcZp80sV5tPTn9LmdSvUt3zCuMsywZYZ52ItH4kC6wFxtAlhnmqRatHBA49upZ6befr0lTLPUUzOyYlCUCcU30FHStHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(36756003)(66946007)(16526019)(9686003)(2906002)(7416002)(2616005)(86362001)(956004)(54906003)(478600001)(8936002)(52116002)(66476007)(5660300002)(66556008)(316002)(26005)(6486002)(1076003)(8676002)(186003)(4326008)(6512007)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?687cO05CWY7j+YyBUfvDHkJiC78D4QsuOWdj/lazO6HIM9hlpXWMLMxBIEcm?=
 =?us-ascii?Q?1S1C8gUYuYePvIxvFM9ftw3u2oLXrSQtfaXk8yVr7UiOTZFXXnC4E4pBBZMY?=
 =?us-ascii?Q?1/PPhCC5qQYcxOHOs7ncIINJoStELI9qLl/b+/h9WfRpBhPRSlvx+fCjhIT6?=
 =?us-ascii?Q?ktLBZebG7hV4HbEFEoXJbL0scIjyLTll/t8KX+e/VUOYFY6ojAKfmx1K2SKv?=
 =?us-ascii?Q?Qy8OZcjvl98cWJ+MdITblYRGsRpBgY7MHniKlhVZT/oh6M2PMv+bfn2VHA5U?=
 =?us-ascii?Q?1CI5QgRDzi7MXxvszYEnmHYSNBs8nFl1DFHKF24ysX3wqbFT2kxAU2vVIWet?=
 =?us-ascii?Q?M/FeqQtrRVUAGL+FvOpj00WU4d30If7UiPJJBjKGPuAIYNwX/U2MvTqnB2M+?=
 =?us-ascii?Q?S+a1izH8qduEz61ld9n9j1fiBbd4bKSHIXyAjnGCXsBbiPv5crGdGZTBuqHy?=
 =?us-ascii?Q?e35fEcA43boXZTf/0IzhfzI87Hfsu+XlI65n4KWqtyJDYcVRoK5ef4WtbUSl?=
 =?us-ascii?Q?eTak6WAd5oYtzdznducoiOYawJEVMf/sjmFYCExg2JsNWy3qCKkwd+iHuP28?=
 =?us-ascii?Q?VN9b/WsdF8YqeRxkaVJUm/JX3t5/YFa4genKNV2PjuT9+PqEuK8aOVLm6fih?=
 =?us-ascii?Q?jJ28bEiO1POnTlST0Gce/E/EFNWfrWaFvQoqeM0Ah14uUY8tdOGHukppcmVU?=
 =?us-ascii?Q?zMmJUpA6X1SFdctFLD0fEASXAtc4B+sJ7c3GLXum9oyVO9Zo8/iQpdMD9HET?=
 =?us-ascii?Q?7Q9ZuQVk2ROhYtfqNDhX0qn/buxEN3R8RV0/ag3npkvqj2KQRzwbBc630Edo?=
 =?us-ascii?Q?cmzNbIwF4ZUAGNWz7FXzb1iHFA9L5a3RBL/9l6IN7w99xx0FIWB9b8zmWtqd?=
 =?us-ascii?Q?RRwVhQnkP04JPUVcWuE8Tal+uik8BYQ/eVIUqzsr3g0A5Q+MvG0Ak1rMToNL?=
 =?us-ascii?Q?dhXNf3znVldPvka4JStbD/qDSXy9mrI3ygs/mNR/SpEEsQHAfBjE+dDhvZhN?=
 =?us-ascii?Q?vUFV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 03:02:18.9529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d298c9-74a4-4e66-21cf-08d8aba627a3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+9XxwuHqTufaHCS6q4fwpSBQGtT0le5aZ/EZ1wwsRc0cPlDeadp0cSUff3Swxv5jEYlCftUiG3PIqUnW9s25w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7178
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
index 3c0075dc1787..f80428afb8a7 100644
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

