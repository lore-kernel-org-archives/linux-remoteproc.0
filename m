Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [RFC 1/6] remoteproc: add early probed subdevices
Date: Fri, 24 Nov 2017 15:36:37 +0100
Message-ID: <1511534202-12995-2-git-send-email-arnaud.pouliquen@st.com>
In-Reply-To: <1511534202-12995-1-git-send-email-arnaud.pouliquen@st.com>
References: <1511534202-12995-1-git-send-email-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, arnaud.pouliquen@st.com, "Loic PALLARDY  <loic.pallardy@st.com>, Fabien DESSENNE" <fabien.dessenne@st.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Fabien Dessenne <fabien.dessenne@st.com>

Add the option to use rproc subdevices that are probed *before* the
remote processor firmware boot.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 62 +++++++++++++++++++++++++++++-------
 include/linux/remoteproc.h           |  7 ++++
 2 files changed, 58 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index eab14b4..870b1fb 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -770,12 +770,12 @@ static int rproc_handle_resources(struct rproc *rproc, int len,
 	return ret;
 }
 
-static int rproc_probe_subdevices(struct rproc *rproc)
+static int rproc_probe_subdevices(struct list_head *head)
 {
 	struct rproc_subdev *subdev;
 	int ret;
 
-	list_for_each_entry(subdev, &rproc->subdevs, node) {
+	list_for_each_entry(subdev, head, node) {
 		ret = subdev->probe(subdev);
 		if (ret)
 			goto unroll_registration;
@@ -784,17 +784,17 @@ static int rproc_probe_subdevices(struct rproc *rproc)
 	return 0;
 
 unroll_registration:
-	list_for_each_entry_continue_reverse(subdev, &rproc->subdevs, node)
+	list_for_each_entry_continue_reverse(subdev, head, node)
 		subdev->remove(subdev);
 
 	return ret;
 }
 
-static void rproc_remove_subdevices(struct rproc *rproc)
+static void rproc_remove_subdevices(struct list_head *head)
 {
 	struct rproc_subdev *subdev;
 
-	list_for_each_entry_reverse(subdev, &rproc->subdevs, node)
+	list_for_each_entry_reverse(subdev, head, node)
 		subdev->remove(subdev);
 }
 
@@ -881,20 +881,27 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 		rproc->table_ptr = loaded_table;
 	}
 
+	/* early probe any subdevices for the remote processor */
+	ret = rproc_probe_subdevices(&rproc->early_subdevs);
+	if (ret) {
+		dev_err(dev, "failed to early probe subdevices for %s: %d\n",
+			rproc->name, ret);
+		return ret;
+	}
+
 	/* power up the remote processor */
 	ret = rproc->ops->start(rproc);
 	if (ret) {
 		dev_err(dev, "can't start rproc %s: %d\n", rproc->name, ret);
-		return ret;
+		goto remove_early;
 	}
 
 	/* probe any subdevices for the remote processor */
-	ret = rproc_probe_subdevices(rproc);
+	ret = rproc_probe_subdevices(&rproc->subdevs);
 	if (ret) {
 		dev_err(dev, "failed to probe subdevices for %s: %d\n",
 			rproc->name, ret);
-		rproc->ops->stop(rproc);
-		return ret;
+		goto stop_rproc;
 	}
 
 	rproc->state = RPROC_RUNNING;
@@ -902,6 +909,12 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	dev_info(dev, "remote processor %s is now up\n", rproc->name);
 
 	return 0;
+
+stop_rproc:
+	rproc->ops->stop(rproc);
+remove_early:
+	rproc_remove_subdevices(&rproc->early_subdevs);
+	return ret;
 }
 
 /*
@@ -1019,7 +1032,7 @@ static int rproc_stop(struct rproc *rproc)
 	int ret;
 
 	/* remove any subdevices for the remote processor */
-	rproc_remove_subdevices(rproc);
+	rproc_remove_subdevices(&rproc->subdevs);
 
 	/* power off the remote processor */
 	ret = rproc->ops->stop(rproc);
@@ -1028,6 +1041,9 @@ static int rproc_stop(struct rproc *rproc)
 		return ret;
 	}
 
+	/* remove any early-probed subdevices for the remote processor */
+	rproc_remove_subdevices(&rproc->early_subdevs);
+
 	/* if in crash state, unlock crash handler */
 	if (rproc->state == RPROC_CRASHED)
 		complete_all(&rproc->crash_comp);
@@ -1457,6 +1473,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	INIT_LIST_HEAD(&rproc->traces);
 	INIT_LIST_HEAD(&rproc->rvdevs);
 	INIT_LIST_HEAD(&rproc->subdevs);
+	INIT_LIST_HEAD(&rproc->early_subdevs);
 
 	INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
 	init_completion(&rproc->crash_comp);
@@ -1560,9 +1577,32 @@ void rproc_add_subdev(struct rproc *rproc,
 EXPORT_SYMBOL(rproc_add_subdev);
 
 /**
+ * rproc_add_early_subdev() - add an early subdevice to a remoteproc
+ * @rproc: rproc handle to add the subdevice to
+ * @subdev: subdev handle to register
+ * @probe: function to call before the rproc boots
+ * @remove: function to call after the rproc shuts down
+ *
+ * This function differs from rproc_add_subdev() in the sense that the added
+ * subdevices are probed BEFORE the rproc boots.
+ */
+void rproc_add_early_subdev(struct rproc *rproc,
+			    struct rproc_subdev *subdev,
+			    int (*probe)(struct rproc_subdev *subdev),
+			    void (*remove)(struct rproc_subdev *subdev))
+{
+	subdev->probe = probe;
+	subdev->remove = remove;
+
+	list_add_tail(&subdev->node, &rproc->early_subdevs);
+}
+EXPORT_SYMBOL(rproc_add_early_subdev);
+
+/**
  * rproc_remove_subdev() - remove a subdevice from a remoteproc
  * @rproc: rproc handle to remove the subdevice from
- * @subdev: subdev handle, previously registered with rproc_add_subdev()
+ * @subdev: subdev handle, previously registered with rproc_add_subdev() or
+ *          rproc_add_early_subdev()
  */
 void rproc_remove_subdev(struct rproc *rproc, struct rproc_subdev *subdev)
 {
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 44e630e..e6b02d8 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -402,6 +402,7 @@ enum rproc_crash_type {
  * @bootaddr: address of first instruction to boot rproc with (optional)
  * @rvdevs: list of remote virtio devices
  * @subdevs: list of subdevices, to following the running state
+ * @early_subdevs: list of early-probed subdevices
  * @notifyids: idr for dynamically assigning rproc-wide unique notify ids
  * @index: index of this rproc device
  * @crash_handler: workqueue for handling a crash
@@ -433,6 +434,7 @@ struct rproc {
 	u32 bootaddr;
 	struct list_head rvdevs;
 	struct list_head subdevs;
+	struct list_head early_subdevs;
 	struct idr notifyids;
 	int index;
 	struct work_struct crash_handler;
@@ -541,6 +543,11 @@ void rproc_add_subdev(struct rproc *rproc,
 		      int (*probe)(struct rproc_subdev *subdev),
 		      void (*remove)(struct rproc_subdev *subdev));
 
+void rproc_add_early_subdev(struct rproc *rproc,
+			    struct rproc_subdev *subdev,
+			    int (*probe)(struct rproc_subdev *subdev),
+			    void (*remove)(struct rproc_subdev *subdev));
+
 void rproc_remove_subdev(struct rproc *rproc, struct rproc_subdev *subdev);
 
 #endif /* REMOTEPROC_H */
-- 
2.7.4
