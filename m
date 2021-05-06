Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D37FC433B4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 04:25:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60C5B6121F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 04:25:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232853AbhEFE0b (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 6 May 2021 00:26:31 -0400
Received: from mail-db8eur05on2055.outbound.protection.outlook.com ([40.107.20.55]:21472
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232884AbhEFE0T (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 6 May 2021 00:26:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lX2/lXybXv8u1aNoABehfmy8FuLY5eZR9h/qU/J10o313onL1hp3xHE9NNtcksVNJBOEPvJcq+ieNKZWaMsCe8howEkXmvtU6PXSbC/tjh3Z421K7XZ7cAsiwDbNxUBZrfbF+gpLJ5Q8r7ij46T0BAmGKJKuhB0fFqM0hU0j+ExURxJFdDAcUkmmRADAGi1XEailCtvpDjMa5VG8kobW2EzdN+WZvebV6wFb1av+bgW2dwBjGnvzqjT42qFzZtzBwRKzFFU09DjamUhC1IXYsDtV/EMZeJlFGEj8wB22kUbKqvmnO7hdhagHs4AuBIOLxPug9hMMIovUftD1MTcyaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzymBpZ5Ej2sizLxQ5Gkw5D8Y97LziPProGsnKRR5vQ=;
 b=Gu600ZCMuUeF3WLRa78qOzTHGskiS+bQv1EPOqFemyqQCv0c0YCErPOadhuJYiLJcyERip3Uy7CfV8scm/2Tyv5IS9uikejwNU6Zyd0249PtdOTerqrDgTJro8BY/gTxxNLuopfNA6yExrwb29thDGQTJODmEMkddOFDgCyDADsWH12dlYM6DHtMe1eHUaSgJCEoIAecraxAQNLz9L4aMCWurctQ/37tn627mY0DJoFoVmOl3pGsVnvuM7l8Ik8Sk6U5yWO2ZWfdV7JI88wEzgjDm0/Nhqr2loGAoU9wGM1OMOwyeF25nkSFUwtAjRVBc7bBzQT/CzeXmNdm6OxmWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzymBpZ5Ej2sizLxQ5Gkw5D8Y97LziPProGsnKRR5vQ=;
 b=gRT3qy3fzHH+7mhNVBs1PwdV7ZxHP9T0FZQRLCH9/iE74n8wDPDtsKzLCjIk9p51f6XEJ/S0xUUE7hH9Q2WfA1o4teWrSiWr2lXbu9E0qPUWpJsaKIfM7+7QxXv0N1oA2QCKe7fX51VEw0Xdr37yTBda3dlmW7yFeqaUhz2Ap4o=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR04MB3126.eurprd04.prod.outlook.com (2603:10a6:6:7::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20; Thu, 6 May 2021 04:25:19 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4065.039; Thu, 6 May 2021
 04:25:19 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V6 6/8] remoteproc: imx_rproc: make clk optional
Date:   Thu,  6 May 2021 12:08:41 +0800
Message-Id: <1620274123-1461-7-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620274123-1461-1-git-send-email-peng.fan@oss.nxp.com>
References: <1620274123-1461-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:54::19) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0055.apcprd02.prod.outlook.com (2603:1096:4:54::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 04:25:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96c93367-2e63-4862-9b83-08d91046f4ff
X-MS-TrafficTypeDiagnostic: DB6PR04MB3126:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB3126CE91C9570CFB947AE0A0C9589@DB6PR04MB3126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W1MFy0m5hUDnPzOmbOBKvehit8kKt9T2aJ9Hy30AMJrUyuCGzYN4LeJ5pzYOy3seTPskLCuuqpD3FjGFS8SGOb/WDucHDt7JmqqfwsZmsZEyNudgzjcs6UfWMFS2cMID1CIpaPPzURwWGf5wselwtusEQ0FqJ3de4l7KbL1FRBLOso8k8SxJqV8JZmTgeHrz1xemVem7loZW8x90nTX5rFO7xD+PgqC5Q2t92oUOhscaTnfDfM9dpEyp28d/jVnx9dDBX1glV/jJUgfueBIq4ftKB94lvxM5QmUI+hb5kwPdDyxkAbPyd9l416PtV1q7kqx2z3VGZOIMEaZLOjdU67atc4plqCDmzPsZJvuLyGbptMAwmUW+AJO1qXwSGJwa1y/5z+6CSMVVwjIngIL9OEUUt0pO2KIIgSaMNhvdao4lwS4UhyD4/rbNQyB5y+h0jE0tPLdLy75JgVPcz2frlEHnG8h3bzGPoYeyd/y4YYfjRAg7cQDH9qWS6TdSFRwFVmjZyd/J7u0WH8aoS0BXfFPDY+Wek7Iip74QZeeRAPAQiIw+BL1UXdPXhNKmb3r/NFH5KneT05iH/VnYYQ4Ov6O8XAY34VF6a1tJSlfdVEIwciXsEkh9QPQ7ji+Yv7xpMAdLJGIJRyKCon/doMwh/zzP13bAN2qyW5Y5ncaelY9wA3aiwNb855VcoVj8AnxP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(136003)(396003)(376002)(346002)(26005)(38350700002)(52116002)(9686003)(2906002)(66946007)(6486002)(8676002)(6506007)(16526019)(7416002)(5660300002)(6512007)(38100700002)(186003)(478600001)(2616005)(316002)(6666004)(86362001)(66476007)(66556008)(956004)(8936002)(83380400001)(4326008)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RJrXoQNgej3Zzk2x4ncw7nDkMEidCNY050JmKWmCRA6rSmcGYGULH87FT8pv?=
 =?us-ascii?Q?mNzZXl0pI6srasMt8iwt/NZGvamvEjcarbJW2WJJrjRReHxwiIi3mrSoq9Dm?=
 =?us-ascii?Q?fdmxMzQIj16BdKMCAvkxWZOUNvVk9Ks9M6R0pa6mIu/gHG3kbWZYGZ9OFexn?=
 =?us-ascii?Q?RKJaifjuM3nyljkXKZA7KHOM71ObRm0xF4r7aDMixPb/EKPbReWsbc9tWXaF?=
 =?us-ascii?Q?zdbiReIoVmoAI5ibkraW4xKCRznOyyxu9OjG5MmfJYHQh+/i92taOvw+nEGc?=
 =?us-ascii?Q?PNnGTJCsHdq+tayyY0Snq5Kf5kUwdmlG500q+xQspxwBbF752ntCcpIgw6Aw?=
 =?us-ascii?Q?Hbw7oKeKnlORMHHvSHyDciMcvoAzECy8xXlE6zuZ0TkG3npPLz3DDKHi8Gge?=
 =?us-ascii?Q?UzVYXy3YrhtQyR1+an/vLQX5G2kgLxC9OyZZ1rSIjqUd/NKTnuiRCD3asc57?=
 =?us-ascii?Q?7Q0jsXF0PoUUVph11Zoc4tbRDr/0YpIZ7QJmPK0JL+3mW3FXcupk9AOFp2vl?=
 =?us-ascii?Q?b13VDdxPhou4KJz+gVzvQ+GcHZhpJM0t+ThpmHYwCUHgb2S2gEv6XlzgPzus?=
 =?us-ascii?Q?DxXyT1XiTz8ZrIgO4sJ2xq9rEtZZYwhPHPMxvWPHMoMrvWrdjOxRZXE2oJ3t?=
 =?us-ascii?Q?h2uojE17Z+tJO58T6u3IKatwXSNAX5pW8CZau+TuffKO5p7INzJDZycjDuSS?=
 =?us-ascii?Q?w8mJ4vYH0wfjNzuxR2xv4TiNXLZGoDC++1kN1LEu0DRyCUKgs9gi57Z4NvJg?=
 =?us-ascii?Q?ACPlYTqBjxOWUiTuViQ8Ls06edi/cP/Rbas8cSxD0mVB/lQ20X+H1C3llD17?=
 =?us-ascii?Q?XWkLhGy+h+lTuGB4aZvQSMtdjdlrUoOYmv9m+lwZesqCWz84vxr4T5oHGed8?=
 =?us-ascii?Q?5y7xKx+bjue+76KVUFHH3HMD6NSKtSAsgO2qStCS5kxBUqJODCqbD9fK9+Zh?=
 =?us-ascii?Q?ZwASwFhViEp4XHwq6Ve0HjH3Ru7/IsHEAWMYjf+FOYmUrQDYPTycuAi3c7rt?=
 =?us-ascii?Q?KkffCoese6s5+QlGquwdBLkK7t66G31JjWEKVF4UcL4o1FgM44TBArQTJ/ko?=
 =?us-ascii?Q?eMg6HGIU+qU7E70mxqEiBbV1Mu9XulVKO8boTE2TvEpJsXZZvscJ8H/CXxV3?=
 =?us-ascii?Q?r3vADN2xfL+FCBADoJUTcuIRTEjuSuyaleH7dRK1Nx50I0zspQW4FmlDTV7n?=
 =?us-ascii?Q?JW/hsSD6/DTuU8vIVFNXU5Pvbd8/1bDTDAkkgJnTXzY5CoJPvc8oXAySsFd4?=
 =?us-ascii?Q?ZG70YeWuHJm5Hf1y/5LflwcSkFWMmHhdRmTo6EDVGPPe/Bt6imKPxNvXjWQD?=
 =?us-ascii?Q?rT6C/HJYX22v7ECh7KsU0MYC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c93367-2e63-4862-9b83-08d91046f4ff
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 04:25:19.5862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9GFDZ0iwao7cKCr7Z/savb44s0oKlPuElh4A9RMzKwaExHnVYy0Iwd0k4vKgUhyokSD3YfmqN54RY7dUfBOig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3126
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

To i.MX7ULP, M4 is the master to control everything, no need to provide
clk from Linux side. So make clk optional when method is IMX_RPROC_NONE.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/imx_rproc.c | 46 +++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 15 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 6289aeae95b6..e9d9860e4fce 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -590,6 +590,35 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	return 0;
 }
 
+static int imx_rproc_clk_enable(struct imx_rproc *priv)
+{
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct device *dev = priv->dev;
+	int ret;
+
+	/* Remote core is not under control of Linux */
+	if (dcfg->method == IMX_RPROC_NONE)
+		return 0;
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "Failed to get clock\n");
+		return PTR_ERR(priv->clk);
+	}
+
+	/*
+	 * clk for M4 block including memory. Should be
+	 * enabled before .start for FW transfer.
+	 */
+	ret = clk_prepare_enable(priv->clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable clock\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -648,22 +677,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_put_mbox;
 
-	priv->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "Failed to get clock\n");
-		ret = PTR_ERR(priv->clk);
-		goto err_put_mbox;
-	}
-
-	/*
-	 * clk for M4 block including memory. Should be
-	 * enabled before .start for FW transfer.
-	 */
-	ret = clk_prepare_enable(priv->clk);
-	if (ret) {
-		dev_err(&rproc->dev, "Failed to enable clock\n");
+	ret = imx_rproc_clk_enable(priv);
+	if (ret)
 		goto err_put_mbox;
-	}
 
 	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
 
-- 
2.30.0

