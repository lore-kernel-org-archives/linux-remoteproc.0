Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A20AC07E95
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 09:41:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E03EB61C7C
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 09:41:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbhGGJoN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Jul 2021 05:44:13 -0400
Received: from mail-am6eur05on2078.outbound.protection.outlook.com ([40.107.22.78]:29792
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230429AbhGGJoN (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Jul 2021 05:44:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MD+2mWxl8svukDVtrXu9pcayVE5mCHPlUgqOLLuNZj7UtfhCIrMabwe5NBvr4ECG5YrLL8W2Rxfe7YPHT8O/5Ki2YeHtg407v8YZcHlg4zzI8TSlBBzQxEWr/B++SIuC7PqZV1341hFLsRFfnf/23V6f0umrENDFaAtyaQm6VdaA/fpuh1rdaZJMXe5nWzsPqkG0JZf5Q2qRvhp/qSurAsvquO+Q/I3bEiz/xPZEGumeTkls78b0Q8fh2Nxs64kB2rE1pNn2TLVbdEJTGr8yhBXJOhmMdB2Dxrs1d0ZFZpkDzu0NuWNiMiPYfJVv+zghQjzWBq/y+ztAXCwgRs9clg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWQDcF5O+cEIYybOy1SEcSLOpdhIOMyGfjGsYKhZrBU=;
 b=K8CAPPmqbKnFZJQYIB4UcwQ2MWWvjRPbFxg/BarrDMqOzHYIPGNQdrvOXMTFcqmThNW3S/0la3pUyqDs4iyGxP005xQdy5I1znK9uw/wPHPAiKia4WwR34sSgS/9rx1o/0TBumPY0ZgupH07Z7A7j6EK6lVX+8xu6Vz7hzbvCet2tybiuTWa7+6AxspiOdeGZCCQLndkH4Lxdvz7VgrLpsvU7jeJsrl52aqdij6cm2ZGCt2N8UvB/IVBHGO0bRRDFE48SN7XYAT+1capU7+mgF/xrLAPHAL4HIBlpZoULczSet3mICgxVutDtdUfPDLPXHwmKHb9je/DgnZhPNJeog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWQDcF5O+cEIYybOy1SEcSLOpdhIOMyGfjGsYKhZrBU=;
 b=pNPmCsLg/u5QEQN6/jVpI2WoPkts78KQWcq1GVRUkMAFLJrtgXCWpwHKGSKhbjG+4g0T0dB9jvl1j+1w8dkcIMvDeU1yyYE8A1bTqFxoBI1uEPrpUokO8tOTQ4gTK34fTLxcThGqvzFQUShYoAKoOxqgeYQyR7WiA7A7OaK2vzA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8824.eurprd04.prod.outlook.com (2603:10a6:10:2e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 09:41:31 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4308.021; Wed, 7 Jul 2021
 09:41:31 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-remoteproc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, ohad@wizery.com,
        dongas86@gmail.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, Dong Aisheng <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 2/5] remoteproc: imx_rproc: fix TCM io memory type
Date:   Wed,  7 Jul 2021 17:40:30 +0800
Message-Id: <20210707094033.1959752-2-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210707094033.1959752-1-aisheng.dong@nxp.com>
References: <20210707094033.1959752-1-aisheng.dong@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0112.apcprd03.prod.outlook.com
 (2603:1096:4:91::16) To DB9PR04MB8477.eurprd04.prod.outlook.com
 (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0112.apcprd03.prod.outlook.com (2603:1096:4:91::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend Transport; Wed, 7 Jul 2021 09:41:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbd5a01b-b21f-46db-c7a1-08d9412b66be
X-MS-TrafficTypeDiagnostic: DU2PR04MB8824:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB88245345C48560B1B4A718E3801A9@DU2PR04MB8824.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:469;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jNVIUWyXf+bTGyGupsq/JoLjWgJ00fImBxGTI7KVCERKl3jLCCyiwWm1Gpoyl+oSURLoskO3dGCwv8h1zUMSzTZsPZLJxLeqHaN/L4YtIwMZw3qT8sGJMQt0ieRAHwyYcHWkpYhaQSWAij19d/4Q92DYlWUkVJqzq+/DXRE+MktCzlD07+Qf+GOKuBuK8+OOcCCKLaUFDNhu0Dw+8BQz10WKfEPXWPs3tNgl8pvcKgOLc39SsnIWlZFagChW806kkqLxSKa92P/qhAcvoj9JrHM+xnlNLBnxGXxwIHJnlKTD9DW8Cbnf38yYsGb6Jrz3jwrPK15Gw4JBHDB3GhVn6NhFWupGDdWVnztxWomgbrDnecZlZoiuX0DCuE3Omh5PpVzQ+HgYL+h/gF4FZVUcC0j6pBadDn5obHaPgsxWmr6SXwnjj3e3LUDm7zqApdctRmr1RKVzRoAWBjAVutX1hBhXjt+BJMHe9MTX2Nm73dB1iKFSHwzCKRW18hhP3XN+G5qphx+DKg+a8R4+OtZinYPZxsTzb4oV7JuOUWjTLZdC6xLtMo+LZ1Gif7MR7wfeI3P+MllyxS9H+5v+1QDTtL8b3ur7V61oSdCa6P/I9IjDwsqH68111Bw6ZPITzHI5UU1x5l2PQeZvhIaiOvxYKrmMMbYG+qeooGJPMU0T4PukcfSNrKRYIwbk4EDZ17YP56QvJoosmkYyp19lrdhu5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(5660300002)(316002)(66556008)(186003)(66476007)(8936002)(66946007)(6666004)(36756003)(54906003)(6506007)(478600001)(86362001)(4326008)(83380400001)(2616005)(52116002)(26005)(6916009)(38100700002)(2906002)(38350700002)(1076003)(6486002)(8676002)(956004)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fA+/Yy2fWx4RIzGLthhHZJiKVcw2D6mSt6krM6KnRBp7t+FLTiouTF65uI3P?=
 =?us-ascii?Q?dChpTQBgiq1ngYuDZ0nMsCBzafwrtkrDFRTHDTmJqntD/YccJeQvkxQirn2T?=
 =?us-ascii?Q?nNPMl1kMdIjz/CkohL6rSWZGWHW25j3oI0+LRN8Ckti4xSCNc5DjJe9JH7h8?=
 =?us-ascii?Q?7aQXbuxGKCoTx+6ivbxpX06dGvkEj84xg8zCoCGGCktSH96VTk+4UevKcwk5?=
 =?us-ascii?Q?dCQgJrZU81WvZoAtxnY8+X1VJzUWudvDiv/iHJtJ02DX0atf7EXFW4K0YCPg?=
 =?us-ascii?Q?xFMWkFxjuFi/wPWZtLyfsQ0NvSYKJOw3ZS+NMTB46uu/v4cFDZaGkwD50G6x?=
 =?us-ascii?Q?bMFMDE5lXFmgI+Q80E7Lulut8iRTxKsFZEfhp6p83uXriGj5HDDLfrzsD9q6?=
 =?us-ascii?Q?qDUMK5ki30ZkPAy8Oup1vKd35guaPJLVg/ODniYapir1h5CyfbdCIpRQeSH4?=
 =?us-ascii?Q?olLpfCJOw+J2QF8YxSIZuyQs0VuY1nw/tTQixZicH/zcZnxRO0WbA+wsaqcq?=
 =?us-ascii?Q?amxAMrmaTW2rU2DC1n5cW+Oqa7NbBcYFSTFjSq4vYtz3TH07kEO8FdVR1L98?=
 =?us-ascii?Q?LHt4yBa7fd/9KLxSho/6BPGfP6lqDGuZxeW125Z0OdcBLq52ToY3kO+0Q94/?=
 =?us-ascii?Q?jW983W8HZy6pjI8hSns+rhDqetOZtaaPFa/AMoWbsBq53W/t144UahgbumHt?=
 =?us-ascii?Q?KhPAD6Ip0jOJMw5X9YyN4SE0uhmgFaotfrDeqL0xBg0lJIBT0Njgh7mj7e6O?=
 =?us-ascii?Q?cszLj/Wyb8ugIoYHB8hqAeNL9Yg8Ol6MGrDIur8O3yPvH2iC9KShYQaPuQqm?=
 =?us-ascii?Q?qw4ZuRWzjJt665lCmAJUYwdEq006VHsFrpkZFep3DuTMx2sy2ZuBiPXPQULa?=
 =?us-ascii?Q?xmXYBJm/BCCmN6P4Lv1Nd0Ze4gbuR6utNj66/cg7woybeFJXJdTijO2Kbfdg?=
 =?us-ascii?Q?L1TQR3kU8yM/uKDUZeiHc09xJrJ7K2CdXXpN77yXS4LxuTca7jQrTP+uEHRw?=
 =?us-ascii?Q?aKzTncc6241eZL94WNbVaacjmk5/WmOVq7FycDGFQy8vwYIoyU0BgB2XnB31?=
 =?us-ascii?Q?8cWFwI323hh0At920Jad1BQHBhlUNFNOtEnfa3MiP/j+A7AhjaDx0Ygx/vjl?=
 =?us-ascii?Q?2aPZK92TW0wstQjvjJlMH0O6kx27+AYr7LpyKPEmS4Gix2+xcexnnj6zAUec?=
 =?us-ascii?Q?cGD9xZquXmVC3DJJVVhZ0kdfMVvopOonih7rN/S+hPes/YwpMjTVAcAya3oA?=
 =?us-ascii?Q?sC0IdKdHfF7N02ZwYVPV2khE9wfgbcAAhqw9gSUEOkXF/soJDicCbWaZkJsk?=
 =?us-ascii?Q?PRnNtkQ0j9DsF8N1l1XR4nkY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd5a01b-b21f-46db-c7a1-08d9412b66be
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 09:41:31.4874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8Ns/AKk++mSu+6Y3o80Kzva9jkigPyV/cHei4k8ZKOkFCPujqHF8Rt1EOvyK8638kl3VW893m7AO8ETMesAoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8824
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

is_iomem was introduced in the commit 40df0a91b2a5 ("remoteproc: add
is_iomem to da_to_va"), but the driver seemed missed to provide the io
type correctly.
This patch updates remoteproc driver to indicate the TCM on IMX are io
memories. Without the change, remoteroc kick will fail.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>
Fixes: d59eedc0e408 ("remoteproc: imx_rproc: support i.MX8ULP")
Fixes: 79806d32d5aa ("remoteproc: imx_rproc: support i.MX8MN/P")
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v1->v2:
 * using ioremap_wc for non TCM memory
---
 drivers/remoteproc/imx_rproc.c | 35 ++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index d88f76f5305e..71dcc6dd32e4 100644
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

