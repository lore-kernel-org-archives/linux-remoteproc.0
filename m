Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17EC4C7EE21
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 May 2023 21:01:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbjEDVBC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 May 2023 17:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbjEDVAw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 May 2023 17:00:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB27B13C3F
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 May 2023 14:00:29 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet4-0007gC-5G; Thu, 04 May 2023 21:45:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet3-0018Fa-CT; Thu, 04 May 2023 21:45:09 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet2-001Jhc-OH; Thu, 04 May 2023 21:45:08 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 07/18] remoteproc: omap: Convert to platform remove callback returning void
Date:   Thu,  4 May 2023 21:44:42 +0200
Message-Id: <20230504194453.1150368-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1728; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=o4IwZH4lQ0UPxLn4nXmIKRXs06/ONI0zo5PN+ZIkcgY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkVAnEDo7F8s3jhSHjHronu/K9DrAODLb/uvguT Or7JnJOjg+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFQJxAAKCRCPgPtYfRL+ TvwIB/4xgOH78VWYeINtDnaacGmhosMJfG6oTbBXE6Dy7uvfZum31h/fCytQj8K5YB+5kbcb/2a 3FhdpSfXHlVTueNKIp2+OdOtF4DdNCMmqWxST+vTg6aj70Zsvg3a1jwVdJu1EC7+BD6jd2YhTkH diygFgBnhfrmSR5KiivdhikMAkQV5nIBYfMPU/IgS/iYOxHDiWMvEHbLb5HpnMnPUDM6dseJv8O orgJcdxRiSrVir45tOAcaMR2865/8+onUZkGjzEgs3yqRv13mKzorsd5BYvpyRvMqTIianDirHW h6iicvKsiM5IgT1WR5UOFyrBcEwwyWdeci9HmYKOTgmQ/hTF
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
 drivers/remoteproc/omap_remoteproc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 430fab0266ed..82ed90f03d91 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -1363,15 +1363,13 @@ static int omap_rproc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int omap_rproc_remove(struct platform_device *pdev)
+static void omap_rproc_remove(struct platform_device *pdev)
 {
 	struct rproc *rproc = platform_get_drvdata(pdev);
 
 	rproc_del(rproc);
 	rproc_free(rproc);
 	of_reserved_mem_device_release(&pdev->dev);
-
-	return 0;
 }
 
 static const struct dev_pm_ops omap_rproc_pm_ops = {
@@ -1382,7 +1380,7 @@ static const struct dev_pm_ops omap_rproc_pm_ops = {
 
 static struct platform_driver omap_rproc_driver = {
 	.probe = omap_rproc_probe,
-	.remove = omap_rproc_remove,
+	.remove_new = omap_rproc_remove,
 	.driver = {
 		.name = "omap-rproc",
 		.pm = &omap_rproc_pm_ops,
-- 
2.39.2

