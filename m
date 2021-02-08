Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3A7C433E6
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Feb 2021 09:13:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8706864EA7
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Feb 2021 09:13:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231348AbhBHJMi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Feb 2021 04:12:38 -0500
Received: from mail-am6eur05on2066.outbound.protection.outlook.com ([40.107.22.66]:55553
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231357AbhBHJLJ (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Feb 2021 04:11:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqsED9l+8bP9lvJesTFzaZgMyyZIUEEbqrJqTZvkPCDme9ONkbm08P4n91Ky5YEbCjWJd1n4WoYm/3MQYLNETmDu18dH0Z9a6u3LMT4HDQCQ8Gx3hKHPeW7b5JkXCKuAVs0GtuQdQymJytxamFg0Fr209s1KqAcgFZi3zdc1NMd0+iICbx1a2J9GZStGr4NG5emjwkin3lS0fV31laJISmOy4WaZMFKRW/FVWtcy44sQ36I/l9FtrlaYBrEZu/iRhek6R0i+IHufrDfpM5vn15DyX+QiG5/H2kMd6ODgoysn2awdAHnsTtc/9sSN7GZJfE8BN6L0E5qjpVU85v2H0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EM9JIC+yeL3C9WIVZhyYz0R6U9vBvka5aiesdeAvSbw=;
 b=fTRglU7/tt6GAdQ1ecgafyduDWs0uMULEvE9zvpyk6udSqMU0dpkHdXyWK+8qSqYfPbuIikBgy5y48INjB4rEk1lFCX4mc0N2YLOfpURZ7hEXwGYpjj+KwhaSHw8yaOFfWSOtliB0K7zJURxp00TK027lgvAZYEzXNS4SK/6aT+xMaTrRjuAsPuWvoiVX5EaNqiA/HyX7wcC91YULKwSDbBwZRfL/x/hov1Vssi6JlXxBM9HP7VCRaQektjR0ABnIthVpUXVjFiU7lWij+wbrG7dYtvfnezEabMP92NdJCkF3RSpDRJahvjbULE0BcYZKS6Od9P1Tubcipjuk80j0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EM9JIC+yeL3C9WIVZhyYz0R6U9vBvka5aiesdeAvSbw=;
 b=G2M51jGfuolFVBRSWmkJWXh/V3hsVPMPwpZZ3yxB/z1NMBpMRr0xw/LqHCnurqNa/Ic1reoB54XX03ZETnePMea1saloaDaSwOJaakZWWiNrqik9x8Mivd+XgO5LpQF4J4Lf1MbYFIBLGN7AN5ItGmJOoi9CJFCHv/7AfEpErFE=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2933.eurprd04.prod.outlook.com (2603:10a6:4:9c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 09:08:07 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 09:08:06 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V10 05/10] remoteproc: imx_rproc: correct err message
Date:   Mon,  8 Feb 2021 16:56:06 +0800
Message-Id: <1612774571-6134-6-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612774571-6134-1-git-send-email-peng.fan@oss.nxp.com>
References: <1612774571-6134-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0102.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::28) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0102.apcprd01.prod.exchangelabs.com (2603:1096:3:15::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3825.19 via Frontend Transport; Mon, 8 Feb 2021 09:08:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7fdb868f-0716-498e-f54a-08d8cc110c47
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2933:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0402MB293304FB64D0E644311837F7C98F9@DB6PR0402MB2933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nT+B8t9U4xskGficnidSUwVDo13ZQWYDmOIV1uKy3ap+8PAI3Q6m+n2GXXoxdkxOlK/FJTnzLKfi+ytV4hEnKSzQeOrQI/oi201U4tNBUxNgSTi0jHOX2A+XgC1o8tB76jSMrJZuAOYzJVKNWneReAhGdtZTD/K4gngHcHXGWdMDqsSxl7xF45uX0pRvv/Bxq+VwhXn90OqE29MEjU3SfEfIDHCOmLuzREiOcbp3diFzAyfZMv9JipNS26et+dIHuXD7lq781boRs7EsSZSRysI+Sz3Yp7zXuWKtHvQ3Nozgb2W5AUcWQmwZJyrBDns3FfODp2toCjWAIrIlzqvmNx4RKmt/H0NNQqsXxJQuCzBfPkvQqZ3DmS1umMPrWH5SqFmPHNse5XyLPvPm3aBDeU8/w6uM2zsZzv5PC3rKjNo1Z6jlN0LiRCFocZ0+54nmN3/BgHWXXLgMzMkKuVVp+TiHC6kB3Zs4KEsu54pgMDx8z0pxKnKVjov8q3Ln/rTrFtrj7Uz7jTd4gVDYra86KlZwuXFfzv36zgxonDZL//bOu9HHQH2i+/KL/6rGjHFNCErxeI01vdQ6N2RcTN3S5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(7416002)(52116002)(316002)(83380400001)(4326008)(8936002)(15650500001)(186003)(69590400011)(86362001)(66946007)(6486002)(8676002)(6512007)(478600001)(6506007)(26005)(956004)(2616005)(5660300002)(16526019)(66476007)(66556008)(2906002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Xq2csf/fVtUY3KASYbNNfOm098M8Qk5BTnqO07PaSAKAzxqsk3nFtZ1ntrH+?=
 =?us-ascii?Q?nUb0CWu8gqeIFmolgcLfCyGDSPjWCD8AgNfbkSBtpevtXfGD6LySZWsLzM9M?=
 =?us-ascii?Q?q8q0wnoIo3+My0Ws7MYuCHubbouZpA2vxFhq5ZOJyGo7jw+UAPpisooI6AQ3?=
 =?us-ascii?Q?96uo8Y4rU8odrIr9ug0NV6VdydtjiIpZLNqm/bLlSA9eyqd1xnIx3+R889zq?=
 =?us-ascii?Q?88O5EdunuFJsVuk9/CFEdGoTnRO5rF90jCcisbTXDLsGAe3xOnmudWB5h9i2?=
 =?us-ascii?Q?xB24qnsticN0rUY8+wGibuCIKPmhojx9a3iAtE83AhksbIpzIKp0jnD8NNaf?=
 =?us-ascii?Q?8ZmDLu+9hcxDaduem0IDMPqLhbcQ5b2jaIrNNPm9tcWWBtLvrhEbMOO8dpHV?=
 =?us-ascii?Q?/gH5RLNwNC4Pwqdo0o7Np/9aN7U968ZbtxyHlBuv2yVObxG1MHKhb+teBtFL?=
 =?us-ascii?Q?7MMZ46S9VlRMfsjbrptmBy1bPbGRRm88BYLYRjKiOYL1s/ghaeNdmSswCvas?=
 =?us-ascii?Q?TT9DXUZNfGiRAFR0/z7o4NgCmucutcJAaIi7QXys8y/u4+2JwNaGv9AUTSTA?=
 =?us-ascii?Q?WZ9cg1bY2dQQ92GIWuFdHEdccGFG7eewHA16GEvarpL2cPqB2YGrFvncIDs6?=
 =?us-ascii?Q?IvxKwYBFWcaIR3kZHXgl+4daeIYgPOLsL1iIdVLsztvKVNMMCLt4Vj2YqrED?=
 =?us-ascii?Q?RkTXweUeQkCb3AMOlzWXOr/xX3HUIGUBwma20hIEtMu4fdDoKyaqMKWxVw+V?=
 =?us-ascii?Q?yGSl+euQ90YSNDmOrgJocDgIvUo++q1AAuvvom16+zkD4+qNKb9Ie57d9pul?=
 =?us-ascii?Q?cZ/225ZlRa7DmInwS79M0c4EIIw+blCdDqMmJf//F4TO6Z2L4egcwPFucLga?=
 =?us-ascii?Q?p5tVbLNWjt1P+7b7jQWrJGfU1yOEkhDzhZlXbDUopd3qhHVoqJcUUmSMITDI?=
 =?us-ascii?Q?JO6/yzz6Gt5sTaqnaUYeg5Dg86PNdZlg0E51htYqAWpgF9adVhlA02jzGmoI?=
 =?us-ascii?Q?SMufl+cPNNammJO46+N7LBBASrzUnghfWE04VEiMghmG4JkzWPBKowWM1LIz?=
 =?us-ascii?Q?q8ewjotRQCAkPCIhViZAb86ceqgQx6wR5LOD4wvH/UXIchL5IAZqW5t9DYba?=
 =?us-ascii?Q?6IItu7PvgJ1ubvhLqWgAidWgk8m10rlFwhro+rmJtrEt+ga2/5d2vfuz9oCw?=
 =?us-ascii?Q?5Bl2QAwYF1dCV2rI+4XwnB6qeJcvuljmRwkKj7umNhnLtgcXpe+IXEoGuVup?=
 =?us-ascii?Q?0rasTgS6iKhNJnSD+pBjQ24SX6OopoKLV/ivjPv6B9uKd6B1An9ASJjB4vH0?=
 =?us-ascii?Q?1rXMPsUKsZyqx7VNvG5wMh6d?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fdb868f-0716-498e-f54a-08d8cc110c47
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 09:08:06.9086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fx958f23YhFm3/L/mxOr53YSmjUSXEZxvjC8A+fnTns2t4EOwMG6AO72bORHPRWIu6zFT6GuQ8QjgAFwxBbqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2933
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

