Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FFD3CE4A6
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 07:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129390; cv=none; b=Tf74//kO+Ai5hPccsFc/4jUV2O3WZALQjhMXj7w2CGOghCKe1cpxboLSIflp/0OwB86RSYnW9duQ1iNrOhqrwfizFVzz3SAjA0nXZJxyfUf0uPf5423cmJi9yo084x7bJh8ozg/sYJLGNTCbkuhM0Ad5uOmdvP0qxSG/2pVqZ9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129390; c=relaxed/simple;
	bh=0BpfEzdJ/CP5RPB9drxCOpncawCXIiZayrIjpodhx44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iqH090KUvIa2Y2wBAVmExiwXjY8jM3jp/pJBLR5BR35qevazTUfk5k4OcH9qLYLzHJVnHQHkeNKtM26PSLZe/qttGu9b50pt0EhSD8LLg9DP44jPpswsLb8emCPOQpQ6zOptx5kValjoUgAVTg3p6YJQvkNkMcXoBMqz1wGtzd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UnEZMyv/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UnEZMyv/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=OXWaEhH47IDPa7+2B714kGuQz0Ni4DVVK4CBG1WhWRQ=; b=UnEZMy
	v/b7iDBZu1qNdX9qFNI2z0E1qs8n9XIC4bqAFrgJkUOeLK3BpcaH84Lp2gO+kI+Y
	KecYeNCGeci3IGESq/ha84a0ZRPi4Nybu38zvDQ4PXAi5XlT672nv8humm4eWo6d
	pa9MzFlc5rCN/cG+gOnY8FuLpljHrTNZj0DJZ1C8DrTzPReA1QEphcLTF5PuVM7I
	vCQvFFk2hsncf+Z0Jk/3FWuNGBIziWG3Auxbfmd3WGZZomskrZ9gkE6SHjmSvltN
	PKZ/7ivuv6AAmP6y0X6fz56rojKp4p11yV8XUlCfAxIDLzj4s5nmv0vrzLEOzRwP
	YpEVvOG4eF/pWXpQ==
Received: (qmail 3112790 invoked from network); 10 Mar 2026 08:55:59 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Mar 2026 08:55:59 +0100
X-UD-Smtp-Session: l3s3148p1@aIqU2aZM6tIujntP
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v4 12/15] hwspinlock: remove internal header
Date: Tue, 10 Mar 2026 08:55:27 +0100
Message-ID: <20260310075539.11701-13-wsa+renesas@sang-engineering.com>
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

Because the internal header is now used by the core only, it can also be
merged into source file itself. The header was small enough.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c     | 31 +++++++++++++++-
 drivers/hwspinlock/hwspinlock_internal.h | 46 ------------------------
 2 files changed, 30 insertions(+), 47 deletions(-)
 delete mode 100644 drivers/hwspinlock/hwspinlock_internal.h

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index e0227d027cf2..838bb2ab5eba 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -10,6 +10,7 @@
 #define pr_fmt(fmt)    "%s: " fmt, __func__
 
 #include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
@@ -23,7 +24,35 @@
 #include <linux/of.h>
 #include <linux/slab.h>
 
-#include "hwspinlock_internal.h"
+struct hwspinlock_device;
+
+/**
+ * struct hwspinlock - this struct represents a single hwspinlock instance
+ * @bank: the hwspinlock_device structure which owns this lock
+ * @lock: initialized and used by hwspinlock core
+ * @priv: private data, owned by the underlying platform-specific hwspinlock drv
+ */
+struct hwspinlock {
+	struct hwspinlock_device *bank;
+	spinlock_t lock;
+	void *priv;
+};
+
+/**
+ * struct hwspinlock_device - a device which usually spans numerous hwspinlocks
+ * @dev: underlying device, will be used to invoke runtime PM api
+ * @ops: platform-specific hwspinlock handlers
+ * @base_id: id index of the first lock in this device
+ * @num_locks: number of locks in this device
+ * @lock: dynamically allocated array of 'struct hwspinlock'
+ */
+struct hwspinlock_device {
+	struct device *dev;
+	const struct hwspinlock_ops *ops;
+	int base_id;
+	int num_locks;
+	struct hwspinlock lock[];
+};
 
 /* retry delay used in atomic context */
 #define HWSPINLOCK_RETRY_DELAY_US	100
diff --git a/drivers/hwspinlock/hwspinlock_internal.h b/drivers/hwspinlock/hwspinlock_internal.h
deleted file mode 100644
index 20ae531fc389..000000000000
--- a/drivers/hwspinlock/hwspinlock_internal.h
+++ /dev/null
@@ -1,46 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Hardware spinlocks internal header
- *
- * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com
- *
- * Contact: Ohad Ben-Cohen <ohad@wizery.com>
- */
-
-#ifndef __HWSPINLOCK_HWSPINLOCK_H
-#define __HWSPINLOCK_HWSPINLOCK_H
-
-#include <linux/spinlock.h>
-#include <linux/device.h>
-
-struct hwspinlock_device;
-
-/**
- * struct hwspinlock - this struct represents a single hwspinlock instance
- * @bank: the hwspinlock_device structure which owns this lock
- * @lock: initialized and used by hwspinlock core
- * @priv: private data, owned by the underlying platform-specific hwspinlock drv
- */
-struct hwspinlock {
-	struct hwspinlock_device *bank;
-	spinlock_t lock;
-	void *priv;
-};
-
-/**
- * struct hwspinlock_device - a device which usually spans numerous hwspinlocks
- * @dev: underlying device, will be used to invoke runtime PM api
- * @ops: platform-specific hwspinlock handlers
- * @base_id: id index of the first lock in this device
- * @num_locks: number of locks in this device
- * @lock: dynamically allocated array of 'struct hwspinlock'
- */
-struct hwspinlock_device {
-	struct device *dev;
-	const struct hwspinlock_ops *ops;
-	int base_id;
-	int num_locks;
-	struct hwspinlock lock[];
-};
-
-#endif /* __HWSPINLOCK_HWSPINLOCK_H */
-- 
2.47.3

