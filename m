Return-Path: <SRS0=jP1a=IE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220FFC4321A
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Mar 2021 11:39:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE33B6502E
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Mar 2021 11:39:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbhCFLiu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 6 Mar 2021 06:38:50 -0500
Received: from mail-eopbgr150070.outbound.protection.outlook.com ([40.107.15.70]:15171
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230259AbhCFLig (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 6 Mar 2021 06:38:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/RvwtzZxW0dI8OpKbrLcXXg2cWpt67ZngW2c2vcINhKE1z9jLa/nCMAHyV2eCdLCJoL8xWQ24rVoK3Sc2daiuooXzXhbrcNixZQ5AOyLqri8qRChkUOM3caZJnNCphczH9WZzz1y33UuFGdgRpZx3k66U2Z/VMHqvb7+pc1vooi2wV0R96C+I4dYfSJEOPoX+QkpSaBJaF6j+IbUAwwkFceRfBj4mtTlffcrteQbyiGAOcdrYkuii1S8bNv+pKcAg7l8d4AmkQs/JDuPG76VG5fsIWhOau0dR72pYKhu7lz8iHD8nxR+stQ3dWx+GqzkeZlmgfHQrM7l0qUmWpW+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfBczTf+RB1EWa5ibevseo+tYbxVdHstdpl8p+i5B30=;
 b=cOeUHdkyvNh7wm5P5iQm3xxOChRayK4eAsZevvwHL2DYHK4hKwnvGpaxfrLhuSq/9yveLIbZfFD6ddwNTyQb8450gSBseb92ki9T46bMjzZiSsym+HnEfX4ws8rkHEWlvHDAOZYLTdhesA0E7hRzu4YZtjJqqf69pQ66dZihFUhTv72Kh8145Q45MWDXIdZNfa47hPjqM3Qh8Rh0JOiEA8obAjSrL8gDq0+VuL7ydhJhQ9vjKnb4kFkSah0VJv9T12s6Ed1TkygVjvXqF9q+6cZjENlGtUsQ6ySNh8UGzll+eVv6IoAB/Hs7jXy0EYkxgRhLIln2KUqV99bQZR0JQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfBczTf+RB1EWa5ibevseo+tYbxVdHstdpl8p+i5B30=;
 b=GbXRXo/r5hjfyVW07dlrqguwpp7bl4SYbHPpQhHS1ryWApqBbcN+2OHKRrl7tBLdsMuxiPTcKgykK4PkkJbsSZEhUqiQJ8gisWzpfL2i+edTTTh/ckq7zfgn4h915rUv557szt+lHUCFLvAFZthNmLG8L9PaDnexTpGgZShzrCA=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0401MB2373.eurprd04.prod.outlook.com (2603:10a6:4:4b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Sat, 6 Mar
 2021 11:38:33 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.054; Sat, 6 Mar 2021
 11:38:33 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V13 10/10] remoteproc: imx_proc: enable virtio/mailbox
Date:   Sat,  6 Mar 2021 19:24:25 +0800
Message-Id: <1615029865-23312-11-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by HK2PR04CA0047.apcprd04.prod.outlook.com (2603:1096:202:14::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3912.17 via Frontend Transport; Sat, 6 Mar 2021 11:38:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0b858906-01bf-40f6-d1b8-08d8e0945f6e
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2373:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0401MB2373D8213D675066A0C2EC43C9959@DB6PR0401MB2373.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hM9Borsf9jMAWb7xB5NCMyu9F/zyqmaAI+1hT1fkfRLgkSKALZ+/TgdOWhqHG+OtKcM4YC7GOC+idO01MqR3nPrd89VZnngdchem/xrMC1DwfP6BUaLhMTpEVyzh8Z/gLtaOXCH7D/uq+VQK/a/ynsCvfH6xERh2lCw9wnKzrDBfVPdQIdpwyb7UqPIFjbdv0kQe8ejKLQcVpXguMO4BxkCg0BdpK3Wf/Y8ah8s3CNnac3N4COTM/oGgySZMLL2/Ns6SCW7oUTVllbLDmPZqn/SlSLS5VX2BN5KqncHpXHyOcPK1bpm9IXo0LxiXLzYc0+nm+Bj+MELUulLybgoQeKBUww1p8a+BkmP4+4skjuUkugBqKIKCwnQN1/YM+PpBumCQV3bRU2+4AUTd2Iu65g5hIUQlPbr90h9ylpk1ISFSHwzPdVSq4jBTHI+ibcF0bVNjH4y69MBfaBeQSBnI6Rob+7B/4dWND3+gQjM0xFD0tHUGIhOiWHJ7pdl1LK21SlBOtAPxgUsUXR1lHaGCxz3is+aEmRmf5CD1/afX3JNAlFo7gVWc8VQducmL4J32EstPeF7oL77NSYUZdoq6rw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(8676002)(26005)(83380400001)(186003)(16526019)(9686003)(69590400012)(6512007)(15650500001)(6506007)(86362001)(4326008)(66476007)(2906002)(6666004)(6486002)(956004)(316002)(2616005)(52116002)(66946007)(8936002)(5660300002)(478600001)(66556008)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?L6FYJjxst8AzslkhL7XFKDLpNWSZjng4kLyMSsUTrTqDJIekEPHyZbGR/cl7?=
 =?us-ascii?Q?w/dYF55R+FPnECemggG00l7VThLixFSHtI5CK5PcAyDtEpr5pwFMd8qzi3Ez?=
 =?us-ascii?Q?aY99imL6gdFwWZmLi3awgkR3Xbtiq8Id/4YTghS5CZCd7XCuzsvlpjxJZ/ca?=
 =?us-ascii?Q?jH902FjTg7s9S1hviL/NI5TVQlQ+D3d47oKyLuHxBssO59BA6LMiKQnyMuUT?=
 =?us-ascii?Q?F8Mkk1+3zHRk7VLd9hvCWytC/SY6uCqJX0gweAtOGuB83/KUt383CjF9dzCK?=
 =?us-ascii?Q?tE11OGKa6C7uhL7rn0W/nWt36/oVNKx8/63clZi5TkBlTw88T4kcGQciCg2a?=
 =?us-ascii?Q?2UJu38okEn/WLfUUxamCkXCstbUu2nfrObQ0zj/E/fb7i3+Wb4euYUt/rf3S?=
 =?us-ascii?Q?Rq8AOxu2yUQDDxll8HKd/YiF4HU+NRjLdwbM/1VzMnmauZcXPiR/wun5Qx7+?=
 =?us-ascii?Q?bKdyk7fgzAJSh2MlSCUZ0TNpWo5Y9rfKtSgrj9kPJ8EEPanglNunTcX5uRo4?=
 =?us-ascii?Q?IvL+etP6xQoTZneGSNoeSdDac9wlXEBINhgD5Iy4I4hr3rxFzCAi09CXq0kN?=
 =?us-ascii?Q?stLfG3fiW5DFVZVlRnkD0l4UJWsyFpK7MMAiV7mZy08OwLd9/DmrNGc7sXmt?=
 =?us-ascii?Q?hVrWB1Jg+6FRyU4xqH5aGgFvTgNhbRc5FhRZ+QJU+4T2WPMzqJ0wGH9Pv5wy?=
 =?us-ascii?Q?3ZkvtbAWs3SLtzOhGhkq1rUv4yjAcqjoj2SnnfcBWL/7oPsuKtvQ/IPnqt24?=
 =?us-ascii?Q?r0tp78k1cwOgKTDJdhOw8GmJ338Z33s+M/1bmOB34yuWvPUwFKGBcj0xgpm5?=
 =?us-ascii?Q?eu0uexflNeNIl2xexdGahGxJYAFsfZtnxvtp1q8hX7p7DI3sAt7PCDMv+T3T?=
 =?us-ascii?Q?Ceu9sYFeqX7Z3dGC4eI1HfL7B9gWKyRfHPZ1JSUiBj2BeobBnZCkSxqgKsKv?=
 =?us-ascii?Q?cWJG30PQzY5/H1B6KOPfeKy8qkUchCegNO+9yGvilbC+MYqxYIClLgM6bx6V?=
 =?us-ascii?Q?1npTPyCgV823sU+pUR0gMu1YGXP5QwfH+jsVqS7J6UARfFE/DCmdMIx8QDXM?=
 =?us-ascii?Q?EnU7M0ZGVYZLkh7sIWpSPa0RzONkKxMqcbMrGBB0M/VaRSLwd3zQrmwIVFoE?=
 =?us-ascii?Q?ZKvgyhIWAu4rZ9/TWu52hJW0RovlTJYjtLNYYkX3FLufahX3Z6zNku1/yT2a?=
 =?us-ascii?Q?+7RRofe0SzReGw/w6zAkWI3sgH/z+IMBxx2ryH9VUT/Agg8b+9TgF9M3p5Vb?=
 =?us-ascii?Q?IGmUnp1FMBMfkywCvf2vfoKBHMJKxDMFb9AQq3lKIkdjGeUMpr9ImkmdnTLP?=
 =?us-ascii?Q?GRtp3AbuoxAroeuOedOijD+5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b858906-01bf-40f6-d1b8-08d8e0945f6e
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2021 11:38:33.5754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkKJN/gAK/Ip7r91DrQm5BtQqiMl4Pj2Hj/u73DWRKYA351SQb8t30P3DnxR1s6Vp0rBD5sfNQif3njR5TObkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2373
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Use virtio/mailbox to build connection between Remote Proccessors
and Linux. Add work queue to handle incoming messages.

Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirer@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 116 ++++++++++++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 3685bbd135b0..90471790bb24 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -7,6 +7,7 @@
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
+#include <linux/mailbox_client.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
@@ -15,6 +16,9 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
+#include <linux/workqueue.h>
+
+#include "remoteproc_internal.h"
 
 #define IMX7D_SRC_SCR			0x0C
 #define IMX7D_ENABLE_M4			BIT(3)
@@ -86,6 +90,11 @@ struct imx_rproc {
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
@@ -366,9 +375,33 @@ static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
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
@@ -444,6 +477,66 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 	return 0;
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
+	int ret;
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
+		ret = PTR_ERR(priv->tx_ch);
+		return dev_err_probe(cl->dev, ret,
+				     "failed to request tx mailbox channel: %d\n", ret);
+	}
+
+	priv->rx_ch = mbox_request_channel_byname(cl, "rx");
+	if (IS_ERR(priv->rx_ch)) {
+		mbox_free_channel(priv->tx_ch);
+		ret = PTR_ERR(priv->rx_ch);
+		return dev_err_probe(cl->dev, ret,
+				     "failed to request rx mailbox channel: %d\n", ret);
+	}
+
+	return 0;
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
@@ -481,18 +574,28 @@ static int imx_rproc_probe(struct platform_device *pdev)
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
+	if (ret)
+		goto err_put_wkq;
 
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
@@ -502,9 +605,11 @@ static int imx_rproc_probe(struct platform_device *pdev)
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
@@ -515,6 +620,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 err_put_clk:
 	clk_disable_unprepare(priv->clk);
+err_put_mbox:
+	imx_rproc_free_mbox(rproc);
+err_put_wkq:
+	destroy_workqueue(priv->workqueue);
 err_put_rproc:
 	rproc_free(rproc);
 
@@ -528,6 +637,7 @@ static int imx_rproc_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(priv->clk);
 	rproc_del(rproc);
+	imx_rproc_free_mbox(rproc);
 	rproc_free(rproc);
 
 	return 0;
-- 
2.30.0

