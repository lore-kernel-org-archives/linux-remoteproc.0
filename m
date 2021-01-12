Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF1E0C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 09:51:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9957123100
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 09:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391540AbhALJv3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Jan 2021 04:51:29 -0500
Received: from mail-am6eur05on2064.outbound.protection.outlook.com ([40.107.22.64]:12513
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387627AbhALJv3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Jan 2021 04:51:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N33muntF4qWv2W1gk98jbDESZ4EHW+WcCQC/RH5L1hrbOBeYBMyHcXmmjYNAY9+WR9bxlW45fPQlGt79ETmOIO+kM6Tq+a4DKih2kBEWR1OGz03ktxYsMhvavNrGgURPSTu1bY3iQ6sVWCTEdIhTxYrqIGacuXyQIPqj412EO7R5CgUKGuISvj0E80pmbM8k1WZg5V0S7iSk2r6AZEzx0mAyzCKk0USZBPxTZY5GKc6c2LXW+rOexCrGnvdBulqtiwN94F+KvZVSaDGHxmqf21QMj8c//Mvf6ltW5KzS6Zb431Cdo2kSUqx4vUQA4Zb2WeahmD3iL3SBHiYg165GXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtFEE6M51mDGF/Hl2oXngxif0aENCtRhvK9AUN8h4Ik=;
 b=ZpBBhoc7xHaNOOdVCYwTZdpVeTTycdKhzuATO6W0ffX//dRL3RNoFqFTo5w4PitqmAgJf+Nm3Vb7D2SfGxdoOhuJioWdK+iXFdDO8Sgn5pRPzeyLEHs4MywveRBHjC4N1mDK1Fr55Oul+hp79utnJdOiwKc7cEQE9htoXB91AGCld/1qivL+UGNbXtFg819FXbft7BJ7+DqA2p0JFJBQoY8hYj2AF58ZEGETYcsqJMa60Y+A6uRVng0s/tf0mV2Ll+vzDKAkg/oPQRX+m/i6AjaqqUo4Nzhxabig4JDaNezik0ecJlDVMgd+UIBxvBxKCI2tgxxWfQsoklkv/cOfcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtFEE6M51mDGF/Hl2oXngxif0aENCtRhvK9AUN8h4Ik=;
 b=V9lop9qo4Dw51N3qLiqSz59qLi30/dwsPKKFfU1xX+YgnttgPAjUDCh7cI8yd4Q5dG21hS42qwEW45s/OTmtJ7xNHyjDIEWPnUutm5YtFiV82Owz9MV6NIRpj4Ypa51edOj3sKWnq7Yd0+/93Jg0+pNxRSsJy8qcjWpq2EL27+U=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB3PR0402MB3658.eurprd04.prod.outlook.com (2603:10a6:8:2::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Tue, 12 Jan
 2021 09:50:02 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 09:50:02 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V6 08/10] remoteproc: imx_rproc: support i.MX8MQ/M
Date:   Tue, 12 Jan 2021 17:39:17 +0800
Message-Id: <1610444359-1857-9-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610444359-1857-1-git-send-email-peng.fan@nxp.com>
References: <1610444359-1857-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0212.apcprd06.prod.outlook.com
 (2603:1096:4:68::20) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0212.apcprd06.prod.outlook.com (2603:1096:4:68::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 09:49:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3be91094-a225-4b00-bcb3-08d8b6df6ebf
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3658:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB365871891E639ABAAC3419BE88AA0@DB3PR0402MB3658.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:61;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2wvgeI9M6N/DxrjgJZTk6wIKIfSaZscUMWGx3raYoPHU05kbfx8W8XzPtpAdYyZIy5ljDiVB6EpHetbhL5wue6aNS+3hkOv8Tob7UbaKlFjs2qGwTSZHJSaM4547Euvp58Xm+h3/GDTngXCvfSZpZYiaCqJoce/s1QV64SCDfhpWg+dlyfthM6A4TOI8lGvYnSgMb/6dndVHYUan/xuM9konLGFRJkcVo/gWYAeBHgFIacOvQWDlap1J1bCMKVBI0SFXEAxRlnAEPd+u88EeMvknxBGq2nCvBeFXZfmBvIkY6r26ZHgk0ooP3rs0QSAqasFTMroEI+/URsWpKyq40xfbjxi668DqW64r5A4POdyGo+pifQdyDdpBd3sMwJi0qmjIeJMkY5aKR6M8LT/mtnxp1D6qetqNVsyoYngOIpO4MipCgHNkGaGIkJ2wLvXP0fDdIBom9Dumgcjd6KAcsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(26005)(2616005)(6486002)(36756003)(66946007)(66556008)(6512007)(52116002)(16526019)(66476007)(86362001)(7416002)(9686003)(6506007)(186003)(8936002)(498600001)(5660300002)(2906002)(8676002)(69590400011)(6666004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YSRTTKT/Hhl7vJLrycUc7PW6rVVt0S6PZsgoHs1Y5PNk9p13QVsyrQwmuuO3?=
 =?us-ascii?Q?YQdAM1XckhUkpMNNbTvKJP+pCDJAuWW79GGSOpxJvpW5mhulc1eP+zQGRB77?=
 =?us-ascii?Q?agqU1KaoihV1KV51tNe+ZlxMe0fFU0rxiwjFYUm9/OuUal9zFEEyXS3TRZcs?=
 =?us-ascii?Q?GuZJhZAAhW1fRLWpn2W9kyVKnS3l815OJwHVxaK00pVGXmbLkxBQahiUg/wZ?=
 =?us-ascii?Q?WbS7ftnUoL0Jz8zRp6AuJpUyyw8g3EYmtuI6duW/7w4haHevQS3YASHzp24A?=
 =?us-ascii?Q?AFuPZk1xDNtW+gk6A3wEUwhOSakKc/IIEV0rkvjy4H3sT/8icu6MMc1Jq6C6?=
 =?us-ascii?Q?1hHStpJCCl9o99MhQ4Z/SXU0CWT2XguqNmmLX1fYWghTqFxLeWo6XPU9wPHm?=
 =?us-ascii?Q?b8z8kNeOe8OGxeuK9/f3kRAJ3SWZ29nU4sHRLi8zHDxoqLesoMDVZ2SWklIN?=
 =?us-ascii?Q?u32N/kTh2DR87ylDG0vJ5gVDoGsaVDXGTvhSwer9uxaU99gLZ0m5B6ukSO6z?=
 =?us-ascii?Q?GhHdHwnUny1pIezwk69KAMKefWpis/fabiXJqzWmfNj/kx/Ef17c98GocIdY?=
 =?us-ascii?Q?0rklqbBLYl0hURKnD6nbpYIfKrlHqYWGq0KFGjd6HLvtBP6s6ewiIJlWtYxe?=
 =?us-ascii?Q?ePjNn62nWpWzw/wRO7R43ZOuguLHT7spCcLq/EMgw6x1FLJ+AK/HCVbkMgMQ?=
 =?us-ascii?Q?envOIVKsQjYRBjqEIWJELd8i79+sXchgXUeK88ZkpW1Q2rzJH5jOUcdmcsZw?=
 =?us-ascii?Q?qeXAXVDKkcZcxFlIpnaMz8eJqiu2/8kXrAlSNlAAZJFSa5S2O3C/g8rTw83a?=
 =?us-ascii?Q?eVENgDiDrnQa946+1fNsb3SFzkGmcWbcuyW1uv/Qy/iKmc2LWQ66hgdTExL2?=
 =?us-ascii?Q?D2QDu8e9I1+gUqPtgHBYfXQ3DB4rHjQw5iGoUJTs3x/OPa8uLOD9syW1tUCG?=
 =?us-ascii?Q?Q1Rim1eye6C241AZ8XX2Q2TDmLPbpbgCdYKOdzcuwNyEPKhJKHfAyDCZBJ+8?=
 =?us-ascii?Q?cCsn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 09:50:02.3867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be91094-a225-4b00-bcb3-08d8b6df6ebf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENvB+FhQGs/fQFpCDdRPq+CQnNyAibdwJcME9r6Xvl6zCMzkfz3+VHkHOKTbUN2MbzI5nOcyJPj1cXq2y/KXiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3658
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

