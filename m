Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 03/16] remoteproc: introduce rproc_add_carveout function
Date: Thu, 30 Nov 2017 17:46:38 +0100
Message-ID: <1512060411-729-4-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch introduces a new API to allow platform driver to register
platform specific carveout regions.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c     | 22 ++++++++++++++++++++++
 drivers/remoteproc/remoteproc_internal.h |  7 +++++++
 include/linux/remoteproc.h               |  2 ++
 3 files changed, 31 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f23daf9..279320a 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -737,6 +737,7 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	carveout->dma = dma;
 	carveout->da = rsc->da;
 	carveout->release = rproc_release_carveout;
+	carveout->priv = (void *)CARVEOUT_RSC_ALLOCATED;
 
 	list_add_tail(&carveout->node, &rproc->carveouts);
 
@@ -751,6 +752,27 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	return ret;
 }
 
+/**
+ * rproc_add_carveout() - register an allocated carveout region
+ * @rproc: rproc handle
+ * @mem: memory entry to register
+ *
+ * This function registers specified memory entry in @rproc carveouts list.
+ * Specified carveout should have been allocated before registering.
+ */
+int rproc_add_carveout(struct rproc *rproc, struct rproc_mem_entry *mem)
+{
+	if (!rproc || !mem)
+		return -EINVAL;
+
+	mem->priv = (void *)CARVEOUT_EXTERNAL;
+
+	list_add_tail(&mem->node, &rproc->carveouts);
+
+	return 0;
+}
+EXPORT_SYMBOL(rproc_add_carveout);
+
 /*
  * A lookup table for resource handlers. The indices are defined in
  * enum fw_resource_type.
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index c1077be..69b22ac 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -23,6 +23,13 @@
 #include <linux/irqreturn.h>
 #include <linux/firmware.h>
 
+/* Indicate carveout origin */
+enum carveout_src {
+	CARVEOUT_RSC		= 0,
+	CARVEOUT_RSC_ALLOCATED	= 1,
+	CARVEOUT_EXTERNAL	= 2,
+};
+
 struct rproc;
 
 /**
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 8780f2e..5bd5175 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -522,6 +522,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 int rproc_del(struct rproc *rproc);
 void rproc_free(struct rproc *rproc);
 
+int rproc_add_carveout(struct rproc *rproc, struct rproc_mem_entry *mem);
+
 int rproc_boot(struct rproc *rproc);
 void rproc_shutdown(struct rproc *rproc);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
-- 
1.9.1
