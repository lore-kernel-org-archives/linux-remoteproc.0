Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 41/54] MAINTAINERS: Add file patterns for remoteproc device tree bindings
Date: Sun, 22 May 2016 11:06:18 +0200
Message-Id: <1463907991-7916-42-git-send-email-geert@linux-m68k.org>
In-Reply-To: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d419cdbe35cbacab..327e1d5a501340ac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9613,8 +9613,9 @@ M:	Bjorn Andersson <bjorn.andersson@linaro.org>
 L:	linux-remoteproc@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ohad/remoteproc.git
 S:	Maintained
-F:	drivers/remoteproc/
+F:	Documentation/devicetree/bindings/remoteproc/
 F:	Documentation/remoteproc.txt
+F:	drivers/remoteproc/
 F:	include/linux/remoteproc.h
 
 REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM
-- 
1.9.1
