Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 100181B6
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Nov 2023 13:17:10 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6H4N-0004TC-MO; Thu, 23 Nov 2023 22:17:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6H4N-00B7lv-9i; Thu, 23 Nov 2023 22:17:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6H4N-006z6g-0T; Thu, 23 Nov 2023 22:17:07 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 3/3] remoteproc: k3-dsp: Convert to platform remove callback returning void
Date: Thu, 23 Nov 2023 22:17:01 +0100
Message-ID: <20231123211657.518181-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123211657.518181-5-u.kleine-koenig@pengutronix.de>
References: <20231123211657.518181-5-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2205; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=B+kHl4PtW8ebPr2J+C02IY+6a+QWbsPrWHNqv93roMw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlX8FNwpg9Tmh4Sq3mi16AmetLVE9WI3bifQWHg yp9kmBQoKKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZV/BTQAKCRCPgPtYfRL+ Tkr5B/9zAK2vtiiElqGCmORlgpWdc8z5TgkGnc+YMYI937RvH/BdG6mGQ3QEAiVzAvVk8HCw5V3 05QlKyLm5d6Mw+uF9fZ4V6WnOM3qAz2eCmtk4D7buZqayl+xrC0qPVOFvzAy57FJByAH6eyijNr eY6X9B1+kagx0YNMvWXQ0mO/dOngcl4fN/FDQh9eRSwCOhlc2NIJhjMxWHvNROf06kgdy4Y+8fL kdBk5h1kpyO/N1VrtUCFTN721XQBq5C96V2OclpdhjI0RZHKlWoMzn1soxyfDwEhTkPZDvtfvfx Ad3jyxtncoTZi9OLyWC3nhGXj3K1BcCQPTNHsywhDmVmo43E
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-remoteproc@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

There is no change in behaviour as .remove() already returned zero
unconditionally.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index f048ec1bb00f..ab882e3b7130 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -815,7 +815,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int k3_dsp_rproc_remove(struct platform_device *pdev)
+static void k3_dsp_rproc_remove(struct platform_device *pdev)
 {
 	struct k3_dsp_rproc *kproc = platform_get_drvdata(pdev);
 	struct rproc *rproc = kproc->rproc;
@@ -827,7 +827,7 @@ static int k3_dsp_rproc_remove(struct platform_device *pdev)
 		if (ret) {
 			/* Note this error path leaks resources */
 			dev_err(dev, "failed to detach proc (%pe)\n", ERR_PTR(ret));
-			return 0;
+			return;
 		}
 	}
 
@@ -845,8 +845,6 @@ static int k3_dsp_rproc_remove(struct platform_device *pdev)
 
 	k3_dsp_reserved_mem_exit(kproc);
 	rproc_free(kproc->rproc);
-
-	return 0;
 }
 
 static const struct k3_dsp_mem_data c66_mems[] = {
@@ -897,7 +895,7 @@ MODULE_DEVICE_TABLE(of, k3_dsp_of_match);
 
 static struct platform_driver k3_dsp_rproc_driver = {
 	.probe	= k3_dsp_rproc_probe,
-	.remove	= k3_dsp_rproc_remove,
+	.remove_new = k3_dsp_rproc_remove,
 	.driver	= {
 		.name = "k3-dsp-rproc",
 		.of_match_table = k3_dsp_of_match,
-- 
2.42.0

