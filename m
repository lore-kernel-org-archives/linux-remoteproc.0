Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612224F799A
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Mar 2026 19:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772566323; cv=none; b=Nx4eT2uHsZdXM39ErQhjne/wIcdOh2/KLg74amG8MQbX17JSg/4RyU1hfTX7YnAlOJBUjDgGRkHMS3EnQfru3xvhcxuIDAXTsfVzumSISN149zYn/xoEdjFquIWsA0X1AQ4Q99f8gKV6LuUn3uC6B34iDvgZnA5Y3PLTc8VrmYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772566323; c=relaxed/simple;
	bh=cGbDtwydlJZBcEqlFjz378ZiockJrW9wvEor5EyRyG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W4urXoMLpJRqkHB5Ibq5EFUpHyf+gwmVBg/tVafuRjEKRNpEmE1PNmDVyHZceMv2UnDWa1Y9KK2lhVGTdAeXtBWccW9JCxcOSrm8yNj2l0GtIei3yQzbwxqnpX+AvwuqZrS0haeOi/SwvKapnAWzyhU33iykeq4tBQkn3cOQs5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=A4hk2ueJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="A4hk2ueJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ZQ5IlfCArlNYSNVvw0cWn0DqfDcbz6f67ibVvyNg+b0=; b=A4hk2u
	eJNs/5lrPPTqohOJOkFBK0Klr5nmh16C4bWwhqYA5Awmqn0+wmfI08B2GcK9RxiD
	Fzga4KgU3LsAZxaC7tY28EJ2jte7T0YUa5rSM6oaij34RrZ6URllRaMKLEqhwvbS
	OMtkWFbmKPB+3eaF6paVZmRkQQdYtsTdJ3PN3Gzu1Bu1SJAjdcAyUTwUSd9ibYuG
	VOMLsVDPR7d9Y724VuKimxIBw6Nw76aZdilkdIGi04FxTg5pOpQ+dTNLE7SiN5d2
	457pdW7deHGjHsrRMO8A4j3vDpusrSz8ODH68WlXp09ZKfqDw3poucni6jdUcf+C
	MW4Nc+MgCfp9wNLQ==
Received: (qmail 430756 invoked from network); 3 Mar 2026 20:31:39 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Mar 2026 20:31:39 +0100
X-UD-Smtp-Session: l3s3148p1@37udwCNMPqgujnu+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v3 13/15] hwspinlock: sort include and update copyright
Date: Tue,  3 Mar 2026 20:26:05 +0100
Message-ID: <20260303192600.7224-30-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
References: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
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
2.51.0

