Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A2BC433B4
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Apr 2021 13:43:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF292611F1
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Apr 2021 13:43:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233282AbhDONnm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 15 Apr 2021 09:43:42 -0400
Received: from mail-vi1eur05on2042.outbound.protection.outlook.com ([40.107.21.42]:9729
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233298AbhDONnj (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Apr 2021 09:43:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OBKeH1T/dghjRklmp9XTUaO4aA3hVwRQ/ibxqmMQuXklxhcO8NborD3Xm6ehB8c5pBnmv6k/d7tt9Q6eVxO6F4Lf4I1TkZyvb13R910sPXVk1uxtFFfngu/dvzIMAIfET7v9sCDSjgR1FiAPJ5oCcbfkHsTm37YVHjfmC7w9kFdowCEPUu3cLFAdmqBN2k77b6A0PuWx29PBIRJUYJBBgI4RGQCXcEM8UlJ7gAvrdrg3CCg+cu7KxyJ6Z5NTGAC84ZRnwoRJsjNmGuK1anWSfi72TDqJdrpCzJ5tWEzys/dWJOPF/r0nL3cr3GzFngfHl9yIbspBzHMgpEYdx1T8wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9a9IkhZQWfG30t2JfSSnxQ8byXfDi0nXCR9nkiWhHk0=;
 b=dQRaCTGyg2ZofeZuZdfRGBP6ThdOJSbB+4dp5EEvc0gGS63xJXjEqbGG5Zb8wmBKY4cfGDs7JQWAiQHjXSL/1mbxhgKD01KZfNnyDg4H3DAsXm7cSdkrrRxOZPmURI7M6RaISgcCS4YTVA4SblEB1OQN2iKWV+hHpMNG0E6qu4G6vT2lK7Q8ByW1tvl8dFSNqeP5abzHgTmPri9ArUbWziK+KCq6F0AZ49Ib2rNTu4lPs4pI/u/xYEe2Jbdx0V1jbO2FhBAAq81OGrT2fnbxx8wnHEz+u64LQTLc4VQuTDkIv7bXIA3eSBk286uFT2PR4Tbc2Yyq6d7RSY6rGvMk3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9a9IkhZQWfG30t2JfSSnxQ8byXfDi0nXCR9nkiWhHk0=;
 b=hdRDNp+PL4ZGGnuVIF7+Js1dVLSTfVw7+dmrsaA1qircaRBE54lOhDkCTnx8zKnOQQ+MzLH7dCqnY8zae/6lf1kAOsHbwUmLkJiD2SI8vkMceVkwJj0P21Ury4VdTn0lqz0jL7abTZcSjIAEzHlNBDWC+kfLrrmV/QnSrlOj5E0=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0401MB2534.eurprd04.prod.outlook.com (2603:10a6:4:3c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 13:43:13 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.037; Thu, 15 Apr
 2021 13:43:12 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V4 6/8] remoteproc: imx_rproc: make clk optional
Date:   Thu, 15 Apr 2021 21:27:39 +0800
Message-Id: <1618493261-32606-7-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618493261-32606-1-git-send-email-peng.fan@oss.nxp.com>
References: <1618493261-32606-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0132.apcprd02.prod.outlook.com
 (2603:1096:202:16::16) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0132.apcprd02.prod.outlook.com (2603:1096:202:16::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 13:43:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5572abb-f559-450a-b8a0-08d9001469f6
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2534:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0401MB2534E5C13A24FD9212F1D81CC94D9@DB6PR0401MB2534.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O2eTsJomCy4nlKarPCvf7rH9OYWLTp7EiV6zrrsF2UdP4TQ+tezifOf9vmoYytC3/ch/txtvWPgE9Uw1sL6+cl3pNFFx3hG8ImMYZnXuf5yREcDTVh+Bzsdf5ILiAD3mILiKnE8liB5DCV5vUaZySMazE9sYzIf2DflhuNIZkyx+PKjsKvU4AOpExVPnNwgYbwnJWq82Wk6z/YuRJw5Z00LEKK5GGq8Ppk9ZlurxNQZT8GWbaK2F+beeTdTVvMNWL8WZOYCOsLO3xoU5DRHmbmI4NTZ4NjS9bqXfWZafEOHqYsHwkDSjsvsuDbAX8o81ogUVTiO58VMkXU3PoabxHopuRWMAv0BuVyqdMWyyb90e17g+BQJWlorkD8gomwQsLl3hRWzSpfo8cepjmF8sKhjAKNF7xGWtambPAtuu9JVH6Af/9rO5k4cH3lAtvFVjrT5+/O2m6tsZ/qxHiqpeBP4mK/Uavcc/XlT3iI0FDv9a3ZVehlO5L2KnAlNAns2+pQVZRALPJ40Yxxhu07loqd1LUWFck3BefLWkXFoz/LXK/nxAUMMGDtVSJCJGHH0RsJFeKMdQHW7EciqBSnhXyL4h5mviQWSq3OyvkvcdUHe++My0KiiVbmIh6VflcpGsj/Hw2YVfIuYLnc06ySP2RfEPRfc81rwrv3nthn/wgTQmSVSGes2h4Cps+tP7VbeH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(26005)(6512007)(8676002)(6666004)(2906002)(38350700002)(86362001)(5660300002)(69590400012)(38100700002)(316002)(52116002)(478600001)(16526019)(186003)(8936002)(9686003)(956004)(6486002)(66946007)(66476007)(6506007)(66556008)(4326008)(7416002)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hzmtTJHg9RJ52k8LE63qCZEn4ywYVIMl5XG2qT3x4Vc51QUn5MErCoIacqk4?=
 =?us-ascii?Q?tE08At8WOreXKP9HHWRfuTkYl/Fj5rhbSKQbOqavXFddJk7dbAEOucle1gQu?=
 =?us-ascii?Q?tt5fsnIn5y6ryou6vdwWMJ6H/ZSYnF+TcWF2xbon+WUNgp9WaZ3uI75VvVKu?=
 =?us-ascii?Q?fPNfC9RaS4BnKL+epuo4i7+SplEzEoHDYDGRjW9kZT7NET9NSBwFgBXAMMwF?=
 =?us-ascii?Q?o3B+lhx67NOKsMw6PBF3FCpnA9RGyL+mo54URxwH4BN01t6dFfwyQJ7gMtDR?=
 =?us-ascii?Q?/y64Ipf0Gjx8arqkp3PN9sg2oa561UM3KmJG+63JK5HVliCTK1XNCmBKd5r1?=
 =?us-ascii?Q?vFH+TQskSThsDhkcK7sTog6q2Bq9/cW9qTFihB7/ssz7HK6YM0XJ+YQnSRuj?=
 =?us-ascii?Q?3gntVkMsZp+rtx2sftOidjClc+zW/zQgRggTsx4rG1T7WhvA3Tv1220U32c2?=
 =?us-ascii?Q?F6Wq6AG4KVTVyC5CPbCDhaqMoJyiL9PM/diVrrq6BtmZPUEM7V299qQeX5tS?=
 =?us-ascii?Q?cGRzpL2NpiUjWRPR6y1fZ0VW9xlgHVDWN2gZSByZuMd2sqwwDIjCSdA18hcl?=
 =?us-ascii?Q?O/qu1Cjm2MaDOrGDhrsO54ZJHHSQTkruaqg52gFN8Lz3ToMKAuUDiHES6+wQ?=
 =?us-ascii?Q?byRusknBHqZbIZKz1dgOYx7XoQ8oJQUnHorcFD5m6h1undrTYHpRRb2eMSQq?=
 =?us-ascii?Q?qRk/386IEqx2F7OrmR9dmnEqEyfVch98zw6mitLx8nx6q3h/WwYVx7tQ6D5z?=
 =?us-ascii?Q?YFYMXG2kSF2s0x937bpIg/EfA7WL88381C7ptjp/QC71jOpCPG0CPDDwggM5?=
 =?us-ascii?Q?KtCGGFaunLazuogmHnOqmv4VBANFEZpkHdwrDOBfBMagZUW/l3I3xaZacpp1?=
 =?us-ascii?Q?DWo3NEeZq9dJCCi7Y93atssWbwNJFAmM6TubAveHuEkTZ5RGsbvZhxggSyu9?=
 =?us-ascii?Q?ZaoPKknlF2oNYnF4Ifub2ZDcCUcnCvJze1hhaG+qjahOaYqx5rD1itHZJvCe?=
 =?us-ascii?Q?oAZuZ/rzzKq7UvG/7Yh69l9POr6zL6fLlq0w4gFNhS1CcU5TYqKEheN5qKMu?=
 =?us-ascii?Q?7uYkt1DiAl3a78iZkeZjZm9vSGAIuED2MEAw3Sasmn4U3N0FDCwJFW8cQJM/?=
 =?us-ascii?Q?S5BIge98a1oHMu/OTsm9sb/V+jqRc2IDJ9WvOLp25yqtF8jci5zEyNIHH4I/?=
 =?us-ascii?Q?eebGEo1rOii4yukrl2yS3D6BMKFGvkPba0kBXFvQRfZNj9J+BvaqNE7RoXad?=
 =?us-ascii?Q?ihtf/OhDjFPepq2owwBcCzFjT4lzuZSLAZLjBx/hwFceLEny1hQKIjZuQ1MQ?=
 =?us-ascii?Q?TlnZ1glS5tWUdbnbvFPWmJc1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5572abb-f559-450a-b8a0-08d9001469f6
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 13:43:12.8267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gluwymvEWwOn0NL4bP3s4EcpqTgcDTT2JiXyGUpoCIACOwy3UgMEda25D0/OBtVcQw/Z7I+Ukcx2WqQQ4DLmZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2534
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

To i.MX7ULP, M4 is the master to control everything, no need to provide
clk from Linux side. So make clk optional when method is IMX_RPROC_NONE.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 46 ++++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 15 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 2b633fd..56dfcc1 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -606,6 +606,35 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
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
@@ -654,22 +683,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
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
2.7.4

