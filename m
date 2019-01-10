Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 2/3] remoteproc: st: add reserved memory support
Date: Thu, 10 Jan 2019 14:50:50 +0100
Message-ID: <1547128251-44137-3-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1547128251-44137-1-git-send-email-loic.pallardy@st.com>
References: <1547128251-44137-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

ST remote processor needs some specified memory regions for
firmware and IPC.
Memory regions are defined as reserved memory and should
be registered in remoteproc core thanks to rproc_add_carveout
function before rproc_start. For this, st rproc driver implements
prepare ops.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/st_remoteproc.c | 91 +++++++++++++++++++++++++++++++++-----
 1 file changed, 80 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index aacef0ea3b90..51049d17b1e5 100644
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
@@ -91,6 +92,77 @@ static void st_rproc_kick(struct rproc *rproc, int vqid)
 		dev_err(dev, "failed to send message via mbox: %d\n", ret);
 }
 
+static int st_rproc_mem_alloc(struct rproc *rproc,
+			      struct rproc_mem_entry *mem)
+{
+	struct device *dev = rproc->dev.parent;
+	void *va;
+
+	va = ioremap_wc(mem->dma, mem->len);
+	if (!va) {
+		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
+			&mem->dma, mem->len);
+		return -ENOMEM;
+	}
+
+	/* Update memory entry va */
+	mem->va = va;
+
+	return 0;
+}
+
+static int st_rproc_mem_release(struct rproc *rproc,
+				struct rproc_mem_entry *mem)
+{
+	iounmap(mem->va);
+
+	return 0;
+}
+
+static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	struct device *dev = rproc->dev.parent;
+	struct device_node *np = dev->of_node;
+	struct rproc_mem_entry *mem;
+	struct reserved_mem *rmem;
+	struct of_phandle_iterator it;
+	int index = 0;
+
+	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
+	while (of_phandle_iterator_next(&it) == 0) {
+		rmem = of_reserved_mem_lookup(it.node);
+		if (!rmem) {
+			dev_err(dev, "unable to acquire memory-region\n");
+			return -EINVAL;
+		}
+
+		/*  No need to map vdev buffer */
+		if (strcmp(it.node->name, "vdev0buffer")) {
+			/* Register memory region */
+			mem = rproc_mem_entry_init(dev, NULL,
+						   (dma_addr_t)rmem->base,
+						   rmem->size, rmem->base,
+						   st_rproc_mem_alloc,
+						   st_rproc_mem_release,
+						   it.node->name);
+		} else {
+			/* Register reserved memory for vdev buffer allocation */
+			mem = rproc_of_resm_mem_entry_init(dev, index,
+							   rmem->size,
+							   rmem->base,
+							   it.node->name);
+		}
+
+		if (!mem)
+			return -ENOMEM;
+
+		rproc_add_carveout(rproc, mem);
+		index++;
+	}
+
+	return rproc_elf_load_rsc_table(rproc, fw);
+}
+
 static int st_rproc_start(struct rproc *rproc)
 {
 	struct st_rproc *ddata = rproc->priv;
@@ -158,9 +230,14 @@ static int st_rproc_stop(struct rproc *rproc)
 }
 
 static const struct rproc_ops st_rproc_ops = {
-	.kick		= st_rproc_kick,
-	.start		= st_rproc_start,
-	.stop		= st_rproc_stop,
+	.kick			= st_rproc_kick,
+	.start			= st_rproc_start,
+	.stop			= st_rproc_stop,
+	.parse_fw		= st_rproc_parse_fw,
+	.load			= rproc_elf_load_segments,
+	.find_loaded_rsc_table	= rproc_elf_find_loaded_rsc_table,
+	.sanity_check		= rproc_elf_sanity_check,
+	.get_boot_addr		= rproc_elf_get_boot_addr,
 };
 
 /*
@@ -254,12 +331,6 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
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
@@ -387,8 +458,6 @@ static int st_rproc_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(ddata->clk);
 
-	of_reserved_mem_device_release(&pdev->dev);
-
 	for (i = 0; i < ST_RPROC_MAX_VRING * MBOX_MAX; i++)
 		mbox_free_channel(ddata->mbox_chan[i]);
 
-- 
2.7.4
