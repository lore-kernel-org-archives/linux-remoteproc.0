Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v8 3/4] remoteproc: qcom: Make secure world call for mem ownership switch
Date: Tue, 24 Oct 2017 21:22:26 +0530
Message-Id: <1508860347-25181-4-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1508860347-25181-1-git-send-email-akdwived@codeaurora.org>
References: <1508860347-25181-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

MSS proc on msm8996 can not access fw loaded region without stage
second translation of memory pages where mpss image are loaded.
This patch in order to enable mss boot on msm8996 invoke scm call
to switch or share ownership between apps and modem.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 91 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 88 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 39b9ee4..cbf3257 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -110,6 +110,7 @@ struct rproc_hexagon_res {
 	struct qcom_mss_reg_res *active_supply;
 	char **proxy_clk_names;
 	char **active_clk_names;
+	bool need_mem_protection;
 };
 
 struct q6v5 {
@@ -154,6 +155,10 @@ struct q6v5 {
 
 	struct qcom_rproc_subdev smd_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
+	bool need_mem_protection;
+	int mpss_perm;
+	int mba_perm;
+
 };
 
 static int q6v5_regulator_init(struct device *dev, struct reg_info *regs,
@@ -289,6 +294,35 @@ static struct resource_table *q6v5_find_rsc_table(struct rproc *rproc,
 	return &table;
 }
 
+static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int *current_perm,
+				   bool remote_owner, phys_addr_t addr,
+				   size_t size)
+{
+	struct qcom_scm_vmperm next;
+	int ret;
+
+	if (!qproc->need_mem_protection)
+		return 0;
+	if (remote_owner && *current_perm == BIT(QCOM_SCM_VMID_MSS_MSA))
+		return 0;
+	if (!remote_owner && *current_perm == BIT(QCOM_SCM_VMID_HLOS))
+		return 0;
+
+	next.vmid = remote_owner ? QCOM_SCM_VMID_MSS_MSA : QCOM_SCM_VMID_HLOS;
+	next.perm = remote_owner ? QCOM_SCM_PERM_RW : QCOM_SCM_PERM_RWX;
+
+	ret = qcom_scm_assign_mem(addr, ALIGN(size, SZ_4K),
+				  current_perm, &next, 1);
+	if (ret < 0) {
+		pr_err("Failed to assign memory access in range %p to %p to %s ret = %d\n",
+		       (void *)addr, (void *)(addr + size),
+		       remote_owner ? "mss" : "hlos", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct q6v5 *qproc = rproc->priv;
@@ -451,6 +485,8 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 {
 	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
 	dma_addr_t phys;
+	int mdata_perm;
+	int xferop_ret;
 	void *ptr;
 	int ret;
 
@@ -462,6 +498,13 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 
 	memcpy(ptr, fw->data, fw->size);
 
+	/* Hypervisor mapping to access metadata by modem */
+	mdata_perm = BIT(QCOM_SCM_VMID_HLOS);
+	ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm,
+				      true, phys, fw->size);
+	if (ret)
+		return -EAGAIN;
+
 	writel(phys, qproc->rmb_base + RMB_PMI_META_DATA_REG);
 	writel(RMB_CMD_META_DATA_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
 
@@ -471,6 +514,12 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 	else if (ret < 0)
 		dev_err(qproc->dev, "MPSS header authentication failed: %d\n", ret);
 
+	/* Metadata authentication done, remove modem access */
+	xferop_ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm,
+					     false, phys, fw->size);
+	if (xferop_ret)
+		dev_warn(qproc->dev,
+			 "mdt buffer not reclaimed system may become unstable\n");
 	dma_free_attrs(qproc->dev, fw->size, ptr, phys, dma_attrs);
 
 	return ret < 0 ? ret : 0;
@@ -580,6 +629,10 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 
 	/* Transfer ownership of modem ddr region with q6*/
 	boot_addr = relocate ? qproc->mpss_phys : min_addr;
+	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true,
+				      qproc->mpss_phys, qproc->mpss_size);
+	if (ret)
+		return -EAGAIN;
 	writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
 	writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
 	writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
@@ -599,6 +652,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 static int q6v5_start(struct rproc *rproc)
 {
 	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
+	int xfermemop_ret;
 	int ret;
 
 	ret = q6v5_regulator_enable(qproc, qproc->proxy_regs,
@@ -634,6 +688,12 @@ static int q6v5_start(struct rproc *rproc)
 		goto assert_reset;
 	}
 
+	/* Assign MBA image access in DDR to q6 */
+	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
+						qproc->mba_phys,
+						qproc->mba_size);
+	if (xfermemop_ret)
+		goto assert_reset;
 	writel(qproc->mba_phys, qproc->rmb_base + RMB_MBA_IMAGE_REG);
 
 	ret = q6v5proc_reset(qproc);
@@ -655,16 +715,22 @@ static int q6v5_start(struct rproc *rproc)
 
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
 
+	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false,
+						qproc->mba_phys,
+						qproc->mba_size);
+	if (xfermemop_ret)
+		dev_err(qproc->dev,
+			"Failed to reclaim mba buffer system may become unstable\n");
 	qproc->running = true;
 
 	q6v5_clk_disable(qproc->dev, qproc->proxy_clks,
@@ -674,12 +740,23 @@ static int q6v5_start(struct rproc *rproc)
 
 	return 0;
 
+reclaim_mem:
+	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm,
+						false, qproc->mpss_phys,
+						qproc->mpss_size);
+	WARN_ON(xfermemop_ret);
 halt_axi_ports:
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
 	q6v5_clk_disable(qproc->dev, qproc->active_clks,
 			 qproc->active_clk_count);
+	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false,
+						qproc->mba_phys,
+						qproc->mba_size);
+	if (xfermemop_ret)
+		dev_err(qproc->dev, "Failed to reclaim mba buffer, system may become unstable\n");
+
 assert_reset:
 	reset_control_assert(qproc->mss_restart);
 disable_vdd:
@@ -699,6 +776,7 @@ static int q6v5_stop(struct rproc *rproc)
 {
 	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
 	int ret;
+	u32 val;
 
 	qproc->running = false;
 
@@ -716,6 +794,9 @@ static int q6v5_stop(struct rproc *rproc)
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
 
+	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false,
+				      qproc->mpss_phys, qproc->mpss_size);
+	WARN_ON(ret);
 	reset_control_assert(qproc->mss_restart);
 	q6v5_clk_disable(qproc->dev, qproc->active_clks,
 			 qproc->active_clk_count);
@@ -1014,6 +1095,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
+	qproc->need_mem_protection = desc->need_mem_protection;
 	ret = q6v5_request_irq(qproc, pdev, "wdog", q6v5_wdog_interrupt);
 	if (ret < 0)
 		goto free_rproc;
@@ -1035,7 +1117,8 @@ static int q6v5_probe(struct platform_device *pdev)
 		ret = PTR_ERR(qproc->state);
 		goto free_rproc;
 	}
-
+	qproc->mpss_perm = BIT(QCOM_SCM_VMID_HLOS);
+	qproc->mba_perm = BIT(QCOM_SCM_VMID_HLOS);
 	qcom_add_smd_subdev(rproc, &qproc->smd_subdev);
 	qcom_add_ssr_subdev(rproc, &qproc->ssr_subdev, "mpss");
 
@@ -1091,6 +1174,7 @@ static int q6v5_remove(struct platform_device *pdev)
 		"mem",
 		NULL
 	},
+	.need_mem_protection = false,
 };
 
 static const struct rproc_hexagon_res msm8974_mss = {
@@ -1128,6 +1212,7 @@ static int q6v5_remove(struct platform_device *pdev)
 		"mem",
 		NULL
 	},
+	.need_mem_protection = false,
 };
 
 static const struct of_device_id q6v5_of_match[] = {
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
