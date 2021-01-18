Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BCDC433E6
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jan 2021 12:36:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66D42222B3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jan 2021 12:36:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391635AbhARMfM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Jan 2021 07:35:12 -0500
Received: from mail-eopbgr130058.outbound.protection.outlook.com ([40.107.13.58]:59298
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391629AbhARMfI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Jan 2021 07:35:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLWZbf4WkR9eg+Q3Lovtbx2y/RZuuGWfRnTh/+B23SQvo7d27NiIl0ZG1aG259GPmEGw91w/3hEG1W55khOk0nTAY2gI5J4JI8kMKt6EpLMszLmadWievG8QFEjRb1mTDyCPgDFnY6WhICFqDOa8gfRo4aN45ur5PGHuVuaKnDQ4zKwByaoRRMbv5hKML4f2QbFqss773HaoMOygbz6yVOUDo9VGfAVq8GeJWAelIutzrlbMNfGo7H11RaAzX3ov8y4nVcmg2QW/zH61oDdMVcVxfcEU+7E9fsk9gAosmZUoonyrtKHqKTPtEAdJpNwpRHqh26vnBL0ViPS1SHhHcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xh8siq6zsX5K/BAtOJDXJAS7RQs5VeiSiq32qYrA5I=;
 b=fZJUfoHyEn6Y4YkaXeIvcOWCj5Wlsv28oMmBeIjY6lgj1OsgU+Od1gCvyqUNIIo8WOL/Lp7/OuWmv7E+sFXOMSKy6gH0EtG2jZffi1Rpho2u/D+ohrXHmBY7Dav9YFK6eVRQY884VtloagbTr5Feibo7tS6qibyMgeR/3yWocG0aqs6wO3XMrCOvuO9BGt/Z+Xau8JWLRlgfSF2wLpZ1gQmliKQEcbxTT2twJ9cfv4ablWZzGdD1h4hFgRM8SCeR0754g7suOR4e8F9AaLvx3FO0V99qfpfZSLIlDp8kBBjXG372MVGr09Y2opyH30Jpwevvg3LS9cuKRfxisGHVCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xh8siq6zsX5K/BAtOJDXJAS7RQs5VeiSiq32qYrA5I=;
 b=UoHObX0+Jsd4wHePmFR5BItkZ++uvE05/RLNUgUR2H6FKM2J5xABiblXtsBURXmdFY4zLk7l6b2MLbZh7fVu1Axx04puigIjxMMIdZEorkMuRcdR2iT2Q7PvLmFA/eZrUeLz1pFHe0FZse5gWr8lse/DpDSCJ3tkeS38gDtq16Q=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5243.eurprd04.prod.outlook.com (2603:10a6:10:17::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Mon, 18 Jan
 2021 12:31:24 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 12:31:24 +0000
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
Subject: [PATCH V7 10/10] remoteproc: imx_proc: enable virtio/mailbox
Date:   Mon, 18 Jan 2021 20:19:59 +0800
Message-Id: <1610972399-28286-11-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610972399-28286-1-git-send-email-peng.fan@nxp.com>
References: <1610972399-28286-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:4:91::17) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0113.apcprd03.prod.outlook.com (2603:1096:4:91::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 12:31:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9e9c1bf8-c320-4434-e17d-08d8bbacf7dd
X-MS-TrafficTypeDiagnostic: DB7PR04MB5243:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5243A7464DB27F67F6C0F62A88A40@DB7PR04MB5243.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ku/7P0UZFL1+ta5YMzAnELpm/4xbSz80vroQMAD/UhNFJi9W9Quwl1EgndBJfIrskWmigTWDRwTYkytK8IovaGXgtsPAmqvAcVohrrWWj5QGDHBlZ4kLEQabRK/ktOvy+obIYXuSyhNb0k8FnssqFl/o+DzEx+hY4YcyO54AaSickLrXngkd5cnYClwigCS3xly26uDKECRXTQTsRYW7zB2zfj/DalT8lxf9LkWBs2XsNeKXyZ6jaspwSy9f+IHozBI1wL8XqY6pKRecOVpDu4ZHG55NcmtbrrpIp+Iympw9O+6fGmo/SmifxvP4sWgVsZ360KLYdDzFpbu3zayjhOOQQd1DJt696zlsWmU0cGRI2WUUKm+oY1GinDUEdho+HuRxOt7cgXle2Ro2ZbOXWsOup2mjbyYAeyM8Vz4DuGkD58ZnPKs5KOkF1UH+Jks1pFqYrRX0MCSiLUGRFzj1Dw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(478600001)(6506007)(316002)(6512007)(9686003)(36756003)(6486002)(66946007)(66476007)(2906002)(2616005)(956004)(26005)(83380400001)(15650500001)(7416002)(186003)(52116002)(16526019)(86362001)(5660300002)(8936002)(4326008)(8676002)(69590400011)(66556008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YlBN6rIMc6Q0CU8GUwE4d9dXjUg9nydi3AUDzjAUGZX4V1iX3UnAOCP7e1dK?=
 =?us-ascii?Q?sFRtR2VARtLsNfQeH+JWRrvrx78cDbREk49eNu9Yo52f2n8Axl2put054Z5j?=
 =?us-ascii?Q?BBMfYrbU/X6muv29XxL8KlOb83Wb8O6IJqLvJjFwkxToUWUFR9w2O46KTIvu?=
 =?us-ascii?Q?aBY4rZxk0GwwVHabxZZZPfMKte/TqtF9ZuRzjtdjEay9jMm6X5hAdWEF6PNZ?=
 =?us-ascii?Q?yntkYhjTnCEU+GrBg+nh7tBn4ju1KTyupczqWAHWVS3UnCaHWTUp0koebIxY?=
 =?us-ascii?Q?Nzy3QHA+xdv8OKHU3UKzzTDQpByYh2nARJVriW22F4Pq5cyFyAvNcDoON0zD?=
 =?us-ascii?Q?fcGzzUc4aIEGbbvGQpA4EwBHv5NMETuuseKghCCHCAlnbJ0VpB6bJN7sTk5f?=
 =?us-ascii?Q?Jz8+1ANJrzfaptEBHxbz21p8Hq0WRRrog7wGr7l6R1qm7+lwOpOsKcSQRPp2?=
 =?us-ascii?Q?Zcpr3HgDQ1wQrpLqRAFVa8JfhFIM+RQ5idKNZpyQnIKPyhPaVcBY4gzVvB+v?=
 =?us-ascii?Q?BVDBDDySCkz59dEhAGsUJtKLlDeHTR1Qn+giqD9fpUUPzoz6ENnImNv2a4o1?=
 =?us-ascii?Q?7J+8k56S/lQOYOftvGRBcxXfBO7KqvilNv5qIHOi9bTttatVTCRRymzGArvf?=
 =?us-ascii?Q?8M2w4U2aqhi9/pk2zUb+HiMpVj2WqmnMevhgB7U2qDo1FvU//y9Kwz59hGyR?=
 =?us-ascii?Q?xfNyk7/7w1WSMtmIgcCW5bH9B93+IX0U6V7Z0N+xEmUAZefduMvcnTQpw6Qw?=
 =?us-ascii?Q?w10O8U8PF3tRg0qCr9TZOq2AWyOfvMjkSW1gLKF5nUDffdTbB45WwUc/ngeu?=
 =?us-ascii?Q?ku0emg2W9E6Naaug0AJMG5MYzxP8kPL14moKn4z9bkmru8JpGP7RF3JOY9cp?=
 =?us-ascii?Q?a/Ha9r4ea7dMHO7HlZm4q+UDcLQI387vWYmAi1F/c3wr79+BGYOFrDjUcq73?=
 =?us-ascii?Q?1WJJjim5vXkhrcWgp2zDQMLaZElzRMjj3VSTzIHcpZOOZTPEErHy5xmQDjQW?=
 =?us-ascii?Q?vaba?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e9c1bf8-c320-4434-e17d-08d8bbacf7dd
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 12:31:24.2156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OdUGwZ/6sRyTCWgTPL6u5MclMt4w75q3yJFnesg2Kp/NvNQ/XQEM+8HMbo2OutA7yJjQebGUmtBwkRo9T0zTpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5243
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

