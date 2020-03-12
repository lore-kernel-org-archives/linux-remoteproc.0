Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34837 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgCLWMR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Mar 2020 18:12:17 -0400
Received: by mail-pg1-f193.google.com with SMTP id 7so3762162pgr.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2020 15:12:17 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH 15/18] remoteproc: Correctly deal with MCU synchronisation when changing FW image
Date: Thu, 12 Mar 2020 16:11:55 -0600
Message-Id: <20200312221158.3613-16-mathieu.poirier@linaro.org>
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com
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
