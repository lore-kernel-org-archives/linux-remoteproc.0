Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A5ACC433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Feb 2021 01:38:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3976A64E45
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Feb 2021 01:38:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbhBRBii (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Feb 2021 20:38:38 -0500
Received: from mail-eopbgr80089.outbound.protection.outlook.com ([40.107.8.89]:51809
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230125AbhBRBig (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Feb 2021 20:38:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N55XwZf88B6pcvYAvK9WusF81hl4bgjqjv63tsCu7vs81gadSWljwOfevnPmFq/yTemBgYoo9/fLLII5Fe3xchOpJ4aAcbKdK8K1Q2GL8UFq0SHsCEprWzJGRTdHITQQxoVlsPZ2JwRAI2lf8wWfylvs5Odo1K1iQ4pTpi1B4epTckgJUE7YTCX4BxbdCN/PJKeRMLWdNtqQZBF/Zt0vBrhxVOL8z/k7vxXrO03kyRNWK10fXS+gG7W2xLx4XTtxzRwJSXs1W+9ovClZF1xVuqb7GvDohBPyDPsBRD71whK2vS2ryVnL6QD+ku+Tom9nms5LGGAfv74iFH8DZd/ODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSh0Klx+zNLSyY9W2gwUiOZPVVqrU82ogdPg4tjElUs=;
 b=nmlnF8pYZmwL78bV6fAFmwzN4wvva9EVRI1gDOhvnXYqUuM90OVw/+mVtUj+zl0K0C86Sabqb6CltgqSWAPqOy4V2yc6TUf6AX7wZ7BGlXqF+xXxTIU6XEgA1e8aiodhIMD9Mk2CF22516cU06pAgwCLyXvD4uNyS/yyOQcgVtDAnFqJOuS5mMnUwHHIGIC/lafrIJDhZIjB6elgIDMo/Vh7ogooExjBfD068ZiPAc7w6/1HdorJ/zw9ZRLE0LYtOLOIsWf+VtPMZc0ISehwOBpNtJkUxg7+YtFjhI2W1RsmbjfRE3Cx1Q94Xgv3MwmtZvNxCSxoHjnpYh/lZlovkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSh0Klx+zNLSyY9W2gwUiOZPVVqrU82ogdPg4tjElUs=;
 b=gM8mZ210rxpf77LwMQgzhAFUMlcMUj/phWnc0AdnmDGqqHOIc4wGAM8tQdQjvJsTV+v2Zc/FI1c9h0rdimWtYDa5gBxh9kfTZoIVGImNviijtq9khK5OJvPl0K5ZGxYd+11WAA3RqMbyGU1P6psXIhiozUMe+D7+46p/XaabPDE=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBAPR04MB7285.eurprd04.prod.outlook.com (2603:10a6:10:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28; Thu, 18 Feb
 2021 01:37:12 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.043; Thu, 18 Feb 2021
 01:37:12 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V12 03/10] remoteproc: introduce is_iomem to rproc_mem_entry
Date:   Thu, 18 Feb 2021 09:24:53 +0800
Message-Id: <1613611500-12414-4-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613611500-12414-1-git-send-email-peng.fan@oss.nxp.com>
References: <1613611500-12414-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0401CA0005.apcprd04.prod.outlook.com
 (2603:1096:3:1::15) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0401CA0005.apcprd04.prod.outlook.com (2603:1096:3:1::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 01:37:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c9fe755f-6497-4744-b12f-08d8d3adb66b
X-MS-TrafficTypeDiagnostic: DBAPR04MB7285:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB7285720BA4153F965505275CC9859@DBAPR04MB7285.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LjmTsw07ad2Ogl58c6r6qE8scnhFfir2VefMcdU4YM1GlNjkcVMjXkNN51Y/1whr2lGe0xN8A+3QMXDAd2sKjJvVVJCjwGqpU0/G71X/WQ99/QIkAAJiDMymuGifafPbScr1GMZXHIx8ojnEQTHyH6MQL2hZa4jcz23ouPmy20R+ZxsSnAsJj/sX6ZZT/+atzlVqJgzBQujw/p6hKl6N8ipzGeO1FNJxzGnxBf7cexKw9buTVeIZaZZHw/OnEbpVC7mBtkIW7Q/QOeD4R7TtUH19GUtWL4GPp/UieME92kyUnlz23bAh/DkPqxFz4m1/OH1J/mKqTYipm+av/0+707q8w68f6naBJz53zEsEV1gDbbBx4QmXm1QTY6Ndt5M3rnuVkdrhjUG3LRsno02BdDStrFznP9p+qwrqHu1ibk9wP5ZCCV1y834RP70yQf0JY6R1D1hCR9DYXaQ+93mxIRQNnXrDOHDKYBNmIMpnWz8ORV5CFP+g9ZB1TZ4ymAgvffj3JvVBVmtTD9zgUDDKViFg4O/ZLlzCkCh1RaURwGAFrNSGWp1Dr+pRdbqEUKwLVIkmpe2Ua3z5b7hA+WC++A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(6512007)(9686003)(16526019)(186003)(26005)(5660300002)(6506007)(69590400012)(66946007)(66556008)(2906002)(52116002)(7416002)(4744005)(316002)(66476007)(8676002)(2616005)(956004)(6486002)(6666004)(86362001)(478600001)(4326008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8AA0kEmW2FcX7rTf0qeBBCMJT6m20Z8FozsQemuB+fuhvWKMg7fNyEqBGqVq?=
 =?us-ascii?Q?1Ak7dCdPz0xGI3/N8xGPhMwKC9H6d23Vm9Hj8C88JN72IIFbQRn4wBaQCx2Q?=
 =?us-ascii?Q?lFGFe5t5KpFQXUpNoSuJvIiGm8gb8rtsWPRkiw3NrcuQXhtICK2Ke8UHshsh?=
 =?us-ascii?Q?lDfNjFhWkcoNQVV0vIVQqVybLgIMsJU3OmDQ/q6W8dRNkVnO+Un9PHNKEjIv?=
 =?us-ascii?Q?YaWybj3geX+cAOYqsKYiwQFub2xx2nDyE4qU76glLkU6yeqEMTCRzaxGSA/A?=
 =?us-ascii?Q?Kl08Suc5JxFjxze9OPZgrHq/thwfrIaxjqHGf4NpGR+5QuHlh/i1Jcuuc4K/?=
 =?us-ascii?Q?wOmSI83GbH8Gy4sSeRh6hEFbjzUKYlBf5vUpOXgcfRsCOdbKZj6obxt17T47?=
 =?us-ascii?Q?yK1ZiNvZ+7Ir6i5VUWk+9sc6OeEKeBVPDsrRosOOPgDfyJLnsR15RcoF3TYm?=
 =?us-ascii?Q?vaalvHUyC6ZhIQ/7Rp8PuT8sP7+L5zmuCYTeoJtqHhnvHdSZxucOZOUttMRV?=
 =?us-ascii?Q?4vM3YWihZkHcWwa7pZ8zmZ4dAOQBqtx4pBuAvHO91I7G/IYeuEyETYjlDGms?=
 =?us-ascii?Q?Wp8/0p/PO1A46h0rrQYKWk1m7L7b+e4hP7kSxza54tuo/cUSwlOxztFAh2dB?=
 =?us-ascii?Q?AcDC0MqSj29XxNMbDX2pXxwbuDqkySE3q0FSls/uZ7eP94lW90SsNzZq96fk?=
 =?us-ascii?Q?P+keT4aN4ghcO+GVxSzE+q7G0/LTB9Xj+kbIqx4lY4KmWcAqLSlN2Nl4JLY5?=
 =?us-ascii?Q?HHARIuuGS7gavJCwOHO2Z2jnOUQIX9GaSJto8vOp47atQZiMXIRHLEtASaMu?=
 =?us-ascii?Q?+6vsgxTR7iNMA17nyiqJ7ldVxWg8d3M1GHxCRQ2S0HJFs6/FTd/Dgirhxgic?=
 =?us-ascii?Q?xJ+Dzu7P4CzTduT1JVjzPg0teIbDdulfYea+N8vP8YaI+CL9xaoMeOlpYJHI?=
 =?us-ascii?Q?vLdf8Dz6c52NEM0q0q/MQCEjbgHTRyo1Q1YzWONUUiCgu6kSDYFCPuLodcA3?=
 =?us-ascii?Q?xrA84C9hcjuh6Ti6/mm20ogZmOyz5qC1R6h4qsuMdTmKCVPvdc481di6zHOA?=
 =?us-ascii?Q?57f+zzTKoasVLRAU4PNvgMEE4QfS/DP05664dEn3P+1nu85Z0diEKuXqwqc4?=
 =?us-ascii?Q?LoruynQjHylxXoEfRlwmb91Hzcfr5iTil4MMRG9ZKkTxsmEltZDhbOrxoIWh?=
 =?us-ascii?Q?TqE+Gx/5dTDCkiwTLDyImS+sj6w7R3BdaQT7teOfzoKCa2H0mpaMHVQ2JLk+?=
 =?us-ascii?Q?XL1j0JjvlQLiljus6m8vs/PgTzL8rXq5THGaquq3mXEMRvsZwMciC8oLoOpU?=
 =?us-ascii?Q?aT9fDGFB/va7hRQgdoS9xFQk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9fe755f-6497-4744-b12f-08d8d3adb66b
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 01:37:11.9807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ik+W29rwxT1iX2F/pZJdWLwhAJZVx3KvJiOKfF1AT7xwZ0tT6Pl4pDXGp/S6Cw/KusgUGUQIVqbtdGkEppwhbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7285
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Introduce is_iomem to indicate this piece memory is iomem or not.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 include/linux/remoteproc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index f28ee75d1005..a5f6d2d9cde2 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -315,6 +315,7 @@ struct rproc;
 /**
  * struct rproc_mem_entry - memory entry descriptor
  * @va:	virtual address
+ * @is_iomem: io memory
  * @dma: dma address
  * @len: length, in bytes
  * @da: device address
@@ -329,6 +330,7 @@ struct rproc;
  */
 struct rproc_mem_entry {
 	void *va;
+	bool is_iomem;
 	dma_addr_t dma;
 	size_t len;
 	u32 da;
-- 
2.30.0

