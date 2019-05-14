Return-Path: <rpjday@crashcourse.ca>
Date: Tue, 14 May 2019 07:02:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: [PATCH] remoteproc,rpmsg: add missing MAINTAINERS file entries
Message-ID: <alpine.LFD.2.21.1905140700500.10964@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-remoteproc@vger.kernel.org
Cc: ohad@wizery.com, bjorn.andersson@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

Add a few missing file and directory entries related to both
remoteproc and rpmsg.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/MAINTAINERS b/MAINTAINERS
index fb9f9d71f7a2..fa0958e23b97 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13294,9 +13294,11 @@ L:	linux-remoteproc@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ohad/remoteproc.git
 S:	Maintained
 F:	Documentation/devicetree/bindings/remoteproc/
+F:	Documentation/ABI/testing/sysfs-class-remoteproc
 F:	Documentation/remoteproc.txt
 F:	drivers/remoteproc/
 F:	include/linux/remoteproc.h
+F:	include/linux/remoteproc/

 REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM
 M:	Ohad Ben-Cohen <ohad@wizery.com>
@@ -13306,8 +13308,11 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ohad/rpmsg.git
 S:	Maintained
 F:	drivers/rpmsg/
 F:	Documentation/rpmsg.txt
+F:	Documentation/ABI/testing/sysfs-bus-rpmsg
 F:	include/linux/rpmsg.h
 F:	include/linux/rpmsg/
+F:	include/uapi/linux/rpmsg.h
+F:	samples/rpmsg/

 RENESAS CLOCK DRIVERS
 M:	Geert Uytterhoeven <geert+renesas@glider.be>

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
