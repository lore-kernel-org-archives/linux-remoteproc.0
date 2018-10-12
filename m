Return-Path: <govinds@codeaurora.org>
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v2 1/6] dt-bindings: clock: qcom: Add QCOM WCSS GCC clock bindings
Date: Fri, 12 Oct 2018 15:10:39 +0530
Message-Id: <1539337244-9505-2-git-send-email-govinds@codeaurora.org>
In-Reply-To: <1539337244-9505-1-git-send-email-govinds@codeaurora.org>
References: <1539337244-9505-1-git-send-email-govinds@codeaurora.org>
To: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, sricharan@codeaurora.org, sibis@codeaurora.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Govind Singh <govinds@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add device tree bindings for WiFi QDSP gcc clock controls found in
QCS404 soc.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 include/dt-bindings/clock/qcom,gcc-qcs404.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-qcs404.h b/include/dt-bindings/clock/qcom,gcc-qcs404.h
index e2def29..ba6bc55 100644
--- a/include/dt-bindings/clock/qcom,gcc-qcs404.h
+++ b/include/dt-bindings/clock/qcom,gcc-qcs404.h
@@ -147,6 +147,8 @@
 #define GCC_MDP_TBU_CLK					138
 #define GCC_QDSS_DAP_CLK				139
 #define GCC_DCC_XO_CLK					140
+#define GCC_WCSS_Q6_AHB_CBCR_CLK			141
+#define GCC_WCSS_Q6_AXIM_CBCR_CLK			142
 
 #define GCC_GENI_IR_BCR					0
 #define GCC_USB_HS_BCR					1
@@ -162,5 +164,6 @@
 #define GCC_PCIE_0_LINK_DOWN_BCR			11
 #define GCC_PCIEPHY_0_PHY_BCR				12
 #define GCC_EMAC_BCR					13
+#define GCC_WDSP_RESTART				14
 
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
