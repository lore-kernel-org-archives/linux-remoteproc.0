Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C36E0C77B73
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 May 2023 21:02:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbjEDVCI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 May 2023 17:02:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbjEDVBh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 May 2023 17:01:37 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49AB61493F
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 May 2023 14:01:19 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet6-0007no-LI; Thu, 04 May 2023 21:45:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet6-0018GH-0t; Thu, 04 May 2023 21:45:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet5-001Ji9-9v; Thu, 04 May 2023 21:45:11 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 15/18] remoteproc: virtio: Convert to platform remove callback returning void
Date:   Thu,  4 May 2023 21:44:50 +0200
Message-Id: <20230504194453.1150368-16-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1730; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Jb3XK80JWFa1KBbanIJg23FUvQCRDP2jyNTiE2gCHoc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkVAnOjmCCrTxmzb/rNqbiEfgA5rdvCLZHEEuRr 0mFFmwmdSWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFQJzgAKCRCPgPtYfRL+ TvzxCACRyHVSxieThctbEFV7UVHvZlBr96NHDW3GTq3GOZeh1eOzf9qXbxFcn+LKveC3U9MlRGJ OIQKS7FGEqdNwaVEQ5U91PP8W7zWRRvK/wtjo/hU4Po2jB1joycAVItg4hSU4uRxwfqEUUWykEc +d3YvZRujJXEx6FniEguRjXCcTpO7VD4GOAbho3JCpkwL4xzvTHUnLyRSDT0Lnqn6VSNrhVwu05 W6ysqhxo+E1cnTs97OGDMzoNy9Riw4Eczj8K6bL/iR5WZaGEf1KTEJnQ0cClh4fG2CzKvciAkpQ uaDK7wwyZjNf2N3hxxBEr1Nie51ztML5dRbYfYdkLwNXdnbx
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
 drivers/remoteproc/remoteproc_virtio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 0e95525c1158..83d76915a6ad 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -569,7 +569,7 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rproc_virtio_remove(struct platform_device *pdev)
+static void rproc_virtio_remove(struct platform_device *pdev)
 {
 	struct rproc_vdev *rvdev = dev_get_drvdata(&pdev->dev);
 	struct rproc *rproc = rvdev->rproc;
@@ -588,14 +588,12 @@ static int rproc_virtio_remove(struct platform_device *pdev)
 	dma_release_coherent_memory(&pdev->dev);
 
 	put_device(&rproc->dev);
-
-	return 0;
 }
 
 /* Platform driver */
 static struct platform_driver rproc_virtio_driver = {
 	.probe		= rproc_virtio_probe,
-	.remove		= rproc_virtio_remove,
+	.remove_new	= rproc_virtio_remove,
 	.driver		= {
 		.name	= "rproc-virtio",
 	},
-- 
2.39.2

