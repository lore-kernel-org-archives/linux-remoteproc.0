Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07118C7EE2A
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 May 2023 19:50:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbjEDTua (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 May 2023 15:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbjEDTtm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 May 2023 15:49:42 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F9F15ECA
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 May 2023 12:46:03 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet2-0007eH-I3; Thu, 04 May 2023 21:45:08 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet1-0018F8-BR; Thu, 04 May 2023 21:45:07 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet0-001JhG-Ll; Thu, 04 May 2023 21:45:06 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 01/18] remoteproc: da8xx: Convert to platform remove callback returning void
Date:   Thu,  4 May 2023 21:44:36 +0200
Message-Id: <20230504194453.1150368-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1904; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=vhPoBFtnA6xBzYnsFk7zcxZRcSq7PoGat4KtE90/LC4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkVAm9KYCUm/SDO0J0LqcdNz+S7LoHcTn/2z29G WRCW8cQPdWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFQJvQAKCRCPgPtYfRL+ ThpuB/9+KPBHYsGjQFSQ2eAc1tRL0EACEth6qKk5QWHirP5/WqoCSkRYpcXcdUMsCr95+Zcf1G1 WOSKAMSPlaeuM8IESqhPWXomIAGlyrMhKMvvZui6NLVz1e4ATgT27nvwWS+Qtp1raiDhPu77eCq q9nHBk9Gs/YoXSYz1PylQHEWNmjyX5U5Xu9SV35RDwFUVdQbHDTpn4UCoWK2H6V2yRYHzStHYHO 0XaSHvNCR5lLNg9WlYgo2MQJPare7js/IsJSNR3CgWLh0epnelMQyT6TeDFLA2Wp6GcldJcv0Jx iWFJxFldr9BeSJbrt8AP7ytWzh/Q2jDwXdjm1W+ecnId/z2X
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
 drivers/remoteproc/da8xx_remoteproc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index 768217f0f5cd..9041a0e07fb2 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -357,7 +357,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int da8xx_rproc_remove(struct platform_device *pdev)
+static void da8xx_rproc_remove(struct platform_device *pdev)
 {
 	struct rproc *rproc = platform_get_drvdata(pdev);
 	struct da8xx_rproc *drproc = rproc->priv;
@@ -374,8 +374,6 @@ static int da8xx_rproc_remove(struct platform_device *pdev)
 	rproc_free(rproc);
 	if (dev->of_node)
 		of_reserved_mem_device_release(dev);
-
-	return 0;
 }
 
 static const struct of_device_id davinci_rproc_of_match[] __maybe_unused = {
@@ -386,7 +384,7 @@ MODULE_DEVICE_TABLE(of, davinci_rproc_of_match);
 
 static struct platform_driver da8xx_rproc_driver = {
 	.probe = da8xx_rproc_probe,
-	.remove = da8xx_rproc_remove,
+	.remove_new = da8xx_rproc_remove,
 	.driver = {
 		.name = "davinci-rproc",
 		.of_match_table = of_match_ptr(davinci_rproc_of_match),
-- 
2.39.2

