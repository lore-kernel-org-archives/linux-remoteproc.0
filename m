Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6AA3F0ABB
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 10:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146779; cv=none; b=DzW7oaloPYQHTQxquFRrBcSXNH8eCalQ4Uti4k0wSGQgcF+pZEvk8YAKDfy71EYVlAlpzhQ8hRDMEBfqQbKm5btY5pKPNUFZ8tFIFFwy5G8exqqsRc8DZHoUcgZv7raARwFRdWATUVI2//dTtEgbw3AOESWH7FfkvTq9ZL2ctB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146779; c=relaxed/simple;
	bh=AzQyR76sIBhoUnMzmWCATucej0sLcytMqOauwYDbNzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IKs+7qptT2H7XK7KUq3U0x4zIqAw0jMA1hXdanNtPSsanhTwDPZYP8k+5T1rp/JgWsknyKlR4v9OoThsvpeemn8yjQRiZIcEKfxQQah+U+L0PS08zY8ys//vUtiO/whDXabHDjNPeiEm4NCN9hDjz2Q+HvU2dyZky3Ey/yOA+30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Gl/1C+6N; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Gl/1C+6N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=HbdOUJOzWHwZqp8weQu585k4968eb/m4O94X09O3CME=; b=Gl/1C+
	6NmkLwGzc/FjuWg8erYr9uq6wjylpIUF1LcLNJsrOQyaGY99MGzcLtEvpG9Yqjv5
	vkXquYxF5QDB89rL59EmnE6JO1iXAdkoDGEDGKwI67jP5jLrSkQt45hMFmJ/3P4B
	ZSioYY6H47Hln0lF7QxxeIEPe5TsIMw6JRXrnssIhqK+jHFgbPDca+SSzcoOBzrD
	+g+FcmglsRc8mvsxoK80eniMoVyUFFh8F+j2bvtZa2tyjEhpCvcD2oVZnbTy24O3
	nATY/Lx5g4nnSHqMUoye1HvalQ3pxPrkGTptIbI0N+Pc30qRX7cPOp+TRbV8ke9T
	2DDqBYorhBrlKlJg==
Received: (qmail 564000 invoked from network); 27 Jul 2026 12:06:12 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jul 2026 12:06:12 +0200
X-UD-Smtp-Session: l3s3148p1@svc735RXrJAujnuy
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v6 2/3] hwspinlock: add list of mailboxes to debugfs
Date: Mon, 27 Jul 2026 12:06:00 +0200
Message-ID: <20260727100559.3119-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727100559.3119-5-wsa+renesas@sang-engineering.com>
References: <20260727100559.3119-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To help debugging, offer a list of registered hwspinlocks in debugfs. It
will also print the responsible hwspinlock_device and if the spinlock is
currently used. It does not show if the lock is taken because of
side-effects. Often, reading a lock means actually taking it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v5:
* none

 drivers/hwspinlock/hwspinlock_core.c | 67 ++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 22e6c7690f1a..947b4d4fa153 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -9,6 +9,7 @@
 
 #define pr_fmt(fmt)    "%s: " fmt, __func__
 
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -21,6 +22,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/seq_file.h>
 
 #include "hwspinlock_internal.h"
 
@@ -860,5 +862,70 @@ struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_hwspin_lock_request_specific);
 
+#ifdef CONFIG_DEBUG_FS
+static void *hwspin_lock_seq_start(struct seq_file *s, loff_t *ppos)
+{
+	unsigned long index = *ppos;
+	struct hwspinlock *hwlock;
+
+	rcu_read_lock();
+	hwlock = xa_find(&hwspinlocks, &index, ULONG_MAX, XA_PRESENT);
+	*ppos = index;
+
+	return hwlock;
+}
+
+static void *hwspin_lock_seq_next(struct seq_file *s, void *v, loff_t *ppos)
+{
+	/* Increase ppos here to avoid endless loops. Don't use xa_find_after() */
+	unsigned long index = *ppos + 1;
+	struct hwspinlock *hwlock;
+
+	hwlock = xa_find(&hwspinlocks, &index, ULONG_MAX, XA_PRESENT);
+	*ppos = index;
+
+	return hwlock;
+}
+
+static void hwspin_lock_seq_stop(struct seq_file *s, void *v)
+{
+	rcu_read_unlock();
+}
+
+static int hwspin_lock_seq_show(struct seq_file *s, void *v)
+{
+	struct hwspinlock *hwlock = v;
+	bool unused = xa_get_mark(&hwspinlocks, s->index, HWSPINLOCK_UNUSED);
+
+	seq_printf(s, "%4llu:\t%s\t%s\n", s->index, unused ? "free" : "in use",
+		   dev_name(hwlock->bank->dev));
+	return 0;
+}
+
+static const struct seq_operations hwspinlock_sops = {
+	.start = hwspin_lock_seq_start,
+	.next = hwspin_lock_seq_next,
+	.stop = hwspin_lock_seq_stop,
+	.show = hwspin_lock_seq_show,
+};
+DEFINE_SEQ_ATTRIBUTE(hwspinlock);
+
+/*
+ * subsys_initcall() is used here but controllers may already have been
+ * registered earlier or will be later. The rationale is that debugfs is
+ * accessed only late, i.e. from userspace. So, files created here must make no
+ * assumptions about initcall ordering.
+ */
+static int __init hwspin_lock_init(void)
+{
+	struct dentry *hwspinlock_debugfs = debugfs_create_dir("hwspinlock", NULL);
+
+	debugfs_create_file("hwspinlock_summary", 0444, hwspinlock_debugfs,
+			    NULL, &hwspinlock_fops);
+	return 0;
+}
+subsys_initcall(hwspin_lock_init);
+#endif	/* DEBUG_FS */
+
 MODULE_DESCRIPTION("Hardware spinlock interface");
 MODULE_AUTHOR("Ohad Ben-Cohen <ohad@wizery.com>");
-- 
2.47.3

