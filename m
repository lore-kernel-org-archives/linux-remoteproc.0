Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 08/16] remoteproc: add name in rproc_mem_entry struct
Date: Thu, 30 Nov 2017 17:46:43 +0100
Message-ID: <1512060411-729-9-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Add name field in struc rproc_mem_entry.
This new field will be used to match memory area
requested in resource table with pre-registered carveout.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c    | 1 +
 drivers/remoteproc/remoteproc_debugfs.c | 1 +
 include/linux/remoteproc.h              | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index bdc99cd..cc53247 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -835,6 +835,7 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	carveout->da = rsc->da;
 	carveout->release = rproc_release_carveout;
 	carveout->priv = (void *)CARVEOUT_RSC_ALLOCATED;
+	strncpy(carveout->name, rsc->name, sizeof(carveout->name));
 
 	list_add_tail(&carveout->node, &rproc->carveouts);
 
diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index a204883..fc0e570 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -260,6 +260,7 @@ static int rproc_carveouts_show(struct seq_file *seq, void *p)
 
 	list_for_each_entry(carveout, &rproc->carveouts, node) {
 		seq_puts(seq, "Carveout memory entry:\n");
+		seq_printf(seq, "\tName: %s\n", carveout->name);
 		seq_printf(seq, "\tVirtual address: %p\n", carveout->va);
 		seq_printf(seq, "\tDMA address: %pad\n", &carveout->dma);
 		seq_printf(seq, "\tDevice address: 0x%x\n", carveout->da);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 5bd5175..66e6863 100644
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
@@ -324,6 +325,7 @@ struct rproc_mem_entry {
 	u32 da;
 	int (*release)(struct rproc *rproc, struct rproc_mem_entry *mem);
 	void *priv;
+	char name[32];
 	struct list_head node;
 };
 
-- 
1.9.1
