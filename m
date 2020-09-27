Return-Path: <SRS0=lozc=DE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F95C4346E
	for <linux-remoteproc@archiver.kernel.org>; Sun, 27 Sep 2020 06:16:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 442AF221E5
	for <linux-remoteproc@archiver.kernel.org>; Sun, 27 Sep 2020 06:16:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="nElZ73hH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730355AbgI0GQA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 27 Sep 2020 02:16:00 -0400
Received: from mail-eopbgr30056.outbound.protection.outlook.com ([40.107.3.56]:25733
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726382AbgI0GQA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 27 Sep 2020 02:16:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElayPiuHMXZFMzytIVsrBxlMafjGJY9oJR8s2LMDdBIuULukjP2RoWvZiEFa7EHwPtisMKyOjqGf/Y0R1IAlpZgm9TWjy9SWmFrxT4wDG4Rr+cFpVCMjczy8meurlhNw+OkuwOdY4S75Kb3v2rTje44yLghyyhnlexEd3ocyXO3ofU0wRfX98J37Ao3hFWq25Ea+IfDPE2hM6rfPq6knJrJlxE+eenvtubFFLXP471HyYIHbFJfgFOtwqzlfjdtvyvGzOr7CIftSx1l1Q2aeS3GAWN6f/hL27pUMXIiM93YeW/9kcRCxcupMTgATJv42Mzf/Z9psxnVgBMIhDFDNww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xavbuV6lIwJY5oDAI7hT6YynOQprNT52DhNUM80TqUM=;
 b=Qqlgs4k6W7vU1oYSSH0o2G3r08tHhVgzqVLvUGT6coac25jRNy3WLsSzH8vT23KdQeb+zbHVy4AER5emBCo/y3KqgpQ4OxbLLEYIGAmE5qAAng4cWIYwEwFts4w816ektdUD6iSTw+7t234WFY2MvLqdpcZHt+w7DAYfqv/jaT1NgB31MdMym+Qihv2H5xDPwrFeVC+Z8Utw8cBUcmDgmrFsjsdPFpXj14OlNFqSTGN8dE2niPpp4AqlGHymLURjn2qEjn8zoGEUwjBTjklcDTW3aCXvQscQ4kdEO/Tmv1b6eZwsMCDcVEKpbHWouCdn414blsaL1D93t8bwLzs8+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xavbuV6lIwJY5oDAI7hT6YynOQprNT52DhNUM80TqUM=;
 b=nElZ73hHd9hUK3NY+qZIuvmBBs9y80J3yPumHmc5X+8aqNFkFAQdRM2KT1KvdnlCiL96LEJ/faHjb1/yoDc8KRi9nPmkFlkl3v0lrlnGjQcG4/Q9tYestmVNPfpQlHJOngesy1Td8ZllFNrIY4b47/vaFI5gvM6hiO3RGDvhrVY=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Sun, 27 Sep
 2020 06:15:55 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3412.028; Sun, 27 Sep
 2020 06:15:55 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH V2 7/7] remoteproc: imx_proc: enable virtio/mailbox
