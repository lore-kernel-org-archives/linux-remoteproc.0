Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40659 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgCLWMH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Mar 2020 18:12:07 -0400
Received: by mail-pf1-f193.google.com with SMTP id l184so3945615pfl.7
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2020 15:12:06 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH 05/18] remoteproc: Get rid of tedious error path
Date: Thu, 12 Mar 2020 16:11:45 -0600
Message-Id: <20200312221158.3613-6-mathieu.poirier@linaro.org>
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Get rid of tedious error management by moving firmware and operation
allocation after calling device_initialize().  That way we take advantage
of the automatic call to rproc_type_release() to cleanup after ourselves
when put_device() is called.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index d22e557f27ed..ee277bc5556c 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2054,12 +2054,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	if (!rproc)
 		return NULL;
 
-	if (rproc_alloc_firmware(rproc, name, firmware))
-		goto free_rproc;
-
-	if (rproc_alloc_ops(rproc, ops))
-		goto free_firmware;
-
 	rproc->name = name;
 	rproc->priv = &rproc[1];
 	rproc->auto_boot = true;
@@ -2070,12 +2064,17 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->dev.class = &rproc_class;
 	rproc->dev.driver_data = rproc;
 
+	if (rproc_alloc_firmware(rproc, name, firmware))
+		goto out;
+
+	if (rproc_alloc_ops(rproc, ops))
+		goto out;
+
 	/* Assign a unique device index and name */
 	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
 	if (rproc->index < 0) {
 		dev_err(dev, "ida_simple_get failed: %d\n", rproc->index);
-		put_device(&rproc->dev);
-		return NULL;
+		goto out;
 	}
 
 	dev_set_name(&rproc->dev, "remoteproc%d", rproc->index);
@@ -2098,11 +2097,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->state = RPROC_OFFLINE;
 
 	return rproc;
-
-free_firmware:
-	kfree(rproc->firmware);
-free_rproc:
-	kfree(rproc);
+out:
+	put_device(&rproc->dev);
 	return NULL;
 }
 EXPORT_SYMBOL(rproc_alloc);
-- 
2.20.1
