Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A00C433B4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 02:10:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C003611BE
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 02:10:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhDHCK3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Apr 2021 22:10:29 -0400
Received: from mail-db8eur05on2042.outbound.protection.outlook.com ([40.107.20.42]:24544
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231144AbhDHCK0 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Apr 2021 22:10:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2mLOVkQho/H3hIfJXjVkoWyrS/V3CEbS2G3lLz/8onL8YK3Y3bVBOVBtBa9Y8LQfsAHPCv5+On+vl3fRXJ+jGU1dujVTtr6JJU7uXvk2Yc2AFQXmVfRlX6/SUXbhgKC2ZGivzIR7Qd/K2cKrW4nyBPvNyzgAwmixStSl/R2PU3R0lKfwGHHV4JXjE8S10T7QL0oSs8qqVywWJK+Qd+Yolu43h2jGeGZbw6WsXlAvRhJBr4C/sPWL8WkF7vn9JogO+i7j0akq1PNjl7lnBXYfPaakz+6yHlOvFq2WwuqQXY8kcByBBIUDYYAi8gG8tUS6pOEbbvrDMMnNXWzFKz/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktwdax96pFwXnk6lBfiqoYaR9vkb92hLcZsDEySZ++I=;
 b=QrDlTxuOryT1+xh8yZCWZRDmvVTCuKr76Ekbos45yJubEifWUSl70eaStd9ZPpUhgQyZYJZate0x2A9MDzfItlMOifLp+7nnTcXyzj8Bq6Fa99Xu3L01Pu2qsMWjlVX+kQCu8Od2y/muXOAcucerOM+Jz8ntl78x1wXSzw1a+8bOhspbxGW9IxgBrndyLSieo/UHwQXr7ADIFFvTu7A7As5SioWgBH2qORgP6T3gv0l/4ww3+OzwvYgihuY60NcCAKIruZ4G9X/kENBhynVKVNVHk/4dqrG+kpPmsOrxyyetm6aGU72Gs/Z9/1IPHgQJHgb3WNBTgRgx8/TmjB0J8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktwdax96pFwXnk6lBfiqoYaR9vkb92hLcZsDEySZ++I=;
 b=gzKkTCjywNLyeVEj9XqfVP3s/Io6hAHNmNyeNSM61+aFnMz7A+kGRYdpC2eGq2OdLQbfwswK57UpD6jPbumxKs4qhmrD3IkCeKuG32zMm2ZvhNEmbstGfO7hvlObbKm7Pd8G97rl8pPrBvI3lfFjwyDIy39lIMQZVWweT7f6fyM=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6857.eurprd04.prod.outlook.com (2603:10a6:10:114::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 8 Apr
 2021 02:10:14 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 02:10:14 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 7/8] remoteproc: imx_rproc: support i.MX7ULP
Date:   Thu,  8 Apr 2021 09:54:57 +0800
Message-Id: <1617846898-13662-8-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617846898-13662-1-git-send-email-peng.fan@oss.nxp.com>
References: <1617846898-13662-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2P15301CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::29) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4042.4 via Frontend Transport; Thu, 8 Apr 2021 02:10:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24d4a754-0b1d-4015-f233-08d8fa337240
X-MS-TrafficTypeDiagnostic: DB8PR04MB6857:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB6857C1E26D3D0A0301FA7C04C9749@DB8PR04MB6857.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:118;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wobQBq9+QcfuFTekEVEdcy0lLtA3ziOdik9HuuZ7WxKbnfH8ZBbVo8G5c87VoFLrz00gAlW2Udk9q3EAL2DIjwbC/R1ch0F1K/pMnNcGXtqbDHMFXnoRwm2u0y6q5S70UVd8yGTbdqlVZsYWdf6Zbe6J8+dsKwCVAxz7UqrcL0e7ngBxWP03Mm0EqRdtpIVP7AMpNIqMYJVXve00KiIc6ldqLkCCTPoqy6m97DM3DZ/5lfHbeWkEhPCM7sakOqFcLMl+ZLFPBjYmi/Ek3/GAKelPRh5THtL5Y4T6wHJ6p2iPL3o8xu+aD6bJOv6RYAgvEFdgyeXKtADFntrfSDPFfsVVMmWVn7jBOGwcK6yf6OFfEBhUPWAeLnsBb64wpBvK/c+v51xDM2HS2c/Jg2FYVizdTGaPDZBlJhgwzr7RA92pQnQu6ORjhB7YjUayMrtrwKY4VbpN6i0TsgFACizfDn9VhZJoZiD05OPsfLCbFEFbT/DzFkhaJWQUmy9eZPiByfwHvkvGKlT1/FkfHliWWr3HXqmq4HEoU+NLeOFlG6nAavCr8ZX37xWXDT7hrPDEffTzOwrHpAigdHausLp2eRdmUwWnRdlenRJe+0hp17DvXg732K60dcpegmdzjb0ZjDtzGDdmWPTGzPsM0Yi64SPNXtxQxbhX9K0H1xi+MaDR6jye9cmttF6YZg5O/xg8M3Gd6ywfWtkwyUv2tBjO8lXPKQ1OkiuVAAffAkMOOFQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(38350700001)(8936002)(6486002)(4326008)(6506007)(52116002)(9686003)(6512007)(8676002)(2906002)(316002)(478600001)(86362001)(69590400012)(2616005)(7416002)(956004)(186003)(16526019)(26005)(6666004)(66476007)(5660300002)(66946007)(66556008)(38100700001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ojf5/OzBKTNtBINMFlPIawbHW7W64LyTJXsBXHcEHCUEqxKNTGAU/S9UHHPk?=
 =?us-ascii?Q?Zno0Lyl2zA+2btuvAEQOC0OEr+xHfZONTxaamQjeHZYvYBzfzh8LCeFI4slT?=
 =?us-ascii?Q?oM60/a9326RkdqWEEOHr6ilhD7JTCyS/x0M1ePXCVt0G136ftWeO4FCpMulj?=
 =?us-ascii?Q?kjxm69JiFEtgXB+tLUEsburHW3mb0FWq1bkkRPh8tXTuknzWxiFMkwidW6+l?=
 =?us-ascii?Q?f0OpwCXVsJ7Mc/rCbFVN8xNkSC7hnjxa0wWgYApZntEMOu/UEw8H8+cM7xCk?=
 =?us-ascii?Q?wGkLZ0xxNErdUGptClOkbyHIDpVpBnRwyUz6UzoG3I6ODw3j74ms9R/5tRu1?=
 =?us-ascii?Q?Sw3IT7Clp2HobRrMXPS7OBYwqCGsumMrOFB/XOJ5/4d3Uh7IoK11UCQQcEln?=
 =?us-ascii?Q?ttd50tT1/VUXH+/T9XiqcP7ENVg+JhnUvXDvbcTktYCovW/3q+cdWQskTiwO?=
 =?us-ascii?Q?MS2cPPUqGjxU8su6sgS/PonoNLzviNwMTndAvWPmk/Usb6tkVEA7iFH9X+Rh?=
 =?us-ascii?Q?9/64422c9cp99MEr1DcEqNz+jemFbnOxieUIloOVitWD3UHsfPgcJTwbfqw6?=
 =?us-ascii?Q?BTrB1v4i2GWmeL9dmM2gpIqLcWIcJ7iYzELDSyOPMYOvgkDW68Gv7V9txrbE?=
 =?us-ascii?Q?gGLXWdVWq6YfR64xwqSldcLAJQ6O9QUmb4X6Mzl0+Lys17A/W25z9iJW00Ug?=
 =?us-ascii?Q?RoMKljylCoLUgnUlDKEbDSg75Ie7NXtuWhQGkZ45Qo1GNaCksV4hyRKMW2hN?=
 =?us-ascii?Q?xzP03+3y8jpTaPa1SLDoR+svvRxY/y2AIIs8PsgYUBI+NnA1GQ3S6XCGLGAC?=
 =?us-ascii?Q?cVD59kR8QSPRxmZNdjZPEyCI/+dVzDDhXriFzWBF3dMQNskQHakYEzeOOM13?=
 =?us-ascii?Q?x3px666DPR6i/cnu9cvjvflasSGWMWaDyxyJ+4DYZVSyv59kT5cfF9XMgMGl?=
 =?us-ascii?Q?z1K174qAe6n+y37s8f/5a9BU/EJ6yqpTnmdcl9vp5dngRO+W5tJXDcIHUozD?=
 =?us-ascii?Q?mIOWjcC6OQ3BzvGvh/Tc/plMyDk52Vy2qqHIZEJVNQoc4i4WtwieP3feg+X7?=
 =?us-ascii?Q?M8hIBn0dHWN6fgaEOUlEVZLDdCMF5AqRlChBvl9xZSs016DPKXXRJM3Yy/ew?=
 =?us-ascii?Q?aflgRfPEKH9T0C2jnw/dYbfucQAUl7pt+ucrU9kDjx2XZ8hsK0SYJP8JiWFI?=
 =?us-ascii?Q?h9zlKOz7NhXrl2oHYWxImG+qXplr22Jf88VAZ45/gDz0JSW8M4AILLm35vUV?=
 =?us-ascii?Q?89lJZR2C9Ak5Z+SaLJuSewaWDbYL/8UXAyjLZMiqhXj/qd+4jdxw3x1KD7xH?=
 =?us-ascii?Q?IMS59d53vU7Kt2OukNXZ80jN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d4a754-0b1d-4015-f233-08d8fa337240
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 02:10:14.1759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTe3NCrWs5nq543yq4hYF+ZzE45sxh0oDJvdwtpp0uLwVai8SviwUDUD22CBZYuyHND/ElIczl8FrtxLrECO9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6857
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

i.MX7ULP A7 core runs under control of M4 core, M4 core starts by ROM
and powers most serivces used by A7 core, so A7 core has no power to
start and stop M4 core.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index a7fa9d7fc2d1..b911a7539897 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -147,6 +147,14 @@ static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
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
@@ -207,6 +215,12 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
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
@@ -598,12 +612,16 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 			return ret;
 		}
 
-		if (!(val & dcfg->src_stop)) {
-			priv->rproc->state = RPROC_DETACHED;
+		if (!(val & dcfg->src_stop))
 			priv->mode = IMX_RPROC_EARLY_BOOT;
-		}
 	}
 
+	if (dcfg->method == IMX_RPROC_NONE)
+		priv->mode = IMX_RPROC_EARLY_BOOT;
+
+	if (priv->mode == IMX_RPROC_EARLY_BOOT)
+		priv->rproc->state = RPROC_DETACHED;
+
 	return 0;
 }
 
@@ -724,6 +742,7 @@ static int imx_rproc_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id imx_rproc_of_match[] = {
+	{ .compatible = "fsl,imx7ulp-cm4", .data = &imx_rproc_cfg_imx7ulp },
 	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
 	{ .compatible = "fsl,imx6sx-cm4", .data = &imx_rproc_cfg_imx6sx },
 	{ .compatible = "fsl,imx8mq-cm4", .data = &imx_rproc_cfg_imx8mq },
-- 
2.30.0

