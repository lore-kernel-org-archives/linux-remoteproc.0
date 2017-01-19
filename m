Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] rpmsg: char: add CONFIG_NET dependency
Date: Thu, 19 Jan 2017 15:54:55 +0100
Message-Id: <20170119145503.556971-1-arnd@arndb.de>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Without CONFIG_NET, we get a build failure for the new driver:

ERROR: "skb_queue_tail" [drivers/rpmsg/rpmsg_char.ko] undefined!
ERROR: "skb_put" [drivers/rpmsg/rpmsg_char.ko] undefined!
ERROR: "__alloc_skb" [drivers/rpmsg/rpmsg_char.ko] undefined!
ERROR: "kfree_skb" [drivers/rpmsg/rpmsg_char.ko] undefined!
ERROR: "skb_dequeue" [drivers/rpmsg/rpmsg_char.ko] undefined!

This adds a dependency so we don't try to build the broken configuration.

Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/rpmsg/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index fa0d582efb3d..f12ac0b28263 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -7,6 +7,7 @@ config RPMSG
 config RPMSG_CHAR
 	tristate "RPMSG device interface"
 	depends on RPMSG
+	depends on NET
 	help
 	  Say Y here to export rpmsg endpoints as device files, usually found
 	  in /dev. They make it possible for user-space programs to send and
-- 
2.9.0
