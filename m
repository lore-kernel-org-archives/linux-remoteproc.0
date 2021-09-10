Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A680C433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Sep 2021 09:07:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 534936101A
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Sep 2021 09:07:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232013AbhIJJIu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 10 Sep 2021 05:08:50 -0400
Received: from mail-eopbgr50071.outbound.protection.outlook.com ([40.107.5.71]:38403
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231946AbhIJJIs (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 Sep 2021 05:08:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCBLrJKd6J0i15LwJs6PFQd8zB9DN+EcW+kncRwv7CnodFJXbiQ/D9dumt9t5RXAYswwx1IcBy/oLjuOQ0NktDrTrYvvclw8gCTbpjWKnMepl4dl2HEgto3FizvzWlhraPRWeMMGtw308uBRNYMoMTCX2i06H+wqLM3u98oVzDHHWb53UqLoKDg/XnFz6ogFg5X3qY8gpmpQlVqqQjMuLguBM/FGJOGWrJ8qxwpNMr/OygW6t7WvRnYi5uUDunrha3mObP1GrtAinjZBfG8Izi5C/FVa3lZZoXH173kHQVZTd7//Pc1bJDVUpAfbRhVq+I8bvzkzWGJJfKsfu3xI5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=9z53OB33UptejiSPx8cCZS3bGbReQXN5OFaSnD5NJUk=;
 b=PRvFi0wy2WHqOxHhIfmGWeAJKOg8/WTWNs7ce64tCbK0fGb7LFImTj1L/ToqX6kwesL0PFN0N55ITUPj4BGpd37AUaBKra0vGXAGYiOC5JG4LxGrhz+1AtdC1K0ywjJVaC6ZR8fDdF5nNDZP/FUmN3DoliyBpBZpffkTwwRRgAJlpu+2HD29KZYHYgGHKchplPWtTQqcWHEt/HsUXS/Vj8RUAIIRYrWGQV4F68nAB1jo9hZ7IOzb3EBp3dk2up4UfMGaQ7hBgDVO5bgixxzgUzPmUKABqhg9mD3yxLqkMu8lDl4Lyz3RDLGFXjcCLO1qwmiWW1BnVhplJa9zXjmdGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9z53OB33UptejiSPx8cCZS3bGbReQXN5OFaSnD5NJUk=;
 b=TLSrFE5vS4x0TkHydcusz7CUR50eGm1+rvrhGTocpWYiaiTHs3Y+gbI8mvxSXBEwzcfHQwjtRc9XaebHz2uQf7A8WeaGt+wuqfyYRE2iK0VFw64Fuuh5Aypc7Cy64wu9ctSSlHkMMKuXGZhmSfETiDtvviDZWV2PPyYnCB1uA6Y=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4763.eurprd04.prod.outlook.com (2603:10a6:10:1c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 09:07:35 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53%4]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 09:07:35 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        aisheng.dong@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V4 3/6] remoteproc: imx_rproc: fix TCM io memory type
Date:   Fri, 10 Sep 2021 17:06:18 +0800
Message-Id: <20210910090621.3073540-4-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910090621.3073540-1-peng.fan@oss.nxp.com>
References: <20210910090621.3073540-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::24)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG3P274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 09:07:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c14a02e-1124-461b-864b-08d9743a6daf
X-MS-TrafficTypeDiagnostic: DB7PR04MB4763:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4763173B564FE96472166BF2C9D69@DB7PR04MB4763.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:469;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: syjBBcydt41Efyq0N0f6fEo1mEfIwGdyQDSKjRQBl9uyISp6oRpvjg1mjlELKts+tP/+75EnfyaXWBoKbNtJh2gBgy5d7c5VfX+zDNtuf7XY4kURZwrwfWHxlEYUC3Qsd1VX1zAsjPIHQC7abf3h2/WmeDcVHnkuX+twYG2eQSuCawOBzB6UXJkV3BpNXcqzHfG1bDlgt4cXr3Qm/BJRKUFbtAC9RUf+32smb7erGMldc5k+un36+a5ChAm0wQJQ2hfurI2EUIi5FzXRe6HHkaIc7/GSBbPW7GGq1DrDRUTJFbJisACGsQq68CcgA+2wbUwOwhj76KX12gKC1z/9WvWQwg4s6MvqOhr12bJKEDjLixLfumsmmt1DtDrmkJfOiFkgbJv9aXqJNrvnZLcmijyH6xN2TjFeW9URls8xLV3KYNKwsQiC5iRbOWuMCS4lUZAnuZZEHlZ/9C10NTwxuD6tXceMlEW0A1ZT+RPIJnpAXxe8lvDubMoW/xfxQ1jd31BLHqLIfdqby8YCZ2pEoiaPQgc3+DsLmkH9a1rXOXtxp0UCUNPUl7j+oc4rKXHuEkoJ8ryolBN7xglXNj1uK3OCpvbY+pV/uzXcu76lhauBH3HPQY0UBq2Yi7pkD1XcvWJhmEtU40QG0kvPhVVWVnUToxCwhLI0+tRUU8PwT3ghTHW7VZD45qfDqI6jB9NwI1+tPnjGqNpgrX+4GOriRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(6512007)(8936002)(66946007)(66556008)(66476007)(83380400001)(7416002)(6506007)(1076003)(6666004)(38350700002)(38100700002)(6486002)(8676002)(316002)(186003)(52116002)(86362001)(26005)(478600001)(2906002)(2616005)(5660300002)(956004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6wFYi8e86I6dFZyYSV4zYdsnaxh56BGximNWa/fB9gz+yLl20xkDu7xz43xC?=
 =?us-ascii?Q?67OSbeBcqPEjIDYOC4iYunoZc+IjB3FPdNzPXsKQdU4Z5ZuVopvVUlOvlvNf?=
 =?us-ascii?Q?4iC5G5WSYi8eMsLbN3wkZ9dNtJZd8TG4TMvylkSj+c10s2syHvyUnm97gNcW?=
 =?us-ascii?Q?bmWbTFpocjPbHRraRiA6kpc5Cfg5U0WtiZdgL3ouq8bUaelF8rkLp8OQqUew?=
 =?us-ascii?Q?i7WHAioI4dJ+jdYHGl4WWFGpNW3MVgz75v5HYAq1mGRS7Nmj44GvIuYFijN/?=
 =?us-ascii?Q?pHrVsipIiegENcxELWlIRb3DhzOKkZrxdkGcoOSR2WfezoTxf6lZwqshHQzo?=
 =?us-ascii?Q?SaKIIYYAJ+iA9WD+1ttdwceL6bcFX5fKKeaXs+wTzImnG+andybVdzXS+hQc?=
 =?us-ascii?Q?JkVVDHs+u2BtDSltRdd7zuuSTF/LCPA92/aG/BpbqHRZ4bdFj6bGVtOM1O7h?=
 =?us-ascii?Q?0Os6HMoF+weWDpB3W4Ky3w1HoQyeVOsBY85n0+melW/tPuXpg3LgOnaJ4nRr?=
 =?us-ascii?Q?qyyeOWPp9mQN4VMn6mv/joziLXneIpkjL94je0e69/JZB4p/hcpMQMysrYEP?=
 =?us-ascii?Q?n2Cs5MBZl7YqYf0WiYAIDBHFxGjEyzIm3Gp0s0Y8GSv9m9ML2iM9Re/3Bfsc?=
 =?us-ascii?Q?bRPVhZLPzLPusLkWpkjqVAJLC+epVuqm+n9RVUqSzoCU7GAkh7AgPWIC+O1S?=
 =?us-ascii?Q?tDFF+uLkfw1Dp6LYKLivnppjWzbcpOH9rII3o4qccEEpN/gWLXArdLUK6N85?=
 =?us-ascii?Q?UBiwL3pcvkVQyTn/fs2XOjPcJM1oDYMnxjfT4WZyvcSqR6/I51VNYMpkShP0?=
 =?us-ascii?Q?XOX4sas1224KJ9jOToD213X4bKsBgeNt33Gn4XbO6okXW2pD7evtMFAN4PHg?=
 =?us-ascii?Q?HgQDKdiqw/yreejlhFSLSWFuKsYz92UjAuTpsDz1X2v4hLLpgebbxPMJQPE1?=
 =?us-ascii?Q?FBo8UrxpHs0fVzvH0WVVCPgC2otboJ4xHYc+L7Mkcl+CdejCAGqnxNCtGNaO?=
 =?us-ascii?Q?mieDgfVvgMOOlOqF0Uengq1YJBwJQyqQASRWDhvR6sLAoghlsNigGqEMvCOX?=
 =?us-ascii?Q?Jn3Rto3Yn4XoTUDx00BVdK8fOrFAb2xnWSN8ZTD0MbQskdBTffmmQSTN+QKd?=
 =?us-ascii?Q?nt2DQ0X7pFJExFvHaTMOWCL2qkgt0YSZLaTnS99l8cqJvDxXJnroMX0x1h8w?=
 =?us-ascii?Q?iTuxzQnXjqd2Y41eASvb3ZiGfUGbvJe6EO9Ez1rFYwNr/Y6eToRk/xzBRStH?=
 =?us-ascii?Q?mbsw4UI93PP0XxsZ9xMoUD93rELeSHVcxuPA7r7pm4rczVd+AdkuXtaHLN7k?=
 =?us-ascii?Q?hi5i6FtsooP2h4tCEF26UqJU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c14a02e-1124-461b-864b-08d9743a6daf
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 09:07:34.9029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBhqLtrazlzWGp+VWr1obtbIaNHDRCBPKdE8OniETsLJfc7Xdwo+dhhhnCqsrYZGmNzWIBPkLi0E1MVGrbHlPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4763
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Dong Aisheng <aisheng.dong@nxp.com>

is_iomem was introduced in the commit 40df0a91b2a5 ("remoteproc: add
is_iomem to da_to_va"), but the driver seemed missed to provide the io
type correctly.
This patch updates remoteproc driver to indicate the TCM on IMX are io
memories. Without the change, remoteproc kick will fail.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>
Reviewed-and-tested-by: Peng Fan <peng.fan@nxp.com>
Fixes: 79806d32d5aa ("remoteproc: imx_rproc: support i.MX8MN/P")
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 35 ++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index d88f76f5305eb..71dcc6dd32e40 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -71,6 +71,7 @@ struct imx_rproc_mem {
 /* att flags */
 /* M4 own area. Can be mapped at probe */
 #define ATT_OWN		BIT(1)
+#define ATT_IOMEM	BIT(2)
 
 /* address translation table */
 struct imx_rproc_att {
@@ -117,7 +118,7 @@ struct imx_rproc {
 static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* ITCM   */
-	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN },
+	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
 	/* OCRAM_S */
 	{ 0x00180000, 0x00180000, 0x00009000, 0 },
 	/* OCRAM */
@@ -131,7 +132,7 @@ static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
 	/* DDR (Code) - alias */
 	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
 	/* DTCM */
-	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN },
+	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
 	/* OCRAM_S - alias */
 	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
 	/* OCRAM */
@@ -147,7 +148,7 @@ static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
 static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* TCML - alias */
-	{ 0x00000000, 0x007e0000, 0x00020000, 0 },
+	{ 0x00000000, 0x007e0000, 0x00020000, ATT_IOMEM},
 	/* OCRAM_S */
 	{ 0x00180000, 0x00180000, 0x00008000, 0 },
 	/* OCRAM */
@@ -159,9 +160,9 @@ static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
 	/* DDR (Code) - alias */
 	{ 0x10000000, 0x80000000, 0x0FFE0000, 0 },
 	/* TCML */
-	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN },
+	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN  | ATT_IOMEM},
 	/* TCMU */
-	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN },
+	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN  | ATT_IOMEM},
 	/* OCRAM_S */
 	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
 	/* OCRAM */
