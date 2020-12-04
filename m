Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361C4C433FE
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Dec 2020 07:15:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6FA7207C8
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Dec 2020 07:15:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728673AbgLDHPI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Dec 2020 02:15:08 -0500
Received: from mail-eopbgr60075.outbound.protection.outlook.com ([40.107.6.75]:2951
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728473AbgLDHPI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Dec 2020 02:15:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZdTaVbmQpuADNJi4AK3kIR8UuvhXm1hA/ZbunJ5eGQDVFXc8IfCpUyFRUw9tw5wdHxbCZ9ZB9aR16qpNt1+kJTPK//9MzIbAptQZ7ta7FY7YbdoTK8o97WiPzs1tu3OWAj/V/EEmzKa4cvR3UYQ+IRd7lhojqi1jyjWhUDEWiZNRhylX/ztcckThS0pPUxzH3ynNsBW5jxnODSuxedMYUoQm2xmMj81gX2xcGm3hXLwL4Q6sY893upTKgwPdYQxs4m8yxt96P3Kv2+/HlyMiRr2cxw1kfKRlwo9R9K9W6wEU6HEAoNolMrrJTMcv7va847EeWRgLTJr9CWWXUyMew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWI1iBwj+ZcTpsP+Y7/u5FuTyoCxkVZVW9/7Kbc1bQc=;
 b=ilFZBxm6JdvbBcfYTzzHddk23S6zDuOwUP2BtQUTrMlyn9vWIOPJtHeCjt6HOiQnYOz4y/84k6bXs7tSo+YgtNNXuCaJKyJvrtsCe7KY7AZfjVjcLiGHjzF7+AOpHOtOu+tcMrmmnx0AlwK2n4oOaTgkwDDa9tHG5WJ9bfcLjLRWeHqB8vHwC7qOUa5cC3b2o8/J5Z1wpLEobX+Jra+rbWwSx1lXRLzpeSsJi8CT4G15M71ADbGQl0flhs6n9c3/RBfBq5boV1oDEQYJLtHXoXLs/URuMIYOSxLqvBec3Tynw2GFGWAn8GrY6/XbibX+wr0wYTO/bUqXK7EqbSGfRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWI1iBwj+ZcTpsP+Y7/u5FuTyoCxkVZVW9/7Kbc1bQc=;
 b=iv0yyssiMtbdpPKHAu50yAPyFIYtiqw+SQrWt4neV4+w1/k5MJscrpovPCODsV7syzfqJWPBqA8fXv/V2Bl/4iQV7Y1/fjx/hTNi29mWIcQ/UxxLmddAoHSqIf5mK7u6CRyOF60pmmfhLgz4wD4pUR97YUoJ5CjPkzwycwOZ6tU=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Fri, 4 Dec
 2020 07:13:21 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3632.018; Fri, 4 Dec 2020
 07:13:21 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH V3 7/7] remoteproc: imx_proc: enable virtio/mailbox
