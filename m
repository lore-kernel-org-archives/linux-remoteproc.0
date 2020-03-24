Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v2 16/17] remoteproc: Correctly deal with MCU synchronisation when changing state
Date: Tue, 24 Mar 2020 15:46:02 -0600
Message-Id: <20200324214603.14979-17-mathieu.poirier@linaro.org>
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org
Cc: ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This patch deals with state changes when synchronising with an MCU. More
specifically it prevents the MCU from being started if it already has been
started by another entity.  Similarly it prevents the AP from stopping the
MCU if it hasn't been given the capability by platform firmware.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_sysfs.c | 32 ++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 4956577ad4b4..741a3c152b82 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -108,6 +108,29 @@ static ssize_t state_show(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%s\n", rproc_state_string[state]);
 }
 
+static int rproc_can_shutdown(struct rproc *rproc)
+{
+	/* The MCU is not running, obviously an invalid operation. */
+	if (rproc->state != RPROC_RUNNING)
+		return false;
+
+	/*
+	 * The MCU is not running (see above) and the remoteproc core is the
+	 * lifecycle manager, no problem calling for a shutdown.
+	 */
+	if (!rproc_sync_with_mcu(rproc))
+		return true;
+
+	/*
+	 * The MCU has been loaded by another entity (see above) and the
+	 * platform code has _not_ given us the capability of stopping it.
+	 */
+	if (!rproc->sync_ops->stop)
+		return false;
+
+	return true;
+}
+
 /* Change remote processor state via sysfs */
 static ssize_t state_store(struct device *dev,
 			      struct device_attribute *attr,
@@ -120,11 +143,18 @@ static ssize_t state_store(struct device *dev,
 		if (rproc->state == RPROC_RUNNING)
 			return -EBUSY;
 
+		/*
+		 * In synchronisation mode, booting the MCU is the
+		 * responsibility of an external entity.
+		 */
+		if (rproc_sync_with_mcu(rproc))
+			return -EINVAL;
+
 		ret = rproc_boot(rproc);
 		if (ret)
 			dev_err(&rproc->dev, "Boot failed: %d\n", ret);
 	} else if (sysfs_streq(buf, "stop")) {
-		if (rproc->state != RPROC_RUNNING)
+		if (!rproc_can_shutdown(rproc))
 			return -EINVAL;
 
 		rproc_shutdown(rproc);
-- 
2.20.1
