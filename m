Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46215 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgCLWMP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Mar 2020 18:12:15 -0400
Received: by mail-pg1-f195.google.com with SMTP id y30so3740239pga.13
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2020 15:12:14 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH 13/18] remoteproc: Introducting new functions to start and stop an MCU
Date: Thu, 12 Mar 2020 16:11:53 -0600
Message-Id: <20200312221158.3613-14-mathieu.poirier@linaro.org>
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Add new functions to replace direct calling of rproc->ops->start() and
rproc->ops->stop().  That way different behaviour can be played out
when booting an MCU or synchronising with it.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c     |  6 +++---
 drivers/remoteproc/remoteproc_internal.h | 12 ++++++++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 36c4d0f13ae9..806201af9470 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1330,7 +1330,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	}
 
 	/* power up the remote processor */
-	ret = rproc->ops->start(rproc);
+	ret = rproc_start_hw(rproc);
 	if (ret) {
 		dev_err(dev, "can't start rproc %s: %d\n", rproc->name, ret);
 		goto unprepare_subdevices;
@@ -1351,7 +1351,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 
 stop_rproc:
-	rproc->ops->stop(rproc);
+	rproc_stop_hw(rproc);
 unprepare_subdevices:
 	rproc_unprepare_subdevices(rproc);
 reset_table_ptr:
@@ -1483,7 +1483,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 	rproc->table_ptr = rproc->cached_table;
 
 	/* power off the remote processor */
-	ret = rproc->ops->stop(rproc);
+	ret = rproc_stop_hw(rproc);
 	if (ret) {
 		dev_err(dev, "can't stop rproc: %d\n", ret);
 		return ret;
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 53d63ee2c8bf..73a71ae12c01 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -159,4 +159,16 @@ struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
 	return NULL;
 }
 
+static inline int rproc_start_hw(struct rproc *rproc)
+{
+	RPROC_OPS_HELPER(start, rproc);
+	return -EINVAL;
+}
+
+static inline int rproc_stop_hw(struct rproc *rproc)
+{
+	RPROC_OPS_HELPER(stop, rproc);
+	return -EINVAL;
+}
+
 #endif /* REMOTEPROC_INTERNAL_H */
-- 
2.20.1
