Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v5 08/10] remoteproc: q6v5-mss: Active powerdomain for SDM845
Date: Wed, 30 Jan 2019 16:39:31 -0800
Message-Id: <20190131003933.11436-9-bjorn.andersson@linaro.org>
In-Reply-To: <20190131003933.11436-1-bjorn.andersson@linaro.org>
References: <20190131003933.11436-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The SDM845 MSS needs the load_state powerdomain voted for during the
duration of the MSS being powered on, to let the AOSS know that it may
not perform certain power save measures. So vote for this.

Tested-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Sibi Sankar <sibis@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- None

Changes since v3:
- None

 drivers/remoteproc/qcom_q6v5_mss.c | 31 ++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index c32c63e351a0..e30f5486fd20 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -133,6 +133,7 @@ struct rproc_hexagon_res {
 	char **proxy_clk_names;
 	char **reset_clk_names;
 	char **active_clk_names;
+	char **active_pd_names;
 	char **proxy_pd_names;
 	int version;
 	bool need_mem_protection;
@@ -159,10 +160,12 @@ struct q6v5 {
 	struct clk *active_clks[8];
 	struct clk *reset_clks[4];
 	struct clk *proxy_clks[4];
+	struct device *active_pds[1];
 	struct device *proxy_pds[3];
 	int active_clk_count;
 	int reset_clk_count;
 	int proxy_clk_count;
+	int active_pd_count;
 	int proxy_pd_count;
 
 	struct reg_info active_regs[1];
@@ -730,10 +733,16 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 
 	qcom_q6v5_prepare(&qproc->q6v5);
 
+	ret = q6v5_pds_enable(qproc, qproc->active_pds, qproc->active_pd_count);
+	if (ret < 0) {
+		dev_err(qproc->dev, "failed to enable active power domains\n");
+		goto disable_irqs;
+	}
+
 	ret = q6v5_pds_enable(qproc, qproc->proxy_pds, qproc->proxy_pd_count);
 	if (ret < 0) {
 		dev_err(qproc->dev, "failed to enable proxy power domains\n");
-		goto disable_irqs;
+		goto disable_active_pds;
 	}
 
 	ret = q6v5_regulator_enable(qproc, qproc->proxy_regs,
@@ -839,6 +848,8 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 			       qproc->proxy_reg_count);
 disable_proxy_pds:
 	q6v5_pds_disable(qproc, qproc->proxy_pds, qproc->proxy_pd_count);
+disable_active_pds:
+	q6v5_pds_disable(qproc, qproc->active_pds, qproc->active_pd_count);
 disable_irqs:
 	qcom_q6v5_unprepare(&qproc->q6v5);
 
@@ -878,6 +889,7 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
 			 qproc->active_clk_count);
 	q6v5_regulator_disable(qproc, qproc->active_regs,
 			       qproc->active_reg_count);
+	q6v5_pds_disable(qproc, qproc->active_pds, qproc->active_pd_count);
 
 	/* In case of failure or coredump scenario where reclaiming MBA memory
 	 * could not happen reclaim it here.
@@ -1412,11 +1424,19 @@ static int q6v5_probe(struct platform_device *pdev)
 	}
 	qproc->active_reg_count = ret;
 
+	ret = q6v5_pds_attach(&pdev->dev, qproc->active_pds,
+			      desc->active_pd_names);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to attach active power domains\n");
+		goto free_rproc;
+	}
+	qproc->active_pd_count = ret;
+
 	ret = q6v5_pds_attach(&pdev->dev, qproc->proxy_pds,
 			      desc->proxy_pd_names);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to init power domains\n");
-		goto free_rproc;
+		goto detach_active_pds;
 	}
 	qproc->proxy_pd_count = ret;
 
@@ -1452,6 +1472,8 @@ static int q6v5_probe(struct platform_device *pdev)
 
 detach_proxy_pds:
 	q6v5_pds_detach(qproc, qproc->proxy_pds, qproc->proxy_pd_count);
+detach_active_pds:
+	q6v5_pds_detach(qproc, qproc->active_pds, qproc->active_pd_count);
 free_rproc:
 	rproc_free(rproc);
 
@@ -1469,6 +1491,7 @@ static int q6v5_remove(struct platform_device *pdev)
 	qcom_remove_smd_subdev(qproc->rproc, &qproc->smd_subdev);
 	qcom_remove_ssr_subdev(qproc->rproc, &qproc->ssr_subdev);
 
+	q6v5_pds_detach(qproc, qproc->active_pds, qproc->active_pd_count);
 	q6v5_pds_detach(qproc, qproc->proxy_pds, qproc->proxy_pd_count);
 
 	rproc_free(qproc->rproc);
@@ -1495,6 +1518,10 @@ static const struct rproc_hexagon_res sdm845_mss = {
 			"mnoc_axi",
 			NULL
 	},
+	.active_pd_names = (char*[]){
+			"load_state",
+			NULL
+	},
 	.proxy_pd_names = (char*[]){
 			"cx",
 			"mx",
-- 
2.18.0
