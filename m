Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v5 1/4] firmware: scm: Add new SCM call API for switching memory ownership
Date: Fri,  2 Jun 2017 00:47:18 +0530
Message-Id: <1496344641-6291-2-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1496344641-6291-1-git-send-email-akdwived@codeaurora.org>
References: <1496344641-6291-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Two different processors on a SOC need to switch memory ownership
during load/unload. To enable this, level second memory map table
need to be updated, which is done by secure layer.
This patch add the interface for making secure monitor call for
memory ownership switching request.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 drivers/firmware/qcom_scm-32.c |  6 +++
 drivers/firmware/qcom_scm-64.c | 27 +++++++++++++
 drivers/firmware/qcom_scm.c    | 92 ++++++++++++++++++++++++++++++++++++++++++
 drivers/firmware/qcom_scm.h    |  5 +++
 include/linux/qcom_scm.h       | 16 ++++++++
 5 files changed, 146 insertions(+)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index 93e3b96..a5e038d 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -596,3 +596,9 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
 {
 	return -ENODEV;
 }
+int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
+			  size_t mem_sz, phys_addr_t src, size_t src_sz,
+			  phys_addr_t dest, size_t dest_sz)
+{
+	return -ENODEV;
+}
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 6e6d561..cdfe986 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -439,3 +439,30 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
 
 	return ret;
 }
+
+int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
+			  size_t mem_sz, phys_addr_t src, size_t src_sz,
+			  phys_addr_t dest, size_t dest_sz)
+{
+	int ret;
+	struct qcom_scm_desc desc = {0};
+	struct arm_smccc_res res;
+
+	desc.args[0] = mem_region;
+	desc.args[1] = mem_sz;
+	desc.args[2] = src;
+	desc.args[3] = src_sz;
+	desc.args[4] = dest;
+	desc.args[5] = dest_sz;
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
index bb16510..9da3c6d 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -40,6 +40,18 @@ struct qcom_scm {
 	struct reset_controller_dev reset;
 };
 
+struct qcom_scm_current_perm_info {
+	__le32 vmid;
+	__le32 perm;
+	__le64 ctx;
+	__le32 ctx_size;
+};
+
+struct qcom_scm_mem_map_info {
+	__le64 mem_addr;
+	__le64 mem_size;
+};
+
 static struct qcom_scm *__scm;
 
 static int qcom_scm_clk_enable(void)
@@ -292,6 +304,86 @@ int qcom_scm_pas_shutdown(u32 peripheral)
 }
 EXPORT_SYMBOL(qcom_scm_pas_shutdown);
 
