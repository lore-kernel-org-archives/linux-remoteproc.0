Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FD0C4361B
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Dec 2020 07:14:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B07320639
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Dec 2020 07:14:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728650AbgLDHOW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Dec 2020 02:14:22 -0500
Received: from mail-eopbgr60075.outbound.protection.outlook.com ([40.107.6.75]:2951
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728649AbgLDHOV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Dec 2020 02:14:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrKKckrWq0B7KUQBO/VC53k90YeEaseaBmm/6ijf5WWgzIgSRJ0KS1xtKKRABbaBtfz9iQkKHF87qsaoCIgCQhG+4XDyac8H0C3Y0mhrnfEhgL7fFVljQc5SxD6EbRmFAUpxW6L3LjgIQQwSpIdZil/Q3q3kO26y/LWMh30jlNO1ptbguFhCY6zVPObHs1PeV8FAQbK4xePIFjfxN4AmWNpu0PBdPlBK1uM9jCjx06Lm5mD+lIqvKJIK6N7plCHVzsojSUqsjht48agBdQeaa7YNCttQaAOsfm9AuILEI4AqOW5EJjTYXjmtw+r4M/HufZ585vaXAiUngBdsB7WTug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wU4Vb0VtFqPKNwGdl7EKJrfBvjjO5DZcDzgxF4eckHQ=;
 b=WpWN3TuRy5Lo73g6/8VSCmmwxEiNrZg9QLSi0yf7IqVH+dWWvqRFkJvHtLZrNIRjPvhw7N98tO5OZkGdCUAonclBJKWS7GWoms/vVKmFsKDBmMTym4kAzQEz/u+HykLLevIkA1f3rDdmhY3RQKqP+mnl+MAE3eECmXyGNIO9aqP5JEFiqxFG7JHVBXfOk6/ehnsg2dbBsKuLEbyYpOxxaLJ0EQIcrwlyKCcYYfxyyZlMKFDsxZcO9PZCJcEh5HOEiJ329ZrCxvYihwZPHMyzS/CrLmW5zNt+ECOxMaog+jQzXVVGp0dAfyXjXJRs45BHlXdIX6pS77Ry1cwsMik+NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wU4Vb0VtFqPKNwGdl7EKJrfBvjjO5DZcDzgxF4eckHQ=;
 b=PnNLnxFaz7EGaJrz/wa/Yrj+UAXei3gULJltDGULxFJs3bRokabtKoT1bDo7VrfLevojEXUwlDR95xLASJAqDcYwy2Nq7uxhUJ2ky/o2L5bB+SkApjIFJ33OiJHgjNMt0FUFQeL4sVKS5JoUX/7MU3lAuab0a4tqK/IQrpO+x20=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Fri, 4 Dec
 2020 07:13:01 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3632.018; Fri, 4 Dec 2020
 07:13:00 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH V3 3/7] remoteproc: imx_rproc: correct err message
