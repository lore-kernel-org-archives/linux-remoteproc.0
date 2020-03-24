Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH 10/11] remoteproc: stm32: Introduce new loaded rsc ops for synchronisation
Date: Tue, 24 Mar 2020 16:03:28 -0600
Message-Id: <20200324220329.15523-11-mathieu.poirier@linaro.org>
In-Reply-To: <20200324220329.15523-1-mathieu.poirier@linaro.org>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org
Cc: ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Introduce new elf find loaded resource table rproc_ops functions to be
used when synchonising with an MCU.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 4268d71f191d..07be306c0fb1 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -317,6 +317,15 @@ static int stm32_rproc_sync_parse_fw(struct rproc *rproc,
 	return stm32_rproc_sync_elf_load_rsc_table(rproc, fw);
 }
 
+static struct resource_table *
+stm32_rproc_sync_elf_find_loaded_rsc_table(struct rproc *rproc,
+					   const struct firmware *fw)
+{
+	struct stm32_rproc *ddata = rproc->priv;
+
+	return (struct resource_table *)ddata->rsc_va;
+}
+
 static irqreturn_t stm32_rproc_wdg(int irq, void *data)
 {
 	struct platform_device *pdev = data;
@@ -604,6 +613,7 @@ static __maybe_unused struct rproc_ops st_rproc_sync_ops = {
 	.stop		= stm32_rproc_sync_stop,
 	.kick		= stm32_rproc_kick,
 	.parse_fw	= stm32_rproc_sync_parse_fw,
+	.find_loaded_rsc_table = stm32_rproc_sync_elf_find_loaded_rsc_table,
 };
 
 static const struct of_device_id stm32_rproc_match[] = {
-- 
2.20.1
