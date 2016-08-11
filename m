Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 1/4] remoteproc: Introduce auto-boot flag
Date: Thu, 11 Aug 2016 14:52:50 -0700
Message-Id: <1470952373-4823-1-git-send-email-bjorn.andersson@linaro.org>
To: linux-remoteproc@vger.kernel.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>, Lee Jones <lee.jones@linaro.org>, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Introduce an "auto-boot" flag on rprocs to make it possible to flag
remote processors without vdevs to automatically boot once the firmware
is found.

Preserve previous behavior of the wkup_m3 processor being explicitly
booted by a consumer.

Cc: Lee Jones <lee.jones@linaro.org>
Cc: Loic Pallardy <loic.pallardy@st.com>
Cc: Suman Anna <s-anna@ti.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- s/always_on/auto_boot/
- Fixed double increment of "power" in recover path
- Marked wkup_m3 to not auto_boot

 drivers/remoteproc/remoteproc_core.c   | 28 +++++++++++++++++++++++++++-
 drivers/remoteproc/remoteproc_virtio.c | 13 -------------
 drivers/remoteproc/wkup_m3_rproc.c     |  2 ++
 include/linux/remoteproc.h             |  1 +
 4 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index fe0539ed9cb5..5ca98039e494 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -933,6 +933,10 @@ static void rproc_fw_config_virtio(const struct firmware *fw, void *context)
 	/* look for virtio devices and register them */
 	ret = rproc_handle_resources(rproc, tablesz, rproc_vdev_handler);
 
+	/* if rproc is marked always-on, request it to boot */
+	if (rproc->auto_boot)
+		rproc_boot_nowait(rproc);
+
 out:
 	release_firmware(fw);
 	/* allow rproc_del() contexts, if any, to proceed */
@@ -978,11 +982,16 @@ static int rproc_add_virtio_devices(struct rproc *rproc)
 int rproc_trigger_recovery(struct rproc *rproc)
 {
 	struct rproc_vdev *rvdev, *rvtmp;
+	int ret;
 
 	dev_err(&rproc->dev, "recovering %s\n", rproc->name);
 
 	init_completion(&rproc->crash_comp);
 
+	/* shut down the remote */
+	/* TODO: make sure this works with rproc->power > 1 */
+	rproc_shutdown(rproc);
+
 	/* clean up remote vdev entries */
 	list_for_each_entry_safe(rvdev, rvtmp, &rproc->rvdevs, node)
 		rproc_remove_virtio_dev(rvdev);
@@ -993,7 +1002,18 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	/* Free the copy of the resource table */
 	kfree(rproc->cached_table);
 
-	return rproc_add_virtio_devices(rproc);
+	ret = rproc_add_virtio_devices(rproc);
+	if (ret)
+		return ret;
+
+	/*
+	 * boot the remote processor up again, if the async firmware loader
+	 * didn't do so already, waiting for the async fw load to finish
+	 */
+	if (!rproc->auto_boot)
+		rproc_boot(rproc);
+
+	return 0;
 }
 
 /**
@@ -1374,6 +1394,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->name = name;
 	rproc->ops = ops;
 	rproc->priv = &rproc[1];
+	rproc->auto_boot = true;
 
 	device_initialize(&rproc->dev);
 	rproc->dev.parent = dev;
@@ -1452,6 +1473,11 @@ int rproc_del(struct rproc *rproc)
 	/* if rproc is just being registered, wait */
 	wait_for_completion(&rproc->firmware_loading_complete);
 
+	/* if rproc is marked always-on, rproc_add() booted it */
+	/* TODO: make sure this works with rproc->power > 1 */
+	if (rproc->auto_boot)
+		rproc_shutdown(rproc);
+
 	/* clean up remote vdev entries */
 	list_for_each_entry_safe(rvdev, tmp, &rproc->rvdevs, node)
 		rproc_remove_virtio_dev(rvdev);
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index cc91556313e1..574c90ce07f7 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -136,11 +136,6 @@ static void __rproc_virtio_del_vqs(struct virtio_device *vdev)
 
 static void rproc_virtio_del_vqs(struct virtio_device *vdev)
 {
-	struct rproc *rproc = vdev_to_rproc(vdev);
-
-	/* power down the remote processor before deleting vqs */
-	rproc_shutdown(rproc);
-
 	__rproc_virtio_del_vqs(vdev);
 }
 
@@ -149,7 +144,6 @@ static int rproc_virtio_find_vqs(struct virtio_device *vdev, unsigned nvqs,
 		       vq_callback_t *callbacks[],
 		       const char * const names[])
 {
-	struct rproc *rproc = vdev_to_rproc(vdev);
 	int i, ret;
 
 	for (i = 0; i < nvqs; ++i) {
@@ -160,13 +154,6 @@ static int rproc_virtio_find_vqs(struct virtio_device *vdev, unsigned nvqs,
 		}
 	}
 
-	/* now that the vqs are all set, boot the remote processor */
-	ret = rproc_boot_nowait(rproc);
-	if (ret) {
-		dev_err(&rproc->dev, "rproc_boot() failed %d\n", ret);
-		goto error;
-	}
-
 	return 0;
 
 error:
diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
index 02d271d101b4..3811cb522af3 100644
--- a/drivers/remoteproc/wkup_m3_rproc.c
+++ b/drivers/remoteproc/wkup_m3_rproc.c
@@ -167,6 +167,8 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
 		goto err;
 	}
 
+	rproc->auto_boot = false;
+
 	wkupm3 = rproc->priv;
 	wkupm3->rproc = rproc;
 	wkupm3->pdev = pdev;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 1c457a8dd5a6..76d936cabbf8 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -443,6 +443,7 @@ struct rproc {
 	struct resource_table *cached_table;
 	u32 table_csum;
 	bool has_iommu;
+	bool auto_boot;
 };
 
 /* we currently support only two vrings per rvdev */
-- 
2.5.0
