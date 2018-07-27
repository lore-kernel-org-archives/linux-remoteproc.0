Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v4 05/17] remoteproc: add helper function to allocate and init rproc_mem_entry struct
Date: Fri, 27 Jul 2018 15:14:40 +0200
Message-ID: <1532697292-14272-6-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch introduces rproc_mem_entry_init helper function to
simplify rproc_mem_entry structure allocation and filling by
client.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 65 +++++++++++++++++++++++++++---------
 include/linux/remoteproc.h           |  6 ++++
 2 files changed, 55 insertions(+), 16 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index d7e3138..b76760e 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -639,7 +639,7 @@ static int rproc_handle_carveout(struct rproc *rproc,
 				 struct fw_rsc_carveout *rsc,
 				 int offset, int avail)
 {
-	struct rproc_mem_entry *carveout, *mapping;
+	struct rproc_mem_entry *carveout, *mapping = NULL;
 	struct device *dev = &rproc->dev;
 	dma_addr_t dma;
 	void *va;
@@ -659,16 +659,11 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	dev_dbg(dev, "carveout rsc: name: %s, da 0x%x, pa 0x%x, len 0x%x, flags 0x%x\n",
 		rsc->name, rsc->da, rsc->pa, rsc->len, rsc->flags);
 
-	carveout = kzalloc(sizeof(*carveout), GFP_KERNEL);
-	if (!carveout)
-		return -ENOMEM;
-
 	va = dma_alloc_coherent(dev->parent, rsc->len, &dma, GFP_KERNEL);
 	if (!va) {
 		dev_err(dev->parent,
 			"failed to allocate dma memory: len 0x%x\n", rsc->len);
-		ret = -ENOMEM;
-		goto free_carv;
+		return -ENOMEM;
 	}
 
 	dev_dbg(dev, "carveout va %pK, dma %pad, len 0x%x\n",
@@ -747,27 +742,65 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	 */
 	rsc->pa = (u32)rproc_va_to_pa(va);
 
-	carveout->va = va;
-	carveout->len = rsc->len;
-	carveout->dma = dma;
-	carveout->da = rsc->da;
-	carveout->release = rproc_release_carveout;
-	strlcpy(carveout->name, rsc->name, sizeof(carveout->name));
+	carveout = rproc_mem_entry_init(dev, va, dma, rsc->len, rsc->da,
+					rproc_release_carveout, rsc->name);
+	if (!carveout)
+		goto free_carv;
 
 	list_add_tail(&carveout->node, &rproc->carveouts);
 
 	return 0;
 
+free_carv:
+	kfree(carveout);
 free_mapping:
 	kfree(mapping);
 dma_free:
 	dma_free_coherent(dev->parent, rsc->len, va, dma);
-free_carv:
-	kfree(carveout);
 	return ret;
 }
 
-/*
+/**
+ * rproc_mem_entry_init() - allocate and initialize rproc_mem_entry struct
+ * @dev: pointer on device struct
+ * @va: virtual address
+ * @dma: dma address
+ * @len: memory carveout length
+ * @da: device address
+ * @release: memory carveout function
+ * @name: carveout name
+ *
+ * This function allocates a rproc_mem_entry struct and fill it with parameters
+ * provided by client.
+ */
+struct rproc_mem_entry *
+rproc_mem_entry_init(struct device *dev,
+		     void *va, dma_addr_t dma, int len, u32 da,
+		     int (*release)(struct rproc *, struct rproc_mem_entry *),
+		     const char *name, ...)
+{
+	struct rproc_mem_entry *mem;
+	va_list args;
+
+	mem = kzalloc(sizeof(*mem), GFP_KERNEL);
+	if (!mem)
+		return mem;
+
+	mem->va = va;
+	mem->dma = dma;
+	mem->da = da;
+	mem->len = len;
+	mem->release = release;
+
+	va_start(args, name);
+	vsnprintf(mem->name, sizeof(mem->name), name, args);
+	va_end(args);
+
+	return mem;
+}
+EXPORT_SYMBOL(rproc_mem_entry_init);
+
+/**
  * A lookup table for resource handlers. The indices are defined in
  * enum fw_resource_type.
  */
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 0e21098..4bc961f 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -558,6 +558,12 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 int rproc_del(struct rproc *rproc);
 void rproc_free(struct rproc *rproc);
 
+struct rproc_mem_entry *
+rproc_mem_entry_init(struct device *dev,
+		     void *va, dma_addr_t dma, int len, u32 da,
+		     int (*release)(struct rproc *, struct rproc_mem_entry *),
+		     const char *name, ...);
+
 int rproc_boot(struct rproc *rproc);
 void rproc_shutdown(struct rproc *rproc);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
-- 
1.9.1
