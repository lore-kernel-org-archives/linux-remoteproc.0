Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH] remoteproc: q6v5: Add support to vote for rpmh power domains
Date: Fri, 29 Jun 2018 15:50:35 +0530
Message-Id: <20180629102035.2757-1-rnayak@codeaurora.org>
To: bjorn.andersson@linaro.org, sibis@codeaurora.org, ulf.hansson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

With rpmh ARC resources being modelled as power domains with
performance state, add support to proxy vote on these for SDM845.
Add support to vote on multiple of them, now that genpd supports
associating multiple power domains to a device.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
This patch is dependent on the rpmh powerdomain driver
still under review,
https://lkml.org/lkml/2018/6/27/7

 drivers/remoteproc/qcom_q6v5_pil.c | 77 +++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 2bf8e7c49f2a..2b5be6d15779 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -25,6 +25,8 @@
 #include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
@@ -132,6 +134,7 @@ struct rproc_hexagon_res {
 	char **proxy_clk_names;
 	char **reset_clk_names;
 	char **active_clk_names;
+	char **pd_names;
 	int version;
 	bool need_mem_protection;
 	bool has_alt_reset;
@@ -161,9 +164,11 @@ struct q6v5 {
 	struct clk *active_clks[8];
 	struct clk *reset_clks[4];
 	struct clk *proxy_clks[4];
+	struct device *pd_devs[3];
 	int active_clk_count;
 	int reset_clk_count;
 	int proxy_clk_count;
+	int pd_count;
 
 	struct reg_info active_regs[1];
 	struct reg_info proxy_regs[3];
@@ -324,6 +329,23 @@ static void q6v5_clk_disable(struct device *dev,
 		clk_disable_unprepare(clks[i]);
 }
 
+static int q6v5_powerdomain_enable(struct device *dev, struct device **devs,
+				   int count)
+{
+	int i;
+
+	if (!count)
+		return 0;
+
+	if (count > 1)
+		for (i = 0; i < count; i++)
+			dev_pm_genpd_set_performance_state(devs[i], INT_MAX);
+	else
+		dev_pm_genpd_set_performance_state(dev, INT_MAX);
+
+	return pm_runtime_get_sync(dev);
+}
+
 static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int *current_perm,
 				   bool remote_owner, phys_addr_t addr,
 				   size_t size)
@@ -802,11 +824,18 @@ static int q6v5_start(struct rproc *rproc)
 
 	enable_irq(qproc->handover_irq);
 
+	ret = q6v5_powerdomain_enable(qproc->dev, qproc->pd_devs,
+				      qproc->pd_count);
+	if (ret) {
+		dev_err(qproc->dev, "failed to enable power domains\n");
+		goto disable_irqs;
+	}
+
 	ret = q6v5_regulator_enable(qproc, qproc->proxy_regs,
 				    qproc->proxy_reg_count);
 	if (ret) {
 		dev_err(qproc->dev, "failed to enable proxy supplies\n");
-		goto disable_irqs;
+		goto disable_powerdomains;
 	}
 
 	ret = q6v5_clk_enable(qproc->dev, qproc->proxy_clks,
@@ -931,7 +960,8 @@ static int q6v5_start(struct rproc *rproc)
 disable_proxy_reg:
 	q6v5_regulator_disable(qproc, qproc->proxy_regs,
 			       qproc->proxy_reg_count);
-
+disable_powerdomains:
+	pm_runtime_put(qproc->dev);
 disable_irqs:
 	disable_irq(qproc->handover_irq);
 
@@ -991,6 +1021,7 @@ static int q6v5_stop(struct rproc *rproc)
 			 qproc->active_clk_count);
 	q6v5_regulator_disable(qproc, qproc->active_regs,
 			       qproc->active_reg_count);
+	pm_runtime_put(qproc->dev);
 
 	return 0;
 }
@@ -1142,6 +1173,35 @@ static int q6v5_init_clocks(struct device *dev, struct clk **clks,
 	return i;
 }
 
+static int q6v5_powerdomain_init(struct device *dev, struct device **devs,
+				 char **pd_names)
+{
+	int i = 0, num_pds;
+
+	if (!pd_names)
+		return 0;
+
+	while (pd_names[i])
+		i++;
+
+	num_pds = i;
+
+	if (num_pds > 1) {
+		for (i = 0; i < num_pds; i++) {
+			devs[i] = genpd_dev_pm_attach_by_id(dev, i);
+			if (IS_ERR(devs[i]))
+				return PTR_ERR(devs[i]);
+			if (!device_link_add(dev, devs[i], DL_FLAG_STATELESS |
+					     DL_FLAG_PM_RUNTIME))
+				return -EINVAL;
+		}
+	}
+
+	pm_runtime_enable(dev);
+
+	return num_pds;
+};
+
 static int q6v5_init_reset(struct q6v5 *qproc)
 {
 	qproc->mss_restart = devm_reset_control_get_exclusive(qproc->dev,
@@ -1298,6 +1358,13 @@ static int q6v5_probe(struct platform_device *pdev)
 	}
 	qproc->active_reg_count = ret;
 
+	ret = q6v5_powerdomain_init(&pdev->dev, qproc->pd_devs, desc->pd_names);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to init power domains\n");
+		goto free_rproc;
+	}
+	qproc->pd_count = ret;
+
 	ret = q6v5_init_reset(qproc);
 	if (ret)
 		goto free_rproc;
@@ -1386,6 +1453,12 @@ static const struct rproc_hexagon_res sdm845_mss = {
 			"mnoc_axi",
 			NULL
 	},
+	.pd_names = (char*[]){
+			"cx",
+			"mx",
+			"mss",
+			NULL
+	},
 	.need_mem_protection = true,
 	.has_alt_reset = true,
 	.version = MSS_SDM845,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
