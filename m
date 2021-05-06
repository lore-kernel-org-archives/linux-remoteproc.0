Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75718C43460
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 04:25:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56531613B4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 04:25:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232838AbhEFE0M (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 6 May 2021 00:26:12 -0400
Received: from mail-db8eur05on2044.outbound.protection.outlook.com ([40.107.20.44]:18528
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231407AbhEFE0K (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 6 May 2021 00:26:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrCnByhCrRj291bDpwePVWOaZS98+6ABNEevrettbqmKNvtUyoEgaZzIpKHk50qC+qT99b6QFcZK8hlZcl+rRjwy+3Ft1aaRjiMAGX7WtK0NCrC0kSBQvzpFhbyZHcW+//ZWeDgcGiZuQ/76+vzGk7OsUMKuvxJb3rmBLgeHvp4Mx620VBUyvLEAOxWIhP6jHt3macE+oAv5gD7VilDuvwnsnRYl0u2OEsyjzUDR8pJ/plJ9M6oSD/HMziac8DPRJ/ddvDXm9k6+pev0sXIU2EURQ8lSAvbQgIyPiRQ41d8R+/qUOGusgoQ/g1CWJLA5nLJy2GGsxSZkMw6Mcp+mUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wDT0/duqjnGCPE6YxdFm3Sn4kEIcN4Q2kRMEQCwybk=;
 b=lAzpaUR7HmaK/5w+kfJ+fbv0993YU9rjFhft7/AeCZwfMJlefpXtl/UpCq5KRW079AB/+GTCyxy8UF7wndyefa6/dtpAA/+qUpbPz6jqr5HYwFPPYnXKtMAwPgkpFAoLeboScE3BKiTztQ3cJ3uif6+Yps1LDYx6SjPmOcs4NwqU61qEwgvX4j+FyKbTosRCiALj8aNMnamnV1JwjW7b1cknX1EhDOUMCTilfxXv7zXzXffS6mGBSey6NYOwhex5FwDVgxmsxOctCH1rz19zUmAItQMYWmckb7Fsthj9uSiYYGE055msenJHxY5lsQexwdfSdda2QpHIss8JfWHobw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wDT0/duqjnGCPE6YxdFm3Sn4kEIcN4Q2kRMEQCwybk=;
 b=RerJKcX+iMEYDvtgN/ZbQBZaKkb49IGMKVIXKymQqw6VZlCWdz9+/mbQ+JbsGEBXxVZGvB1u4DT83MCNCZIPWqBaUIEhso83j4Fz31m5lQv56mvB07G/WjI2+PfxWvAgWv4lEv8hXSBIi1/4ZJtDn56yCbstS1LE882XPxylv2A=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR04MB3126.eurprd04.prod.outlook.com (2603:10a6:6:7::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20; Thu, 6 May 2021 04:25:10 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4065.039; Thu, 6 May 2021
 04:25:10 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V6 4/8] remoteproc: imx_rproc: parse fsl,auto-boot
Date:   Thu,  6 May 2021 12:08:39 +0800
Message-Id: <1620274123-1461-5-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620274123-1461-1-git-send-email-peng.fan@oss.nxp.com>
References: <1620274123-1461-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:54::19) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0055.apcprd02.prod.outlook.com (2603:1096:4:54::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 04:25:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b30aa26-d8e5-4302-803d-08d91046efa0
X-MS-TrafficTypeDiagnostic: DB6PR04MB3126:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB3126CE49F3DB8049B29FE84AC9589@DB6PR04MB3126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ws6vMwib5hkLRu1qMeoNHvsymMdCnRSyqhsUgCl4IkmoMR91aX+KM31hL+klvlPgxfrATTv2KCdvIV/DE7pcezT7b2c+OpyHscQ90JkvuWVUy6C0Ib+kRq9zATXHufSs2PhrvFRQSxp5s89fxUYzMBzC2iJWA5mtzIRetP8iA8y5pIqmbNHGKqlVkGh34ZOPkDCfxM47tnBH7dqKBpBuwakpDMfh/4aaWn7BNLbVW8d+vzEIAK6LIgaXb+6HX9mvA2AfcqhuXab6S1Yc3LXrId7RDC9SP5P2zMQbaoz1OvifQ8Tf+5tdwvefEH/ldZBGmRqAewdLEjfBLgNNfTCYLVsm36WB/HV+MDvACBeSFdJ+MVrZ58mC7j99yAX4/zJNKs4L3TPFt98vW/mlLGfR30gTODpp3G/SkEKnPIMB5WG0M1JwNBfkZM1qHDe/pCNCjJeMiRQ/Ba+E6RGgLXo+JBjIfz8tA1JDvXRbt76LoDuZ66YTBTLeKXuYGPN73US+2OsMiYUOi6WMtfQZlhX5wHLEbgAqJMH2NbC5AzzIdJj78GN+feyzz67byxbvUAv9bbfURZcAXghjjShmLJ1cYBzC/R345pcYRJH2s+I/1LKUl/nrqvqCKnFGk78sHGLIVfFBviH9NeO9IBZDCZs4+ewDyLS78oBE1Q6Op2qJ/90FwDrKh0fCEVy4HLZAGYO2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(136003)(396003)(376002)(346002)(26005)(38350700002)(52116002)(9686003)(2906002)(66946007)(6486002)(8676002)(6506007)(16526019)(7416002)(5660300002)(6512007)(38100700002)(186003)(478600001)(2616005)(316002)(6666004)(4744005)(86362001)(66476007)(66556008)(956004)(8936002)(4326008)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?tLNKpSdvD+KDH+Ft1uZSbeXOGGJRAc+TxXO73SQqgGi7LwjZcPJi4xxvHJWh?=
 =?us-ascii?Q?9rey7z2FpJETpOik9+XZv3zLhCpmkQ5q+sLO8Q7YfUjQpNkWlSOUJBcfDWmE?=
 =?us-ascii?Q?HmOIZ6T+c5Jl3TLnMr/nN/Hls3tPnM+WpbZ3TSOED+rrhIFlTh6u5eeZK1pq?=
 =?us-ascii?Q?oY/JFx8JETitWZY3CW9KQWF79JeTl8qbZe7IHsgXMXy7nAiI8ssZu/vJi7EL?=
 =?us-ascii?Q?xGwruJgrJp7AQLpqbL0nuypU0yysDcoK17WM/7Gab77Vfl8GbIcj+BprZNv0?=
 =?us-ascii?Q?gHvY9UwsNx7dbc6yppMw7GVY1OXt/+xyU7m6rf90zh1iY56opTxy7e5YkbKg?=
 =?us-ascii?Q?4Zfs5TYdlOzFeu3sO19NrkvLLJIGCCx6sWPi6fXJID+AFPgYlWxWMrHTRGYH?=
 =?us-ascii?Q?3cD2TDfGURV6COOtUcSR0VE8Z5aDN4pLXv1BhuqNcCUgoZqUCEhqMVmBIKf2?=
 =?us-ascii?Q?A15S9o/PYJv2rAZFal6My8vI7+ftjeRZmQQxXiCw7noJn8GqSGUPVuZEeY4a?=
 =?us-ascii?Q?+ylhF+Bunp2HV7HDPIUre+duEei+qTq5DLph6qf4dB/3OPIPlpa7K6RTov0a?=
 =?us-ascii?Q?6c1hUUOkbdE26BjvcdsHJTJEBcIbIblL9p6SWD3tOq+WhPfQSLjGRTZGTRbJ?=
 =?us-ascii?Q?7aIyHyHPHKO+DRnlfAOuVCauOUkOJkX++Wyp3j8p3Vf9RmMxZZ4NxFF7Bq//?=
 =?us-ascii?Q?ujwgh5QNh21TH5Q0+W0TOOGCPuHAa4yCWHgV8rg4u2Xu38tI22ixD7VLEOHY?=
 =?us-ascii?Q?HC9/qKnqYX8A9BvmhjHEj17ifHUenCXqYyvjd/1Jd9IayJy70FPdy63po4hB?=
 =?us-ascii?Q?lNUdFCreD2CMa310+/vgDYGguflQoXjQgPMPoSdwkDtsGyiemGYA4tc6rkFE?=
 =?us-ascii?Q?FmjJp7n+MPZ3zkWepBoZpiiIuo9i9x1llunsW1SqUV8ARn2zonQoSW1pvvsT?=
 =?us-ascii?Q?3JNQjKTbAO+ZQoXVwjjPIxRP3K9niEFdDY81QeTuvbFRVFWo417nPqWXkNDd?=
 =?us-ascii?Q?jlW2fR/fe3lfi1YjEhj6+bTZuQ7fwHVXnesvzTHDmNf5HzegwOi0Vd7vLJn4?=
 =?us-ascii?Q?XiEv5DItKDWcfmqzZ8DDhTn7vKNLOvGDCF8gUoqmiMLmKDNt3TX6agzR4nWk?=
 =?us-ascii?Q?ytJMGS6wvTn3GHvfAqXJOwxIZPTZ0KXNpfkWUVIB15ywt4r4fWMHY667Axia?=
 =?us-ascii?Q?U4wkDclfXYBIYk4r+cot/46B2WCQJBiiFaMKnHqNDmyjWKTuPJAEaNvrSdk9?=
 =?us-ascii?Q?TlZ0a638f87NEgMFEW6/mW5ByPFfFkx1PHLkAbq9SEW5NduVMpTnreqL36w2?=
 =?us-ascii?Q?fyfHDaO4GRiEcDyIHRy8O1AO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b30aa26-d8e5-4302-803d-08d91046efa0
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 04:25:10.6882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18qZ9emeqsgXyPhCgsgaI4KFat9BWe9Zm1r/yUBKdK7XaZRIHu70ow4bxibvUtG/e9QHECF6iTBUs60dr2Qr8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3126
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Parse fsl,auto-boot to indicate whether need remoteproc framework
auto boot or not.

When remote processor is booted before Linux Kernel up, do not parse
fsl,auto-boot, so only need to parse the property when rproc state is
RPROC_DETACHED.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/imx_rproc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index d6338872c6db..06dac92e98e6 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -654,6 +654,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
 
+	if (rproc->state != RPROC_DETACHED)
+		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
+
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
-- 
2.30.0

