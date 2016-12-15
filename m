Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v5 7/7] clk: qcom: Add GCC_MSS_RESET support
Date: Thu, 15 Dec 2016 17:51:30 +0530
Message-Id: <1481804490-8583-8-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1481804490-8583-1-git-send-email-akdwived@codeaurora.org>
References: <1481804490-8583-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add support to use reset control framework for resetting MSS
with hexagon v56 1.5.0.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/gcc-msm8996.c               | 1 +
 include/dt-bindings/clock/qcom,gcc-msm8996.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index fe03e6f..fd4bf6f 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -3423,6 +3423,7 @@ enum {
 	[GCC_MSMPU_BCR] = { 0x8d000 },
 	[GCC_MSS_Q6_BCR] = { 0x8e000 },
 	[GCC_QREFS_VBG_CAL_BCR] = { 0x88020 },
+	[GCC_MSS_RESTART] = { 0x8f008 },
 };
 
 static const struct regmap_config gcc_msm8996_regmap_config = {
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8996.h b/include/dt-bindings/clock/qcom,gcc-msm8996.h
index 1828723..1f5c422 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8996.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8996.h
@@ -339,6 +339,7 @@
 #define GCC_PCIE_PHY_COM_NOCSR_BCR				102
 #define GCC_USB3_PHY_BCR					103
 #define GCC_USB3PHY_PHY_BCR					104
+#define GCC_MSS_RESTART						105
 
 
 /* Indexes for GDSCs */
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
