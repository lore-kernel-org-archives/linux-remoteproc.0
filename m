Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 610A8C2B9F4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Jun 2021 03:41:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48BF1611AF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Jun 2021 03:41:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbhFVDnQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Jun 2021 23:43:16 -0400
Received: from mail-am6eur05on2052.outbound.protection.outlook.com ([40.107.22.52]:3072
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229904AbhFVDnO (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Jun 2021 23:43:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxNULeSJHoC9kfXi8i1xYARenyyMuouTZYTPbKjcQjMabEnRYXi0G6V38aImzTuddwNYtm3tMvGdfyj1bEZBP6kDClPCOBQiVsbJGhc/tsfNQDD+asgRsJEM2iqU/L/VDJVjWPtLXgp7x7soPXQTU9jXSAHQlYeLiUwYORq0V93eEAJB93agSbuL/ROumrzvsFT9oYLG+pvA6WprvUTBipUERt8xJDhTKXHF//7REMbmh1M1MAqImMfMg8pCd66lAg2iGJRAo/96+yVyztCDb5bckG84AKS6i+PM7J/lwUrkfS2O/eIVBLYSpcp4qSEwgujIqwluiMYLKdiMfuyhVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6LcrYlHUUy57grtv113HTQzAhM1n7uKEIUTGYEoOrs=;
 b=awiZ4DJoDUwzhHrvlJm/dLoHRTI8Ms6zYjvj7zmW/jW5n/Ao+Bd/Pr87YdiQk4O9lyAowI6FhCvJbuCoV9l343IgQbe8wWeZMEmPo4FkONP/T6QZylBdtvSx4HmjcC7r4XwudaSlrNJOkGeJ7ZfQSrW2NvRQZiyoYF29pnzVF5vSoFxrOa4Op2j/sWrCWjpdHHWNqCWrXSglXZuyZX4i5nLXLVkF+NDaC2hnU6nK3HPLzffSF1lDAI9EcFU1MAPPd4GFrdP/wnAZAKli3IocSrLtIZgQYmwjokf1jy2APEy3Yc7O4sIoF8ElEOJPSTdTWvaApiftarARqhYm4NI6bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6LcrYlHUUy57grtv113HTQzAhM1n7uKEIUTGYEoOrs=;
 b=Le3qcNc+zuSKXhh98Em3rgqvP0v9gw9o1xJgNC4j+bUPKm+3cOwJQHFtheJWvNYWI3ElAh4+0V5NeVJsaoLI/1bMbBpQQHLB0DXBLYir3aYWJuRBrp/C61v2fL5jBLSxY3nKVADEv4vKaSOHuRNuwhX+P8Yf0Lq9NDA9yxmsDcI=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB3PR0402MB3913.eurprd04.prod.outlook.com (2603:10a6:8:3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 22 Jun
 2021 03:40:55 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd%9]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 03:40:55 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 2/2] remoteproc: imx_rproc: support i.MX8ULP
Date:   Tue, 22 Jun 2021 12:14:13 +0800
Message-Id: <20210622041413.16992-3-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210622041413.16992-1-peng.fan@oss.nxp.com>
References: <20210622041413.16992-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR0302CA0014.apcprd03.prod.outlook.com
 (2603:1096:3:2::24) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR0302CA0014.apcprd03.prod.outlook.com (2603:1096:3:2::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.9 via Frontend Transport; Tue, 22 Jun 2021 03:40:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5418d4dc-5974-4fb5-e8a2-08d9352f8a45
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3913:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB39134C416904FDBF97963DDEC9099@DB3PR0402MB3913.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HmbVVy/b6Y3sTPy8OyWhLXxE69nQVZFihxXhFiyopQycG6s+sSJGmEXYW3tkljW6TEwMWkyicmQGp5Ug7OKZbzACuTLdBRelgUKLsqykeW1R8dsJ8GVwuVl13cyiFzkhUdrS6XXe9zihUUYU0eX24JMsRMbA7VsZUAnjgvOsEwBzRUpLvDT4zaYiXT3nA4vUHZvpctrlVBhTQ0YxKSiUsQAkDwXhODcYBJmQ1Ku169SU9fnXOTzqxOtt01nYy3L0ndp1EjOcajEyUWNddjdyuuQdzEibe6lY44Wk1++TMirn8Uz8PMgrCjAIPomBAvXScjQD7fhNC1pdREVWQKtJG0WOlSS5xqTUIMttd6QatbQ/nkCq3LiLXZ/moxlNF4j5G9VPuU+quuh1s2TcfPMRhYALycOvqy3vT9S1xfaCyb+3GRaIN/MJ/v3Do2ItLoDfbDQjsAHVp4hdXGu8TcgbpyUqQSuW/D6waatXgJFX1gkZuKtFHuN2VtgsQ6eX8d3LpwepJKw7jb2okrQRyMROtBWR2TyjEvHoa//0uxaKTekDgMVQ17a4Ov4gsX+/U1Hj0jcQhRON19IQV4mDgHmNZiF/bTnylLhRMYKANv18SglTY9AdwPuMq7lV+JQvky736QA/EXGD7P4oW+DN0K0uUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(66556008)(66476007)(66946007)(6486002)(8936002)(956004)(7416002)(8676002)(2616005)(316002)(6666004)(186003)(6506007)(52116002)(16526019)(26005)(6512007)(2906002)(5660300002)(86362001)(4326008)(478600001)(38100700002)(1076003)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Up5oTWyGr7Ho17LTbKjhsGaPzNiWJgxJcmrCGUYTMXRIGJ4u4f9TjkFRInra?=
 =?us-ascii?Q?/OH1FB9Enlz1GpY4yi8Ur0KktkBzAamG5/wZxnwrVG4gm57EV8LAXUb51Dqj?=
 =?us-ascii?Q?LQGioaBj3OEU+p7bj854rOdhZq01GPfNckz33mbPiaWWEYfoMTfT7q8jDcod?=
 =?us-ascii?Q?uPKKnrl6L9DXD6WjqTfyTuEGNJPlNkORpK4QdAwUrgYPxlw6kp3ne3sQgD1R?=
 =?us-ascii?Q?nglR5RXWoncFNOunB5puSeBqBQ01F5Op3Q+nRnwSAKnA+2DrhhHCWTOW/y08?=
 =?us-ascii?Q?vFk7S7zk9SWg6KFyjhe90tj0vcMnVnXwN47lzlXivupR4MSBqCfLLH0meJvU?=
 =?us-ascii?Q?RgwzQw7rEWoxhg42AEcipTdhCZbC2duOTHojVJElM+Loa9/EwTCJ0jKxvTmR?=
 =?us-ascii?Q?CWBXVVB4hq8JsARRkRoZIoZAIonKe/qXz0RhrtsCxcjd73E3oOaKigvyejA5?=
 =?us-ascii?Q?dVB0LIWWMuIzEDmR/ewILwoiGIoR3B0fVZN+fGrsq1FaePgFeJNjuZ0x6qmR?=
 =?us-ascii?Q?/QEElU6NMHAU3pdMw/BwTLNtaTGOFPIk40KgLcE4u/cdyhpcaqFptqUH+U5l?=
 =?us-ascii?Q?lJhPHuQv561ewzY8wM0+yCZbt1oUDvmQ9zsfAkn8lLUcKCKfptkckfqG+jHG?=
 =?us-ascii?Q?Pi9b6TCiRFvj3FyhPPUBg38mr2kFUQA5iSZQ3G7pJNvlgrrGPJ0RfdBtD4uv?=
 =?us-ascii?Q?Xt9o3+W8mV0Ph9gJ9LJDoJCBR7HVr6z/hI8BoY7jWVtDNGwZKOVdETzJSuak?=
 =?us-ascii?Q?8bjXImv2/vNHMuIaadD4xoA8Xcb2OmZDLJWJSZ8xwLKIoqoHGaQiHR7mUe8e?=
 =?us-ascii?Q?ZIWyZuaaRelrFNSXrwzDw2nk0wfZnF+On4v59P+NftfUpmaK4J/HzRVzzNRH?=
 =?us-ascii?Q?hTke2ZWy05K18bAMwxdMQr/QfTT+1pWPZPVArcBo0ke9q6xx+0tfmxjY4ahC?=
 =?us-ascii?Q?Aa38MC13ys6nbNxSly4iNzwePS9f7t0cSWwfhXbSNKEeXMfPGKq/KEyG31ZX?=
 =?us-ascii?Q?gzmfSKYMr8EnAKSWrG8VlgU+k/kdhcqZYbaTxL4RDdMc6tLsoAw5+V+kQocc?=
 =?us-ascii?Q?P6spBt9gdx8Qbqfg3d/FFUm+y+hgulC0Bp50Tr/5BAiDfkjf0goHPJX14UHG?=
 =?us-ascii?Q?PhTTNr3iU89H5azxdoZOxrPNJFWsY3UJpkwP5KZ1nov4DNhq+sS7GB40bk/B?=
 =?us-ascii?Q?142j8P9XPHtF8ISolAofS++siZbZs/8jM9Kap2g5STTT7ag3FeBMnPIobKA2?=
 =?us-ascii?Q?bDyxfgpPyUmjx5DotniAPM07hw8wcc2WNIfU/mmD/wyT7YVDdkm/cEIwL/h0?=
 =?us-ascii?Q?Tu9823rbRo3XjTMp9Yqt24VN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5418d4dc-5974-4fb5-e8a2-08d9352f8a45
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 03:40:55.1317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2rBoyab1MfblG6wH17qyNGZZqk9NTWU6HEuxj/To3HktGUBgIenEXw2YcvUFBM8rr/sZOdY4btNXy3C0LOPQOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3913
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

i.MX8ULP is a new SoC with Ultra low power support, it has a Cortex-M33
core and two Cortex-A35 cores. We need to add new configuration because
it could not reuse the previous i.MX7/8 configuration.

i.MX8ULP M33 core is kicked by ROM, it is not under control of A35 core.
So need to mark the method is IMX_RPROC_NONE.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 7cc0cadea1cc..d88f76f5305e 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -172,6 +172,12 @@ static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
 	{ 0x40000000, 0x40000000, 0x80000000, 0 },
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx8ulp[] = {
+	{0x1FFC0000, 0x1FFC0000, 0xC0000, ATT_OWN},
+	{0x21000000, 0x21000000, 0x10000, ATT_OWN},
+	{0x80000000, 0x80000000, 0x60000000, 0}
+};
+
 static const struct imx_rproc_att imx_rproc_att_imx7ulp[] = {
 	{0x1FFD0000, 0x1FFD0000, 0x30000, ATT_OWN},
 	{0x20000000, 0x20000000, 0x10000, ATT_OWN},
@@ -246,6 +252,12 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 	.method		= IMX_RPROC_MMIO,
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8ulp = {
+	.att		= imx_rproc_att_imx8ulp,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8ulp),
+	.method		= IMX_RPROC_NONE,
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
 	.att		= imx_rproc_att_imx7ulp,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
@@ -824,6 +836,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx8mm-cm4", .data = &imx_rproc_cfg_imx8mq },
 	{ .compatible = "fsl,imx8mn-cm7", .data = &imx_rproc_cfg_imx8mn },
 	{ .compatible = "fsl,imx8mp-cm7", .data = &imx_rproc_cfg_imx8mn },
+	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
 	{},
 };
 MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
-- 
2.30.0

