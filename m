Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FEB1130
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Nov 2023 13:17:10 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6H4N-0004Sp-AX; Thu, 23 Nov 2023 22:17:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6H4M-00B7lp-SO; Thu, 23 Nov 2023 22:17:06 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6H4M-006z6Y-J1; Thu, 23 Nov 2023 22:17:06 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 1/3] remoteproc: k3-dsp: Suppress duplicate error message in .remove()
Date: Thu, 23 Nov 2023 22:16:59 +0100
Message-ID: <20231123211657.518181-6-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=8tCSTOMOXg0+McjPIRHDhVe37Q98IgNhLeHk/Eb/Oa0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlX8FLsiLrK/XONDUm6pu2bVXbGURNU5HQBwaCn eQJ+rWQmP6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZV/BSwAKCRCPgPtYfRL+ TlboCACBKVe1wJ9/F+4HrguPr8NGHCCcWil9ccABC1bkpyutMoufeRP65SEpLhXqDOO4UGToQx5 jYEhRePMgIJXE7mGqd5MoagaZIQEIY6PUUYa9vj7/g7H3rETfOpeNi1C+7w+0YCqf3OYed2XvN/ TdA/9j7qgjGicoi9D3DOkWsYL59Ub/i+XYmvrlpK8pG3b2JBKZ0kAcMaC9GWWx2qz19MlMjM+b6 jDvzhkBw3K5NH5oj1sjlGS2OBj28lgzYBp6E6ov44U0vebWcqP3EvMFVpt6VCBtNBVLy6qQ78le 76UBhYJ+6NFjAjd8Pa4/ZGqOOL1ndKuj0geFlWOfNK3SxMxv
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-remoteproc@vger.kernel.org

When the remove callback returns non-zero, the driver core emits an
error message about the error value being ignored. As the driver already
emits an error message already, return zero. This has no effect apart
from suppressing the core's message. The platform device gets unbound
irrespective of the return value.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index ef8415a7cd54..40a5fd8763fa 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -835,8 +835,9 @@ static int k3_dsp_rproc_remove(struct platform_device *pdev)
 	if (rproc->state == RPROC_ATTACHED) {
 		ret = rproc_detach(rproc);
 		if (ret) {
+			/* Note this error path leaks resources */
 			dev_err(dev, "failed to detach proc, ret = %d\n", ret);
-			return ret;
+			return 0;
 		}
 	}
 
-- 
2.42.0