Date:   Sun, 27 Sep 2020 14:41:31 +0800
Message-Id: <20200927064131.24101-8-peng.fan@nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200927064131.24101-1-peng.fan@nxp.com>
References: <20200927064131.24101-1-peng.fan@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0178.apcprd04.prod.outlook.com
 (2603:1096:4:14::16) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR04CA0178.apcprd04.prod.outlook.com (2603:1096:4:14::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Sun, 27 Sep 2020 06:15:50 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 44220112-fcd6-4ce3-481a-08d862accaa9
X-MS-TrafficTypeDiagnostic: DB7PR04MB4633:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4633318EC2CC7FA54592F5B788340@DB7PR04MB4633.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:114;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: taS8xliWKdWVYmmH9sIajY9fp/DERE3ERYPv3kFZ5phnJ+6TvVSIakbdQkn9UH8kXeNQ5gxZ/k/Jt6BbZBDna5Fv8rkUJOFlSAIKIdmAyhGQkn58Fyiyi11sqOuWOc+k4mrbj182hQaWYVBMPeyRlD39czuOo6WiOe9O8Ss6I0WNWeB+OUFP6/Ru1+KiHrtBxkTX6YgkgmAjUyprGEllNY8q1dBvPdhrsPwaDvUe58TwKqC9kUOIOd9prTTEXnK8PPxBCKupM4EGLxSWboI/XGhIRSXZxEVNjJJFwvsyu+CRUw11gVsGpwdiDdMYBlxfWpZSVGOgu4iAvJdTdG24KQsQqIqIJyy8bqkHQY8XaVsPfHLCtpmGD0a9WuLkXtDv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(16526019)(186003)(52116002)(7416002)(6666004)(6486002)(54906003)(316002)(36756003)(1076003)(44832011)(5660300002)(4326008)(8676002)(2906002)(86362001)(26005)(956004)(15650500001)(478600001)(8936002)(66946007)(6506007)(6512007)(2616005)(66556008)(83380400001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: WGmmeUrHI0B4iwTy5iVQlsfsk+KPcxoqmcTeUgyHqjtPdM6psVjT4USDYjhLTJHT4PNENmQVhS+LbIRAeCW4vdlrRgRU7HfbR7Rk39Mh4pfYMwrdgYeqPwwb83LWDPeXpdiG40PI0rR0IIz2T2XcT1cyWwa7VPnEovOkyMNsuCpjvb1CP94V/kBwnZU051EK2QX0gRmWN7kkbTtfZMYwxQvEq/BoUjf/AP4phzXC21KYTNhu9bYYtF/sm49LbPpFxToEctkMnDNYNc0blal+2csuySJS8EhO5Eu8k/1flr3C9o4RkEpJAUrnaj3YzGnSAvQ0sef5FBporssmnlrIXIIsnC1f9e8G/iRubWDWYuc6M7oz60q5a8/DRkKeiOI0jQmF5pK5NPqR8rI1sJyqCA3aiI78bsoha7z5AwuKF9YO6le3jjzA4HiNTKqevAbfPKbvpF95eUha83zvO+7JCrvt42uiCgmvLwcRx+3KThLYv46rT2S80TukzfOwEIZnMvIFAh/3DC8DH1o6YR/MApNw2dzTg5hVMNgo/xiTd9lmklvao0cHCxzPZ6eNCM1r8rN9+ZFhm945cntNRJi7MB/WqsFUTsM7A+pWURVyuULQZywpKGgEcF/3SXJtUT6xeV/rMBnwFBP3B1k8cPGMYg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44220112-fcd6-4ce3-481a-08d862accaa9
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2020 06:15:54.9132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lbIvmLNX9QLrtmM6XEhDCbLHZvzOT1EwHEKC+rIgJrOabf1sOM/G3tHHdE6f2vJlsh2/8mLW6uMj5YEEa0TYJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use virtio/mailbox to build connection between Remote Proccessors
and Linux. Add delayed work to handle incoming messages.

Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 112 ++++++++++++++++++++++++++++++++-
 1 file changed, 109 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 0f69f3f745ab..c514d7ca7c81 100644
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
@@ -17,6 +18,8 @@
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
 
+#include "remoteproc_internal.h"
+
 #define IMX7D_SRC_SCR			0x0C
 #define IMX7D_ENABLE_M4			BIT(3)
 #define IMX7D_SW_M4P_RST		BIT(2)
@@ -88,6 +91,10 @@ struct imx_rproc {
 	const struct imx_rproc_dcfg	*dcfg;
 	struct imx_rproc_mem		mem[IMX7D_RPROC_MEM_MAX];
 	struct clk			*clk;
+	struct mbox_client		cl;
+	struct mbox_chan		*tx_ch;
+	struct mbox_chan		*rx_ch;
+	struct delayed_work		rproc_work;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
@@ -373,9 +380,30 @@ static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
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
+	mmsg = vqid << 16;
+
+	priv->cl.tx_tout = 100;
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
@@ -458,6 +486,70 @@ static void imx_rproc_memset(struct rproc *rproc, void *s, int c, size_t count)
 	memset_io((void * __iomem)s, c, count);
 }
 
+static void imx_rproc_vq_work(struct work_struct *work)
+{
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct imx_rproc *priv = container_of(dwork, struct imx_rproc,
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
+	schedule_delayed_work(&(priv->rproc_work), 0);
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
+	cl->tx_tout = 20;
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
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -501,17 +593,24 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, rproc);
 
+	ret = imx_rproc_xtr_mbox_init(rproc);
+	if (ret) {
+		if (ret == -EPROBE_DEFER)
+			goto err_put_rproc;
+		/* mbox is optional, so not fail here */
+	}
+
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
@@ -521,9 +620,11 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	ret = clk_prepare_enable(priv->clk);
 	if (ret) {
 		dev_err(&rproc->dev, "Failed to enable clock\n");
-		goto err_put_rproc;
+		goto err_put_mbox;
 	}
 
+	INIT_DELAYED_WORK(&(priv->rproc_work), imx_rproc_vq_work);
+
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
@@ -534,6 +635,11 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 err_put_clk:
 	clk_disable_unprepare(priv->clk);
+err_put_mbox:
+	if (!IS_ERR(priv->tx_ch))
+		mbox_free_channel(priv->tx_ch);
+	if (!IS_ERR(priv->rx_ch))
+		mbox_free_channel(priv->rx_ch);
 err_put_rproc:
 	rproc_free(rproc);
 
-- 
2.28.0

