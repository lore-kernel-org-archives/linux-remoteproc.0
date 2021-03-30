Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA096C433E9
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 09:28:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE53E619A6
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 09:28:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbhC3J1t (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 30 Mar 2021 05:27:49 -0400
Received: from mail-db8eur05on2060.outbound.protection.outlook.com ([40.107.20.60]:61664
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231731AbhC3J1g (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 30 Mar 2021 05:27:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABVjJSEyDchB4Rx+sEl2tg7neKpHCVh6vT3YSJ2dWIZu+eMtnnwWFw7zf07Yi4rb+PZQ3htzq9aHfHrSaJ3nL3WZpfePhCnVWKj+2YFm1UbnUBunzGNRhPIxnTQOVxb9ovUg8H63/uhIh6XlKhS0VEx53GOrTnnbwu1Ys65/w4Visf9LkwOVzAaIJ5dZhxcUJzn/Qo2RUmGCkmTvoFV+0UGWpw6G/B8V9hrllrn0RomRPEqD/OOCHwPYFIqeXrIGxb7LC5ilfpmAtkxL/wMshOIBXws3waDopVy3kpXN/icDTKQ4e3PoNJBRp/afa8qu6ThfHSBOouJw1vGmPMzZgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktwdax96pFwXnk6lBfiqoYaR9vkb92hLcZsDEySZ++I=;
 b=NXbBsv3KFIFSgEf04GWBgBRp+QrV7I2uvyXYVfm1WKq7cXwt3qZhwriB+C4TuLWfYrYi+ni4f7u2CoOWYwDAQChCqsQgd8rESk0xb0GGU/DFaqBVZtXG4XRAsxLRwoswlNKajLYUPR2z/YP9o0LJa3r4OMduJYTm5VqW3Jy93NHU4nhBjyRGygDLGwZnHiSPy9f6q6b5O470swit1Qb+DO4MC/UYMZ+8l5LRpl9Agm/5BCNz4HfcYlzhRm5rH8if+qlViIFqqK1M0XGzo1gPKHiebVdmVlavM934q6WcfDYrmi8tfEepOfSo2i8+rZDZAbbWlg+9WR8aNXxmFtYgHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktwdax96pFwXnk6lBfiqoYaR9vkb92hLcZsDEySZ++I=;
 b=Luh8TQuv0OF0PDe3oCsNH9aJpWUwV8PlHH+Sm169ueTlD+lJCxggeGDncYt6D4KBn0eI76duJyv/ZlzwZKwT1i+4aAC8/7AZyfg8EYdEx0GKVdm3ypgfNO1HvkgfsEM97vmCz5s8zpEZyCDb7OPaVpDqU4oSMbz3PDcvqr4DeOE=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7595.eurprd04.prod.outlook.com (2603:10a6:10:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 09:27:34 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3977.033; Tue, 30 Mar
 2021 09:27:34 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 7/8] remoteproc: imx_rproc: support i.MX7ULP
Date:   Tue, 30 Mar 2021 17:12:53 +0800
Message-Id: <1617095574-6764-8-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617095574-6764-1-git-send-email-peng.fan@oss.nxp.com>
References: <1617095574-6764-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::21) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4020.0 via Frontend Transport; Tue, 30 Mar 2021 09:27:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5162df0d-4de1-4b4b-baa3-08d8f35e0d0f
X-MS-TrafficTypeDiagnostic: DBBPR04MB7595:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB7595F54CE7BA54CF55219418C97D9@DBBPR04MB7595.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:118;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c+KniEEM5VIgH/UDnPyClXeinBa5d9nkHJj08cbX1HjdWlMxOfXiV+Q4MEtdzIlt5dN4KIST4w1HDC7L4A2RZVkcuB/k+5E5Mm/GkYOCML1Na/nVNAIj33cEsns5xjXGXQO4yboPBIi/3RgDMhR4X0BqypPdi1G3DEE300H6ZGjQFBywXAgVdSyL1UjEVMegUYn1mvZ+fh8GiRQ2/xk78fsP87zmF5wzIdi6iiJ6K0wDofzcpWHIjRXulJF5jRYnRoERXQrD2GNQmeJ9O9DkcoLhVK5b6qcfqpSE7XZO1twZg6q5BMB/GeQ8rGuJbyfLdhQHTJwPaTf3JRtU+gFb/lus5gYPlaX76s10MEx2qm6uVrJurOffpe1EnsbuuFh3ri/YcafNPRs9W4U2AGt4H+6PviuJNfrfgYZt6i9axv2JBXUWgzQ23Y3vvVPur3lXL6vuNmzcHs+xBO5aPwjZsdYcwcf0eWW26wRsBVOrExwEqGcqyvuOoNH7ga32ped7TnCeHC+3fLfgxA47TyXSdJE+jP4sw2eTgZ6zkcWv8Z+ki0Cd76E6i1aKy/uxti/eaOoZXOLZbpsqowNg4uB7khBmfhiBfHR9dML5gn7aiZOHnAV/2zuAhF99L7cP7HXduk8OJ2QQKnqsoVSI/5uJsyQ7HEZRlwsJF5RVB6h1TggbmyjIuk7DBYF/esVOqSNu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(9686003)(66556008)(2616005)(86362001)(6666004)(6486002)(52116002)(956004)(8936002)(66476007)(38100700001)(26005)(4326008)(6506007)(186003)(83380400001)(16526019)(478600001)(7416002)(6512007)(2906002)(69590400012)(5660300002)(316002)(8676002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ubYqHjav40AmDo+LbTpDtalumy2b3pDZlkUZyRytO2obOuPDbX7XnPGPxsLh?=
 =?us-ascii?Q?49lyYJv6nQ6ka/TT6XdWxIUUbbkRdWdxdi/P8O2nXHZRnVgh8/Xvq+D0d4Jk?=
 =?us-ascii?Q?otOzJ60Ez/EEZaSiaKWPeZE0gV3dzDltvoRzDyflCZFUqSpg6+7Ga1GiPnls?=
 =?us-ascii?Q?QehrFoyB42MxbLYBFUcI1DvVX2mHKisDjh3w8HdJEjzjkdRIlKa4CNxKd0pA?=
 =?us-ascii?Q?kNDSAvQZhZFor5Z27YXVZQ4ZnY2iDozIX3/ez2T5aF22x44ZCqt65l2b46+E?=
 =?us-ascii?Q?+vlbw8nlTdwn76xX9QqNZmDqQd0993RhfVc1RIWj5856fwqOsj6OEEs0pv7A?=
 =?us-ascii?Q?rdk8AJNw1T2cNw0FuiJqy+UgsffBUVzFN//JQ349XGTY7vGTG+uHOWNbVWhG?=
 =?us-ascii?Q?yk0hLthjwpPClw1nZj/765mifB3DZdSVO72cRfTKD0YBlSQhtOpf6EIsgsb2?=
 =?us-ascii?Q?vW+6PEcg4ZUWbmbTlGCmU4llyYA0z31M0wijzPJYcZw/KIJPjhFmYcsJTxX3?=
 =?us-ascii?Q?X+lddnkkuurtjc4vTRPhM/Z7aNVgGIZZh1MN5tf/cyWdacFv6l2OkPT3VCFP?=
 =?us-ascii?Q?w/It8k/kjLpddYErKgjrBKZGq+vMP76EFSXMLXWD8IEXM3dhbIU2i47Xt9I+?=
 =?us-ascii?Q?/xBhXsk7SgZaD3AhI90aUhysbt7NQ6bnExBAPDPUpn8d9nhE3VFelPI6eaGR?=
 =?us-ascii?Q?R1KaO/1XDPDEXcNPsp0WTpgVpFhOWpW/JwtPgbcIARKGvNfYpkfHCqlaUKxA?=
 =?us-ascii?Q?FV1ZTZZVulPl31wJmr9eAIo/A887wK+4gpN+gVPbRVWYZtP6S7Ku4Bv+PBi6?=
 =?us-ascii?Q?wC+5KQ4wcbi0ypEojiefy6VCWpvl/JcVBXglrQgaNiIPa3JLtqm14RLruZTm?=
 =?us-ascii?Q?VS9cjQvuL/BA6SAM95sjjEzlTPU2NkF6udVRtz81xkw6zuI+iCJk5aDGE5vf?=
 =?us-ascii?Q?wKvaCYwQvUyUgNuJk6WpQhu2iHtFV7yCgWUBzZGtsT6lzNAI2bVCrVHcRRuw?=
 =?us-ascii?Q?y3m7zQtPjCFJFymKgSspgjZQ8Qu6gbMHIJ6WgZZUZs5u747IPoF44+c8Y1Ii?=
 =?us-ascii?Q?c7oyINRbCHFXr93js63SlmcuU+Ru9PW7Kcxc//I8fyuDnm0U2EOMI6vV4eJZ?=
 =?us-ascii?Q?OqHtw2kHDgqIu8mVvLNMgsHdVV4weL2nY5yltcjlLmV/vSX1jh7PgAegM7o7?=
 =?us-ascii?Q?oMzIsVqUxhrMcNwf2I9HO4ydSrjj+Vc1w3DmQNm8sz2Ca0BfzIbqnT/uLqbu?=
 =?us-ascii?Q?JYi0y1HfOwYN1wckLnum4QFGrIjXT+aZk+Os4DIsiU/JANjQvo/4UEqNn6Xm?=
 =?us-ascii?Q?LogQSvkDhK5V0yMihgrVwAP5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5162df0d-4de1-4b4b-baa3-08d8f35e0d0f
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 09:27:34.6354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHwiXHiHbSWSm5/I9L6fmhOZx6tWD8jRaCUrz1uKJ9TEvYryVAMiuMIZmn7sGccBNQmY+utdE/WwbKaTxCNDQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7595
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