Date:   Fri,  4 Dec 2020 15:40:36 +0800
Message-Id: <20201204074036.23870-8-peng.fan@oss.nxp.com>
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
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by MAXPR0101CA0069.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Fri, 4 Dec 2020 07:13:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 23e76920-3d87-4edd-2d3c-08d898241515
X-MS-TrafficTypeDiagnostic: DB7PR04MB4633:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB46334C0485936BA804E68C58C9F10@DB7PR04MB4633.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:182;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ++33u3oGkCgVAxaBU41v8ZgpCbSsYdSmctOJ2w9UgDeymIpha+A3q4PSUVfywy2l2+199BnzLbveAUWLRJc+bQ+N2ukey7siN6GA23V6mpw+K1iluEFx43TeBY/Q9n4efjFxNxcBZpvduLjb4wRV4nRzvUpNMYP+Ffnix1UjGJvisaA5K0nFjujTEbyEROjYV8EMmQ8XJl/UID2SCBlQvlCHnOKJ1G5SJK3WM0OAMsONSXcrtgxEsMosYRIPzgGa+ZEzOyVvva2r3pMKPnnD4jpG2Zve6heInQ8mtyR0AgZEZejBcZuYkXtA75DgRGgIFAHdtyD2/JwZHsIVdzLdvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(86362001)(52116002)(6512007)(7416002)(1076003)(83380400001)(15650500001)(66946007)(66556008)(498600001)(66476007)(186003)(16526019)(8676002)(956004)(54906003)(6666004)(6506007)(2906002)(26005)(6486002)(8936002)(4326008)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?20jcHlJGWOS/YlNPCvPs8tndcn/mh1nGgoOANwHdcqXvgOs1JdICYU00IfxX?=
 =?us-ascii?Q?YSCgIwM2jEU+yq10JTUhr+YAqTr99PGC2LnmBexqH4uMwFS5SkOABaqPMGh/?=
 =?us-ascii?Q?k0pPXPutok/37MOk0sPc5olq3kOzayGafqnmDPC2Umnfobi28N6DNx5Mram7?=
 =?us-ascii?Q?+vlkWUYgzEZIkd7OhdvPPVLPe72vCEXeIQr50pkPOeC/wxPc0QPipFPLkO4H?=
 =?us-ascii?Q?vpVJw6t26O8+I0Wd9kgpXAGfZLHeA/zCbP4jX6EiPfvFxqyVlNqyaBmYhClT?=
 =?us-ascii?Q?zh19ioudSD6B2LOiVmhhLsE3I0Lin+WkHSS17/UjzcV5ekETM6ECxS4ohI++?=
 =?us-ascii?Q?YIWbtTZOXynN08LhGr0DDczIjWm8K8CzmvjMjUU3Rh1/LusgcwUDgMZ5+OGS?=
 =?us-ascii?Q?w9FAapZqvOQm5sEFG2LSWCjE+u6R7U7Lfe6U7cvbaVzvEp5nm1+cnPkDS+Q2?=
 =?us-ascii?Q?/2lEWZKCQfa/kR04MyzLR4AqmhFwpPRa6yyFTUlZCl7yoM06V/FZhjfpVedm?=
 =?us-ascii?Q?22OpmwMPloFZEv3qZX+vNAn4U/p8MF0+wb9u3I1zad7ScAsxqZabWTeGIgXC?=
 =?us-ascii?Q?aA12rQjKM6o2y3sVQcG+orMx+q4qMzpd6F03ELDZO9Z6Ga2rab74f/V44sLs?=
 =?us-ascii?Q?BkZnGTSghKLxVV8f5ZOBTpn9nvv7dCUzUAyhewNWtnaaIy5oMx/mVCjbKj3U?=
 =?us-ascii?Q?5KgdHNf7tbbzTqjtaY2KVAjjxEAFnqxv4QLlLch+uqMCQ8KbleCpyPSUD01J?=
 =?us-ascii?Q?2AqIyeEpqLSZIXrHqukscDj9leMMNhsoamR0TWjRxCPQ/2vJzI7RgErv5k4d?=
 =?us-ascii?Q?2nQy2ZbPSnlLTHRvfuCIhPEbGh4OxZcEiecHqVzKVKzWa63UiVM09fjYn+wI?=
 =?us-ascii?Q?xkF2CVr/ck+eFJxUs8n7yd7DXs8cBR1EEEXjM9b0r8Qkg12WGjxz5f2CJoWH?=
 =?us-ascii?Q?xCmk9olaQGWf/J2ZeQS4xfDvXnd01bmDZl8HmwwOeOo35dxM/T1ukSg6ICrc?=
 =?us-ascii?Q?SYeN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e76920-3d87-4edd-2d3c-08d898241515
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 07:13:21.6207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HoKuq30Ac7cpOhzX0pH3VROxcxP6ewMOt1294zH4W7zNy28+LGYIqXDac387TqHdZY/YaOOhBxfHQ9ojVuM2yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Use virtio/mailbox to build connection between Remote Proccessors
and Linux. Add work queue to handle incoming messages.

Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 133 ++++++++++++++++++++++++++++++++-
 1 file changed, 130 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index afa650610996..584584a00921 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -8,6 +8,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mailbox_client.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
@@ -16,6 +17,9 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
+#include <linux/workqueue.h>
+
+#include "remoteproc_internal.h"
 
 #define IMX7D_SRC_SCR			0x0C
 #define IMX7D_ENABLE_M4			BIT(3)
@@ -88,6 +92,11 @@ struct imx_rproc {
 	const struct imx_rproc_dcfg	*dcfg;
 	struct imx_rproc_mem		mem[IMX7D_RPROC_MEM_MAX];
 	struct clk			*clk;
+	struct mbox_client		cl;
+	struct mbox_chan		*tx_ch;
+	struct mbox_chan		*rx_ch;
+	struct work_struct		rproc_work;
+	struct workqueue_struct		*workqueue;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
@@ -369,9 +378,33 @@ static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 }
 
+static void imx_rproc_kick(struct rproc *rproc, int vqid)
+{
+	struct imx_rproc *priv = rproc->priv;
+	int err;
+	__u32 mmsg;
+
+	if (!priv->tx_ch) {
+		dev_err(priv->dev, "No initialized mbox tx channel\n");
+		return;
+	}
+
+	/*
+	 * Send the index of the triggered virtqueue as the mu payload.
+	 * Let remote processor know which virtqueue is used.
+	 */
+	mmsg = vqid << 16;
+
+	err = mbox_send_message(priv->tx_ch, (void *)&mmsg);
+	if (err < 0)
+		dev_err(priv->dev, "%s: failed (%d, err:%d)\n",
+			__func__, vqid, err);
+}
+
 static const struct rproc_ops imx_rproc_ops = {
 	.start		= imx_rproc_start,
 	.stop		= imx_rproc_stop,
+	.kick		= imx_rproc_kick,
 	.da_to_va       = imx_rproc_da_to_va,
 	.load		= rproc_elf_load_segments,
 	.parse_fw	= imx_rproc_parse_fw,
@@ -454,6 +487,77 @@ static void imx_rproc_memset(struct rproc *rproc, void *s, int c, size_t count)
 	memset_io((void * __iomem)s, c, count);
 }
 
