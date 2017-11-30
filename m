Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 09/16] remoteproc: add memory device management support
Date: Thu, 30 Nov 2017 17:46:44 +0100
Message-ID: <1512060411-729-10-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch add functions to create and delete some
remoteproc sub-devices with dedicated dma coherent region.

These "memory devices" are identified by their name and
will be used for carveout, vring, buffers allocation
in specific memory region.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 134 ++++++++++++++++++++++++++++++++---
 1 file changed, 123 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index cc53247..76d54bf 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -69,6 +69,127 @@ static const char *rproc_crash_to_string(enum rproc_crash_type type)
 	return "unknown";
 }
 
+static phys_addr_t rproc_va_to_pa(void *cpu_addr)
+{
+	if (is_vmalloc_addr(cpu_addr)) {
+		return page_to_phys(vmalloc_to_page(cpu_addr)) +
+				    offset_in_page(cpu_addr);
+	}
+
+	WARN_ON(!virt_addr_valid(cpu_addr));
+	return virt_to_phys(cpu_addr);
+}
+
+struct rproc_memdev {
+	struct device dev;
+	struct rproc *rproc;
+	struct rproc_mem_entry *mem;
+};
+
+#define to_memdevice(d) container_of(d, struct rproc_memdev, dev)
+
+/**
+ * rproc_memdev_release() - release the existence of a memdevice
+ *
+ * @dev: the subdevice's dev
+ */
+static void rproc_memdev_release(struct device *dev)
+{
+	struct rproc_memdev *memd = to_memdevice(dev);
+
+	kfree(memd);
+}
+
+/**
+ * rproc_memdev_add() - add a memory-device on remote processor
+ *
+ * @rproc: the parent remote processor
+ * @mem: memory resource entry allow to define the dma coherent memory of memory-device
+ *
+ * This function add a memory-device child on rproc parent. This memory-device allow
+ * to define a new dma coherent memory area. When the rproc would alloc a
+ * dma coherent memory it's find the memory-device that match with physical memory
+ * asked (if there is no children that match, the rproc is the default device)
+ *
+ * Returns the memory-device handle on success, and error on failure.
+ */
+static struct rproc_memdev *rproc_memdev_add(struct rproc *rproc,
+					     struct rproc_mem_entry *mem)
+{
+	struct rproc_memdev *memd;
+	int ret;
+
+	if (!mem || strlen(mem->name) == 0) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	memd = kzalloc(sizeof(*memd), GFP_KERNEL);
+	if (!memd) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	memd->rproc = rproc;
+	memd->mem = mem;
+	memd->dev.parent = rproc->dev.parent;
+	memd->dev.release = rproc_memdev_release;
+	dev_set_name(&memd->dev, "%s#%s", dev_name(memd->dev.parent), mem->name);
+	dev_set_drvdata(&memd->dev, memd);
+
+	ret = device_register(&memd->dev);
+	if (ret)
+		goto err_dev;
+
+	ret = dmam_declare_coherent_memory(&memd->dev,
+					   rproc_va_to_pa(mem->va), mem->da,
+					   mem->len,
+					   DMA_MEMORY_EXCLUSIVE);
+	if (ret < 0)
+		goto err_dev;
+
+	return memd;
+
+err_dev:
+	put_device(&memd->dev);
+err:
+	dev_err(&rproc->dev, "unable to register subdev %s, err = %d\n",
+		(mem && strlen(mem->name)) ? mem->name : "unnamed", ret);
+	return ERR_PTR(ret);
+}
+
+/**
+ * rproc_memdev_del() - delete a memory-device of remote processor
+ *
+ * @memdev: rproc memory-device
+ */
+static void rproc_memdev_del(struct rproc_memdev *memdev)
+{
+	if (get_device(&memdev->dev)) {
+		device_unregister(&memdev->dev);
+		put_device(&memdev->dev);
+	}
+}
+
+/**
+ * rproc_memdev_unregister() - unregister memory-device of remote processor
+ *
+ * @dev: rproc memory-device
+ * @data: Not use (just to be compliant with device_for_each_child)
+ *
+ * This function is called by device_for_each_child function when unregister
+ * remote processor.
+ */
+static int rproc_memdev_unregister(struct device *dev, void *data)
+{
+	struct rproc_memdev *memd = to_memdevice(dev);
+	struct rproc *rproc = data;
+
+	if (dev != &rproc->dev)
+		rproc_memdev_del(memd);
+	return 0;
+}
+
 /*
  * This is the IOMMU fault handler we register with the IOMMU API
  * (when relevant; not all remote processors access memory through
@@ -139,17 +260,6 @@ static void rproc_disable_iommu(struct rproc *rproc)
 	iommu_domain_free(domain);
 }
 
-static phys_addr_t rproc_va_to_pa(void *cpu_addr)
-{
-	if (is_vmalloc_addr(cpu_addr)) {
-		return page_to_phys(vmalloc_to_page(cpu_addr)) +
-				    offset_in_page(cpu_addr);
-	}
-
-	WARN_ON(!virt_addr_valid(cpu_addr));
-	return virt_to_phys(cpu_addr);
-}
-
 /**
  * rproc_da_to_va() - lookup the kernel virtual address for a remoteproc address
  * @rproc: handle of a remote processor
@@ -1678,6 +1788,8 @@ int rproc_del(struct rproc *rproc)
 
 	rproc_delete_debug_dir(rproc);
 
+	device_for_each_child(rproc->dev.parent, rproc,
+			      rproc_memdev_unregister);
 	/* the rproc is downref'ed as soon as it's removed from the klist */
 	mutex_lock(&rproc_list_mutex);
 	list_del(&rproc->node);
-- 
1.9.1
