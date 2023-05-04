Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C431BC7EE21
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 May 2023 21:00:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjEDVAE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 May 2023 17:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbjEDVAC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 May 2023 17:00:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4570712E90
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 May 2023 13:59:43 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet8-0007sI-71; Thu, 04 May 2023 21:45:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet7-0018GX-8U; Thu, 04 May 2023 21:45:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet6-001JiM-FV; Thu, 04 May 2023 21:45:12 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 18/18] remoteproc: wkup_m3: Convert to platform remove callback returning void
Date:   Thu,  4 May 2023 21:44:53 +0200
Message-Id: <20230504194453.1150368-19-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1805; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=wiYtHFUNsHs5glKAwgx0vlWrixAeF/xF3xyWybjS+FY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkVAnRXtL/jme74iNukaqol+jnR//rOUq989RqF +iFQZ+AKaCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFQJ0QAKCRCPgPtYfRL+ TsOxB/9eBXtaKUp/f+5W3+6DvGCgT0PxvI2gvHKnhiIqVHXfxIFdQdV1UJcxE3bJQl2jVvHVRiO /+y1EiJk0YPQB3qlMFkyUMxgntJt9XwI3Q6xKhT0iK4SRINw8ungVAnx4KP/lw/TDexHbVpP1JE DLBvH+FVueYbuRFo3iP7/ijRB9G+bQLHlN9oEkoAgpRAXuKtjbYt5pfBuNQ8dTbkBSsWuUhuDlL db6sfrNJZVSPy8ETG8fzy1jIyczjcc2pAqsiQBwjMwgNuLqjvl+fucX0FrE32iZ+4tjEWge6LnE j6WCK4DUsAQHjwKF6rgwBU2LVgT634rAzztjGgrXtqynbhHy
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
 drivers/remoteproc/wkup_m3_rproc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
index a0c204cb0979..120dc7d2dac1 100644
--- a/drivers/remoteproc/wkup_m3_rproc.c
+++ b/drivers/remoteproc/wkup_m3_rproc.c
@@ -223,7 +223,7 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int wkup_m3_rproc_remove(struct platform_device *pdev)
+static void wkup_m3_rproc_remove(struct platform_device *pdev)
 {
 	struct rproc *rproc = platform_get_drvdata(pdev);
 
@@ -231,8 +231,6 @@ static int wkup_m3_rproc_remove(struct platform_device *pdev)
 	rproc_free(rproc);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -253,7 +251,7 @@ static const struct dev_pm_ops wkup_m3_rproc_pm_ops = {
 
 static struct platform_driver wkup_m3_rproc_driver = {
 	.probe = wkup_m3_rproc_probe,
-	.remove = wkup_m3_rproc_remove,
+	.remove_new = wkup_m3_rproc_remove,
 	.driver = {
 		.name = "wkup_m3_rproc",
 		.of_match_table = wkup_m3_rproc_of_match,
-- 
2.39.2

