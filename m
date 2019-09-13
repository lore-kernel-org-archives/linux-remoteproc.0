Return-Path: <gokulsri@qualcomm.com>
From: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Subject: [PATCH V2 05/12] remoteproc: qcom: Update regmap offsets for halt register
Date: Fri, 13 Sep 2019 17:26:04 +0530
Message-Id: <1568375771-22933-6-git-send-email-gokulsri@codeaurora.org>
In-Reply-To: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org>
References: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org>
To: gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org, david.brown@linaro.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com, robh+dt@kernel.org, sricharan@codeaurora.org, nprakash@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Fixed issue in reading halt-regs parameter from device-tree.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 6d3ef06..b4ef5d3 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -83,7 +83,7 @@
 #define TCSR_WCSS_CLK_MASK	0x1F
 #define TCSR_WCSS_CLK_ENABLE	0x14
 
-#define MAX_HALT_REG		3
+#define MAX_HALT_REG		4
 
 #define WCNSS_PAS_ID		6
 
@@ -149,6 +149,7 @@ struct wcss_data {
 	int crash_reason_smem;
 	u8 version;
 	bool aon_reset_required;
+	bool bcr_reset_required;
 	const char *ssr_name;
 	const char *sysmon_name;
 	int ssctl_id;
@@ -810,7 +811,8 @@ static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
 };
 
 static int q6v5_wcss_init_reset(struct q6v5_wcss *wcss,
-				bool aon_reset_required)
+				bool aon_reset_required,
+				bool bcr_reset_required)
 {
 	struct device *dev = wcss->dev;
 
@@ -834,10 +836,13 @@ static int q6v5_wcss_init_reset(struct q6v5_wcss *wcss,
 		return PTR_ERR(wcss->wcss_q6_reset);
 	}
 
-	wcss->wcss_q6_bcr_reset = devm_reset_control_get_exclusive(dev, "wcss_q6_bcr_reset");
-	if (IS_ERR(wcss->wcss_q6_bcr_reset)) {
-		dev_err(wcss->dev, "unable to acquire wcss_q6_bcr_reset\n");
-		return PTR_ERR(wcss->wcss_q6_reset);
+	if (bcr_reset_required) {
+		wcss->wcss_q6_bcr_reset = devm_reset_control_get_exclusive(dev,
+									   "wcss_q6_bcr_reset");
+		if (IS_ERR(wcss->wcss_q6_bcr_reset)) {
+			dev_err(wcss->dev, "unable to acquire wcss_q6_bcr_reset\n");
+			return PTR_ERR(wcss->wcss_q6_reset);
+		}
 	}
 
 	return 0;
@@ -885,9 +890,9 @@ static int q6v5_wcss_init_mmio(struct q6v5_wcss *wcss,
 		return -EINVAL;
 	}
 
-	wcss->halt_q6 = halt_reg[0];
-	wcss->halt_wcss = halt_reg[1];
-	wcss->halt_nc = halt_reg[2];
+	wcss->halt_q6 = halt_reg[1];
+	wcss->halt_wcss = halt_reg[2];
+	wcss->halt_nc = halt_reg[3];
 
 	return 0;
 }
@@ -1111,7 +1116,8 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 			goto free_rproc;
 	}
 
-	ret = q6v5_wcss_init_reset(wcss, desc->aon_reset_required);
+	ret = q6v5_wcss_init_reset(wcss, desc->aon_reset_required,
+				   desc->bcr_reset_required);
 	if (ret)
 		goto free_rproc;
 
@@ -1156,6 +1162,7 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
 	.m3_firmware_name = "IPQ8074/m3_fw.mdt",
 	.crash_reason_smem = 421,
 	.aon_reset_required = true,
+	.bcr_reset_required = false,
 	.ssr_name = "q6wcss",
 	.ops = &q6v5_wcss_ipq8074_ops,
 	.requires_force_stop = true,
@@ -1169,6 +1176,7 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
 	.q6_firmware_name = "wcnss.mdt",
 	.version = WCSS_QCS404,
 	.aon_reset_required = false,
+	.bcr_reset_required = true,
 	.ssr_name = "mpss",
 	.sysmon_name = "wcnss",
 	.ssctl_id = 0x12,
-- 
1.9.1
