Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D91C43381
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 09:50:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7407E230FD
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 09:50:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391167AbhALJuh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Jan 2021 04:50:37 -0500
Received: from mail-eopbgr140079.outbound.protection.outlook.com ([40.107.14.79]:47086
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387627AbhALJug (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Jan 2021 04:50:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0kT7VcXKc2ygRBfowmgGTIhH2z+CJH94tpKClVTEthYmizhP1Qg0lHRXml3/mhNQhOgC9pV7mmHScnyzauq0qclXasyYFlCSfju++gyKii0UsMOFPjxwbFwTWn0Un1s3TQBchVk9GC0Y/tkOkfVmunl0t3qHVYvryIiFXf+/ibD2P0p9qokTiXFixe1KqlggrUF/gB2T+qf+g0VTyie2ubr+KqSrWzmjrrg4gxBsvm/gd18+RxCvN4rQHeA1aomrIawZRUXCdqF6/EG49XK54HUPl55MOE1geM0gsBBpCljxSOaqnJKZCpWIn06MqY4udUhPPILDBzrUgaoiTLoYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUws0LWJubfkCKMzVE2OTCjjcSiV+Eg0XmEBW9PbJ4c=;
 b=AAR7LadkbNbpucFVFk4LSYdI2Rgk8UmpklsAfsyokxZ4B8DQRudXOAZfwe5AbiFrpnDzHDmR0y0XWkPliB5mXEYx1hfQtGH5W5qfRUiB0aNypa4dIHWY5NSjC1yyd595kVw2SKZbHX30EBR1c9UBbYSDrcH4dkwwokdiK9AxbZ7rIWhU6UYskGsg1mkbczQuHEawH9LL2BeCeEOJxOh6wpbAmcXMskqAgUH6O5bXlctUJpHjBBG0+4GZiAqOtw6LSA/LvhJYbhV0LfQPRhDJxXwjJ4IziHvGFzO0ebd1OilJNtpWNwCjmLHqYrKmPguUxsaVEEWHccM9fkXE9D7G0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUws0LWJubfkCKMzVE2OTCjjcSiV+Eg0XmEBW9PbJ4c=;
 b=AOjnW2NvOmHRzd34PmoJ/q9l2hvUkuFUh1LId8MxR131UXxSyhwSbKMx1WOtx5131w9J0t1FOpbV/bJDB4g8KpvQvi11gmVCq7PmLKMxktW/X8d5230/BieD7kjpZf/BFgSZAZiBK3EZIjP6W+dgjZQRTtb+CTyMK3QZETbqMtc=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB6025.eurprd04.prod.outlook.com (2603:10a6:10:cf::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 09:49:46 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 09:49:46 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V6 05/10] remoteproc: imx_rproc: correct err message
Date:   Tue, 12 Jan 2021 17:39:14 +0800
Message-Id: <1610444359-1857-6-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610444359-1857-1-git-send-email-peng.fan@nxp.com>
References: <1610444359-1857-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0212.apcprd06.prod.outlook.com
 (2603:1096:4:68::20) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0212.apcprd06.prod.outlook.com (2603:1096:4:68::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 09:49:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b87b5ad2-0055-4215-b1cd-08d8b6df652b
X-MS-TrafficTypeDiagnostic: DBBPR04MB6025:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB6025DD1BDFC9BE1B826BDA8B88AA0@DBBPR04MB6025.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EDLQVm5DruampIkAmA9M1p4qBBZfAEIMBP0WFBnFOfjkjQqfqmFfNIWVQrYtOrvI0dWVH0Fbh/Zs6qYHOw7PuDCU8k8rqTcLBJrbfx4H1KkJIGYYvITFT6FYrB0T9+tPCiD0EJBA7rR5EwwEOT9slMDmm7QWJ427Uq7D4Y3twiI4w8x6aEEHo2b302who698s0AQA2KjsByz1wdwAZAK7YdYIJWEH5gAUt6qPw51FDrPSBu7gF4XyxErQMOSU30Z40p0ief1ZOW/4JDSmHA7BuTfwD4wBHZNhiwGFwnzBkUB8MAXZqdiKwJgS44N+Bgf0pTbymGlBPOl7j7SlmMPlGMnnZ7pJKpcockdP1DVI3arV1QnJmeuQW0sSf4t3lPVXHflEVhPIhJsuGfJpqhON2WGchUCER89bU7ZVxkOhUGXFcmFbKoUkdcnMJma+xL6Wi+zAx/HBeg1Zgh4MQarqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(498600001)(6512007)(7416002)(6666004)(9686003)(15650500001)(69590400011)(66476007)(86362001)(6486002)(8676002)(83380400001)(8936002)(2906002)(66556008)(956004)(2616005)(66946007)(52116002)(5660300002)(6506007)(26005)(186003)(36756003)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1gYtMI+slicDeb5UuixIhgVVkowyDl5wTSvs25GgJtckyNPIt707UCWOGE4R?=
 =?us-ascii?Q?15zWtRi5I5qoZ7Yb3RkwuMhieYL7wuYys/eml3bDKZXFeQ6lefJ8YMeIp1BB?=
 =?us-ascii?Q?71p0yLNGNXM+tKomPz1hf9EUjKeiH5wODBHg88238e2S3DMn6X0SRnoCQcD4?=
 =?us-ascii?Q?7+SEMB4G6m5OpeAQRPyzDZnK+QOln77+RR5He2wUdFtrAsNFwMZFCVwvbqOT?=
 =?us-ascii?Q?irqKULZVrVL6nHu3/6kuBMS26asE2Hdz8PERNPpf+bXgaxCXuGYkHZ0vzTe0?=
 =?us-ascii?Q?7+GAiINk54n90JQ6FxOLbfrp52QiQRokQW+A1C3kjuQZptw8nj5SFsIpLx2s?=
 =?us-ascii?Q?Q/rYkdDTNHU/Tc7yU4HtpO93owE5TgRCnAYKyaODcL8YPSP+TDnY3UBzma0w?=
 =?us-ascii?Q?NayRcibLiOMyY70lx3bIyMGjN/PWmrk2+ZI+qvOaOh5a2+OBj0NpFbwm9II8?=
 =?us-ascii?Q?cgXJ393lzUWrM197GRMyvxIhEsX+KhmijYfiMZBxxK1SpCL0li1ay5sQQcgU?=
 =?us-ascii?Q?j6VexhQEUD/kxfrWdg5LQDlwzOeEuGmZO19TTVW78YgfxrHkcvYHZmT2ftxk?=
 =?us-ascii?Q?OQz7+DGFIEA9fu94CZKUCg1bscswzkvV+pMU5hBPvvdnLbEc+1r9qymFdmRY?=
 =?us-ascii?Q?aoubGvMU1/BAVJD9FoTc7wL+5DD3JBERl2JKUyRda64gotbg4qnz2JxrkzYg?=
 =?us-ascii?Q?ZkLsore22yH0aIAKW2gnmqP/89gGvLqBgZ0kP0EnDF5Blj5dW0wa0wQNyLfa?=
 =?us-ascii?Q?QyilHWsmiTeZCqlfaK7FNw6menNH3M+NAZCI67kzcepskGjVu4w8eTm5+DfS?=
 =?us-ascii?Q?7OKwuOL+x9PX39xewgRQTtYtFqH5I0nhY27hEEhyPzMQMsFfivQCbUtiu+F9?=
 =?us-ascii?Q?IJH2ksTe4gOnUoRCNC0zQoZhq/JCQZnDyHTjjLB4HdwAumh6E6MfBgA1ZeLU?=
 =?us-ascii?Q?D62CGzJ/1Cjbue9KQdKhgipI62pgyI/0pY6uj2p4HIAa2cIl5nKSnT8HCPKL?=
 =?us-ascii?Q?X+Yw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 09:49:46.2870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: b87b5ad2-0055-4215-b1cd-08d8b6df652b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3hHP4NW5Ga22zyHwwwShrXThhglasXC7mU+6r4lKkda5Akb/V+S7nBfL35w/a6N9EEzn7MIzS6/6/HFcDrEvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6025
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

It is using devm_ioremap, so not devm_ioremap_resource. Correct
the error message and print out sa/size.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
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

