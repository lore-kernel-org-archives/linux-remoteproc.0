Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH 17/18] remoteproc: Make MCU synchronisation state changes on stop and crashed
Date: Thu, 12 Mar 2020 16:11:57 -0600
Message-Id: <20200312221158.3613-18-mathieu.poirier@linaro.org>
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Call on the MCU synchronisation state machine to determine the
synchronisation status to enact when the MCU is either stop from sysfs
or has crashed.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 7ea4397a9004..f776a474da97 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1720,6 +1720,14 @@ static void rproc_crash_handler_work(struct work_struct *work)
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
@@ -1854,6 +1862,13 @@ void rproc_shutdown(struct rproc *rproc)
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
