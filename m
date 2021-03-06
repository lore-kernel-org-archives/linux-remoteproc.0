Return-Path: <SRS0=jP1a=IE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1ECDC432C3
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Mar 2021 11:39:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8ECC665023
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Mar 2021 11:39:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbhCFLit (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 6 Mar 2021 06:38:49 -0500
Received: from mail-eopbgr60058.outbound.protection.outlook.com ([40.107.6.58]:23865
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230242AbhCFLib (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 6 Mar 2021 06:38:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljGxP69S1g25FYS02xjNsOLx42CSRsR545JxW+YXdlk2vuhimOW7DKSt5BVDeBW66FtLPzsuJ8a4/cL6BI7WgnB68/hSO9EbqHQQCMn8niMJxjMerT3tjdEU6trTaAScGBQHz9PoBU+CexJ68NYb9S2vyIQoOl2Izi4cGK53+TrbfamnjiUFlSodqUrbMsZs+yRJJ2JufhaxbqUiRTHUF6ATW19clEf/ZJrULrv42q33GQewCgRGBoO9kKB9hDLfu+Wi//4jqpblRG56T7mmUeIJPRynt3ByJ+lJu3cXbTMCn/53vKgJEcU0ZGsFMpvTUN0QEBeWaey09RV8KUPQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylGtRczgykA3LROiqvT5P1IRIRg5xXAemZjMRiCZwqI=;
 b=QwrFqGFLiQukB/QYjb0ogzj7qZSGRaUziUfLpMZJcT50Jl2WG1hEpx5QbIcxFgpFydBSUlILLoJsEZNui6S1Zv0EeQhIR/9VRsO7a72JbrlWzm8yWZGKxk9PYBBncFPwi9fouNvwUjmZL7Ws8KgSVzAGCwjO2J37chNTQkEqAraEwNNNxjNZtBpKhjkDuWiAQWWqRhTy6CzjbyKgiHyaZnRHI8MFza2X5j2PvPGA2bQ+Y0FBcfDOuW3xmoNQe7JctGIJNzck7fbfnkldgxHnkkGMH4UXjMNpLzwJ7urWOFFx/z9mD8dxcvPguJNwWZfmKU7WYgzTuggsNJ1WqTvz5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylGtRczgykA3LROiqvT5P1IRIRg5xXAemZjMRiCZwqI=;
 b=RDOFaQPxB00pgq48OfTONTDbvUrL2WqQHIzREMag9+lVYVCo4M/EHLLWQg2uAT9K4f2ICKQjtQcJ0RZir2h3jQaJKcQgV5029OAU1A3bX7hKmbpyRo3VUGEU6OzxKkQs0NMLfkUjN6BWCSJ2jIXTHKATCmu2tY96Ebeo5oAwXxU=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2757.eurprd04.prod.outlook.com (2603:10a6:4:94::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Sat, 6 Mar
 2021 11:38:28 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.054; Sat, 6 Mar 2021
 11:38:28 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V13 09/10] remoteproc: imx_rproc: ignore mapping vdev regions
Date:   Sat,  6 Mar 2021 19:24:24 +0800
Message-Id: <1615029865-23312-10-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615029865-23312-1-git-send-email-peng.fan@oss.nxp.com>
References: <1615029865-23312-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0047.apcprd04.prod.outlook.com
 (2603:1096:202:14::15) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR04CA0047.apcprd04.prod.outlook.com (2603:1096:202:14::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3912.17 via Frontend Transport; Sat, 6 Mar 2021 11:38:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d3515234-38d1-491b-602e-08d8e0945c1c
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2757:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0402MB2757E9CAF3C740CC5F96A564C9959@DB6PR0402MB2757.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Suq1Bp4OnT9r1xDp3N54UEHAQC6fF6TWZPq5TuW578Ns/PdclgpQIPU9VUFW0sN9DLbuVcx+TH9dB4qUoCCx8bACjxIat5e6mci29ekPUTMy2rV5Q/IMVKKCbhuLkvodnpvjVjyEiG4PSrfPqrl+BpeS9W5TlbxdCd09EXo75jHMge037mr8PUMyCT8GKqT8hzo6UD+zNNdbtzMWXkSv/sLH8gac/A3lK/Sc73neqfGT3BolpIt4XE3S+DHY0fqslBy23+59WzCSksQKkuYUEdjm+nl+++8JhNTxzV4ZnCWSn/cwL1iyP/CLxLt8hx90yWhm1MbWhGX8jhA3po+tlJWvanwN3GM0wVK1DnQ69pQhsdEw2PNfSBc6GVRCNsGzzz8hHFcp4LTTtvoybZiHG08a1KW7NZhzIrpnftY95nJZ415l5xTT5K8pAVys75eBxbJ+YhblKdFhLlS0cR/lhiz4ytj2XsOtjq36lzEFrQq5YwW1QwqF7Nn30GlGzzDilP5bjBQHoki4THqC2tKY5nxmGyIeYGJoH93P6I0ApBWw972x/SkyhhKWlydG1Z3L39Af0LltgfN5QP2wE7jBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(66556008)(956004)(186003)(7416002)(66476007)(16526019)(26005)(66946007)(8936002)(9686003)(5660300002)(6512007)(478600001)(2906002)(2616005)(4744005)(8676002)(6486002)(69590400012)(52116002)(86362001)(6506007)(4326008)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GeheP+I+HkLKq0DsWbGdLXXJX82mmhVODmaKWpmJl+2zR/NwNz448xX98Amg?=
 =?us-ascii?Q?ggL65yHoALwI3fIjgF6gZ3/Jp5nzIYlGM5CTDyslu/0JA3KKqCuwPhUFlllC?=
 =?us-ascii?Q?4xAQk5aVhYPgP+y6xTRRmYbqUZwGXUPTn/D4Vv98jv+eYfzkFKY9VY5nUbIB?=
 =?us-ascii?Q?ePbtZGyUoMFW0yIAomUiLg6rMPK4MN79tH9qwAF8dBpONPpEAXeJuDcu0hUj?=
 =?us-ascii?Q?VT7XUqZE7NjsxiohPJthCa0lTLvSKD8QEtk0owOFE7ogoUgzC/nB57puQ+VT?=
 =?us-ascii?Q?QY6qNuAYkr5tfVpFmZlcyxF6G68Jbeesv1l/j4C3Tg2dX1rLUerLoE8pZqgW?=
 =?us-ascii?Q?UShKcp5N+8ZarqdSldX6ZOEk0j3Pbg7yZIfiTZAsD8sKlLmN7ZZUACMHkGOS?=
 =?us-ascii?Q?2M7BlqrOoJ+aJVGtogdoC6y5sgvWQbQnqAkN15JIxrbbL4xtEUr+Pryjw3lr?=
 =?us-ascii?Q?EO0OSOiJvlL83O+Xpj0R80AA8ePu4AZrDhgrc8+oP6WVh2aoMTRkpYI4njrT?=
 =?us-ascii?Q?8ZxbDvMk2eb63pfXC5zXJu3g6/FWkH9Sbbv4TeEaAx/mUQGMaDYhVqrAVAUH?=
 =?us-ascii?Q?bkWb1cI9ivY26VwY5JawuICMJWyiQEl5/puHvsTXf9/iGIY4scicNgKBHBLW?=
 =?us-ascii?Q?1TNan22KY24RI45AFTVmrakX4d4+PEES42utLegNH9THIOdBR4KsciXAErbf?=
 =?us-ascii?Q?DgmDiS5NtpESDhnF/0CYB3YW2VX1GrXtIpwfwPpeQfIpn2RuIBAZ/YLRoGtG?=
 =?us-ascii?Q?wDluQ+Ha9i04Ef0jo1D98buAZu1IYDHdOJ1ZopsSsOxDwSgUvaW4WjsCufe3?=
 =?us-ascii?Q?4lPPienPYKOc5YHAaZU3/4GQlKGqJ611d/T1hLGnm7hzAZicdvngSaUZ3STe?=
 =?us-ascii?Q?Ce0GdHsZpXYIiaXz6BIs8wLX9shqJV+uzSJehrj9exNh2UicPAJ5ofDBna5/?=
 =?us-ascii?Q?w12DlC68pmGdmMEtU2lyRAimaUKr7jSiAg2tCCv/q4PXKb8P2OvrbtdGYbld?=
 =?us-ascii?Q?l3U5XP7AVMxpfp6whbXpKvfEdbJZx9C2mAZV9inoSjMW1JeNKpZNq053kN/D?=
 =?us-ascii?Q?DVzib13iLClSce9p3E2oTKLTGLoFoZl9kRuEvCLm/5M2aG96orxAL2suizWh?=
 =?us-ascii?Q?CZp5TSCEbXWPxPEv0Vcehh79mXUo7/Inz4h/2s9/xfHkOfZBVkiFWYJpr0y9?=
 =?us-ascii?Q?yhBBHbZv41C3H2BbpNqB4KqpNZfoYHyvrpTmvqJ/o/yos/W23K8VomddexTQ?=
 =?us-ascii?Q?yzRu9dN4G7Qoxq0xilLS/nl/geqiWS/a41goaccs8NpVn/R/gS/EiCoXUycL?=
 =?us-ascii?Q?zsz+uOmkP2QsoQ2ZNdw0d5I3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3515234-38d1-491b-602e-08d8e0945c1c
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2021 11:38:28.1798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Qz9UDj+oyTCpltncc8bp1AUGq9hAnfcCqsKBlSeKWSPnA0swXTCz8RzjKpXvqZzlqONQt2yH6z4wGLkiwgkeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2757
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

vdev regions are vdev0vring0, vdev0vring1, vdevbuffer and similar.
They are handled by remoteproc common code, no need to map in imx
rproc driver.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/imx_rproc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 0124ebf69838..3685bbd135b0 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -417,6 +417,9 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		struct resource res;
 
 		node = of_parse_phandle(np, "memory-region", a);
+		/* Not map vdev region */
+		if (!strcmp(node->name, "vdev"))
+			continue;
 		err = of_address_to_resource(node, 0, &res);
 		if (err) {
 			dev_err(dev, "unable to resolve memory region\n");
-- 
2.30.0

