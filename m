Return-Path: <govinds@codeaurora.org>
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v4 1/8] dt-bindings: clock: qcom: Add QCOM WCSS GCC clock bindings
Date: Sat,  2 Feb 2019 20:56:19 +0530
Message-Id: <20190202152626.1006-2-govinds@codeaurora.org>
In-Reply-To: <20190202152626.1006-1-govinds@codeaurora.org>
References: <20190202152626.1006-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add device tree bindings for WiFi QDSP gcc clock controls found in
QCS404 soc.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/clock/qcom,gcc-qcs404.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-qcs404.h b/include/dt-bindings/clock/qcom,gcc-qcs404.h
index 00ab0d77b38a..f5dfc1890870 100644
--- a/include/dt-bindings/clock/qcom,gcc-qcs404.h
+++ b/include/dt-bindings/clock/qcom,gcc-qcs404.h
@@ -146,6 +146,8 @@
 #define GCC_MDP_TBU_CLK					138
 #define GCC_QDSS_DAP_CLK				139
 #define GCC_DCC_XO_CLK					140
+#define GCC_WCSS_Q6_AHB_CLK				141
+#define GCC_WCSS_Q6_AXIM_CLK				142
 
 #define GCC_GENI_IR_BCR					0
 #define GCC_USB_HS_BCR					1
@@ -168,5 +170,6 @@
 #define GCC_PCIE_0_CORE_STICKY_ARES			18
 #define GCC_PCIE_0_SLEEP_ARES				19
 #define GCC_PCIE_0_PIPE_ARES				20
+#define GCC_WDSP_RESTART				21
 
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
