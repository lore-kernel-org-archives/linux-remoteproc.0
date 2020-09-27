Return-Path: <SRS0=lozc=DE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B0CC4346E
	for <linux-remoteproc@archiver.kernel.org>; Sun, 27 Sep 2020 06:15:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16679221E5
	for <linux-remoteproc@archiver.kernel.org>; Sun, 27 Sep 2020 06:15:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="iyod7ab3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730388AbgI0GP4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 27 Sep 2020 02:15:56 -0400
Received: from mail-eopbgr30056.outbound.protection.outlook.com ([40.107.3.56]:25733
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730355AbgI0GPy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 27 Sep 2020 02:15:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvCSNgS+4TdMu3nMwBpmg0TRLre6gK6RKOn0uvBY2PSy5naZfeH/Ldzj0rSIxUwnZ+5lITWxu7H4DdxzNfdiDb2uMmsmCcZwR9co45r5NzW/0Cv3PRSdErSvrg/EauxxR1FloUiA2A0izL9ZiWsy5aqLtavBb/yM8tRyGw4cY0NruViQyD1GTq+V4cF7kbYDKoWJG0i5YNLbC363Zq/2rb0n8BmNhg4GkjDGnE3Jfd8LnLWTs8OLkMjpYWFtNaCbwsNmK4cXuGvRwH3EcwXK1TlUYgoHxMPjOEUANGg59tdqGybaVtXSPLeJytZBnXBE8oxuoAF+TpH2UtwECzMp5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLHy9TdHMuar6HQLEmP4ngP5zCUv1sC2Ykb5EK17H7c=;
 b=LkgPZcnR7WJhq51IgAwmpGS9T6Q4/Q4/1yp0AxuMAFAjuvrR25ShtjGa1jbKgp8O9WJJ5Rft1+nPXI33naieIf+6s2yasTVdtA+HC5xbtYkq7zBO3i4OQ5O47/DLTzH5BRk7xEU3/0ivv1qsoU7CdfCXYJLTdWRUn8sPlRIvm8TAC4Wm0/7H0TrxTN6bNjCPZ1phqi2o+MsLuVoy/osIlW2kYQEGpI0chKhNTKjBD1yahTn6ML/HcZdFDcIlSEJ2lnMLhSW7wHp6gMCui1gFjQZnzb8A6TpZ11VY4s0payOdUOu+ApCxZbpFH8IXZibtdAuWl2m7fUyo59ypDk3uQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLHy9TdHMuar6HQLEmP4ngP5zCUv1sC2Ykb5EK17H7c=;
 b=iyod7ab3pRtQtF+K8smWxvY1Or2GSD0g2CGb3qhPwt0DF4NDZse82HPO1Dzr+AsSAJf7S3oCPeC6RBo+s6qJSDARlV7id1RXaQhow5jE7J6O6iJ5GdzuOGQgigSkMk1K0DU0QPxGujP+uU+xk1SSgbVwaxHGeNJlLILYv03VZWk=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Sun, 27 Sep
 2020 06:15:50 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3412.028; Sun, 27 Sep
 2020 06:15:50 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH V2 6/7] remoteproc: imx_rproc: support i.MX8MQ/M
