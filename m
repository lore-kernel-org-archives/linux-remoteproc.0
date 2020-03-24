Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH 07/11] remoteproc: stm32: Get loaded resource table for synchronisation
Date: Tue, 24 Mar 2020 16:03:25 -0600
Message-Id: <20200324220329.15523-8-mathieu.poirier@linaro.org>
In-Reply-To: <20200324220329.15523-1-mathieu.poirier@linaro.org>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org
Cc: ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Get the resource table location when synchronising with the M4 so
that the remoteproc and rpmsg subsystem can be initialised properly.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 66 ++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index b8af15dd0510..5bac0baf8f4c 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -87,6 +87,7 @@ struct stm32_rproc {
 	struct stm32_mbox mb[MBOX_NB_MBX];
 	struct workqueue_struct *workqueue;
 	bool secured_soc;
+	void __iomem *rsc_va;
 };
 
 static int stm32_rproc_pa_to_da(struct rproc *rproc, phys_addr_t pa, u64 *da)
@@ -654,6 +655,65 @@ static int stm32_rproc_get_m4_status(struct stm32_rproc *ddata,
 	return regmap_read(ddata->m4_state.map, ddata->m4_state.reg, state);
 }
 
+static int stm32_rproc_da_to_pa(struct platform_device *pdev,
+				struct stm32_rproc *ddata,
+				u64 da, phys_addr_t *pa)
+{
+	struct device *dev = &pdev->dev;
+	struct stm32_rproc_mem *p_mem;
+	unsigned int i;
+
+	for (i = 0; i < ddata->nb_rmems; i++) {
+		p_mem = &ddata->rmems[i];
+
+		if (da < p_mem->dev_addr ||
+		    da >= p_mem->dev_addr + p_mem->size)
+			continue;
+
+		*pa = da - p_mem->dev_addr + p_mem->bus_addr;
+		dev_dbg(dev, "da %llx to pa %#x\n", da, *pa);
+
+		return 0;
+	}
+
+	dev_err(dev, "can't translate da %llx\n", da);
+
+	return -EINVAL;
+}
+
+static int stm32_rproc_get_loaded_rsc_table(struct platform_device *pdev,
+					    struct stm32_rproc *ddata)
+{
+	struct device *dev = &pdev->dev;
+	phys_addr_t rsc_pa;
+	u32 rsc_da;
+	int err;
+
+	err = regmap_read(ddata->rsctbl.map, ddata->rsctbl.reg, &rsc_da);
+	if (err) {
+		dev_err(dev, "failed to read rsc tbl addr\n");
+		return err;
+	}
+
+	if (!rsc_da)
+		/* no rsc table */
+		return 0;
+
+	err = stm32_rproc_da_to_pa(pdev, ddata, rsc_da, &rsc_pa);
+	if (err)
+		return err;
+
+	ddata->rsc_va = devm_ioremap_wc(dev, rsc_pa, RSC_TBL_SIZE);
+	if (IS_ERR_OR_NULL(ddata->rsc_va)) {
+		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
+			&rsc_pa, RSC_TBL_SIZE);
+		ddata->rsc_va = NULL;
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
 static int stm32_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -689,6 +749,12 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 		state = M4_STATE_OFF;
 	}
 
+	if (state == M4_STATE_CRUN) {
+		ret = stm32_rproc_get_loaded_rsc_table(pdev, ddata);
+		if (ret)
+			goto free_ddata;
+	}
+
 	rproc = rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
 	if (!rproc) {
 		ret = -ENOMEM;
-- 
2.20.1
