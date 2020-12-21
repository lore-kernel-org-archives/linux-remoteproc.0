Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A82C433E9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Dec 2020 09:58:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9A8D22CB8
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Dec 2020 09:58:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbgLUJ6D (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Dec 2020 04:58:03 -0500
Received: from mail-vi1eur05on2078.outbound.protection.outlook.com ([40.107.21.78]:55873
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726242AbgLUJ6D (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Dec 2020 04:58:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkpwOB1FcHEsE6G8QDUc/G+Ure90QXHXVROzI13OqW1tMPkbly/6N10wYq6kEsSoTZCO+VpzZugE2IkLsoCH3aMT55NatJ11spwhvN5GglNjDC0o1+ObLyRyAEhEPvGRFVWxhUdD5BacIuALQm8kMBh576+gLS48KMaIl+f2LyeMz7kB4HcZ6eB5CqVYbAijk7Q2vqEF0jgLaL0B2a1l6IzMVopCRy8VgSkMwo89At2sHX5KSH912xu9snuOfZ5eRkd5zdn6PdOREH/7p4/cbLxMtpee2RRrn0cbnXqoi5BGTGjsb4swWxNAsXcoJ0fRr7Oy3ulXb8cPkaCVXEYhAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0g/0nnKz7jYu/HpS1+6uMKNmuwpA7kwTSfzSnPHk6Ec=;
 b=dKp0JZYhHZT3aPANFKP6PqfIJKTq6W8Vr8wnWpwHUnpgg4/aVmI9VzrW9ABvnLmEpu1zui3vxarmhfgnpqpwMNWS4UjAMK7ZINcW/0qSKzJf/jWSVbY7kezkhlginXSzslx/IwTgRPpBoOovL4OUunn1PTQIq6yMbgHr7DjowE/XuEhEpASPtXDYuQXT+Wl87KtMfQpXD60S78ogi/aJdXUS6B5jkKedS7YbLnIAoRIavVpR16nWhHkJwZrCB/bKbNVI4JPlMp2SHhBXeNUPkZZvrqESNiG0mL4k4Bl+bf+dVQxMBC+C/SPtE902tCFZeoe+4gaTJJN+a12QLiiv3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0g/0nnKz7jYu/HpS1+6uMKNmuwpA7kwTSfzSnPHk6Ec=;
 b=b6RaNXWNts0KSNSQiIlPPjEGgfpRu1W45SuyiphaPww8wp1CyRHiDF43bNzmX2byR1etRZhL2pVVJdQYUX2UfWh+i4ImyN5A469A4pEzodaQtJVX14/MbSX80tRUE/32qlUJBnctt0ZCZhVBKlFPBUNut4tx3eV//Vd1/I+qZK4=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Mon, 21 Dec
 2020 09:38:34 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3676.033; Mon, 21 Dec 2020
 09:38:34 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH 4/8] remoteproc: imx_rproc: use devm_ioremap
Date:   Mon, 21 Dec 2020 18:06:28 +0800
Message-Id: <20201221100632.7197-5-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201221100632.7197-1-peng.fan@oss.nxp.com>
References: <20201221100632.7197-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR02CA0110.apcprd02.prod.outlook.com
 (2603:1096:4:92::26) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR02CA0110.apcprd02.prod.outlook.com (2603:1096:4:92::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend Transport; Mon, 21 Dec 2020 09:38:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b2407d5a-61c1-431f-31fc-08d8a5942f63
X-MS-TrafficTypeDiagnostic: DBBPR04MB7930:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB79307E00A444ADF641685132C9C00@DBBPR04MB7930.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ODcNQLrS4v9dCWdD6qpyhMEcfeAh2JiJaXP5ekCJAfSGy9kb3GLodQX91R32JlE0nWyTG+9ye2raItfBDfzMlv3wWNSYRn5DTDqCq1c7z45wpHgPtDuCMUZap5RCzHyWaC1GKF8gUVGyc8HBps8UfeznG8aSy7xbJJrkaJTncdiS16yDw4YhCpxcBsMw0ujMb8r2cBEVVpuqNWS1qBwKstDwAyCVGp1JPG25nftvbbP/4yKLjSfSq+ee6QnnuxXrRa0mZ1CE0oTMWRmq5MZFOMJoV0N4AiKGijIibxIOakuqGFHn6cFZTHWE+xAmDM/9qRuzonMk6G/ygkW5DySWr88pVX7+uLiTjqiEGc6sxRVim/gk5JblkOji03rdKBSPJfGZlrUxZ3U+/9w8vao4lg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(5660300002)(66946007)(478600001)(6486002)(66556008)(52116002)(66476007)(7416002)(83380400001)(8936002)(6506007)(6512007)(26005)(316002)(956004)(186003)(86362001)(1076003)(54906003)(16526019)(2906002)(8676002)(4326008)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4298zdrv0ggakF7NOCKSSz5ciwK1OxOrHOD4CLmmrKYkckq1JEwrzEUsNdc1?=
 =?us-ascii?Q?PChcpNJ2urxri33KwVolEZ1numWKGmQR0FCyIGTe0O+woS5JKdskhV7lRVjR?=
 =?us-ascii?Q?WWk0jrgvtxCbXhUb1BH+clodc9+t37EpUFNXmzzv/Luhwle3pgyOgQ4KoNdq?=
 =?us-ascii?Q?nMuK2M6o/GWplvGdW7OjSZxiGWhdTwfHlDlMywySi51TlTth6ixlLKw3POv+?=
 =?us-ascii?Q?EGIsZehA6AgtB2tr+oAhzP5+hInUdgg4wF4GmjZi5pB6ikWsg0TuAuQY0SQe?=
 =?us-ascii?Q?o0kCG3/ki2bZq8/duav5EBM1ez/B6L5eBZ+1MHt1G119pt11J1UNHcILJ2EP?=
 =?us-ascii?Q?646tR1AJhuPI8bv1LnDJs161s7Isuf+VcwvTHUIaFtbbLdxubcVbolI1b1Wc?=
 =?us-ascii?Q?B1zbQEzK6jC4HWlSTA0uZNApbkxcwmt1kjO6jwEfLczw7tW9JaAdHlvXwtEU?=
 =?us-ascii?Q?7hCvkRYi8yy1f0DjhBwYdWfDcRt6HwgWaTM+CkljV8eFTczRucdAtBoVDRL1?=
 =?us-ascii?Q?G7s8uzN+Q4trR40FPDMjd7pqjgsWmnPGOkQOWDXnJsjywUOWLV6KUp44zjN/?=
 =?us-ascii?Q?CDG8jsxzYXCcF5uxIXWIdlG+G3dQ6MI9IlNq2R/dsv/5wWMZvZqZFVFUrXzt?=
 =?us-ascii?Q?o64hBZe+S6Wcb7A6ALflAjlkRw8cFUS9hxAaqvjDkw2N4mdaC7trFcJa36VB?=
 =?us-ascii?Q?7slFv1daIatRTwb0JebiGAjcqCFAXU3NjrrOL4hHpMnI8plE36BRzcwF/e0K?=
 =?us-ascii?Q?QstxiI/8eWyM5FIKGG/FHO9AF6zt7vblD8EE2sM83T2Zi8Wom8vTkOEzsX1g?=
 =?us-ascii?Q?7I+zUN5AkaK+uYsDo26tgQMR9mnLXYj6q9dq+Xz3CUkth/zV1QiDkKLJSSEY?=
 =?us-ascii?Q?chpuDOs1+L/YkTzhLfmd6W1NMLjpz2u9ezKq0zvz20Klv08dqbOXCzqbVYJl?=
 =?us-ascii?Q?C2tizwBLDpRgUxv7mPgfMkokRB8sK5XO7JgxF8qdvSnlhR6PH7OCVBgFrhP9?=
 =?us-ascii?Q?wqkU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 09:38:33.9928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: b2407d5a-61c1-431f-31fc-08d8a5942f63
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLsU5Ho3L99vQ7eo/igT/JP4CTPjbV8dqO9pFeQ+zeQgyyiDbdn/CsKT3BHhhtvxcGbLLw0yrmHZFveQBhWL5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7930
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

V4:
 None

 drivers/remoteproc/imx_rproc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index fab772b02c9f..3915c7f5ac47 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -296,7 +296,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		if (b >= IMX7D_RPROC_MEM_MAX)
 			break;
 
-		priv->mem[b].cpu_addr = devm_ioremap_resource(&pdev->dev, &res);
+		/* Not use resource version, because we might share region */
+		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev, res.start, resource_size(&res));
 		if (IS_ERR(priv->mem[b].cpu_addr)) {
 			dev_err(dev, "failed to remap %pr \n", &res);
 			err = PTR_ERR(priv->mem[b].cpu_addr);
-- 
2.28.0

