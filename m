Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00AADC77B78
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 May 2023 19:50:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231302AbjEDTub (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 May 2023 15:50:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231450AbjEDTt7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 May 2023 15:49:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E4315EDA
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 May 2023 12:46:17 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet3-0007fN-BQ; Thu, 04 May 2023 21:45:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet2-0018FR-Mg; Thu, 04 May 2023 21:45:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet1-001JhR-Lv; Thu, 04 May 2023 21:45:07 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 04/18] remoteproc: keystone: Convert to platform remove callback returning void
Date:   Thu,  4 May 2023 21:44:39 +0200
Message-Id: <20230504194453.1150368-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=0/3fXb771lq7M5zyWFzuzIgi18lnkEmq5ePVEebdMS0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkVAnB4Ot6AIRidaUh83qkZrHzxnPCjY1WzFNRt /MuPNL41mSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFQJwQAKCRCPgPtYfRL+ Tl5CCACNiDmYHt+o1+4lhN2hv5zCBrl0RZvadEkpjUtQkmtOy2hiZYZTxShSujp21+rheoi3WWo mOMd2tvQ/5HL9eYME42vS7WmkJR08qS2E2//sH0ZH8vOmgxyXo4/diqq9/0mmBdSlFznnqldBmJ TNoio5z04q/GFwVvnXeIpM5auSrFLAuHTdF+D5ghyvFOA1E/rP85iZntvGYLdRvM62ZWtIBHCxN spYUYpIkmjsdDG8Pt+ycGvG5UzDY9UgWz78iVpbCW0+0uD0FJD1IxNHuCaBaI3hdddD/ql+lhn8 m3tgCESEBty7lfGeIsebtbOsD8hnR2GUDRMceCdzVpgTsjsr
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
 drivers/remoteproc/keystone_remoteproc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 95b39741925d..7e57b90bcaf8 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -476,7 +476,7 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int keystone_rproc_remove(struct platform_device *pdev)
+static void keystone_rproc_remove(struct platform_device *pdev)
 {
 	struct keystone_rproc *ksproc = platform_get_drvdata(pdev);
 
@@ -486,8 +486,6 @@ static int keystone_rproc_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	rproc_free(ksproc->rproc);
 	of_reserved_mem_device_release(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id keystone_rproc_of_match[] = {
@@ -501,7 +499,7 @@ MODULE_DEVICE_TABLE(of, keystone_rproc_of_match);
 
 static struct platform_driver keystone_rproc_driver = {
 	.probe	= keystone_rproc_probe,
-	.remove	= keystone_rproc_remove,
+	.remove_new = keystone_rproc_remove,
 	.driver	= {
 		.name = "keystone-rproc",
 		.of_match_table = keystone_rproc_of_match,
-- 
2.39.2

