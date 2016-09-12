Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] rpmsg: smd: fix dependency on QCOM_SMD=n
Date: Mon, 12 Sep 2016 11:58:56 +0200
Message-Id: <20160912095903.897647-1-arnd@arndb.de>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The ARM allmodconfig build broke with the addition of the SMD rpmsg
driver that conflicts with the driver its replaces:

WARNING: drivers/soc/qcom/smd: 'qcom_smd_register_edge' exported twice. Previous export was in drivers/rpmsg/qcom_smd.ko
WARNING: drivers/soc/qcom/smd: 'qcom_smd_unregister_edge' exported twice. Previous export was in drivers/rpmsg/qcom_smd.ko

There is already a dependency that is meant to avoid the broken
configuration, but that only prevents the case where at least
one of the two are built-in, but not if both are modules.

This changes the dependency to "=n", to ensure that the new driver
can only be enabled if the other one is completely disabled.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 53e2822e56c7 ("rpmsg: Introduce Qualcomm SMD backend")
---
 drivers/rpmsg/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index 9ba5a2e5c930..de31c5f14dd9 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -7,7 +7,7 @@ config RPMSG
 config RPMSG_QCOM_SMD
 	tristate "Qualcomm Shared Memory Driver (SMD)"
 	depends on QCOM_SMEM
-	depends on !QCOM_SMD
+	depends on QCOM_SMD=n
 	select RPMSG
 	help
 	  Say y here to enable support for the Qualcomm Shared Memory Driver
-- 
2.9.0
