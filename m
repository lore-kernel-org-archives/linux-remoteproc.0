Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C237C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Sep 2021 09:07:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 223C9611C1
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Sep 2021 09:07:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbhIJJJF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 10 Sep 2021 05:09:05 -0400
Received: from mail-eopbgr70054.outbound.protection.outlook.com ([40.107.7.54]:22173
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231961AbhIJJJC (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 Sep 2021 05:09:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbKFm1w/qwQ5EZ14juzM0G6rBiaAJ2m6SS906wDZAzYWOjTHGTzLEn+m965qRrjP1uNZjhhR15xvbiu/0Ms9XwESolnj0m6PH8QgeFBKbI2qfAuJfmDAnvpeLvgl10cf+bM/SNtKnzwA2YjW2CkDEpRT0Az9zXm3H/F4rUq0F/NzVsXlUA8zYOy0XCRF9GqGJlkce5Oo4w36oZ8uOoD6sr0t8j4Z7jZblVsM6BcSmFFjekGLiQilM/iebsYN0bFHFy01p34IDJd4iNo7/cbwK+Tb0/8d7jExsCBBKumxaMPfKm8gwFZ47C5F6aqZYMK3O9rb1j4beOjURZQcJ5RKfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Lkqrpm4CAJMqPeNNK9M2tInqOHLIAEqNlf3XWAJT4MM=;
 b=n78int3R/iUtsY+PqOBjar6vvMn8Nz7+bH6mpJIkeuIa1mmm/EeA/96ezLKMqmcPygdYGDu4AbHHYgYSDbpFaOrKSI8e2VX1F7b77hZ/Xje1xzYlWvoU0q0OBZcJnTjsOqC9d8fmka4QLnLUMKqc8QV0Ysh5UxyKMalG7bsRJ7KwyeRLwBDDBq6C4+mhLE34uU/oeTRk23TsIuMRlc/+cRnBkxdtpFNGiwS/zKPOjKQKC4FODOkssqaH5OFusk5q/V9O6YsyLCXF4PaY5MSbAD86VglYa0TrAwI5IueU8AdD8lKG/710zLOMwsUIIwWPcektU6pe9QpNGiOn92gEnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lkqrpm4CAJMqPeNNK9M2tInqOHLIAEqNlf3XWAJT4MM=;
 b=PQigPVduA6Z+rLooyB2YBEJb+ZsYFSvNSzGpN6eqUZZClqv6O4c+JrdclV5eF5okVwOZNCHdlMy9mQcUjZ0MHahgZmZtY3vhUGYNk5YnyvkfxUgx3sFWzRsPNPjiZcIFkg6dUOL6TDaiov/j9+OL5+N/HwzF1LvjG9Lcq21JxoE=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4763.eurprd04.prod.outlook.com (2603:10a6:10:1c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 09:07:49 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53%4]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 09:07:49 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        aisheng.dong@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V4 6/6] remoteproc: imx_rproc: change to ioremap_wc for dram
Date:   Fri, 10 Sep 2021 17:06:21 +0800
Message-Id: <20210910090621.3073540-7-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910090621.3073540-1-peng.fan@oss.nxp.com>
References: <20210910090621.3073540-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::24)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG3P274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 09:07:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00b902b4-0c93-47b2-d470-08d9743a75ec
X-MS-TrafficTypeDiagnostic: DB7PR04MB4763:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB47630AFFFB621809EF5569FCC9D69@DB7PR04MB4763.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yhJCQsheu9mCLh+Rmz1JHfGllTF+3klKkdcq+MDmlzvFBaIUs1YGTnxB5xDNE9hbxyfI9D6GSyASwDxN+3kE9WG5vNey0XdXyfrw0bdJCpYjAU+u1f9Xmyik4a7dMVs+fqDRydK0twAI4Hx/JxqivOxKmDCB7ayQh+THCVlDlXkRcsupLB38/xZE3pf9MdcQc7kqR0sN5UT37EO6TXd/RT5+fHlXxCY917PBxR1pYM3s04HFRLHH+NOdF+aqtIQvJT8dB9E2WGteiytGVGozzuJo3uEOTChYMy+t59BEsmVN/TNFWxZGz37WzibsTPG2ZqmOKCDJ92q8RF9eeTCztqmMavimSFdgmv21RHRHHElhmil+XJlP8afPyAvQ4DSH3P3q9iUg2FwUzUGRTmc5f8KY3uR27buWW3IxVODqwR4L+eExAmZZP1JFtu3FrJ5NsKCsrmmsgtOkbYAwF2lUmIdsbMyQhxqxksVK+6fqDwgPuMAE98Agc92nVmS8du9VPsfSNnuXldJghpEG7CwqNxYwo4RaOXQbh1cQ6mlZCk8FrRGBCktCEXj89X5iQd9ed0W9BD47KBpf8Cu630O4K6YkKQueabR2/9WJqOJvlWqfZbEtc7UmjeQV+WCg7R8sAMApAOKgE7g6K2ZO3Zua65/vRb27buj4+gEuGw+IDzRFpurHNmWhQld/32nI9/5FTSAIaAjKyqiBb5jjpaM22A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(6512007)(8936002)(66946007)(66556008)(66476007)(83380400001)(7416002)(6506007)(1076003)(6666004)(38350700002)(38100700002)(6486002)(8676002)(316002)(186003)(52116002)(86362001)(26005)(478600001)(2906002)(2616005)(5660300002)(956004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YATnlWXZEyM6V2CXuxswoJjV48nrruj0Y+ZKBukC6e/Z2f2vM83GxxT2m3jv?=
 =?us-ascii?Q?Oo8kBB7youEi8uMT8+MnFUrSGJKkaDtMf316CtVntIozuUby94tqpj2O3phf?=
 =?us-ascii?Q?YIUmwrFvZFdI7X9/A1/rkNLMBZBz16WyohlVKsx15jBzosF4KrEzin/fyEUT?=
 =?us-ascii?Q?6gXiG1mDgIRb9+BxTI8B+OHkGbyfiPOu4zG2gy3kWhnPcA3OYVww4IRUzlpY?=
 =?us-ascii?Q?kEIr+P9gIQhCqAspB6YG+H3GvLyXf1BrZp8IzXXpt4KVqwDqxcoJxXrj1Pk/?=
 =?us-ascii?Q?gwptqIaOnC/LVKAuA8Vqt4eYveXlzs0PQOAETnop3npQLQgS5iWyz90oXe1A?=
 =?us-ascii?Q?xbPPYZBKn+Gpemqe6ObNNI2rqpxYlvJQuQ5wDt69rf/dz+75PZV00S1o8ChR?=
 =?us-ascii?Q?/IGxPWT4mTY5q2ELDAJgIN3bJuX7vBgUAqhXPQ/yynm629kAn8L/1k7FoEpf?=
 =?us-ascii?Q?R9DW2B9I/tKgxqnHKyeNnsx8F6NUS4AY4PaN7KYRMItWsgGFEg22RbsIHldp?=
 =?us-ascii?Q?Whckq8SFrlx7M3W9vZpBcAPXkO69+qLqq5htvpijVZ62tUNK3qWidjWU/t30?=
 =?us-ascii?Q?zAdLHRt3jZjzu/bBV5HqwPIHBKiaG+REGhHO1Nz/ijhYVQ0qy8Tnb4OUGO6H?=
 =?us-ascii?Q?+U8oUn99WsfyY5VzThdDiSLxgupn36nFHQaA42b1sdbtlRyRFIpz5eI4M77S?=
 =?us-ascii?Q?0NKSdgnrQWDI3gR3qLmEJNMEaTSbG8daLsBjBYSiwLGu4UALbVI5F0H6tKhw?=
 =?us-ascii?Q?97uATx1K8HV8AmIGdp3brJIR/D51oYE7RKVCo5C7vue4Bf/OL7Hs7fl1Z/Xs?=
 =?us-ascii?Q?b2QkZsHkUyK/e6Mka2W7QdcXJtI7JLFBhjJv3EvFofP1Z3DSVTBtGjc96Y1R?=
 =?us-ascii?Q?xDtNSzPei4XHJlihQnqWeEGG8v1AWAi3oIyRbT/VxtdRCZFyBHEeQeuDmGct?=
 =?us-ascii?Q?OoaMSP14PMyxcqU27mUSXyhGnTrIXYEAxP5RiV698vT470YpC5v7Rdbl36kD?=
 =?us-ascii?Q?ZfKwnD9ZUrcr090M3niFTmiRUQLCGX+69dlXN88OOmX3fK30FPoVZ4crA2tw?=
 =?us-ascii?Q?DKhx6/iL/rzSshd0KJfbsniKR3bywtau5l0RPUc8tqQZ4DQGbvFzr6kwelzk?=
 =?us-ascii?Q?mBGu1Pdi5UlZksu3b16s9UX7N9bZPvrYirHEJXnn58NYxOz9iaGORnF/4Zkf?=
 =?us-ascii?Q?Bg/nSWbUKudjA3Ufyr4uUr8Iut2zJ8ZjjbOnjOmIZKiU4idzHt3PD2+++XbF?=
 =?us-ascii?Q?/GcH6qra6+QhkrmkHSRgcVgTMrBRfktTWmzvQHuFVJ+0108NwI7nYpxluj/J?=
 =?us-ascii?Q?7r+rK3L94vopvneuqM/xR0xz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b902b4-0c93-47b2-d470-08d9743a75ec
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 09:07:48.9274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jK7PBDKDRGRpeTq16i7jWFhO0g3qpW6Q1nV5//MS9lBjsB9aYFT/ayICi8ZaHLin2/RcBfxfQ6adknsGvY2BVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4763
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Dong Aisheng <aisheng.dong@nxp.com>

DRAM is not io memory, so changed to ioremap_wc. This is also
aligned with core io accessories. e.g. memcpy/memset and cpu direct
access.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>
Reviewed-and-tested-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index ff620688fad94..4ae416ba50807 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -597,7 +597,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 			break;
 
 		/* Not use resource version, because we might share region */
-		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev, res.start, resource_size(&res));
+		priv->mem[b].cpu_addr = devm_ioremap_wc(&pdev->dev, res.start, resource_size(&res));
 		if (!priv->mem[b].cpu_addr) {
 			dev_err(dev, "failed to remap %pr\n", &res);
 			return -ENOMEM;
-- 
2.25.1

