Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH 2/5] remoteproc: Adding q6v55 specific regulator, clk, reset interface.
Date: Mon, 24 Oct 2016 21:25:56 +0530
Message-Id: <1477324559-24752-3-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1477324559-24752-1-git-send-email-akdwived@codeaurora.org>
References: <1477324559-24752-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, spjoshi@codeaurora.org, akdwived@codeaurora.org, kaushalk@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

q6v55 use different regulator and clock resource than q6v5, hence
using separate resource handling for same. Also reset register
programming in q6v55 is non secure so resource controller init-
ilization is not required for q6v55.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 271 +++++++++++++++++++++++++++++++++++++
 1 file changed, 271 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 8df95a0..c7dca40 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -215,6 +215,203 @@ static void q6v5_regulator_disable(struct q6v5 *qproc)
 	regulator_set_voltage(mss, 0, 1150000);
 }
 
+static int q6v55_regulator_init(struct q6v5 *qproc)
+{
+	int ret;
+
+	qproc->supply[Q6V5_SUPPLY_CX].supply = "vdd_cx";
+	qproc->supply[Q6V5_SUPPLY_MX].supply = "vdd_mx";
+	qproc->supply[Q6V5_SUPPLY_PLL].supply = "vdd_pll";
+
+	ret = devm_regulator_bulk_get(qproc->dev,
+			(ARRAY_SIZE(qproc->supply) - 1), qproc->supply);
+	if (ret < 0) {
+		dev_err(qproc->dev, "failed to get supplies\n");
+		return ret;
+	}
+
+
+	return 0;
+}
+
+static int q6v55_clk_enable(struct q6v5 *qproc)
+{
+	int ret;
+
+	ret = clk_prepare_enable(qproc->ahb_clk);
+	if (ret)
+		goto out;
+
+	ret = clk_prepare_enable(qproc->axi_clk);
+	if (ret)
+		goto err_axi_clk;
+
+	ret = clk_prepare_enable(qproc->rom_clk);
+	if (ret)
+		goto err_rom_clk;
+
+	ret = clk_prepare_enable(qproc->gpll0_mss_clk);
+	if (ret)
+		goto err_gpll0_mss_clk;
+
+	ret = clk_prepare_enable(qproc->snoc_axi_clk);
+	if (ret)
+		goto err_snoc_axi_clk;
+
+	ret = clk_prepare_enable(qproc->mnoc_axi_clk);
+	if (ret)
+		goto err_mnoc_axi_clk;
+
+	return 0;
+err_mnoc_axi_clk:
+	clk_disable_unprepare(qproc->snoc_axi_clk);
+err_snoc_axi_clk:
+	clk_disable_unprepare(qproc->gpll0_mss_clk);
+err_gpll0_mss_clk:
+	clk_disable_unprepare(qproc->rom_clk);
+err_rom_clk:
+	clk_disable_unprepare(qproc->axi_clk);
+err_axi_clk:
+	clk_disable_unprepare(qproc->ahb_clk);
+out:
+	dev_err(qproc->dev, "Clk Vote Failed\n");
+	return ret;
+}
+
+static void q6v55_clk_disable(struct q6v5 *qproc)
+{
+
+	clk_disable_unprepare(qproc->mnoc_axi_clk);
+	clk_disable_unprepare(qproc->snoc_axi_clk);
+	clk_disable_unprepare(qproc->gpll0_mss_clk);
+	clk_disable_unprepare(qproc->rom_clk);
+	clk_disable_unprepare(qproc->axi_clk);
+	if (!qproc->ahb_clk_vote)
+		clk_disable_unprepare(qproc->ahb_clk);
+}
+
+static int q6v55_proxy_vote(struct q6v5 *qproc)
+{
+	struct regulator *mx = qproc->supply[Q6V5_SUPPLY_MX].consumer;
+	struct regulator *cx = qproc->supply[Q6V5_SUPPLY_CX].consumer;
+	struct regulator *vdd_pll = qproc->supply[Q6V5_SUPPLY_PLL].consumer;
+	int ret;
+
+	ret = regulator_set_voltage(mx, INT_MAX, INT_MAX);
+	if (ret) {
+		dev_err(qproc->dev, "Failed to set voltage for vreg_mx\n");
+		return ret;
+	}
+
+	ret = regulator_enable(mx);
+	if (ret) {
+		dev_err(qproc->dev, "Failed to enable vreg_mx\n");
+		goto err_mx_enable;
+	}
+
+	ret = regulator_set_voltage(cx, INT_MAX, INT_MAX);
+	if (ret) {
+		dev_err(qproc->dev, "Failed to request vdd_cx voltage.\n");
+		goto err_cx_voltage;
+	}
+
+	ret = regulator_set_load(cx, 100000);
+	if (ret < 0) {
+		dev_err(qproc->dev, "Failed to set vdd_cx mode.\n");
+		goto err_cx_set_load;
+	}
+
+	ret = regulator_enable(cx);
+	if (ret) {
+		dev_err(qproc->dev, "Failed to vote for vdd_cx\n");
+		goto err_cx_enable;
+	}
+
+	ret = regulator_set_voltage(vdd_pll, 1800000, 1800000);
+	if (ret) {
+		dev_err(qproc->dev, "Failed to set voltage for  vdd_pll\n");
+		goto err_vreg_pll_set_vol;
+	}
+
+	ret = regulator_set_load(vdd_pll, 10000);
+	if (ret < 0) {
+		dev_err(qproc->dev, "Failed to set vdd_pll mode.\n");
+		goto err_vreg_pll_load;
+	}
+
+	ret = regulator_enable(vdd_pll);
+	if (ret) {
+		dev_err(qproc->dev, "Failed to vote for vdd_pll\n");
+		goto err_vreg_pll_enable;
+	}
+
+	ret = clk_prepare_enable(qproc->xo);
+	if (ret)
+		goto err_xo_vote;
+
+	ret = clk_prepare_enable(qproc->pnoc_clk);
+	if (ret)
+		goto err_pnoc_vote;
+
+	ret = clk_prepare_enable(qproc->qdss_clk);
+	if (ret)
+		goto err_qdss_vote;
+	qproc->unvote_flag = false;
+	return 0;
+
+err_qdss_vote:
+	clk_disable_unprepare(qproc->pnoc_clk);
+err_pnoc_vote:
+	clk_disable_unprepare(qproc->xo);
+err_xo_vote:
+	regulator_disable(vdd_pll);
+err_vreg_pll_enable:
+	regulator_set_load(vdd_pll, 0);
+err_vreg_pll_load:
+	regulator_set_voltage(vdd_pll, 0, INT_MAX);
+err_vreg_pll_set_vol:
+	regulator_disable(cx);
+err_cx_enable:
+	regulator_set_load(cx, 0);
+err_cx_set_load:
+	regulator_set_voltage(cx, 0, INT_MAX);
+err_cx_voltage:
+	regulator_disable(mx);
+err_mx_enable:
+	regulator_set_voltage(mx, 0, INT_MAX);
+
+	return ret;
+}
+
+static void q6v55_proxy_unvote(struct q6v5 *qproc)
+{
+	if (!qproc->unvote_flag) {
+		regulator_disable(qproc->supply[Q6V5_SUPPLY_PLL].consumer);
+		regulator_set_load(qproc->supply[Q6V5_SUPPLY_PLL].consumer, 0);
+		regulator_disable(qproc->supply[Q6V5_SUPPLY_CX].consumer);
+		regulator_set_load(qproc->supply[Q6V5_SUPPLY_CX].consumer, 0);
+		regulator_set_voltage(qproc->supply[Q6V5_SUPPLY_CX].consumer,
+			0, INT_MAX);
+
+		clk_disable_unprepare(qproc->qdss_clk);
+		clk_disable_unprepare(qproc->pnoc_clk);
+		clk_disable_unprepare(qproc->xo);
+
+		regulator_disable(qproc->supply[Q6V5_SUPPLY_MX].consumer);
+		regulator_set_voltage(qproc->supply[Q6V5_SUPPLY_MX].consumer,
+			0, INT_MAX);
+	}
+	qproc->unvote_flag = true;
+}
+
+static void pil_mss_restart_reg(struct q6v5 *qproc, u32 mss_restart)
+{
+	if (qproc->restart_reg) {
+		writel_relaxed(mss_restart, qproc->restart_reg);
+		udelay(2);
+	}
+}
+
 static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct q6v5 *qproc = rproc->priv;
