Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] MAINTAINERS: Add missing rpmsg include path
Date: Mon, 30 Jan 2017 09:03:34 -0800
Message-Id: <20170130170334.4756-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index eb5a6fc8d6f9..c8f743ef3cc8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10514,6 +10514,7 @@ S:	Maintained
 F:	drivers/rpmsg/
 F:	Documentation/rpmsg.txt
 F:	include/linux/rpmsg.h
+F:	include/linux/rpmsg/
 
 RENESAS CLOCK DRIVERS
 M:	Geert Uytterhoeven <geert+renesas@glider.be>
-- 
2.11.0
