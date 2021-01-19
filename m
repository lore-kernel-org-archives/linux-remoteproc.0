Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC679C433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 07:52:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8625822D71
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 07:52:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730560AbhASHvV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 19 Jan 2021 02:51:21 -0500
Received: from mail-eopbgr40078.outbound.protection.outlook.com ([40.107.4.78]:56549
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730808AbhASHuQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 Jan 2021 02:50:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5iQh6ylBzW7Bfy74hGM5BA2t/IyKyX886q4VXCMb7tHPZL0TtlyFwFhOkFOhx9pflgkClvrx+bXXJ6Hn8ATOYMsTM5fWxfhJF4PnrpBkx9wm6dgYQ/POwqQSrQOyWbILd7l6i/C5mzQbtn0hltSwHf2Eq/S9jBBd6+Br3Q/IRNFxhD7FxL5mfr3RP26KjupjP2xZTpUxuS0QGm5ZiIJ7e04Di4zxPDvEkbXioRui0y3ulHjyPO+OuSzTn5upcBASfzAflslaj29NsIFj8/6BpNRURJGmrYFzakmRX1cmN2QUFoCmL6dexNPGMteu4AK86RZlm6Ha+IY4fGnoA73XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xh8siq6zsX5K/BAtOJDXJAS7RQs5VeiSiq32qYrA5I=;
 b=YHb5jxgsP1s0jYZsnJ5nOWatmENr7VTuLWLHeUv4IZbRqj5yCBSEv7NTnu3vCtpdqQ/stjgI3SyyobHie1Fgr+LDEdjYpeoz5peK8E1NgDcuS3x+3tQSlwKZW52ghU6OQRFwIiYAWUQGymEvfl3MVUhZavOkq8OVYwS5MD5cm5fCMblo7nXjmCUhiMjobjjqnmunPWCqr0isuF8s7MPYLAPCe3jm/ySlGUDEKw5vuIPIlUTYnDe6C7Nlg8pH3C0mrTxVvQvM565hyPI3HVMpKCiERQtHSCqmwfNtaoqCB8oGl47aFYK5XkbTH3qTiKtqQl5IGB9Fy7fxkvbcYCF7JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xh8siq6zsX5K/BAtOJDXJAS7RQs5VeiSiq32qYrA5I=;
 b=mG181YPlQEdn4krDUlgCsuNsSgjaRmq+inQpFxmoeYxQx+KjVcT+nfQIWZHvg2781VmuZtcgj1zldyAXg2DTEVnNS3SMznP8ZopmgDgdT9VAVmf9oTzV3rNq9sWLVzjc4l3A0c/4uE8jBx6XnKUMV3ZgIdx/YFKcNHyzd34jgi0=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4492.eurprd04.prod.outlook.com (2603:10a6:5:39::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Tue, 19 Jan
 2021 07:46:34 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 07:46:34 +0000
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
Subject: [PATCH V8 10/10] remoteproc: imx_proc: enable virtio/mailbox
Date:   Tue, 19 Jan 2021 15:35:11 +0800
Message-Id: <1611041711-15902-11-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611041711-15902-1-git-send-email-peng.fan@nxp.com>
References: <1611041711-15902-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3763.9 via Frontend Transport; Tue, 19 Jan 2021 07:46:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0b5c61ec-94f4-479b-f755-08d8bc4e57df
X-MS-TrafficTypeDiagnostic: DB7PR04MB4492:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4492E5BB66FB436C2B71CAF988A30@DB7PR04MB4492.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a1c2xceQ5SKZAJllSgTARUaK5XJvbswg9b6c8TbmYR8SxU8W2xekb5nuzgMW0WuE9nmVUmP/PCKNN/tEfDfl1Ymx8bnis43v6VVwycbYvLpWBv6cteCmLdKgI6buKQ+qI1rGew7sKSHZtfCq5py3gwDfYxNc6q5yxm1j22z5hS4/7GNjrXRhLu+5224/N8FrMB5tINmj1O52bZGxJQGj6pnnAqZx97VBSp+rQSg7MVNHYpnQUXIKWWOTPy4UFSuoKfzxm2HyXkaqVb0VZxHByvSBso94/SnIQI+K9ELbn+PRDt5jSz093c78eG3DTTFgTvlU2k7Bo1O1959T7GUWuoZrWiLTswOqmHnHE1mPUm2pwh9+eU5MZv6qZxvhj8COYtW2RKvAgXXMw1Exr6LnDy3Er01u337A/htw7/It0SOZhG1fdTMQQryYTYk0qo83/tjJeAypZKFB60vhfmJ5ZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(2906002)(66476007)(26005)(69590400011)(4326008)(15650500001)(6666004)(66946007)(186003)(83380400001)(6486002)(6512007)(2616005)(86362001)(36756003)(52116002)(8676002)(6506007)(498600001)(7416002)(9686003)(16526019)(8936002)(66556008)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?U65IPxjzI+nVmc1vXvrAa5y6hLFVOxirO/hCRkHIJ9vR5wozekg7g1NAHxF7?=
 =?us-ascii?Q?GEC53pswMP06qTBgMO9pD89jcsx/g0cctzdtke8QrJR8ScdbiLHoXEkjiD96?=
 =?us-ascii?Q?9y24tQ502fGOAm/f3RJlPPWMZaYcFPuLrGi2PLaJoiIdoq9Ri+gjfTjjV3ud?=
 =?us-ascii?Q?H/peBVM00aSnSZx26PqDejeTuO5pHsoA7ZbDwvxdpIs+1YIs5VD5ywn4FngF?=
 =?us-ascii?Q?Bug8JcgT1Uo/j9Wt5gSsGBLBDb4xMajUH5ZET6e1BZ5xjWzpR1hxDwWhJDQ8?=
 =?us-ascii?Q?I/nSJmOzFKUHoKdoQNkwNDVudyx+N8wwiMM5rCgCwBlAleYjkaJzlpPmxTxd?=
 =?us-ascii?Q?Mlv2gbgtudY9VeETbUNvPVmJsJd9qZ28RCLVJzzUvz7a8J0nZWD1aULumXWf?=
 =?us-ascii?Q?hm5jJ2340LyIddRty++DR+SKdqPJLU6bsu0EfH9voofbpXUmUsuhtsM1Inp8?=
 =?us-ascii?Q?xohTST3EeFW8oh8xrdgJBxPyMxP6XD/hYStRI55TIiV8LnxXbYr5fkpLNALP?=
 =?us-ascii?Q?+Sjcf5Pk7eSj8HqcBXPZvTN6A9gXb68fDGmNxrTj1skjZnlOG0YCsVMDWjJa?=
 =?us-ascii?Q?GRcW5MzIYSYGOxr+WKmSC7JPb4I/tSLIc2lP3ft8GP50bLVs+Hwjrgtaqb0p?=
 =?us-ascii?Q?NWnlnmWmTCWhk8GssHmcZ+tN8PpOCgGC2sor2vV7XSL41Eoue8NWzoWG1Hzu?=
 =?us-ascii?Q?rQCeprDcsRN/hZkv/qepPZCD2A5X4y9cBCVQ9aEoooWB59cdd0P0i2HVWWy4?=
 =?us-ascii?Q?ci3pZ2NwNvmNWXBgVSM67Dkrw0mz2aIzlcNCuUK1mMpADJ4eh5gzpJmO/PPu?=
 =?us-ascii?Q?ookoo/mjquyLZasEJ6Je/j3r7vqRtVb3xIzpE5VEiOjRfljCqrbE7g8Gy6pa?=
 =?us-ascii?Q?lrnquta5DIaIyayRv+zAjRft8+sjiyGWgoNS5iSJ1LE4bUG5KxmFtWmHTZzI?=
 =?us-ascii?Q?ajqY2eqgZ8Y5r1SM6Jch6zROJD0Flce776apqmXdD2A0BRlbKwY1jjF5MY1V?=
 =?us-ascii?Q?7wDX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5c61ec-94f4-479b-f755-08d8bc4e57df
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 07:46:34.2820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nv4Ij5FZT7NIHAx4qq3N7IQyXt+0/88O+0urfLcnQJqiMG3bEwByrfsIpGN5LdwodDa+P3EWXYFvWnLLrBp9wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4492
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Use virtio/mailbox to build connection between Remote Proccessors
and Linux. Add work queue to handle incoming messages.

Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 116 ++++++++++++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 54ac143ba033..c16a91f8e410 100644
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
2.28.0

