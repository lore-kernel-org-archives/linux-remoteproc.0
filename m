Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC8BC433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Dec 2020 09:43:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9586B22D5A
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Dec 2020 09:43:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727250AbgLUJmR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Dec 2020 04:42:17 -0500
Received: from mail-db8eur05on2048.outbound.protection.outlook.com ([40.107.20.48]:19553
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725848AbgLUJmI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Dec 2020 04:42:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZ1Adrv6RjHsF/VWzZcQ5dO/3ISchL4bhMSyELRigp2HuHlqIvHA45VBOnkPonCupa8ZwbLsOMCUDSL+kkbcIQ7QGO8VrkrtIFPLWnZd6A7w8DeceSKTHC6ZDNzbrWwEbUeP4WSi3aMAA/3DnPOUMEFuLHS3j/PstfVVt0UvyBWh4TYlNKkqybgbI186EgfuIBWf74IqVdTEA7NjN4c4FW7RNb3FfJGaMDrSHADaZ0ocrfHmeUjLvVE8H5d/rB6IrglLyb+LoygH9wPHfb4vPt8Mncdqi0WtfiUnT3JGWR8BHHNwARWO9d8yx1+vs7CBF+n9QIv9xomV421OIHqxBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+Hdi603eUzvcpNyxZ+Yj0vNPyihCXJfbrhMq/LFZw4=;
 b=E/5dYZAaGG5qaH4oAM1sl7EG1Y04J52uzj0gBBsY0p3qyw6aQB3QeuOdZAn8PmR91m4B20TRjr+YgQGgnFjzKgDGnG0qDEnxMX/OrdPYErmFMvBOzPn9k59IdNZbLQ4dv4AU99xDAdB21WY8qFWT7h9J3BIA+8GCJl/isz+cfLVvCBpV819uqqwPp22P1KCjSbAaIkBj74h53Vho+8gO+wwRxCkGOGUxFYqrv2nvLZ/KvQjIhDnW6jf1vJDRuYdOLc1PmXq6lw6AF+V/NuwS6Y1E9gVfi4zTIjzNUr8MiZ030a17GUHCO40a8jL+5c1RDUKJI7sC31wXt/0JscS0Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+Hdi603eUzvcpNyxZ+Yj0vNPyihCXJfbrhMq/LFZw4=;
 b=MVKP5WCaZwX0uqi4ZwDd+zLQsvw7ZZ/N3RR2/TUmMSQcXO4BFqjJKeMT08e1o34elLDytzBOe+qLVGmEN7pvwl6WuNnjmYg7b+gpIuhlUdY1OihgLdCp1UTQz7m1Ygq+BrC6qr4cSGM7bumGhJvqQk/36dweAz00SukNvRP7LQ4=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Mon, 21 Dec
 2020 09:38:56 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3676.033; Mon, 21 Dec 2020
 09:38:56 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH 8/8] remoteproc: imx_proc: enable virtio/mailbox
