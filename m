Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 1/7] remoteproc: add prepare and unprepare ops
Date: Tue, 24 Mar 2020 15:18:13 -0500
Message-ID: <20200324201819.23095-2-s-anna@ti.com>
In-Reply-To: <20200324201819.23095-1-s-anna@ti.com>
References: <20200324201819.23095-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Loic Pallardy <loic.pallardy@st.com>

On some SoC architecture, it is needed to enable HW like
clock, bus, regulator, memory region... before loading
co-processor firmware.

This patch introduces prepare and unprepare ops to execute
platform specific function before firmware loading and after
stop execution.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/remoteproc_core.c | 20 +++++++++++++++++++-
 include/linux/remoteproc.h           |  4 ++++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 26f6947267d2..aca6d022901a 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1394,12 +1394,22 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 		return ret;
 	}
 
+	/* Prepare rproc for firmware loading if needed */
+	if (rproc->ops->prepare) {
+		ret = rproc->ops->prepare(rproc);
+		if (ret) {
+			dev_err(dev, "can't prepare rproc %s: %d\n",
+				rproc->name, ret);
+			goto disable_iommu;
+		}
+	}
+
 	rproc->bootaddr = rproc_get_boot_addr(rproc, fw);
 
 	/* Load resource table, core dump segment list etc from the firmware */
 	ret = rproc_parse_fw(rproc, fw);
 	if (ret)
-		goto disable_iommu;
+		goto unprepare_rproc;
 
 	/* reset max_notifyid */
 	rproc->max_notifyid = -1;
@@ -1433,6 +1443,10 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
 	rproc->table_ptr = NULL;
+unprepare_rproc:
+	/* release HW resources if needed */
+	if (rproc->ops->unprepare)
+		rproc->ops->unprepare(rproc);
 disable_iommu:
 	rproc_disable_iommu(rproc);
 	return ret;
@@ -1838,6 +1852,10 @@ void rproc_shutdown(struct rproc *rproc)
 	/* clean up all acquired resources */
 	rproc_resource_cleanup(rproc);
 
+	/* release HW resources if needed */
+	if (rproc->ops->unprepare)
+		rproc->ops->unprepare(rproc);
+
 	rproc_disable_iommu(rproc);
 
 	/* Free the copy of the resource table */
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 07bd73a6d72a..ddce7a7775d1 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -355,6 +355,8 @@ enum rsc_handling_status {
 
 /**
  * struct rproc_ops - platform-specific device handlers
+ * @prepare:	prepare device for code loading
+ * @unprepare:	unprepare device after stop
  * @start:	power on the device and boot it
  * @stop:	power off the device
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
@@ -371,6 +373,8 @@ enum rsc_handling_status {
  * @get_boot_addr:	get boot address to entry point specified in firmware
  */
 struct rproc_ops {
+	int (*prepare)(struct rproc *rproc);
+	int (*unprepare)(struct rproc *rproc);
 	int (*start)(struct rproc *rproc);
 	int (*stop)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
-- 
2.23.0
