Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [RFC 13/18] remoteproc: Add memory default allocator helper
Date: Thu, 16 Apr 2020 18:13:26 +0200
Message-ID: <20200416161331.7606-14-arnaud.pouliquen@st.com>
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, arnaud.pouliquen@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Add a default basic allocator based on ioremap, to allocate
carveout memories. These functions can be used by
platforms that do not need specific management of the memory
region (no MPU, no IOMMU, ...)

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c     | 50 ++++++++++++++++++++++++
 drivers/remoteproc/remoteproc_internal.h |  2 +
 2 files changed, 52 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 9238aa292644..f9d04e59081c 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -220,6 +220,56 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, int len)
 }
 EXPORT_SYMBOL(rproc_da_to_va);
 
+/**
+ * rproc_default_mem_alloc() - Simple mmap of the memory
+ * @rproc: handle of a remote processor
+ * @mem: memory entry descriptor
+ *
+ * Memory allocator for  basic remote processors that do not need to manage
+ * specific memory allocation ( no MPU; no IOMMU, ....). In this case the
+ * memory is just mapped in in kernel space.
+ *
+ * Return: 0 on success else error
+ */
+int rproc_default_mem_alloc(struct rproc *rproc, struct rproc_mem_entry *mem)
+{
+	struct device *dev = rproc->dev.parent;
+	void *va;
+
+	dev_dbg(dev, "map memory: %pa+%x\n", &mem->dma, mem->len);
+	va = ioremap_wc(mem->dma, mem->len);
+	if (IS_ERR_OR_NULL(va)) {
+		dev_err(dev, "Unable to map memory region: %pa+%x\n",
+			&mem->dma, mem->len);
+		return -ENOMEM;
+	}
+
+	/* Update memory entry va */
+	mem->va = va;
+
+	return 0;
+}
+EXPORT_SYMBOL(rproc_default_mem_alloc);
+
+/**
+ * rproc_default_mem_release() - release of the mmaped memory
+ * @rproc: handle of a remote processor
+ * @mem: memory entry descriptor
+ *
+ * Memory release for  basic remote processors allocated by
+ * @rproc_default_mem_alloc
+ *
+ * Return: 0 on success else error
+ */
+int rproc_default_mem_release(struct rproc *rproc, struct rproc_mem_entry *mem)
+{
+	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
+	iounmap(mem->va);
+
+	return 0;
+}
+EXPORT_SYMBOL(rproc_default_mem_release);
+
 /**
  * rproc_find_carveout_by_name() - lookup the carveout region by a name
  * @rproc: handle of a remote processor
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 5139cca646ca..608aeea564b4 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -65,6 +65,8 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw);
 int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware *fw);
 struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
 						       const struct firmware *fw);
+int rproc_default_mem_alloc(struct rproc *rproc, struct rproc_mem_entry *mem);
+int rproc_default_mem_release(struct rproc *rproc, struct rproc_mem_entry *mem);
 struct rproc_mem_entry *
 rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
 int rproc_check_carveout_da(struct rproc *rproc, struct rproc_mem_entry *mem,
-- 
2.17.1
