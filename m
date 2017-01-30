Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v3 1/4] remoteproc: qcom: Compatible string based resource initialization.
Date: Mon, 30 Jan 2017 20:33:06 +0530
Message-Id: <1485788589-21968-2-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1485788589-21968-1-git-send-email-akdwived@codeaurora.org>
References: <1485788589-21968-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch initialize certain driver related data based on compatible
string. This enable driver to handle more than one similar device in
by differentiating in probe their private data.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 drivers/remoteproc/qcom_adsp_pil.c | 47 ++++++++++++++++++++++++++------------
 1 file changed, 33 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
index 43a4ed2..f674301 100644
--- a/drivers/remoteproc/qcom_adsp_pil.c
+++ b/drivers/remoteproc/qcom_adsp_pil.c
@@ -32,9 +32,12 @@
 #include "qcom_mdt_loader.h"
 #include "remoteproc_internal.h"
 
-#define ADSP_CRASH_REASON_SMEM		423
-#define ADSP_FIRMWARE_NAME		"adsp.mdt"
-#define ADSP_PAS_ID			1
+struct adsp_data {
+	int crash_reason_smem;
+	const char *firmware_name;
+	int pas_id;
+};
+
 
 struct qcom_adsp {
 	struct device *dev;
@@ -53,6 +56,9 @@ struct qcom_adsp {
 
 	struct regulator *cx_supply;
 
+	int pas_id;
+	int crash_reason_smem;
+
 	struct completion start_done;
 	struct completion stop_done;
 
@@ -70,7 +76,7 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 	bool relocate;
 	int ret;
 
-	ret = qcom_scm_pas_init_image(ADSP_PAS_ID, fw->data, fw->size);
+	ret = qcom_scm_pas_init_image(adsp->pas_id, fw->data, fw->size);
 	if (ret) {
 		dev_err(&rproc->dev, "invalid firmware metadata\n");
 		return ret;
@@ -85,7 +91,8 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 	if (relocate) {
 		adsp->mem_reloc = fw_addr;
 
-		ret = qcom_scm_pas_mem_setup(ADSP_PAS_ID, adsp->mem_phys, fw_size);
+		ret = qcom_scm_pas_mem_setup(adsp->pas_id,
+					adsp->mem_phys, fw_size);
 		if (ret) {
 			dev_err(&rproc->dev, "unable to setup memory for image\n");
 			return ret;
@@ -113,7 +120,7 @@ static int adsp_start(struct rproc *rproc)
 	if (ret)
 		goto disable_clocks;
 
-	ret = qcom_scm_pas_auth_and_reset(ADSP_PAS_ID);
+	ret = qcom_scm_pas_auth_and_reset(adsp->pas_id);
 	if (ret) {
 		dev_err(adsp->dev,
 			"failed to authenticate image and release reset\n");
@@ -124,7 +131,7 @@ static int adsp_start(struct rproc *rproc)
 					  msecs_to_jiffies(5000));
 	if (!ret) {
 		dev_err(adsp->dev, "start timed out\n");
-		qcom_scm_pas_shutdown(ADSP_PAS_ID);
+		qcom_scm_pas_shutdown(adsp->pas_id);
 		ret = -ETIMEDOUT;
 		goto disable_regulators;
 	}
@@ -157,7 +164,7 @@ static int adsp_stop(struct rproc *rproc)
 				    BIT(adsp->stop_bit),
 				    0);
 
-	ret = qcom_scm_pas_shutdown(ADSP_PAS_ID);
+	ret = qcom_scm_pas_shutdown(adsp->pas_id);
 	if (ret)
 		dev_err(adsp->dev, "failed to shutdown: %d\n", ret);
 
@@ -197,7 +204,7 @@ static irqreturn_t adsp_fatal_interrupt(int irq, void *dev)
 	size_t len;
 	char *msg;
 
-	msg = qcom_smem_get(QCOM_SMEM_HOST_ANY, ADSP_CRASH_REASON_SMEM, &len);
+	msg = qcom_smem_get(QCOM_SMEM_HOST_ANY, adsp->crash_reason_smem, &len);
 	if (!IS_ERR(msg) && len > 0 && msg[0])
 		dev_err(adsp->dev, "fatal error received: %s\n", msg);
 
@@ -311,20 +318,25 @@ static int adsp_alloc_memory_region(struct qcom_adsp *adsp)
 
 static int adsp_probe(struct platform_device *pdev)
 {
+	const struct adsp_data *desc;
 	struct qcom_adsp *adsp;
 	struct rproc *rproc;
 	int ret;
 
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
+
 	if (!qcom_scm_is_available())
 		return -EPROBE_DEFER;
 
-	if (!qcom_scm_pas_supported(ADSP_PAS_ID)) {
-		dev_err(&pdev->dev, "PAS is not available for ADSP\n");
+	if (!qcom_scm_pas_supported(desc->pas_id)) {
+		dev_err(&pdev->dev, "PAS is not available for subsystem\n");
 		return -ENXIO;
 	}
 
 	rproc = rproc_alloc(&pdev->dev, pdev->name, &adsp_ops,
-			    ADSP_FIRMWARE_NAME, sizeof(*adsp));
+			    desc->firmware_name, sizeof(*adsp));
 	if (!rproc) {
 		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
 		return -ENOMEM;
@@ -344,6 +356,8 @@ static int adsp_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
+	adsp->pas_id = desc->pas_id;
+	adsp->crash_reason_smem = desc->crash_reason_smem;
 	ret = adsp_init_clock(adsp);
 	if (ret)
 		goto free_rproc;
@@ -407,9 +421,14 @@ static int adsp_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct adsp_data adsp_resource_init = {
+		.crash_reason_smem = 423,
+		.firmware_name = "adsp.mdt",
+		.pas_id = 1,
+};
 static const struct of_device_id adsp_of_match[] = {
-	{ .compatible = "qcom,msm8974-adsp-pil" },
-	{ .compatible = "qcom,msm8996-adsp-pil" },
+	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},
+	{ .compatible = "qcom,msm8996-adsp-pil", .data = &adsp_resource_init},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, adsp_of_match);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
