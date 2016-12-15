Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v5 5/7] remoteproc: qcom: Modify clock enable and disable interface.
Date: Thu, 15 Dec 2016 17:51:28 +0530
Message-Id: <1481804490-8583-6-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1481804490-8583-1-git-send-email-akdwived@codeaurora.org>
References: <1481804490-8583-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Clock enable/disable routine will get additional input parameter of
pointer of array of clock struct's and clock count, it will use these
pre initialized values to turn them up/down.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 85 ++++++++++++++++++++++++++------------
 1 file changed, 58 insertions(+), 27 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index e19fb9d..1018b8f 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -140,11 +140,6 @@ struct q6v5 {
 	int active_reg_count;
 	int proxy_reg_count;
 
-
-	struct clk *ahb_clk;
-	struct clk *axi_clk;
-	struct clk *rom_clk;
-
 	struct completion start_done;
 	struct completion stop_done;
 	bool running;
@@ -252,6 +247,38 @@ static void q6v5_regulator_disable(struct q6v5 *qproc,
 	}
 }
 
+
+static int q6v5_clk_enable(struct device *dev,
+			struct clk **clks, int count)
+{
+	int rc;
+	int i;
+
+	for (i = 0; i < count; i++) {
+		rc = clk_prepare_enable(clks[i]);
+		if (rc) {
+			dev_err(dev, "Clock enable failed\n");
+			goto err;
+		}
+	}
+
+	return 0;
+err:
+	for (i--; i >= 0; i--)
+		clk_disable_unprepare(clks[i]);
+
+	return rc;
+}
+
+static void q6v5_clk_disable(struct device *dev,
+			struct clk **clks, int count)
+{
+	int i;
+
+	for (i = 0; i < count; i++)
+		clk_disable_unprepare(clks[i]);
+}
+
 static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct q6v5 *qproc = rproc->priv;
@@ -548,11 +575,18 @@ static int q6v5_start(struct rproc *rproc)
 		return ret;
 	}
 
+	ret = q6v5_clk_enable(qproc->dev, qproc->proxy_clks,
+					qproc->proxy_clk_count);
+	if (ret) {
+		dev_err(qproc->dev, "failed to enable proxy clocks\n");
+		goto disable_proxy_reg;
+	}
+
 	ret = q6v5_regulator_enable(qproc, qproc->active_regs,
 					qproc->active_reg_count);
 	if (ret) {
 		dev_err(qproc->dev, "failed to enable supplies\n");
-		goto disable_proxy_reg;
+		goto disable_proxy_clk;
 	}
 	ret = reset_control_deassert(qproc->mss_restart);
 	if (ret) {
@@ -560,17 +594,12 @@ static int q6v5_start(struct rproc *rproc)
 		goto disable_vdd;
 	}
 
-	ret = clk_prepare_enable(qproc->ahb_clk);
-	if (ret)
+	ret = q6v5_clk_enable(qproc->dev, qproc->active_clks,
+					qproc->active_clk_count);
+	if (ret) {
+		dev_err(qproc->dev, "failed to enable clocks\n");
 		goto assert_reset;
-
-	ret = clk_prepare_enable(qproc->axi_clk);
-	if (ret)
-		goto disable_ahb_clk;
-
-	ret = clk_prepare_enable(qproc->rom_clk);
-	if (ret)
-		goto disable_axi_clk;
+	}
 
 	writel(qproc->mba_phys, qproc->rmb_base + RMB_MBA_IMAGE_REG);
 
@@ -605,25 +634,26 @@ static int q6v5_start(struct rproc *rproc)
 
 	qproc->running = true;
 
-	/* TODO: All done, release the handover resources */
-
+	q6v5_clk_disable(qproc->dev, qproc->proxy_clks,
+				qproc->proxy_clk_count);
+	q6v5_regulator_disable(qproc, qproc->proxy_regs,
+				qproc->proxy_reg_count);
 	return 0;
 
 halt_axi_ports:
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
-
-	clk_disable_unprepare(qproc->rom_clk);
-disable_axi_clk:
-	clk_disable_unprepare(qproc->axi_clk);
-disable_ahb_clk:
-	clk_disable_unprepare(qproc->ahb_clk);
+	q6v5_clk_disable(qproc->dev, qproc->active_clks,
+				qproc->active_clk_count);
 assert_reset:
 	reset_control_assert(qproc->mss_restart);
 disable_vdd:
 	q6v5_regulator_disable(qproc, qproc->active_regs,
 				qproc->active_reg_count);
+disable_proxy_clk:
+	q6v5_clk_disable(qproc->dev, qproc->proxy_clks,
+				qproc->proxy_clk_count);
 disable_proxy_reg:
 	q6v5_regulator_disable(qproc, qproc->proxy_regs,
 				qproc->proxy_reg_count);
@@ -652,9 +682,10 @@ static int q6v5_stop(struct rproc *rproc)
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
 
 	reset_control_assert(qproc->mss_restart);
-	clk_disable_unprepare(qproc->rom_clk);
-	clk_disable_unprepare(qproc->axi_clk);
-	clk_disable_unprepare(qproc->ahb_clk);
+	q6v5_clk_disable(qproc->dev, qproc->active_clks,
+				qproc->active_clk_count);
+	q6v5_clk_disable(qproc->dev, qproc->proxy_clks,
+				qproc->proxy_clk_count);
 	q6v5_regulator_disable(qproc, qproc->active_regs,
 				qproc->active_reg_count);
 	q6v5_regulator_disable(qproc, qproc->proxy_regs,
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
