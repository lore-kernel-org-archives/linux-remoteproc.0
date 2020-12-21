Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545BBC433E6
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Dec 2020 09:42:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AAE622CA2
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Dec 2020 09:42:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgLUJlj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Dec 2020 04:41:39 -0500
Received: from mail-db8eur05on2070.outbound.protection.outlook.com ([40.107.20.70]:55265
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726128AbgLUJlg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Dec 2020 04:41:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfMwryOMQl+qeMW6fAsiOFjIYRM2qgqef+ChUKD1r5QJxekcLBqbWIQ574NdozvFFsu+Id7PdtEsI0qczmsnBOpXRz9lUaPbt5V3LpujAGbchmuWvJJ3+N/LmVVDjYHOGpsRnedbvsVwRITqTF7UscD7SP4qVG5AxSL+K6BRqLFCNp6nPmXS1dSsXZZd8vWX2TtjQmbm+v3Meik9QOnKomz+V3Mj1QA/n8NLF26FJKJ4P+gSnamIT0oUxkq4ihqBkqIiJQgqqUuzHax6oDDMzfJsyoMunAWlKCeXv4Ce/Ydabx90Cd2R9OeAY3xkXhUu5+08KOEspMNgiyNQ413yBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWn1K37yfTIQQHFpQzexyTyMQg+0b0PlCpdGLt56/Qo=;
 b=hJEA5gqpzjXxeYMnFijJw1oxP6ofXTfcmLnBr+9E5eqPdd3HSqa5iTqRTfNBVZuzHAPaPKnh4Kc1VB2MEExd2hALCPylm86NiaGMY9dlGsCumilaxJYgmGwFrezvux/3XSvLFNoKyIbq8h4E/JENyztlexy37qRZQq+yvbeVyi46KltJkv4M46/2ZQzSv/PLRcOlpQiIYavg5/b+9KN2GF2olnlTVJGItxtzX9EOtOIoOW/Tv7yc/O1bNjp104FqSieDWe/6SlihgIVQtIHE06lExWhE9vBQ3y1SfhLrHh5uyXcAWnCP0tHSvJxrxiWo4bmzUUadLQk8eGI4VfgbSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWn1K37yfTIQQHFpQzexyTyMQg+0b0PlCpdGLt56/Qo=;
 b=E1Ccyd3Bk1ekw1wOWAnQuOQTPfYOSwPSJH8T7HFNUEZZyKlDzAJA9++yvnsjdziXqD3hr8Ta/E3jsA6dGo3B3+07IJtwElw8oWgxRQkTmegJKWTkWHDIAOJdLxqJawgcymhwDg2nc9VuvpHg8ycoTZz19n6Il6nhQC4yqSfh2bQ=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Mon, 21 Dec
 2020 09:38:45 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3676.033; Mon, 21 Dec 2020
 09:38:45 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH 6/8] remoteproc: imx_rproc: support i.MX8MQ/M
