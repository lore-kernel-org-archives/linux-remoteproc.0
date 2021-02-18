Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97C2C433E6
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Feb 2021 01:39:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A556764E45
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Feb 2021 01:39:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhBRBj3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Feb 2021 20:39:29 -0500
Received: from mail-db8eur05on2046.outbound.protection.outlook.com ([40.107.20.46]:35360
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229746AbhBRBjL (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Feb 2021 20:39:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGQZeGEcVejJ2F797zpdSEgmnOFP2u3ZdG27GCzbiPzsgyzfgpAY5WWCCyqbPdOy9K5cEamGhshnDaWi/0ROj83kDUpeyXb6yfMVdZXVGRYqFaRMcKnMSf+yVjEWbfMwyidXTzk8/Z31If/ulnqea5TqU0h/8EmMwrQKcbEyDexGAlSMfO4RTmSGQ1QgTE+8y3DqirvU9x2t7NYjlGbOQyAq7CwwFx0SXcnaPCQZoXAwr5Pwpy5t6q3BfWOE64jNN3PfqNsrHeCS9SzFdvyUkqkH/+8OIs3XBMuCFk027G6bf9AKAlxLmo75dIbmziC4s08aKbHM5RukXeDrXl2OVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfBczTf+RB1EWa5ibevseo+tYbxVdHstdpl8p+i5B30=;
 b=faZvQtjypK6UqUOuEIb2rpcXkSRQWAud8F4ZEhdxuVl+UEdBFp0JOFuMux88aM7ZG26TMcstv/9VYdyDf6RzBvCoyZWhn6yF50iS1qaG92MYqAomxQbj+HP5310PauVIGMAqDRmRlK6IR45nAfkHnXkdq4G3bysb5XnaUt8ZNMMvLu5tFk4JmqCB+VfFVD3BQwKBq2Ih8+6nzAxYxB2gqwn9Lp1nh6fYhWdiv6lN/0L/+SaSwRGFnu1BselZu1iCP2x+9Q0lMjMvTDxkkVTblz/hLmQ9eqAB9PVm+OFga+69idge87BMJaH75z/f/Cy85dXHDSZC5WM/8AtnDkCT2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfBczTf+RB1EWa5ibevseo+tYbxVdHstdpl8p+i5B30=;
 b=Qvm1non56OzonCjtQjC7LZVeG5JSItFUc5X59RBETZkfBLgILKcib1QBQ7MUfFzEH+FZtuTCPgtUGEqaOMgiTDry6gEn6bkmgajVH1GYh6uoLoxevVNihRk9jR5jnDyPAQto7gatiTu4lP/yvuaxuKv4f9NGa+Ha6qw40LC6tE0=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4092.eurprd04.prod.outlook.com (2603:10a6:5:27::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Thu, 18 Feb
 2021 01:37:50 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.043; Thu, 18 Feb 2021
 01:37:50 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V12 10/10] remoteproc: imx_proc: enable virtio/mailbox
Date:   Thu, 18 Feb 2021 09:25:00 +0800
Message-Id: <1613611500-12414-11-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613611500-12414-1-git-send-email-peng.fan@oss.nxp.com>
References: <1613611500-12414-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0401CA0005.apcprd04.prod.outlook.com
 (2603:1096:3:1::15) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0401CA0005.apcprd04.prod.outlook.com (2603:1096:3:1::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 01:37:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4818b812-7667-4537-3ea9-08d8d3adcd8b
X-MS-TrafficTypeDiagnostic: DB7PR04MB4092:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4092630EF9E9D95A8239EDB1C9859@DB7PR04MB4092.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5S9sVAajX4/338Mud7QU8GiZZkbwP3E+EIXftul6pcPxtQQ2DLjQvxepGSWlEJxH6aKBG5zKnE92lMc70MtBlu96JCN6dhpKmM9CmvbH4u5EA8dXcV4222rCc3H55wmizqDIGbMmCoel/DVf2uuN600knCf2x2SB2OVK1pzNJ5xovRGW05Ewg2lBnMejP60rRL8mnDphm+/3h0NBGPVpuDb4/lVyqCitll8vn620iSdkErjV2F7Ro9nfbNdJYI62w1K/83xIeL3BSjF6RHOQm5RPIObRGzZqA12uAmPL/n7WU4B70prdclh7GFzXT9WiAbR3Ih6WbIkDm1jBJZe4wRRl9oUzGPuQ2gNCBv8oKVVirq9KWEw/GcoJEKijmixM/Ow9RCBpL2lqK2ivMzu9kiOlVcPWaySN6potJ+C/tm6vvARbz6LJg0uHdtVQPGRwEq3FgrK+9RIP+37xqfMUDpC1YOx/rQhEc9hNqTCReIMfrkSZ3x0rAnfkz8yQTN3QD8KPIvC3DjwX7oHHHK2X80qhhl5cdvSlkbhSfO6xnNIsjmGam9tildBpxKqbzybObZrOb8XJm9M7NJCjRb9H8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(8936002)(2616005)(6486002)(4326008)(52116002)(956004)(8676002)(316002)(6666004)(26005)(86362001)(6506007)(5660300002)(66556008)(186003)(6512007)(2906002)(7416002)(15650500001)(69590400012)(9686003)(66476007)(83380400001)(66946007)(478600001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MheuhFHAvYs0iqUiM40Q7aT2ig6mvWwgpx/R0VHcNheI1RANbwqnx34ahoOU?=
 =?us-ascii?Q?Scs869OQGNuYZP450EODbbDJikZGB88gNfSChOj1gv8djfkY9LvVCqcVLMpM?=
 =?us-ascii?Q?/IDmavwcblS1R8H6xwxz4vBAA23LOuFP8QazfIih1EsQojBpPhy53rAgNN8z?=
 =?us-ascii?Q?RXMQL0K8awI8uWBsW9M9nnEG5k4wO4ypaQLpeFFjeNjsFHeNzI1/u5c8/cAq?=
 =?us-ascii?Q?41bIRA1vuHPx1hmCQXJXTWfnU+LONDi/rGUDOE6HQV2UwlUXzaxqKVO+ikxy?=
 =?us-ascii?Q?t5RCfMFlR7bsawqNM3gSPdVHMxYxOAIT6ErLlrwVGJPDwA1tDNx243OyaN2Z?=
 =?us-ascii?Q?EQIg4c8SROirCysgm39Q2NYSev4fUfGyr4B9fRWZSD7oxmK7zjh+ta5IdAPb?=
 =?us-ascii?Q?YqMJO3Axv5YXTnkFPzE7SuZXtwwOWYCxiDnHiaqdCUJmGhpp8h3MRpmlTiuH?=
 =?us-ascii?Q?85u4RZNSayGJmFE1o4AGy3n9itEtA3FLiYIFNuxXTd2xWMwz3y0walNjulvK?=
 =?us-ascii?Q?F1RXyu+BqbsO5dAE5pxmcEjWBL5leqUyZ3DWrfIdgeuNLuUwmblbDzr70Z9u?=
 =?us-ascii?Q?5+Ixocmdu6ZoZcsSuFYKZ/WiR8WofLX7kHQXrRe/NNM6bweA1zhTNMjVazk5?=
 =?us-ascii?Q?ByPPotiuTLjN17QBOsYAP3n2QWVQ6YjrC0vBtEKRnFOjsUEayuRQ/q4SYGz+?=
 =?us-ascii?Q?83sJsoJskNC5facQwoV9xJCl8gNkan3OELzO2TgcGbVsNmfE4DzlP7LZ65fm?=
 =?us-ascii?Q?wUe6NkhxHO04Wp07jQ74MUL41er8kSFwQnjgCO8D9+RKuiMBUjgsoxMlbDwV?=
 =?us-ascii?Q?SmRdw1r/koHNEraWKSFa4I2Ob3GSUJm0fDpacY3qSN8TdmlU0vwIE6EPm/Nw?=
 =?us-ascii?Q?B2biY+YOUj4wS/cl+keNgcL2C3a76MzSWvXgXQKQ02h3EGBF0X1KlVN/35Q+?=
 =?us-ascii?Q?3FkZYc2IC2Zuw2iEjyDxg1c3B9CGXo5/mfbdm7EMco4gtB/h8M79Gssco1Zz?=
 =?us-ascii?Q?SwV54cBaLW/0CoMSwdOzJJHbvMN7KJ0/1x0MAgyKVFP0xp21XTtYE32KnmpN?=
 =?us-ascii?Q?DQ1WIhRvcg/qSqxZMic5kOAVkrc0REjOvBzRxUNtE8Y6SCwJ8vZyiLtryjgl?=
 =?us-ascii?Q?0lstP3+DdKhk/Mq7uD8DHBJT+Wks+b+WQTteJPMyO1a4NYm7O0HZv/9gW8U3?=
 =?us-ascii?Q?aw6oTeCHu43EotnYMxVcfkuPFYQA/V/shxB03JO293iiqFNHWhS346wq/Yrv?=
 =?us-ascii?Q?otD3SPVRbenEqPIXuUDYNY6ZGbwNgXUJDnz/U9L7m/ruaPLCxVUve9XVyeEk?=
 =?us-ascii?Q?ouE78IV0Yc+F2EXXR0vV7/Ah?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4818b812-7667-4537-3ea9-08d8d3adcd8b
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 01:37:50.6801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLX5jqrCYELHPDr6ibKEMHT8IziptBeMclmqc1elvMbRie3dcXVXFJQ/FwgLIarys+B6zSVUEdbGjmunfFAZHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4092
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

