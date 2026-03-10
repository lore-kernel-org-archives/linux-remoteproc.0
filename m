Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BD03E9597
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 07:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129390; cv=none; b=bDO9UQqfBmhm48WnAYRzFXbpG6vgmvTwChMNISMojwHge7g49PBikzoRGlHxt+iObPNHPMQeBirwwAyy3yPxkHbEM3VrX+QHY7sgYL8+ephzueUid63TZx0FA8JuH0Nbeh0imGyNKXVM/CrPjcvOkbV05K5T37uQWUabj5ZRcko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129390; c=relaxed/simple;
	bh=XSXpLvgEtf8gkGC6vqgXnLn+x0RQgYmg32UvC5obOks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kInICDYob+B82LcEZgHzCQV8SL2ibjzAkyLz751J5Q0w6uTtheXJJvJ8RMVuQyyHJo4DDx2D1DzSdae3qdPaSlZu2blrTImOmhpehL+6VCNKmGnv2s6t+PN2ibRP+awAthtqXvTnMTdogx3Y19a/njB9OVf4NFHPUEJFKawdiSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eWQYik1A; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eWQYik1A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=V9/Xk0SE3kHSqCT1iJcjM3q5nVH3IOMXei18cV6OdNM=; b=eWQYik
	1AZPSENCe6cEzL688W7NYdO7yqcoBHjbjmN5uDg9pGbNdVRgfoJ1IO8H2EFYu4LS
	gEptWTj8WC73202sPxE2eHKgUlLz7U2LY2gDIHCkheST/ETnMZe+CBQ0cJVQ+ypw
	q01yIFWjK8SlZUg1kiE2WTGv0cqRHvcsmdk/lLOwtoUSUBQnTbRJDGwe9APe5kti
	jEuGfxE3d/rmeF63HM/l6AsxE1LBagdMb3psr/y1KJp3/kkbL7a8m3ceiZp9SD3t
	FF7wwlfNnO1rieHNpPZQvGAK7WAtYeBGIUpv+q+usOpix6Ny2zWSu+z6iiq7ceK4
	PXKHVhKqi/+KQlmw==
Received: (qmail 3112803 invoked from network); 10 Mar 2026 08:55:59 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2026 08:55:59 +0100
X-UD-Smtp-Session: l3s3148p1@Wb6e2aZM7NIujntP
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v4 13/15] hwspinlock: sort include and update copyright
Date: Tue, 10 Mar 2026 08:55:28 +0100
Message-ID: <20260310075539.11701-14-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the latest refactoring, unsorted includes were a bit annoying.
So, sort them to avoid this. Also, update the copyright due to said
refactorings and remove the contact field in favor of MAINTAINERS
entries.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 838bb2ab5eba..adf6fefb382f 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -3,26 +3,26 @@
  * Hardware spinlock framework
  *
  * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com
- *
- * Contact: Ohad Ben-Cohen <ohad@wizery.com>
+ * Copyright (C) 2026 Sang Engineering
+ * Copyright (C) 2026 Renesas Solutions Corp.
  */
 
 #define pr_fmt(fmt)    "%s: " fmt, __func__
 
 #include <linux/delay.h>
 #include <linux/device.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/spinlock.h>
-#include <linux/types.h>
 #include <linux/err.h>
-#include <linux/jiffies.h>
-#include <linux/radix-tree.h>
 #include <linux/hwspinlock.h>
-#include <linux/pm_runtime.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/pm_runtime.h>
+#include <linux/radix-tree.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
 
 struct hwspinlock_device;
 
-- 
2.47.3

