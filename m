Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v4 03/17] remoteproc: add release ops in rproc_mem_entry struct
Date: Fri, 27 Jul 2018 15:14:38 +0200
Message-ID: <1532697292-14272-4-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Memory entry could be allocated in different ways (ioremap,
dma_alloc_coherent, internal RAM allocator...).
This patch introduces a release ops in rproc_mem_entry structure
to associate dedicated release mechanism to each memory entry descriptor
in order to keep remoteproc core generic.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 23 +++++++++++++++++++++--
 include/linux/remoteproc.h           |  5 ++++-
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 8e5fe1e..24fe11f 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -600,6 +600,24 @@ static int rproc_handle_devmem(struct rproc *rproc, struct fw_rsc_devmem *rsc,
 }
 
 /**
+ * rproc_release_carveout() - release acquired carveout
+ * @rproc: rproc handle
+ * @mem: the memory entry to release
+ *
+ * This function releases specified memory entry @mem allocated via
+ * dma_alloc_coherent() function by @rproc.
+ */
+static int rproc_release_carveout(struct rproc *rproc,
+				  struct rproc_mem_entry *mem)
+{
+	struct device *dev = &rproc->dev;
+
+	/* clean up carveout allocations */
+	dma_free_coherent(dev->parent, mem->len, mem->va, mem->dma);
+	return 0;
+}
+
+/**
  * rproc_handle_carveout() - handle phys contig memory allocation requests
  * @rproc: rproc handle
  * @rsc: the resource entry
@@ -733,6 +751,7 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	carveout->len = rsc->len;
 	carveout->dma = dma;
 	carveout->da = rsc->da;
+	carveout->release = rproc_release_carveout;
 
 	list_add_tail(&carveout->node, &rproc->carveouts);
 
@@ -920,8 +939,8 @@ static void rproc_resource_cleanup(struct rproc *rproc)
 
 	/* clean up carveout allocations */
 	list_for_each_entry_safe(entry, tmp, &rproc->carveouts, node) {
-		dma_free_coherent(dev->parent, entry->len, entry->va,
-				  entry->dma);
+		if (entry->release)
+			entry->release(rproc, entry);
 		list_del(&entry->node);
 		kfree(entry);
 	}
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index e3c5d85..bef2e83 100644
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
@@ -321,9 +324,9 @@ struct rproc_mem_entry {
 	u32 da;
 	void *priv;
 	struct list_head node;
+	int (*release)(struct rproc *rproc, struct rproc_mem_entry *mem);
 };
 
-struct rproc;
 struct firmware;
 
 /**
-- 
1.9.1
