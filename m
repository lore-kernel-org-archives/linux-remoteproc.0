Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4D8C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Sep 2021 09:07:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BB8E611F2
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Sep 2021 09:07:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbhIJJI7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 10 Sep 2021 05:08:59 -0400
Received: from mail-eopbgr70049.outbound.protection.outlook.com ([40.107.7.49]:24708
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232076AbhIJJI5 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 Sep 2021 05:08:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bUt1ZmU5gfn+ofD7QlB/IqtFBrxsXbNsa1mG5TMeJQ9SftW5ht8oeAQoR2l2fvdFw2yh92Pn4myt6bJ451bYJJJ/9/MB69ci0onsQPEzeEd/LKbb1+q3cfMzxw6dEOSRfMFImpHX/O1M8kkZV4OnUHxvaUTfAtoNWwOWFsneZnCwOdJMNtUNCmgHFX0oPMknX354Eb3do52dh9FKIYHqTQOO59yCXAAMVY25QcTix1IcJSdX+IP7StdbrlT0rp9hM0UfOkdP4jdnGC02T7t8rVa4Fh/QD7tuoBjtBUl4QnU475EDCLOFUDdPswYXq7nETh7J3hkf7uu+yA5xJkHSAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=V02QvPaCqUkedDRb9VzeAgiDh7gQoYf5nxdp6ACsuL8=;
 b=SKdxvL+WbjSznl+Jq1/es1miIgLKeZjwNofZes9eOutxS57F5qc3FzGn38PsUoVw3n1Syj5jxVcBGupbb3tDQEB56+ZgC0H7Na5q8RVFyrceZhIbreMz3Uist0OQK3Um8TA0O3imTg9TczwxCysbhVcpTPI9Lsc8Fh8Q6lO2pOXOcYff0JvIG+p/sieoZ89oHXvPYTYpMGJhI98jcgic5ubCy7eEQGP2EcFSJ5wqQ+hxHAiIUwf84eLexEkCM3loMrPXrBpgY5vGuXjfIGd76A/t+5ZCc90X+txRR1PnpMNwfVurgjt5dzj91/ou0I+ZWtDUEwSnW7CtTU66lcot3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V02QvPaCqUkedDRb9VzeAgiDh7gQoYf5nxdp6ACsuL8=;
 b=iNkqpngfQ+YgXEdh5wsod8b/I9Xq0evk3C3Ih4I5+M2IhtbqDHelhKql5pbYvQlXsK1ZcICJmQ7TJdzYVla47QURwC85sy1ROvxZq8JCRoUhs6v23o1uFpdfUlGPjpJ6DBFTujcRUic9QyTlZOrGYg13u4IMfWiaNUW+5ptB8hI=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4763.eurprd04.prod.outlook.com (2603:10a6:10:1c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 09:07:44 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53%4]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 09:07:44 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        aisheng.dong@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V4 5/6] remoteproc: imx_rproc: fix rsc-table name
