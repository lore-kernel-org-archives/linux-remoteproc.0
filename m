Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v2 2/3] remoteproc: qcom: Add scm call to protect modem mem in mss rproc drv.
Date: Mon, 30 Jan 2017 16:14:03 +0530
Message-Id: <1485773044-31489-3-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1485773044-31489-1-git-send-email-akdwived@codeaurora.org>
References: <1485773044-31489-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch add hypervisor call support for second stage translation from
mss remoteproc driver, this is required so that modem on msm8996 which is
based on armv8 architecture can access DDR region where modem firmware
are loaded.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 202 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 198 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index e5edefa..35eee68 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -93,6 +93,23 @@
 #define QDSS_BHS_ON			BIT(21)
 #define QDSS_LDO_BYP			BIT(22)
 
+struct dest_vm_and_perm_info {
+	__le32 vm;
+	__le32 perm;
+	__le32 *ctx;
+	__le32 ctx_size;
+};
+
+struct mem_prot_info {
+	__le64 addr;
+	__le64 size;
+};
+
+struct scm_desc {
+	__le32 arginfo;
+	__le64 args[10];
+};
+
 struct reg_info {
 	struct regulator *reg;
 	int uV;
@@ -111,6 +128,7 @@ struct rproc_hexagon_res {
 	struct qcom_mss_reg_res active_supply[2];
 	char **proxy_clk_names;
 	char **active_clk_names;
+	int version;
 };
 
 struct q6v5 {
@@ -152,8 +170,29 @@ struct q6v5 {
 	phys_addr_t mpss_reloc;
 	void *mpss_region;
 	size_t mpss_size;
+	int version;
+	int protection_cmd;
+};
+
+enum {
+	MSS_MSM8916,
+	MSS_MSM8974,
+	MSS_MSM8996,
 };
 
+enum {
+	ASSIG_ACCESS_MSA,
+	REMOV_ACCESS_MSA,
+	SHARE_ACCESS_MSA,
+	REMOV_SHARE_MSA,
+};
+
+#define VMID_HLOS	0x3
+#define VMID_MSS_MSA	0xF
+#define PERM_READ	0x4
+#define PERM_WRITE	0x2
+#define PERM_EXEC	0x1
+#define PERM_RW	(0x4 | 0x2)
 static int q6v5_regulator_init(struct device *dev, struct reg_info *regs,
 				const struct qcom_mss_reg_res *reg_res)
 {
@@ -273,12 +312,123 @@ static void q6v5_clk_disable(struct device *dev,
 		clk_disable_unprepare(clks[i]);
 }
 
+int hyp_mem_access(struct q6v5 *qproc, phys_addr_t addr, size_t size)
+{
+	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
+	struct dest_vm_and_perm_info *dest_info;
+	struct mem_prot_info *mem_prot_info;
+	struct scm_desc desc = {0};
+	__le32 *source_vm_copy;
+	__le64 mem_prot_phy;
+	int dest_count = 1;
+	int src_count = 1;
+	__le32 *perm = {0};
+	__le32 *dest = {0};
+	__le32 *src = {0};
+	__le64 phys_src;
+	__le64 phy_dest;
+	int ret;
+	int i;
+
+	if (qproc->version != MSS_MSM8996)
+		return 0;
+
+	switch (qproc->protection_cmd) {
+		case ASSIG_ACCESS_MSA: {
+			src = (int[2]) {VMID_HLOS, 0};
+			dest = (int[2]) {VMID_MSS_MSA, 0};
+			perm = (int[2]) {PERM_READ | PERM_WRITE, 0};
+			break;
+		}
+		case REMOV_ACCESS_MSA: {
+			src = (int[2]) {VMID_MSS_MSA, 0};
+			dest = (int[2]) {VMID_HLOS, 0};
+			perm = (int[2]) {PERM_READ | PERM_WRITE | PERM_EXEC, 0};
+			break;
+		}
+		case SHARE_ACCESS_MSA: {
+			src = (int[2]) {VMID_HLOS, 0};
+			dest = (int[2]) {VMID_HLOS, VMID_MSS_MSA};
+			perm = (int[2]) {PERM_RW, PERM_RW};
+			dest_count = 2;
+			break;
+		}
+		case REMOV_SHARE_MSA: {
+			src = (int[2]) {VMID_HLOS, VMID_MSS_MSA};
+			dest = (int[2]) {VMID_HLOS, 0};
+			perm = (int[2]) {PERM_READ | PERM_WRITE | PERM_EXEC, 0};
+			src_count = 2;
+			break;
+		}
+		default: {
+			break;
+		}
+	}
+
+	source_vm_copy = dma_alloc_attrs(qproc->dev,
+				src_count*sizeof(*source_vm_copy), &phys_src,
+				GFP_KERNEL, dma_attrs);
+	if (!source_vm_copy) {
+		dev_err(qproc->dev,
+			"failed to allocate buffer to pass source vmid detail\n");
+		return -ENOMEM;
+	}
+	memcpy(source_vm_copy, src, sizeof(*source_vm_copy) * src_count);
+
+	dest_info = dma_alloc_attrs(qproc->dev,
+			dest_count*sizeof(*dest_info), &phy_dest,
+			GFP_KERNEL, dma_attrs);
+	if (!dest_info) {
+		dev_err(qproc->dev,
+			"failed to allocate buffer to pass destination vmid detail\n");
+		return -ENOMEM;
+	}
+	for (i = 0; i < dest_count; i++) {
+		dest_info[i].vm = dest[i];
+		dest_info[i].perm = perm[i];
+		dest_info[i].ctx = NULL;
+		dest_info[i].ctx_size = 0;
+	}
+
+	mem_prot_info = dma_alloc_attrs(qproc->dev,
+				sizeof(*mem_prot_info), &mem_prot_phy,
+				GFP_KERNEL, dma_attrs);
+	if (!dest_info) {
+		dev_err(qproc->dev,
+				"failed to allocate buffer to pass protected mem detail\n");
+		return -ENOMEM;
+	}
+	mem_prot_info->addr = addr;
+	mem_prot_info->size = size;
+
+	desc.args[0] = mem_prot_phy;
+	desc.args[1] = sizeof(*mem_prot_info);
+	desc.args[2] = phys_src;
+	desc.args[3] = sizeof(*source_vm_copy) * src_count;
+	desc.args[4] = phy_dest;
+	desc.args[5] = dest_count*sizeof(*dest_info);
+	desc.args[6] = 0;
+
+	ret = qcom_scm_assign_mem(&desc);
+	if (ret)
+		pr_info("%s: Failed to assign memory protection, ret = %d\n",
+			__func__, ret);
+
+	/* SCM call has returned free up buffers passed to secure domain */
+	dma_free_attrs(qproc->dev, src_count*sizeof(*source_vm_copy),
+		source_vm_copy, phys_src, dma_attrs);
+	dma_free_attrs(qproc->dev, dest_count*sizeof(*dest_info),
+		dest_info, phy_dest, dma_attrs);
+	dma_free_attrs(qproc->dev, sizeof(*mem_prot_info), mem_prot_info,
+		mem_prot_phy, dma_attrs);
+	return ret;
+}
+
 static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct q6v5 *qproc = rproc->priv;
 
 	memcpy(qproc->mba_region, fw->data, fw->size);
-
 	return 0;
 }
 
@@ -446,6 +596,14 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 
 	memcpy(ptr, fw->data, fw->size);
 
+	/* Hypervisor support to access metadata by modem */
+	qproc->protection_cmd = ASSIG_ACCESS_MSA;
+	ret = hyp_mem_access(qproc, phys, ALIGN(fw->size, SZ_4K));
+	if (ret) {
+		dev_err(qproc->dev, "Failed to assign memory, ret - %d\n", ret);
+		return -ENOMEM;
+	}
+
 	writel(phys, qproc->rmb_base + RMB_PMI_META_DATA_REG);
 	writel(RMB_CMD_META_DATA_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
 
@@ -454,7 +612,11 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 		dev_err(qproc->dev, "MPSS header authentication timed out\n");
 	else if (ret < 0)
 		dev_err(qproc->dev, "MPSS header authentication failed: %d\n", ret);
-
+	/* Metadata authentication done, remove modem access */
+	qproc->protection_cmd = REMOV_ACCESS_MSA;
+	ret = hyp_mem_access(qproc, phys, ALIGN(fw->size, SZ_4K));
+	if (ret)
+		dev_err(qproc->dev, "Failed to assign memory, ret - %d\n", ret);
 	dma_free_attrs(qproc->dev, fw->size, ptr, phys, dma_attrs);
 
 	return ret < 0 ? ret : 0;
@@ -483,6 +645,13 @@ static int q6v5_mpss_validate(struct q6v5 *qproc, const struct firmware *fw)
 	else
 		boot_addr = fw_addr;
 
+	/* Hypervisor support to modem to access modem fw */
+	qproc->protection_cmd = SHARE_ACCESS_MSA;
+	ret = hyp_mem_access(qproc, boot_addr, qproc->mpss_size);
+	if (ret) {
+		dev_err(qproc->dev, "Failed to assign memory, ret - %d\n", ret);
+		return -ENOMEM;
+	}
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);
 	for (i = 0; i < ehdr->e_phnum; i++, phdr++) {
@@ -595,6 +764,12 @@ static int q6v5_start(struct rproc *rproc)
 		goto assert_reset;
 	}
 
+	qproc->protection_cmd = ASSIG_ACCESS_MSA;
+	ret = hyp_mem_access(qproc, qproc->mba_phys, qproc->mba_size);
+	if (ret) {
+		dev_err(qproc->dev, "Failed to assign memory, ret - %d\n", ret);
+		goto assert_reset;
+	}
 	writel(qproc->mba_phys, qproc->rmb_base + RMB_MBA_IMAGE_REG);
 
 	ret = q6v5proc_reset(qproc);
@@ -616,16 +791,21 @@ static int q6v5_start(struct rproc *rproc)
 
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
 
+	qproc->protection_cmd = REMOV_ACCESS_MSA;
+	ret = hyp_mem_access(qproc, qproc->mba_phys, qproc->mba_size);
+	if (ret)
+		dev_err(qproc->dev,
+			"Failed to reclaim memory, ret - %d\n", ret);
 	qproc->running = true;
 
 	q6v5_clk_disable(qproc->dev, qproc->proxy_clks,
@@ -634,7 +814,18 @@ static int q6v5_start(struct rproc *rproc)
 				qproc->proxy_reg_count);
 	return 0;
 
+reclaim_mem:
+	qproc->protection_cmd = REMOV_SHARE_MSA;
+	ret = hyp_mem_access(qproc, qproc->mpss_phys, qproc->mpss_size);
+	if (ret)
+		dev_err(qproc->dev,
+			"Failed to reclaim memory, ret - %d\n", ret);
 halt_axi_ports:
+	qproc->protection_cmd = REMOV_ACCESS_MSA;
+	ret = hyp_mem_access(qproc, qproc->mba_phys, qproc->mba_size);
+	if (ret)
+		dev_err(qproc->dev,
+			"Failed to reclaim memory, ret - %d\n", ret);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
@@ -977,6 +1168,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
+	qproc->version = desc->version;
 	ret = q6v5_request_irq(qproc, pdev, "wdog", q6v5_wdog_interrupt);
 	if (ret < 0)
 		goto free_rproc;
@@ -1056,6 +1248,7 @@ static int q6v5_remove(struct platform_device *pdev)
 			"mem",
 			NULL
 	},
+	.version = MSS_MSM8916,
 };
 
 static const struct rproc_hexagon_res msm8974_mss = {
@@ -1093,6 +1286,7 @@ static int q6v5_remove(struct platform_device *pdev)
 			"mem",
 			NULL
 	},
+	.version = MSS_MSM8974,
 };
 static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
