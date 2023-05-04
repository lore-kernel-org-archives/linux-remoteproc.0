Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B7FDC7EE21
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 May 2023 21:00:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbjEDVAb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 May 2023 17:00:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbjEDVA0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 May 2023 17:00:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDD9B1328F
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 May 2023 14:00:06 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet7-0007rT-Tw; Thu, 04 May 2023 21:45:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet7-0018GT-2O; Thu, 04 May 2023 21:45:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet6-001JiH-2c; Thu, 04 May 2023 21:45:12 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 17/18] remoteproc: stm32: Convert to platform remove callback returning void
Date:   Thu,  4 May 2023 21:44:52 +0200
Message-Id: <20230504194453.1150368-18-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=9tubpyai1MB/op1/Q29LPA4MvfejBQFUuyYAIHIRXME=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkVAnQwcEJ78+sYNtDLU5hJpc67PNpuv+IhuLlV EoKBa1W/yOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFQJ0AAKCRCPgPtYfRL+ TgLgB/98quk2KPNuo4vHNRohCZNRm15MpGX2eYc3IoP1bAOIp2xRVYzPsddMlqIEDbkNeaTCLty QEsEq4eWXV8q+ZYHavex1LoRpaCvx2Dror1cBFosEn68jlj8ck4hAeM5SAxU0aqZQTSd/poPC69 zsUpiVKq1ju5pce/4kRn+sEnYObTt+sQbe5TnK0faLvdh9k+1y+4CGvX4viLNA0g3ncJGR6pA34 z8QCh1RT81CXdhgcDjL19C1SVhGbnXoDPRl2Ph/RHfpmICFdOhddC/TaOyGvIfCsjFYWvs8HAGP mmyspGtp6BhXV4DPlguXhu0ZAs/fpvnM21L4YBxXfwMixdyE
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
 drivers/remoteproc/stm32_rproc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 8746cbb1f168..19716ec82aae 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -867,7 +867,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int stm32_rproc_remove(struct platform_device *pdev)
+static void stm32_rproc_remove(struct platform_device *pdev)
 {
 	struct rproc *rproc = platform_get_drvdata(pdev);
 	struct stm32_rproc *ddata = rproc->priv;
@@ -885,8 +885,6 @@ static int stm32_rproc_remove(struct platform_device *pdev)
 		device_init_wakeup(dev, false);
 	}
 	rproc_free(rproc);
-
-	return 0;
 }
 
 static int __maybe_unused stm32_rproc_suspend(struct device *dev)
@@ -916,7 +914,7 @@ static SIMPLE_DEV_PM_OPS(stm32_rproc_pm_ops,
 
 static struct platform_driver stm32_rproc_driver = {
 	.probe = stm32_rproc_probe,
-	.remove = stm32_rproc_remove,
+	.remove_new = stm32_rproc_remove,
 	.driver = {
 		.name = "stm32-rproc",
 		.pm = &stm32_rproc_pm_ops,
-- 
2.39.2

