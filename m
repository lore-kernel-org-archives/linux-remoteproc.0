Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A18FC433E9
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Dec 2020 03:03:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32161207AB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Dec 2020 03:03:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgL2DDb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 28 Dec 2020 22:03:31 -0500
Received: from mail-eopbgr50047.outbound.protection.outlook.com ([40.107.5.47]:26094
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726558AbgL2DDb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Dec 2020 22:03:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbY8lXOSDWeX9a2Og3RD4fvZ3PubysBCz4YGpqqlIxJwO34QzsUNygo16hS4EkChjM5QNCwxBayFSUBtGmFVkl1gCz+TWIyX1AsFEkC9hjMODLL4GrTRPk8DOGdPOJhjVtkOlEt4DP/pwPzJn/2YxGSC7cO964gf3IFw6zSIAxIoYMqD8KNbVwQb1kupzgztGhDh9Z5O89byIinEbfkxWG3t46yPD34zO9NwcQPAor0DvW/DD2ehRj61x1Rob0cKvh1/xQqxazFJv/zb0SJupPwdY4YgRQ8pli6tNfqGPXkAAPh0i4MjvBc83szJGGJrxuzgnWTQU5OsxB7ExMDQfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ikv+A6H57fhG1mI5w036+P++FNCZzL8Yk30kD3Liq/o=;
 b=ImqLccJqvyD3oR1q0Si8qMIagmjs+xsABAT7OViOx47YofLAiNXnjgqRM+BDg0Qk/WAWHvYCWiztz9jSX5fj34AM+IkN2mUOTlWD79gbad2x2JkzOthtNtim6mDAhDQJ3nrGEOv6JvddhPCFVAY0JvwJKfV+k3TEU4kTOeShQQYjBDHAsvPMtEHjKCGPSGy91U9EmVw7S7KTilcbZRwp9XUE57znVdrLFlV6XcOwcebT3xmU6YGRjpRkEatshDMnyyXPzqFFqzGWi7MfNvxRXje6qJldTIw+LhEvIFb04Gy16tdMoOarzuWxqnwKMMCC1F2StV8Xtp/PN0MisJSWRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ikv+A6H57fhG1mI5w036+P++FNCZzL8Yk30kD3Liq/o=;
 b=KRlDuX7/atAyZUXUANW4A5GT3Q5i1WN7Zaqtrpz5j2yeTmcD+HM7D8sSWXW+PAGHWSXmRFIo0nsxlc27TEYcNDrxqEGouCOx724frqvhK5nAb1PeRfQNTZpHw5ijP5o+IAde+IgKXCCod9mQGuSav+yWcZdIjbiKbOmv166zCqY=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB7178.eurprd04.prod.outlook.com (2603:10a6:10:12e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 03:02:08 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 03:02:08 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH V5 4/8] remoteproc: imx_rproc: use devm_ioremap
Date:   Tue, 29 Dec 2020 11:30:15 +0800
Message-Id: <20201229033019.25899-5-peng.fan@nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201229033019.25899-1-peng.fan@nxp.com>
References: <20201229033019.25899-1-peng.fan@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR06CA0178.apcprd06.prod.outlook.com
 (2603:1096:1:1e::32) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR06CA0178.apcprd06.prod.outlook.com (2603:1096:1:1e::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 03:02:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aa64af5a-c7d0-419e-c503-08d8aba62108
X-MS-TrafficTypeDiagnostic: DB8PR04MB7178:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB71781D19799FDDD5C0166C8C88D80@DB8PR04MB7178.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2GPCQfft86/dc2mhpuY11HYjoPKBdezymWoR3qR7/94z8u+Gdse1ajPSC/C/EcZm6Cn4Re0kMT3DLyJ+HiKriQsfzQukdOXw2svhLy/rKWLYza7mx4kFTmoTWuohMWvt2fZhylZFr+IeNJLKw3r56jNGLQ4UQYAzRsOdb6godQYtr8vuCMpPjGGLHaSbr7/IqUugZvTsaYFQE5SyfjLnked9bzFVPXlkvzykKlRFvCDEUJPXPfFhwc5dsx1AoKeXy66Mdsx3Ucj+0a9o68pGUxQjyeNIYMa0vNnD2LGL0tsfw6t/YkapR88zPhEktC6vwU2UguqBLuOr+KNJ4URWSEKbNcdTFcxQMBtizV4J1Ujnil9GINXof2wLEsCCcbTdwsV0H7NjthVqrw6bSlXV5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(36756003)(66946007)(16526019)(9686003)(2906002)(7416002)(2616005)(86362001)(956004)(54906003)(478600001)(83380400001)(8936002)(6666004)(52116002)(66476007)(5660300002)(66556008)(316002)(26005)(6486002)(1076003)(8676002)(186003)(4326008)(6512007)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hRyIpSJ5qJ4z091E7NxPBCQTFZVBMP8Euy+61OZy87z+tCeoIV4PBWOG7Oo0?=
 =?us-ascii?Q?++GT2f5LFdz/K+rFdGaw0UC2jZ64RtEtCaCWyTwNyeTb6gQKO9bLPBU5+Esf?=
 =?us-ascii?Q?JWwY52gGIzviQHFFPKsQkJelBjRwpLlwVx0pwnBE1gt5CgVJBgd0w3DevAQw?=
 =?us-ascii?Q?ZCR1mHgHGxcSkgHhRIa32moKEb7szvXsbVjpWZ36MNzRJ6HufbYUrjGntBCi?=
 =?us-ascii?Q?vBksulekkLRgHC5TZ6HCDi88QPx53AT04Pwy92jrQDPhaZrHQ/S+wrnvYQLj?=
 =?us-ascii?Q?AhVe6K4JUUn4y41tzbzQCP2Q6xhvakbVr8I7vgkZ7UhdBNYhENwg0sGb4oYl?=
 =?us-ascii?Q?8ebwhwn7F8BQUI9tr935ZJLHdV/8k6wNm5aHSuvoexVhnWTq4xNIsNQuyxrd?=
 =?us-ascii?Q?ELa/V1YbsO9tkAm0/vcpUMasQbWrbZqYwo4sYorf223J00ZD5pmN5veCbQ4p?=
 =?us-ascii?Q?pFJZpfKuVQ1rE41oznwaFnXQwTXqonDy5KVdrmc6Jn1n+nFMdisKdrU3mur3?=
 =?us-ascii?Q?lqi+TOxYpSq56O0y6Kf9SLA3yj+sJnBVaWWtIA6NxrOuM6gmGdXYoVRjgHgv?=
 =?us-ascii?Q?s9AUEgjBjcLqp1q8lGVtAkYzuLfYY7nqDLserxUymeIFAJ2mkx/S1fyq51Sa?=
 =?us-ascii?Q?UVFNxQ/ZUOitI/ZSHQeYwwr7/2ZH3LTohTlm5xddpUg8ra/ggPN+hudK/RNt?=
 =?us-ascii?Q?0mEakr4GP5QC9bcMTG7O1NYouk3V5roH4XFY6T+mwGFmY0WlLGsLl4h0pA7l?=
 =?us-ascii?Q?2/L8vr/X+q6ExlcrbfrB2gpiClAmv9DFOsN4jmSW6XyF8cuE/p268qTM/fTh?=
 =?us-ascii?Q?DwoGpD+mGLJSIWvu6rUzeTNAZugOQqEHlEoezbhB74cOYk8VA0DHA5vTXOjb?=
 =?us-ascii?Q?LsabQJ6qFr04XrqDGfn4Al91lB4h0M4eqY3Nlj+uIy6AvSjFWTYNxtIQuQtO?=
 =?us-ascii?Q?QZFXvqoTLLNkVKLlYYrNLOW1DA2Wr2w+CAFhV6Rgm7J45jXA81X5XWO0T6aV?=
 =?us-ascii?Q?G6pU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 03:02:07.8749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: aa64af5a-c7d0-419e-c503-08d8aba62108
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 13Ypbn6HW9m8XcFFRKe+UcYuFY1wcHSmORDgSZc3Nwk874mSbiAOoL56kOQ6WEMuNo60y+6CEuhZxEdbUM9XkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7178
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

