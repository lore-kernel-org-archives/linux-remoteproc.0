Return-Path: <spjoshi@codeaurora.org>
From: Sarangdhar Joshi <spjoshi@codeaurora.org>
Subject: [PATCH] remoteproc: Add support for xo clock
Date: Thu, 20 Oct 2016 11:55:24 -0700
Message-Id: <1476989724-7464-1-git-send-email-spjoshi@codeaurora.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Sarangdhar Joshi <spjoshi@codeaurora.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Trilok Soni <tsoni@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add xo clock support required for Qualcomm ADSP
Peripheral Image Loader.

Signed-off-by: Sarangdhar Joshi <spjoshi@codeaurora.org>
---

This patch depends on https://lkml.org/lkml/2016/8/23/50

 drivers/remoteproc/qcom_adsp_pil.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
index 9141633..a1f2f32 100644
--- a/drivers/remoteproc/qcom_adsp_pil.c
+++ b/drivers/remoteproc/qcom_adsp_pil.c
@@ -15,6 +15,7 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/clk.h>
 #include <linux/firmware.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
@@ -48,6 +49,8 @@ struct qcom_adsp {
 	struct qcom_smem_state *state;
 	unsigned stop_bit;
 
+	struct clk *xo;
+
 	struct regulator *cx_supply;
 
 	struct completion start_done;
@@ -102,10 +105,14 @@ static int adsp_start(struct rproc *rproc)
 	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
 	int ret;
 
-	ret = regulator_enable(adsp->cx_supply);
+	ret = clk_prepare_enable(adsp->xo);
 	if (ret)
 		return ret;
 
+	ret = regulator_enable(adsp->cx_supply);
+	if (ret)
+		goto disable_clocks;
+
 	ret = qcom_scm_pas_auth_and_reset(ADSP_PAS_ID);
 	if (ret) {
 		dev_err(adsp->dev,
@@ -126,6 +133,8 @@ static int adsp_start(struct rproc *rproc)
 
 disable_regulators:
 	regulator_disable(adsp->cx_supply);
+disable_clocks:
+	clk_disable_unprepare(adsp->xo);
 
 	return ret;
 }
@@ -223,6 +232,17 @@ static irqreturn_t adsp_stop_ack_interrupt(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static int adsp_init_clock(struct qcom_adsp *adsp)
+{
+	adsp->xo = devm_clk_get(adsp->dev, "xo");
+	if (IS_ERR(adsp->xo)) {
+		dev_err(adsp->dev, "failed to get xo clock");
+		return PTR_ERR(adsp->xo);
+	}
+
+	return 0;
+}
+
 static int adsp_init_regulator(struct qcom_adsp *adsp)
 {
 	adsp->cx_supply = devm_regulator_get(adsp->dev, "cx");
@@ -320,6 +340,10 @@ static int adsp_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
+	ret = adsp_init_clock(adsp);
+	if (ret)
+		goto free_rproc;
+
 	ret = adsp_init_regulator(adsp);
 	if (ret)
 		goto free_rproc;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
