Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [RFC ADD HYPERVISOR CALL SUPPORT 1/2] soc: qcom: Add hypervisor stage two translation request support.
Date: Mon,  9 Jan 2017 20:40:08 +0530
Message-Id: <1483974609-25522-2-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1483974609-25522-1-git-send-email-akdwived@codeaurora.org>
References: <1483974609-25522-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch add hypervisor support for mss bring up on msm8996.
MSS rproc driver make hypervisor request to add certain region
in IPA table owned by hepervisor and assign access permission
to modem. These regions are used to load MBA, MDT, FW into DDR.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 drivers/firmware/qcom_scm-64.c     |  16 +++
 drivers/firmware/qcom_scm.c        |  13 +++
 drivers/firmware/qcom_scm.h        |  10 ++
 drivers/remoteproc/qcom_q6v5_pil.c |  96 +++++++++++++++-
 drivers/soc/qcom/Kconfig           |   8 ++
 drivers/soc/qcom/Makefile          |   1 +
 drivers/soc/qcom/secure_buffer.c   | 229 +++++++++++++++++++++++++++++++++++++
 include/linux/qcom_scm.h           |   1 +
 include/soc/qcom/secure_buffer.h   |  51 +++++++++
 9 files changed, 419 insertions(+), 6 deletions(-)
 create mode 100644 drivers/soc/qcom/secure_buffer.c
 create mode 100644 include/soc/qcom/secure_buffer.h

diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 4a0f5ea..63b814c 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -358,3 +358,19 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 
 	return ret ? : res.a1;
 }
+
+int __qcom_scm_assign_mem(struct device *dev, void *data)
+{
+	int ret;
+	struct qcom_scm_desc *desc = (struct qcom_scm_desc *)data;
+	struct arm_smccc_res res;
+
+	desc->arginfo = QCOM_SCM_ARGS(7, SCM_RO, SCM_VAL, SCM_RO,
+					SCM_VAL, SCM_RO, SCM_VAL, SCM_VAL);
+
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
+				QCOM_MEM_PROT_ASSIGN_ID,
+				desc, &res);
+
+	return ret ? : res.a1;
+}
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 893f953ea..52394ac 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -292,6 +292,19 @@ int qcom_scm_pas_shutdown(u32 peripheral)
 }
 EXPORT_SYMBOL(qcom_scm_pas_shutdown);
 
+/**
+ * qcom_scm_assign_mem() -
+ * @desc:	descriptor to send to hypervisor
+ *
+ * Return 0 on success.
+ */
+int qcom_scm_assign_mem(void *desc)
+{
+
+	return __qcom_scm_assign_mem(__scm->dev, desc);
+}
+EXPORT_SYMBOL(qcom_scm_assign_mem);
+
 static int qcom_scm_pas_reset_assert(struct reset_controller_dev *rcdev,
 				     unsigned long idx)
 {
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 3584b00..f248dc9 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -47,6 +47,8 @@ extern int __qcom_scm_hdcp_req(struct device *dev,
 #define QCOM_SCM_PAS_SHUTDOWN_CMD	0x6
 #define QCOM_SCM_PAS_IS_SUPPORTED_CMD	0x7
 #define QCOM_SCM_PAS_MSS_RESET		0xa
+#define QCOM_SCM_SVC_MP				0xc
+#define QCOM_MEM_PROT_ASSIGN_ID		0x16
 extern bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral);
 extern int  __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
 		dma_addr_t metadata_phys);
@@ -55,6 +57,7 @@ extern int  __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
 extern int  __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral);
 extern int  __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral);
 extern int  __qcom_scm_pas_mss_reset(struct device *dev, bool reset);
+extern int  __qcom_scm_assign_mem(struct device *dev, void *desc);
 
 /* common error codes */
 #define QCOM_SCM_V2_EBUSY	-12
@@ -83,4 +86,11 @@ static inline int qcom_scm_remap_error(int err)
 	return -EINVAL;
 }
 
+enum scm_arg_types {
+	SCM_VAL,
+	SCM_RO,
+	SCM_RW,
+	SCM_BUFVAL,
+};
+
 #endif
diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index e5edefa..cbf833c 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -31,6 +31,7 @@
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 #include <linux/of_device.h>
+#include <soc/qcom/secure_buffer.h>
 
 #include "remoteproc_internal.h"
 #include "qcom_mdt_loader.h"
@@ -105,12 +106,19 @@ struct qcom_mss_reg_res {
 	int uA;
 };
 
