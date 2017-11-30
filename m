Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v4 3/5] remoteproc: Pass type of shutdown to subdev remove
Date: Wed, 29 Nov 2017 17:16:42 -0800
Message-Id: <20171130011644.9421-4-bjorn.andersson@linaro.org>
In-Reply-To: <20171130011644.9421-1-bjorn.andersson@linaro.org>
References: <20171130011644.9421-1-bjorn.andersson@linaro.org>
To: Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arun Kumar Neelakantam <aneela@codeaurora.org>, Chris Lew <clew@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

remoteproc instances can be stopped either by invoking shutdown or by an
attempt to recover from a crash. For some subdev types it's expected to
clean up gracefully during a shutdown, but are unable to do so during a
crash - so pass this information to the subdev remove functions.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- None

Changes since v2:
- None

Changes since v1:
- New patch

 drivers/remoteproc/qcom_common.c     |  6 +++---
 drivers/remoteproc/remoteproc_core.c | 18 +++++++++---------
 include/linux/remoteproc.h           |  4 ++--
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index d487040b528b..7a862d41503e 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -60,7 +60,7 @@ static int glink_subdev_probe(struct rproc_subdev *subdev)
 	return IS_ERR(glink->edge) ? PTR_ERR(glink->edge) : 0;
 }
 
-static void glink_subdev_remove(struct rproc_subdev *subdev)
+static void glink_subdev_remove(struct rproc_subdev *subdev, bool graceful)
 {
 	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
 
@@ -107,7 +107,7 @@ static int smd_subdev_probe(struct rproc_subdev *subdev)
 	return PTR_ERR_OR_ZERO(smd->edge);
 }
 
-static void smd_subdev_remove(struct rproc_subdev *subdev)
+static void smd_subdev_remove(struct rproc_subdev *subdev, bool graceful)
 {
 	struct qcom_rproc_subdev *smd = to_smd_subdev(subdev);
 
@@ -176,7 +176,7 @@ static int ssr_notify_start(struct rproc_subdev *subdev)
 	return  0;
 }
 
-static void ssr_notify_stop(struct rproc_subdev *subdev)
+static void ssr_notify_stop(struct rproc_subdev *subdev, bool graceful)
 {
 	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
 
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index eab14b414bf0..3146e965ca47 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -307,7 +307,7 @@ static int rproc_vdev_do_probe(struct rproc_subdev *subdev)
 	return rproc_add_virtio_dev(rvdev, rvdev->id);
 }
 
-static void rproc_vdev_do_remove(struct rproc_subdev *subdev)
+static void rproc_vdev_do_remove(struct rproc_subdev *subdev, bool graceful)
 {
 	struct rproc_vdev *rvdev = container_of(subdev, struct rproc_vdev, subdev);
 
@@ -785,17 +785,17 @@ static int rproc_probe_subdevices(struct rproc *rproc)
 
 unroll_registration:
 	list_for_each_entry_continue_reverse(subdev, &rproc->subdevs, node)
-		subdev->remove(subdev);
+		subdev->remove(subdev, false);
 
 	return ret;
 }
 
-static void rproc_remove_subdevices(struct rproc *rproc)
+static void rproc_remove_subdevices(struct rproc *rproc, bool graceful)
 {
 	struct rproc_subdev *subdev;
 
 	list_for_each_entry_reverse(subdev, &rproc->subdevs, node)
-		subdev->remove(subdev);
+		subdev->remove(subdev, graceful);
 }
 
 /**
@@ -1013,13 +1013,13 @@ static int rproc_trigger_auto_boot(struct rproc *rproc)
 	return ret;
 }
 
-static int rproc_stop(struct rproc *rproc)
+static int rproc_stop(struct rproc *rproc, bool graceful)
 {
 	struct device *dev = &rproc->dev;
 	int ret;
 
 	/* remove any subdevices for the remote processor */
-	rproc_remove_subdevices(rproc);
+	rproc_remove_subdevices(rproc, graceful);
 
 	/* power off the remote processor */
 	ret = rproc->ops->stop(rproc);
@@ -1063,7 +1063,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	if (ret)
 		return ret;
 
-	ret = rproc_stop(rproc);
+	ret = rproc_stop(rproc, false);
 	if (ret)
 		goto unlock_mutex;
 
@@ -1216,7 +1216,7 @@ void rproc_shutdown(struct rproc *rproc)
 	if (!atomic_dec_and_test(&rproc->power))
 		goto out;
 
-	ret = rproc_stop(rproc);
+	ret = rproc_stop(rproc, true);
 	if (ret) {
 		atomic_inc(&rproc->power);
 		goto out;
@@ -1550,7 +1550,7 @@ EXPORT_SYMBOL(rproc_del);
 void rproc_add_subdev(struct rproc *rproc,
 		      struct rproc_subdev *subdev,
 		      int (*probe)(struct rproc_subdev *subdev),
-		      void (*remove)(struct rproc_subdev *subdev))
+		      void (*remove)(struct rproc_subdev *subdev, bool graceful))
 {
 	subdev->probe = probe;
 	subdev->remove = remove;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 44e630eb3d94..20a9467744ea 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -456,7 +456,7 @@ struct rproc_subdev {
 	struct list_head node;
 
 	int (*probe)(struct rproc_subdev *subdev);
-	void (*remove)(struct rproc_subdev *subdev);
+	void (*remove)(struct rproc_subdev *subdev, bool graceful);
 };
 
 /* we currently support only two vrings per rvdev */
@@ -539,7 +539,7 @@ static inline struct rproc *vdev_to_rproc(struct virtio_device *vdev)
 void rproc_add_subdev(struct rproc *rproc,
 		      struct rproc_subdev *subdev,
 		      int (*probe)(struct rproc_subdev *subdev),
-		      void (*remove)(struct rproc_subdev *subdev));
+		      void (*remove)(struct rproc_subdev *subdev, bool graceful));
 
 void rproc_remove_subdev(struct rproc *rproc, struct rproc_subdev *subdev);
 
-- 
2.15.0
