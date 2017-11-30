Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 10/16] remoteproc: add memory device registering in rproc_add_carveout
Date: Thu, 30 Nov 2017 17:46:45 +0100
Message-ID: <1512060411-729-11-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Add the possibility to associate a memory device to
carveout.

Due to some memory mapping constraints, remoteproc related memory
allocations should be done in a specific memory region.
Constraint is not coming from remoteproc firmware (with defined
device address), but from remoteproc platform driver itself.

In that case, platform driver has to register a carveout region with
memory device. Memory device will be used for carveout, vring or buffer
allocation accorfing to its name.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 14 +++++++++++++-
 drivers/remoteproc/st_remoteproc.c   |  2 +-
 include/linux/remoteproc.h           |  3 ++-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 76d54bf..2b7effb 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -964,17 +964,29 @@ static int rproc_handle_carveout(struct rproc *rproc,
  * rproc_add_carveout() - register an allocated carveout region
  * @rproc: rproc handle
  * @mem: memory entry to register
+ * @memdev: true if carveout shoult be associated to a memory device
  *
  * This function registers specified memory entry in @rproc carveouts list.
  * Specified carveout should have been allocated before registering.
  */
-int rproc_add_carveout(struct rproc *rproc, struct rproc_mem_entry *mem)
+int rproc_add_carveout(struct rproc *rproc, struct rproc_mem_entry *mem, bool memdev)
 {
+	struct rproc_memdev *memd;
+
 	if (!rproc || !mem)
 		return -EINVAL;
 
 	mem->priv = (void *)CARVEOUT_EXTERNAL;
 
+	if (memdev) {
+		memd = rproc_memdev_add(rproc, mem);
+		if (IS_ERR(memd))
+			return -ENOMEM;
+		mem->memdev = memd;
+	} else {
+		mem->memdev = NULL;
+	}
+
 	list_add_tail(&mem->node, &rproc->carveouts);
 
 	return 0;
diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index 1549ce8..da42ec9 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -286,7 +286,7 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
 			return -EBUSY;
 		}
 
-		rproc_add_carveout(rproc, mem);
+		rproc_add_carveout(rproc, mem, false);
 	}
 
 	err = clk_prepare(ddata->clk);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 66e6863..d7e7485 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -325,6 +325,7 @@ struct rproc_mem_entry {
 	u32 da;
 	int (*release)(struct rproc *rproc, struct rproc_mem_entry *mem);
 	void *priv;
+	struct rproc_memdev *memdev;
 	char name[32];
 	struct list_head node;
 };
@@ -524,7 +525,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 int rproc_del(struct rproc *rproc);
 void rproc_free(struct rproc *rproc);
 
-int rproc_add_carveout(struct rproc *rproc, struct rproc_mem_entry *mem);
+int rproc_add_carveout(struct rproc *rproc, struct rproc_mem_entry *mem, bool memdev);
 
 int rproc_boot(struct rproc *rproc);
 void rproc_shutdown(struct rproc *rproc);
-- 
1.9.1