Date:   Sun, 27 Sep 2020 14:41:30 +0800
Message-Id: <20200927064131.24101-7-peng.fan@nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200927064131.24101-1-peng.fan@nxp.com>
References: <20200927064131.24101-1-peng.fan@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0178.apcprd04.prod.outlook.com
 (2603:1096:4:14::16) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR04CA0178.apcprd04.prod.outlook.com (2603:1096:4:14::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Sun, 27 Sep 2020 06:15:46 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6a179988-a961-4541-67b0-08d862acc80d
X-MS-TrafficTypeDiagnostic: DB7PR04MB4633:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB46330417F43814E47DC6D37C88340@DB7PR04MB4633.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:61;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ysNuyvYLI/m8GJHKBxL53FehO9g/BWkOhuPxMJ0EYvUV2YPn3AYV63SxnP+haES+a+4qu/gAekf9qIPE8uSX/vlMouuDJd8xaoKsoMaKpVcbGbDzstbkvAsyj39SFmI+p98b7/5TmErNpQoatmmzuex34wHQTmNvYBqdM6ITEFbuYv5R5HeIHxaovbuQtIj5kItIHgKivTsAZdoNZyIDD23z2U38pStKS3vFqcumVryFQqKrWWiPCyjhQHDF+ICwZU/Ot3omOpQ++NrFnXfz4rsW7t1h05CDxICEwo9jbfuP+aoBcX/YGRv+bV/NHOD+qjDZ/eVyHPMxIhfz4BZfKCngF9FE0Wo6v7UG6FLTw8NWOW5ZwZIlze5b0MYhK4A4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(16526019)(186003)(52116002)(7416002)(6666004)(6486002)(54906003)(316002)(36756003)(1076003)(44832011)(5660300002)(4326008)(8676002)(2906002)(86362001)(26005)(956004)(478600001)(8936002)(66946007)(6506007)(6512007)(2616005)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: BjqbWIC5ljyL/NGxEc+yrQ+T66gYTLCiRdsiByp1PQvO9iN2g6mtxxCuiZtkfmSU3Y835yCm4HQILhfl0HDjjWq6O3JIWvhFkYtE8hVaDHIy93KURDI/jxxFNOtKKbbZcxKRqgEG77ztG9kJ0dEAqpxkwZ5aOmeCltvVE8Cmm78SGYRCjvng9dIl8uhS2MgVDBaZA7BmdaNGCNMYy0iLx8kZgUUjYGOFgdkR2aVtkvBiggeAMexNlrRapl50GKx37CJr7OXXY0XVX2ai6KgTjThiFjpGlWg9RWgpltYJg5SqSbKlo/l1JfsvyQeRcGmxngOsWDXaboh+dLzncx484f/lnPdeQ2c6jxkztTKnek49bgBvyU7cmgTw4TJMiHDQOE1FlnMHmPg5R4m2t+FJUn9guf1DKmkOBBS+gs0bf6yr8dEsZkjBbuVcSRY1FKloqWyApXX0HCyqo9Yysp6HqM6RU8vDJ3wll9MiKliYnYVDF7sJHip2ZmTiIaBBmJR/aeE9n0m0jfMgcfRBgMAAsfF140BsJi0pB+RjcPRL3i2uMfAbnRz2uQizNrdidjkzZGPu8z3c1xmALgjSXnbN5nkZxlvANwJrMM/OE2lKPmv5JlSKxXKmk1tXKtFUTDNyAF8f7VJQXNVdnzJN3eUJWw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a179988-a961-4541-67b0-08d862acc80d
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2020 06:15:50.5302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6enlH1+MR2uapp0qE+5Vc2rlzidQ1xfbuPmpOJv1q7atsWLIE6w+DcQ92lC5aC5Jr5Xnttv/GcVp/2dIoVYDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add i.MX8MQ dev/sys addr map and configuration data structure
i.MX8MM share i.MX8MQ settings.

Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 40 ++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index bd3a42892b22..0f69f3f745ab 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -90,6 +90,34 @@ struct imx_rproc {
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
@@ -140,6 +168,16 @@ static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
 	{ 0x80000000, 0x80000000, 0x60000000, 0 },
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
+	.src_reg	= IMX7D_SRC_SCR,
+	.src_mask	= IMX7D_M4_RST_MASK,
+	.src_start	= IMX7D_M4_START,
+	.src_stop	= IMX7D_M4_STOP,
+	.att		= imx_rproc_att_imx8mq,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
+	.elf_mem_hook	= true,
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
 	.src_reg	= IMX7D_SRC_SCR,
 	.src_mask	= IMX7D_M4_RST_MASK,
@@ -517,6 +555,8 @@ static int imx_rproc_remove(struct platform_device *pdev)
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

