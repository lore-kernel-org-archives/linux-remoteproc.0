Return-Path: <baolin.wang7@gmail.com>
Return-Path: <baolin.wang7@gmail.com>
From: Baolin Wang <baolin.wang7@gmail.com>
Subject: [PATCH 2/2] MAINTAINERS: Add myself as reviewer for the hwspinlock subsystem
Date: Wed,  4 Dec 2019 18:10:41 +0800
Message-Id: <0a6d0c22100da5196f00dfe0eb431e5e6d6d8c65.1575454108.git.baolin.wang7@gmail.com>
In-Reply-To: <808692052649aa2e80693a2734cb392e5eddd83c.1575454108.git.baolin.wang7@gmail.com>
References: <808692052649aa2e80693a2734cb392e5eddd83c.1575454108.git.baolin.wang7@gmail.com>
In-Reply-To: <808692052649aa2e80693a2734cb392e5eddd83c.1575454108.git.baolin.wang7@gmail.com>
References: <808692052649aa2e80693a2734cb392e5eddd83c.1575454108.git.baolin.wang7@gmail.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: baolin.wang7@gmail.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

I spend some time to do some optimization for the hwspinlock subsystem
in the nearest past, and I am willing to be a reviewer.

Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>
---
 MAINTAINERS |    1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 061d59a..c2bd3e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7284,6 +7284,7 @@ F:	drivers/hwtracing/
 HARDWARE SPINLOCK CORE
 M:	Ohad Ben-Cohen <ohad@wizery.com>
 M:	Bjorn Andersson <bjorn.andersson@linaro.org>
+R:	Baolin Wang <baolin.wang7@gmail.com>
 L:	linux-remoteproc@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git hwspinlock-next
-- 
1.7.9.5
