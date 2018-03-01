Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 13/13] remoteproc: st: add reserved memory support
Date: Thu, 1 Mar 2018 17:24:00 +0100
Message-ID: <1519921440-21356-14-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1519921440-21356-1-git-send-email-loic.pallardy@st.com>
References: <1519921440-21356-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

ST remote processor needs some specified memory regions for
firmware and IPC.
Memory regions are defined as reserved memory and should
be registered in remoteproc core thanks to rproc_add_carveout
function before rproc_start. For this, st rproc driver implements
prepare ops.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/st_remoteproc.c | 68 +++++++++++++++++++++++++++++++++-----
 1 file changed, 60 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index aacef0e..72a19a0 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -19,6 +19,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
@@ -91,6 +92,64 @@ static void st_rproc_kick(struct rproc *rproc, int vqid)
 		dev_err(dev, "failed to send message via mbox: %d\n", ret);
 }
 
+static int st_rproc_mem_release(struct rproc *rproc,
+				struct rproc_mem_entry *mem)
+{
+	struct device *dev = rproc->dev.parent;
+
+	devm_iounmap(dev, mem->va);
+
+	return 0;
+}
+
+static int st_rproc_prepare(struct rproc *rproc)
+{
+	struct device *dev = rproc->dev.parent;
+	struct device_node *np = dev->of_node;
+	struct rproc_mem_entry *mem;
+	void *va;
+	struct reserved_mem *rmem;
+	struct of_phandle_iterator it;
+	int err;
+
+	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
+	while ((err = of_phandle_iterator_next(&it)) == 0) {
+		va = NULL;
+		rmem = of_reserved_mem_lookup(it.node);
+
+		/*  No need to map vdev buffer */
+		if (strcmp(it.node->name, "vdev0buffer")) {
+			va = devm_ioremap_wc(dev, rmem->base, rmem->size);
+			if (!va) {
+				dev_err(dev, "Unable to map memory region: %pa+%zx\n",
+					&rmem->base, rmem->size);
+				return -EBUSY;
+			}
+
+			/* Register memory region */
+			mem = rproc_mem_entry_init(dev, va,
+						   (dma_addr_t)rmem->base,
+						   rmem->size, rmem->base,
+						   st_rproc_mem_release,
+						   it.node->name);
+		} else {
+			/* Register vdev buffer */
+			mem = rproc_mem_entry_init(dev, NULL,
+						   (dma_addr_t)rmem->base,
+						   rmem->size, rmem->base,
+						   NULL,
+						   it.node->name);
+		}
+
+		if (!mem)
+			return -ENOMEM;
+
+		rproc_add_carveout(rproc, mem);
+	}
+
+	return 0;
+}
+
 static int st_rproc_start(struct rproc *rproc)
 {
 	struct st_rproc *ddata = rproc->priv;
@@ -161,6 +220,7 @@ static int st_rproc_stop(struct rproc *rproc)
 	.kick		= st_rproc_kick,
 	.start		= st_rproc_start,
 	.stop		= st_rproc_stop,
+	.prepare	= st_rproc_prepare,
 };
 
 /*
@@ -254,12 +314,6 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	err = of_reserved_mem_device_init(dev);
-	if (err) {
-		dev_err(dev, "Failed to obtain shared memory\n");
-		return err;
-	}
-
 	err = clk_prepare(ddata->clk);
 	if (err)
 		dev_err(dev, "failed to get clock\n");
@@ -387,8 +441,6 @@ static int st_rproc_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(ddata->clk);
 
-	of_reserved_mem_device_release(&pdev->dev);
-
 	for (i = 0; i < ST_RPROC_MAX_VRING * MBOX_MAX; i++)
 		mbox_free_channel(ddata->mbox_chan[i]);
 
-- 
1.9.1
