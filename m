Return-Path: <peter.griffin@linaro.org>
Return-Path: <peter.griffin@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v10 09/11] ARM: multi_v7_defconfig: Enable st_remoteproc driver.
Date: Sat,  8 Oct 2016 13:52:31 +0100
Message-Id: <1475931154-1021-10-git-send-email-peter.griffin@linaro.org>
In-Reply-To: <1475931154-1021-1-git-send-email-peter.griffin@linaro.org>
References: <1475931154-1021-1-git-send-email-peter.griffin@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, dan.j.williams@intel.com, patrice.chotard@st.com, ohad@wizery.com, bjorn.andersson@linaro.org, arnaud.pouliquen@st.com
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The st231 remote coprocessors are found on all STi chipsets.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index c94611c..33f7a8a 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -818,6 +818,7 @@ CONFIG_ROCKCHIP_IOMMU=y
 CONFIG_TEGRA_IOMMU_GART=y
 CONFIG_TEGRA_IOMMU_SMMU=y
 CONFIG_REMOTEPROC=m
+CONFIG_ST_REMOTEPROC=m
 CONFIG_PM_DEVFREQ=y
 CONFIG_ARM_TEGRA_DEVFREQ=m
 CONFIG_MEMORY=y
-- 
1.9.1
