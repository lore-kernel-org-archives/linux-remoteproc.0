Return-Path: <pierre-louis.bossart@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 1/2] MAINTAINERS: RPMSG: fix git tree location
Date: Fri, 22 Feb 2019 22:20:16 -0600
Message-Id: <20190223042017.21985-1-pierre-louis.bossart@linux.intel.com>
To: linux-remoteproc@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The current information isn't up-to-date, use Bjorn Andersson's github
instead.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 32d444476a90..461fb5d3e5e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12893,7 +12893,7 @@ REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM
 M:	Ohad Ben-Cohen <ohad@wizery.com>
 M:	Bjorn Andersson <bjorn.andersson@linaro.org>
 L:	linux-remoteproc@vger.kernel.org
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ohad/rpmsg.git
+T:	git git://github.com/andersson/remoteproc
 S:	Maintained
 F:	drivers/rpmsg/
 F:	Documentation/rpmsg.txt
-- 
2.17.1
