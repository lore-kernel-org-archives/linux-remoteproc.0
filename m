Return-Path: <anup@brainfault.org>
Return-Path: <anup@brainfault.org>
From: Anup Patel <anup@brainfault.org>
Subject: [PATCH v3] rpmsg: Allow RPMSG_VIRTIO to be enabled via menuconfig or defconfig
Date: Thu,  5 Oct 2017 22:13:20 +0530
Message-Id: <1507221800-25519-1-git-send-email-anup@brainfault.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Currently, RPMSG_VIRTIO can only be enabled if some other kconfig
option selects it. This does not allow it to be enabled for
virtualized systems where Virtio RPMSG is available over Virtio
MMIO or PCI transport.

This patch updates RPMSG_VIRTIO kconfig option so that we can
enable the VirtIO RPMSG driver via menuconfig or defconfig. The
patch also removes "select RPMSG_VIRTIO" from various remoteproc
kconfig options because it is now user selectable.

Signed-off-by: Anup Patel <anup@brainfault.org>
---

Changes since v2:
- Remove "select RPMSG_VIRTIO" from various remoteproc
  kconfig options

Changes since v1:
- Add depends on HAS_DMA to avoid build failures on
  archs (such as um) with NO_DMA=y. For most archs,
  HAS_DMA=y so having depends on HAS_DMA is fine. 

 drivers/remoteproc/Kconfig | 4 ----
 drivers/rpmsg/Kconfig      | 3 ++-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index df63e44..afb7628 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -28,7 +28,6 @@ config OMAP_REMOTEPROC
 	depends on OMAP_IOMMU
 	select MAILBOX
 	select OMAP2PLUS_MBOX
-	select RPMSG_VIRTIO
 	help
 	  Say y here to support OMAP's remote processors (dual M3
 	  and DSP on OMAP4) via the remote processor framework.
@@ -58,7 +57,6 @@ config DA8XX_REMOTEPROC
 	tristate "DA8xx/OMAP-L13x remoteproc support"
 	depends on ARCH_DAVINCI_DA8XX
 	depends on DMA_CMA
-	select RPMSG_VIRTIO
 	help
 	  Say y here to support DA8xx/OMAP-L13x remote processors via the
 	  remote processor framework.
@@ -79,7 +77,6 @@ config DA8XX_REMOTEPROC
 config KEYSTONE_REMOTEPROC
 	tristate "Keystone Remoteproc support"
 	depends on ARCH_KEYSTONE
-	select RPMSG_VIRTIO
 	help
 	  Say Y here here to support Keystone remote processors (DSP)
 	  via the remote processor framework.
@@ -133,7 +130,6 @@ config ST_REMOTEPROC
 	depends on ARCH_STI
 	select MAILBOX
 	select STI_MBOX
-	select RPMSG_VIRTIO
 	help
 	  Say y here to support ST's adjunct processors via the remote
 	  processor framework.
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
