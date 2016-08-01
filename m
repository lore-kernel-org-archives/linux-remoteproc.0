Return-Path: <peter.griffin@linaro.org>
Return-Path: <peter.griffin@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v7 09/16] ARM: multi_v7_defconfig: Enable STi and simple-card drivers.
Date: Mon,  1 Aug 2016 18:10:46 +0100
Message-Id: <1470071453-10730-10-git-send-email-peter.griffin@linaro.org>
In-Reply-To: <1470071453-10730-1-git-send-email-peter.griffin@linaro.org>
References: <1470071453-10730-1-git-send-email-peter.griffin@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, patrice.chotard@st.com, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, arnaud.pouliquen@st.com, broonie@kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This patch enables the STi ALSA drivers found on STi platforms
as well as the simple-card driver which is a dependency to have
working sound.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Cc: arnaud.pouliquen@st.com
Cc: broonie@kernel.org
---
 arch/arm/configs/multi_v7_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 541c914..9cf9141 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -608,6 +608,9 @@ CONFIG_SND_SOC_AK4642=m
 CONFIG_SND_SOC_SGTL5000=m
 CONFIG_SND_SOC_SPDIF=m
 CONFIG_SND_SOC_WM8978=m
+CONFIG_SND_SOC_STI=m
+CONFIG_SND_SOC_STI_SAS=m
+CONFIG_SND_SIMPLE_CARD=m
 CONFIG_USB=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_MVEBU=y
-- 
1.9.1