@@ -751,6 +948,65 @@ static int q6v5_init_clocks(struct q6v5 *qproc)
 	return 0;
 }
 
+static int q6v55_init_clocks(struct q6v5 *qproc)
+{
+	qproc->ahb_clk = devm_clk_get(qproc->dev, "iface");
+	if (IS_ERR(qproc->ahb_clk)) {
+		dev_err(qproc->dev, "failed to get iface clock\n");
+		return PTR_ERR(qproc->ahb_clk);
+	}
+
+	qproc->axi_clk = devm_clk_get(qproc->dev, "bus");
+	if (IS_ERR(qproc->axi_clk)) {
+		dev_err(qproc->dev, "failed to get bus clock\n");
+		return PTR_ERR(qproc->axi_clk);
+	}
+
+	qproc->rom_clk = devm_clk_get(qproc->dev, "mem");
+	if (IS_ERR(qproc->rom_clk)) {
+		dev_err(qproc->dev, "failed to get mem clock\n");
+		return PTR_ERR(qproc->rom_clk);
+	}
+
+	qproc->snoc_axi_clk = devm_clk_get(qproc->dev, "snoc_axi_clk");
+	if (IS_ERR(qproc->snoc_axi_clk)) {
+		dev_err(qproc->dev, "failed to get snoc_axi_clk\n");
+		return PTR_ERR(qproc->snoc_axi_clk);
+	}
+
+	qproc->mnoc_axi_clk = devm_clk_get(qproc->dev, "mnoc_axi_clk");
+	if (IS_ERR(qproc->mnoc_axi_clk)) {
+		dev_err(qproc->dev, "failed to get mnoc_axi_clk clock\n");
+		return PTR_ERR(qproc->mnoc_axi_clk);
+	}
+
+	qproc->gpll0_mss_clk = devm_clk_get(qproc->dev, "gpll0_mss_clk");
+	if (IS_ERR(qproc->gpll0_mss_clk)) {
+		dev_err(qproc->dev, "failed to get gpll0_mss_clk clock\n");
+		return PTR_ERR(qproc->gpll0_mss_clk);
+	}
+
+	qproc->xo = devm_clk_get(qproc->dev, "xo");
+	if (IS_ERR(qproc->xo)) {
+		dev_err(qproc->dev, "failed to get xo\n");
+		return PTR_ERR(qproc->xo);
+	}
+
+	qproc->pnoc_clk = devm_clk_get(qproc->dev, "pnoc");
+	if (IS_ERR(qproc->pnoc_clk)) {
+		dev_err(qproc->dev, "failed to get pnoc_clk clock\n");
+		return PTR_ERR(qproc->pnoc_clk);
+	}
+
+	qproc->qdss_clk = devm_clk_get(qproc->dev, "qdss");
+	if (IS_ERR(qproc->qdss_clk)) {
+		dev_err(qproc->dev, "failed to get qdss_clk clock\n");
+		return PTR_ERR(qproc->qdss_clk);
+	}
+
+	return 0;
+}
+
 static int q6v5_init_reset(struct q6v5 *qproc)
 {
 	qproc->mss_restart = devm_reset_control_get(qproc->dev, NULL);
@@ -762,6 +1018,21 @@ static int q6v5_init_reset(struct q6v5 *qproc)
 	return 0;
 }
 
+static int q6v55_init_reset(struct q6v5 *qproc, struct platform_device *pdev)
+{
+	struct resource *res;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "restart_reg");
+	qproc->restart_reg = devm_ioremap(qproc->dev, res->start,
+							resource_size(res));
+	if (IS_ERR(qproc->restart_reg)) {
+		dev_err(qproc->dev, "failed to get restart_reg\n");
+		return PTR_ERR(qproc->restart_reg);
+	}
+
+	return 0;
+}
+
 static int q6v5_request_irq(struct q6v5 *qproc,
 			     struct platform_device *pdev,
 			     const char *name,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
