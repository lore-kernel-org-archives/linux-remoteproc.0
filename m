Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD683C5DD3
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 11:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773918041; cv=none; b=qWvwV5297CeA/nhxk/6LNHYIkj576cBlyTa+QsOLSM8OgkADwz/ingWh12lUcZxbU7WbEyfUP+IxToZrouU2xD/wB5LX9UzTwaMkVj8YgpR6mqjRKhog/rhX1OOPkgzeL/o9HwY1gTef885GVYZ75jF/Vgaiq83QjI83RGidzUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773918041; c=relaxed/simple;
	bh=cGbDtwydlJZBcEqlFjz378ZiockJrW9wvEor5EyRyG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A598PV6EBOdaDWEAiWL/Hhh5BubKLD7Nxkmq990V9SFmOAJaCRj8Lodgu5AtGCoyFOY9Av5qyULtcs8BWPn7j4pOLhL0CITReNNm2pwvT8qYpGSnweb4vfvreGyxi+OiVVZrvKHLfGdCiALMr0OnzGKHOJKc+H/mohmpbCv+od4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Mbq0SY5U; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Mbq0SY5U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ZQ5IlfCArlNYSNVvw0cWn0DqfDcbz6f67ibVvyNg+b0=; b=Mbq0SY
	5Uno1ei4rCyN213rlbTCj3LFC9wO1g1i09HMCMAZS9UZwLl2SbPjrDWfmQ7NtxRQ
	nShsRUTuxd8mVFRzDZktej+Jj+3Ov0iOaqB3A7TXVpzKpT9JGZCSp3D/CnW99HVR
	W2/oW2+wOxPCmY4uAF60q2WbF77CM/HyFMhxwHDIQpcdV/BGjXMNL0kKjv2pLyO6
	i7q1aK6dDW7eR+nkhMUDsJ9Myll7VYxKP/0kksHlpnPuS5RpgezPpro9JZWnz7ZF
	Ey/swtknAyi1VEZ2mBtXoHX8TTfDYkdNERXbVun2vYtuXB/N/fZ9eLfXmsQpQOxZ
	gEHmdM0Ntp7Yf1gg==
Received: (qmail 1099952 invoked from network); 19 Mar 2026 12:00:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2026 12:00:10 +0100
X-UD-Smtp-Session: l3s3148p1@C9bfeF5Nzq0gAwDPXzF+ANZpdrMKUeLI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v5 13/15] hwspinlock: sort include and update copyright
Date: Thu, 19 Mar 2026 11:59:35 +0100
Message-ID: <20260319105947.6237-14-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
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

