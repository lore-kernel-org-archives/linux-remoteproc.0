Return-Path: <tiny.windzz@gmail.com>
Return-Path: <tiny.windzz@gmail.com>
From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH] remoteproc: convert to DEFINE_SHOW_ATTRIBUTE
Date: Sat,  1 Dec 2018 10:58:38 -0500
Message-Id: <20181201155838.8619-1-tiny.windzz@gmail.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/remoteproc/remoteproc_debugfs.c | 28 ++++---------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index e90135c64af0..f936c2e485ac 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -240,17 +240,7 @@ static int rproc_rsc_table_show(struct seq_file *seq, void *p)
 	return 0;
 }
 
-static int rproc_rsc_table_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, rproc_rsc_table_show, inode->i_private);
-}
-
-static const struct file_operations rproc_rsc_table_ops = {
-	.open		= rproc_rsc_table_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(rproc_rsc_table);
 
 /* Expose carveout content via debugfs */
 static int rproc_carveouts_show(struct seq_file *seq, void *p)
@@ -270,17 +260,7 @@ static int rproc_carveouts_show(struct seq_file *seq, void *p)
 	return 0;
 }
 
-static int rproc_carveouts_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, rproc_carveouts_show, inode->i_private);
-}
-
-static const struct file_operations rproc_carveouts_ops = {
-	.open		= rproc_carveouts_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(rproc_carveouts);
 
 void rproc_remove_trace_file(struct dentry *tfile)
 {
@@ -326,9 +306,9 @@ void rproc_create_debug_dir(struct rproc *rproc)
 	debugfs_create_file("recovery", 0400, rproc->dbg_dir,
 			    rproc, &rproc_recovery_ops);
 	debugfs_create_file("resource_table", 0400, rproc->dbg_dir,
-			    rproc, &rproc_rsc_table_ops);
+			    rproc, &rproc_rsc_table_fops);
 	debugfs_create_file("carveout_memories", 0400, rproc->dbg_dir,
-			    rproc, &rproc_carveouts_ops);
+			    rproc, &rproc_carveouts_fops);
 }
 
 void __init rproc_init_debugfs(void)
-- 
2.17.0
