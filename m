Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27876C433B4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 02:10:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03EA0611BE
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 02:10:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbhDHCKP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Apr 2021 22:10:15 -0400
Received: from mail-eopbgr40069.outbound.protection.outlook.com ([40.107.4.69]:10566
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230305AbhDHCKN (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Apr 2021 22:10:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUOC34boVCIBoQdouYjlmqsH0MQSrWh6znNE10+04FztYQIk3oGcQ/gQtdMhU7cTvIRu2bHAcQFZyT3gBQcA/chVgJa2n0/BHiJc0X7JZJ2+6mMAkrerED6DxeoegeGO5nomihHiWiiHeexNwrFQ0O2Oa6f0Lt7CvNKJe9db2lIJEaeoLcDF9d2AV468S9w1SIWmYoNSIHqtqE9BnSO4qCJl1pB94RisJxgKsTkk/9I9n1+9HCpQgOcywXxgfEE0LxAJn90txV801W7ly8q0ncHgt5H9OBLQcAs0IaSh1mUTIfL0Y7O66YbT74ohxukHs3gmE7pdghL+kxUn09QELw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JElioquqRM3seumWkbwBkQc9IvUvCox/SuXmtG2RAiQ=;
 b=gcBcv1EiJLmzG1pf9XGFTIrwDRyJUN1W7rI676cGAW9OmmEglQBtyzyzqgV2qjhTlmGnUtz5vt/yIADwZ8m4cMyzcWRT60h37F9O9er7104tklcMuhF7X5DgJ/EJecIf0PRXicXj3D94JEW6JEHJsnDCEgItLB7Phx8Dnp4y7DfQeCWixcaS3l52yEhK05HnysYwcSxZ2dLsM9PKCDNMtlkmU5/uZJIgw+kjw20ZIkAY5jevNXU0pS+HNQdKzmaAKaX2UZbBua5GEYOz4T4TUT/Cn2HV9IPf/VkMLWXWRoo+nf8jEEeCLJm3m/6DW2Mx3zkE5/B/PS6jy6BKZEt+eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JElioquqRM3seumWkbwBkQc9IvUvCox/SuXmtG2RAiQ=;
 b=Obkk3sl4c0YugYsfRyqqdcMa1rEh5StQI3OMF7Q573+wSOQrlyKvDkSs2qBHQyxqV7iqpQdJdZrhB6jCCdcKcqMoSQQRHB+Jn2DWtHIXW56/qO/QqT3Ra1uQKuUQBzT/zXQ8l+Uv+B7favjqD6ubeTuhuuVRG3cMhpxRdLefSbU=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR04MB3128.eurprd04.prod.outlook.com (2603:10a6:6:10::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Thu, 8 Apr
 2021 02:10:01 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 02:10:01 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 4/8] remoteproc: imx_rproc: make clk optional
Date:   Thu,  8 Apr 2021 09:54:54 +0800
Message-Id: <1617846898-13662-5-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4042.4 via Frontend Transport; Thu, 8 Apr 2021 02:09:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 336bcc7a-3a3c-4264-0691-08d8fa336a35
X-MS-TrafficTypeDiagnostic: DB6PR04MB3128:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB312870F46F92EF6B1C820454C9749@DB6PR04MB3128.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lEvFpEsojRgpxjn+SQ4viOm3gWr/mDBLQxv3Iv+OnFxEODYgsVCU5eSkD+3kqexo65x32n+xf193bqi+/b0dGrx/AdEWnuLC088o97/HheWxXnDHB/BYxC2o+1CLCSuMRyFjQ/F9VGEIvTdWpU95x8BDzuxGmbcrWRuG4lkPELfNZ6beaaurQXOYWMeGN5zjdr2qfGCu9xo8kqulE3Y3pQFPghuz699271Lsbn1U/Dp/9ctKEUv35UVVuFXw/5pyZ7IYyDAhVQUllnA08Jg1ASVA6bmHrkTu57C2raVrLUg/pnmdjlHzO81n7C3YWFBK+g8bhkDDouBFGhG7wD0hMTTHogGc2vIvaUikG5mjMcxZ4YqofazXqpysiBWQp1W9XxG+NLJiLBqTrtlGOh0uA72Y3AaeOn/oCyr7JWrOidabR8sBinPktwllo1gJ7c43k0uyNNxp4mfPBSmcNcua3cOqCveO1+jmb/8rhNhfqQkGeYp/FaBLhYrVL4eLQWf3O/96JsIs8NnOBfimnoYg0O4IBi3mOwLBg9BWoPkeP3a3IL+mRrkdLvhukWKoO4jSERAwA7ymhrFJugiWhs25952msxPoowRteJlVcA8+L8T2bQbG2kGFDftw7wzlZHdTfSBST7g9YRykWx0ZZ8XdZTmm1imFCTcpZ8RuOwdq7xvLkREBRHP3ul+Yr7pZRAQqgLnQWFSbcVT0UorL7G2hOPEULBq26Z1voVesfRlYlBY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(6486002)(4326008)(478600001)(8676002)(8936002)(26005)(4744005)(16526019)(186003)(316002)(52116002)(66476007)(86362001)(2906002)(9686003)(6506007)(66556008)(66946007)(7416002)(38100700001)(2616005)(6512007)(956004)(38350700001)(5660300002)(83380400001)(69590400012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ogSTl9lWFuuqDggRYvRC8b1Cnln1RIMnktUPjGqjzZMD8TemYrV3ALds24EF?=
 =?us-ascii?Q?bG0lIp5xz/W68cziAVs2M9VuXj/e6UB+eFqx8Qh9A3JOMyBL1eSSnVNlJ1d5?=
 =?us-ascii?Q?lC89JHy3sGpsi1rASzFdRmdKyNoMrshlAVjyYbRKZ1U+xcHP5O7T+K/ySa7w?=
 =?us-ascii?Q?olFtI+54qH38GNHpIdlU5aRzivKRUJcYLgNbypUEhu0ePyam52mlaA6DYV/4?=
 =?us-ascii?Q?SsVxmHZJs5lLs/5AWGwkcR8dghSwqmfYO5B9jzAr2GkJ5jpVYhT+oA3nditf?=
 =?us-ascii?Q?haUGwqp6ecEjFftabtUHwh0keO5tJ+J5Fr4WWy79Yn319RXaKBATnkqrnVIT?=
 =?us-ascii?Q?N0hvvU8TNIPQJ4YQD3iCtuMWLmh/vPuA3UP8ZJLLG3hmPc722W6Ct0HdHKf1?=
 =?us-ascii?Q?cwZ2AMPvx1a0Yb42TwIqZ1kl2IzDXyCYh/FCKZJ5vibrvkHw2qQG6YpCvhxi?=
 =?us-ascii?Q?CcFUjXm/ksnjE62yyAdWI0MKcllIoFIAqfTAqTvcovpW6V2wxd2RA+YHjdqN?=
 =?us-ascii?Q?5A2Xaa5rbryieD7N91lCamtNZlVDJiCf3pkKN1H9xr7G6BptppFQYJbf2H3C?=
 =?us-ascii?Q?PaI0HrXtrS5swt7NcRCb8V+mdiey3ln9kN9wHJYJdkgm1UTvvnRn4QpCq0JF?=
 =?us-ascii?Q?FtUTAv/pzPatk3SKCoCzbr9TuENxpnAKfM8v6jCIlXhKS2nXAo7TNgBqiZCg?=
 =?us-ascii?Q?wQAtSh3FKR+BEVGRGgPwXHWzyB502kJpmmZuUZJC4eFeBZtHMAUxeeWuqNvj?=
 =?us-ascii?Q?8ivhvAP9+XDkH/duLMMqNd2BIR8LGt7y4JRr2dov+JlSiWOiPDKhdsSxR7k1?=
 =?us-ascii?Q?t3p48bDMaWQWiE1gLaPLbIbxS7PhmrSMynh7UzxtdfLseVqydLqS4NyCbs3D?=
 =?us-ascii?Q?wikDMcVEkP0EVHidOrCqobodkCCggXlAFza+PvSWogT/0hlfIpsr9NDx3jYW?=
 =?us-ascii?Q?R96C4yE7/kAVipXqQtyLrm3JTOxTtM8L840MRAInFUv/MlRu39vxCzFv40aA?=
 =?us-ascii?Q?5osgwSkS1ESdB4BxTTgAyYYnsgpITtjmS6I8RdK/UoJWUhMPnsrfM6dRAeJS?=
 =?us-ascii?Q?rS03HGqwCdbLHsZjGVoh/iTacj81b2WdyT281qH5v2a4HYWcgxuHrnPaWA4i?=
 =?us-ascii?Q?s0/Q4d0LpwUAA+knK/HWDwlKbsHjO5XVE9qDpCFIpPJ05n/aTS+SIfMVOMFQ?=
 =?us-ascii?Q?4UdnWaW9qA/v9/3AcdpvoAsS5bZtJmhTKnNsnNHvC7nFi9cZGbOTBzXT5lqK?=
 =?us-ascii?Q?50DYSmjRoV0dHsmrbC2njMNqBHKpHb+POX37aB1pJhBRnXXT6bBj6wWUDYHu?=
 =?us-ascii?Q?4lAFeyZVVZJcL/M1Ny/GL7LA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 336bcc7a-3a3c-4264-0691-08d8fa336a35
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 02:10:00.8719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZLYt3abNzWeIkwQB/+GxIHoupAntUNclLYw3lwdnm77pW8aQdqbY6GH36TNgA+NPWXNO0cFuIUZq8r4eTqBfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3128
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

To i.MX7ULP, M4 is the master to control everything, so it not need
clk from A7.

Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index d6338872c6db..ca17f520d904 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -635,7 +635,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_put_mbox;
 
-	priv->clk = devm_clk_get(dev, NULL);
+	priv->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(priv->clk)) {
 		dev_err(dev, "Failed to get clock\n");
 		ret = PTR_ERR(priv->clk);
-- 
2.30.0

