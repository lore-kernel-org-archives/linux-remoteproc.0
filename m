Return-Path: <Matt.Redfearn@imgtec.com>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Subject: [PATCH 2/4] remoteproc: Introduce rproc_change_firmware
Date: Tue, 11 Oct 2016 14:39:43 +0100
Message-ID: <1476193185-32107-3-git-send-email-matt.redfearn@imgtec.com>
In-Reply-To: <1476193185-32107-1-git-send-email-matt.redfearn@imgtec.com>
References: <1476193185-32107-1-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Matt
List-ID: <linux-remoteproc@vger.kernel.org>

It is often desirable to be able to change the running firmware on a
remote processor dynamically. This used to require a complete
destruction and readdition of the struct rproc, but now that the
firmware name is fixed length, it can be updated freely.

So long as the remote processor is in RPROC_OFFLINE state,
rproc_change_firmware() will free resources from the previous firmware
and request a new one be loaded.

Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
---

 drivers/remoteproc/remoteproc_core.c     | 62 ++++++++++++++++++++++++++++++++
 drivers/remoteproc/remoteproc_internal.h |  1 +
 2 files changed, 63 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 48cd9d5afb69..2152b484f314 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1345,6 +1345,68 @@ static int rproc_set_firmware_name(struct rproc *rproc, const char *firmware)
 	return 0;
 }
 
+/**
+ * rproc_change_firmware() - change the loaded firmware on a remote processor
+ * @rproc: remote processor
+ * @firmware: name of firmware file to load, can be NULL
+ *
+ * Attempts to change the firmware loaded for a remote processor. The processor
+ * must be in RPROC_OFFLINE state.
+ *
+ * Any allocated resources for the exiting firmware are released, the new
+ * firmware name is set and then any virtio devices probed.
+ *
+ * Returns 0 on success and an appropriate error code otherwise.
+ *
+ * Note: this function initiates an asynchronous firmware loading
+ * context, which will look for virtio devices supported by the rproc's
+ * firmware.
+ *
+ * If found, those virtio devices will be created and added, so as a result
+ * of registering this remote processor, additional virtio drivers might be
+ * probed.
+ */
+int rproc_change_firmware(struct rproc *rproc, const char *firmware)
+{
+	struct device *dev = &rproc->dev;
+	struct rproc_vdev *rvdev, *rvtmp;
+	int ret;
+
+	ret = mutex_lock_interruptible(&rproc->lock);
+	if (ret) {
+		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
+		return -EINVAL;
+	}
+
+	if (rproc->state != RPROC_OFFLINE) {
+		dev_err(dev, "can't change firmware while running\n");
+		ret = -EBUSY;
+		goto out;
+	}
+
+	/* Wait for any pending firmware load */
+	wait_for_completion(&rproc->firmware_loading_complete);
+
+	/* clean up all acquired resources */
+	rproc_resource_cleanup(rproc);
+
+	/* clean up remote vdev entries */
+	list_for_each_entry_safe(rvdev, rvtmp, &rproc->rvdevs, node)
+		rproc_remove_virtio_dev(rvdev);
+
+	/* Free the copy of the resource table */
+	kfree(rproc->cached_table);
+
+	ret = rproc_set_firmware_name(rproc, firmware);
+	if (ret)
+		goto out;
+
+	ret = rproc_add_virtio_devices(rproc);
+out:
+	mutex_unlock(&rproc->lock);
+	return ret;
+}
+
 static struct device_type rproc_type = {
 	.name		= "remoteproc",
 	.release	= rproc_type_release,
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 57e1de59bec8..837faf2677a6 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -49,6 +49,7 @@ struct rproc_fw_ops {
 void rproc_release(struct kref *kref);
 irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
 int rproc_boot_nowait(struct rproc *rproc);
+int rproc_change_firmware(struct rproc *rproc, const char *firmware);
 
 /* from remoteproc_virtio.c */
 int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id);
-- 
2.7.4
