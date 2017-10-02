Return-Path: <anup@brainfault.org>
Return-Path: <anup@brainfault.org>
From: Anup Patel <anup@brainfault.org>
Subject: [PATCH v2] rpmsg: Allow RPMSG_VIRTIO to be enabled via menuconfig or defconfig
Date: Mon,  2 Oct 2017 09:48:20 +0530
Message-Id: <1506917900-12289-1-git-send-email-anup@brainfault.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Currently, RPMSG_VIRTIO can only be enabled if some other kconfig
option selects it. This does not allow it to be enabled for
virtualized systems where Virtio RPMSG is available over Virtio
MMIO or PCI transport.

This patch updates RPMSG_VIRTIO kconfig option so that we can
enable the VirtIO RPMSG driver via menuconfig or defconfig.

Signed-off-by: Anup Patel <anup@brainfault.org>
---

Changes since v1:
- Add depends on HAS_DMA to avoid build failures on
  archs (such as um) with NO_DMA=y. For most archs,
  HAS_DMA=y so having depends on HAS_DMA is fine. 

 drivers/rpmsg/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index 0fe6eac..65a9f6b 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -47,7 +47,8 @@ config RPMSG_QCOM_SMD
 	  platforms.
 
 config RPMSG_VIRTIO
-	tristate
+	tristate "Virtio RPMSG bus driver"
+	depends on HAS_DMA
 	select RPMSG
 	select VIRTIO
 
-- 
2.7.4
