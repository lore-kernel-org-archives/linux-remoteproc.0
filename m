Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v4 2/4] remoteproc: Introduce "panic" callback in ops
Date: Mon,  9 Mar 2020 23:38:15 -0700
Message-Id: <20200310063817.3344712-3-bjorn.andersson@linaro.org>
In-Reply-To: <20200310063817.3344712-1-bjorn.andersson@linaro.org>
References: <20200310063817.3344712-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Introduce generic support for handling kernel panics in remoteproc
drivers, in order to allow operations needed for aiding in post mortem
system debugging, such as flushing caches etc.

The function can return a number of milliseconds needed by the remote to
"settle" and the core will wait the longest returned duration before
returning from the panic handler.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Change since v3:
- Migrate from mutex_trylock() to using RCU
- Turned the timeout to unsigned long

 drivers/remoteproc/remoteproc_core.c | 44 ++++++++++++++++++++++++++++
 include/linux/remoteproc.h           |  3 ++
 2 files changed, 47 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f0a77c30c6b1..2024a98930bf 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -16,6 +16,7 @@
 
 #define pr_fmt(fmt)    "%s: " fmt, __func__
 
+#include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/device.h>
@@ -43,6 +44,7 @@
 
 static DEFINE_MUTEX(rproc_list_mutex);
 static LIST_HEAD(rproc_list);
+static struct notifier_block rproc_panic_nb;
 
 typedef int (*rproc_handle_resource_t)(struct rproc *rproc,
 				 void *, int offset, int avail);
@@ -2219,10 +2221,51 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
 }
 EXPORT_SYMBOL(rproc_report_crash);
 
+static int rproc_panic_handler(struct notifier_block *nb, unsigned long event,
+			       void *ptr)
+{
+	unsigned int longest = 0;
+	struct rproc *rproc;
+	unsigned int d;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(rproc, &rproc_list, node) {
+		if (!rproc->ops->panic || rproc->state != RPROC_RUNNING)
+			continue;
+
+		d = rproc->ops->panic(rproc);
+		longest = max(longest, d);
+	}
+	rcu_read_unlock();
+
+	/*
+	 * Delay for the longest requested duration before returning.
+	 * This can be used by the remoteproc drivers to give the remote
+	 * processor time to perform any requested operations (such as flush
+	 * caches), where means for signalling the Linux side isn't available
+	 * while in panic.
+	 */
+	mdelay(longest);
+
+	return NOTIFY_DONE;
+}
+
+static void __init rproc_init_panic(void)
+{
+	rproc_panic_nb.notifier_call = rproc_panic_handler;
+	atomic_notifier_chain_register(&panic_notifier_list, &rproc_panic_nb);
+}
+
+static void __exit rproc_exit_panic(void)
+{
+	atomic_notifier_chain_unregister(&panic_notifier_list, &rproc_panic_nb);
+}
+
 static int __init remoteproc_init(void)
 {
 	rproc_init_sysfs();
 	rproc_init_debugfs();
+	rproc_init_panic();
 
 	return 0;
 }
@@ -2232,6 +2275,7 @@ static void __exit remoteproc_exit(void)
 {
 	ida_destroy(&rproc_dev_index);
 
+	rproc_exit_panic();
 	rproc_exit_debugfs();
 	rproc_exit_sysfs();
 }
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 16ad66683ad0..5959d6247dc0 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -369,6 +369,8 @@ enum rsc_handling_status {
  *			expects to find it
  * @sanity_check:	sanity check the fw image
  * @get_boot_addr:	get boot address to entry point specified in firmware
+ * @panic:	optional callback to react to system panic, core will delay
+ *		panic at least the returned number of milliseconds
  */
 struct rproc_ops {
 	int (*start)(struct rproc *rproc);
@@ -383,6 +385,7 @@ struct rproc_ops {
 	int (*load)(struct rproc *rproc, const struct firmware *fw);
 	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
 	u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
+	unsigned long (*panic)(struct rproc *rproc);
 };
 
 /**
-- 
2.24.0
