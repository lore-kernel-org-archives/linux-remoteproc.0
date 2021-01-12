Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66BEAC433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 09:51:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03A9523100
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 09:51:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392696AbhALJvm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Jan 2021 04:51:42 -0500
Received: from mail-am6eur05on2089.outbound.protection.outlook.com ([40.107.22.89]:7296
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387627AbhALJvl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Jan 2021 04:51:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3XLvwaGejjfW1u3fvOXcN3CobJqyYrWb/KU1oaIwfqfLNxhLnzaNI3Lc9JuWwgB/aCQmsiF51/KiyRHjcQZZfIVC+vDm7f8YFK/56THoJY3+PflHiVUDSIYDPAWjUgwjYsgo+fofSTw0meuEYQH4EKLXB0up4Moi1nxBSfuHFhiH+rpJknZGMhb3ZQGW7tteGYVyNfkpn7DGq8y0ze+CM5RR1psuVTTAviV/J7lRadmX1cOlYBAwShN06lWRF3lM+txhsHFvkccq2LkMtA6CnMvyuffvCFnzshjEj4eAWMGb2DptjsCnVEneIoovhlfy2XH92Pl4VoqVnCBteAUjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLf6LPmqRrNcbdmySKxv/oX4Zp0M0bOHPxdt19tYu3A=;
 b=K2NYccCkB2mPlpr212WpMUaXiPFzZ2HhswWdw5Ybj5y/oaDcCfREVZ/CHOaFK7VRbCzlDKLuxg3ThFNlAH1G9Gw3YK+mm7rRInayrxUpqMfovz4l1g/s4qO4t7EiqMTrZfNe1o0YQhpDaZWFZ3nPUuXM4kU/qbJs5idydS2xyQVFgK3KUfPOY142qTD2yMxU8mJCzhmy6+qDGItWHRVTAcOg3yKic4JsK7W+CCaXBotg/EZ+6k6/scA+SaKCTJmofLgtwxsw7qZRFHzwaRg3+0D4/GDYCnkEBYFZMlTM8FA0Vi9TSOv+/Bp/sqZn7NJ1C4/SUU0z3qrOD2OvwgLU3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLf6LPmqRrNcbdmySKxv/oX4Zp0M0bOHPxdt19tYu3A=;
 b=Nd3tONr6p+WwrHvUWg2nDHDaZ4m7gjA7rFFL7tfRs7Fue5eMYaLWyWUommAyd83cOiP7zysua6O5w+mrSF9tBBEfMGAHBNtAFu1CJMu7BEoFp1rx9uwPf8rSfS9P3P4o+HVt2QLjjgSj23GpbHCtfwaREF7wgvi4/ULo02I+EKA=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB3PR0402MB3658.eurprd04.prod.outlook.com (2603:10a6:8:2::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Tue, 12 Jan
 2021 09:50:13 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 09:50:13 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V6 10/10] remoteproc: imx_proc: enable virtio/mailbox
Date:   Tue, 12 Jan 2021 17:39:19 +0800
Message-Id: <1610444359-1857-11-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610444359-1857-1-git-send-email-peng.fan@nxp.com>
References: <1610444359-1857-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0212.apcprd06.prod.outlook.com
 (2603:1096:4:68::20) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0212.apcprd06.prod.outlook.com (2603:1096:4:68::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 09:50:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cc0b68b2-9bf3-4379-9d10-08d8b6df7542
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3658:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB3658347804A4D7B18B9326B788AA0@DB3PR0402MB3658.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 48Ejz4TezikpAP54TwpugC9tTTMDqy9mPAEGJqDVHqk6xuLuLoTRovQK6wKe5VJzSldpsxjuTYU4UIOLipMs50TqOmXeqV3le8CuJfE1npJODlVdvBi9/lzkOZ5Ur2UJOyresrSVDFfRZkQiZ1Sv+nN1BlJ/4ZpfQU9gXCP7JW1Jcx5kMEvQArIPoYBDjOHmN2eUWmoXFkVKf6Rr4gKDtzMIbH0VYP1mGRtiEcEpe2MheqZBF3mwhV9Sy4c6Av0jIm73//MiY5gGI9lGODdNqpcxVGueqtJQcA6Nz4E0xnpFRq/4wSLJHmQWBySDi1vLs1bLfu+u4wEmrXbNfDRf6+KqZQyRdeb5WvUA9NxVrek5mJ8IFN4FbBE19Jt1qE/cqaeROqFFtT+Dg88c2jedTxcD1QslFsLGr9uKvUUS9roJdnj624121rHi3oqqlIPleEP3iVNEFNsDZunrpxPWlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(26005)(2616005)(6486002)(36756003)(66946007)(66556008)(6512007)(52116002)(16526019)(66476007)(15650500001)(86362001)(7416002)(9686003)(6506007)(186003)(8936002)(498600001)(83380400001)(5660300002)(2906002)(8676002)(69590400011)(6666004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IF/1FfeP461NBD/wuhj607RnEqubyfKpdv43Rjn8Yo/IfRrwIOJkrFYysmrC?=
 =?us-ascii?Q?py15FLiTxLacQgEN1+QWD4xOLJhAJQZyOjIHHszmL+WeXaFIU5ZsnVPWQb2/?=
 =?us-ascii?Q?veN7e3O0/yxvrpZ1vcMwKFx3eIZAbW5z1AErRDnliZcQTCnk1orPpOafl1i/?=
 =?us-ascii?Q?CzPAVNZQo2rHmSYetGS0ogeIc1QjqcPstfLFoTIgd4gt3DrnwUXE5hzbjScD?=
 =?us-ascii?Q?2P1SezONLThHUvbjzgWVFcb9CvGJYSIiBoZe44jimDw0tqbukUpZ3jIz8F7T?=
 =?us-ascii?Q?zW3dg/SAuO5N0F7AQ4vv6jk005XIO+GBcRz9VVTdK9nogYoFI4bQkEnOuHfI?=
 =?us-ascii?Q?RNEDl4Y3/8QP22RYzCn3EQuOkTX/oKB4prpH7j1Bci2tAlrX/RM2XMfh7S2y?=
 =?us-ascii?Q?FkTKIOf4A+m3vskU0ihU7U4UpLbcFOI4DLDoIwC/xza6QIVcRWUzARcs69Db?=
 =?us-ascii?Q?88YqT/bZc/NKP4XyXasjupxK4kEVJTE8FTccH6TxyXZ5MJMRkXPzW/usWx/q?=
 =?us-ascii?Q?cMqwbaQXo9W2CgBd+5FijCea4wH48rG8Qn64W7D1Jhoqm0ghJeaF1ElYGtho?=
 =?us-ascii?Q?6WRgpKBZqBBQd+DFqeF8PK8o1rX9SaplqD3guz8RiNSGfw16YjfF27f/VY8z?=
 =?us-ascii?Q?gqiUnJOd03ZfBcNum+fI8hCP+Rmw7QaX7wLAiAO7ly34mcQlZkOzPp0N+xhq?=
 =?us-ascii?Q?vgRhN25o2XuQ2fgdZEt4DnUd0q4hKMIU557rSumDYZkp4aijnbziYhODsZlX?=
 =?us-ascii?Q?mRYp6Ma9W+v8QxGWAQMQFIn05C3C1+krKf605QGtzNJNZif1j/bt1WJ4j2mX?=
 =?us-ascii?Q?7B2yZG0tfidmXH2/V6g5Uilpi0MJtX9xfrEOPR7whyZAKQ0NbinNgDG3hvaA?=
 =?us-ascii?Q?Lj8HnemNESV5tTPh4IP5ny4QYgU5ZmHwV7CzxnTJzOV5+v75Xt8L6Uiwk8ta?=
 =?us-ascii?Q?EqsfDAm0iriAoVq9EmRlwLJ5EjjedAN/B+qF1g5cjjxkz3ectwTNY1rfi2rT?=
 =?us-ascii?Q?qSrQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 09:50:13.3217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: cc0b68b2-9bf3-4379-9d10-08d8b6df7542
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c3+79NEd+WamPC3RAwRqmpiCsF9s6A64DP+HmK7nQtNfL/Qc1l264QTb+qoJTAK+hUtnlcwHioV0Q1/9jI+YrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3658
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Use virtio/mailbox to build connection between Remote Proccessors
and Linux. Add work queue to handle incoming messages.

Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 115 ++++++++++++++++++++++++++++++++-
 1 file changed, 112 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index e62a53ee128e..812b077f1282 100644
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
@@ -444,6 +477,65 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
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
+		return dev_err_probe(cl->dev, PTR_ERR(priv->tx_ch),
+				     "failed to request tx mailbox channel: %d\n", ret);
+	}
+
+	priv->rx_ch = mbox_request_channel_byname(cl, "rx");
+	if (IS_ERR(priv->rx_ch)) {
+		mbox_free_channel(priv->tx_ch);
+		return dev_err_probe(cl->dev, PTR_ERR(priv->rx_ch),
+				     "failed to request mbox tx chan\n");
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
@@ -481,18 +573,28 @@ static int imx_rproc_probe(struct platform_device *pdev)
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
@@ -502,9 +604,11 @@ static int imx_rproc_probe(struct platform_device *pdev)
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
@@ -515,6 +619,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 err_put_clk:
 	clk_disable_unprepare(priv->clk);
+err_put_mbox:
+	imx_rproc_free_mbox(rproc);
+err_put_wkq:
+	destroy_workqueue(priv->workqueue);
 err_put_rproc:
 	rproc_free(rproc);
 
@@ -527,6 +635,7 @@ static int imx_rproc_remove(struct platform_device *pdev)
 	struct imx_rproc *priv = rproc->priv;
 
 	clk_disable_unprepare(priv->clk);
+	imx_rproc_free_mbox(rproc);
 	rproc_del(rproc);
 	rproc_free(rproc);
 
-- 
2.28.0

