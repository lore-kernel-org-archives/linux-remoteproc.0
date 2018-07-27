Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v4 04/17] remoteproc: add name in rproc_mem_entry struct
Date: Fri, 27 Jul 2018 15:14:39 +0200
Message-ID: <1532697292-14272-5-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Add name field in struct rproc_mem_entry.
This new field will be used to match memory area
requested in resource table with pre-registered carveout.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c    | 1 +
 drivers/remoteproc/remoteproc_debugfs.c | 1 +
 include/linux/remoteproc.h              | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 24fe11f..d7e3138 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -752,6 +752,7 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	carveout->dma = dma;
 	carveout->da = rsc->da;
 	carveout->release = rproc_release_carveout;
+	strlcpy(carveout->name, rsc->name, sizeof(carveout->name));
 
 	list_add_tail(&carveout->node, &rproc->carveouts);
 
diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index a5c29f2..e90135c 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -260,6 +260,7 @@ static int rproc_carveouts_show(struct seq_file *seq, void *p)
 
 	list_for_each_entry(carveout, &rproc->carveouts, node) {
 		seq_puts(seq, "Carveout memory entry:\n");
+		seq_printf(seq, "\tName: %s\n", carveout->name);
 		seq_printf(seq, "\tVirtual address: %pK\n", carveout->va);
 		seq_printf(seq, "\tDMA address: %pad\n", &carveout->dma);
 		seq_printf(seq, "\tDevice address: 0x%x\n", carveout->da);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index bef2e83..0e21098 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -315,6 +315,7 @@ struct fw_rsc_vdev {
  * @da: device address
  * @release: release associated memory
  * @priv: associated data
+ * @name: associated memory region name (optional)
  * @node: list node
  */
 struct rproc_mem_entry {
@@ -323,6 +324,7 @@ struct rproc_mem_entry {
 	int len;
 	u32 da;
 	void *priv;
+	char name[32];
 	struct list_head node;
 	int (*release)(struct rproc *rproc, struct rproc_mem_entry *mem);
 };
-- 
1.9.1
