Return-Path: <peter.griffin@linaro.org>
Return-Path: <peter.griffin@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v9 07/19] MAINTAINERS: Add FDMA driver files to STi section.
Date: Mon,  5 Sep 2016 14:16:49 +0100
Message-Id: <1473081421-16555-8-git-send-email-peter.griffin@linaro.org>
In-Reply-To: <1473081421-16555-1-git-send-email-peter.griffin@linaro.org>
References: <1473081421-16555-1-git-send-email-peter.griffin@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, patrice.chotard@st.com, dan.j.williams@intel.com, airlied@linux.ie, kraxel@redhat.com, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-remoteproc@vger.kernel.org, virtualization@lists.linux-foundation.org
List-ID: <linux-remoteproc@vger.kernel.org>

This patch adds the FDMA driver files to the STi
section of the maintainers file.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5dd3b24..d21a7b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1739,6 +1739,7 @@ F:	drivers/char/hw_random/st-rng.c
 F:	drivers/clocksource/arm_global_timer.c
 F:	drivers/clocksource/clksrc_st_lpc.c
 F:	drivers/cpufreq/sti-cpufreq.c
+F:	drivers/dma/st_fdma*
 F:	drivers/i2c/busses/i2c-st.c
 F:	drivers/media/rc/st_rc.c
 F:	drivers/media/platform/sti/c8sectpfe/
-- 
1.9.1