+struct src_dest_vmid {
+	int *srcVM;
+	int *destVM;
+	int *destVMperm;
+};
+
 struct rproc_hexagon_res {
 	const char *hexagon_mba_image;
 	struct qcom_mss_reg_res proxy_supply[4];
 	struct qcom_mss_reg_res active_supply[2];
 	char **proxy_clk_names;
 	char **active_clk_names;
+	int version;
 };
 
 struct q6v5 {
@@ -127,6 +135,8 @@ struct q6v5 {
 
 	struct reset_control *mss_restart;
 
+	struct src_dest_vmid vmid_details;
+
 	struct qcom_smem_state *state;
 	unsigned stop_bit;
 
@@ -152,6 +162,13 @@ struct q6v5 {
 	phys_addr_t mpss_reloc;
 	void *mpss_region;
 	size_t mpss_size;
+	int version;
+};
+
+enum {
+	MSS_MSM8916,
+	MSS_MSM8974,
+	MSS_MSM8996,
 };
 
 static int q6v5_regulator_init(struct device *dev, struct reg_info *regs,
@@ -273,13 +290,46 @@ static void q6v5_clk_disable(struct device *dev,
 		clk_disable_unprepare(clks[i]);
 }
 
+int hyp_mem_access(struct q6v5 *qproc, phys_addr_t addr, size_t size)
+{
+	int src_count = 0;
+	int dest_count = 0;
+	int ret;
+	int i;
+
+	if (qproc->version != MSS_MSM8996)
+		return 0;
+
+	for (i = 0; i < 2; i++) {
+		if (qproc->vmid_details.srcVM[i] != 0)
+		src_count++;
+		if (qproc->vmid_details.destVM[i] != 0)
+		dest_count++;
+	}
+	ret = hyp_assign_phys(qproc->dev, addr, size,
+			qproc->vmid_details.srcVM,
+			src_count, qproc->vmid_details.destVM,
+			qproc->vmid_details.destVMperm, dest_count);
+	if (ret)
+		dev_err(qproc->dev,
+			"%s: failed for %pa address of size %zx\n",
+			__func__, &addr, size);
+	return ret;
+}
+
 static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct q6v5 *qproc = rproc->priv;
+	int ret;
 
 	memcpy(qproc->mba_region, fw->data, fw->size);
-
-	return 0;
+	qproc->vmid_details.srcVM = (int[2]) {VMID_HLOS, 0};
+	qproc->vmid_details.destVM = (int[2]) {VMID_MSS_MSA, 0};
+	qproc->vmid_details.destVMperm = (int[2]) {PERM_READ | PERM_WRITE, 0};
+	ret = hyp_mem_access(qproc, qproc->mba_phys, qproc->mba_size);
+	if (ret)
+		dev_err(qproc->dev, "Failed to assign memory, ret - %d\n", ret);
+	return ret;
 }
 
 static const struct rproc_fw_ops q6v5_fw_ops = {
@@ -445,6 +495,13 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 	}
 
 	memcpy(ptr, fw->data, fw->size);
+	/* Hypervisor support to access metadata by modem */
+	qproc->vmid_details.srcVM = (int[2]) {VMID_HLOS, 0};
+	qproc->vmid_details.destVM = (int[2]) {VMID_MSS_MSA, 0};
+	qproc->vmid_details.destVMperm = (int[2]) {PERM_READ | PERM_WRITE, 0};
+	ret = hyp_mem_access(qproc, phys, ALIGN(fw->size, SZ_4K));
+	if (ret)
+		dev_err(qproc->dev, "Failed to assign memory, ret - %d\n", ret);
 
 	writel(phys, qproc->rmb_base + RMB_PMI_META_DATA_REG);
 	writel(RMB_CMD_META_DATA_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
@@ -454,7 +511,14 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 		dev_err(qproc->dev, "MPSS header authentication timed out\n");
 	else if (ret < 0)
 		dev_err(qproc->dev, "MPSS header authentication failed: %d\n", ret);
-
+	/* Metadata authentication done, remove modem access */
+	qproc->vmid_details.srcVM = (int[2]) {VMID_MSS_MSA, 0};
+	qproc->vmid_details.destVM = (int[2]) {VMID_HLOS, 0};
+	qproc->vmid_details.destVMperm =
+		(int[2]) {PERM_READ | PERM_WRITE | PERM_EXEC, 0};
+	ret = hyp_mem_access(qproc, phys, ALIGN(fw->size, SZ_4K));
+	if (ret)
+		dev_err(qproc->dev, "Failed to assign memory, ret - %d\n", ret);
 	dma_free_attrs(qproc->dev, fw->size, ptr, phys, dma_attrs);
 
 	return ret < 0 ? ret : 0;
@@ -482,7 +546,14 @@ static int q6v5_mpss_validate(struct q6v5 *qproc, const struct firmware *fw)
 		boot_addr = qproc->mpss_phys;
 	else
 		boot_addr = fw_addr;
-
+	/* Hypervisor support to modem to access modem fw */
+	qproc->vmid_details.srcVM = (int[2]) {VMID_HLOS, 0};
+	qproc->vmid_details.destVM = (int[2]) {VMID_HLOS, VMID_MSS_MSA};
+	qproc->vmid_details.destVMperm =
+		(int[2]) {PERM_READ | PERM_WRITE, PERM_READ | PERM_WRITE};
+	ret = hyp_mem_access(qproc, boot_addr, qproc->mpss_size);
+	if (ret)
+		dev_err(qproc->dev, "Failed to assign memory, ret - %d\n", ret);
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);
 	for (i = 0; i < ehdr->e_phnum; i++, phdr++) {
@@ -560,6 +631,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 static int q6v5_start(struct rproc *rproc)
 {
 	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
+	int status;
 	int ret;
 
 	ret = q6v5_regulator_enable(qproc, qproc->proxy_regs,
@@ -616,14 +688,14 @@ static int q6v5_start(struct rproc *rproc)
 
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
 
 	qproc->running = true;
@@ -634,6 +706,15 @@ static int q6v5_start(struct rproc *rproc)
 				qproc->proxy_reg_count);
 	return 0;
 
+reclaim_mem:
+	qproc->vmid_details.srcVM = (int[2]) {VMID_HLOS, VMID_MSS_MSA};
+	qproc->vmid_details.destVM = (int[2]) {VMID_HLOS, 0};
+	qproc->vmid_details.destVMperm =
+		(int[2]) {PERM_READ | PERM_WRITE | PERM_EXEC, 0};
+	status = hyp_mem_access(qproc, qproc->mpss_phys, qproc->mpss_size);
+	if (status)
+		dev_err(qproc->dev,
+			"Failed to reclaim memory, ret - %d\n", ret);
 halt_axi_ports:
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
@@ -977,6 +1058,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
+	qproc->version = desc->version;
 	ret = q6v5_request_irq(qproc, pdev, "wdog", q6v5_wdog_interrupt);
 	if (ret < 0)
 		goto free_rproc;
@@ -1056,6 +1138,7 @@ static int q6v5_remove(struct platform_device *pdev)
 			"mem",
 			NULL
 	},
+	.version = MSS_MSM8916,
 };
 
 static const struct rproc_hexagon_res msm8974_mss = {
@@ -1093,6 +1176,7 @@ static int q6v5_remove(struct platform_device *pdev)
 			"mem",
 			NULL
 	},
+	.version = MSS_MSM8974,
 };
 static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 461b387..9459894 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -76,3 +76,11 @@ config QCOM_WCNSS_CTRL
 	help
 	  Client driver for the WCNSS_CTRL SMD channel, used to download nv
 	  firmware to a newly booted WCNSS chip.
+
+config QCOM_SECURE_BUFFER
+	bool "Helper functions for securing buffers through TZ"
+	help
+	 Say 'Y' here for targets that need to call into TZ to secure
+	 memory buffers. This ensures that only the correct clients can
+	 use this memory and no unauthorized access is made to the
+	 buffer
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index fdd664e..e85dc66 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -6,4 +6,5 @@ obj-$(CONFIG_QCOM_SMEM) +=	smem.o
 obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
 obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
 obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
+obj-$(CONFIG_QCOM_SECURE_BUFFER) += secure_buffer.o
 obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
diff --git a/drivers/soc/qcom/secure_buffer.c b/drivers/soc/qcom/secure_buffer.c
new file mode 100644
index 0000000..54eaa6f
--- /dev/null
+++ b/drivers/soc/qcom/secure_buffer.c
@@ -0,0 +1,229 @@
+/*
+ * Copyright (c) 2011-2017, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <linux/highmem.h>
+#include <linux/kernel.h>
+#include <linux/kref.h>
+#include <linux/mutex.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+#include <linux/dma-mapping.h>
+#include <linux/qcom_scm.h>
+#include <linux/dma-mapping.h>
+#include <soc/qcom/secure_buffer.h>
+
+DEFINE_MUTEX(secure_buffer_mutex);
+
+struct scm_desc {
+	u32 arginfo;
+	u64 args[10];
+};
+
+struct mem_prot_info {
+	phys_addr_t addr;
+	u64 size;
+};
+
+struct info_list {
+	struct mem_prot_info *list_head;
+	u64 list_size;
+};
+
+struct dest_vm_and_perm_info {
+	u32 vm;
+	u32 perm;
+	u32 *ctx;
+	u32 ctx_size;
+};
+
+struct dest_info_list {
+	struct dest_vm_and_perm_info *dest_info;
+	u64 list_size;
+};
+
+static void *qcom_secure_mem;
+#define QCOM_SECURE_MEM_SIZE (512 * 1024)
+#define PADDING 32
+
+static void populate_dest_info(int *dest_vmids, int nelements,
+			int *dest_perms, struct dest_info_list **list,
+			void *current_qcom_secure_mem)
+{
+	struct dest_vm_and_perm_info *dest_info;
+	int i;
+
+	dest_info = (struct dest_vm_and_perm_info *)current_qcom_secure_mem;
+
+	for (i = 0; i < nelements; i++) {
+		dest_info[i].vm = dest_vmids[i];
+		dest_info[i].perm = dest_perms[i];
+		dest_info[i].ctx = NULL;
+		dest_info[i].ctx_size = 0;
+	}
+
+	*list = (struct dest_info_list *)&dest_info[i];
+
+	(*list)->dest_info = dest_info;
+	(*list)->list_size = nelements * sizeof(struct dest_vm_and_perm_info);
+}
+
+static void get_info_list_from_table(struct sg_table *table,
+					struct info_list **list)
+{
+	int i;
+	struct scatterlist *sg;
+	struct mem_prot_info *info;
+
+	info = (struct mem_prot_info *)qcom_secure_mem;
+
+	for_each_sg(table->sgl, sg, table->nents, i) {
+		info[i].addr = page_to_phys(sg_page(sg));
+		info[i].size = sg->length;
+	}
+
+	*list = (struct info_list *)&(info[i]);
+
+	(*list)->list_head = info;
+	(*list)->list_size = table->nents * sizeof(struct mem_prot_info);
+}
+
+int hyp_assign_table(struct device *dev, struct sg_table *table,
+			u32 *source_vm_list, int source_nelems,
+			int *dest_vmids, int *dest_perms,
+			int dest_nelems)
+{
+	int ret;
+	struct info_list *info_list = NULL;
+	struct dest_info_list *dest_info_list = NULL;
+	struct scm_desc desc = {0};
+	u32 *source_vm_copy;
+	void *current_qcom_secure_mem;
+
+	size_t reqd_size = dest_nelems * sizeof(struct dest_vm_and_perm_info) +
+			table->nents * sizeof(struct mem_prot_info) +
+			sizeof(dest_info_list) + sizeof(info_list) + PADDING;
+
+	if (!qcom_secure_mem) {
+		pr_err("%s is not functional as qcom_secure_mem is not allocated.\n",
+				__func__);
+		return -ENOMEM;
+	}
+
+	if (reqd_size > QCOM_SECURE_MEM_SIZE) {
+		pr_err("%s: Not enough memory allocated. Required size %zd\n",
+				__func__, reqd_size);
+		return -EINVAL;
+	}
+
+	/*
+	 * We can only pass cache-aligned sizes to hypervisor, so we need
+	 * to kmalloc and memcpy the source_vm_list here.
+	 */
+	source_vm_copy = kmalloc_array(
+		source_nelems, sizeof(*source_vm_copy), GFP_KERNEL);
+	if (!source_vm_copy)
+		return -ENOMEM;
+	memcpy(source_vm_copy, source_vm_list,
+	       sizeof(*source_vm_list) * source_nelems);
+
+	mutex_lock(&secure_buffer_mutex);
+
+	get_info_list_from_table(table, &info_list);
+
+	current_qcom_secure_mem = &(info_list[1]);
+	populate_dest_info(dest_vmids, dest_nelems, dest_perms,
+				&dest_info_list, current_qcom_secure_mem);
+
+	desc.args[0] = virt_to_phys(info_list->list_head);
+	desc.args[1] = info_list->list_size;
+	desc.args[2] = virt_to_phys(source_vm_copy);
+	desc.args[3] = sizeof(*source_vm_copy) * source_nelems;
+	desc.args[4] = virt_to_phys(dest_info_list->dest_info);
+	desc.args[5] = dest_info_list->list_size;
+	desc.args[6] = 0;
+
+	dma_set_mask(dev, DMA_BIT_MASK(64));
+	dma_map_single(dev, (void *)source_vm_copy,
+			(size_t)(source_vm_copy + source_nelems),
+			DMA_TO_DEVICE);
+	dma_map_single(dev, (void *)info_list->list_head,
+		(size_t)(info_list->list_head +
+		(info_list->list_size / sizeof(*info_list->list_head))),
+		DMA_TO_DEVICE);
+	dma_map_single(dev,
+		(void *)dest_info_list->dest_info,
+		(size_t)(dest_info_list->dest_info +
+		(dest_info_list->list_size /
+		sizeof(*dest_info_list->dest_info))),
+		DMA_TO_DEVICE);
+
+	ret = qcom_scm_assign_mem((void *)&desc);
+	if (ret)
+		pr_info("%s: Failed to assign memory protection, ret = %d\n",
+			__func__, ret);
+
+	mutex_unlock(&secure_buffer_mutex);
+	kfree(source_vm_copy);
+	return ret;
+}
+
+int hyp_assign_phys(struct device *dev, phys_addr_t addr, u64 size,
+			u32 *source_vm_list, int source_nelems,
+			int *dest_vmids, int *dest_perms,
+			int dest_nelems)
+{
+	struct sg_table *table;
+	int ret;
+
+	table = kzalloc(sizeof(struct sg_table), GFP_KERNEL);
+	if (!table)
+		return -ENOMEM;
+	ret = sg_alloc_table(table, 1, GFP_KERNEL);
+	if (ret)
+		goto err1;
+
+	sg_set_page(table->sgl, phys_to_page(addr), size, 0);
+
+	ret = hyp_assign_table(dev, table, source_vm_list,
+				source_nelems, dest_vmids,
+				dest_perms, dest_nelems);
+	if (ret)
+		goto err2;
+
+	return ret;
+err2:
+	sg_free_table(table);
+err1:
+	kfree(table);
+	return ret;
+}
+
+static int __init alloc_secure_shared_memory(void)
+{
+	int ret = 0;
+
+	qcom_secure_mem = kzalloc(QCOM_SECURE_MEM_SIZE, GFP_KERNEL);
+	if (!qcom_secure_mem) {
+		/* Fallback to CMA-DMA memory */
+		qcom_secure_mem = dma_alloc_coherent(NULL, QCOM_SECURE_MEM_SIZE,
+						NULL, GFP_KERNEL);
+		if (!qcom_secure_mem) {
+			pr_err("Couldn't allocate memory for secure use-cases. hyp_assign_table will not work\n");
+			return -ENOMEM;
+		}
+	}
+
+	return ret;
+}
+pure_initcall(alloc_secure_shared_memory);
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index cc32ab8..f9ecf35 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -36,6 +36,7 @@ extern int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr,
 		phys_addr_t size);
 extern int qcom_scm_pas_auth_and_reset(u32 peripheral);
 extern int qcom_scm_pas_shutdown(u32 peripheral);
