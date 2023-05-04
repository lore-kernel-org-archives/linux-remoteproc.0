Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21170C7EE21
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 May 2023 21:04:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbjEDVEb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 May 2023 17:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230505AbjEDVEV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 May 2023 17:04:21 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 528A312EAD
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 May 2023 14:04:07 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet2-0007eJ-I3; Thu, 04 May 2023 21:45:08 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet1-0018FC-KX; Thu, 04 May 2023 21:45:07 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet1-001JhJ-1d; Thu, 04 May 2023 21:45:07 +0200
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
Subject: [PATCH 02/18] remoteproc: imx_dsp: Convert to platform remove callback returning void
Date:   Thu,  4 May 2023 21:44:37 +0200
Message-Id: <20230504194453.1150368-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1842; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=zwM/QZMJlZeCndTvEfUyRK5/BLxxW15WO9j7aKBmhB8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkVAm+Qq3eYUTNVFZfRTn2nJ9GGX1xBddXW4rQK 7Rh8V9gU6+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFQJvgAKCRCPgPtYfRL+ TlquB/45xYl5XCKrj4hfMbGGQywNrukbYNAIFugHfEkq4fg2NR+wlSk4CtSt3Yi4JXuI7THDzRD z8lCtlXg4JaazUCam9yjBRHjZSBGdBpYCghKmhIiOiGJbVviyFcjTiW2uhuBGcmFs6J+6bQgGZu qvs9wsVthzYTUxIl6MI3dmbe45IIOASZY5n3N3gMqfu8xY6weCj0+kCfdz6M7YweNWKfo8keNTI RNzqKHrZyRhaHAwTJmujQJtuZBJca6Rj5333hxe3Zmfx6cF64Mx8hUaMY/Ra7QhXGw5/VvFDaAI bEft5LmzSulA4KwSENw4IpPsIO7VQL2Dg4cKwbZ/qyFe7+1c
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
 drivers/remoteproc/imx_dsp_rproc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index cab06dbf37fb..bda7f2a910e0 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1161,7 +1161,7 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int imx_dsp_rproc_remove(struct platform_device *pdev)
+static void imx_dsp_rproc_remove(struct platform_device *pdev)
 {
 	struct rproc *rproc = platform_get_drvdata(pdev);
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -1170,8 +1170,6 @@ static int imx_dsp_rproc_remove(struct platform_device *pdev)
 	rproc_del(rproc);
 	imx_dsp_detach_pm_domains(priv);
 	rproc_free(rproc);
-
-	return 0;
 }
 
 /* pm runtime functions */
@@ -1328,7 +1326,7 @@ MODULE_DEVICE_TABLE(of, imx_dsp_rproc_of_match);
 
 static struct platform_driver imx_dsp_rproc_driver = {
 	.probe = imx_dsp_rproc_probe,
-	.remove = imx_dsp_rproc_remove,
+	.remove_new = imx_dsp_rproc_remove,
 	.driver = {
 		.name = "imx-dsp-rproc",
 		.of_match_table = imx_dsp_rproc_of_match,
-- 
2.39.2

