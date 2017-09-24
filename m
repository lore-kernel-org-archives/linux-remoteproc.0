Return-Path: <anup@brainfault.org>
Return-Path: <anup@brainfault.org>
From: Anup Patel <anup@brainfault.org>
Subject: [PATCH] rpmsg: Allow RPMSG_VIRTIO to be enabled via menuconfig or defconfig
Date: Sun, 24 Sep 2017 16:04:59 +0530
Message-Id: <1506249299-15143-1-git-send-email-anup@brainfault.org>
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
 drivers/rpmsg/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index 0fe6eac..7e29b30 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -47,7 +47,7 @@ config RPMSG_QCOM_SMD
 	  platforms.
 
 config RPMSG_VIRTIO
-	tristate
+	tristate "Virtio RPMSG bus driver"
 	select RPMSG
 	select VIRTIO
 
-- 
2.7.4
