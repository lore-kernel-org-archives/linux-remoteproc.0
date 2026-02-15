Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA793043C9
	for <linux-remoteproc@vger.kernel.org>; Sun, 15 Feb 2026 22:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771196138; cv=none; b=Esl6wfeggKzJW23pAa965+TeNZEARM1zvwydV224reykCcdP4VMe7WyS4kV9RRNiuCq9jPexlOsrneSvdR5ja4UjhI2sKgpCHRJWGludtLuernmCpfxvpOfX6OsvCxPLY31WRr6ZD0fKB+WGqOukKRMcB2akP/rSTGbvXOxE4Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771196138; c=relaxed/simple;
	bh=psLxIyqJNNZuIdfYbYVd4a/LEBsH2BQjEtuLh1wEfx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Apc3rETZXgi5gL0JSqhu+3Cqw/NGO0mPh2kontsDTNCYe5yKiSs0gmjyuvErB1ZnUdGq5L3shosr5BG4Gs5Zp8Xa1J2BrQOn5Ec1oPerXYA6u8aEluMR7SImdMnCEMGDyXmpx5qVPuqk1cqffkBYlw32X+U/bhHLIOcOjTpf468=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KQv1WKkJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KQv1WKkJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=H4TWCWQvEKEnt9v/1rNXK1WIu2jDn+wGyrjvF/JjC0Y=; b=KQv1WK
	kJgiwsH/MMJgj3k6X21h0JWwah35yIDAjFGLj1ZXnuPmICVhAhoHUhp6FPopF1/6
	WljoaNzfXiPAsWJIrSTIzF091weMGVRIaXOqdlwx8ptVpiy/AzA9Fgn9Pom/ndEn
	yWxAciQJltdjwfbC3TD+f5rxO35GJ16aFkn9U06jUjh37m1sGVtGhZxDNDs2aHb+
	UcbSEbcDVI/TWce1fn5P/h8c/LXRgtoNVJ5YdpsGCoG/okjj+1wbLeBI8GX+2h4/
	L7NMB7kFXdhefFM6KlIq0V0skuDg8PXhw+4srKhR3vJTzywJO9D0Nro1Q83HMoiy
	NT7JjY4Q3/TWEDmw==
Received: (qmail 3011627 invoked from network); 15 Feb 2026 23:55:18 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Feb 2026 23:55:18 +0100
X-UD-Smtp-Session: l3s3148p1@fdlsu+RKEsEujns5
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [RFC PATCH v2 11/13] hwspinlock: sort include and update copyright
Date: Sun, 15 Feb 2026 23:54:51 +0100
Message-ID: <20260215225501.6365-12-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the latest refactoring, unsorted includes were a bit annoying.
So, sort them to avoid this. Also, update the copyright due to said
refactorings.

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

