Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v2 15/17] remoteproc: Correctly deal with MCU synchronisation when changing FW image
Date: Tue, 24 Mar 2020 15:46:01 -0600
Message-Id: <20200324214603.14979-16-mathieu.poirier@linaro.org>
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org
Cc: ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This patch prevents the firmware image from being displayed or changed when
the remoteproc core is synchronising with an MCU. This is needed since
there is no guarantee about the nature of the firmware image that is loaded
by the external entity.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_sysfs.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 7f8536b73295..4956577ad4b4 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -13,9 +13,20 @@
 static ssize_t firmware_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
+	ssize_t ret;
 	struct rproc *rproc = to_rproc(dev);
 
-	return sprintf(buf, "%s\n", rproc->firmware);
+	/*
+	 * In most instances there is no guarantee about the firmware
+	 * that was loaded by the external entity.  As such simply don't
+	 * print anything.
+	 */
+	if (rproc_sync_with_mcu(rproc))
+		ret = sprintf(buf, "\n");
+	else
+		ret = sprintf(buf, "%s\n", rproc->firmware);
+
+	return ret;
 }
 
 /* Change firmware name via sysfs */
@@ -33,6 +44,18 @@ static ssize_t firmware_store(struct device *dev,
 		return -EINVAL;
 	}
 
+	/*
+	 * There is no point in trying to change the firmware if the MCU
+	 * is currently running or if loading of the image is done by
+	 * another entity.
+	 */
+	if (rproc_sync_with_mcu(rproc)) {
+		dev_err(dev,
+			"can't change firmware while synchronising with MCU\n");
+		err = -EBUSY;
+		goto out;
+	}
+
 	if (rproc->state != RPROC_OFFLINE) {
 		dev_err(dev, "can't change firmware while running\n");
 		err = -EBUSY;
-- 
2.20.1
