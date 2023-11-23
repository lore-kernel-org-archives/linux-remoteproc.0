Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ECF5A3
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Nov 2023 13:17:10 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6H4N-0004Sd-AS; Thu, 23 Nov 2023 22:17:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6H4M-00B7lm-MF; Thu, 23 Nov 2023 22:17:06 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6H4M-006z6V-Cu; Thu, 23 Nov 2023 22:17:06 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 0/3] remoteproc: k3-dsp: Some cleanups
Date: Thu, 23 Nov 2023 22:16:58 +0100
Message-ID: <20231123211657.518181-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=651; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ObHuSJJCfA6x6JZJF5jSJbVRVmMDZJO00PlgjJqmBHg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlX8FK+/6KUn72mK8CCbQAiZQAb0dszqzWQhLQk 6oQYqXwAZmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZV/BSgAKCRCPgPtYfRL+ TonhCAC4/wa5HXzRC4pUmmN0tL7ytNHaQGbWl4GusV8LM2nWePP7rui2XwyIxJtTT8ZSStXbAv+ DaW+rttkRt9Vx4k68fBvlNnl7mNJQIsvRE9JEBJXCUtxFEYGcwCb9NAjjnUs2umCcUwhE1aiFEl Zw5W9Y38LaP6hLVjI3Fz/dzv3YDZkVHWd3F7SQ4TDyD7TW35fRWEVGl9HDh6FlhwT7qPq+yPogM izT9pIWLwHdgWwcvFJNPmKWmcw82eqK0LYD93kuWV31o1M53YBpnO1YxpzlMxc1WP/FQiZZQT2O iTY+0WtEPISbVcp8STb3g83v1uydWhURoRvmJGij7wFh8iff
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-remoteproc@vger.kernel.org

Hello,

my initial plan was to just convert the k3-dsp remoteproc driver to
.remove_new() (i.e. the third patch). The other two patches are
improvements I noticed while working on that driver.

Best regards
Uwe

Uwe Kleine-König (3):
  remoteproc: k3-dsp: Suppress duplicate error message in .remove()
  remoteproc: k3-dsp: Use symbolic error codes in error messages
  remoteproc: k3-dsp: Convert to platform remove callback returning void

 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 87 ++++++++++-------------
 1 file changed, 38 insertions(+), 49 deletions(-)

base-commit: 4e87148f80d198ba5febcbcc969c6b9471099a09
-- 
2.42.0

