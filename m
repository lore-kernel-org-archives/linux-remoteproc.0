Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH 2/7] remoteproc: add release ops in rproc_mem_entry struct
Date: Fri, 27 Oct 2017 14:44:09 +0200
Message-ID: <1509108254-22296-3-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1509108254-22296-1-git-send-email-loic.pallardy@st.com>
References: <1509108254-22296-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Memory entry could be allocated in different ways (ioremap,
dma_alloc_coherent, internal RAM allocator...).
This patch introduces a release ops in rproc_mem_entry structure
to associate dedicated release mechanism to each memory entry descriptor
in order to keep remoteproc core generic.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 26 ++++++++++++++++++++++----
 include/linux/remoteproc.h           |  6 ++++--
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index faa18a7..f23daf9 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -592,6 +592,25 @@ static int rproc_handle_devmem(struct rproc *rproc, struct fw_rsc_devmem *rsc,
 }
 
 /**
+ * rproc_release_carveout() - release acquired carveout
+ * @rproc: rproc handle
+ * @mem: the memory entry to release
+ *
+ * This function releases specified memory entry @mem allocated via
+ * dma_alloc_coherent() function by @rproc.
+ */
+static int rproc_release_carveout(struct rproc *rproc, struct rproc_mem_entry *mem)
+{
+	struct device *dev = &rproc->dev;
+
+	/* clean up carveout allocations */
+	dma_free_coherent(dev->parent, mem->len, mem->va, mem->dma);
+	list_del(&mem->node);
+	kfree(mem);
+	return 0;
+}
+
+/**
  * rproc_handle_carveout() - handle phys contig memory allocation requests
  * @rproc: rproc handle
  * @rsc: the resource entry
@@ -717,6 +736,7 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	carveout->len = rsc->len;
 	carveout->dma = dma;
 	carveout->da = rsc->da;
+	carveout->release = rproc_release_carveout;
 
 	list_add_tail(&carveout->node, &rproc->carveouts);
 
@@ -847,10 +867,8 @@ static void rproc_resource_cleanup(struct rproc *rproc)
 
 	/* clean up carveout allocations */
 	list_for_each_entry_safe(entry, tmp, &rproc->carveouts, node) {
-		dma_free_coherent(dev->parent, entry->len, entry->va,
-				  entry->dma);
-		list_del(&entry->node);
-		kfree(entry);
+		if (entry->release)
+			entry->release(rproc, entry);
 	}
 
 	/* clean up remote vdev entries */
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 44e630e..8780f2e 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -305,12 +305,15 @@ struct fw_rsc_vdev {
 	struct fw_rsc_vdev_vring vring[0];
 } __packed;
 
+struct rproc;
+
 /**
  * struct rproc_mem_entry - memory entry descriptor
  * @va:	virtual address
  * @dma: dma address
  * @len: length, in bytes
  * @da: device address
+ * @release: release associated memory
  * @priv: associated data
  * @node: list node
  */
@@ -319,12 +322,11 @@ struct rproc_mem_entry {
 	dma_addr_t dma;
 	int len;
 	u32 da;
+	int (*release)(struct rproc *rproc, struct rproc_mem_entry *mem);
 	void *priv;
 	struct list_head node;
 };
 
-struct rproc;
-
 /**
  * struct rproc_ops - platform-specific device handlers
  * @start:	power on the device and boot it
-- 
1.9.1
