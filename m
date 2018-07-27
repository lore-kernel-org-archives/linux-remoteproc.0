Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v4 06/17] remoteproc: introduce rproc_add_carveout function
Date: Fri, 27 Jul 2018 15:14:41 +0200
Message-ID: <1532697292-14272-7-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch introduces a new API to allow platform driver to register
platform specific carveout regions.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 16 +++++++++++++++-
 include/linux/remoteproc.h           |  2 ++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index b76760e..fe6c4e4 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -747,7 +747,7 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	if (!carveout)
 		goto free_carv;
 
-	list_add_tail(&carveout->node, &rproc->carveouts);
+	rproc_add_carveout(rproc, carveout);
 
 	return 0;
 
@@ -761,6 +761,20 @@ static int rproc_handle_carveout(struct rproc *rproc,
 }
 
 /**
+ * rproc_add_carveout() - register an allocated carveout region
+ * @rproc: rproc handle
+ * @mem: memory entry to register
+ *
+ * This function registers specified memory entry in @rproc carveouts list.
+ * Specified carveout should have been allocated before registering.
+ */
+void rproc_add_carveout(struct rproc *rproc, struct rproc_mem_entry *mem)
+{
+	list_add_tail(&mem->node, &rproc->carveouts);
+}
+EXPORT_SYMBOL(rproc_add_carveout);
+
+/**
  * rproc_mem_entry_init() - allocate and initialize rproc_mem_entry struct
  * @dev: pointer on device struct
  * @va: virtual address
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 4bc961f..55f30fc 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -558,6 +558,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 int rproc_del(struct rproc *rproc);
 void rproc_free(struct rproc *rproc);
 
+void rproc_add_carveout(struct rproc *rproc, struct rproc_mem_entry *mem);
+
 struct rproc_mem_entry *
 rproc_mem_entry_init(struct device *dev,
 		     void *va, dma_addr_t dma, int len, u32 da,
-- 
1.9.1
