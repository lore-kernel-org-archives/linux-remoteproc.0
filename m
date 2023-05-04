Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759A0C7EE21
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 May 2023 21:04:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbjEDVEf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 May 2023 17:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbjEDVEY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 May 2023 17:04:24 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93BD4132AC
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 May 2023 14:04:10 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet6-0007nL-G4; Thu, 04 May 2023 21:45:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet5-0018GD-Rx; Thu, 04 May 2023 21:45:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet4-001Ji5-Tk; Thu, 04 May 2023 21:45:10 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 14/18] remoteproc: rcar: Convert to platform remove callback returning void
Date:   Thu,  4 May 2023 21:44:49 +0200
Message-Id: <20230504194453.1150368-15-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1632; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Zny3OLaAjk+HEbeQMxR6gzXElL3Bmi+jO2wuKnnf+64=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkVAnM3qU+cnPZKUJqauBDn98pmtO9XOazjCF17 FFRmBI8LWWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFQJzAAKCRCPgPtYfRL+ TrkJCACCn/k5hOEcQOg0QdpS/T57aLZmW2ClwU02oKm9Jjt1g13wwrudAzgCkI2rAiUnmG4OptC LQqP1rgDUyi9A/z1aX9w7Bhe3C3G59VBshLxZyBSVH80L+R+sgMJ5JDZwPqUjsdaxaHC06rpgNc /4Je6a8lfFx+/oF/Ek69BV2sMKrL8v87V65cqorKngDjSfrbCwNz1dUA6Gk0kxY8Z60inEknI7k X8dGGHbXvAPtaV6scAe7id9xT7RFeFyMQA4d8KeleIAHGZ/Z9OSEvE1s18/MtYFZ1rIC1d2Ns1z ECSrfdEzoYOs2qempfMptKjjDfsz/B6QW6FA7QsAY2VUot3a
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
 drivers/remoteproc/rcar_rproc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
index 1ff2a73ade90..90e8769d5624 100644
--- a/drivers/remoteproc/rcar_rproc.c
+++ b/drivers/remoteproc/rcar_rproc.c
@@ -197,13 +197,11 @@ static int rcar_rproc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rcar_rproc_remove(struct platform_device *pdev)
+static void rcar_rproc_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 
 	pm_runtime_disable(dev);
-
-	return 0;
 }
 
 static const struct of_device_id rcar_rproc_of_match[] = {
@@ -215,7 +213,7 @@ MODULE_DEVICE_TABLE(of, rcar_rproc_of_match);
 
 static struct platform_driver rcar_rproc_driver = {
 	.probe = rcar_rproc_probe,
-	.remove = rcar_rproc_remove,
+	.remove_new = rcar_rproc_remove,
 	.driver = {
 		.name = "rcar-rproc",
 		.of_match_table = rcar_rproc_of_match,
-- 
2.39.2

