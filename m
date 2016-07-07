Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] MAINTAINERS: Update hwspinlock paths
Date: Wed,  6 Jul 2016 20:48:13 -0700
Message-Id: <1467863293-3951-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Include all files in drivers/hwspinlock and hwlock related dt bindings
in the hw spinlock section of MAINTAINERS.

Cc: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 87b956d492c8..697f797f9e06 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5268,8 +5268,9 @@ M:	Bjorn Andersson <bjorn.andersson@linaro.org>
 L:	linux-remoteproc@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ohad/hwspinlock.git
+F:	Documentation/devicetree/bindings/hwlock/
 F:	Documentation/hwspinlock.txt
-F:	drivers/hwspinlock/hwspinlock_*
+F:	drivers/hwspinlock/
 F:	include/linux/hwspinlock.h
 
 HARMONY SOUND DRIVER
-- 
2.5.0
