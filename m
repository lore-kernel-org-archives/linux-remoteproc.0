Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [PATCH] remoteproc: stm32: use workqueue to treat mailbox callback
Date: Fri, 25 Oct 2019 10:56:39 +0200
Message-ID: <20191025085639.2697-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, arnaud.pouliquen@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

The mailbox callback is under interrupt context. A consequence is
that RPMsg Callbacks are also in interrupt context.
Create workqueue to treat the callbacks in normal context.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/stm32_rproc.c | 38 +++++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 2cf4b2992bfc..f791770b8850 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -18,6 +18,7 @@
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
+#include <linux/workqueue.h>
 
 #include "remoteproc_internal.h"
 
@@ -31,7 +32,9 @@
 #define STM32_SMC_REG_WRITE	0x1
 
 #define STM32_MBX_VQ0		"vq0"
+#define STM32_MBX_VQ0_ID	0
 #define STM32_MBX_VQ1		"vq1"
+#define STM32_MBX_VQ1_ID	1
 #define STM32_MBX_SHUTDOWN	"shutdown"
 
 struct stm32_syscon {
@@ -58,6 +61,7 @@ struct stm32_mbox {
 	const unsigned char name[10];
 	struct mbox_chan *chan;
 	struct mbox_client client;
+	struct work_struct vq_work;
 	int vq_id;
 };
 
@@ -68,6 +72,7 @@ struct stm32_rproc {
 	u32 nb_rmems;
 	struct stm32_rproc_mem *rmems;
 	struct stm32_mbox mb[MBOX_NB_MBX];
+	struct workqueue_struct *workqueue;
 	bool secured_soc;
 };
 
@@ -261,13 +266,22 @@ static irqreturn_t stm32_rproc_wdg(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static void stm32_rproc_mb_vq_work(struct work_struct *work)
+{
+	struct stm32_mbox *mb = container_of(work, struct stm32_mbox, vq_work);
+	struct rproc *rproc = dev_get_drvdata(mb->client.dev);
+
+	if (rproc_vq_interrupt(rproc, mb->vq_id) == IRQ_NONE)
+		dev_dbg(&rproc->dev, "no message found in vq%d\n", mb->vq_id);
+}
+
 static void stm32_rproc_mb_callback(struct mbox_client *cl, void *data)
 {
 	struct rproc *rproc = dev_get_drvdata(cl->dev);
 	struct stm32_mbox *mb = container_of(cl, struct stm32_mbox, client);
+	struct stm32_rproc *ddata = rproc->priv;
 
-	if (rproc_vq_interrupt(rproc, mb->vq_id) == IRQ_NONE)
-		dev_dbg(&rproc->dev, "no message found in vq%d\n", mb->vq_id);
+	queue_work(ddata->workqueue, &mb->vq_work);
 }
 
 static void stm32_rproc_free_mbox(struct rproc *rproc)
@@ -285,7 +299,7 @@ static void stm32_rproc_free_mbox(struct rproc *rproc)
 static const struct stm32_mbox stm32_rproc_mbox[MBOX_NB_MBX] = {
 	{
 		.name = STM32_MBX_VQ0,
-		.vq_id = 0,
+		.vq_id = STM32_MBX_VQ0_ID,
 		.client = {
 			.rx_callback = stm32_rproc_mb_callback,
 			.tx_block = false,
@@ -293,7 +307,7 @@ static const struct stm32_mbox stm32_rproc_mbox[MBOX_NB_MBX] = {
 	},
 	{
 		.name = STM32_MBX_VQ1,
-		.vq_id = 1,
+		.vq_id = STM32_MBX_VQ1_ID,
 		.client = {
 			.rx_callback = stm32_rproc_mb_callback,
 			.tx_block = false,
@@ -332,6 +346,10 @@ static void stm32_rproc_request_mbox(struct rproc *rproc)
 			dev_warn(dev, "cannot get %s mbox\n", name);
 			ddata->mb[i].chan = NULL;
 		}
+		if (ddata->mb[i].vq_id >= 0) {
+			INIT_WORK(&ddata->mb[i].vq_work,
+				  stm32_rproc_mb_vq_work);
+		}
 	}
 }
 
@@ -589,12 +607,18 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 
 	rproc->has_iommu = false;
 	ddata = rproc->priv;
+	ddata->workqueue = create_workqueue(dev_name(dev));
+	if (!ddata->workqueue) {
+		dev_err(dev, "cannot create workqueue\n");
+		ret = -ENOMEM;
+		goto free_rproc;
+	}
 
 	platform_set_drvdata(pdev, rproc);
 
 	ret = stm32_rproc_parse_dt(pdev);
 	if (ret)
-		goto free_rproc;
+		goto free_wkq;
 
 	stm32_rproc_request_mbox(rproc);
 
@@ -606,6 +630,8 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 
 free_mb:
 	stm32_rproc_free_mbox(rproc);
+free_wkq:
+	destroy_workqueue(ddata->workqueue);
 free_rproc:
 	rproc_free(rproc);
 	return ret;
@@ -614,12 +640,14 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 static int stm32_rproc_remove(struct platform_device *pdev)
 {
 	struct rproc *rproc = platform_get_drvdata(pdev);
+	struct stm32_rproc *ddata = rproc->priv;
 
 	if (atomic_read(&rproc->power) > 0)
 		rproc_shutdown(rproc);
 
 	rproc_del(rproc);
 	stm32_rproc_free_mbox(rproc);
+	destroy_workqueue(ddata->workqueue);
 	rproc_free(rproc);
 
 	return 0;
-- 
2.17.1
