Return-Path: <jliang@xilinx.com>
Return-Path: wendy.liang@xilinx.com
From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [RFC LINUX PATCH 2/3] remoteproc: add rproc_mem resource entry handler
Date: Fri, 24 Mar 2017 12:22:15 -0700
Message-ID: <1490383336-23117-3-git-send-email-jliang@xilinx.com>
In-Reply-To: <1490383336-23117-1-git-send-email-jliang@xilinx.com>
References: <1490383336-23117-1-git-send-email-jliang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Wendy Liang  <wendy.liang@xilinx.com>, Wendy Liang <jliang@xilinx.com>, Michal Simek" <michal.simek@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Wendy Liang <wendy.liang@xilinx.com>

Add resource table handler to handle fw_rsc_rproc_mem entry.

Signed-off-by: Wendy Liang <jliang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/remoteproc/remoteproc_core.c | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 3dabb20..0ffd9dc 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -720,6 +720,42 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	return ret;
 }
 
+/**
+ * rproc_handle_rproc_mem() - handle remote processor memory
+ * @rproc: rproc handle
+ * @rsc: the resource entry
+ * @avail: size of available data (for image validation)
+ *
+ * This function will handle declare the remote procesor's memory
+ * as DMA memory of the remoteproc, and then, the host can use it
+ * as shared memory, e.g. vrings ahre shared buffers.
+ */
+static int rproc_handle_rproc_mem(struct rproc *rproc,
+				 struct fw_rsc_rproc_mem *rsc,
+				 int offset, int avail)
+{
+	struct device *dev = &rproc->dev;
+	int ret;
+
+	if (sizeof(*rsc) > avail) {
+		dev_err(dev, "rproc_mem rsc is truncated\n");
+		return -EINVAL;
+	}
+
+	if (rsc->pa == FW_RSC_ADDR_ANY) {
+		dev_err(dev, "not able to declare rproc mem, pa is 0x%x\n",
+			rsc->pa);
+		return -EINVAL;
+	}
+	ret = dma_declare_coherent_memory(dev->parent, rsc->pa,
+		rsc->pa, rsc->len, DMA_MEMORY_MAP);
+	if (!ret) {
+		dev_err(dev, "failed to declare rproc mem as DMA mem.\n");
+		return -ENOMEM;
+	}
+	return 0;
+}
+
 /*
  * A lookup table for resource handlers. The indices are defined in
  * enum fw_resource_type.
@@ -729,6 +765,7 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	[RSC_DEVMEM] = (rproc_handle_resource_t)rproc_handle_devmem,
 	[RSC_TRACE] = (rproc_handle_resource_t)rproc_handle_trace,
 	[RSC_VDEV] = (rproc_handle_resource_t)rproc_handle_vdev,
+	[RSC_RPROC_MEM] = (rproc_handle_resource_t)rproc_handle_rproc_mem,
 };
 
 /* handle firmware resource entries before booting the remote processor */
-- 
1.9.1
