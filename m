Return-Path: <jliang@xilinx.com>
Return-Path: wendy.liang@xilinx.com
From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [RFC LINUX PATCH 11/19] remoteproc: Add rproc_idr_alloc/remove wrapper
Date: Fri, 24 Mar 2017 12:22:27 -0700
Message-ID: <1490383355-23176-12-git-send-email-jliang@xilinx.com>
In-Reply-To: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
References: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Wendy Liang  <wendy.liang@xilinx.com>, Wendy Liang <jliang@xilinx.com>, Michal Simek" <michal.simek@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Wendy Liang <wendy.liang@xilinx.com>

Add rproc_idr_alloc()/rproc_idr_remove() wrapper for
id allocation/removal.

Signed-off-by: Wendy Liang <jliang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/remoteproc/remoteproc_core.c     | 46 ++++++++++++++++++++++++++++++++
 drivers/remoteproc/remoteproc_internal.h |  6 +++++
 2 files changed, 52 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index e4fb289..d711345 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -140,6 +140,52 @@ static void rproc_disable_iommu(struct rproc *rproc)
 }
 
 /**
+ * rproc_idr_alloc() - allocate id with idr_alloc()
+ * @rproc: handle of a remote processor
+ * @ptr: pointer to the resource to allocate id for
+ * @rsc_type: type of the resource for which to allocate id
+ * @start: start id
+ * @end: end id
+ *
+ * This function returns an ID from idr_alloc() or negative number
+ * if it fails.
+ */
+int rproc_idr_alloc(struct rproc *rproc, void *ptr, unsigned int rsc_type,
+		    int start, int end)
+{
+	struct rproc_id_rsc *rsc;
+	int ret;
+
+	rsc = kzalloc(sizeof(*rsc), GFP_KERNEL);
+	if (!rsc)
+		return -ENOMEM;
+
+	rsc->rsc_ptr = ptr;
+	rsc->rsc_type = rsc_type;
+
+	ret = idr_alloc(&rproc->notifyids, rsc, start, end, GFP_KERNEL);
+	if (ret < 0)
+		kfree(rsc);
+	return ret;
+}
+
+/**
+ * rproc_idr_remove() - remove id with idr_remove()
+ * @rproc: handle of a remote processor
+ * @id: id to remove
+ */
+void rproc_idr_remove(struct rproc *rproc, int id)
+{
+	struct rproc_id_rsc *rsc;
+
+	rsc = idr_find(&rproc->notifyids, id);
+	if (!rsc)
+		return;
+	idr_remove(&rproc->notifyids, id);
+	kfree(rsc);
+}
+
+/**
  * rproc_da_to_va() - lookup the kernel virtual address for a remoteproc address
  * @rproc: handle of a remote processor
  * @da: remoteproc device address to translate
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 7e25621..865bd1c 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -94,6 +94,12 @@ struct dentry *rproc_create_trace_file(const char *name, struct rproc *rproc,
 int rproc_init_sysfs(void);
 void rproc_exit_sysfs(void);
 
+/* rproc idr_alloc wrapper */
+int rproc_idr_alloc(struct rproc *rproc, void *ptr, unsigned int rsc_type,
+		    int start, int end);
+/* rproc idr_remove wrapper */
+void rproc_idr_remove(struct rproc *rproc, int id);
+
 void rproc_free_vring(struct rproc_vring *rvring);
 int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
 
-- 
1.9.1
