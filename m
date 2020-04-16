Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [RFC 14/18] remoteproc: Add pa to da translation API
Date: Thu, 16 Apr 2020 18:13:27 +0200
Message-ID: <20200416161331.7606-15-arnaud.pouliquen@st.com>
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, arnaud.pouliquen@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Add remote proc API to allow IPC client to translate address from
local to device paradigm.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 24 ++++++++++++++++++++++++
 include/linux/remoteproc.h           |  4 ++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f9d04e59081c..72fb97f28048 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1939,6 +1939,30 @@ int rproc_add(struct rproc *rproc)
 }
 EXPORT_SYMBOL(rproc_add);
 
+/**
+ * rproc_pa_to_da() - memory translation from local physical address to
+ * remote device address
+ * @rproc: the remote processor handle to register
+ * @pa: local physical address
+ * @da: remote device address
+ *
+ * Return the device address associated to the physical address
+ * The translation is delegated to the platform driver if the ops is
+ * implemented. By default this function returns the physical address.
+ *
+ * Returns 0 on success and an appropriate error code otherwise.
+ */
+int rproc_pa_to_da(struct rproc *rproc, phys_addr_t pa, u64 *da)
+{
+	if (!rproc->ops->pa_to_da) {
+		*da = pa;
+		return 0;
+	}
+
+	return rproc->ops->pa_to_da(rproc, pa, da);
+}
+EXPORT_SYMBOL(rproc_pa_to_da);
+
 /**
  * rproc_type_release() - release a remote processor instance
  * @dev: the rproc's device
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index d7235f7356e2..7b8a6c3ef519 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -359,6 +359,7 @@ enum rsc_handling_status {
  * @stop:	power off the device
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
  * @da_to_va:	optional platform hook to perform address translations
+ * @pa_to_da:	optional platform hook to perform address translations
  * @parse_fw:	parse firmware to extract information (e.g. resource table)
  * @handle_rsc:	optional platform hook to handle vendor resources. Should return
  * RSC_HANDLED if resource was handled, RSC_IGNORED if not handled and a
@@ -375,6 +376,7 @@ struct rproc_ops {
 	int (*stop)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, int len);
+	int (*pa_to_da)(struct rproc *rproc, phys_addr_t pa, u64 *da);
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
 	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
 			  int offset, int avail);
@@ -618,6 +620,8 @@ struct rproc_mem_entry *
 rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, int len,
 			     u32 da, const char *name, ...);
 
+int rproc_pa_to_da(struct rproc *rproc, phys_addr_t pa, u64 *da);
+
 int rproc_boot(struct rproc *rproc);
 void rproc_shutdown(struct rproc *rproc);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
-- 
2.17.1
