Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7721BC433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 07:50:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D62022D71
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 07:50:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730671AbhASHty (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 19 Jan 2021 02:49:54 -0500
Received: from mail-eopbgr40080.outbound.protection.outlook.com ([40.107.4.80]:37961
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730703AbhASHs3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 Jan 2021 02:48:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=loAr89xrVGdeobDGsqqPGTj8gB3jScuGF40b2scN+JA+HNx3qG9ejEY3yumpG+7blr49sRJl09syUSgmzwkBcWg9vec+gndnq5DdUSVbWf0jwBGnmuLHrza17I0b5ZHmabDRImiSmyBbYzzEZkwj3HGbzcLIlBEfGkcb0GOM088wGBN486CBM8Hh52hDmZ4A1L9DOAfmpMtEAa4LLBOvtTFamDSXAfAU+LVeliiNHlDltpt6eZLJ5Yp1TJw2Vra12ZYvzNdwBvZfOS+0m9w71zZtUcGK65x5iwNLVGggPtyRwcB+Wy4QGG+GXm31jM/qWc8ZmcKqP3ymzSUeLCDoKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJxrdlT8+OTygEs/swp/bhTTRjULeT1DvjELEua7HdU=;
 b=Mv/OU+ryN27I1fmvL/nAf4HdgWsNG0WJs+mrYanKFwuzXnf+E2vpGvgnhfSHt+04YJyWDHajMsIDRj3tcdFhsPQqHOgWLmt9BavlAm+zxuNOfTDvSiofnf/wK2NjtnOze99PV0IiYYlUdzNjqNB3baPMTZw51902j9xUBhHz96DVFOz1btlAVNTy4qcV+shpAJTpe3M+6PhmzNf/Tgm4ngfoXgguORjazCt11HaFcdaqekt2P9Y3s82M5LLjYkB/Ge7CLRmXiOAqxGllj95tm1T2qjRTVU+kxrE7e64vypTw+Qn+MW9wp0t2839ExTubwnLqnYIxmMugm2Dm6EYs7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJxrdlT8+OTygEs/swp/bhTTRjULeT1DvjELEua7HdU=;
 b=UfOex8/4VGhqi4bjSN3xmNcMGENB6d1yDOA5p10pYhbg5X/A4JPkWsN1zL2HIhxIzLTD+J5+/yuU+7anmVSWpu7qEvTm2mcItoVXYfe31pTmeGh78dtctYfyokxB8GYpT3w7QY7xdUaPDeLv7yklGuLY0LLUoLyxgUZVSYUMjdc=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4492.eurprd04.prod.outlook.com (2603:10a6:5:39::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Tue, 19 Jan
 2021 07:46:04 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 07:46:04 +0000
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
Subject: [PATCH V8 05/10] remoteproc: imx_rproc: correct err message
Date:   Tue, 19 Jan 2021 15:35:06 +0800
Message-Id: <1611041711-15902-6-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611041711-15902-1-git-send-email-peng.fan@nxp.com>
References: <1611041711-15902-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3763.9 via Frontend Transport; Tue, 19 Jan 2021 07:45:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: af49b0d0-fd32-47da-f646-08d8bc4e4621
X-MS-TrafficTypeDiagnostic: DB7PR04MB4492:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB44920B1F803058660F536FAA88A30@DB7PR04MB4492.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aVyddXkt2wi2qjxrPG3O8Acn7Lq6KCUWB/9sAvEZJlItZb0hgHOf2Bb8y3HlY24FvfLY1KtXueTRjju7QZzZR1JfhovpkJh4OcLMTDM8qAzOUVXABe1fbXWXM86qxjf3aGRE3bNuk8I+0pOHiJ/xrh/SCtdUKvWBTUnOD0DQtL5NrdLWSflutfVFukPoDfjHrRufs482cj190vTMzMDz4VddtVlC3jzke2s35p8E4w7D3txeaG5EjV+pM8uB1fyBCWNLdeJHt/vZRp67lcE7rvt4Vw811TOZBDFErYKw4nEFzv2Q0OO9BgYXRK5h03h6/kP0K2cTaSarA5w5sykAIdgpzztFVbLOpKqTOFutvIj1ER0kM3+os00Ay56v8ZvXc525/24aDgjBOdkQDDwsAU2FRkrnRIOdekFGCdrWWrkd3EYsXrjXnlLHQ6azA2Y/Mxo/QXctbwt+AenDFJtL5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(2906002)(66476007)(26005)(69590400011)(4326008)(15650500001)(6666004)(66946007)(186003)(83380400001)(6486002)(6512007)(2616005)(86362001)(36756003)(52116002)(8676002)(6506007)(498600001)(7416002)(9686003)(16526019)(8936002)(66556008)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OArc/0CIHLsBEFJZDSzNRRgueviS/BCBsn4esCAObp2cyhRcpKcQfsS01MLP?=
 =?us-ascii?Q?PqXjpQDnhjwq+qkWaxMBzcWq3jqS2rbEoWn4MtIY2MBHrruWHr6n+7VDGiUg?=
 =?us-ascii?Q?DRQQi9tVcX2kG3KPxbwaDnWf09B34MYb0JsAjjk4mACaNW80LBslOzypDAH1?=
 =?us-ascii?Q?GUs3qVyqRWnLfwhIytiOHXemzA6hHtFSbI1kfwyzJ/RyyaStJYXDBCZGCr8U?=
 =?us-ascii?Q?rgCoouaRaMrXnjNsL3EoqoqNr01Rnh0Hn7W0CZteDRIjLvioD/cBsTRon9II?=
 =?us-ascii?Q?a0JSsNafRBljdw5FD9MhW0Rlaouaoslw1lVXO83yAAclKSd+Y3N75Xpm8+rM?=
 =?us-ascii?Q?2xGq5Ju1cKsvYHVcI0n+rg6JZFPZiib+sL7/osEVhSEUQr1nUBFfJ7Q7KzrY?=
 =?us-ascii?Q?XAYBEjf6GPCtLZv41bXu1u7/6Pnn/LfojkECnn66V5Ganrp2gLKFBZOXeqen?=
 =?us-ascii?Q?PiTrEFCBmwNCtC6jGGmJXkhQnIzMi84g/j20suYmPmnW2AtLtY4sLVt309hm?=
 =?us-ascii?Q?NmoAgcLJFdrep7TnwpebnqwiL1kP86bT/Vmy7Wnvff52SxPaIhoneKRGiuzN?=
 =?us-ascii?Q?cDk4Q+VnmKWigm88fj8N7M78vr2cpwOUG5aSM5c1ipOoeIV+J5HiKebkedVt?=
 =?us-ascii?Q?UDHissctRByESs73pG4hMzg0bAMh+hJXiBULLC0cdhA/62HM3v6KJQEgMV/e?=
 =?us-ascii?Q?uFFZonkzNXa5ij2cxJSHe0f5alphPVaWDbNlDf8iXaShGIQxTa9lBO9Z2FC1?=
 =?us-ascii?Q?Y1EQFvd9bvWJ6XmeaJUT2wI1AWdsXgs1ZdXdZivb6YKnao174JOE2sebwz+j?=
 =?us-ascii?Q?iVG6t0FRo+a+JSHygkbsMrhHyC3BAFE3p413XnG0enT0qZNhNXUXYQiRjYSR?=
 =?us-ascii?Q?JHOO2AEg01POCmub/LtDdw4qMdEN/jnBZVDKAXMqF8MPHBVnWLoftfyR4+rY?=
 =?us-ascii?Q?Qw2FNU007jsqahS1GSdEkCpN1W5S+ieFnST56w7+wDpGRINxHm0QyzOCMNno?=
 =?us-ascii?Q?thP0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af49b0d0-fd32-47da-f646-08d8bc4e4621
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 07:46:04.6055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uok1tZiEN26MK0+uuKuV1Mmw2DZ1I8Y1BDQWLbaCrFPkZkKkCv3iUlI4Y6QcptSqcoBkY2HRFu4aQb7/Ba8tqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4492
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

It is using devm_ioremap, so not devm_ioremap_resource. Correct
the error message and print out sa/size.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 6603e00bb6f4..2a093cea4997 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -268,7 +268,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
 						     att->sa, att->size);
 		if (!priv->mem[b].cpu_addr) {
-			dev_err(dev, "devm_ioremap_resource failed\n");
+			dev_err(dev, "failed to remap %#x bytes from %#x\n", att->size, att->sa);
 			return -ENOMEM;
 		}
 		priv->mem[b].sys_addr = att->sa;
@@ -298,7 +298,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 
 		priv->mem[b].cpu_addr = devm_ioremap_resource(&pdev->dev, &res);
 		if (IS_ERR(priv->mem[b].cpu_addr)) {
-			dev_err(dev, "devm_ioremap_resource failed\n");
+			dev_err(dev, "failed to remap %pr\n", &res);
 			err = PTR_ERR(priv->mem[b].cpu_addr);
 			return err;
 		}
-- 
2.28.0

