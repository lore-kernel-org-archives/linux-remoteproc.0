Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 2/8] remoteproc: qcom: qdsp6-adsp: Add support for QCS404 CDSP
Date: Thu,  9 May 2019 21:34:15 -0700
Message-Id: <20190510043421.31393-3-bjorn.andersson@linaro.org>
In-Reply-To: <20190510043421.31393-1-bjorn.andersson@linaro.org>
References: <20190510043421.31393-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Move the clock list to adsp_pil_data, make the pdc_reset optional and
make the driver directly enable the xo, sleep and core clocks.

The three clocks are previously toggled through the clock controller,
but that means the same hardware block needs to be mapped in both
drivers. Making the remoteproc driver enable the clocks is a nop when
using the clock controller, but allow us to remove the clocks from the
clock controller.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 73 ++++++++++++++++++++++-------
 1 file changed, 55 insertions(+), 18 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 1f3ef9ee493c..e953886b2eb7 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -46,11 +46,9 @@
 #define LPASS_PWR_ON_REG		0x10
 #define LPASS_HALTREQ_REG		0x0
 
-/* list of clocks required by ADSP PIL */
-static const char * const adsp_clk_id[] = {
-	"sway_cbcr", "lpass_ahbs_aon_cbcr", "lpass_ahbm_aon_cbcr",
-	"qdsp6ss_xo", "qdsp6ss_sleep", "qdsp6ss_core",
-};
+#define QDSP6SS_XO_CBCR		0x38
+#define QDSP6SS_CORE_CBCR	0x20
+#define QDSP6SS_SLEEP_CBCR	0x3c
 
 struct adsp_pil_data {
 	int crash_reason_smem;
@@ -59,6 +57,9 @@ struct adsp_pil_data {
 	const char *ssr_name;
 	const char *sysmon_name;
 	int ssctl_id;
+
+	const char **clk_ids;
+	int num_clks;
 };
 
 struct qcom_adsp {
@@ -75,7 +76,7 @@ struct qcom_adsp {
 	void __iomem *qdsp6ss_base;
 
 	struct reset_control *pdc_sync_reset;
-	struct reset_control *cc_lpass_restart;
+	struct reset_control *restart;
 
 	struct regmap *halt_map;
 	unsigned int halt_lpass;
@@ -143,7 +144,7 @@ static int qcom_adsp_shutdown(struct qcom_adsp *adsp)
 	/* Assert the LPASS PDC Reset */
 	reset_control_assert(adsp->pdc_sync_reset);
 	/* Place the LPASS processor into reset */
-	reset_control_assert(adsp->cc_lpass_restart);
+	reset_control_assert(adsp->restart);
 	/* wait after asserting subsystem restart from AOSS */
 	usleep_range(200, 300);
 
@@ -153,7 +154,7 @@ static int qcom_adsp_shutdown(struct qcom_adsp *adsp)
 	/* De-assert the LPASS PDC Reset */
 	reset_control_deassert(adsp->pdc_sync_reset);
 	/* Remove the LPASS reset */
-	reset_control_deassert(adsp->cc_lpass_restart);
+	reset_control_deassert(adsp->restart);
 	/* wait after de-asserting subsystem restart from AOSS */
 	usleep_range(200, 300);
 
@@ -192,6 +193,15 @@ static int adsp_start(struct rproc *rproc)
 		goto disable_power_domain;
 	}
 
+	/* Enable the XO clock */
+	writel(1, adsp->qdsp6ss_base + QDSP6SS_XO_CBCR);
+
+	/* Enable the QDSP6SS sleep clock */
+	writel(1, adsp->qdsp6ss_base + QDSP6SS_SLEEP_CBCR);
+
+	/* Enable the QDSP6 core clock */
+	writel(1, adsp->qdsp6ss_base + QDSP6SS_CORE_CBCR);
+
 	/* Program boot address */
 	writel(adsp->mem_phys >> 4, adsp->qdsp6ss_base + RST_EVB_REG);
 
@@ -280,8 +290,9 @@ static const struct rproc_ops adsp_ops = {
 	.load = adsp_load,
 };
 
-static int adsp_init_clock(struct qcom_adsp *adsp)
+static int adsp_init_clock(struct qcom_adsp *adsp, const char **clk_ids)
 {
+	int num_clks = 0;
 	int i, ret;
 
 	adsp->xo = devm_clk_get(adsp->dev, "xo");
@@ -292,32 +303,39 @@ static int adsp_init_clock(struct qcom_adsp *adsp)
 		return ret;
 	}
 
-	adsp->num_clks = ARRAY_SIZE(adsp_clk_id);
+	for (i = 0; clk_ids[i]; i++)
+		num_clks++;
+
+	adsp->num_clks = num_clks;
 	adsp->clks = devm_kcalloc(adsp->dev, adsp->num_clks,
 				sizeof(*adsp->clks), GFP_KERNEL);
 	if (!adsp->clks)
 		return -ENOMEM;
 
 	for (i = 0; i < adsp->num_clks; i++)
-		adsp->clks[i].id = adsp_clk_id[i];
+		adsp->clks[i].id = clk_ids[i];
 
 	return devm_clk_bulk_get(adsp->dev, adsp->num_clks, adsp->clks);
 }
 
 static int adsp_init_reset(struct qcom_adsp *adsp)
 {
-	adsp->pdc_sync_reset = devm_reset_control_get_exclusive(adsp->dev,
+	adsp->pdc_sync_reset = devm_reset_control_get_optional_exclusive(adsp->dev,
 			"pdc_sync");
 	if (IS_ERR(adsp->pdc_sync_reset)) {
 		dev_err(adsp->dev, "failed to acquire pdc_sync reset\n");
 		return PTR_ERR(adsp->pdc_sync_reset);
 	}
 
-	adsp->cc_lpass_restart = devm_reset_control_get_exclusive(adsp->dev,
-			"cc_lpass");
-	if (IS_ERR(adsp->cc_lpass_restart)) {
-		dev_err(adsp->dev, "failed to acquire cc_lpass restart\n");
-		return PTR_ERR(adsp->cc_lpass_restart);
+	adsp->restart = devm_reset_control_get_optional_exclusive(adsp->dev, "restart");
+
+	/* Fall back to the  old "cc_lpass" if "restart" is absent */
+	if (!adsp->restart)
+		adsp->restart = devm_reset_control_get_exclusive(adsp->dev, "cc_lpass");
+
+	if (IS_ERR(adsp->restart)) {
+		dev_err(adsp->dev, "failed to acquire restart\n");
+		return PTR_ERR(adsp->restart);
 	}
 
 	return 0;
@@ -415,7 +433,7 @@ static int adsp_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	ret = adsp_init_clock(adsp);
+	ret = adsp_init_clock(adsp, desc->clk_ids);
 	if (ret)
 		goto free_rproc;
 
@@ -479,9 +497,28 @@ static const struct adsp_pil_data adsp_resource_init = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.clk_ids = (const char*[]) {
+		"sway_cbcr", "lpass_ahbs_aon_cbcr", "lpass_ahbm_aon_cbcr",
+		"qdsp6ss_xo", "qdsp6ss_sleep", "qdsp6ss_core", NULL
+	},
+	.num_clks = 7,
+};
+
+static const struct adsp_pil_data cdsp_resource_init = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.clk_ids = (const char*[]) {
+		"sway", "tbu", "bimc", "ahb_aon", "q6ss_slave", "q6ss_master",
+		"q6_axim", NULL
+	},
+	.num_clks = 7,
 };
 
 static const struct of_device_id adsp_of_match[] = {
+	{ .compatible = "qcom,qcs404-cdsp-pil", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,sdm845-adsp-pil", .data = &adsp_resource_init },
 	{ },
 };
-- 
2.18.0
