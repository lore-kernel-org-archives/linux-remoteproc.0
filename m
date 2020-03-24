Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40070 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbgCXVqL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 17:46:11 -0400
Received: by mail-pl1-f193.google.com with SMTP id h11so7960407plk.7
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 14:46:11 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v2 05/17] remoteproc: Get rid of tedious error path
Date: Tue, 24 Mar 2020 15:45:51 -0600
Message-Id: <20200324214603.14979-6-mathieu.poirier@linaro.org>
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: bjorn.andersson@linaro.org
Cc: ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com, linux-remoteproc@vger.kernel.org
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
