Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4F7C7EE21
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 May 2023 21:05:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbjEDVFU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 May 2023 17:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbjEDVE4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 May 2023 17:04:56 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87A6E14E76
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 May 2023 14:04:40 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet7-0007r8-5L; Thu, 04 May 2023 21:45:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet6-0018GN-G8; Thu, 04 May 2023 21:45:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1puet5-001JiC-Pc; Thu, 04 May 2023 21:45:11 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Patrice Chotard <patrice.chotard@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 16/18] remoteproc: st: Convert to platform remove callback returning void
Date:   Thu,  4 May 2023 21:44:51 +0200
Message-Id: <20230504194453.1150368-17-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=9Hpc+1nEHcry74XcdQCz/ksi4LbJ7ai5C+zSEEKp4lk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkVAnPj1ADWabic6+xCCxZOpEF0L+YTwAzs8WDz nHxlp6S+UCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFQJzwAKCRCPgPtYfRL+ TlRoB/9zMKuw0qMffVkRack/9/Fg3t0DCVrKCyeQtlonarTOq8LhK71cPi9DDXwFWs+LtXbq4FW b/QkTsenI98/dYdGY+Kr8YTWTlUSc9CaXMB0X7NtLrUeyqgbGyBkWOr+wLK86G2GKcmTk9KGdiz scNU0aBcRIhVtszl6Wlq3CUtCCn1IUtdMkDmLR9LbZoXdAWNYnaFQhTk6ooYIywn6S1doESi1cH s9MfY8QagJVAZwaAmTWyDVOmvFO0B8UJFiq/oBLDaSqQZtuBRiqBKCJoELstljxY96PGFI5MX2p OIDgZep/ws2HG8sVhat/bbYYtCv/k9CXetB6l36m6Pt47JnA
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
 drivers/remoteproc/st_remoteproc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index 3f1b8963639f..e3ce01d98b4c 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -448,7 +448,7 @@ static int st_rproc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int st_rproc_remove(struct platform_device *pdev)
+static void st_rproc_remove(struct platform_device *pdev)
 {
 	struct rproc *rproc = platform_get_drvdata(pdev);
 	struct st_rproc *ddata = rproc->priv;
@@ -462,13 +462,11 @@ static int st_rproc_remove(struct platform_device *pdev)
 		mbox_free_channel(ddata->mbox_chan[i]);
 
 	rproc_free(rproc);
-
-	return 0;
 }
 
 static struct platform_driver st_rproc_driver = {
 	.probe = st_rproc_probe,
-	.remove = st_rproc_remove,
+	.remove_new = st_rproc_remove,
 	.driver = {
 		.name = "st-rproc",
 		.of_match_table = of_match_ptr(st_rproc_match),
-- 
2.39.2

