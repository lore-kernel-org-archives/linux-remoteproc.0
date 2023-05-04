Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD99BC77B73
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 May 2023 21:03:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjEDVDX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 May 2023 17:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbjEDVCs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 May 2023 17:02:48 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D147150D3
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 May 2023 14:02:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet2-0007eN-IJ; Thu, 04 May 2023 21:45:08 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet1-0018FG-UB; Thu, 04 May 2023 21:45:07 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet1-001JhN-9w; Thu, 04 May 2023 21:45:07 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 03/18] remoteproc: imx: Convert to platform remove callback returning void
Date:   Thu,  4 May 2023 21:44:38 +0200
Message-Id: <20230504194453.1150368-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Ly0xPcU/hZvnRvvG/NfAev+WfzuzfcwZ0ROUAkPRh3w=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpQQzv3deTEcxZ0/dy8/Z+HceCXlzc+MpH4/JvlDH6Id7 kb36Ad0MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjCRpxocDGtvsFsqLdv9d1OY g1LA7SWO3hy9jLMYT1Z5+c4qDQyR1s07dGHanV8mcyYLfp1ayZ9Qa1/fbczq8/Fx2Apbya/Pv+S 9OPQ1Ujrx25O5U+OO251yiwyZ49qo5+XT/X3J6e5E6QdSsksf5i3+8iI5s/9VB09khv/GWfNnTZ 9tObtyYW9oOXf6i/rfy/uW2kZVpv1ODJi4UfLJfCX1yk/lcULOi7V3+/Hqq75PFvhWaHs5amb6r e6HhwxtmEs67dVSUwv3/bnKpVy0+H1s5i33K7vmfSv/ZJCpztmbwLeugOt6REKx3YzzfUI7Uif9 +znxFNtThrU7Y1nbp8+oX3K8b4ulUbEDO6eR5HHbjXMyAQ==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/remoteproc/imx_rproc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 0ab840dc7e97..f9874fc5a80f 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1112,7 +1112,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int imx_rproc_remove(struct platform_device *pdev)
+static void imx_rproc_remove(struct platform_device *pdev)
 {
 	struct rproc *rproc = platform_get_drvdata(pdev);
 	struct imx_rproc *priv = rproc->priv;
@@ -1123,8 +1123,6 @@ static int imx_rproc_remove(struct platform_device *pdev)
 	imx_rproc_free_mbox(rproc);
 	destroy_workqueue(priv->workqueue);
 	rproc_free(rproc);
-
-	return 0;
 }
 
 static const struct of_device_id imx_rproc_of_match[] = {
@@ -1145,7 +1143,7 @@ MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
 
 static struct platform_driver imx_rproc_driver = {
 	.probe = imx_rproc_probe,
-	.remove = imx_rproc_remove,
+	.remove_new = imx_rproc_remove,
 	.driver = {
 		.name = "imx-rproc",
 		.of_match_table = imx_rproc_of_match,
-- 
2.39.2

