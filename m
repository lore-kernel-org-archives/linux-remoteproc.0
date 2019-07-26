Return-Path: <govinds@codeaurora.org>
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v5 7/7] remoteproc: qcom: wcss: explicitly request exclusive reset control
Date: Fri, 26 Jul 2019 14:53:32 +0530
Message-Id: <20190726092332.25202-8-govinds@codeaurora.org>
In-Reply-To: <20190726092332.25202-1-govinds@codeaurora.org>
References: <20190726092332.25202-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: andy.gross@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Use request exclusive reset control for wcss reset controls.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index c2e75f5b5737..a2671a19f2d0 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -781,21 +781,21 @@ static int q6v5_wcss_init_reset(struct q6v5_wcss *wcss,
 	struct device *dev = wcss->dev;
 
 	if (desc->aon_reset_required) {
-		wcss->wcss_aon_reset = devm_reset_control_get(dev, "wcss_aon_reset");;
+		wcss->wcss_aon_reset = devm_reset_control_get_exclusive(dev, "wcss_aon_reset");;
 		if (IS_ERR(wcss->wcss_aon_reset)) {
 			dev_err(wcss->dev, "fail to acquire wcss_aon_reset\n");
 			return PTR_ERR(wcss->wcss_aon_reset);
 		}
 	}
 
-	wcss->wcss_reset = devm_reset_control_get(dev, "wcss_reset");
+	wcss->wcss_reset = devm_reset_control_get_exclusive(dev, "wcss_reset");
 	if (IS_ERR(wcss->wcss_reset)) {
 		dev_err(wcss->dev, "unable to acquire wcss_reset\n");
 		return PTR_ERR(wcss->wcss_reset);
 	}
 
 	if (desc->wcss_q6_reset_required) {
-		wcss->wcss_q6_reset = devm_reset_control_get(dev, "wcss_q6_reset");
+		wcss->wcss_q6_reset = devm_reset_control_get_exclusive(dev, "wcss_q6_reset");
 		if (IS_ERR(wcss->wcss_q6_reset)) {
 			dev_err(wcss->dev, "unable to acquire wcss_q6_reset\n");
 			return PTR_ERR(wcss->wcss_q6_reset);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
