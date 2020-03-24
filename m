Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-pj1-f67.google.com ([209.85.216.67]:55106 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbgCXVqZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 17:46:25 -0400
Received: by mail-pj1-f67.google.com with SMTP id np9so112426pjb.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 14:46:24 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v2 17/17] remoteproc: Make MCU synchronisation state changes on stop and crashed
Date: Tue, 24 Mar 2020 15:46:03 -0600
Message-Id: <20200324214603.14979-18-mathieu.poirier@linaro.org>
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: bjorn.andersson@linaro.org
Cc: ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Call on the MCU synchronisation state machine to determine the
synchronisation status to enact when the MCU is either stop from sysfs
or has crashed.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index dbb0a8467205..0608593cccc6 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1722,6 +1722,14 @@ static void rproc_crash_handler_work(struct work_struct *work)
 	dev_err(dev, "handling crash #%u in %s\n", ++rproc->crash_cnt,
 		rproc->name);
 
+	/*
+	 * The MCU has crashed - tell the core what operation to
+	 * use from hereon, i.e whether an external entity will
+	 * reboot the MCU or it is now the remoteproc core's
+	 * responsability.
+	 */
+	rproc_set_mcu_sync_state(rproc, RPROC_SYNC_STATE_CRASHED);
+
 	mutex_unlock(&rproc->lock);
 
 	if (!rproc->recovery_disabled)
@@ -1856,6 +1864,13 @@ void rproc_shutdown(struct rproc *rproc)
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
 	rproc->table_ptr = NULL;
+
+	/*
+	 * The MCU has been switched off - tell the core what operation to
+	 * use from hereon, i.e whether an external entity will reboot the
+	 * MCU or it is now the remoteproc core's responsability.
+	 */
+	rproc_set_mcu_sync_state(rproc, RPROC_SYNC_STATE_SHUTDOWN);
 out:
 	mutex_unlock(&rproc->lock);
 }
-- 
2.20.1
