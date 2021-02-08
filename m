Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7F9C43381
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Feb 2021 09:14:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D92464EA3
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Feb 2021 09:14:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbhBHJNi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Feb 2021 04:13:38 -0500
Received: from mail-eopbgr40068.outbound.protection.outlook.com ([40.107.4.68]:17732
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231236AbhBHJLx (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Feb 2021 04:11:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kk8wvSjpqXr7kLO7sBCjZYmPaH05Tc6q1YgwJjGhM2dl4GsRj3DtW1H8dwIcCMT28vlsQQRuv5oheeRHvNdYk3ijcpRe8QepmOluSkMkH6erIbJQYidFqCxW/keN7jz+1zStyYjWunKueZcAW2ZDruTHscRKSHSl4Go8Cur9JjaL3dIpDiVINOIggR6HXRVvh8BkfFWG/J7EtrBEMaAi8nhLkYJMw+K6SIvucXVbM9FNr88lrSbuKj6SoXXEyI6V9oALwExAj2lCdgigEkoAHlOE/ieTQkY0eKBBAW58AIin/Rahn6YIXAy0+aKNyULITo55XoKcZsTRdYBO17Y0yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNgl0WbKTtb9jSYiW4oo06gJ+GsOdnAhRPfrRn4DFqI=;
 b=ap8ZLpfAUXJJZEPdyysxgL31IANlDP8TcCIDlMRa3BmI1wFtLxKRScfBWnIiTYEcB5o9CsVDfukhVKLGwewA8JFT3fKO9VwcZkZLIQo0/d5n8kIwX9XhL/pZaKW2hdlI6lj/+KfuO9LQZ7klFlrOKhwq796o/TOFHB3NjQcE3BpPhAWh6RF5GWFqw0jjp4cBXl0rzS/Rz88WMtwU+KnRG+95Q2DenHunH4yOieD1rOBekRMVk80i5iasWCmBqtKfj/QrVwIWDfaMsRJYevR6z5I0uh1m3rV5SVK3tMFkZNB/7uOaFordbfz3YpNFBKN9w5HCi3gJw0tSFAXy10Fw5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNgl0WbKTtb9jSYiW4oo06gJ+GsOdnAhRPfrRn4DFqI=;
 b=iYdZcWRecW2600JdzRifhXdX3pE6eJRTyoXoBVZGS9vArvwk4BKlh6+qYyLkcwqugXo/KVtzwU/SwY+KbnZ6x5o4vLaljT7HOsm4iA7chQNY2+W8/Uce5Zv0U2QB3n7Tn4/IBx8rEex7ve1VSzvViE/2g2IBtOoyX34K1iJAnAM=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2933.eurprd04.prod.outlook.com (2603:10a6:4:9c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 09:08:24 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 09:08:24 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V10 08/10] remoteproc: imx_rproc: support i.MX8MQ/M
Date:   Mon,  8 Feb 2021 16:56:09 +0800
Message-Id: <1612774571-6134-9-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612774571-6134-1-git-send-email-peng.fan@oss.nxp.com>
References: <1612774571-6134-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0102.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::28) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0102.apcprd01.prod.exchangelabs.com (2603:1096:3:15::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3825.19 via Frontend Transport; Mon, 8 Feb 2021 09:08:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2a883948-944b-483c-301b-08d8cc1116ac
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2933:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0402MB2933EF978FBAF2F58F33434CC98F9@DB6PR0402MB2933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:158;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RbEyhnH0evCVFUE6IaCoMn+7EKKUDvrVKDmkeqN754c8fubNBqpikLdPl1vLCENMGrHlYvr95F7S27ErImg3mk+SszDPov0TLWqLbqSiZSGVKTz12rKW6RTVpzMJnDigLKFIQPM8vgrVMx2KBWcEGXneyaDbbopBD6dSQvTvqqU4PKSHQrZOg7Pmmawi83JCmdmEPGzN5SvHOz5ypztFuEriT70BqJnp9pDUzslkV0a51wmUfAwPpO5dlzgB0oyoqoJL0TRuFx3Iy/B0qhY8lfEJKKJ70IW8Z11vZr7xlXXb92PBw8kvDJeqdf/xXnlimophLd+x6ZqFqz0/u+Cj2NOddK1hoRV+tHs/QCDHsQGkKif06NM8tfwhTQx7ufTinXoLH1O+I2gwkUxPFbMEwKNFKgf/epLXUn6WLTGlvJ96mhXc4pe/E6Lq188jiNoPWfQp+exRisz3w3RMSpQIsEOZ/uEM+hQA0pYLPveEEdf7o/C0NPePxNbVJZYR1z1qh5mih1VkcHwpZ/4P9pYqH+lbrzCLbseS3lfER9D5DyvY48jIYM0KUn4EwSlgG53AvV6+ZNBnTbnj1ofmHIDCcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(7416002)(52116002)(6666004)(316002)(83380400001)(4326008)(8936002)(186003)(69590400011)(86362001)(66946007)(6486002)(8676002)(6512007)(478600001)(6506007)(26005)(956004)(2616005)(5660300002)(16526019)(66476007)(66556008)(2906002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cBJJ+V7QjOFPIp9CJcHc/7Ytp/i79UIzi+vZtfhdkF0OI3kMjCUsIIbI458k?=
 =?us-ascii?Q?qJ8lxKbHBEX6Wc5SILnOcUB8gt5bJ1cavl98m7GxKllx8BsDod6ulz+iLBw6?=
 =?us-ascii?Q?KogqyBTXsia7n+n6RATbz5OkZK11aPWhatxGpBdigZBA6x6LmeOH12fGXFLV?=
 =?us-ascii?Q?DwDq2jOAcsupQtBmJ3GuPuVR9gTcaDR96p1p+YsRFH9hEHnn04sR/XsWCFkY?=
 =?us-ascii?Q?XZhXFHVCB3OzEmscWuwXcvO/16OuiPx+Ag+d62t6NG6mnzCrwKrJheUpq8kc?=
 =?us-ascii?Q?vDHUr+7GEapxmqY/yt6ofcWhKtWfg5/dTEvQ/hI3swdPUbCEvuJjh7EJNP2O?=
 =?us-ascii?Q?bZOrOPfltaYF4OnwiPkbl260xBL3y3uBEdq3Ue14t1JIQMPqSvAL69EicZDt?=
 =?us-ascii?Q?3w10iFzo59vwSQNpSHSJS0rZnq2ssT7iYAeHxe2bJJ11czuyIfpCCD7htLcM?=
 =?us-ascii?Q?cR/JVMn2fSyFm8wDxnt38K3TpnpnSMZDQo36dBA8TOj01Ay52/YQF7OdOidp?=
 =?us-ascii?Q?GJIUtQK6TSv1aRszHH/oWNx8DJatPeNfOmqcLDNp2gjgvIcO4FeWBrDGghEf?=
 =?us-ascii?Q?jL3wGv2CCtnRI71PDCcBilIxBrRrjsSblayjbY7eANcFbVdWGbBT5sTp45To?=
 =?us-ascii?Q?dZyxTkq2c4Nlz5t3JrCJzLdyHR4XKixZtZ5LB87iBo8rMjSSPb44uIwfvQSQ?=
 =?us-ascii?Q?PsgE//JH4E7mhwDUdIG61XyBEHk1TzumoYar+gyn3/POmXxLzsFXjf4feS47?=
 =?us-ascii?Q?XzyQxN4Vhws4qEUBW2HqGHaL11YlIF/IIqRL28aL+BRTns5iespJ8RJD4WwD?=
 =?us-ascii?Q?Pd3xkPd1CwYCIFBb+oMQGKw2mjeEu06utLuizv1Lx6zkoe7ehyJOFHwCChLD?=
 =?us-ascii?Q?kNpN/0MMljBaYUrlOnGJ3AJqyxn8rdwVSLVRSn1JFoDDlzFKIg5pVxx98kB7?=
 =?us-ascii?Q?Ygc9YaHAUW5zepSFZkp4CTo1ixtaYqmrfvydRzK/pWKBlR3vzvJ+zKxF1ga0?=
 =?us-ascii?Q?ch9SXZHR30hbqlOTdJmCdyDJYBkkbPx4XOh6KjBIxz52w/nNAgKxUbXIg1dW?=
 =?us-ascii?Q?OKC1FVRFeaXq6FRbPzh/t8fHAeMj01sL7WyqSiv8f5pZzdNH0a+B4jamZX0L?=
 =?us-ascii?Q?CYv4RWnRGFkvoPRq2PV8LCiVPqb3468KO5pGJbiQ2lGKV2BbPP3MzBV3R1y5?=
 =?us-ascii?Q?yLIKIWh5hqYYR/Z+ymNbIbdhqyyfA5Vl51yjlQbxnThuIOXG3h/eB0FN+Ooi?=
 =?us-ascii?Q?6JyXvFkvPnuBsmFLqIQuxPV5MHIMGe90h7xjEx0Hw2Rp+XL2KsPx5t/HX7ab?=
 =?us-ascii?Q?Bt6+yhKui/7E3k/gj4HmNUf/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a883948-944b-483c-301b-08d8cc1116ac
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 09:08:24.2897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AmvCwFFenPjYSt6KcqHhnzYeRK48OBG/0aze/JF2rxyp5EAAadUtAwYviyyIawGvZ22KIdmizp1FYFjbpT4TIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2933
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
2.30.0