+/**
+ * qcom_scm_assign_mem() - Make a secure call to reassign memory ownership
+ *
+ * @mem_addr: mem region whose ownership need to be reassigned
+ * @mem_sz:   size of the region.
+ * @srcvm:    vmid for current set of owners, each set bit in
+ *            flag indicate a unique owner
+ * @newvm:    array having new owners and corrsponding permission
+ *            flags
+ * @dest_cnt: number of owners in next set.
+ * Return next set of owners on success.
+ */
+int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz, int srcvm,
+			struct qcom_scm_vmperm *newvm, int dest_cnt)
+{
+	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
+	struct qcom_scm_current_perm_info *destvm;
+	struct qcom_scm_mem_map_info *mem;
+	phys_addr_t memory_phys;
+	phys_addr_t dest_phys;
+	phys_addr_t src_phys;
+	size_t mem_all_sz;
+	size_t memory_sz;
+	size_t dest_sz;
+	size_t src_sz;
+	int next_vm;
+	__le32 *src;
+	void *ptr;
+	int ret;
+	int i;
+
+	src_sz = hweight_long(srcvm)*sizeof(*src);
+	memory_sz = sizeof(*mem);
+	dest_sz = dest_cnt*sizeof(*destvm);
+	mem_all_sz = src_sz + memory_sz + dest_sz;
+
+	ptr = dma_alloc_attrs(__scm->dev, ALIGN(mem_all_sz, SZ_64),
+		&src_phys, GFP_KERNEL, dma_attrs);
+	if (!ptr) {
+		pr_err("mem alloc failed\n");
+		return -ENOMEM;
+	}
+	/* Fill source vmid detail */
+	src = (__le32 *)(ptr);
+	ret = hweight_long(srcvm);
+	for (i = 0; i < ret; i++) {
+		src[i] = cpu_to_le32(ffs(srcvm) - 1);
+		srcvm ^= 1 << (ffs(srcvm) - 1);
+	}
+
+	/* Fill details of mem buff to map */
+	mem = (struct qcom_scm_mem_map_info *)(ptr + ALIGN(src_sz, SZ_64));
+	memory_phys = src_phys + ALIGN(src_sz, SZ_64);
+	mem[0].mem_addr = cpu_to_le64(mem_addr);
+	mem[0].mem_size = cpu_to_le64(mem_sz);
+
+	next_vm = 0;
+	/* Fill details of next vmid detail */
+	destvm = (struct qcom_scm_current_perm_info *)
+			(ptr + ALIGN(memory_sz, SZ_64) + ALIGN(src_sz, SZ_64));
+	dest_phys = memory_phys + ALIGN(memory_sz, SZ_64);
+	for (i = 0; i < dest_cnt; i++) {
+		destvm[i].vmid = cpu_to_le32(newvm[i].vmid);
+		destvm[i].perm = cpu_to_le32(newvm[i].perm);
+		destvm[i].ctx = 0;
+		destvm[i].ctx_size = 0;
+		next_vm |= BIT(newvm[i].vmid);
+	}
+	ret = __qcom_scm_assign_mem(__scm->dev, memory_phys,
+		memory_sz, src_phys, src_sz, dest_phys, dest_sz);
+	dma_free_attrs(__scm->dev, ALIGN(mem_all_sz, SZ_64),
+		ptr, src_phys, dma_attrs);
+	if (ret == 0)
+		return next_vm;
+	else if (ret > 0)
+		return -ret;
+	return ret;
+}
+EXPORT_SYMBOL(qcom_scm_assign_mem);
+
 static int qcom_scm_pas_reset_assert(struct reset_controller_dev *rcdev,
 				     unsigned long idx)
 {
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 9bea691..fe54b7b 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -95,5 +95,10 @@ extern int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
 					     size_t *size);
 extern int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr,
 					     u32 size, u32 spare);
+#define QCOM_MEM_PROT_ASSIGN_ID	0x16
+extern int  __qcom_scm_assign_mem(struct device *dev,
+				  phys_addr_t mem_region, size_t mem_sz,
+				  phys_addr_t src, size_t src_sz,
+				  phys_addr_t dest, size_t dest_sz);
 
 #endif
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index e538047..a9c284d 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -23,6 +23,19 @@ struct qcom_scm_hdcp_req {
 	u32 val;
 };
 
+struct qcom_scm_vmperm {
+	int vmid;
+	int perm;
+};
+
+#define QCOM_SCM_VMID_HLOS       0x3
+#define QCOM_SCM_VMID_MSS_MSA    0xF
+#define QCOM_SCM_PERM_READ       0x4
+#define QCOM_SCM_PERM_WRITE      0x2
+#define QCOM_SCM_PERM_EXEC       0x1
+#define QCOM_SCM_PERM_RW (QCOM_SCM_PERM_READ | QCOM_SCM_PERM_WRITE)
+#define QCOM_SCM_PERM_RWX (QCOM_SCM_PERM_RW | QCOM_SCM_PERM_EXEC)
+
 #if IS_ENABLED(CONFIG_QCOM_SCM)
 extern int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus);
 extern int qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus);
@@ -37,6 +50,9 @@ extern int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr,
 				  phys_addr_t size);
 extern int qcom_scm_pas_auth_and_reset(u32 peripheral);
 extern int qcom_scm_pas_shutdown(u32 peripheral);
+extern int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
+			       int src, struct qcom_scm_vmperm *newvm,
+			       int dest_cnt);
 extern void qcom_scm_cpu_power_down(u32 flags);
 extern u32 qcom_scm_get_version(void);
 extern int qcom_scm_set_remote_state(u32 state, u32 id);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
