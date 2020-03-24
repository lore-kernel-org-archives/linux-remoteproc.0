Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v2 10/17] remoteproc: Decouple firmware load and remoteproc booting
Date: Tue, 24 Mar 2020 15:45:56 -0600
Message-Id: <20200324214603.14979-11-mathieu.poirier@linaro.org>
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org
Cc: ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

In preparation to support scenarios where MCU firmware is loaded and
the MCU itself booted by another entity, split function rproc_boot()
to decouple the functions of loading the firwmare and starting the
initialisation process.  That way we can reuse the functionality
provided by the current implementation without invariably dealing
with firmware loading.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 63 +++++++++++++++++-----------
 1 file changed, 39 insertions(+), 24 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 1578a9c70422..7faee1396ef7 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1714,21 +1714,10 @@ static void rproc_crash_handler_work(struct work_struct *work)
 		rproc_trigger_recovery(rproc);
 }
 
-/**
- * rproc_boot() - boot a remote processor
- * @rproc: handle of a remote processor
- *
- * Boot a remote processor (i.e. load its firmware, power it on, ...).
- *
- * If the remote processor is already powered on, this function immediately
- * returns (successfully).
- *
- * Returns 0 on success, and an appropriate error value otherwise.
- */
-int rproc_boot(struct rproc *rproc)
+static int rproc_actuate(struct rproc *rproc,
+			 const struct firmware *firmware_p)
 {
-	const struct firmware *firmware_p;
-	struct device *dev;
+	struct device *dev = &rproc->dev;
 	int ret;
 
 	if (!rproc) {
@@ -1736,8 +1725,6 @@ int rproc_boot(struct rproc *rproc)
 		return -EINVAL;
 	}
 
-	dev = &rproc->dev;
-
 	ret = mutex_lock_interruptible(&rproc->lock);
 	if (ret) {
 		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
@@ -1756,24 +1743,52 @@ int rproc_boot(struct rproc *rproc)
 		goto unlock_mutex;
 	}
 
-	dev_info(dev, "powering up %s\n", rproc->name);
+	dev_info(dev, "%s %s\n",
+		 firmware_p ? "powering up" : "syncing with",
+		 rproc->name);
+
+	ret = rproc_fw_boot(rproc, firmware_p);
+	if (ret)
+		atomic_dec(&rproc->power);
+
+unlock_mutex:
+	mutex_unlock(&rproc->lock);
+	return ret;
+}
+
+/**
+ * rproc_boot() - boot a remote processor
+ * @rproc: handle of a remote processor
+ *
+ * Boot a remote processor (i.e. load its firmware, power it on, ...).
+ *
+ * If the remote processor is already powered on, this function immediately
+ * returns (successfully).
+ *
+ * Returns 0 on success, and an appropriate error value otherwise.
+ */
+int rproc_boot(struct rproc *rproc)
+{
+	const struct firmware *firmware_p;
+	struct device *dev = &rproc->dev;
+	int ret;
+
+	if (!rproc) {
+		pr_err("invalid rproc handle\n");
+		return -EINVAL;
+	}
 
 	/* load firmware */
 	ret = request_firmware(&firmware_p, rproc->firmware, dev);
 	if (ret < 0) {
 		dev_err(dev, "request_firmware failed: %d\n", ret);
-		goto downref_rproc;
+		return ret;
 	}
 
-	ret = rproc_fw_boot(rproc, firmware_p);
+	ret = rproc_actuate(rproc, firmware_p);
 
 	release_firmware(firmware_p);
 
-downref_rproc:
-	if (ret)
-		atomic_dec(&rproc->power);
-unlock_mutex:
-	mutex_unlock(&rproc->lock);
 	return ret;
 }
 EXPORT_SYMBOL(rproc_boot);
-- 
2.20.1
