Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] MAINTAINERS: Add mailing list for remote processor subsystems
Date: Mon, 21 Mar 2016 23:03:32 -0700
Message-Id: <1458626612-62137-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>
Cc: Suman Anna <s-anna@ti.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Add the newly created linux-remoteproc mailing list for the three
subsystems related to remote processor management and communication.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a4ca4b183529..dc6e93827b39 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4968,6 +4968,7 @@ F:	include/linux/hw_random.h
 HARDWARE SPINLOCK CORE
 M:	Ohad Ben-Cohen <ohad@wizery.com>
 M:	Bjorn Andersson <bjorn.andersson@linaro.org>
+L:	linux-remoteproc@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ohad/hwspinlock.git
 F:	Documentation/hwspinlock.txt
@@ -9138,6 +9139,7 @@ F:	include/linux/regmap.h
 REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM
 M:	Ohad Ben-Cohen <ohad@wizery.com>
 M:	Bjorn Andersson <bjorn.andersson@linaro.org>
+L:	linux-remoteproc@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ohad/remoteproc.git
 S:	Maintained
 F:	drivers/remoteproc/
@@ -9147,6 +9149,7 @@ F:	include/linux/remoteproc.h
 REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM
 M:	Ohad Ben-Cohen <ohad@wizery.com>
 M:	Bjorn Andersson <bjorn.andersson@linaro.org>
+L:	linux-remoteproc@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ohad/rpmsg.git
 S:	Maintained
 F:	drivers/rpmsg/
-- 
2.5.4 (Apple Git-61)