+extern int qcom_scm_assign_mem(void *desc);
 
 #define QCOM_SCM_CPU_PWR_DOWN_L2_ON	0x0
 #define QCOM_SCM_CPU_PWR_DOWN_L2_OFF	0x1
diff --git a/include/soc/qcom/secure_buffer.h b/include/soc/qcom/secure_buffer.h
new file mode 100644
index 0000000..2c7015d
--- /dev/null
+++ b/include/soc/qcom/secure_buffer.h
@@ -0,0 +1,51 @@
+/*
+ * Copyright (c) 2015-2016, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#ifndef __MSM_SECURE_BUFFER_H__
+#define __MSM_SECURE_BUFFER_H__
+
+enum vmid {
+	VMID_HLOS = 0x3,
+	VMID_MSS_MSA = 0xF,
+	VMID_INVAL = -1
+};
+
+#define PERM_READ			0x4
+#define PERM_WRITE			0x2
+#define PERM_EXEC			0x1
+
+#ifdef CONFIG_QCOM_SECURE_BUFFER
+int hyp_assign_table(struct device *dev, struct sg_table *table,
+			u32 *source_vm_list, int source_nelems,
+			int *dest_vmids, int *dest_perms,
+			int dest_nelems);
+int hyp_assign_phys(struct device *dev, phys_addr_t addr, u64 size,
+			u32 *source_vmlist, int source_nelems,
+			int *dest_vmids, int *dest_perms, int dest_nelems);
+#else
+static inline int hyp_assign_table(struct device *dev, struct sg_table *table,
+			u32 *source_vm_list, int source_nelems,
+			int *dest_vmids, int *dest_perms,
+			int dest_nelems)
+{
+	return -EPROTONOSUPPORT;
+}
+static inline int hyp_assign_phys(struct device *dev, phys_addr_t addr,
+			u64 size, u32 *source_vmlist, int source_nelems,
+			int *dest_vmids, int *dest_perms, int dest_nelems)
+{
+	return -EPROTONOSUPPORT;
+}
+#endif
+#endif
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
