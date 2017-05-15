Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v4 3/4] remoteproc: qcom: Add new secure monitor call for access
Date: Mon, 15 May 2017 22:55:43 +0530
Message-Id: <1494869144-4174-4-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1494869144-4174-1-git-send-email-akdwived@codeaurora.org>
References: <1494869144-4174-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

MSS proc on msm8996 can not access fw loaded region without stage
second translation of memory pages where mpss image are loaded.
This patch to enable mss boot on msm8996 add these secure monitor
calls to switch ownership between apps and modem.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 84 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 2626954..57a4cfec 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -110,6 +110,7 @@ struct rproc_hexagon_res {
 	struct qcom_mss_reg_res *active_supply;
 	char **proxy_clk_names;
 	char **active_clk_names;
+	bool need_mem_protection;
 };
 
 struct q6v5 {
@@ -151,6 +152,7 @@ struct q6v5 {
 	phys_addr_t mpss_reloc;
 	void *mpss_region;
 	size_t mpss_size;
+	bool need_mem_protection;
 
 	struct qcom_rproc_subdev smd_subdev;
 };
@@ -288,6 +290,43 @@ static struct resource_table *q6v5_find_rsc_table(struct rproc *rproc,
 	return &table;
 }
 
+static int q6v5_assign_mem_to_subsys(struct q6v5 *qproc,
+		phys_addr_t addr, size_t size)
+{
+	struct qcom_scm_destVmPerm next[] = {{ QCOM_SCM_VMID_MSS_MSA,
+		(QCOM_SCM_PERM_READ | QCOM_SCM_PERM_WRITE)} };
+	int ret;
+
+	size = ALIGN(size, SZ_4K);
+	if (!qproc->need_mem_protection)
+		return 0;
+	ret = qcom_scm_assign_mem(addr, size,
+		BIT(QCOM_SCM_VMID_HLOS), next, sizeof(next));
+	if (ret)
+		pr_err("%s: Failed to assign memory access, ret = %d\n",
+			__func__, ret);
+	return ret;
+}
+
+static int q6v5_assign_mem_to_linux(struct q6v5 *qproc,
+		phys_addr_t addr, size_t size)
+{
+	struct qcom_scm_destVmPerm next[] = { { QCOM_SCM_VMID_HLOS,
+		(QCOM_SCM_PERM_READ | QCOM_SCM_PERM_WRITE | QCOM_SCM_PERM_EXEC)}
+		};
+	int ret;
+
+	size = ALIGN(size, SZ_4K);
+	if (!qproc->need_mem_protection)
+		return 0;
+	ret = qcom_scm_assign_mem(addr, size,
+		BIT(QCOM_SCM_VMID_MSS_MSA), next, sizeof(next));
+	if (ret)
+		pr_err("%s: Failed to assign memory access, ret = %d\n",
+			__func__, ret);
+	return ret;
+}
+
 static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct q6v5 *qproc = rproc->priv;
@@ -461,6 +500,13 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 
 	memcpy(ptr, fw->data, fw->size);
 
+	/* Hypervisor mapping to access metadata by modem */
+	ret = q6v5_assign_mem_to_subsys(qproc, phys, fw->size);
+	if (ret) {
+		dev_err(qproc->dev,
+			"Failed to assign metadata memory, ret - %d\n", ret);
+		return -ENOMEM;
+	}
 	writel(phys, qproc->rmb_base + RMB_PMI_META_DATA_REG);
 	writel(RMB_CMD_META_DATA_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
 
@@ -471,6 +517,11 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 		dev_err(qproc->dev,
 			"metadata authentication failed: %d\n", ret);
 
+	/* Metadata authentication done, remove modem access */
+	ret = q6v5_assign_mem_to_linux(qproc, phys, fw->size);
+	if (ret)
+		dev_err(qproc->dev,
+			"Failed to reclaim metadata memory, ret - %d\n", ret);
 	dma_free_attrs(qproc->dev, fw->size, ptr, phys, dma_attrs);
 
 	return ret < 0 ? ret : 0;
@@ -581,6 +632,10 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 	}
 	/* Transfer ownership of modem region with modem fw */
 	boot_addr = relocate ? qproc->mpss_phys : min_addr;
+	ret = q6v5_assign_mem_to_subsys(qproc,
+		qproc->mpss_phys, qproc->mpss_size);
+	if (ret)
+		return ret;
 	writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
 	writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
 	writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
@@ -600,6 +655,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 static int q6v5_start(struct rproc *rproc)
 {
 	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
+	int assign_mem_result;
 	int ret;
 
 	ret = q6v5_regulator_enable(qproc, qproc->proxy_regs,
@@ -635,6 +691,13 @@ static int q6v5_start(struct rproc *rproc)
 		goto assert_reset;
 	}
 
+	ret = q6v5_assign_mem_to_subsys(qproc,
+		qproc->mba_phys, qproc->mba_size);
+	if (ret) {
+		dev_err(qproc->dev,
+			"Failed to assign mba memory access, ret - %d\n", ret);
+		goto assert_reset;
+	}
 	writel(qproc->mba_phys, qproc->rmb_base + RMB_MBA_IMAGE_REG);
 
 	ret = q6v5proc_reset(qproc);
@@ -656,16 +719,21 @@ static int q6v5_start(struct rproc *rproc)
 
 	ret = q6v5_mpss_load(qproc);
 	if (ret)
-		goto halt_axi_ports;
+		goto reclaim_mem;
 
 	ret = wait_for_completion_timeout(&qproc->start_done,
 					  msecs_to_jiffies(5000));
 	if (ret == 0) {
 		dev_err(qproc->dev, "start timed out\n");
 		ret = -ETIMEDOUT;
-		goto halt_axi_ports;
+		goto reclaim_mem;
 	}
 
+	ret = q6v5_assign_mem_to_linux(qproc,
+		qproc->mba_phys, qproc->mba_size);
+	if (ret)
+		dev_err(qproc->dev,
+			"Failed to reclaim mba memory, ret - %d\n", ret);
 	qproc->running = true;
 
 	q6v5_clk_disable(qproc->dev, qproc->proxy_clks,
@@ -675,12 +743,19 @@ static int q6v5_start(struct rproc *rproc)
 
 	return 0;
 
+reclaim_mem:
+	assign_mem_result =
+		q6v5_assign_mem_to_linux(qproc,
+		qproc->mpss_phys, qproc->mpss_size);
 halt_axi_ports:
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
 	q6v5_clk_disable(qproc->dev, qproc->active_clks,
 			 qproc->active_clk_count);
+	assign_mem_result =
+		q6v5_assign_mem_to_linux(qproc,
+		qproc->mba_phys, qproc->mba_size);
 assert_reset:
 	reset_control_assert(qproc->mss_restart);
 disable_vdd:
@@ -717,6 +792,8 @@ static int q6v5_stop(struct rproc *rproc)
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
 
+	ret = q6v5_assign_mem_to_linux(qproc,
+			qproc->mpss_phys, qproc->mpss_size);
 	reset_control_assert(qproc->mss_restart);
 	q6v5_clk_disable(qproc->dev, qproc->active_clks,
 			 qproc->active_clk_count);
@@ -1014,6 +1091,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
+	qproc->need_mem_protection = desc->need_mem_protection;
 	ret = q6v5_request_irq(qproc, pdev, "wdog", q6v5_wdog_interrupt);
 	if (ret < 0)
 		goto free_rproc;
@@ -1089,6 +1167,7 @@ static int q6v5_remove(struct platform_device *pdev)
 		"mem",
 		NULL
 	},
+	.need_mem_protection = false,
 };
 
 static const struct rproc_hexagon_res msm8974_mss = {
@@ -1126,6 +1205,7 @@ static int q6v5_remove(struct platform_device *pdev)
 		"mem",
 		NULL
 	},
+	.need_mem_protection = false,
 };
 
 static const struct of_device_id q6v5_of_match[] = {
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