Date:   Mon, 21 Dec 2020 18:06:32 +0800
Message-Id: <20201221100632.7197-9-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201221100632.7197-1-peng.fan@oss.nxp.com>
References: <20201221100632.7197-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR02CA0110.apcprd02.prod.outlook.com
 (2603:1096:4:92::26) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR02CA0110.apcprd02.prod.outlook.com (2603:1096:4:92::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend Transport; Mon, 21 Dec 2020 09:38:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 380f5f7b-d321-42ba-e3c3-08d8a5943c92
X-MS-TrafficTypeDiagnostic: DBBPR04MB7930:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB7930711BBF449F32EC1FEBB1C9C00@DBBPR04MB7930.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2QOALAVerW2A+RCsXW5hcJdUdnU7oLPJe+QjZf3Guy8sOqddl4FBy9goMR7+Ut7sQoc4uG8kW41eegwtULuSge1yQU3WiUj0ECHph9CawJp0TCznCUJ+tVoTOsMpWVMOZj+OvDObEzP6fY9EOTfbzE9N8K4ZcdGPh+94lPE4zfd1YWho9eUa1hl+Eyqi7qOFHoG6U2rNP40bJYcbcnP6OCxCwcjCxi0NqKSKg94WagJnq4W2wHara1r/XuuZxIrNlx+OQ4eks4UxLrNcQKTKAR0HHSzrZ8oxTaNnMhRAc+V3mP0qAT8vpZjgIDvYR7Fjced3R5we6GkYUjAoSWcxgx+ibTcHrMshD81wO8LP7HR5/NjHOEr+8qLXx8ojZZrxaZBJrUAvzRirtKwcmCALsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(5660300002)(66946007)(478600001)(6486002)(66556008)(52116002)(66476007)(7416002)(83380400001)(8936002)(6506007)(6512007)(6666004)(26005)(15650500001)(316002)(956004)(186003)(86362001)(1076003)(54906003)(16526019)(2906002)(8676002)(4326008)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?po9gBtuWWd1LKZlj6f3r6WL8Y06peqz5WFRo71olGvRrkl4ceefwT4PWb1wT?=
 =?us-ascii?Q?VGRArhoLWXHMKVXdT8+Jktw+FCcvL48nArAIwUDrKlFcjvccC5GSLE0Zl+we?=
 =?us-ascii?Q?0B6PclGQ4v2aDs+DUk8EzfUxAyM6j0VH1sBy1fcBG6qMYFuKs8JH6u28vgmY?=
 =?us-ascii?Q?3kPY/4Ei54Ubat54ZQOXYj5shW4tVmvClS6qNxPq5rYEVN2f0y/DyV3Rme+6?=
 =?us-ascii?Q?2U2fTKqmU4ulVP206B46M/wjNMj/UJ5+NdHHDzVJZcAFWAIgioYE8yXLy5H7?=
 =?us-ascii?Q?MDebjW8x7sXEdgGFsMiiGuiZ/bkN5Xw3s0lLQOrZzJxgFxyXRUW9kS/DNkRu?=
 =?us-ascii?Q?RIt08Kly70eswuGlKmFdJVQ01OV7vxWogGVdNffmx+57bDo2ljPOTGl9NOYO?=
 =?us-ascii?Q?UcYUNCX/XxpjgbOR3KHR5sYqEgI+3ztV4cNFZOTywrhSE39G4EM8bdAONUDP?=
 =?us-ascii?Q?biEHImAb5QsHtHqaICmQlKIO3tHhEnP2CM0JYXDgnwiWZ3ocq0VlDCCARFFV?=
 =?us-ascii?Q?A8e3TwjATse0X9cMRMkPr3tsS7whQX5XHOW4ToEeo86Ci0K3Ks7QR0aLqFVA?=
 =?us-ascii?Q?5vVyeCOpmjNX5MKDsjS4t+bLa3CBYze2nJdj29UU2XhTT5SaBrxMEMebx1Ew?=
 =?us-ascii?Q?pX71PEryMOYbCwstDZsM+Sz2Q13pbE/Pg1UA6DgT/FMm1RoEPcARoGXVaGKE?=
 =?us-ascii?Q?QMQMx/oYpoiTH2BU/Ino3wHgEICYH2dmr1mQJwrdxHs8gMUwW6OZ9GODQ6DZ?=
 =?us-ascii?Q?iEwNHNIQpF4wiNTrulpRCzcp/hiwdVHUa5nfWsgk9Mo/Twy7m63s6vLLMLvh?=
 =?us-ascii?Q?yZMorDgK6qhrWYc5kKcdyrHZgimsZGMHdZUIF2sKYEvQuKmJjdsOC8zTuc0s?=
 =?us-ascii?Q?+cbwAYr43d/ia28stf7KVLvnGmq/mNVBeypjxpbN8keU57WroFy1ApoO2CPf?=
 =?us-ascii?Q?KNE4bS2v4EI2vQcmnYrN1UWkJ9/1eKk70AdZU/axPZA/1L4Q9njK8Z+vVj0D?=
 =?us-ascii?Q?thfT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 09:38:56.1568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 380f5f7b-d321-42ba-e3c3-08d8a5943c92
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpcymoGF/B75djY6Utj10vA3NkkXISjwTHGd2b+31Bt8j19AZ5Tbq+qY1Qf/HSSqr+8IUkQk6g5OZahnPl5s7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7930
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Use virtio/mailbox to build connection between Remote Proccessors
and Linux. Add work queue to handle incoming messages.

Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V4:
 Use dev_err_probe to simplify code
 Use queue_work

 drivers/remoteproc/imx_rproc.c | 115 ++++++++++++++++++++++++++++++++-
 1 file changed, 112 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index fab191a485b4..4cc11a942bc5 100644
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

