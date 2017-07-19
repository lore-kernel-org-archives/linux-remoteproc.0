Return-Path: <p.zabel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 072/102] remoteproc: qcom: explicitly request exclusive reset control
Date: Wed, 19 Jul 2017 17:26:16 +0200
Message-Id: <20170719152646.25903-73-p.zabel@pengutronix.de>
In-Reply-To: <20170719152646.25903-1-p.zabel@pengutronix.de>
References: <20170719152646.25903-1-p.zabel@pengutronix.de>
To: linux-kernel@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Commit a53e35db70d1 ("reset: Ensure drivers are explicit when requesting
reset lines") started to transition the reset control request API calls
to explicitly state whether the driver needs exclusive or shared reset
control behavior. Convert all drivers requesting exclusive resets to the
explicit API call so the temporary transition helpers can be removed.

No functional changes.

Cc: Ohad Ben-Cohen <ohad@wizery.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 8fd697a3cf8f9..f156dfc463d85 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -867,7 +867,8 @@ static int q6v5_init_clocks(struct device *dev, struct clk **clks,
 
 static int q6v5_init_reset(struct q6v5 *qproc)
 {
-	qproc->mss_restart = devm_reset_control_get(qproc->dev, NULL);
+	qproc->mss_restart = devm_reset_control_get_exclusive(qproc->dev,
+							      NULL);
 	if (IS_ERR(qproc->mss_restart)) {
 		dev_err(qproc->dev, "failed to acquire mss restart\n");
 		return PTR_ERR(qproc->mss_restart);
-- 
2.11.0
