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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11778C433E9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jan 2021 12:35:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB78A22286
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jan 2021 12:35:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391403AbhARMe4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Jan 2021 07:34:56 -0500
Received: from mail-eopbgr130052.outbound.protection.outlook.com ([40.107.13.52]:63401
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404041AbhARMea (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Jan 2021 07:34:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQW3IkJku0RMVwxfRA2bXY2kFQt0Q6fOPlGwXeBsr1cTCCQ64AzgjO6kj11/ta+3exRK79JBharXaBxN4nQ/PIGFE3SukeLK4mjbAVCtVpiY4DLr6vujxe4gCnQBG23fbbpcEpm9NG5rK65N5wDw+ETnfI0v4x3tD5+v9fe828NqLE2xr2aREatPXAmV5uG2uY7ELsvXQB+zkzhpP7P+zgiNg2LIx87ETcFizcQrIXXBC4dEkzzcrbOt5TYqYmjfznZmRAUHpIny13zmDhDrksU0hH3T6SGCgThE1Ux3CDDpOOGgZ+NJO/8z2Gmtq+WGbmEYbmhPY5WwAx/YGHGJCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3tuhvC/l1aREUPXQgoj+YPRRpgkRpSwXiVrTNIubUs=;
 b=KcJDy8b3AIr18x5H2dX2pMh2o5yDXrrnn5igp4tr/snCRGpZND6ZidLUgWpocG/r0fdGPVrpteKbvuQb0sVPas0B+uuriPthDr1QBWo1PVgHHR8LpFyI7eu4XnwGB8ubdLzPOG9t+q4mu+xRYLfMkMBgH34hMExdF64lNCgB5TFCAsn5Zf7Zzpsc6qcdYjTmJbBkdyikuylZRQg/kh3y68+5/fUrFJDQpDub7Qfn+xAF81Sr6SCLQz4kUC0PraC+cl55ojZ3IoYzlLrhQFlTa4/fLPlA4Vlx/BJ5Rz6hhxSwSI20r3uqowASF97xhmjPoDTEcIJpP6MZNp1fb7kc3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3tuhvC/l1aREUPXQgoj+YPRRpgkRpSwXiVrTNIubUs=;
 b=bAmSMIuAK8QTBFFAezekG4U+Fi/cpZ/sKktW26SQAR1iGqb7kPepg+lFsAQQWzmnPapU6BerzRQ7HwyIxvE0RiJioSc3y1p7qkdM6vUy/oDll8s4wEQ3OC90ERsLg+lT6X80pRh9fXLTqQqvxSHKqRU+FPAe4QO9LaLy8NYWJRc=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5243.eurprd04.prod.outlook.com (2603:10a6:10:17::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Mon, 18 Jan
 2021 12:31:13 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 12:31:13 +0000
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
Subject: [PATCH V7 08/10] remoteproc: imx_rproc: support i.MX8MQ/M
Date:   Mon, 18 Jan 2021 20:19:57 +0800
Message-Id: <1610972399-28286-9-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610972399-28286-1-git-send-email-peng.fan@nxp.com>
References: <1610972399-28286-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:4:91::17) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0113.apcprd03.prod.outlook.com (2603:1096:4:91::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 12:31:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2d0de694-cf4b-41c4-bf8a-08d8bbacf120
X-MS-TrafficTypeDiagnostic: DB7PR04MB5243:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB52434C902DBA403DDDBBBDAA88A40@DB7PR04MB5243.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:61;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wQFF2cZnFERlnqJJNTx0W+NuPlIS+y3R/OKGioCHfwav4uYhX/cBWPuJ3awtr9IXBVNM/0lIxUpDLOdlWf/owW/VRIRZj0NYLC17dK7VTmf+/iAnRSnFlLD+cmK1+73wL2wJ4fM85EFmRZjmphyEMTM2BchdtgNnbPVR9EaZtCrW2+z7ShG5cJSLSj99bFSQx9gFMXPoMVGTGElZ7AzYGXMHnk+0HoOQWPmTSrZF4VE5XC7vVdhFIoPT55xbk/syFmW6rW9BdQipni1nD9aPjgpdfUW49UL44MZ10LHlK4pWgrzcF9TKpAAN8I9EqHTG8ymwHs677nBhgQCUy6gi6IY3rSF7vh1YLkzPa+L763XyGq7jrE7BzEXpq2cvOQAEQjqFfCEWol+WyMS3ioZGPVfG0SyFHJRVxu7nGN3F/ME5dLLobLPr843I4M+y5Yis
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(478600001)(6506007)(316002)(6512007)(9686003)(36756003)(6486002)(66946007)(66476007)(2906002)(2616005)(956004)(26005)(7416002)(186003)(52116002)(16526019)(86362001)(5660300002)(8936002)(4326008)(8676002)(69590400011)(66556008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aYu6xW5Ec/ASkaVBUgjHfoBrY+zKhyfgCz57dH/vQ18zJ19cougfvXoD6SNv?=
 =?us-ascii?Q?ZQ2PLqFyCebSpqbGn/TPMOCX88iJt/IRG7mPUtgH+QPhfm1KAij4z8cwpn1k?=
 =?us-ascii?Q?M6KzUc+NlHERlH14B3LHb12S63Z7pyRIuIOlxOI+gmx/xuL21MReBjx5ibXp?=
 =?us-ascii?Q?ZSmAoezzdyMs+70Wm15dT+PqSlolTcPYA/8H+jbXzpTUEz5Hr5sRkpjUzDnl?=
 =?us-ascii?Q?/1j31Dr+851VRdJ1Hei3Q0O5r79ovz9K5d5iN1svY46D1LVAKqqAz6O1ymZm?=
 =?us-ascii?Q?tDPBfEahaGx8xb9ow3hmPmyZkEOp9NJO2CU1MOxXJuFv/tgP3RF1VIyfdBAm?=
 =?us-ascii?Q?5YSjQlkLTEwFFNneEmvHDaq0J06x6ZvtBEdpbHsrc62Bd2OHJtPWFzyjkK+L?=
 =?us-ascii?Q?LA2tbfhMyqGwJHpjTVMMrQlVGTFjjaBfR/Wq/kK+DqyI6lFRdGC1DPQ3n0c6?=
 =?us-ascii?Q?a6G9N82ILvwu1BqHLLdWImKcVj8xF9Efp1w0W37wuFTfxWVm2gxJOw6Kvq92?=
 =?us-ascii?Q?E/sdFIduPVVVaKy2x0aVAcYRmG6Xxzni70DJoVZcd0la7rjmUwe0ojrrfWNm?=
 =?us-ascii?Q?Hl5VpsbDIXvqiKlzXTuttD/6FMbgATEmqcqvLz4ED6O0Ll3kFbKCXdkLM5Wt?=
 =?us-ascii?Q?QA2nAwR1dPho4B89o1AzR/5yPblMiZb9dSY87Iyar2aqEYs4Fdgcg9YVBXEe?=
 =?us-ascii?Q?35o9mTjRRQDZ9IJMfC9+azy8Ux6+6zzrib7m9OKEmsivAXaZIarRS7IrIggX?=
 =?us-ascii?Q?PvpPdeBwm3k4YOIJ37clLzylU8N6sr3n5+8L4Pt5FF/Dpz60Iaq/tYm2hD/0?=
 =?us-ascii?Q?+MBBLeZmrupa0qxXQXbrRpf7mlowDQk55HEZdIuRGdtvkriJTb0NAGo0cwL+?=
 =?us-ascii?Q?6XS1feEO4wiUbxSgKA6x8B/CkWoIXaMfKtKXLyGRiw8Z5rVCmb8MJBGdllzK?=
 =?us-ascii?Q?7nz17mr2EBz979tVaUV0ViXJpr8ohBsa71rlz80mhyTOCq345toDAlGxwKfb?=
 =?us-ascii?Q?ZAdO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0de694-cf4b-41c4-bf8a-08d8bbacf120
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 12:31:12.9378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jc7SyvkLMrgBg1KRWXVH6oxc3XrLXkoFPXiCxtuXm312bm0RnvQ5NDaZ5IMR+vXsM6bcyj7owmKQrG6lZ/DLyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5243
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

