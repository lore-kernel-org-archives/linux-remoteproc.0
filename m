Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8558C43381
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 01:25:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2149238D7
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 01:25:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727761AbhAUBTY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 20 Jan 2021 20:19:24 -0500
Received: from mail-vi1eur05on2088.outbound.protection.outlook.com ([40.107.21.88]:26411
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390695AbhAUBQY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 20 Jan 2021 20:16:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neDpiKGO4rGRMFlN2UWxUsqadd99bTb2qg6Ykk341oUUTibgo2gLugEmvpLh2AhK7U2uLgPx23lrBmjsC5pEBSz82LqaAHYIXMg/XwRLtAt2/V9BDjibH2c6qUrTvSaKfTkP+UOoR4E8rel9q955710VnHYVQQr/M7ykiw4rmVLg+7fi5HHf079BaKUf1XXhV/UuqJPGQ67fhmhhCwgZFwL31CQngl+Pm43G0M1d4iIv7vLKgcP9JkO09LXGghjBynPBp+/zni2wpSs7wOguAVXoApdvmpKumsA6WlXu9h4fldKFihXHgh4/w7T5z8iK5qAkH/w0Fo/73ct4TW36nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrM/10lxX+u8ygpoSj3Cn75qK7g8pM1NhQgG/rAaoNk=;
 b=aTpnFsuNA59iQC1vZOCAxDuxyCuW+ZgcbQ8Pl/VWDsXhsSkdMb9xOCZR8Pzf9YBQ8jwxeFRrMy04+4aanutrxWlDgnKWHOlwV42W6R2gHgiItzysbGrhTrr5ETunC3HcQx8zje/XdeW3gf0woxuNBvvf7F1RuMIFhboXoixvK5FLhdKDvbCT6wrveg0Ioa2Zz8A9rTallIOPveq70QqZFnDxcY8mgEDdgVjjmO743U7gXF4wpeNEuG2gkVhuC99uns/0rM1vQTsD8tjs4empw9kBgfK+RvVO7JfpP2WQvtiGC++ZqTd9kwBwDMS+M+DMfZ5cIMJE42w4Ao+m7P0V9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrM/10lxX+u8ygpoSj3Cn75qK7g8pM1NhQgG/rAaoNk=;
 b=j5LGOjIlFhTkl2xwcFbmkOuUVSdAbGUrzoipuvl+42UP0t8EZIZDbHf6nEuNCmqkrtiqgLT4PGVEiNPQVruw6UPY8sxN2A9dbAlDvf2+T7mBLeKgsNMbkCvf830+w1Ne34WeFcG2P71s2AzYhkrBX/mFcixdkywFOunNbxz+yic=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7948.eurprd04.prod.outlook.com (2603:10a6:10:1e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 21 Jan
 2021 01:14:45 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 01:14:45 +0000
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
Subject: [PATCH V9 06/10] remoteproc: imx_rproc: use devm_ioremap
Date:   Thu, 21 Jan 2021 09:03:31 +0800
Message-Id: <1611191015-22584-7-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611191015-22584-1-git-send-email-peng.fan@nxp.com>
References: <1611191015-22584-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 01:14:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b995e028-906b-4362-f1ef-08d8bda9f02b
X-MS-TrafficTypeDiagnostic: DBBPR04MB7948:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB794809B9BEEC773A1BBC583B88A10@DBBPR04MB7948.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KdikDrbC1KaYlYsjxl/nT6YDwHaeqrqeAVkGODSwpg0DlxICMGZDLvBnJipSbsVhmHAhKO5mRmZ9bTmUUmdETFZPE7x5F7cHZ3T/iFjxSTawy/6Dr7AHhuZRdwFuQM1LFyxshKy/hk9ZVJcVyHJIM3WYEJaxeT9DWk5it6iTRyFARqAhGLDKnwmmwa3G4xo7iyPnMVnpKC3ukkXKgv5gSir0vkShCGI34G66Dy5ONDuj4nYfSNyvk82+usOkRmQL/Pc9jX+Ihkm29yPPgl07Eos48WZnSgnjwEq4VsdQILPbdM3+473KJHpLIy/CO2AmOq1Bc8gzPpGMSIBdwEl+01vR074W9spoAP2wv4GLr1ZmR0rthbjotn4LMBu6hCl2V+nzcfdbFa3jbAqGsTEzkDzh11YoDqr0FJvaUuAP8jLgycsPahxbLyF08kusR+sgsYyobAuZoPsM8329YzdFuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(69590400011)(66476007)(186003)(2906002)(6666004)(52116002)(2616005)(4326008)(7416002)(5660300002)(83380400001)(66946007)(26005)(16526019)(956004)(36756003)(316002)(8936002)(9686003)(6506007)(8676002)(478600001)(6486002)(6512007)(86362001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?byFOzOn9G12/AeOw6OtM0gN6SOP1WCjBAuSL2WmhS7uoboo/19sHPtonJP6x?=
 =?us-ascii?Q?FN+fu5lgiNOKq/LnnXKPA8wNtXtHVNg4cAn3hOHKntmiqipc6kD/Fc3mFujU?=
 =?us-ascii?Q?Xdm5y0+X/O9Z2c2Pr1AANGkYWSI/RrvSPhmKdsjtjW97WMMDD26dXXCHbLia?=
 =?us-ascii?Q?LfLdKza3qRAodT2bvRqsS3ApBvRrduLvdVQbrJqHmoWRp2Pd2LMAZXud4xHD?=
 =?us-ascii?Q?fkPptUuldpOJtxh1DYXAcYAD2IwpoMrg0V5FHNZq6WOD2q+afYTiltpcw58Y?=
 =?us-ascii?Q?UX8s9ijGRtGf/WeyQXvsPUCelh/zjs/lAHMJYYlg0LEITFaBNmVwt7Pez1L0?=
 =?us-ascii?Q?d5ZFP60wWJWwI/adBpvWfOjRU8WgHd+yw1qOD3Sx22hF1bfUn71a6+iQ8aEl?=
 =?us-ascii?Q?a29Lg1n/7Ypavj5KrOJ6KvIJja+eIp6dYQhsgGOesKRfMCiRU9ndCNRXrd/B?=
 =?us-ascii?Q?8h69EyUvlBbRTkDGMWfiwr48TKIS+Wu8/iI+j0W+5QXnUbUsTZolGK/UMGNb?=
 =?us-ascii?Q?RMyuPsyKAshOxpww5QK3Ae/p6w64vHcvjLByyrKlbKaMvFdMQqzEfkHN5LHN?=
 =?us-ascii?Q?SVhDhWYfFZq1QqslFC2TSKU9cCYlA+VB713Ou10R/IDvm3vjeO87OIjMuDS1?=
 =?us-ascii?Q?a1KY/Fj4ruLkexw2cU3686t9AtlNwe0Zbk+PHj/ycx7ficreHV6RyyozGenh?=
 =?us-ascii?Q?6qyHewXgMBb04QCwPQugi1wlUtwT+Y9HhUqjTDHAbfH9EU0yAHTAsypdWobt?=
 =?us-ascii?Q?tJTgoBDvSCOkFvPk1Wpd0zgIsu0+anGeCH0alTbL2vAV8aGG6Veu50seed1q?=
 =?us-ascii?Q?VTgBK1fXqnKv4DS95yUsv7i/Vu0BT7JHsPVqyx89Xuqs4rx8YTTownYyzLwx?=
 =?us-ascii?Q?Rb/gTIy/8NArOoL/lq5tuTnLf83JTi+Z9/MYpCSnXra6StR0avZlV0lbVm74?=
 =?us-ascii?Q?NzwCdLcRIvvpGybdmUqDdy1XlxBr/kiy9TMrycLhVW5lutYFhgm9TJUgsf9E?=
 =?us-ascii?Q?QPo+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b995e028-906b-4362-f1ef-08d8bda9f02b
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 01:14:45.3637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7z46wDPxh34JyYZZTJyfAFOuoPAhH++OwjyP6UJuqL4KWQCDVHBAhLdXnBQCeCWvbfjvYhwECpFQ44vpC97IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7948
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

We might need to map an region multiple times, becaue the region might
be shared between remote processors, such i.MX8QM with dual M4 cores.
So use devm_ioremap, not devm_ioremap_resource.

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/imx_rproc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 2a093cea4997..47fc1d06be6a 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -296,7 +296,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		if (b >= IMX7D_RPROC_MEM_MAX)
 			break;
 
-		priv->mem[b].cpu_addr = devm_ioremap_resource(&pdev->dev, &res);
+		/* Not use resource version, because we might share region */
+		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev, res.start, resource_size(&res));
 		if (IS_ERR(priv->mem[b].cpu_addr)) {
 			dev_err(dev, "failed to remap %pr\n", &res);
 			err = PTR_ERR(priv->mem[b].cpu_addr);
-- 
2.28.0

