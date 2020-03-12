Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH 02/18] remoteproc: Introduce function rproc_set_mcu_sync_state()
Date: Thu, 12 Mar 2020 16:11:42 -0600
Message-Id: <20200312221158.3613-3-mathieu.poirier@linaro.org>
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Introduce function rproc_set_mcu_sync_state() to set the synchronisation
state of the MCU at various stages of the lifecycle process.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_internal.h | 38 ++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 5c93de5e00bb..73ea32df0156 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -24,6 +24,26 @@ struct rproc_debug_trace {
 	struct rproc_mem_entry trace_mem;
 };
 
+/*
+ * enum rproc_sync_states - remote processsor sync states
+ * @RPROC_SYNC_STATE_INIT	state to use when the remoteproc core
+ *				is initialising.
+ * @RPROC_SYNC_STATE_SHUTDOWN	state to use after the remoteproc core
+ *				has shutdown (rproc_shutdown()) the MCU.
+ * @RPROC_SYNC_STATE_CRASHED	state to use after the MCU has crashed but
+ *				has not been recovered by the remoteproc
+ *				core yet.
+ *
+ * Keeping these separate from the enum rproc_state in order to avoid
+ * introducing coupling between the state of the MCU and the synchronisation
+ * operation to use.
+ */
+enum rproc_mcu_sync_states {
+	RPROC_SYNC_STATE_INIT,
+	RPROC_SYNC_STATE_SHUTDOWN,
+	RPROC_SYNC_STATE_CRASHED,
+};
+
 /* from remoteproc_core.c */
 void rproc_release(struct kref *kref);
 irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
@@ -68,6 +88,24 @@ static inline bool rproc_sync_with_mcu(struct rproc *rproc)
 	return rproc->sync_with_mcu;
 }
 
+static inline void rproc_set_mcu_sync_state(struct rproc *rproc,
+					    unsigned int state)
+{
+	switch (state) {
+	case RPROC_SYNC_STATE_INIT:
+		rproc->sync_with_mcu = rproc->sync_states->on_init;
+		break;
+	case RPROC_SYNC_STATE_SHUTDOWN:
+		rproc->sync_with_mcu = rproc->sync_states->after_stop;
+		break;
+	case RPROC_SYNC_STATE_CRASHED:
+		rproc->sync_with_mcu = rproc->sync_states->after_crash;
+		break;
+	default:
+		break;
+	}
+}
+
 static inline
 int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
 {
-- 
2.20.1
