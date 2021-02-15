Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EFF8C433DB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 12:50:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 299E164DDA
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 12:50:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbhBOMtn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 15 Feb 2021 07:49:43 -0500
Received: from mail-eopbgr30043.outbound.protection.outlook.com ([40.107.3.43]:4416
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229913AbhBOMso (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 15 Feb 2021 07:48:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icR3NYMRVn6fRhl36xLXUaSJiNkMbNER7BKJuThPZpKbLfABpaPrqMsYQ4x9wRnSk4YgdQ99TTiLRkuOLEQuSVcPTMv4pNlhbRSO7q36x+SHaTgs9TbjzhTLLNuE0gFeX4QIbkV/+qQKMiEVKYB7YX1M0EKeq7WYneZuqogxnx47hoXhVPlZ47EIbIgd1bqUFlesATfxC7rqKJViqbI3faTzbk/9ce+CZ79qLTgbfAoGISY/RuPb+7uIbT42pJ5bPWQdmh4MZODStDcFqT5zJJCZp0GJT5pJWAKfLUeXetPvBFc9oHNhcZsci+d6QixXHWhBwk7+DqtEZra0keV7VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EM9JIC+yeL3C9WIVZhyYz0R6U9vBvka5aiesdeAvSbw=;
 b=Lh1ieTqHFgxcztTTSbOQ93NvE4b1MFpkOvoAPU2Ja4aMfR5EOGgeBzgiGn+y9jiottWFRcAU55o3dEwVXm+3oiifdFBAN8kuQYJN9oTCWwepMojD9mThNIt9Ne8SCrrS7e+oSqi8Xt/oGhDMKeOT9zkqqcyHlORwgbjkxJNyNj71YcHMgYKpYy5vOPfJhaCdW1b6C77UCBfJiqaEhFCob9QgM9jpjtsZm6QHFfrqi/2FUq1lD9xqmV/M5pt7cquPYS327NYpjni/rLZTnxdCwNXXyG+FouOM5KMIWCJGBmqeCS/g6nitUsVsvt28Hadgy7D/9K/qG4apRFZ3mLWXEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EM9JIC+yeL3C9WIVZhyYz0R6U9vBvka5aiesdeAvSbw=;
 b=VmNEkzfSog2jIJXYcHF8u8HFfHwdNROidYfNMQoWnPhtmmSQKlc3GMA9H05EBtMxxfADixcI6007inw2PzvBFVui3XJDQIAcv3uT+ui3LpWg5JE2DjLIuHj5KzfJSH8QKofyJkn1Nu+Bz3gflo0hPx1JeeCfgDouKJcq8xuJFvc=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4091.eurprd04.prod.outlook.com (2603:10a6:5:1e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Mon, 15 Feb
 2021 12:46:49 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.027; Mon, 15 Feb 2021
 12:46:49 +0000
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
Date:   Mon, 15 Feb 2021 20:34:18 +0800
Message-Id: <1613392463-9676-6-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613392463-9676-1-git-send-email-peng.fan@oss.nxp.com>
References: <1613392463-9676-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0302CA0019.apcprd03.prod.outlook.com
 (2603:1096:3:2::29) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0302CA0019.apcprd03.prod.outlook.com (2603:1096:3:2::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3868.12 via Frontend Transport; Mon, 15 Feb 2021 12:46:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7389bac4-83e4-4fe0-e6ea-08d8d1afc30f
X-MS-TrafficTypeDiagnostic: DB7PR04MB4091:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4091286AAEDA202A2AC19991C9889@DB7PR04MB4091.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dpKtsm65esLP+/NsU5zhJQo2hEevZdJbBz8Nqnh1PryIzxXT/z38s2dLXA00IRfTcQqbPqsQXiON21VYeXiLxr5YemUUKVcRECcAGHxzJxaUQlscODTRyHSqHl6A8k6epevxbN6sjnJZnse3HZget5I5xiuCi47gzmXmNUt9BVZtZyoB6NF1jgwPG8Mqaq4qxbVLMdHKkdP3DHamO2ijmiWNkTBoLipP/+8HF33pcSTQRiwakJbm6/crKi3RbaoVWyP+IO9Q/76erM1zWfAuP9WpYhTJ7X/jAyDdQzlvVp2crXs9UHi5hcaRtloj/6vvHHPtWdXXP0BqEWnVWuZ+KQfPEpmBsHzCBbflLlhzuR6t0WZ0kkbeflrD/m3s+7EppCfH+tTYiUJfgRuzEENlgnFeXqdM4HtsOjrYmCX7EHrM5+robussv1zBUYnj/OBjK5qMFE2V0uzxN+Q8B33fOsFdfVFf32zmKcTBrJS1Ys9K6TdSuXvbQ3Z++OZn5WcBuM8rRNDBDZ5tTo/SM8Ct9qz0qceXSqm0iWbaEFLu8GorTygTrRHlopF8YZdEFY8zEefUe+0MFqJ/1h3MMdZQ8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(26005)(6486002)(9686003)(478600001)(316002)(186003)(52116002)(6512007)(2906002)(16526019)(15650500001)(4326008)(6506007)(8936002)(2616005)(956004)(7416002)(86362001)(66476007)(66946007)(66556008)(69590400012)(5660300002)(6666004)(8676002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?T85DrJf+pR9AAi03ctyL0akzLzTp7m1YSbNF44FNnRzyw4BCxdPwuqrgjedn?=
 =?us-ascii?Q?oLsS0xDtqpkX3ZQSLZ2EQNsM/Wgni75X6I82Xm2HykU1ccjWMFdvd/GibaST?=
 =?us-ascii?Q?mEWNmG9FvdEiQbhRmq4oT3H3TK/r+p04BXRkmBqknRy8Y3LHrSf+FscDt6h1?=
 =?us-ascii?Q?GWZotbhRaGJhsIkK+b9pGsg/Wp2WhVtPItHnKYpnzsN8s6uYvVaFZ7FhUngi?=
 =?us-ascii?Q?eWLoP2jWDOMp03V61MDt7yG09ihCJnO8FMLFEEKO/SuN4Z1O9HtABx+ci6x5?=
 =?us-ascii?Q?PVa/VXD3+86MJn81VB4XyO9QoxOLa22V4u8Wpte/3Ti8/zJklHwM5BKiCZm3?=
 =?us-ascii?Q?aQpAFF5EW103Jdtt0uyyHckxXvEKk5e+9cjj4yn7gbFVnZsE12st1mMr9cGK?=
 =?us-ascii?Q?X10AvahVACj/Ln5d3ZEBg1CQD79Y2AD4o7/q3yP+QoC4YD80Ub9BBsHFgbuh?=
 =?us-ascii?Q?yB4qEUwFzG7jD6GCBuP42qYUsunqf6EUo4cfiyy6eP2KPeUX+hfe7E1Pfqta?=
 =?us-ascii?Q?ORKgHJytMrwmPt4CqSKdTlG6ZqU7jdkh8j/Zf9e0hY5BVoH0E70Vqce6m9Sp?=
 =?us-ascii?Q?WcungECi/NPvdX9daPhrMMbq/6atkOgYZJsjOZuWlfuL1xCtKJpW9KCax9oc?=
 =?us-ascii?Q?bZrjW6sKKcBGfV4UVH3XgDT0uFH7lEevtnmwF2o0+HhVce9JRWQER1S+NruN?=
 =?us-ascii?Q?xuELhylkjbGo9IBym8Ee7we33U3xTp44zYyU3z86pFilG1RkSfPCTuRT4gHX?=
 =?us-ascii?Q?ZUUUKDW6fmFW95o+licIQgsAQJtrSJzISPiqkBdIJzzVJ+kECrMoJ7B5+bA3?=
 =?us-ascii?Q?pffSRC4mbvaItRfBC/o6eJ3AgqlShyq5eFshX9/rma+2PipUZar0E0xuBclE?=
 =?us-ascii?Q?cw/UFDYucdnn4U3bGASHAWzdFcEuxI2mWxWyrFiAUQs9VslPLPUGd9d8cDQo?=
 =?us-ascii?Q?ZddjDYk7JD7QyxAw5JEzQIThYN3hQbl6/CFZB9uAmYMbENskmIwiMmlICC1E?=
 =?us-ascii?Q?E/MPh1cjTYEeXO18o+aVH6+WwDj3oCId6xq8Izj0qaeiQ00SbNd/AOpMbOnv?=
 =?us-ascii?Q?ceeNYy2V8owHXoGW6id7TAVLFVWGlHxB4nxZf2O8LoxYnCTvt5vcqJCeTTyG?=
 =?us-ascii?Q?446Fp4gxpcGz3FbHh8QZBOW/VKEAdJxW/yA3sTEejyHS9kBbDkDxmuJo62EV?=
 =?us-ascii?Q?w/HJ3FKppIg8sXYupsWz2xB2FQCgFJUVmKok74RRfTMLegDP+eKHKw7vJ7WR?=
 =?us-ascii?Q?1IYcHV5WOXSiR5NeR3uJSDyhGV44eU0EW5ZUZSnZkxFivI6P1lrcy1GeYK1s?=
 =?us-ascii?Q?fK7xDmSrtcfh+Mrzvs89YoUa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7389bac4-83e4-4fe0-e6ea-08d8d1afc30f
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 12:46:49.9194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1GvwxalZg9PNnKIVDTwrW/NJdOgxlkBwrmg3gjDDpxBc+ODwbvgBXW6XVGmYfPUI8SB/T/nXydbbZDG+DT/a7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4091
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

