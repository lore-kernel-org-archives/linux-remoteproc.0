Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH 07/18] remoteproc: Introduce function rproc_alloc_state_machine()
Date: Thu, 12 Mar 2020 16:11:47 -0600
Message-Id: <20200312221158.3613-8-mathieu.poirier@linaro.org>
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Introducing new function rproc_alloc_state_machine() to allocate
the MCU synchronisation operations and position it as the central
remoteproc core allocation function.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 84 +++++++++++++++++++++++++---
 include/linux/remoteproc.h           |  5 ++
 2 files changed, 81 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 9da245734db6..02dbb826aa29 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1954,6 +1954,7 @@ static void rproc_type_release(struct device *dev)
 
 	kfree(rproc->firmware);
 	kfree(rproc->ops);
+	kfree(rproc->sync_ops);
 	kfree(rproc);
 }
 
@@ -2018,12 +2019,34 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
 	return 0;
 }
 
+static int rproc_alloc_sync_ops(struct rproc *rproc,
+				const struct rproc_ops *sync_ops)
+{
+	/*
+	 * Given the unlimited amount of possibilities when
+	 * synchronising with an MCU, no constraints are imposed
+	 * on sync_ops.
+	 */
+	rproc->sync_ops = kmemdup(sync_ops,
+				  sizeof(*sync_ops), GFP_KERNEL);
+	if (!rproc->sync_ops)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int rproc_alloc_internals(struct rproc *rproc, const char *name,
 				 const struct rproc_ops *boot_ops,
+				 const struct rproc_ops *sync_ops,
+				 struct rproc_sync_states *sync_states,
 				 const char *firmware, int len)
 {
 	int ret;
 
+	/* We need at least a boot or a sync ops. */
+	if (!boot_ops && !sync_ops)
+		return -EINVAL;
+
 	/* We have a boot_ops so allocate firmware name and operations */
 	if (boot_ops) {
 		ret = rproc_alloc_firmware(rproc, name, firmware);
@@ -2035,14 +2058,23 @@ static int rproc_alloc_internals(struct rproc *rproc, const char *name,
 			return ret;
 	}
 
+	/* Allocate a sync_ops if need be */
+	if (sync_ops) {
+		ret = rproc_alloc_sync_ops(rproc, sync_ops);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
 /**
- * rproc_alloc() - allocate a remote processor handle
+ * rproc_alloc_state_machine() - allocate a remote processor handle
  * @dev: the underlying device
  * @name: name of this remote processor
  * @ops: platform-specific handlers (mainly start/stop)
+ * @sync_ops: platform-specific handlers for synchronising with MCU
+ * @sync_states: states in which @ops and @sync_ops are to be used
  * @firmware: name of firmware file to load, can be NULL
  * @len: length of private data needed by the rproc driver (in bytes)
  *
@@ -2061,13 +2093,15 @@ static int rproc_alloc_internals(struct rproc *rproc, const char *name,
  * Note: _never_ directly deallocate @rproc, even if it was not registered
  * yet. Instead, when you need to unroll rproc_alloc(), use rproc_free().
  */
-struct rproc *rproc_alloc(struct device *dev, const char *name,
-			  const struct rproc_ops *ops,
-			  const char *firmware, int len)
+struct rproc *rproc_alloc_state_machine(struct device *dev, const char *name,
+					const struct rproc_ops *ops,
+					const struct rproc_ops *sync_ops,
+					struct rproc_sync_states *sync_states,
+					const char *firmware, int len)
 {
 	struct rproc *rproc;
 
-	if (!dev || !name || !ops)
+	if (!dev || !name)
 		return NULL;
 
 	rproc = kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
@@ -2084,8 +2118,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->dev.class = &rproc_class;
 	rproc->dev.driver_data = rproc;
 
-	if (rproc_alloc_internals(rproc, name, ops,
-				  firmware, len))
+	if (rproc_alloc_internals(rproc, name, ops, sync_ops,
+				  sync_states, firmware, len))
 		goto out;
 
 	/* Assign a unique device index and name */
@@ -2119,7 +2153,41 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	put_device(&rproc->dev);
 	return NULL;
 }
-EXPORT_SYMBOL(rproc_alloc);
+EXPORT_SYMBOL(rproc_alloc_state_machine);
+
+/**
+ * rproc_alloc() - allocate a remote processor handle
+ * @dev: the underlying device
+ * @name: name of this remote processor
+ * @ops: platform-specific handlers (mainly start/stop)
+ * @firmware: name of firmware file to load, can be NULL
+ * @len: length of private data needed by the rproc driver (in bytes)
+ *
+ * Allocates a new remote processor handle, but does not register
+ * it yet. if @firmware is NULL, a default name is used.
+ *
+ * This function should be used by rproc implementations during initialization
+ * of the remote processor.
+ *
+ * After creating an rproc handle using this function, and when ready,
+ * implementations should then call rproc_add() to complete
+ * the registration of the remote processor.
+ *
+ * On success the new rproc is returned, and on failure, NULL.
+ *
+ * Note: _never_ directly deallocate @rproc, even if it was not registered
+ * yet. Instead, when you need to unroll rproc_alloc(), use rproc_free().
+ */
+struct rproc *rproc_alloc(struct device *dev, const char *name,
+			  const struct rproc_ops *ops,
+			  const char *firmware, int len)
+{
+	if (!name && !firmware)
+		return NULL;
+
+	return rproc_alloc_state_machine(dev, name, ops, NULL, NULL,
+					 firmware, len);
+}
 
 /**
  * rproc_free() - unroll rproc_alloc()
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index d115e47d702d..d1214487daac 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -611,6 +611,11 @@ struct rproc *rproc_get_by_child(struct device *dev);
 struct rproc *rproc_alloc(struct device *dev, const char *name,
 			  const struct rproc_ops *ops,
 			  const char *firmware, int len);
+struct rproc *rproc_alloc_state_machine(struct device *dev, const char *name,
+					const struct rproc_ops *ops,
+					const struct rproc_ops *sync_ops,
+					struct rproc_sync_states *sync_states,
+					const char *firmware, int len);
 void rproc_put(struct rproc *rproc);
 int rproc_add(struct rproc *rproc);
 int rproc_del(struct rproc *rproc);
-- 
2.20.1
