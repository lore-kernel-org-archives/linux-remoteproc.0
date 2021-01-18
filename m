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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B4AC433E6
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jan 2021 13:27:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E957221ED
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jan 2021 13:27:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391581AbhARN1i (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Jan 2021 08:27:38 -0500
Received: from mail-vi1eur05on2055.outbound.protection.outlook.com ([40.107.21.55]:54049
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391580AbhARMcj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Jan 2021 07:32:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G49nOlaXsOR5gD/ecoaVEhOeUeRpon/bVy06xopcmNPTLGveamJIwZMt88lRKxTToxxKpuL7YQFNmvFC4efGjBKZ4OA7audqoT1DC3WvLCYZIoOZCUd0qrWwTplkeM8FTx05Ba7oaUnLQwr3cpwimOg4Xs9CcvY3YyqYipZNzj07Iab0ywONaFDPUZoUoC3r51fPDTJ+yrQmvRjFsxG+WsWwMqEop7OQtk7YZ4nS7hUHxPJfSug3HbuTb+x5GvyEl3cg9RYFWLhtTq95ohUObHDX83e1mj+pwMxejckyTXjP7AWp2HQIs1aDMpqicDLPjmBZOebBTTgI3UOJ/hS40g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJxrdlT8+OTygEs/swp/bhTTRjULeT1DvjELEua7HdU=;
 b=dDGMIh0bssvf0wZzg3W8JmcjGt9+frk8kTMdDfjIzdgyvxn+kODdNyv6TFLqCT7l1oK4nZHt+CFiaEch9eVX4sSXDIOfl7rGZ/KvO4R6nEkAT5cPWRfB06ws9Q6S/PyCP/chonKcH9PQYGuIXghzo4z5PDj7kI8aXaH9lpw8BMBlvnBxlZT1el6U/pvCxQJYpSoA4By/oAhks45OPUw77rHhggP28OLpc+oodB1cAGr/1BnfJC49Hpwdx/X0klSoeuOtB2cjqjOzUnpG+7HHpBnJBkoovQvvXKcueaNLchlUyk974Ats/ZT14fDA2Q9cPO4UHHEFRv9mhXjxF41GKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJxrdlT8+OTygEs/swp/bhTTRjULeT1DvjELEua7HdU=;
 b=mOHEjCqLx9bQsdp7gF1ZRm+kYZG5xTIx3wJE3izi6DXPNf4hImTyeZX/rDZOUjYIl8blNw4RqdCP7mKZ3zlSx8IHNNQ0XmJvwRzoN3Ma5Id+qGeHLsaMKMLf5p3LtVblKLX0FTLJ3GJryb5AQg87eWRVT25skWCnetPYvf71iOA=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5243.eurprd04.prod.outlook.com (2603:10a6:10:17::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Mon, 18 Jan
 2021 12:30:56 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 12:30:56 +0000
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
Subject: [PATCH V7 05/10] remoteproc: imx_rproc: correct err message
Date:   Mon, 18 Jan 2021 20:19:54 +0800
Message-Id: <1610972399-28286-6-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610972399-28286-1-git-send-email-peng.fan@nxp.com>
References: <1610972399-28286-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:4:91::17) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0113.apcprd03.prod.outlook.com (2603:1096:4:91::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 12:30:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8d5c516c-f575-4fd3-9978-08d8bbace70c
X-MS-TrafficTypeDiagnostic: DB7PR04MB5243:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5243E7E7C8483EEB9C891D6888A40@DB7PR04MB5243.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sEfZb1AwrMTCGnCucQHkNPRIcJEYsLE5utqlJuTMgBERA6aQHbCSj/chusuNoJWcchWc+jBOrqDBYW2wY8P5ahjtvhKzxBVDq2gmN6PeTyzvFhHlEOUStqwAf6zS/nJGY/RmkXhrcXjTuetj4vtAFnjMcWZthzKQKVMjMRlnifDWY1SUpfDlJlsAv6niJvU96f3LAj3+89gJBqMGdPqicEMmfgd/eWRwsHPn5SN6RmTd1xCj33GRwCt3eR9Z4cVnJ9VFPyglYdI1mlysGd22mOlsaSjvf3tK+esOfy2qtWVbRWf7wfB5XFT95JqpblRH+0UAtrR5CgUGVrSzLticTI/s6ESsGKDOkO7CbcxTmbQQckMBNzmPdHFP4pt7bxpozOkJei1KBG4rfIKd2EkQ8FedqiPov957g7sPRyYqBlVuqXcsmq8zL5YQao5tkI0yCLHrUnx9ZVo59iaM+BJx7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(478600001)(6506007)(316002)(6512007)(9686003)(36756003)(6486002)(66946007)(66476007)(2906002)(2616005)(956004)(26005)(83380400001)(15650500001)(7416002)(186003)(52116002)(16526019)(86362001)(5660300002)(8936002)(4326008)(8676002)(69590400011)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2Xs6clv6d2/cndWx7u6yLcRwJ2UR8prb0WKi3+cqM5EbvngmtXC8ASfRXzhC?=
 =?us-ascii?Q?G2JHREKXWVY3N1ALwM6ZwwhNLBw/WS16cXUSp55h91J5mdKXARoCOI21BTGQ?=
 =?us-ascii?Q?fvTGJiZ3VBeoT+bmjWrKDfXJ/2U2IntyUNSSwD/6GA3pIB2HtYXMq6K8Jusb?=
 =?us-ascii?Q?modtavuhr7waE/cohTsrzontl941Sjzlv+gv7TutkLxRr68/eGykdqcX9bs3?=
 =?us-ascii?Q?DZs9NKCmR7T9yRgtbQz+rvzUpCtKWx0sc0BSQGe3h7LGDBI4M1ejkhR7JlO3?=
 =?us-ascii?Q?TSGiETvdUu2mVifm/8bOZFUtzxWXSzlFtga5SLyA18+6zR+QY2LBU5ahtnWt?=
 =?us-ascii?Q?lQn5KvmboztqcTG96K9f539SN1TsTU3DzautO25VvJYfwjXyvxz57VECi/yt?=
 =?us-ascii?Q?av7rc9IOcLb8HY1Z2jQx3sKds0IPvNOUmGQAXjE4HxOX+eHEM700a7CuE6qV?=
 =?us-ascii?Q?zkpAVhERMWxbyU0DgJnOw5bQcLDlj/HZnkr4QPRObQu0MyDp17dr2WTp3UiQ?=
 =?us-ascii?Q?agbMRBXKBHWX3WNa9wd3zM3ZLnQIuWcfxPcxg00+s9yO1oQnxZjUJDemu4gG?=
 =?us-ascii?Q?eT31zYABLWZ/mFxlQ4mi+MODfBB6MRsk39Hc2ZKy3nrwrjCCEcdtz1EMwGF+?=
 =?us-ascii?Q?zuF6gHLo03f1kf6Dp1+fyrICUqyHnbAWh2yzyRpGMgYcStDIKbO91PSUQU4o?=
 =?us-ascii?Q?6VyMIPn+9L08fC2PmqZV2TdfAv8KegHuijRCYDmqF+WjICHIChuB9ut36hk/?=
 =?us-ascii?Q?5VWv3OKOBT8uqnm9WjLxg2agxxvSfqbHR2Jktx9zCwMwYHfinlki7601snQw?=
 =?us-ascii?Q?I5WTa+wYV7eGDva83lHXKIZwFLQLQRoevQLOs5Z3X4goHaPeiBRqkkMRS+aW?=
 =?us-ascii?Q?MNn9K2YwpOjaCLXouLwAvFosZMbnH7C73mGX+504+e505x2Cquk2i+OG/h5t?=
 =?us-ascii?Q?vRMdOlluk14pbPgm+z0Q+v936BZ+MoBvY/NaamcRa/VolbgLus6CHmWtXyv3?=
 =?us-ascii?Q?qpeN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5c516c-f575-4fd3-9978-08d8bbace70c
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 12:30:56.1605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ub3yEnXwQIeP35a6pCQBQlNJY3XJlrXrdbSqDMlmi1e1Mr+ynLDs+Z7t1MePKTGemGOl1B1euUyCXe9wxaRSrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5243
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
2.28.0