+static void imx_rproc_vq_work(struct work_struct *work)
+{
+	struct imx_rproc *priv = container_of(work, struct imx_rproc,
+					      rproc_work);
+
+	rproc_vq_interrupt(priv->rproc, 0);
+	rproc_vq_interrupt(priv->rproc, 1);
+}
+
+static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
+{
+	struct rproc *rproc = dev_get_drvdata(cl->dev);
+	struct imx_rproc *priv = rproc->priv;
+
+	queue_work(priv->workqueue, &priv->rproc_work);
+}
+
+static int imx_rproc_xtr_mbox_init(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	struct device *dev = priv->dev;
+	struct mbox_client *cl;
+	int ret = 0;
+
+	if (!of_get_property(dev->of_node, "mbox-names", NULL))
+		return 0;
+
+	cl = &priv->cl;
+	cl->dev = dev;
+	cl->tx_block = true;
+	cl->tx_tout = 100;
+	cl->knows_txdone = false;
+	cl->rx_callback = imx_rproc_rx_callback;
+
+	priv->tx_ch = mbox_request_channel_byname(cl, "tx");
+	if (IS_ERR(priv->tx_ch)) {
+		if (PTR_ERR(priv->tx_ch) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		ret = PTR_ERR(priv->tx_ch);
+		dev_dbg(cl->dev, "failed to request mbox tx chan, ret %d\n",
+			ret);
+		goto err_out;
+	}
+
+	priv->rx_ch = mbox_request_channel_byname(cl, "rx");
+	if (IS_ERR(priv->rx_ch)) {
+		ret = PTR_ERR(priv->rx_ch);
+		dev_dbg(cl->dev, "failed to request mbox rx chan, ret %d\n",
+			ret);
+		goto err_out;
+	}
+
+	return ret;
+
+err_out:
+	if (!IS_ERR(priv->tx_ch))
+		mbox_free_channel(priv->tx_ch);
+	if (!IS_ERR(priv->rx_ch))
+		mbox_free_channel(priv->rx_ch);
+
+	return ret;
+}
+
+static void imx_rproc_free_mbox(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+
+	mbox_free_channel(priv->tx_ch);
+	mbox_free_channel(priv->rx_ch);
+}
+
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -496,18 +600,31 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	priv->dev = dev;
 
 	dev_set_drvdata(dev, rproc);
+	priv->workqueue = create_workqueue(dev_name(dev));
+	if (!priv->workqueue) {
+		dev_err(dev, "cannot create workqueue\n");
+		ret = -ENOMEM;
+		goto err_put_rproc;
+	}
+
+	ret = imx_rproc_xtr_mbox_init(rproc);
+	if (ret) {
+		if (ret == -EPROBE_DEFER)
+			goto err_put_wkq;
+		/* mbox is optional, so not fail here */
+	}
 
 	ret = imx_rproc_addr_init(priv, pdev);
 	if (ret) {
 		dev_err(dev, "failed on imx_rproc_addr_init\n");
-		goto err_put_rproc;
+		goto err_put_mbox;
 	}
 
 	priv->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(priv->clk)) {
 		dev_err(dev, "Failed to get clock\n");
 		ret = PTR_ERR(priv->clk);
-		goto err_put_rproc;
+		goto err_put_mbox;
 	}
 
 	/*
@@ -517,9 +634,11 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	ret = clk_prepare_enable(priv->clk);
 	if (ret) {
 		dev_err(&rproc->dev, "Failed to enable clock\n");
-		goto err_put_rproc;
+		goto err_put_mbox;
 	}
 
+	INIT_WORK(&(priv->rproc_work), imx_rproc_vq_work);
+
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
@@ -530,6 +649,13 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 err_put_clk:
 	clk_disable_unprepare(priv->clk);
+err_put_mbox:
+	if (!IS_ERR(priv->tx_ch))
+		mbox_free_channel(priv->tx_ch);
+	if (!IS_ERR(priv->rx_ch))
+		mbox_free_channel(priv->rx_ch);
+err_put_wkq:
+	destroy_workqueue(priv->workqueue);
 err_put_rproc:
 	rproc_free(rproc);
 
@@ -542,6 +668,7 @@ static int imx_rproc_remove(struct platform_device *pdev)
 	struct imx_rproc *priv = rproc->priv;
 
 	clk_disable_unprepare(priv->clk);
+	imx_rproc_free_mbox(rproc);
 	rproc_del(rproc);
 	rproc_free(rproc);
 
-- 
2.28.0

