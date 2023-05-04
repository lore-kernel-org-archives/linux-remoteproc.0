Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DE0C7EE22
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 May 2023 21:04:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbjEDVE2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 May 2023 17:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbjEDVEI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 May 2023 17:04:08 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 725E99EEB
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 May 2023 14:03:43 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet3-0007fI-8n; Thu, 04 May 2023 21:45:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet2-0018FL-IM; Thu, 04 May 2023 21:45:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet1-001JhV-Vu; Thu, 04 May 2023 21:45:07 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 05/18] remoteproc: meson_mx_ao_arc: Convert to platform remove callback returning void
Date:   Thu,  4 May 2023 21:44:40 +0200
Message-Id: <20230504194453.1150368-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1904; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=lIbUsGc2XtYKyArZjzb1rasuyQpFQ613/CD76txdktc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkVAnC3BTj2gjhnUzSm00m0WxUfVv6vhFkWlrNn CG7h+7WfCCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFQJwgAKCRCPgPtYfRL+ TsIxCACnRWeKUcB9rtEk+j7OZ2fPTQcYDF0Utpqxrf+7oOC2Z1eOHm9Dr4QDmahOTsH+pxLtujX QW3Fj4VbCXKkGOdxjzQDC0goSUbrSCei3IijiKOS05oHnWi2EqPfbMA6N1/6T/+BNnufAsiIleg W8SwS0T9qzf5dX1wtYS8/hK6bUc3ujQhLCS9MLLJAZJcubWfERslVQftGhz0b8YmL1FkXLkvkIm SIrvFpGfX0Gpxt31SkktpF918UsUhO7xIrVw9qV5z0sjS1bya3/EjZo3CutbE/3vqsZnIuNDsyi 6VDVz6P2FTReHbFZnhwk1I4QTyulR1SXnx1YM5Ccp+d0cZa9
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
 drivers/remoteproc/meson_mx_ao_arc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/meson_mx_ao_arc.c b/drivers/remoteproc/meson_mx_ao_arc.c
index 462cddab6518..f6744b538323 100644
--- a/drivers/remoteproc/meson_mx_ao_arc.c
+++ b/drivers/remoteproc/meson_mx_ao_arc.c
@@ -228,15 +228,13 @@ static int meson_mx_ao_arc_rproc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int meson_mx_ao_arc_rproc_remove(struct platform_device *pdev)
+static void meson_mx_ao_arc_rproc_remove(struct platform_device *pdev)
 {
 	struct rproc *rproc = platform_get_drvdata(pdev);
 	struct meson_mx_ao_arc_rproc_priv *priv = rproc->priv;
 
 	rproc_del(rproc);
 	gen_pool_free(priv->sram_pool, priv->sram_va, priv->sram_size);
-
-	return 0;
 }
 
 static const struct of_device_id meson_mx_ao_arc_rproc_match[] = {
@@ -248,7 +246,7 @@ MODULE_DEVICE_TABLE(of, meson_mx_ao_arc_rproc_match);
 
 static struct platform_driver meson_mx_ao_arc_rproc_driver = {
 	.probe = meson_mx_ao_arc_rproc_probe,
-	.remove = meson_mx_ao_arc_rproc_remove,
+	.remove_new = meson_mx_ao_arc_rproc_remove,
 	.driver = {
 		.name = "meson-mx-ao-arc-rproc",
 		.of_match_table = meson_mx_ao_arc_rproc_match,
-- 
2.39.2

