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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C0FC433E6
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 01:25:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B4302389E
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 01:25:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732185AbhAUBT1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 20 Jan 2021 20:19:27 -0500
Received: from mail-eopbgr150044.outbound.protection.outlook.com ([40.107.15.44]:16604
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391294AbhAUBQb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 20 Jan 2021 20:16:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSyUsuTKY97eehCYAgdq/j3NgB2DTfdj15dkKqsNCfE3ri+yUcYFZLI72loIb+uJ5Mk+gwy27PjvM1JQ0s84fEWRErDan3lgo+RihTX9QIazSTtlEX9pTRj1uzlssiELXgX9Y1NGEWm3zpNV0oCl3+4BuPOmsD+IdiCoKJSCVwk2n+9dRT+T6UOrNl4YmqbHBW2kYadA3rKXRTYLfSJb6l6O1obkmYD6rv82PEebCz+kmRScZFvKBuZo/e9LOQcd2PRAbIJ8xwY4pIZ3IScA+DRQnaCjEchbzUI3qrew/Cxw4jcWnVt8J3MZMuIexj8Lj2XbW5eeUir15kMQSgLT9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8prA6N0tCRFNc7f90wFWxXTMw+oe1yZsZ2xi0+JrHI=;
 b=Lj+DwY1v5MTdnUr9D4s7PQHtgHEdviwMtXpmXwAkMAtjpbXxCwgUxJsIziaevkTRRSnEAVXUR23nlqdf90Sc+PdX2VJDe/Ci5tZQtQg1/DSytrTXkobAOKXdOFfofg+dpn2azXdrJaKpys7SCSrqT3ye7K3linXOw/ggMQxKLMtcZLXjH/fSMp/fJvFZiURRbapMUu9sNjZY07X4Y4XDAMBndzHYK7BwiNyy+PJTcBR/3wYRjZVRR9lx44wl6Cc0xJGdLABsEnnfVkPFp5aO8pl46OgjpUP20ViRd7rIalX1g7Bub7ebj2iFSRs0gurWi/mNEqIP1h1k5CK7ZAgKEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8prA6N0tCRFNc7f90wFWxXTMw+oe1yZsZ2xi0+JrHI=;
 b=Z2UKOg3pUrvmWrSXDlqvCXM6CoD8vEXQ98roNLVXZVjxDfstlnwPRoPoG2cHJKWM6RssvjSpLGiW3fF3eheQdcJ/I/eVm5y6s/ua2G4sV8RnmjiSMDQwsf3P0O49PFpU+UlVgJ7Uh7u2EQ32ozVwaqkQt+4DOy+Y4GsBz8XCKwE=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 21 Jan
 2021 01:15:08 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 01:15:08 +0000
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
Subject: [PATCH V9 10/10] remoteproc: imx_proc: enable virtio/mailbox
Date:   Thu, 21 Jan 2021 09:03:35 +0800
Message-Id: <1611191015-22584-11-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611191015-22584-1-git-send-email-peng.fan@nxp.com>
References: <1611191015-22584-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 01:15:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 820dad94-a1ce-4732-bdd2-08d8bda9fe35
X-MS-TrafficTypeDiagnostic: DBBPR04MB7930:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB7930F61B2CBD7157F08FEFFA88A10@DBBPR04MB7930.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0IFYKDe/+2wKgFrltGstBIOn4yrtw4Hnh+c+LD9+IYQ7CYeJcjtTAL6TLHxkZqmdLBgYFfkQp6x1aU3cJ4SkWPWL5W8d3ohLkLnPBfFyipfMZ0vvrxBQ5Fe9u7yPItV+XTSnRRXGil2kZiWTPvIv0wU09pXZ2z+ioUEShRweO/ZQ7iNbdgKNWhRE8ENQyhGWhh7P5lWVidePeIphtiA3MquDINAfRdQLeX8gRv3dK8nYjxLPTlTGY0qOQ8ph4myjsdAYGxDLya5/6hVRj4VoDrUeo/k5HUIVA2+n0y8O1HElsjXE0xr+JQ3V5rylhzpWunpXxqqTexDkXNRBygcB4hNekgksR4bwXOHinkIwK4Ge+UvmK+iiCX3osYIIKA20fDcUtCFt4UbC5ylydA24gjuf+Xe1U/OHzBy8iecp33m8m0etYrmE37xf6w/9D40yLT/N5aB3hdAMeOsSMB4gRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(2906002)(7416002)(6512007)(956004)(8936002)(52116002)(15650500001)(26005)(478600001)(9686003)(316002)(2616005)(5660300002)(6506007)(86362001)(4326008)(16526019)(6486002)(186003)(8676002)(6666004)(69590400011)(36756003)(83380400001)(66946007)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?AvmRhOBYjXRvSrkCM2QQpc23rOK832Gg5pX0C3rNZkM3BxTiQN639ExTL+/L?=
 =?us-ascii?Q?yOAZus4UK8tPnt7l/QJXsl9v5B8T+p3h3MKA0R4AnehGvtvcJUGzv2MP1jI9?=
 =?us-ascii?Q?ReZvp20bcY6u39X2tbwAdRQdSWZS76sXUastP2YoxFkB2iA9ZYWu7DEA83Vm?=
 =?us-ascii?Q?kFUanqjWwZTgz1g1FFLExcba50CU8AOD7B83XWpqMymcmgbWJj0etiG54vm3?=
 =?us-ascii?Q?b6nfGXUQkNS60rLibc3RpqqA4ke2JRhCbgOOnEK1nKCWFvFOACIhvaljz8Dv?=
 =?us-ascii?Q?Of1Kk+3lrOGQYDQEbqKFUwC7gxFdKLcGWqH6PKLY07qDiYznB1HOWXXcVdCa?=
 =?us-ascii?Q?hKRQuoVyja+ZbXER4NHcFUNUkhFl/nhgH5/QVsXBZ1M+7i5XPhh9/oPsU+lR?=
 =?us-ascii?Q?kbSgFsY0R0ZaryJmjTylX1sC4/218I7Dawt2heHalFcpAijQs7WoIQb+P8ZG?=
 =?us-ascii?Q?ii04xbMly5kaz2Ta+lwN95xAGHL3N/ults3eiBG8RpNP8557jaPQvCWPsFSP?=
 =?us-ascii?Q?zYuOwUPWcTuuGmhqM5LPGQKfFiivjt+q8tMo/1z8+WmJl5T1wBs5cUsMGCnW?=
 =?us-ascii?Q?KKoYssoMK3eTbjfQjgE6RKCXI9WBB1czmbg63gsSG+3DRc59Rl+Q8J8KC6AU?=
 =?us-ascii?Q?hgbzEJ2kYchic2BP7QK5WmeH8AEXEoDzQd1xz0x8gMRLUDAhlB9jKwnT+XBw?=
 =?us-ascii?Q?mEN1pVUJj4UW+NwcrVYPcCp1YmXtpWKfhU9ki5aRDSw6bTfd17ZF3aMzoePG?=
 =?us-ascii?Q?kKLfdrImKxtXBZzbVCGq4ri1/KFWqH0ei/XyzCUe5Z1ds463/B5Dz4oKs5P5?=
 =?us-ascii?Q?DEXVCrUv3OxtOV+Fa+kM9nyczOWn48unDQXwxkDjdzqEa+ttcLFUbHZiuq9+?=
 =?us-ascii?Q?gmjONuiAkLKJM3n5nh/FJ8BZy1yqYmQ3y6LqgRkygInEtC8lfuiToCcCyu2L?=
 =?us-ascii?Q?7dbBWhhScs9abRq/4zuSpGLYMjNw9GbDB7E7PnCWQpcizILi1aHVdA9QeMgO?=
 =?us-ascii?Q?8XJp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 820dad94-a1ce-4732-bdd2-08d8bda9fe35
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 01:15:08.7801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZxSohkGoNoI3fkQyvQ6+EVkBXPggRt+QulbILTMoYsOrIt0zHVgiF9SFtYlYv4RnCeul5GJd3xcD0pYhB1x3aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7930
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
2.28.0

