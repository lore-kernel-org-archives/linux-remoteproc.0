Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 2/3] remoteproc: st: add da to va support
Date: Fri, 6 Jan 2017 18:16:12 +0100
Message-ID: <1483722973-21531-3-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1483722973-21531-1-git-send-email-loic.pallardy@st.com>
References: <1483722973-21531-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

ST remoteproc driver needs to provide information about
carveout memory region to allow remoteproc core to load
firmware and access trace buffer.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/st_remoteproc.c | 42 ++++++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index 2d99111..b6eb716 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -21,6 +21,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
@@ -51,6 +52,10 @@ struct st_rproc {
 	struct mbox_chan	*mbox_chan[ST_RPROC_MAX_VRING][MBOX_MAX];
 	struct mbox_client mbox_client_vq0;
 	struct mbox_client mbox_client_vq1;
+	phys_addr_t mem_phys;
+	phys_addr_t mem_reloc;
+	void *mem_region;
+	size_t mem_size;
 };
 
 static void st_rproc_mbox_callback(struct device *dev, u32 msg)
@@ -155,10 +160,23 @@ static int st_rproc_stop(struct rproc *rproc)
 	return sw_err ?: pwr_err;
 }
 
+static void *st_proc_da_to_va(struct rproc *rproc, u64 da, int len)
+{
+	struct st_rproc *ddata = rproc->priv;
+	int offset;
+
+	offset = da - ddata->mem_reloc;
+	if (offset < 0 || offset + len > ddata->mem_size)
+		return NULL;
+
+	return ddata->mem_region + offset;
+}
+
 static struct rproc_ops st_rproc_ops = {
 	.kick		= st_rproc_kick,
 	.start		= st_rproc_start,
 	.stop		= st_rproc_stop,
+	.da_to_va	= st_proc_da_to_va,
 };
 
 /*
@@ -206,7 +224,8 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rproc *rproc = platform_get_drvdata(pdev);
 	struct st_rproc *ddata = rproc->priv;
-	struct device_node *np = dev->of_node;
+	struct device_node *np = dev->of_node, *node;
+	struct resource res;
 	int err;
 
 	if (ddata->config->sw_reset) {
@@ -250,10 +269,23 @@ static int st_rproc_parse_dt(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	err = of_reserved_mem_device_init(dev);
-	if (err) {
-		dev_err(dev, "Failed to obtain shared memory\n");
+	node = of_parse_phandle(np, "memory-region", 0);
+	if (!node) {
+		dev_err(dev, "No memory-region specified\n");
+		return -EINVAL;
+	}
+
+	err = of_address_to_resource(node, 0, &res);
+	if (err)
 		return err;
+
+	ddata->mem_phys = ddata->mem_reloc = res.start;
+	ddata->mem_size = resource_size(&res);
+	ddata->mem_region = devm_ioremap_wc(dev, ddata->mem_phys, ddata->mem_size);
+	if (!ddata->mem_region) {
+		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
+			&res.start, ddata->mem_size);
+		return -EBUSY;
 	}
 
 	err = clk_prepare(ddata->clk);
@@ -390,8 +422,6 @@ static int st_rproc_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(ddata->clk);
 
-	of_reserved_mem_device_release(&pdev->dev);
-
 	mbox_free_channel(ddata->mbox_chan[0][MBOX_RX]);
 	mbox_free_channel(ddata->mbox_chan[1][MBOX_RX]);
 	mbox_free_channel(ddata->mbox_chan[0][MBOX_TX]);
-- 
1.9.1