Date:   Mon, 21 Dec 2020 18:06:30 +0800
Message-Id: <20201221100632.7197-7-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201221100632.7197-1-peng.fan@oss.nxp.com>
References: <20201221100632.7197-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR02CA0110.apcprd02.prod.outlook.com
 (2603:1096:4:92::26) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR02CA0110.apcprd02.prod.outlook.com (2603:1096:4:92::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend Transport; Mon, 21 Dec 2020 09:38:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e6c5af50-89b9-4853-acf6-08d8a594360a
X-MS-TrafficTypeDiagnostic: DBBPR04MB7930:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB79302B5F8B46A21986FE9642C9C00@DBBPR04MB7930.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:61;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wdCOub53zQZnm79g4azlPqAKccJDwWCXbeLFr5tQLF+ShI9nQbx07YM6OdjvlGENMr1tIUGd6zZyqpcnbI8Fbxldnxm3c///1Ztxk1oV+KMNpVAEOqxjOnp4Swi19AVQkVDAoSsnSw6Ppmn9zVrSaw9BfccVjWoOuhhrcRG1xjW0oaU+UJaT0fCmsTgsM2XK2a/02xyvhX584K5dnTBFcNCWUkAFFEnldp5VwTiG0yuARtvl/eHJpDygSBehzx+bbJu9Bftcz5Xx5hwqAKPUeja0QNFQu3/ulGNsfs8iNvrNB7vH3uBryTh8vMfZb2OuzxOaZNNgYpunedTRbNdXfOkRBOtCd/QGvpqjgZFVCu8XG5TfHTi2/qLsoJ35RAtU7ICqoj8hcETtThMVE2P8sA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(5660300002)(66946007)(478600001)(6486002)(66556008)(52116002)(66476007)(7416002)(8936002)(6506007)(6512007)(6666004)(26005)(316002)(956004)(186003)(86362001)(1076003)(54906003)(16526019)(2906002)(8676002)(4326008)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1RHoi4LNe/b0FggJLcO8aP8vAVRcrdyyF7cMj7BSQH0BfTevxDlzxEUyVY8J?=
 =?us-ascii?Q?PllYlRqHrjwJcTZuc5tG8gZObmdQE8G9nyUtBl6+1+6cfvWECtf/PEBMtFeh?=
 =?us-ascii?Q?6d2+ELlDd++M1qbTASuj4UnZ54vphYRdKRXKzbtqzXY8mQXxPFanE7epeOWc?=
 =?us-ascii?Q?cQ+gCVDJppxt6bK2Hpx8Jr3N3NSAKBtgpNW6DMohmt6zzD435qFFHUAvh4cr?=
 =?us-ascii?Q?1fZ/O+QHvkLZ1PiaezJQYNTOz897e39oSCKT+cDcVtao8x0WMj2MbfpALJti?=
 =?us-ascii?Q?UBZiUHZf8JJ+GUQ30B25D5HyctHelgakGgTV5yp0jfyHV0X67rMydBYtUUlU?=
 =?us-ascii?Q?o+9QkXHO+yBZUEl1inhzFvRxdAHjjw38Y/T23Zze7xCLoKDFrY6/7Xrp2KKg?=
 =?us-ascii?Q?VPKGvEC631fWRikIMwQU9rOPN9AFMvkccR8qz//PE55VLo0K8Ga73f1tnWrN?=
 =?us-ascii?Q?13BrCPTUWU7SC4UT6oVZNaqW4XYRK/UCMzbku6V7CvhmWfsQ0L6lJDJieOVJ?=
 =?us-ascii?Q?STxIJBfrsrRAUTywB1NpmXG0TQVJMjubM1PVD1i+0VssaMiOletVNzzMlxiF?=
 =?us-ascii?Q?CfVgwYnzVeweNLWrAtVT8rydFMhzS8IYmvvqXxQ9qE2GzP9YTibzqOHkptAW?=
 =?us-ascii?Q?ZYKS6QzrONV3+r0eyP6ILKwF5K+yRg+szFRaY2VnpVeBbSWDf60rHskvnf/w?=
 =?us-ascii?Q?4c5kGm9OFu5dTuEglTk+0O08amXhqzlfARava43KYqOBQY42daJFr9oz68du?=
 =?us-ascii?Q?UVYcfxpcX8DnR6tr1GOqd6NXsg49a+yhW2oFQBhsREEzYnesjRQAi1jFwotH?=
 =?us-ascii?Q?x/Dg0uItQCfm1TDoZsDQPF6E666RAlIBBSMjHYLCnBCQgbHeE0p3H06/b7Ih?=
 =?us-ascii?Q?m7EF/r+00R+5ozNJ9cvdChzWkYcfb5Mj3Cd1eKCNu3E/fjVbPjJNS8H1Zdre?=
 =?us-ascii?Q?s4sMzXGzIlQjiRSlbKTcZ1dsWoC05yKSUCu7wsmJ6tMJh/lPYbeYqqbZSzgu?=
 =?us-ascii?Q?VvPw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 09:38:45.2077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c5af50-89b9-4853-acf6-08d8a594360a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2XXIUDaCWUkdEanLR1rbCkLc0Ud3QDKZOx/LuYglMousTl29hY0t+f6KEpb5u4K8QvjM9mFqrI2bX+SLzo5+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7930
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

V4:
 None

 drivers/remoteproc/imx_rproc.c | 39 ++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index f7ca7e7954ee..9ba996e5001a 100644
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

