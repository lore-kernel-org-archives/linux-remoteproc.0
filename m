Return-Path: <sricharan@codeaurora.org>
From: Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH v5 5/6] remoteproc: qcom: Add support for q6v5-wcss pil
Date: Tue, 14 Nov 2017 16:23:13 +0530
Message-Id: <1510656794-3815-6-git-send-email-sricharan@codeaurora.org>
In-Reply-To: <1510656794-3815-1-git-send-email-sricharan@codeaurora.org>
References: <1510656794-3815-1-git-send-email-sricharan@codeaurora.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
Cc: sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

IPQ8074 has an integrated Hexagon dsp core q6v5 and a wireless lan
(Lithium) IP. An mdt type single image format is used for the
firmware. So the mdt_load function can be directly used to load
the firmware. Also add the relevant resets required for this core.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |  7 ++-
 drivers/remoteproc/Kconfig                         |  1 +
 drivers/remoteproc/qcom_q6v5_pil.c                 | 53 +++++++++++++++++++++-
 3 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 00d3d58..d52d05e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -11,6 +11,7 @@ on the Qualcomm Hexagon core.
 		    "qcom,msm8916-mss-pil",
 		    "qcom,msm8974-mss-pil"
 		    "qcom,msm8996-mss-pil"
+		    "qcom,ipq8074-wcss-pil"
 
 - reg:
 	Usage: required
@@ -49,11 +50,15 @@ on the Qualcomm Hexagon core.
 	Usage: required
 	Value type: <phandle>
 	Definition: reference to the reset-controller for the modem sub-system
+		    reference to the list of 3 reset-controllers for the
+		    wcss sub-system
 
 - reset-names:
 	Usage: required
 	Value type: <stringlist>
-	Definition: must be "mss_restart"
+	Definition: must be "mss_restart" for the modem sub-system
+	Definition: must be "wcss_aon_reset", "wcss_reset", "wcss_q6_reset"
+		    for the wcss syb-system
 
 - cx-supply:
 - mss-supply:
diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index bf04479..e7e9979 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -113,6 +113,7 @@ config QCOM_Q6V5_PIL
 	select MFD_SYSCON
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
+	select QCOM_MDT_LOADER
 	help
 	  Say y here to support the Qualcomm Peripherial Image Loader for the
 	  Hexagon V5 based remote processors.
diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 75ff02d..3c401ff 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -129,6 +129,9 @@ struct q6v5 {
 	u32 halt_nc;
 
 	struct reset_control *mss_restart;
+	struct reset_control *wcss_aon_reset;
+	struct reset_control *wcss_reset;
+	struct reset_control *wcss_q6_reset;
 
 	struct qcom_smem_state *state;
 	unsigned stop_bit;
@@ -181,6 +184,7 @@ enum {
 	MSS_MSM8916,
 	MSS_MSM8974,
 	MSS_MSM8996,
+	WCSS_IPQ8074,
 };
 
 static int q6v5_regulator_init(struct device *dev, struct reg_info *regs,
@@ -354,6 +358,21 @@ static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 }
 
+static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
+{
+	struct q6v5 *qproc = rproc->priv;
+
+	return qcom_mdt_load_no_init(qproc->dev, fw, rproc->firmware,
+				     0, qproc->mba_region, qproc->mba_phys,
+				     qproc->mba_size);
+}
+
+static const struct rproc_fw_ops q6v5_wcss_fw_ops = {
+	.find_rsc_table = q6v5_find_rsc_table,
+	.load = q6v5_wcss_load,
+	.get_boot_addr = rproc_elf_get_boot_addr,
+};
+
 static const struct rproc_fw_ops q6v5_fw_ops = {
 	.find_rsc_table = q6v5_find_rsc_table,
 	.load = q6v5_load,
@@ -1057,6 +1076,26 @@ static int q6v5_init_clocks(struct device *dev, struct clk **clks,
 	return i;
 }
 
+static int q6v5_wcss_init_reset(struct q6v5 *qproc)
+{
+	qproc->wcss_aon_reset = devm_reset_control_get(qproc->dev,
+						       "wcss_aon_reset");
+	if (IS_ERR(qproc->wcss_aon_reset))
+		return PTR_ERR(qproc->wcss_aon_reset);
+
+	qproc->wcss_reset = devm_reset_control_get(qproc->dev,
+						   "wcss_reset");
+	if (IS_ERR(qproc->wcss_reset))
+		return PTR_ERR(qproc->wcss_reset);
+
+	qproc->wcss_q6_reset = devm_reset_control_get(qproc->dev,
+						      "wcss_q6_reset");
+	if (IS_ERR(qproc->wcss_q6_reset))
+		return PTR_ERR(qproc->wcss_q6_reset);
+
+	return 0;
+}
+
 static int q6v5_init_reset(struct q6v5 *qproc)
 {
 	qproc->mss_restart = devm_reset_control_get_exclusive(qproc->dev,
@@ -1116,6 +1155,9 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 		return -EBUSY;
 	}
 
+	if (qproc->version == WCSS_IPQ8074)
+		return 0;
+
 	child = of_get_child_by_name(qproc->dev->of_node, "mpss");
 	node = of_parse_phandle(child, "memory-region", 0);
 	ret = of_address_to_resource(node, 0, &r);
@@ -1159,6 +1201,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	qproc = (struct q6v5 *)rproc->priv;
 	qproc->dev = &pdev->dev;
 	qproc->rproc = rproc;
+	qproc->version = desc->version;
 	platform_set_drvdata(pdev, qproc);
 
 	init_completion(&qproc->start_done);
@@ -1208,7 +1251,6 @@ static int q6v5_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	qproc->version = desc->version;
 	qproc->need_mem_protection = desc->need_mem_protection;
 	ret = q6v5_request_irq(qproc, pdev, "wdog", q6v5_wdog_interrupt);
 	if (ret < 0)
@@ -1358,11 +1400,20 @@ static int q6v5_remove(struct platform_device *pdev)
 	.ops = &q6v5_ops,
 };
 
+static const struct rproc_hexagon_res ipq8074_wcss = {
+	.hexagon_mba_image = "IPQ8074/q6_fw.mdt",
+	.need_mem_protection = false,
+	.version = WCSS_IPQ8074,
+	.init_reset = q6v5_wcss_init_reset,
+	.fw_ops = &q6v5_wcss_fw_ops,
+};
+
 static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
 	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
 	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},
 	{ .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss},
+	{ .compatible = "qcom,ipq8074-wcss-pil", .data = &ipq8074_wcss},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, q6v5_of_match);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
