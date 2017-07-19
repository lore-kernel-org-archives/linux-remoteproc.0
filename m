Return-Path: <p.zabel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 073/102] remoteproc: st: explicitly request exclusive reset control
Date: Wed, 19 Jul 2017 17:26:17 +0200
Message-Id: <20170719152646.25903-74-p.zabel@pengutronix.de>
In-Reply-To: <20170719152646.25903-1-p.zabel@pengutronix.de>
References: <20170719152646.25903-1-p.zabel@pengutronix.de>
To: linux-kernel@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Patrice Chotard <patrice.chotard@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Commit a53e35db70d1 ("reset: Ensure drivers are explicit when requesting
reset lines") started to transition the reset control request API calls
to explicitly state whether the driver needs exclusive or shared reset
control behavior. Convert all drivers requesting exclusive resets to the
explicit API call so the temporary transition helpers can be removed.

No functional changes.

Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/remoteproc/st_remoteproc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index d534bf23dc560..aacef0ea3b902 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -212,7 +212,8 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
 	int err;
 
 	if (ddata->config->sw_reset) {
-		ddata->sw_reset = devm_reset_control_get(dev, "sw_reset");
+		ddata->sw_reset = devm_reset_control_get_exclusive(dev,
+								   "sw_reset");
 		if (IS_ERR(ddata->sw_reset)) {
 			dev_err(dev, "Failed to get S/W Reset\n");
 			return PTR_ERR(ddata->sw_reset);
@@ -220,7 +221,8 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
 	}
 
 	if (ddata->config->pwr_reset) {
-		ddata->pwr_reset = devm_reset_control_get(dev, "pwr_reset");
+		ddata->pwr_reset = devm_reset_control_get_exclusive(dev,
+								    "pwr_reset");
 		if (IS_ERR(ddata->pwr_reset)) {
 			dev_err(dev, "Failed to get Power Reset\n");
 			return PTR_ERR(ddata->pwr_reset);
-- 
2.11.0
