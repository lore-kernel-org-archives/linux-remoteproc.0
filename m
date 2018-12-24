Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 4/4] remoteproc: qcom: Enable shutdown-ack irq on Q6V5
Date: Mon, 24 Dec 2018 14:18:25 +0530
Message-Id: <20181224084824.25193-4-sibis@codeaurora.org>
In-Reply-To: <20181224084824.25193-1-sibis@codeaurora.org>
References: <20181224084824.25193-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, ohad@wizery.com, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, dianders@chromium.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Enable shutdown-ack irq handling for MSS Q6V5 on SDM845/MSM8996
SoCs and for WCSS Q6V5 on QCS404 SoC.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 11 ++++++++---
 drivers/remoteproc/qcom_q6v5_pas.c |  9 +++++++--
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 3bc2dec85928..fdb18d1ea177 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -134,6 +134,7 @@ struct rproc_hexagon_res {
 	int version;
 	bool need_mem_protection;
 	bool has_alt_reset;
+	u8 has_shutdown_irq;
 };
 
 struct q6v5 {
@@ -1252,6 +1253,7 @@ static int q6v5_probe(struct platform_device *pdev)
 {
 	const struct rproc_hexagon_res *desc;
 	struct q6v5 *qproc;
+	struct qcom_q6v5 *q6v5;
 	struct rproc *rproc;
 	int ret;
 
@@ -1273,6 +1275,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	qproc->dev = &pdev->dev;
 	qproc->rproc = rproc;
 	platform_set_drvdata(pdev, qproc);
+	q6v5 = &qproc->q6v5;
 
 	ret = q6v5_init_mem(qproc, pdev);
 	if (ret)
@@ -1330,7 +1333,8 @@ static int q6v5_probe(struct platform_device *pdev)
 	qproc->version = desc->version;
 	qproc->need_mem_protection = desc->need_mem_protection;
 
-	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, MPSS_CRASH_REASON_SMEM,
+	q6v5->has_shutdown_irq = desc->has_shutdown_irq;
+	ret = qcom_q6v5_init(q6v5, pdev, rproc, MPSS_CRASH_REASON_SMEM,
 			     qcom_msa_handover);
 	if (ret)
 		goto free_rproc;
@@ -1340,8 +1344,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	qcom_add_glink_subdev(rproc, &qproc->glink_subdev);
 	qcom_add_smd_subdev(rproc, &qproc->smd_subdev);
 	qcom_add_ssr_subdev(rproc, &qproc->ssr_subdev, "mpss");
-	qproc->sysmon = qcom_add_sysmon_subdev(rproc, "modem", 0x12,
-					       &qproc->q6v5);
+	qproc->sysmon = qcom_add_sysmon_subdev(rproc, "modem", 0x12, q6v5);
 
 	ret = rproc_add(rproc);
 	if (ret)
@@ -1391,6 +1394,7 @@ static const struct rproc_hexagon_res sdm845_mss = {
 	},
 	.need_mem_protection = true,
 	.has_alt_reset = true,
+	.has_shutdown_irq = true,
 	.version = MSS_SDM845,
 };
 
@@ -1410,6 +1414,7 @@ static const struct rproc_hexagon_res msm8996_mss = {
 	},
 	.need_mem_protection = true,
 	.has_alt_reset = false,
+	.has_shutdown_irq = true,
 	.version = MSS_MSM8996,
 };
 
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 920a39ea6609..2d6ff59575cd 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -43,6 +43,7 @@ struct adsp_data {
 	const char *ssr_name;
 	const char *sysmon_name;
 	int ssctl_id;
+	u8 has_shutdown_irq;
 };
 
 struct qcom_adsp {
@@ -257,6 +258,7 @@ static int adsp_probe(struct platform_device *pdev)
 {
 	const struct adsp_data *desc;
 	struct qcom_adsp *adsp;
+	struct qcom_q6v5 *q6v5;
 	struct rproc *rproc;
 	int ret;
 
@@ -280,6 +282,7 @@ static int adsp_probe(struct platform_device *pdev)
 	adsp->pas_id = desc->pas_id;
 	adsp->has_aggre2_clk = desc->has_aggre2_clk;
 	platform_set_drvdata(pdev, adsp);
+	q6v5 = &adsp->q6v5;
 
 	ret = adsp_alloc_memory_region(adsp);
 	if (ret)
@@ -293,7 +296,8 @@ static int adsp_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem,
+	q6v5->has_shutdown_irq = desc->has_shutdown_irq;
+	ret = qcom_q6v5_init(q6v5, pdev, rproc, desc->crash_reason_smem,
 			     qcom_pas_handover);
 	if (ret)
 		goto free_rproc;
@@ -304,7 +308,7 @@ static int adsp_probe(struct platform_device *pdev)
 	adsp->sysmon = qcom_add_sysmon_subdev(rproc,
 					      desc->sysmon_name,
 					      desc->ssctl_id,
-					      &adsp->q6v5);
+					      q6v5);
 
 	ret = rproc_add(rproc);
 	if (ret)
@@ -366,6 +370,7 @@ static const struct adsp_data slpi_resource_init = {
 static const struct adsp_data wcss_resource_init = {
 	.crash_reason_smem = 421,
 	.firmware_name = "wcnss.mdt",
+	.has_shutdown_irq = true,
 	.pas_id = 6,
 	.ssr_name = "mpss",
 	.sysmon_name = "wcnss",
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
