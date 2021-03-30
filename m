Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCEEC433C1
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 05:46:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46AE161989
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 05:46:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbhC3FpW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 30 Mar 2021 01:45:22 -0400
Received: from mail-eopbgr20078.outbound.protection.outlook.com ([40.107.2.78]:25454
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229667AbhC3Fox (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 30 Mar 2021 01:44:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1goNuVOOojcg49ZZF8KNrAO5Sop6kVl/ptwmhYEjSQcylX5TtwrBwZh+vetG9dU/Y3hwFmj138aQB/QB3HtSApFA2j0eeRfsR9URhZLQkVyW772Ib7YxxE8vFThbOdjN/6RgjT1TWL/7QIcIRt6CZWVrOBUU6Qs9faLLN+5MYVR+f45KJasYsPnUgOrh9uo+eYI0Q2Y7aZPxgrn40ksgk5NVRGFvjwg4T2ajD/0qJDBDy22/ckg253YB5Bmf+Fq3aZg8+Qc3KdsAIVYK8sF4vSxN0XJEuT52pwsUCK7Xi0HMJWznpgFtSPUsxul9/FsxRN7G0NTFutbrIm43w/diA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RlHMDSypdQSJYG82fSLmpTa43T3LOXPnbT839t0l00=;
 b=F/8H1sgXRbHOgPNwbow0DHTVc/mgQo+pqjEzJQAFLalShhzZBpBUJJTPZ1K58ErUPPP55CCOb+0gft3xdNMQ8GeK1cfptFqFkPRjYDycdmUaXoGnEhRrVFARzTni7s9PJUc7utDhvoso7PCoJV4L7xevf5rngVkSI4o6JokknFlQalrvaBU1Gvb321M06Q2XeNPW/hywGizUE7YCzomMe4FCWu9ZmCTIw4wLzE9KHqvyUd+V7jBKDjSb/m+nOttT3funH2MIkEnT7uDbGgv3FokaDd9jEiWL4AfnKA5zlqy9M2Zxmp1jHXihXnaN5cPYGH2z1jMpfF4whHwWUMjiTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RlHMDSypdQSJYG82fSLmpTa43T3LOXPnbT839t0l00=;
 b=YiDJa3HYK0z4XRwb/XVAi5ITtbW8Pd98H76QKtSU64m31cgEfMpTG+HfD+8YZLPEAHzLW0gV9yvgHGWEp3kU40znmCrqNjDslxNZzVsLsbQnAa1g86GWqMSESGRwxhT6hMbodH7A14drLwPdBishDtXEkh7POmiiBWOphU+I1Dw=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4489.eurprd04.prod.outlook.com (2603:10a6:5:35::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 05:44:50 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3977.033; Tue, 30 Mar
 2021 05:44:50 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 1/4] remoteproc: imx: add missing of_node_put
Date:   Tue, 30 Mar 2021 13:30:32 +0800
Message-Id: <1617082235-15923-2-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617082235-15923-1-git-send-email-peng.fan@oss.nxp.com>
References: <1617082235-15923-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0055.apcprd04.prod.outlook.com
 (2603:1096:202:14::23) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR04CA0055.apcprd04.prod.outlook.com (2603:1096:202:14::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.25 via Frontend Transport; Tue, 30 Mar 2021 05:44:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 281cb875-aa2a-4e72-f0fd-08d8f33eeef7
X-MS-TrafficTypeDiagnostic: DB7PR04MB4489:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4489103577C91FE8DF8FD76DC97D9@DB7PR04MB4489.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DvB5iUKQofmvhvXHEHdnUkTRYHbH6BifzTw/snivHKl3AzqdY9o3v+r6cvi45Y1njnN5BxsARujVqWK6FK85AtuqnhS4xmHtSDxBE2obfu9hFRQT1zhXAne/UE2ONKQGGeQxD9VlHP9dWAMdS0zhYFMEBqGpD5wErXZrX/w7n6dSxFarVgxXdqz+pduP3F/0edifFHD1jxb7oCQhG5ao7euVG+DWvqau0DwjFIaloGxjKCOwu4c8qbbjZD+U2Z0MZR34fYQrpuOyLN+yQBiwunK+RK7d3zfx8aMD+cC900tigSMaA73fLiA8PmwX5Z29WEwOLqhQtBar7XRvmxxaZKuQJ2t+cl/FCo703XhsQDfxUSguVCg0F/dCck15QnKwohV1qDJbHMwTwmbgbZMsrJFjdDPiPw3JXOP+LFIzA/SsGmLogG0m9b6Nyfs8vJr8V4oOmhNOTKHtl5qyJgyljceqqJuijadAUYKJNqEdEOcp8tNuqdiIXc5PQwjJWqvI3AuvtEnInW2Lk3LnVv7MlIgrTySjIqyIv+CutMDBR9379HyK+lnHPMjDTme57vtpva8Rmjt2uo8+xBJAvf8VLhaUbVV7iHUBBseFQaYy2YJIPQe8m9PgheNhJLyKtnPVZpI2UFUkC8SoGc9SMuogt1fc30IMbMZBvtquJSHVwGI8+EuKBG85mswaUHMC8fZi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(956004)(2616005)(86362001)(66556008)(2906002)(6666004)(9686003)(6512007)(6486002)(26005)(66476007)(66946007)(8676002)(186003)(69590400012)(478600001)(4326008)(6506007)(5660300002)(38100700001)(316002)(52116002)(4744005)(8936002)(16526019)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?mLsADwSQb+oaZJbSTu8VrE5+S5MByIG5fh8tBtU3/6+lUucWuxmAbiOoQwwP?=
 =?us-ascii?Q?rrTEkX48dSAhSoGpTkbwsWFkSeKdQJznNt9yVV5mGwHvZEnRJ03NSOkEgb7l?=
 =?us-ascii?Q?MG2KlD5MUXqtistDlGjRlSQjKoytyaE/HSgRyh+XyUVmKENXFtciOc+wTRmS?=
 =?us-ascii?Q?8JC1eZ9F01BSYIo5PvqX9EkgVgjyDKeLx/w28CtRG7A00ncm14vTtixfpBjM?=
 =?us-ascii?Q?yq2lE/ToVMuWicxcaZZIv3RvoJnlWPDqdHtwP5w8zNY65JnnyXFsiFRECZ/E?=
 =?us-ascii?Q?iwwZAJCUP8beHm0JmS/JcrPvBgJ8L5tpaWxXD6SylbR6pzNVMs5pslRW+irW?=
 =?us-ascii?Q?JSOr0XW6aTXZeFfSSb5yk+yT2/8lQaMjPpVBst7FxExwFd5yIDPhc/61t2nV?=
 =?us-ascii?Q?TU3/bGlZ3NC+sWiZI2iO0Ev/lallXRSRjgf1sB9NBYBK1l7CxIXu9/g06mU/?=
 =?us-ascii?Q?+4LJKs1auQPcf8gYR3Vhsh3SxkfRue1RwCkzqEJZMa3AQQ3LyQ75k7hErKKq?=
 =?us-ascii?Q?EMWVFgQGlEomMyzqa1Zb0Nt1ktXiZc/2J7QXd72xAMVu0Z/e9yQlAT8uhwH4?=
 =?us-ascii?Q?AdrvQi6vrISCHjqCMJEZzQxHib2WuBuAKdq8P5MRZsVqS93kEM2NQQAqnp00?=
 =?us-ascii?Q?1aGwXVfMpQulEjo92QBg/uKeOXwMH6FjOmkxsaPNKDctdBpH82TjwCFhHWen?=
 =?us-ascii?Q?QZNsUE7bHrOdtlK0jOncL421edTSSTx5SMbjap3UXoTvhtsq1E3pAegyRNgo?=
 =?us-ascii?Q?mtp97GG3HYHVj7sDl1c08CUaxsoBWtsp+DoGJ71SvGALojC3OfVQEYG8f8I4?=
 =?us-ascii?Q?bRBKZKIGNM6Md7KwjuI1I17xnLZcX1/UFVSNDgM8IsjhmzgAEfuVGFQBTW/1?=
 =?us-ascii?Q?QEQB+JMUto6u9efYQxdDDC7VFJ0O+BUSTzaPxuNPBvOhpkawcx1oxz5UhQFy?=
 =?us-ascii?Q?9DCCoEzGl6gzijo227ujhipNsUkTgrubw7Bn27lctHrKot8pOhIHK+Qp9E4e?=
 =?us-ascii?Q?3FgaiyaCtQCyEpyP3UTR3DZtwjaWqifM9kNmdH5IKvsC7Bv2461KWfqizRgq?=
 =?us-ascii?Q?IwHYZQBNF3BcEUQdq51hi6A0s+t7yAxpyYTSlH8RSb7c68zS6f77+jYG1krU?=
 =?us-ascii?Q?LfvxvYN/djEnJdmAGOJQ6viPERZg+ErEkakJ/akbNrdtz14LgdfIABKHziP7?=
 =?us-ascii?Q?PNixyrUk3b7lYR9GpxTiJFoTXxwuJwu4DR2zQeXpqZcqFSOUZ84aVT+gWljc?=
 =?us-ascii?Q?NVldTwzj1UQOIGlMN1L9f1R3GdGl52vtUPBwUctXwNNYQjjL18fj+dMwSJF7?=
 =?us-ascii?Q?u2h2Z5IkYC7kw6sKjAmwMM5C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 281cb875-aa2a-4e72-f0fd-08d8f33eeef7
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 05:44:49.9172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8X+lXqOWkR1KFmFc6zMO1msC9K2v87zEIKiTDEBhXtwmeN2bnhh7A7gDkaD9CWoOkqfhT5LVl3zjKNMkmVW5OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4489
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

After of_parse_phandle, we need of_node_put to decrease the refcount
of the device_node.

Reported-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 6d3207ccbaef..077413319f58 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -459,6 +459,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 			return err;
 		}
 
+		of_node_put(node);
+
 		if (b >= IMX7D_RPROC_MEM_MAX)
 			break;
 
-- 
2.30.0

