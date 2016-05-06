Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] rpmsg: Make rpmsg sample selectable
Date: Fri,  6 May 2016 11:06:12 -0700
Message-Id: <1462557972-32699-1-git-send-email-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Suman Anna <s-anna@ti.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

rpmsg is not user selectable so the rpmsg sample should not depend on
it, as this limits the possibility of compiling the sample client
without any other clients.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 samples/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/samples/Kconfig b/samples/Kconfig
index d54f28c6dc5e..61a251e579ed 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -57,7 +57,8 @@ config SAMPLE_KDB
 
 config SAMPLE_RPMSG_CLIENT
 	tristate "Build rpmsg client sample -- loadable modules only"
-	depends on RPMSG && m
+	select RPMSG
+	depends on m
 	help
 	  Build an rpmsg client sample driver, which demonstrates how
 	  to communicate with an AMP-configured remote processor over
-- 
2.5.0