@@ -199,12 +200,12 @@ static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
 	/* OCRAM_PXP (Code) - alias */
 	{ 0x00940000, 0x00940000, 0x00008000, 0 },
 	/* TCML (Code) */
-	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN },
+	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN | ATT_IOMEM },
 	/* DDR (Code) - alias, first part of DDR (Data) */
 	{ 0x10000000, 0x80000000, 0x0FFF0000, 0 },
 
 	/* TCMU (Data) */
-	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN },
+	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN | ATT_IOMEM },
 	/* OCRAM (Data) */
 	{ 0x20200000, 0x00900000, 0x00020000, 0 },
 	/* OCRAM_EPDC (Data) */
@@ -218,18 +219,18 @@ static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
 static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* TCML (M4 Boot Code) - alias */
-	{ 0x00000000, 0x007F8000, 0x00008000, 0 },
+	{ 0x00000000, 0x007F8000, 0x00008000, ATT_IOMEM },
 	/* OCRAM_S (Code) */
 	{ 0x00180000, 0x008F8000, 0x00004000, 0 },
 	/* OCRAM_S (Code) - alias */
 	{ 0x00180000, 0x008FC000, 0x00004000, 0 },
 	/* TCML (Code) */
-	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN },
+	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN | ATT_IOMEM },
 	/* DDR (Code) - alias, first part of DDR (Data) */
 	{ 0x10000000, 0x80000000, 0x0FFF8000, 0 },
 
 	/* TCMU (Data) */
