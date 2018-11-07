Return-Path: <xiaoxiang781216@gmail.com>
Return-Path: <xiaoxiang781216@gmail.com>
From: Xiang Xiao <xiaoxiang781216@gmail.com>
Subject: [PATCH] remoteproc: debug: add crash debugfs node
Date: Wed,  7 Nov 2018 23:26:01 +0800
Message-Id: <1541604361-1475-1-git-send-email-xiaoxiang@xiaomi.com>
To: linux-remoteproc@vger.kernel.org, bjorn.andersson@linaro.org
Cc: Xiang Xiao <xiaoxiang@xiaomi.com>
List-ID: <linux-remoteproc@vger.kernel.org>

so we can trigger the crash manully which could:
1.test the crash handling code path more easily
2.update the firmware without reboot kernel

Signed-off-by: Xiang Xiao <xiaoxiang@xiaomi.com>
---
 drivers/remoteproc/remoteproc_debugfs.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index 0808466..fca4b2b 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -154,6 +154,30 @@ static const struct file_operations rproc_recovery_ops = {
 	.llseek = generic_file_llseek,
 };
 
+/* expose the crash trigger via debugfs */
+static ssize_t
+rproc_crash_write(struct file *filp, const char __user *user_buf,
+		  size_t count, loff_t *ppos)
+{
+	struct rproc *rproc = filp->private_data;
+	unsigned int type;
+	int ret;
+
+	ret = kstrtouint_from_user(user_buf, count, 0, &type);
+	if (ret < 0)
+		return ret;
+
+	rproc_report_crash(rproc, type);
+
+	return count;
+}
+
+static const struct file_operations rproc_crash_ops = {
+	.write = rproc_crash_write,
+	.open = simple_open,
+	.llseek = generic_file_llseek,
+};
+
 /* Expose resource table content via debugfs */
 static int rproc_rsc_table_show(struct seq_file *seq, void *p)
 {
@@ -324,6 +348,8 @@ void rproc_create_debug_dir(struct rproc *rproc)
 			    rproc, &rproc_name_ops);
 	debugfs_create_file("recovery", 0400, rproc->dbg_dir,
 			    rproc, &rproc_recovery_ops);
+	debugfs_create_file("crash", 0200, rproc->dbg_dir,
+			    rproc, &rproc_crash_ops);
 	debugfs_create_file("resource_table", 0400, rproc->dbg_dir,
 			    rproc, &rproc_rsc_table_ops);
 	debugfs_create_file("carveout_memories", 0400, rproc->dbg_dir,
-- 
2.7.4
