Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/4] remoteproc: Drop VIRTUALIZATION dependency from REMOTEPROC
Date: Tue, 27 Jun 2017 17:46:08 -0500
Message-ID: <20170627224610.15321-3-s-anna@ti.com>
In-Reply-To: <20170627224610.15321-1-s-anna@ti.com>
References: <20170627224610.15321-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

A dependency to VIRTUALIZATION has been added to REMOTEPROC in v3.10
kernel in commit b9777859ec01 ("remoteproc: fix kconfig dependencies
for VIRTIO") to resolve Kconfig warnings due to the inclusion of the
virtio configuration file from the ARM's KVM config file. The KVM
config was fixed properly in the subsequent release in commit
8bd4ffd6b3a9 ("ARM: kvm: don't include drivers/virtio/Kconfig").
So, drop this unneeded VIRTUALIZATION dependency from REMOTEPROC.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index b950e6cd4ba2..ea344fbf378a 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -6,7 +6,6 @@ config REMOTEPROC
 	select CRC32
 	select FW_LOADER
 	select VIRTIO
-	select VIRTUALIZATION
 	help
 	  Support for remote processors (such as DSP coprocessors). These
 	  are mainly used on embedded systems.
-- 
2.13.1
