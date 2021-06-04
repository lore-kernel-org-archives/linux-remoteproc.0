Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64525C47241
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Jun 2021 06:50:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A2B86141C
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Jun 2021 06:50:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbhFDGwJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Jun 2021 02:52:09 -0400
Received: from mail-am6eur05on2079.outbound.protection.outlook.com ([40.107.22.79]:62689
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230224AbhFDGwH (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Jun 2021 02:52:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MEhXja9QaFGQ0K3pAalOtZTiHLL+Rh5FhVnyv5XoLPaJVgWfM0UMppTw1l3FXGiPXHfUqJm//0RqmVXgruM7bgBjjqqRp9ijjCygNogKqjPF+mFQjeq8sy/01kWWKLbdkpu5WmFaofHZZJ5MrCcwTbdBFlhAwrjb77clqrC7bBLg+qUxJDaNRMjaPnxk85oAj57mvsTdYxJ7XdMDz7nYawHlCFh0mAdAAaVebIm5xhEdvO0uOnw1QwMyTmNBdLMKHq1wUM9IAS3e1KE/LWjCq3vzVttoX5kVLAXW6+XFyhcW7Nuuixvcd9JR7KhmILQ2NqHje28VSW0D6bbGQHihkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEKOZLHZ62DZd/JZLJ96VlheXNvaHfdbaKMuKh8DhU4=;
 b=KEKpzO6XRmdn0+ZMpbBHeMjpqVX3mV6uapGCgDevg+P/seYpX4tANe1O64YBK+bkMiytZvVQMj+MQpfISM8jdj6b6F8WSQqSLmhF+0as3/qtgYoQ9cZoug6eZtlMXWq2Hw8Z88Nxz9p88aEmQpACmPJWtLYkBlTG+gOJrkkA2txXJHBew1KWDqJEDjh6qfoIaQHOFrv7PJHHm/vXCVlPPhEztZpXRSJc7+P8irAVsmNRDzoIq8leSwbXs1FDsL9fCu7//e+KDBQhBadwSO59rPpRJttTDJqg43RSHWyNnKlvUyuDplLcNTDj3qR/5Cl9Xu/JzERPMKgnysQfuOkX1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEKOZLHZ62DZd/JZLJ96VlheXNvaHfdbaKMuKh8DhU4=;
 b=POEMLmuZJrAjegZj856ddd3QH9oauLR/W77Dqntu6ylnMlM1a4kuMU7zEgKk51A3eRB0AWFLpWxGaXAIUdyDwydlusdRvOIOpcnn2eai0hDzT3FZjbBXL+zAAu+LGRGtCOkb01R47taOCtyagxXrBNTKBul8Tta79HaSsvatIr4=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4236.eurprd04.prod.outlook.com (2603:10a6:5:27::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 06:50:19 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 06:50:19 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 2/2] remoteproc: imx_rproc: support i.MX8ULP
Date:   Fri,  4 Jun 2021 15:23:11 +0800
Message-Id: <20210604072311.9186-3-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210604072311.9186-1-peng.fan@oss.nxp.com>
References: <20210604072311.9186-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:3:17::24) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR02CA0012.apcprd02.prod.outlook.com (2603:1096:3:17::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21 via Frontend Transport; Fri, 4 Jun 2021 06:50:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adcf2acd-b8e4-403f-1dd8-08d9272504ab
X-MS-TrafficTypeDiagnostic: DB7PR04MB4236:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4236542897675FA69E5A9000C93B9@DB7PR04MB4236.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6rWXAbCxjEQfYehcQcMxSZ+bSM5iiMcoPJxOVcA3sv0QdA/UBfAtpbJfCapU22W+F7wWB2tFHanEId+b1fHzMp6Gtw26JattvSCVwE0+9nNV28BMWs7RfYegAGjadZlysO+77WgLRJiNeSFzByOXZvV1WRY3pDZKUO/MqtGsgs4sFFNFHd7AODm/UtdfuqGZa37t88FJyzciFJBHIUu/KbkEKSH6p+0Q+5bOqccO4t3eCVVVyVBNxXBHvzSktNAa3xcWzaQZR2eHnLlP/tehWyqARCGC2QS982lchoM3e34Ek1PBZ9UAS1NEL1WW6C0OHss2mJLkFyRfOPwNlkwfufQr77v22tn8WTvMGhF+EGGe0UPkogBIkG5GJfv2w1FgMjVF67rB2/kDxFsCuwYnEAgCUO1gIJRP1puZob++q0d8xF3M4R8/07EyObzVp8pIq7CoPdM1Fg78JNlV8l+b52AH5CNnh5E8nJmdWkuiOlI0UvE1RWiaP5En/w8MkDGs/k4TlKMEACCmcQSu5lVcTJR/2gR0SoxqXfwbQpCTz5IERsFyAbsaNGW/zgo2MHY31FgFQ0K8xrJtV89dslJBUzFXhn1yhFLnAmXkojJjXq4Sgaujd5aZevzLDWt6a2KSfy8HW2YCBNfDkH/chVu6tIRzIuVZWU0c8Rjo9wbAc+s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(6486002)(6512007)(6666004)(8936002)(66556008)(5660300002)(66476007)(66946007)(8676002)(956004)(316002)(478600001)(38100700002)(38350700002)(52116002)(7416002)(4326008)(2906002)(186003)(16526019)(6506007)(86362001)(26005)(2616005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?nX96RxA+dSJReza2CXENJjH388pu4eLvioUhihc1PhwA1axACR8qweX6L0O8?=
 =?us-ascii?Q?818COm8XGSlLTBhOt5pfcf1AeNoyG44IhOFcOJ9bpEVDTotpbsd92130adMy?=
 =?us-ascii?Q?i+eaxn3F+RyLLtH76coIgtTIfShowb4v3H9zkC8DQgP6TkjPJgShaOGUSdQ/?=
 =?us-ascii?Q?GINsNPjA96qA7lIJqDIHZ+K4FadOBKRQfj9N06dXZrEk8Zshz+3WbwC5Nb6b?=
 =?us-ascii?Q?7G9LSGG+CZ1vM5LQElOoBsx2fTvuRvLlth4yKYEl1mVlTUVP420FSgR5MWyv?=
 =?us-ascii?Q?t2zTYAAtPyWqn3cAs6aZEpz9Ai+0Udg41WTngFvmAqH6IAXxCkM0ORcw01Px?=
 =?us-ascii?Q?ZC0/R/0od7Me1GP/8YbEKqQxC1z2wLTq04Cdm21VAwue0DlBgQSwVcu4dtiy?=
 =?us-ascii?Q?zoS+jmR3miMsQfYjWNq6QBKWhS/KmvtF6IxpTvb26fHRqNaAxas+wp052B80?=
 =?us-ascii?Q?PNjGXizFFHkV+DZ9WZD8AyVk9q7AtzYHcPhX6r1+AhkajXAvoC4hGS5WoCfZ?=
 =?us-ascii?Q?QJSyd2zTgH8EzWxQvZUHQsUJA1J6SjWGEheNm45zT9A05T3rt6IXBvr5JaZT?=
 =?us-ascii?Q?QwiqevbjR8haFvmPQRmljk9bqkvYTWJt3G5ppWHrCY5z/BNOcVCTRKW7f91+?=
 =?us-ascii?Q?Gs/FRP2qhmvKomcz8FB3CxxCQpjrAsAz6VtUGhx/9cvLiuQ0bIJvRhJrVxVm?=
 =?us-ascii?Q?zRrR0dA2NLIMGK2LJ91uS8X6iOCsMaxezq9qEOGHJVq5xWvl5WhLDnc2J06Z?=
 =?us-ascii?Q?3ebdgwBM/zUsxu3qi1AmJegqPkOCzi6Ovd4C+CrGaVRpR/VIKtI52yq3nMox?=
 =?us-ascii?Q?qagGogC62EzGTAoMayEPID7yW373J1Rnu+H3HP3ckQWq1gOR1pLaNmdyFGfp?=
 =?us-ascii?Q?S9R/VpIZdite/drHdUPNtGhyawMRhy/EJYYAS6wv93g2t5QWoq63MUScVJP/?=
 =?us-ascii?Q?qAZd+sdAGh+uTyXSVCk1OfBCSpOipXeE+Gn5BM6gWY4LYPj3C89dRcixdDnP?=
 =?us-ascii?Q?oSM31Ae+LUKcXujPE/ujdizFgmkYH+YTUUcOMRyyxS04+ye3Tg5+5Tk5Jneh?=
 =?us-ascii?Q?14mp1XDGFSYKMwQGUOg25mftHeLTQVHgTDs63NXc39v6CkXllt51wWa6TcJ5?=
 =?us-ascii?Q?/67E6xJWnBc/k/SSpxG0lz5KGFIYQ+8sPcd966eAf+ERXL2X6NJKZFVTRxK6?=
 =?us-ascii?Q?fVmTFoO9nyTF4NHBzsMucaDKIXhKM/zkKaNNSBgQpOHhNnO2V02wIieZU/E8?=
 =?us-ascii?Q?FFfh8LqR5OdFitk7PGfEOG27a0DnfyuSQ7OmCy8IM4CNWxzIO/hSfZ1InDEb?=
 =?us-ascii?Q?JfQBioCDnIBNJXTAd0sWkUNw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adcf2acd-b8e4-403f-1dd8-08d9272504ab
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 06:50:19.7441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xynzQOc/wxrZFwmi0ewPNlRKrwhq0KUbLBZGFyJnS57WdyrGax7Kdu0DoGzUOW74lOX1/7lCnCS/3YRdro7OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4236
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

