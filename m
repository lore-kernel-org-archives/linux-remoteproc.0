Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] remoteproc: Introduce rproc handle accessor for children
Date: Sun, 27 Aug 2017 22:34:53 -0700
Message-Id: <20170828053453.27187-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

In certain circumstances rpmsg devices needs to acquire a handle to the
ancestor remoteproc instance, e.g. to invoke rproc_report_crash() when a
fatal error is detected. Introduce an interface that walks the device
tree in search for a remoteproc instance and return this.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 18 ++++++++++++++++++
 include/linux/remoteproc.h           |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 564061dcc019..5b1b19519275 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1296,6 +1296,23 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
 EXPORT_SYMBOL(rproc_get_by_phandle);
 
 /**
+ * rproc_get_by_child() - acquire rproc handle of @dev's ancestor
+ * @dev:	child device to find ancestor of
+ *
+ * Returns the ancestor rproc instance, or NULL if not found.
+ */
+struct rproc *rproc_get_by_child(struct device *dev)
+{
+	for (dev = dev->parent; dev; dev = dev->parent) {
+		if (dev->type && !strcmp(dev->type->name, "remoteproc"))
+			return dev->driver_data;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL(rproc_get_by_child);
+
+/**
  * rproc_add() - register a remote processor
  * @rproc: the remote processor handle to register
  *
@@ -1440,6 +1457,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->dev.parent = dev;
 	rproc->dev.type = &rproc_type;
 	rproc->dev.class = &rproc_class;
+	rproc->dev.driver_data = rproc;
 
 	/* Assign a unique device index and name */
 	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 81da49564ff4..44e630eb3d94 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -510,6 +510,8 @@ struct rproc_vdev {
 };
 
 struct rproc *rproc_get_by_phandle(phandle phandle);
+struct rproc *rproc_get_by_child(struct device *dev);
+
 struct rproc *rproc_alloc(struct device *dev, const char *name,
 			  const struct rproc_ops *ops,
 			  const char *firmware, int len);
-- 
2.12.0