Date:   Fri,  4 Dec 2020 15:40:32 +0800
Message-Id: <20201204074036.23870-4-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201204074036.23870-1-peng.fan@oss.nxp.com>
References: <20201204074036.23870-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: MAXPR0101CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::31) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by MAXPR0101CA0069.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Fri, 4 Dec 2020 07:12:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 58ab7108-f91f-46e3-b5f6-08d8982408ba
X-MS-TrafficTypeDiagnostic: DB7PR04MB4633:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4633C5DBC6EBDAC76CFA42C0C9F10@DB7PR04MB4633.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gk67HStydzqoeHt2vzfUNHLw3Jt6EWWgFaDwj/FMAVv0IIhfEiD84kP4A/r4lwJekiy6bLJDXjcjj8R7eXC7UFcg6xf1HJ000ogckEvXso9c3Gz1fU7bBJNsRVdsvAplCbFjgO6g88X34dx/jIZ4Ey3o6NAhfU468kNAEIcBRiLW1BYDXRdDdeBdqz/ZlSb6LiJVDqsmY6/R9uq1zbspOczHmqvKJ/eNv8DStjQbnRTVlV6gwS/t8Q0ydzUKUFlQVFoMhFe3clDOW8KVoVWsCnEA0KYLqFjNXV6dMZW73HEScIPQIuIugAiYBqbno+QO+Z1XUOaCsCQ3uXInilOXpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(2616005)(86362001)(52116002)(6512007)(7416002)(1076003)(83380400001)(15650500001)(66946007)(66556008)(66476007)(478600001)(316002)(186003)(16526019)(8676002)(956004)(54906003)(4744005)(6666004)(6506007)(2906002)(26005)(6486002)(8936002)(4326008)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Bai6SbGB+VduOcCrppePoWM0WYPDMazRzM+Q8PMZPoprA8icejGdbvzWdl+X?=
 =?us-ascii?Q?YTD7DIks4VYoRlla2DCLtCT6vnCdBAGhkUN4qw9bLO2YgiofjuY6hHWUWguk?=
 =?us-ascii?Q?2KSoq9lM+JDVEPINC8AOL0WMhKWpn2MN61X+Le1crwmD7ywq9JULk5YTyAIF?=
 =?us-ascii?Q?dLO90MaCmhmrIO/IZxL1iZ2iXsGF595G7zLUYpat7h/D+6tKQncvwYiGBzDA?=
 =?us-ascii?Q?a9e/G89WKpVoev2GgfdgufFnvbvboclWubaRYK72nQi8jdEZYmwguDKMVqOh?=
 =?us-ascii?Q?EuA4ZPemwOQso7awxFdPUcXRe2FgafSGbeOH2nmN1rbjWOV2pBZvDmPdXO23?=
 =?us-ascii?Q?ddqbyM0jCuzY4GQwYqeCpvAB6Itx82fynu1r3eXDxAGyOVsvriuXEUXzdLHv?=
 =?us-ascii?Q?N7yT0oVixUTdlcG80cKIpTwBVqNUC8Jyi67RYdrRpg1KPKi8IgYaZJS2I9zd?=
 =?us-ascii?Q?d2UtCc+AVG26HfWbDu70GApxduLbHZ/8NXXitozhTEQtGEHMn5N9bS48rz5P?=
 =?us-ascii?Q?NB64rg2Qy9nz4+OQ7e3VzDNLBPi1Yd2Ail+P/zHTwBqvU/afZAj8pKcI2Tuy?=
 =?us-ascii?Q?lPdqThpvMvunOw99UapUpuZ+HErWniM6gIT0BNwTTbtE9BNVW9vdRYgYJdzU?=
 =?us-ascii?Q?14ebzHj1JH9PneaSvRlZNUaT6xe9NWycxGZlY/rTuIzXJmdpK73BHB/kfX1q?=
 =?us-ascii?Q?2XV47hAxq/fYMcIyvIZ+isAcSaHwt2c4S7zQ08fz8v56tCUn0rH3s+ov+i8k?=
 =?us-ascii?Q?dBi++KXcmWe3wU0q70OpzAnoQoEHtW8bvKHGJM5iV81MfckCV/txEEPcSBC4?=
 =?us-ascii?Q?vhgfeOMbJSsd7wB+yUrk0B+lrWhFmQ+r7CPgC2AsjzOJrwY1rFbrbjqntSz9?=
 =?us-ascii?Q?WJbxF/ggDsNXT8QWBao0nuJZriL/hnt5JYvYYrtrpHLAF57rfnDM6gW/P04Q?=
 =?us-ascii?Q?cjvbFq3w5MsRp1sENpGL4JOrz5/lBPD5LNRemEmtGDfAOsjKZBUds66a4EsD?=
 =?us-ascii?Q?HPWU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ab7108-f91f-46e3-b5f6-08d8982408ba
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 07:13:00.9232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GBat6OMxqwJe6o9JUrD5WV/j/2cVaWEI1vNBmeIB0FhZpdQoA4Po2lgdPXTr9UrMWWMHYKXGe5NH34Q8Yxm9vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

It is using devm_ioremap, so not devm_ioremap_resource. Correct
the error message and print out sa/size.

Acked-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index d1abb253b499..aa5fbd0c7768 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -270,7 +270,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
 						     att->sa, att->size);
 		if (!priv->mem[b].cpu_addr) {
-			dev_err(dev, "devm_ioremap_resource failed\n");
+			dev_err(dev, "devm_ioremap failed\n");
 			return -ENOMEM;
 		}
 		priv->mem[b].sys_addr = att->sa;
-- 
2.28.0

