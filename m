Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v5 1/7] remoteproc: qcom: Add private resource struct and new compatible.
Date: Thu, 15 Dec 2016 17:51:24 +0530
Message-Id: <1481804490-8583-2-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1481804490-8583-1-git-send-email-akdwived@codeaurora.org>
References: <1481804490-8583-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Make provison for private resource specific to each compatible,
so a private resource struct is introduced which will house clock,
regulator etc. related info corresponding to each compatible to use
later to initialize hardware. Also add new compatible in documentation.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |  4 +++-
 drivers/remoteproc/qcom_q6v5_pil.c                 | 24 +++++++++++++++++++---
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 57cb49e..674ebc6 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -7,7 +7,9 @@ on the Qualcomm Hexagon core.
 	Usage: required
 	Value type: <string>
 	Definition: must be one of:
-		    "qcom,q6v5-pil"
+		"qcom,q6v5-pil"
+		"qcom,msm8916-mss-pil"
+		"qcom,msm8974-mss-pil"
 
 - reg:
 	Usage: required
diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 2e0caaa..d875448 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -30,13 +30,13 @@
 #include <linux/reset.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
+#include <linux/of_device.h>
 
 #include "remoteproc_internal.h"
 #include "qcom_mdt_loader.h"
 
 #include <linux/qcom_scm.h>
 
-#define MBA_FIRMWARE_NAME		"mba.b00"
 #define MPSS_FIRMWARE_NAME		"modem.mdt"
 
 #define MPSS_CRASH_REASON_SMEM		421
@@ -93,6 +93,10 @@
 #define QDSS_BHS_ON			BIT(21)
 #define QDSS_LDO_BYP			BIT(22)
 
+struct rproc_hexagon_res {
+	const char *hexagon_mba_image;
+};
+
 struct q6v5 {
 	struct device *dev;
 	struct rproc *rproc;
@@ -805,12 +809,17 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 
 static int q6v5_probe(struct platform_device *pdev)
 {
+	const struct rproc_hexagon_res *desc;
 	struct q6v5 *qproc;
 	struct rproc *rproc;
 	int ret;
 
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
+
 	rproc = rproc_alloc(&pdev->dev, pdev->name, &q6v5_ops,
-			    MBA_FIRMWARE_NAME, sizeof(*qproc));
+			    desc->hexagon_mba_image, sizeof(*qproc));
 	if (!rproc) {
 		dev_err(&pdev->dev, "failed to allocate rproc\n");
 		return -ENOMEM;
@@ -890,8 +899,17 @@ static int q6v5_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct rproc_hexagon_res msm8916_mss = {
+	.hexagon_mba_image = "mba.mbn",
+};
+
+static const struct rproc_hexagon_res msm8974_mss = {
+	.hexagon_mba_image = "mba.b00",
+};
 static const struct of_device_id q6v5_of_match[] = {
-	{ .compatible = "qcom,q6v5-pil", },
+	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
+	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
+	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},
 	{ },
 };
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