-	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN },
+	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN | ATT_IOMEM },
 	/* OCRAM_S (Data) - alias? */
 	{ 0x208F8000, 0x008F8000, 0x00004000, 0 },
 	/* DDR (Data) */
@@ -341,7 +342,7 @@ static int imx_rproc_stop(struct rproc *rproc)
 }
 
 static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
-			       size_t len, u64 *sys)
+			       size_t len, u64 *sys, bool *is_iomem)
 {
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	int i;
@@ -354,6 +355,8 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
 			unsigned int offset = da - att->da;
 
 			*sys = att->sa + offset;
+			if (is_iomem)
+				*is_iomem = att->flags & ATT_IOMEM;
 			return 0;
 		}
 	}
@@ -377,7 +380,7 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
 	 * On device side we have many aliases, so we need to convert device
 	 * address (M4) to system bus address first.
 	 */
-	if (imx_rproc_da_to_sys(priv, da, len, &sys))
+	if (imx_rproc_da_to_sys(priv, da, len, &sys, is_iomem))
 		return NULL;
 
 	for (i = 0; i < IMX_RPROC_MEM_MAX; i++) {
@@ -553,8 +556,12 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		if (b >= IMX_RPROC_MEM_MAX)
 			break;
 
-		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
-						     att->sa, att->size);
+		if (att->flags & ATT_IOMEM)
+			priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
+							     att->sa, att->size);
+		else
+			priv->mem[b].cpu_addr = devm_ioremap_wc(&pdev->dev,
+								att->sa, att->size);
 		if (!priv->mem[b].cpu_addr) {
 			dev_err(dev, "failed to remap %#x bytes from %#x\n", att->size, att->sa);
 			return -ENOMEM;
-- 
2.25.1

