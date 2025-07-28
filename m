Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F7B3F9FB;
	Mon, 28 Jul 2025 02:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753668785; cv=none; b=KRyJdvYBQF2qOsD+cq6tLQm7Lqt2arFUs7ix/Xnj8ffvMN9+w/sKKcXFkF5kPFoCQC3mVEbkRqti15UWTPB35rwiCTXmt5H5mRy36dYPfYmKzi/o7vF9WzKotUu9JfHEybzTdOOQ/DH9liBPXgjGAMl9+ZR0H4iaYQJ6yeJlNXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753668785; c=relaxed/simple;
	bh=gEcRHz/pVuSpTr3/wCrBqZOo38ZiWgZGeSnXn2wr44M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h4TdKw8nNh/8ypTJvzf3HPCF+0imC/RfMEvy+dNSu9Kau4xtHmWGmLvkL+KLkv5R5lOQEign6e9/F9OXgpj/gxO4FkE3alsA5pylA1LShIbiqtxtRzSRkrROUm9urwbFPKNVT/Io20FLsynKx0VZ2FcbDekaC7QN5QkvZE5lPGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=h-partners.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h-partners.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4br22c1K4xz2Cfqw;
	Mon, 28 Jul 2025 10:08:40 +0800 (CST)
Received: from kwepemh500018.china.huawei.com (unknown [7.202.181.152])
	by mail.maildlp.com (Postfix) with ESMTPS id 69C431A016C;
	Mon, 28 Jul 2025 10:12:52 +0800 (CST)
Received: from Linux-SUSE12SP5.huawei.com (10.67.136.159) by
 kwepemh500018.china.huawei.com (7.202.181.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 28 Jul 2025 10:12:51 +0800
From: Yu Jugen <yujugen@huawei.com>
To: <ohad@wizery.com>, <bjorn.andersson@linaro.org>, <baolin.wang7@gmail.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<nixiaoming@huawei.com>, <wangliang101@huawei.com>,
	<yangkangming@huawei.com>, <yujugen@huawei.com>
Subject: [PATCH] hwspinlock: export structures that affects the KABI
Date: Mon, 28 Jul 2025 10:11:51 +0800
Message-ID: <20250728021151.115197-1-yujugen@huawei.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemh500018.china.huawei.com (7.202.181.152)

From: Jugen Yu <yujugen@huawei.com>

The member "hwlock" in struct regmap is defined with struct hwspinlock.
Both regmap_write and regmap_read use struct regmap as a argument, so
their KABI are affected by the hwspinlock structures.

Signed-off-by: Jugen Yu <yujugen@huawei.com>
---
 drivers/hwspinlock/hwspinlock_internal.h | 52 ------------------------
 include/linux/hwspinlock.h               | 50 ++++++++++++++++++++++-
 2 files changed, 49 insertions(+), 53 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_internal.h b/drivers/hwspinlock/hwspinlock_internal.h
index f298fc0ee5ad..3f22b73c8d50 100644
--- a/drivers/hwspinlock/hwspinlock_internal.h
+++ b/drivers/hwspinlock/hwspinlock_internal.h
@@ -10,58 +10,6 @@
 #ifndef __HWSPINLOCK_HWSPINLOCK_H
 #define __HWSPINLOCK_HWSPINLOCK_H
 
-#include <linux/spinlock.h>
-#include <linux/device.h>
-
-struct hwspinlock_device;
-
-/**
- * struct hwspinlock_ops - platform-specific hwspinlock handlers
- *
- * @trylock: make a single attempt to take the lock. returns 0 on
- *	     failure and true on success. may _not_ sleep.
- * @unlock:  release the lock. always succeed. may _not_ sleep.
- * @bust:    optional, platform-specific bust handler, called by hwspinlock
- *	     core to bust a specific lock.
- * @relax:   optional, platform-specific relax handler, called by hwspinlock
- *	     core while spinning on a lock, between two successive
- *	     invocations of @trylock. may _not_ sleep.
- */
-struct hwspinlock_ops {
-	int (*trylock)(struct hwspinlock *lock);
-	void (*unlock)(struct hwspinlock *lock);
-	int (*bust)(struct hwspinlock *lock, unsigned int id);
-	void (*relax)(struct hwspinlock *lock);
-};
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
 static inline int hwlock_to_id(struct hwspinlock *hwlock)
 {
 	int local_id = hwlock - &hwlock->bank->lock[0];
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index f0231dbc4777..5c95cec031fb 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -12,6 +12,8 @@
 
 #include <linux/err.h>
 #include <linux/sched.h>
+#include <linux/spinlock.h>
+#include <linux/device.h>
 
 /* hwspinlock mode argument */
 #define HWLOCK_IRQSTATE		0x01 /* Disable interrupts, save state */
@@ -23,7 +25,53 @@ struct device;
 struct device_node;
 struct hwspinlock;
 struct hwspinlock_device;
-struct hwspinlock_ops;
+
+/**
+ * struct hwspinlock_ops - platform-specific hwspinlock handlers
+ *
+ * @trylock: make a single attempt to take the lock. returns 0 on
+ *	     failure and true on success. may _not_ sleep.
+ * @unlock:  release the lock. always succeed. may _not_ sleep.
+ * @bust:    optional, platform-specific bust handler, called by hwspinlock
+ *	     core to bust a specific lock.
+ * @relax:   optional, platform-specific relax handler, called by hwspinlock
+ *	     core while spinning on a lock, between two successive
+ *	     invocations of @trylock. may _not_ sleep.
+ */
+struct hwspinlock_ops {
+	int (*trylock)(struct hwspinlock *lock);
+	void (*unlock)(struct hwspinlock *lock);
+	int (*bust)(struct hwspinlock *lock, unsigned int id);
+	void (*relax)(struct hwspinlock *lock);
+};
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
 
 /**
  * struct hwspinlock_pdata - platform data for hwspinlock drivers
-- 
2.37.7

