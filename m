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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE17BC433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Dec 2020 03:04:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5ED822262
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Dec 2020 03:04:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbgL2DEU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 28 Dec 2020 22:04:20 -0500
Received: from mail-eopbgr50055.outbound.protection.outlook.com ([40.107.5.55]:14917
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726015AbgL2DET (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Dec 2020 22:04:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9FTEYkckEc2b/8AbD9Q607LYvSqelLC49YCrCC2vCCKc9psfoUoZkwofgMJ9TDmUXJbs3D+3BJ/mT/J0vj0Z6QrWmN4iKrxg8nS0kdDf2Ss2DDiUTAV+jFRW625/kT9aKgC5cM4jB+itPL4Fg83IqSU0uDGBXBfH7YAGqCaW3OV+yw9A6Q2Zq4uvVfDGD1xmvajfSO4m3mWn6l6U1ZYjzUGAPq9uPy7KRxdLBupEvWtoAibf80eH4exo327h0q92vbORRmqDJv5rUcWke0KrglquDZOVxtpYAYw4mq5D+JCJCzmkZ3a7uMb8zyHMUKt/eINABESvRgNUjn89Di0Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLf6LPmqRrNcbdmySKxv/oX4Zp0M0bOHPxdt19tYu3A=;
 b=cSfIo6iiF95s1H7uDfsIV1aDA3roDqAO/4y2e8UpIB98SWBqlGMGDBzQlr3/vNamKpE3qcFVV/fc/6cdH0K4uDrKQETA02zpgIZ60ZV16du4xUBkOFFxADzoYGEJKlIA/7lChouZNGeiP2f4LIf4+vC60gb5P44xzXvDKSY7WoOScSOsRdn5EI1VdgQPPq1aOY39ddpoWTMP7A8v5TDCvEtMPBeeH11KKQSYrvCsWtmCWD+JJtScG5SLGrxJHqOkjmqBYPortZnKqwEvOJXG+TKjSvozP2cCpZeY1XxNsaL6Xu+8mBX3Qrf2I/a9wGdqpSBmhepctQLwnuv09kW4eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLf6LPmqRrNcbdmySKxv/oX4Zp0M0bOHPxdt19tYu3A=;
 b=BwdLHoobeCAIbXMt6YD6aveyRYzxLfOFyqkdbH/mMV5Z09XiHH+kQQCQ8fd5ipgYEuKDUKKX0BLgtb+4a3uJ/A9EUZC3CPEIeIIBkDpzRloCsif5qLCi0DocIk+MMojxUjVAoes6e6ssVY4nQcjtd3hMMDQq9CD89ByQAvNomUs=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB7178.eurprd04.prod.outlook.com (2603:10a6:10:12e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 03:02:29 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 03:02:29 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH V5 8/8] remoteproc: imx_proc: enable virtio/mailbox
Date:   Tue, 29 Dec 2020 11:30:19 +0800
Message-Id: <20201229033019.25899-9-peng.fan@nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201229033019.25899-1-peng.fan@nxp.com>
References: <20201229033019.25899-1-peng.fan@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR06CA0178.apcprd06.prod.outlook.com
 (2603:1096:1:1e::32) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR06CA0178.apcprd06.prod.outlook.com (2603:1096:1:1e::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 03:02:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aeec0a5a-e45e-481d-d2ef-08d8aba62e0e
X-MS-TrafficTypeDiagnostic: DB8PR04MB7178:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB71786F7BA8543A0789F55DB488D80@DB8PR04MB7178.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gmx8N/+Zt9jBm1V0jU3WDFshiiWzVSp6vmikCAkIyJ5TMkELGBHG0pDKBMco6G2ZxfPNrQC/+ZmE7SidqgrYNG2o4TiymV3NuNHMd6XJvDYBaM9hAwrjO8eMlyJfhWU9yi9NDolew9UHPJ8w1R9LYIE1A9+Il4ia90SHB9FiKJYLYUvNWxVOu5gdo54COsSPCb7aGlXFLdcXOYwfrNJF4mCwmDptKHsSgX5WbqUmZuAiYub1x4vh6JVzJn0AHSb/JkjOX8cTa4z83W3yZ2Zjh07d2Mkqjs1jtoJYjgr6I/0JOg5DTSesOR/t26zej0Q24f2FogQgDpyEXWYz5OzhNnAM+WzgteEmFbYb4fEfYSdCgr1C6BMR45NaoMJ/WHYrijE4lOa/tsNj79XQkhQqNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(36756003)(66946007)(16526019)(9686003)(2906002)(7416002)(2616005)(15650500001)(86362001)(956004)(54906003)(478600001)(83380400001)(8936002)(6666004)(52116002)(66476007)(5660300002)(66556008)(316002)(26005)(6486002)(1076003)(8676002)(186003)(4326008)(6512007)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?oN3o3vTGF8AQMA/Qt7UYPrh5avgrxGGENPa6tcs6RZXRL8rAlgJjhlZ+5IeK?=
 =?us-ascii?Q?QKkmGFY1wBa18AjeXQlmBeizMT0h7x38Bbx8Uq7wgGcTsXEqSTeAiTfSufod?=
 =?us-ascii?Q?zifPyj4LhqefXhw5jEmM0Qtl3w+VAFvh+WosDjCdDzysGz6g5kCdQPTZSFmJ?=
 =?us-ascii?Q?tN9pgeWMiGcvWSFQdmKeQVZnL24/s6+9d6mYjdq8K9uBF/0kv4qsL28a0DdO?=
 =?us-ascii?Q?F5/W3PzZyC+76ZIMx0TOfsUEYo85DuUt1bFqPMciY7RChLu1+rxwoXG/fkiW?=
 =?us-ascii?Q?mpIFqDeXj+fpq3qtz2ZugtgLnUirmiU1d9T3Hetix9s8IZx3uuC/e3WrndkT?=
 =?us-ascii?Q?0Bf3kLEj3Desis0p6Ytllm3LxuhZqZjJFRQOEG4bo+yFDDp8PhjK3jVM1fga?=
 =?us-ascii?Q?oDCqlcmgL5hNPj5k8CEYirRnbQ1J0fLDS8i4zuGIWYjro4xjN4zaKY47Wscz?=
 =?us-ascii?Q?PuBOd7JmjgZ8RWZYXHG3GqeW70no1num1FZRQIdnl+Co+jHvjSYY5CYk2MA3?=
 =?us-ascii?Q?chb/aacNE6bmq7NS44gyV3ROwxiki5UQWHrhh70WgqJK3JopW/e+fuklvPaL?=
 =?us-ascii?Q?OoUo2tlCfKra0zWrbvofbVL4HncBnfZXVPEI8IviM4E/37T1AicSGvRtYqvb?=
 =?us-ascii?Q?c8/qyTXntK0EHE5ehmyg1QGoLMI7ZkS3t8ij2OBGFdmeWCb4unhkxK0rk7gz?=
 =?us-ascii?Q?ye8+mp8AS8aGNbhyooLBqpH2GcG/bByqdreH7CBR+3CVGqJ8JjinAGiKmnht?=
 =?us-ascii?Q?h6WHvnoG1YXzgwwodYZs4nDsmmUpFf11QCdqu6gm8Um6MQgGznZzvh1t1bQj?=
 =?us-ascii?Q?GaYxK5SEcYiul7CsZzNOWtfOIUOniIISbTIhIx9oWZQeG6LiEeNRGC/+/2Ma?=
 =?us-ascii?Q?arApydBT9Xzs/wv6b8bnyPfWDYSl8mwY3GBbN6Zv9TSz/At7XnnkDNHZh+hZ?=
 =?us-ascii?Q?87xUkKNGnxHJSuUr73TUabQiph9nvqBLvOP/B5dD1aWtWmcjEqbnvmB93IQf?=
 =?us-ascii?Q?DEJT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 03:02:29.7539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: aeec0a5a-e45e-481d-d2ef-08d8aba62e0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kp9j1rUTxBqHaIgTrCt1NVFjew4gUIPvwVMG8FSAl3hXrk0bZDIH0BKB+T/Ffy28BftzrC2lR0jhCNMjVYkG0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7178
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

