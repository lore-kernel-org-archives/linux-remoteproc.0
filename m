Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D18C433E9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 12:50:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97B7E64DC3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 12:50:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbhBOMui (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 15 Feb 2021 07:50:38 -0500
Received: from mail-eopbgr30043.outbound.protection.outlook.com ([40.107.3.43]:4416
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230471AbhBOMtm (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 15 Feb 2021 07:49:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RM2Avyp9OsBd/DhbOojL5OXyzielBiGf2SkCgrAzWJM9Kwn/UnUJJy8p6eAiNB9gdO5zfgdX5sGaYaSYvues08Q6shIfj4I/OtxeYCaAq0sqFp5izkglel2I6LQhaBxFKRcmuZDL2pduFB6nc+i5xPgomvG0WXjFduiYGPJv1HBAeccSho8NOUpSIcQ22BMmoqBqLRzUAhaCzChDOEte0uQ0y5z2D2AE86HrtXLCPnvUBZ9E76VtAFCE5NIcZie4LoNUnQ44TtXIYPkVbke6JwLj5bj38Gqh4sedcx2QyG5K1HDksg8Wo4/4cX8z53f4zXdnZ+kMUgKWTapKmzXpXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfBczTf+RB1EWa5ibevseo+tYbxVdHstdpl8p+i5B30=;
 b=C1mvo/JMVs0vRTlef2IldPdw9SjnNRvPvHYH6lXt/dxC8afDmNrIioOMD1NzDaLNKF0hkQSxFxDvFfKmKeshH+GEhzVpZClekKHgDXKJ6K6qMp1P2XFNlA1VU9NY7xw+fYFd6Jwid9B1Lj81MDE6Tz2+phP8EvB9Ls4+d6YH/VYskifIniEyz1A5KQ9K7tkfC9vzfih7KKee4d4+0CxJCQLVh6CtfH45IHESluWTI1jzu4OlnVveRDO16w9e1KQd8rd035sbxiecnSlEfye8Suo2XcT3YVXQ0DEZi24/AA8n8bOUh9YU8o0D4q9IKa8D6P91sbLPqeSKdvL9NSA37A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfBczTf+RB1EWa5ibevseo+tYbxVdHstdpl8p+i5B30=;
 b=jLf7FGhRwO25St90vpoSWd+yzV4BhfzSxBcP84aEwB9uDqOC/avzN1ncoV1jgGmllxzBiVcv7ohIi6jtBn1kC4hjhd1ePNMCiS4f7lJv86aZ6zDFHo6CdLJ1bmy8Zphtjl+b3PYej7kSYISyAKwXFs/9gwffan0oU5RxRT7Ktt0=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4091.eurprd04.prod.outlook.com (2603:10a6:5:1e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Mon, 15 Feb
 2021 12:47:19 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.027; Mon, 15 Feb 2021
 12:47:19 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V10 10/10] remoteproc: imx_proc: enable virtio/mailbox
Date:   Mon, 15 Feb 2021 20:34:23 +0800
Message-Id: <1613392463-9676-11-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613392463-9676-1-git-send-email-peng.fan@oss.nxp.com>
References: <1613392463-9676-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0302CA0019.apcprd03.prod.outlook.com
 (2603:1096:3:2::29) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0302CA0019.apcprd03.prod.outlook.com (2603:1096:3:2::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3868.12 via Frontend Transport; Mon, 15 Feb 2021 12:47:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 377695fa-411e-4bb4-77c2-08d8d1afd501
X-MS-TrafficTypeDiagnostic: DB7PR04MB4091:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB40910F50DA660127688885DCC9889@DB7PR04MB4091.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HvJgRAvvNfVTSmXdAeF6CrFluVMxe0OYoxvNvK8tnr0RbLKxS3yjAdGykbUrsuxa1iY/gqF8c4hfkZ1l4tDlFow9JpjsfjEEAnD2yGecFC0mOwI6pGU0VRScnpvcdrbT30q+0kb7V22HdSaKpSASuELPjQF5QevU/9bZ4ESg+01BoWJks/4c/BKL26CPSM3cU971mB7bC/m/VcAfOFiQMbKZKJjRQbH+anof7BvfQPkZNHn7B7zeJps1K07wvxpsxsDwU0a20IdabobFtWOmWLH955mM9924FOgflovLQY2Xov2UMihyAT/QpS0byCmextTjqea62ZQQuXVZdtBnki0h9ZVEOXS11xaoRP7PjlEaA88HJNbuTydzQI0LpignPmZac3gskKqHzoH9S7cA4xM6arEFNelZxn/YkwLaUSjNJFg4cNQTHBBYRPxhm+NwnfQafra0cZ7WW12kdtcDRqYAUn3vi0R+w91UK+w33MIcYu/WM3wXRwykJ++MerkeUlaYPXdCO6HoB4esBxr4Vpsy8McThupU/IFKlywB0S37EAdG33V7kFR/xDy/0EZKvharRysQdtr/9KRpE/i7Kw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(26005)(6486002)(9686003)(478600001)(316002)(186003)(52116002)(6512007)(2906002)(16526019)(15650500001)(4326008)(6506007)(8936002)(2616005)(956004)(7416002)(86362001)(66476007)(66946007)(66556008)(69590400012)(5660300002)(6666004)(8676002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HNKBTAG3EhBgQXa4LaAuPDQ57RGQ74TIgqAskFH7zCK0GD3ClZAgJIOG+tXH?=
 =?us-ascii?Q?wc6KdknE7WEEtPzax7ODGVvbOsM2sIed88s6mFWfYo9cuUdldBO3BqrfiH4X?=
 =?us-ascii?Q?gq9vAtYpIQQPaUOV8iyreMYnajKpIlHKSF8tNbLq+jyd9LpiGCKBTOmtueCv?=
 =?us-ascii?Q?JqO+h4K8bfJXnIQ9hS56pWcwWZUN6FJEYfpAXQNce17eUq3MdAPsH5/d3Ypl?=
 =?us-ascii?Q?sHxX34HZCYqRL1djuOcAS5h/6pdf9gEYZPw38YkyfQW7sp/3NIVsNLr4yT24?=
 =?us-ascii?Q?20dU+U5SrQhHRN9ZDPaVJve6MlzRMtdlB5pVkoL/RLbWW/K0kBzAyyX6lMe6?=
 =?us-ascii?Q?+cvWy/RAWXtodStylFb5Zg/zBg9Xzt6F5hApaPBLBDsEBjCI0Am28ba5SFU4?=
 =?us-ascii?Q?o1Cs2oJtapZd/aNv/qF/Q+i+atMQJgtn6jWXhwL9hPnpMncW8KVRERwmIDYz?=
 =?us-ascii?Q?lWrN4XkpiYMxxO0SgMRtGWqkjZZZfJh2LS26PXhav2AJJko4GvdcGrB4mPqY?=
 =?us-ascii?Q?laMNvGitvW0Hvxyv6aOjZfyjUS3fP7G+E8I6uLWvAzC3btavruLLjzg9lFt5?=
 =?us-ascii?Q?Odx8zd/C9mPTN2jOGd6AR4BAl38FhxTgMT9ypzGE/Bg074STZXotsIOeLvfh?=
 =?us-ascii?Q?jAUhfeE+rzgBP/c47Cfjra/GyU4paBAB3Zh55QXZav9FXLVQhXKFXKopTh0J?=
 =?us-ascii?Q?SDEwd/IbBfMTaeLB4o5091FPTLLRbYOyRMxTkMjUqEC0c7INZ76ecYGxEMe4?=
 =?us-ascii?Q?bxyzf8q6zq2zDF6FhOiQaGbwiZUT+O0vRYK1tMBuWWh+PVxczBBLCc3MfS9j?=
 =?us-ascii?Q?CfBS1FvVK3cNuT2Xty2dmrAUgpkcuiKpS0yJUeymc7oLb3TSNRSq0nLxy2fU?=
 =?us-ascii?Q?OOELU3WuBiPWRQC6D8VpMiUAdz3DD7Psm+SN+MLPBvPws5dLY72q6JRvscq/?=
 =?us-ascii?Q?4Dq42Ub/ajT9S++KNy8UfXrHk/MARor0Z4KtW/qiSmfheOCjs9ouyy2CiU86?=
 =?us-ascii?Q?FYGlw5u2p8aC4dmXPeTBwQUHe5R/YHCihuFrAALqkRvzWSKxpvIzZ4CIxVKX?=
 =?us-ascii?Q?SO7HpbAHpUwHxG0/4ds3saPD6wD0Q1lywGCrxf2uq1sJ1rdqinf9O/4cPWD8?=
 =?us-ascii?Q?VAMX+8FIyby3fsfJ6iDYnn+58muI9NX3Zzn6+s6Z/PGjAsqvrAFQN9WDennP?=
 =?us-ascii?Q?5CggPKH14wB4cfF8aX4tQgJK5yKVzMN8CX7B87hGNBB68l9vGkEtEYzF4hKx?=
 =?us-ascii?Q?gRzwBw8UWy2dNBRdbkVgte9Tb2W919Ig3ieanPoDcLlYcIGg/17dyEj2Lw54?=
 =?us-ascii?Q?S0NV7/gYv2hQWsAZ3cfXiOAH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 377695fa-411e-4bb4-77c2-08d8d1afd501
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 12:47:19.8829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +KVKXU9o6K2OSsJdwDTeYr9Wxth+QGW5svMqDstLurEWecgLbPhecAcrlaxPyycQXzyU+NiWeefAt3hWAQaJBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4091
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

