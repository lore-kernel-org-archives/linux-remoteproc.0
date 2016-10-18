Return-Path: <peter.griffin@linaro.org>
Return-Path: <peter.griffin@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v10 10/11] ARM: multi_v7_defconfig: Enable STi FDMA driver
Date: Tue, 18 Oct 2016 10:39:15 +0100
Message-Id: <1476783556-2501-11-git-send-email-peter.griffin@linaro.org>
In-Reply-To: <1476783556-2501-1-git-send-email-peter.griffin@linaro.org>
References: <1476783556-2501-1-git-send-email-peter.griffin@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, ohad@wizery.com, bjorn.andersson@linaro.org, patrice.chotard@st.com
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This DMA controller is found on all STi chipsets.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 0a06af9..ce9ab5a 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -790,6 +790,7 @@ CONFIG_DMA_OMAP=y
 CONFIG_QCOM_BAM_DMA=y
 CONFIG_XILINX_DMA=y
 CONFIG_DMA_SUN6I=y
+CONFIG_ST_FDMA=m
 CONFIG_STAGING=y
 CONFIG_SENSORS_ISL29018=y
 CONFIG_SENSORS_ISL29028=y
-- 
1.9.1
