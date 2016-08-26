Return-Path: <peter.griffin@linaro.org>
Return-Path: <peter.griffin@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v8 17/18] drm/virtio: kconfig: Fix recursive dependency.
Date: Fri, 26 Aug 2016 15:56:52 +0100
Message-Id: <1472223413-7254-18-git-send-email-peter.griffin@linaro.org>
In-Reply-To: <1472223413-7254-1-git-send-email-peter.griffin@linaro.org>
References: <1472223413-7254-1-git-send-email-peter.griffin@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, patrice.chotard@st.com, dan.j.williams@intel.com, airlied@linux.ie, kraxel@redhat.com, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

[..]
drivers/video/fbdev/Kconfig:5:error: recursive dependency detected!
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/video/fbdev/Kconfig:5:	symbol FB is selected by DRM_KMS_FB_HELPER
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/gpu/drm/Kconfig:42:	symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/gpu/drm/Kconfig:36:	symbol DRM_KMS_HELPER is selected by DRM_VIRTIO_GPU
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/gpu/drm/virtio/Kconfig:1:	symbol DRM_VIRTIO_GPU depends on VIRTIO
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/virtio/Kconfig:1:	symbol VIRTIO is selected by REMOTEPROC
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/remoteproc/Kconfig:4:	symbol REMOTEPROC is selected by ST_SLIM_REMOTEPROC
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/remoteproc/Kconfig:103:	symbol ST_SLIM_REMOTEPROC is selected by ST_FDMA
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/dma/Kconfig:440:	symbol ST_FDMA depends on DMADEVICES
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/dma/Kconfig:5:	symbol DMADEVICES is selected by SND_SOC_SH4_SIU
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
sound/soc/sh/Kconfig:29:	symbol SND_SOC_SH4_SIU is selected by SND_SIU_MIGOR
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
sound/soc/sh/Kconfig:64:	symbol SND_SIU_MIGOR depends on I2C
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/i2c/Kconfig:7:	symbol I2C is selected by FB_DDC
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/video/fbdev/Kconfig:63:	symbol FB_DDC is selected by FB_CYBER2000_DDC
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/video/fbdev/Kconfig:378:	symbol FB_CYBER2000_DDC depends on FB_CYBER2000
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
drivers/video/fbdev/Kconfig:366:	symbol FB_CYBER2000 depends on FB

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/gpu/drm/virtio/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/Kconfig b/drivers/gpu/drm/virtio/Kconfig
index e1afc3d..90357d9 100644
--- a/drivers/gpu/drm/virtio/Kconfig
+++ b/drivers/gpu/drm/virtio/Kconfig
@@ -1,6 +1,7 @@
 config DRM_VIRTIO_GPU
 	tristate "Virtio GPU driver"
-	depends on DRM && VIRTIO
+	depends on DRM
+	select VIRTIO
         select DRM_KMS_HELPER
         select DRM_TTM
 	help
-- 
1.9.1
