Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C64AC433ED
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Apr 2021 13:42:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B4DC611F1
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Apr 2021 13:42:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233099AbhDONnL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 15 Apr 2021 09:43:11 -0400
Received: from mail-vi1eur05on2058.outbound.protection.outlook.com ([40.107.21.58]:36513
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233098AbhDONnK (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Apr 2021 09:43:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmJW+sYQby1IJvL6JC8m9lEDYuG4w7Qqbw2YlI0F+fA6GYNLRv/LkBcH6ee5YHmtGn6MpHPt1ml6a821seiaf1tBs1gLgWtvhCLVgamdGSvzlzVZmwzvyNWTo0knzlgE6xUQ68ft/LSXSvcGYumWJr8AP9p1CzeSFO6YJ+YJJ7YQlMRIj0Jj1mCO3MNQM2+XkBWRpSEmOwMr9vQgGY2N1JTKMaNnTVZXucEPo3e778FwPKAl1bFuWL5VfTM6OLD6Saz6SshqBv2ZMY6v206JAl9nOnwdY8XGbZs5oMBHVxMcaFBQeRelSAPLpL454OpeMRZl6WxMllr/NmOFtxZ//A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4S51db02oMTWlqcF3wGNmVhKpSJwByi8ulLyGPDwrU=;
 b=fhWWhn9J5zug3kViTMO5Dq7vlcg8j1zPdHkYkqhIHfJutBACSYhGtfjYLeh/L+Djc+gcl68AH86tFc6wpsHCq4xzKA1I9bOLPV6LHFeMeAcj5RkybTtNNDHNuiIiKLU99+HPRMBtRWECxy2n0Z4EwG0fUtcKyvWR1RtOxwlW02iEV/M+IfVrzKi5kjFi3qnNjnw7YN7qdsPScKfm5OuQTJtfWH8WEbwv9eIgEAf2KPGBhfqD8xs0iZcxKPywQmGCYZqt5xxG7sQMN0D4EN5cTYBdRuwSbx9KNZ0ap4+fbwL4qqSaThUUT2AkmKXMwdHjoi0VA62Zi6xx+UhuCbtcWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4S51db02oMTWlqcF3wGNmVhKpSJwByi8ulLyGPDwrU=;
 b=Xj9TITdE27CqrYaoAapAuykNxdbd5qC9ICulPCCTGhW9MpbCN+i5ti21GivF5fpFuEsURlNqT+ZgfJWyz89L4RvgnM29v0KJx+qGAW3vIGjh8dX7tOFsAmNVXFvx8bY1Eno3xXtYmK1QSuBl/U7XhIBPnTtaMlONqQYRzpPt3Kg=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7817.eurprd04.prod.outlook.com (2603:10a6:10:1ef::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 15 Apr
 2021 13:42:44 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.037; Thu, 15 Apr
 2021 13:42:44 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V4 0/8] remoteproc: imx_rproc: support i.MX7ULP/8MN/8MP
Date:   Thu, 15 Apr 2021 21:27:33 +0800
Message-Id: <1618493261-32606-1-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0132.apcprd02.prod.outlook.com
 (2603:1096:202:16::16) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0132.apcprd02.prod.outlook.com (2603:1096:202:16::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 13:42:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e48473cb-f6eb-48f9-382c-08d9001458c3
X-MS-TrafficTypeDiagnostic: DBBPR04MB7817:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB781765EC3B73B94FFF9885E7C94D9@DBBPR04MB7817.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vse0/2Yg6nyYB4M6+NGR5URpx6NeIiMQM4ilIFur1gSEsFRywwoXl01In58kEBxWfaWQUeFnhb22hrbs/LzzXrNse9Ys3SmLBzxmlaH9Vj9nwaBGjrARX4CrRazENseAMj7BG9QEkupH1WhsgC8hvm/oYXyUYTqvLe4fuK62+xd60eWRmyNGlVJThF1OKjUSZ1ctIArqnzhQ594fLbpvvLm9+/M5H4g7Hm/5FfdfihgpRYDmnBw9LHBVJ02Z7BEM48J2U8jd6QcaeQVAN3mS9GpwV98WpJ8IYtgKeT2HOe9Jc5BSknYAFyQFkThgYh7PMSfS+wIYtTIZOKvt7WSTu5SBV8ByC83wYHo/T/EY93ofxckeMb2apjgxG4o7uaJRV38dnyW/aw1BiHImKWLzeVXZoyZy/FDaBHLP3PzIjzIWnKf1gu8f87FksItZ+G/FDILn95v0boUdrTDH32YRQ/ux61/7Jjb1iCrmZXskpnLLa/3qy7CfVsh/i4PDDqmWBo8lMy3rgQ/pEvOVaP2fSuEz85V4yeVkyLgq4K0olSQVZVG1zTHpsAgj0N7oXi+0W4N2f5neNesPQA17YwwnNnPL7Y+l2FYbGzmrUnf+fRRBu7mt67FGfoGF74VsgRgp63KN894pXsZ0vh7rnku1/X9AcA5zWkRLiEn8urqg2KcYirPcLoF7WjtB8G7beoGx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(26005)(478600001)(6666004)(8936002)(186003)(5660300002)(4326008)(8676002)(66476007)(6506007)(86362001)(83380400001)(2906002)(66946007)(38350700002)(316002)(52116002)(16526019)(956004)(38100700002)(9686003)(69590400012)(6512007)(6486002)(66556008)(2616005)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?CR8cMlYKMVkrxIEFF90ttzw1R2WFR1Is0+AS0DnQiJFPFmNQg7ix7IXCTBLS?=
 =?us-ascii?Q?gPL5osXLB8u6zosn8ZxTH2V9h1zb0IkzTzldJC9A3ue4l+PDT/a4lmG+bd9t?=
 =?us-ascii?Q?ctslfpiDGx9tTRzhjLAd8QrMJSPC0im/LV/OzRUU3GDpQVIR8MXM2Gs9P1NX?=
 =?us-ascii?Q?hBS11tvTgGj6kJOEjkPBXwWjBXOEwj30Zg9HutHpcIgR5LBLGah/tZiQRaXp?=
 =?us-ascii?Q?2VG8kOcX8AOmmjGtqjys19LN2orvf2a9l6ouy+UUYrN+bsFs7l+O1ivv7jmV?=
 =?us-ascii?Q?Qi2MDVy3ztLRXETqmXxsAtyB5jM/GMQFBwcAa7y76jh8HePJ+NCs73fg211I?=
 =?us-ascii?Q?wrAJ4fF1L4LSGgBFWGzJbFjWs/w19UfdQsOTW+EayPNC7Im5fDworXaAb6nT?=
 =?us-ascii?Q?vGjUUPeE8TmkmZrTSe2kelg+KzGQQIHaSsfBmRSJ++YTjh+HR8ZsP7pniV6h?=
 =?us-ascii?Q?cr/UcB8+qE91mbmZVaO09sw2FGAR6otwQUHEqaX3w8sv6VXqzxrGK3DKpPbm?=
 =?us-ascii?Q?znZeTCc0VMSCr9+h8BsOfU/UFNGVCc61+3xv3m1dRSfUF5fn29GlNziLTDET?=
 =?us-ascii?Q?W+fI8tmkPjHDdZ1xlVd8RZJGTT+S9LNPu+o4imChSqUQB/r91pp8KvYzIYdP?=
 =?us-ascii?Q?KnsxIoEZ+l4mcM5LcFeZq9Zp5EWZGo2D7n4+RmI5re3+75arv0BI7h+owymk?=
 =?us-ascii?Q?/5Chz/DFBqjdVKBoO8vog7ZCGCJzYV/5/gbGvqW7xHQJhnKHHyXD/KiIBsqv?=
 =?us-ascii?Q?g4wJQQxHJCQDdks/DkOKZE5TVczfn+EKjN5Dx7UPYkh1iqH9+ZseWO2VISf8?=
 =?us-ascii?Q?lRaq0PeEAVA7PUBxx/uvRXIDENmHwml3Ocf+7YgiXMQs477nvJXroPGhUXTy?=
 =?us-ascii?Q?c+NebdESIg4wwTfNcDBAc38dsoUMYWSmWQlt9svEm2wAdkPyD3EZNw/JMMHb?=
 =?us-ascii?Q?yj0PbJlqW46D48Xno+lra2ZcdkfXIA8LSv1fs/R/3NJ5BgSDqn0hapvDpIIc?=
 =?us-ascii?Q?ex8bdYnqY6lMUZSpNAKwmFR4JsdPcuiupYTkasiKt7JX3jFaJ8HpAFYXnIrF?=
 =?us-ascii?Q?wNPyZWfesIPIMRbzKInpbTdDppZ/4IAekNNfwHebsPteBYTl5VgmjXcryhMF?=
 =?us-ascii?Q?j8KflrWxX/aeptJOaQxeBTTRG7FwSqS9Q/gx4+CT63xB0QIto6PmrXRqAl1o?=
 =?us-ascii?Q?sYib1+Xn94ghbdKDSfXXOInrCJMGSv3h0zfTu5HXOmo+bvlyoXk/T+Q48PO/?=
 =?us-ascii?Q?x7Z+rOWpjXvi+/SWWIXXtEMSgDApcAIkBrh04hDoXtgvTZSJwotKh6ZwuGJl?=
 =?us-ascii?Q?dBz0cDVhmTFdrLYkl13hfxMq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e48473cb-f6eb-48f9-382c-08d9001458c3
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 13:42:44.3088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZbN85cuYi1RmXJhzbwTKcX+bBdhxhG6wVXcaEpTwds0PB90L8h+s+x9BVgqFJsdlVtnOcg2UD7yYGAxpR7cLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7817
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

V4:
 Typo fix 
 patch 4: take state as a check condition
 patch 5: move regmap lookup/attach to imx_rproc_detect_mode
 patch 6: add imx_rproc_clk_enable for optional clk
 patch 8: use switch/case in imx_rproc_detect_mode
V3:
 Add A-b tag for Patch 1/2
 Fix the checkpatch warning for Patch 6,8

V2:
 Patch 1/8, use fsl as vendor, typo fix
 Because patchset [1] has v2 version, patch 5,6,7,8 are adapted that
 change.

This patchset is to support i.MX7ULP/8MN/8MP, also includes a patch to
parse fsl,auto-boot


Peng Fan (8):
  dt-bindings: remoteproc: imx_rproc: add fsl,auto-boot property
  dt-bindings: remoteproc: imx_rproc: add i.MX7ULP support
  dt-bindings: remoteproc: imx_rproc: support i.MX8MN/P
  remoteproc: imx_rproc: parse fsl,auto-boot
  remoteproc: imx_rproc: initial support for mutilple start/stop method
  remoteproc: imx_rproc: make clk optional
  remoteproc: imx_rproc: support i.MX7ULP
  remoteproc: imx_rproc: support i.MX8MN/P

 .../bindings/remoteproc/fsl,imx-rproc.yaml         |  11 +-
 drivers/remoteproc/imx_rproc.c                     | 206 +++++++++++++++++----
 2 files changed, 179 insertions(+), 38 deletions(-)

-- 
2.7.4