Date:   Fri, 10 Sep 2021 17:06:20 +0800
Message-Id: <20210910090621.3073540-6-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910090621.3073540-1-peng.fan@oss.nxp.com>
References: <20210910090621.3073540-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::24)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG3P274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 09:07:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cd2e8b5-79c3-4863-c7a0-08d9743a7327
X-MS-TrafficTypeDiagnostic: DB7PR04MB4763:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB47634CD6B96291CB5B70BBDFC9D69@DB7PR04MB4763.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XB1I3T5s5BrV8tFJ+XLv2zInLchC2Dj3UQ6JCzmVMBWF0FXmB/YxxiTYsq1+ShozzhhlwWek8iDSrAJnyL5FzMg/nsvJ/ZRmktWzf5fLXgrKP1uFHKMHcmpum9Vit8cSRLdlI2xjYXkgLWdYrBKjv+pB9Oq2yX3xjPWxw0tp76SMQExAAoaSxG7oMAXk9JbVnTbqyTjCBnP1rWzIJQumEeOVFw41CtdEGdpRziitk3nnnSAp4YhieLOrLh7oftJ03/74TZpH6Thb6+Ze67IyV/AqnzPaG5UQEasSY26N/pzl05k6n3K946EB4R30+r/NjD9B1MUJkxboPwl1AQh73RS3E52M/TQ25eSdb7OXaLauQgCamWqSt/WbfRtU17F05MXM5EPAu5MDYLJkH3VEXWTRuQMi/geVCgnx3iaNGgyw1fclBMRBmH79CRgYc2oJBWJgCxrT/dcRFa5iGDEJHuUcw2Iz+k+gU3yW+sv8WQb4oV9iSLtyQUqwurl45Lu++nu/8Kq9G63ziXY3vD1B9lAZY5Ut0VVp2NVmN3Mn6pzsT646VxKlC7BncwkItjBFkTkSJQrRFqFkExUWR+gGeTZ/J4SQZhvdEb7GuCERLLuvVTu4oMC4+Usce+g6b3B9VWvPAWFwfc8i+z/iGYTABVonmAQXIh5/3U143Gxn+0JX+XdANZ2NGKgx6GLdTLz+pYBkUjGaZz/bR31uGrfwBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(6512007)(8936002)(66946007)(66556008)(66476007)(83380400001)(7416002)(6506007)(1076003)(6666004)(38350700002)(38100700002)(6486002)(8676002)(316002)(186003)(52116002)(86362001)(26005)(478600001)(2906002)(2616005)(5660300002)(956004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NnocEafQkboU/yCDocpXuQLq+IufydHVb6JkSki7YCmaNMdZbD1lMARv9RUy?=
 =?us-ascii?Q?90+gnW74lndOy0aJIlBKGO6ofdyD6QY+RBbR9UW3NVGxhQmIUM+Qshs3jjJN?=
 =?us-ascii?Q?2oYBOAgxf0gF/5/ybktXpIPURTRsHmSLUF1FDdljCZwPUrrIWL8FbNdZ4bud?=
 =?us-ascii?Q?d8VhpaI+OEwms+j8je2n8TBaLrtY5nyjOMYVI4ecsYCzwQgx3iA815ZVMmY/?=
 =?us-ascii?Q?04O3WpfjYqekeqo9SwYGBKrdiSnttpqM+csuWR0CRCw9EgWagT7jFataPiuq?=
 =?us-ascii?Q?Wk71TGk2MXR+HSHyQ0lIQV44ojBEVFUely3eFfHYKElMtqbMwtc7/PjFpwbm?=
 =?us-ascii?Q?1rgsn/tHCeQqVH/3acgYfl7YxW3FNUJthCwyR7bDXrKq92fwKeoBU95S2fvR?=
 =?us-ascii?Q?iwpnIH/kM6dfs4C192PDbSJQoSpEK8Aeb7XpvcCPBxEEroqiIH8gRSwpfPiu?=
 =?us-ascii?Q?rdiOY/bm8158GbdhCYXjhgYnaXjw+3I1IhY87C7txUXoQiDnuK0GmG/Pj9b6?=
 =?us-ascii?Q?s31RsUQxtup6+VMe8Y8Mi4LDxsHTz+F6ij3ViQR37yWVh0Kc41Fz7Xk+kgcF?=
 =?us-ascii?Q?XCLVcf6hsMViP6Ohx1Q9JTVWicev8DxoU917pz5qjXAkcIEcvn2cp8xe77QN?=
 =?us-ascii?Q?CDblsM+Vxjb4P6kWFnj3gu9D3vEaLmWhwGW7FwyRLGk5LrAlksy45FpqpLlE?=
 =?us-ascii?Q?XhWAg82a8xkPeiI6HCmioiy9RxWA8TPyDHpZMLCYK6x15PZLVriB4+Cnj7/y?=
 =?us-ascii?Q?QOsMMVbRtCXrRW0O3xpoF19vLGKe5rkJ7ZGp/FeUztSfr3XL2Rdj3clXOm74?=
 =?us-ascii?Q?Z0VvuxcXaeAAiYj7xh3UN9X3F9E7RImki9XMZ8ViZQZplmo/dRavKwZ0oBmW?=
 =?us-ascii?Q?2MuiNUFe1jpoFTJzBIRbi44mzyhCfRTytx1gqPTcmPCYIogyM01MP9Ss/j9O?=
 =?us-ascii?Q?le++YsO+cy54Oe/yfRNAjRxxkGOQGE1L4MvSds8w0R+Oe6h9aTpc8kTGzWIK?=
 =?us-ascii?Q?EX3Dra5sF3fLdAYn+bmfHIHCC8RQo8hknlV2keuwzlkJ9DX9g8nBzl+jLBi5?=
 =?us-ascii?Q?DXyeRVSNDE6WoJfDgA0pq3MPt0U2vNVX23fEbk7eMB+lsvy+vYfRYtMi7hX5?=
 =?us-ascii?Q?wVQ8Ll18ssKPHnIuXpJhTpIrruNQmX4Ze88DEkaUnxvQ+31JJQrwqXCd4uEG?=
 =?us-ascii?Q?PU6cMaknRhnlp6ayU9tGyGvlppdSqaxMwV8EWxAxJOyisMDgqAz5nHT4ojpL?=
 =?us-ascii?Q?xslUh0ZiBsrNBIfRiQq1FQxZAkCLGX8vGd3oQzXKQADN9lMCmyhkXrobVn0J?=
 =?us-ascii?Q?YY7ko0ggbb16Y02EMdh/Ba7Z?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cd2e8b5-79c3-4863-c7a0-08d9743a7327
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 09:07:44.2106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtOb9Zty64CpwDBLFzmxpDaNNaK2jujLhjfavp3p/sQ+7f3MIedzDnB2pXYXwo6j4OI04Mb6nb5WSgzQig+jmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4763
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Dong Aisheng <aisheng.dong@nxp.com>

Usually the dash '-'  is preferred in node name.
So far, not dts in upstream kernel, so we just update node name
in driver.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Fixes: 5e4c1243071d ("remoteproc: imx_rproc: support remote cores booted before Linux Kernel")
Reviewed-and-tested-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index abfeac0b1738d..ff620688fad94 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -604,7 +604,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		}
 		priv->mem[b].sys_addr = res.start;
 		priv->mem[b].size = resource_size(&res);
-		if (!strcmp(node->name, "rsc_table"))
+		if (!strcmp(node->name, "rsc-table"))
 			priv->rsc_table = priv->mem[b].cpu_addr;
 		b++;
 	}
-- 
2.25.1

