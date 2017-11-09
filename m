Return-Path: <sricharan@codeaurora.org>
From: Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH v4 3/6] remoteproc: qcom: Push reset ops, fw ops, rproc ops in to of_match data
Date: Thu,  9 Nov 2017 20:16:12 +0530
Message-Id: <1510238775-14883-4-git-send-email-sricharan@codeaurora.org>
In-Reply-To: <1510238775-14883-1-git-send-email-sricharan@codeaurora.org>
References: <1510238775-14883-1-git-send-email-sricharan@codeaurora.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
Cc: sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Instead of directly assigning reset, fw and rproc ops, put them
in to of_match data and get from that. Currently same ops
are used for all compatibles, but that will change when we add
q6v5-wcss support.

Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index df8723d..769c6af 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -116,16 +116,6 @@ struct qcom_mss_reg_res {
 	int uA;
 };
 
-struct rproc_hexagon_res {
-	const char *hexagon_mba_image;
-	struct qcom_mss_reg_res *proxy_supply;
-	struct qcom_mss_reg_res *active_supply;
-	char **proxy_clk_names;
-	char **active_clk_names;
-	int version;
-	bool need_mem_protection;
-};
-
 struct q6v5 {
 	struct device *dev;
 	struct rproc *rproc;
@@ -174,6 +164,19 @@ struct q6v5 {
 	int version;
 };
 
+struct rproc_hexagon_res {
+	const char *hexagon_mba_image;
+	struct qcom_mss_reg_res *proxy_supply;
+	struct qcom_mss_reg_res *active_supply;
+	char **proxy_clk_names;
+	char **active_clk_names;
+	int version;
+	bool need_mem_protection;
+	int (*init_reset)(struct q6v5 *qproc);
+	const struct rproc_fw_ops *fw_ops;
+	const struct rproc_ops *ops;
+};
+
 enum {
 	MSS_MSM8916,
 	MSS_MSM8974,
@@ -1128,14 +1131,14 @@ static int q6v5_probe(struct platform_device *pdev)
 	if (!desc)
 		return -EINVAL;
 
-	rproc = rproc_alloc(&pdev->dev, pdev->name, &q6v5_ops,
+	rproc = rproc_alloc(&pdev->dev, pdev->name, desc->ops,
 			    desc->hexagon_mba_image, sizeof(*qproc));
 	if (!rproc) {
 		dev_err(&pdev->dev, "failed to allocate rproc\n");
 		return -ENOMEM;
 	}
 
-	rproc->fw_ops = &q6v5_fw_ops;
+	rproc->fw_ops = desc->fw_ops;
 
 	qproc = (struct q6v5 *)rproc->priv;
 	qproc->dev = &pdev->dev;
@@ -1185,7 +1188,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	}
 	qproc->active_reg_count = ret;
 
-	ret = q6v5_init_reset(qproc);
+	ret = desc->init_reset(qproc);
 	if (ret)
 		goto free_rproc;
 
@@ -1258,6 +1261,9 @@ static int q6v5_remove(struct platform_device *pdev)
 	},
 	.need_mem_protection = true,
 	.version = MSS_MSM8996,
+	.init_reset = q6v5_init_reset,
+	.fw_ops = &q6v5_fw_ops,
+	.ops = &q6v5_ops,
 };
 
 static const struct rproc_hexagon_res msm8916_mss = {
@@ -1289,6 +1295,9 @@ static int q6v5_remove(struct platform_device *pdev)
 	},
 	.need_mem_protection = false,
 	.version = MSS_MSM8916,
+	.init_reset = q6v5_init_reset,
+	.fw_ops = &q6v5_fw_ops,
+	.ops = &q6v5_ops,
 };
 
 static const struct rproc_hexagon_res msm8974_mss = {
@@ -1328,6 +1337,9 @@ static int q6v5_remove(struct platform_device *pdev)
 	},
 	.need_mem_protection = false,
 	.version = MSS_MSM8974,
+	.init_reset = q6v5_init_reset,
+	.fw_ops = &q6v5_fw_ops,
+	.ops = &q6v5_ops,
 };
 
 static const struct of_device_id q6v5_of_match[] = {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
