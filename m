Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84802C433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Feb 2021 01:39:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AB5664E45
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Feb 2021 01:39:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbhBRBjC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Feb 2021 20:39:02 -0500
Received: from mail-eopbgr80089.outbound.protection.outlook.com ([40.107.8.89]:51809
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229873AbhBRBjA (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Feb 2021 20:39:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgtEOOVSpeQhqRopLIVZa6oLO7mb9CawCZKozO1iH7KddspmuNuOTpI8Aho0i4CHG2dZF5QUinA/qr91nOPw0eHGZ5m2bHC78zmSVXU0Y/flfpJLgR0tFPwU0RTpWhcnXmQnMbxYCCCSqosGYEOJdjCMP+llSXoIdqQeVy+w2SlhRxPr4qOJXx7m0+lS2vLdxto4AqYfeW91Y3Ic9ad8CpNsR2rrL381Oi/h1mJmn6fC0cWRY8Y3MgLH7nlXgCry2EiF8R27IfBDe15YU9bDn6+pK6+2zwpMw3oI3cWCPKZBGoxMLqy9MzWsmO4MFtTNWZB+YL0dSHuTDtF+nxn+6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EM9JIC+yeL3C9WIVZhyYz0R6U9vBvka5aiesdeAvSbw=;
 b=n6RdzuKOnRRVIrFNxEprcvqjr2+LbdkbptP5a1jLJEkQsN6+cbKtki12x4upAU4kYJlvz7gUOYpHLI0WpEPmzDTsnoUKnV9yVDjkVa0DL6S8Bd0yqEn2v/fPIJZYQd3zpI00bBl+rHToquDlv/MiMze/OoAxy2UVBJnpAaoLg8GFKorsdFfbQouMub/uUny5XMA/2HVmw8Nxyer7cJ1McBVtipomm9zgHvHIExaXTiyeQcwUxr8GyfrxWdJqTDeyNOW1J5QooqmDX01Pno4zVDHkFxluFbDU1Ay33FGF190AA0A3y/z5Cb0TH/Obi6SuP75S/o9E9whPgkc3QqA21Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EM9JIC+yeL3C9WIVZhyYz0R6U9vBvka5aiesdeAvSbw=;
 b=hAc4j7uwB64Ta+ntkpkgx0hLif5ICYztmgxzUKi0rI/BuIDHZPlD3FfPK9IGnltgdwviudJ64LUls8yDqVTJ18+JU0sX6u+hS15HxRHWoOT8maUp4BBiGfX1NUsAIMqyaTHN81FTToNHrvCLg+kFzFSaNICF6tlQCv0zrHxUXw8=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBAPR04MB7285.eurprd04.prod.outlook.com (2603:10a6:10:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28; Thu, 18 Feb
 2021 01:37:23 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.043; Thu, 18 Feb 2021
 01:37:23 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V12 05/10] remoteproc: imx_rproc: correct err message
Date:   Thu, 18 Feb 2021 09:24:55 +0800
Message-Id: <1613611500-12414-6-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613611500-12414-1-git-send-email-peng.fan@oss.nxp.com>
References: <1613611500-12414-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0401CA0005.apcprd04.prod.outlook.com
 (2603:1096:3:1::15) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0401CA0005.apcprd04.prod.outlook.com (2603:1096:3:1::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 01:37:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 748a55b2-eac2-40e4-5858-08d8d3adbcff
X-MS-TrafficTypeDiagnostic: DBAPR04MB7285:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB728558822708A9061DDB6A6CC9859@DBAPR04MB7285.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ocAQB9RrKUnZIru0jKtsX+NMdyBZMEHdWOByRKhPIW0UYYoM+uv9W71Zx/EhYNnG3BEk8vUVw9gbv7ab7SZlYrLShh5VRDCSSZAKN/FQbdAWp4sCrW+Ih7q+8ywcZ69Xz//7LcupbN3SZ33lObF2e2+nlO2gBVaKmFEhCGmeW7oRePQgiYMAmXyJ2wFWsgSaKkBgpHJ579AYpW1QzdJkmfNfVtupO62cmoSQgON516p/NYJedn9JA3IWOHQKhPYTZsOdiWD9Th793PLHhXXaqhTqdIwDanvqaq8GjHuNVaFl9uoCwzSvRP5e9kgg2DokaMTK/Y6rU9dujcGev96rmKUA6nBoMe+HAejwo3NZtkS6igBOm1+4Wb3HCZDpPdP2mBMZDVTNYe8SGNKpxjJsqUJKezNTQLDLkEXKVYjR6L4xHVlv7UlgOz14goi+WbNZHwdsgm0i2svcV9teLoij4dHVIepUbyVtgJ5JjjvOkILmpXOBLugRZt/RIbdEVmBG/VcTOLa/fWg9ksmMKc7r6Tk+ne6XuwcXr/+Qs3gkBqQ5Nu1aNTotkfaWdgCuE492mxbW7DSDrfVdK7PieJcRSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(6512007)(9686003)(16526019)(186003)(26005)(5660300002)(83380400001)(6506007)(69590400012)(66946007)(66556008)(2906002)(52116002)(7416002)(316002)(66476007)(8676002)(2616005)(956004)(6486002)(6666004)(86362001)(478600001)(4326008)(15650500001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?CoXqWtsVNTHz6mecn44XXpFoBwQ6Vc+BMarVp4z2UuJ7NVP+hAZP+lxhxUDj?=
 =?us-ascii?Q?aXqKo489gnstsPsTgz24SWM6fAICFkHZ8/p7KOErhy8sqk820IKGeOGMx6N6?=
 =?us-ascii?Q?D0ShXhamZGoY9uxe4J8E9/FQRohR5NEOBg28D5TrAQNCtFweyKdXQNxsXX2l?=
 =?us-ascii?Q?DJsJePvAiAsAYhANTPBsNdfEkJDekg59j/t3wK5lO0ktop3P+Cpk09whf5yr?=
 =?us-ascii?Q?jJeh8S/r/sUHz+B9v822VzXFORzkZ4YD52ExSVSpcy3V8tPrVNKdvhrHPlgl?=
 =?us-ascii?Q?uWAp2488LMUSCNI2PwZHWzWbfxfvdkR4EEzyMO8vTHKVkgHwUfu8xWF5445F?=
 =?us-ascii?Q?Hf4X6o/zwmVSwgCQw7Ff5qr5/9QlzCb/LPyqxdI5X3LiIPZYDxusX93SaCnl?=
 =?us-ascii?Q?mFdKEntKdsiEjBoUM+nrD73y7XIkMMXCTrW83Xfi4Mbm+7Z/ULJQtjm9BCPZ?=
 =?us-ascii?Q?IJRdpsIeBUrnPEmq61ieolT5PxFKlH3zA3IOGMkES4pflrwSly/s8F2p2XL4?=
 =?us-ascii?Q?1DJiiu5WYHqMqN7mZKnvErsO3AXo5/JTNlqDYV7KyJ1s7478e+Af7KWpjtmL?=
 =?us-ascii?Q?iK9vqASoS77Rpew1tS5wUXkiL92NOdJ6Mvi6vSyfvE2aiTXyNcZ2oZkQC6Mb?=
 =?us-ascii?Q?sUUUZU0Qr0qI46pRdfYgZnijKvhLk39z1kCPVkcq2DE5ua7OIPZCfBhmwzrF?=
 =?us-ascii?Q?bkQCDhb1bjdlTiGwXk8r5+Il4qKl2d/4jsIrKBSqaPLQyAIKylm7G0Qq0HVG?=
 =?us-ascii?Q?t3AkNU7mEs7KiP6znPQrjHPXc2TNgvxnETA/6R04E8D0cblVnQ7ruExdH7Xd?=
 =?us-ascii?Q?KOrjGVyL+T+Df7TitK8g52GsEJIWUXbZtdmgI327Z8f+sDcLQQFGLDfKY0o3?=
 =?us-ascii?Q?zK5Vp3Lioavv89EgaGMAOQnpZit5UOAGgwj8HoDoH9JD7lQ01yfNjCXTn8vG?=
 =?us-ascii?Q?Uu+FApyfSkmr5CsLik8hLv1i6YQZdoZ554VcdM47X+YHE3v/qiMFw3AePFjk?=
 =?us-ascii?Q?8pYVklbwNHUudnHHc427f2uJTJIeqNoQANv3KinzEVA7X/FB9bHgE8/0Z1P1?=
 =?us-ascii?Q?qF3b86NiTkuPDlOAntICB2JvqHmck4pNIm7wxBAlnQEBoMwWinVuUmD6kuQW?=
 =?us-ascii?Q?2sh85RDHeB3aOOsivAq7+p6ux4DSx4YNjQgFGkq02lzYEsI9pJQXHNnCcWZ6?=
 =?us-ascii?Q?bSIrX+nIIe1qQYeIDGhz6MXMYSJwDFzl0cx8kiQ1vheH9K7ibG6PiILJO/nL?=
 =?us-ascii?Q?fPQEN3EUgugZKidccqbTdDnoqqTMZHrKHH649UclJgllfsPxP1tkhbatzKYl?=
 =?us-ascii?Q?ZIZg9hJxUYUCahVXDSn7ZUOL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 748a55b2-eac2-40e4-5858-08d8d3adbcff
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 01:37:23.0307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Ed1NYHmDZRpBtlQBuk5qTQw9xcLJe+BEmvNeKUBjnvf5xAAvTLtB0mVzU2qHyfHfRNUx0hDadkLJpNbIv4G8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7285
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
2.30.0

