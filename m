Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v4 1/4] firmware: scm: Add support for shared access of a memory
Date: Mon, 15 May 2017 22:55:41 +0530
Message-Id: <1494869144-4174-2-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1494869144-4174-1-git-send-email-akdwived@codeaurora.org>
References: <1494869144-4174-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Two different processors on a SOC need to share memory during loading.
So memory access between them need to be synchronized, which is done
via level two memory mapping by secure layer.
This patch provide interface for making secure monitor call for access
sharing or access right transfer between two subsystems.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 drivers/firmware/qcom_scm-64.c | 27 +++++++++++++++
 drivers/firmware/qcom_scm.c    | 75 ++++++++++++++++++++++++++++++++++++++++++
 drivers/firmware/qcom_scm.h    |  4 +++
 include/linux/qcom_scm.h       | 14 ++++++++
 4 files changed, 120 insertions(+)

diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 6e6d561..77ef5c9 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -439,3 +439,30 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
 
 	return ret;
 }
+
+int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_addr,
+		size_t mem_sz, phys_addr_t srcVm, size_t srcVm_sz,
+		phys_addr_t destVm, size_t destVm_sz)
+{
+	int ret;
+	struct qcom_scm_desc desc = {0};
+	struct arm_smccc_res res;
+
+	desc.args[0] = mem_addr;
+	desc.args[1] = mem_sz;
+	desc.args[2] = srcVm;
+	desc.args[3] = srcVm_sz;
+	desc.args[4] = destVm;
+	desc.args[5] = destVm_sz;
+	desc.args[6] = 0;
+
+	desc.arginfo = QCOM_SCM_ARGS(7, QCOM_SCM_RO, QCOM_SCM_VAL,
+				QCOM_SCM_RO, QCOM_SCM_VAL, QCOM_SCM_RO,
+				QCOM_SCM_VAL, QCOM_SCM_VAL);
+
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
+				QCOM_MEM_PROT_ASSIGN_ID,
+				&desc, &res);
+
+	return ret ? : res.a1;
+}
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index bb16510..a2363e2 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -40,6 +40,24 @@ struct qcom_scm {
 	struct reset_controller_dev reset;
 };
 
+struct qcom_scm_current_perm_info {
+	__le32 destVm;
+	__le32 destVmPerm;
+	__le64 ctx;
+	__le32 ctx_size;
+};
+
+struct qcom_scm_mem_map_info {
+	__le64 mem_addr;
+	__le64 mem_size;
+};
+
+struct qcom_scm_hyp_map_info {
+	__le32 srcVm[2];
+	struct qcom_scm_mem_map_info mem_region;
+	struct qcom_scm_current_perm_info destVm[2];
+};
+
 static struct qcom_scm *__scm;
 
 static int qcom_scm_clk_enable(void)
@@ -292,6 +310,63 @@ int qcom_scm_pas_shutdown(u32 peripheral)
 }
 EXPORT_SYMBOL(qcom_scm_pas_shutdown);
 
+/**
+ * qcom_scm_assign_mem() - Provide interface to request to map a memory
+ * region into intermediate physical address table as well map
+ * access permissions for any other proc on SOC. So that when other proc
+ * applies the same intermediate physical address passed by requesting
+ * processor in this case apps proc, on memory bus it can access the
+ * region without fault.
+ * @mem_addr: Start pointer of region which need to be mapped.
+ * @mem_sz: Size of the region.
+ * @srcVm: Detail of current owners, each set bit in flag indicate id of
+ * shared owners.
+ * @newVm: Details of new owners and permission flags for each of them.
+ * @newVm_sz: Size of array pointed by newVm.
+ * Return 0 on success.
+ */
+int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz, int srcVm,
+		struct qcom_scm_destVmPerm *newVm, size_t newVm_sz)
+{
+	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
+	struct qcom_scm_hyp_map_info *hmi;
+	phys_addr_t addr[3];
+	size_t size[3];
+	int ret;
+	int i;
+
+	hmi = dma_alloc_attrs(__scm->dev, sizeof(*hmi),
+			&addr[1], GFP_KERNEL, dma_attrs);
+	hmi->mem_region.mem_addr = cpu_to_le64(mem_addr);
+	hmi->mem_region.mem_size = cpu_to_le64(mem_sz);
+
+	addr[0] = addr[1] + sizeof(hmi->srcVm);
+	size[0] = sizeof(hmi->mem_region);
+
+	ret = hweight_long(srcVm);
+	for (i = 0; i < ret; i++) {
+		hmi->srcVm[i] = cpu_to_le32(ffs(srcVm) - 0x1);
+		srcVm ^= 1 << (ffs(srcVm) - 0x1);
+	}
+	size[1] = ret * sizeof(srcVm);
+
+	ret = newVm_sz/sizeof(struct qcom_scm_destVmPerm);
+	for (i = 0; i < ret; i++) {
+		hmi->destVm[i].destVm = cpu_to_le32(newVm[i].destVm);
+		hmi->destVm[i].destVmPerm = cpu_to_le32(newVm[i].destVmPerm);
+		hmi->destVm[i].ctx = 0;
+		hmi->destVm[i].ctx_size = 0;
+	}
+	addr[2] = addr[0] + sizeof(hmi->mem_region);
+	size[2] = ret * sizeof(struct qcom_scm_current_perm_info);
+
+	ret = __qcom_scm_assign_mem(__scm->dev, addr[0],
+		size[0], addr[1], size[1], addr[2], size[2]);
+	dma_free_attrs(__scm->dev, sizeof(*hmi), hmi, addr[1], dma_attrs);
+	return ret;
+}
+EXPORT_SYMBOL(qcom_scm_assign_mem);
+
 static int qcom_scm_pas_reset_assert(struct reset_controller_dev *rcdev,
 				     unsigned long idx)
 {
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 9bea691..0837b96 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -95,5 +95,9 @@ extern int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
 					     size_t *size);
 extern int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr,
 					     u32 size, u32 spare);
+#define QCOM_MEM_PROT_ASSIGN_ID	0x16
+extern int  __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_addr,
+		size_t mem_sz, phys_addr_t srcVm, size_t srcVm_sz,
+		phys_addr_t destVm, size_t destVm_sz);
 
 #endif
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index e538047..cb930d9 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -23,6 +23,18 @@ struct qcom_scm_hdcp_req {
 	u32 val;
 };
 
+struct qcom_scm_destVmPerm {
+	int destVm;
+	int destVmPerm;
+};
+
+#define QCOM_SCM_VMID_HLOS       0x3
+#define QCOM_SCM_VMID_MSS_MSA    0xF
+#define QCOM_SCM_PERM_READ       0x4
+#define QCOM_SCM_PERM_WRITE      0x2
+#define QCOM_SCM_PERM_EXEC       0x1
+#define QCOM_SCM_PERM_RW (QCOM_SCM_PERM_READ | QCOM_SCM_PERM_WRITE)
+
 #if IS_ENABLED(CONFIG_QCOM_SCM)
 extern int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus);
 extern int qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus);
@@ -37,6 +49,8 @@ extern int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr,
 				  phys_addr_t size);
 extern int qcom_scm_pas_auth_and_reset(u32 peripheral);
 extern int qcom_scm_pas_shutdown(u32 peripheral);
+extern int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz, int currVm,
+			struct qcom_scm_destVmPerm *newVm, size_t newVm_sz);
 extern void qcom_scm_cpu_power_down(u32 flags);
 extern u32 qcom_scm_get_version(void);
 extern int qcom_scm_set_remote_state(u32 state, u32 id);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
