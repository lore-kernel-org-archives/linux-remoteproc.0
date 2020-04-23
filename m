Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 4/4] arm64: defconfig: Remove QCOM_GLINK_SSR
Date: Wed, 22 Apr 2020 17:37:36 -0700
Message-Id: <20200423003736.2027371-5-bjorn.andersson@linaro.org>
In-Reply-To: <20200423003736.2027371-1-bjorn.andersson@linaro.org>
References: <20200423003736.2027371-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, Chris Lew <clew@codeaurora.org>, Sibi <sibis@codeaurora.org>, Siddharth Gupta <sidgup@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Remove the QCOM_GLINK_SSR option from the arm64 defconfig, as the module
is assimilated by QCOM_GLINK - which is selected by other means.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f9eefb5940ca..f26a0b6ea0e8 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -838,7 +838,6 @@ CONFIG_FSL_MC_DPIO=y
 CONFIG_IMX_SCU_SOC=y
 CONFIG_QCOM_AOSS_QMP=y
 CONFIG_QCOM_GENI_SE=y
-CONFIG_QCOM_GLINK_SSR=m
 CONFIG_QCOM_RMTFS_MEM=m
 CONFIG_QCOM_RPMH=y
 CONFIG_QCOM_RPMHPD=y
-- 
2.24.0
