Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC77C7EE22
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 May 2023 21:03:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjEDVDY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 May 2023 17:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbjEDVDH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 May 2023 17:03:07 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF31FAD24
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 May 2023 14:02:23 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet5-0007h4-0J; Thu, 04 May 2023 21:45:11 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet3-0018Fk-V6; Thu, 04 May 2023 21:45:09 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet3-001Jhh-1D; Thu, 04 May 2023 21:45:09 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 08/18] remoteproc: pru: Convert to platform remove callback returning void
Date:   Thu,  4 May 2023 21:44:43 +0200
Message-Id: <20230504194453.1150368-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1662; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=3hNSRkbwZ1Vnjxo3vYRehL+usbsc/gxMPXvOVamLD0k=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkVAnF9q2or5nkrSKhKtafvS3kAZnp++wnQq+Wc jfbIqlS2hGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFQJxQAKCRCPgPtYfRL+ Tj42CACqTtv6ygPdTfV4ww7RUqba/2+41rnhjhE7sthnf3hJ2YvY5TkmVAgHu6dT8pteJmHjooF VmDyzGAbrZsPcg7xLFMedavNCF9jOyKAIazzNPBpZj2dGvWap++vmDRKY5Ae8AN+ijbiBiB0TT2 FbCXW3MigMUDaTNbypjjINqieCsdwoRPEC0XQeUZGymrYr2MBPkGRcNOMpc2Q3ZRiPmW22dqItZ qZi11yVIlQ05E+KB4O+5SVro7Boz6C9kffxDvpPoegn4jNupsxlCuXS0TCTV/lzVdg0p87sbLhM wYNxc4JmpastZuQuQMbgM349bTs6o6t/M5a/2XCFFBfSENTZ
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
 drivers/remoteproc/pru_rproc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 095f66130f48..f7ac9b6b80ed 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -1071,14 +1071,12 @@ static int pru_rproc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int pru_rproc_remove(struct platform_device *pdev)
+static void pru_rproc_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rproc *rproc = platform_get_drvdata(pdev);
 
 	dev_dbg(dev, "%s: removing rproc %s\n", __func__, rproc->name);
-
-	return 0;
 }
 
 static const struct pru_private_data pru_data = {
@@ -1126,7 +1124,7 @@ static struct platform_driver pru_rproc_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe  = pru_rproc_probe,
-	.remove = pru_rproc_remove,
+	.remove_new = pru_rproc_remove,
 };
 module_platform_driver(pru_rproc_driver);
 
-- 
2.39.2

