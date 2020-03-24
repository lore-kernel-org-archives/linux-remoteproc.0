Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v2 09/17] remoteproc: Call the right core function based on synchronisation state
Date: Tue, 24 Mar 2020 15:45:55 -0600
Message-Id: <20200324214603.14979-10-mathieu.poirier@linaro.org>
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org
Cc: ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Call the right core function based on whether we should synchronise
with an MCU or boot it from scratch.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_internal.h | 36 +++++++++++-------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 73ea32df0156..5f711ceb97ba 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -106,38 +106,41 @@ static inline void rproc_set_mcu_sync_state(struct rproc *rproc,
 	}
 }
 
+#define RPROC_OPS_HELPER(__operation, ...)				\
+	do {								\
+		if (rproc_sync_with_mcu(rproc)) {			\
+			if (!rproc->sync_ops ||				\
+			    !rproc->sync_ops->__operation)		\
+				return 0;				\
+			return rproc->sync_ops->__operation(__VA_ARGS__); \
+		} else if (rproc->ops && rproc->ops->__operation)	\
+			return rproc->ops->__operation(__VA_ARGS__);	\
+	} while (0)							\
+
 static inline
 int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
 {
-	if (rproc->ops->sanity_check)
-		return rproc->ops->sanity_check(rproc, fw);
-
+	RPROC_OPS_HELPER(sanity_check, rproc, fw);
 	return 0;
 }
 
 static inline
 u32 rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
 {
-	if (rproc->ops->get_boot_addr)
-		return rproc->ops->get_boot_addr(rproc, fw);
-
+	RPROC_OPS_HELPER(get_boot_addr, rproc, fw);
 	return 0;
 }
 
 static inline
 int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
 {
-	if (rproc->ops->load)
-		return rproc->ops->load(rproc, fw);
-
+	RPROC_OPS_HELPER(load, rproc, fw);
 	return -EINVAL;
 }
 
 static inline int rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 {
-	if (rproc->ops->parse_fw)
-		return rproc->ops->parse_fw(rproc, fw);
-
+	RPROC_OPS_HELPER(parse_fw, rproc, fw);
 	return 0;
 }
 
@@ -145,10 +148,7 @@ static inline
 int rproc_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc, int offset,
 		     int avail)
 {
-	if (rproc->ops->handle_rsc)
-		return rproc->ops->handle_rsc(rproc, rsc_type, rsc, offset,
-					      avail);
-
+	RPROC_OPS_HELPER(handle_rsc, rproc, rsc_type, rsc, offset, avail);
 	return RSC_IGNORED;
 }
 
@@ -156,9 +156,7 @@ static inline
 struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
 						   const struct firmware *fw)
 {
-	if (rproc->ops->find_loaded_rsc_table)
-		return rproc->ops->find_loaded_rsc_table(rproc, fw);
-
+	RPROC_OPS_HELPER(find_loaded_rsc_table, rproc, fw);
 	return NULL;
 }
 
-- 
2.20.1
