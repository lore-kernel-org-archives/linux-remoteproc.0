Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 2/2] remoteproc: debug: add carveouts list dump feature
Date: Mon, 6 Nov 2017 18:09:56 +0100
Message-ID: <1509988196-24377-3-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1509988196-24377-1-git-send-email-loic.pallardy@st.com>
References: <1509988196-24377-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch offers the capability to dump memory carveouts associated
to one remoteprocessor.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
V2 :
- Fix 0-DAY reported issues on open function prototype

 drivers/remoteproc/remoteproc_debugfs.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index dc5e259..a204883 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -252,6 +252,35 @@ static int rproc_rsc_table_open(struct inode *inode, struct file *file)
 	.release	= single_release,
 };
 
+/* Expose carveout content via debugfs */
+static int rproc_carveouts_show(struct seq_file *seq, void *p)
+{
+	struct rproc *rproc = seq->private;
+	struct rproc_mem_entry *carveout;
+
+	list_for_each_entry(carveout, &rproc->carveouts, node) {
+		seq_puts(seq, "Carveout memory entry:\n");
+		seq_printf(seq, "\tVirtual address: %p\n", carveout->va);
+		seq_printf(seq, "\tDMA address: %pad\n", &carveout->dma);
+		seq_printf(seq, "\tDevice address: 0x%x\n", carveout->da);
+		seq_printf(seq, "\tLength: 0x%x Bytes\n\n", carveout->len);
+	}
+
+	return 0;
+}
+
+static int rproc_carveouts_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, rproc_carveouts_show, inode->i_private);
+}
+
+static const struct file_operations rproc_carveouts_ops = {
+	.open		= rproc_carveouts_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
 void rproc_remove_trace_file(struct dentry *tfile)
 {
 	debugfs_remove(tfile);
@@ -297,6 +326,8 @@ void rproc_create_debug_dir(struct rproc *rproc)
 			    rproc, &rproc_recovery_ops);
 	debugfs_create_file("resource_table", 0400, rproc->dbg_dir,
 			    rproc, &rproc_rsc_table_ops);
+	debugfs_create_file("carveout_memories", 0400, rproc->dbg_dir,
+			    rproc, &rproc_carveouts_ops);
 }
 
 void __init rproc_init_debugfs(void)
-- 
1.9.1
