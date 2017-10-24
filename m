Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v8 1/4] firmware: scm: Add new SCM call API for switching memory ownership
Date: Tue, 24 Oct 2017 21:22:24 +0530
Message-Id: <1508860347-25181-2-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1508860347-25181-1-git-send-email-akdwived@codeaurora.org>
References: <1508860347-25181-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Two different processors on a SOC need to switch memory ownership
during load/unload. To enable this, second level memory map table
need to be updated, which is done by secure layer.
This patch adds the interface for making secure monitor call for
memory ownership switching request.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 drivers/firmware/qcom_scm-32.c |  7 +++
 drivers/firmware/qcom_scm-64.c | 27 ++++++++++++
 drivers/firmware/qcom_scm.c    | 98 ++++++++++++++++++++++++++++++++++++++++++
 drivers/firmware/qcom_scm.h    |  5 +++
 include/linux/qcom_scm.h       | 16 +++++++
 5 files changed, 153 insertions(+)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index 93e3b96..758b910 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -596,3 +596,10 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
 {
 	return -ENODEV;
 }
+
+int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
+			  size_t mem_sz, phys_addr_t src, size_t src_sz,
+			  phys_addr_t dest, size_t dest_sz)
+{
+	return -ENODEV;
+}
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 6e6d561..6bdbeae 100644
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
+				     QCOM_SCM_RO, QCOM_SCM_VAL, QCOM_SCM_RO,
+				     QCOM_SCM_VAL, QCOM_SCM_VAL);
+
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
+			    QCOM_MEM_PROT_ASSIGN_ID,
+			    &desc, &res);
+
+	return ret ? : res.a1;
+}
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index bb16510..0511af98 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -40,6 +40,19 @@ struct qcom_scm {
 	struct reset_controller_dev reset;
 };
 
+struct qcom_scm_current_perm_info {
+	__le32 vmid;
+	__le32 perm;
+	__le64 ctx;
+	__le32 ctx_size;
+	__le32 unused;
+};
+
+struct qcom_scm_mem_map_info {
+	__le64 mem_addr;
+	__le64 mem_size;
+};
+
 static struct qcom_scm *__scm;
 
 static int qcom_scm_clk_enable(void)
@@ -292,6 +305,91 @@ int qcom_scm_pas_shutdown(u32 peripheral)
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
+int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
+			unsigned int *srcvm,
+			struct qcom_scm_vmperm *newvm, int dest_cnt)
+{
+	struct qcom_scm_current_perm_info *destvm;
+	struct qcom_scm_mem_map_info *mem_to_map;
+	phys_addr_t mem_to_map_phys;
+	phys_addr_t dest_phys;
+	phys_addr_t ptr_phys;
+	size_t mem_to_map_sz;
+	size_t dest_sz;
+	size_t src_sz;
+	size_t ptr_sz;
+	int next_vm;
+	__le32 *src;
+	void *ptr;
+	int ret;
+	int len;
+	int i;
+
+	src_sz = hweight_long(*srcvm) * sizeof(*src);
+	mem_to_map_sz = sizeof(*mem_to_map);
+	dest_sz = dest_cnt * sizeof(*destvm);
+	ptr_sz = ALIGN(src_sz, SZ_64) + ALIGN(mem_to_map_sz, SZ_64) +
+			ALIGN(dest_sz, SZ_64);
+
+	ptr = dma_alloc_coherent(__scm->dev, ptr_sz, &ptr_phys, GFP_KERNEL);
+
+	if (!ptr)
+		return -ENOMEM;
+
+	/* Fill source vmid detail */
+	src = ptr;
+	len = hweight_long(*srcvm);
+	for (i = 0; i < len; i++) {
+		src[i] = cpu_to_le32(ffs(*srcvm) - 1);
+		*srcvm ^= 1 << (ffs(*srcvm) - 1);
+	}
+
+	/* Fill details of mem buff to map */
+	mem_to_map = ptr + ALIGN(src_sz, SZ_64);
+	mem_to_map_phys = ptr_phys + ALIGN(src_sz, SZ_64);
+	mem_to_map[0].mem_addr = cpu_to_le64(mem_addr);
+	mem_to_map[0].mem_size = cpu_to_le64(mem_sz);
+
+	next_vm = 0;
+	/* Fill details of next vmid detail */
+	destvm = ptr + ALIGN(mem_to_map_sz, SZ_64) + ALIGN(src_sz, SZ_64);
+	dest_phys = ptr_phys + ALIGN(src_sz, SZ_64) +
+			ALIGN(mem_to_map_sz, SZ_64);
+	for (i = 0; i < dest_cnt; i++) {
+		destvm[i].vmid = cpu_to_le32(newvm[i].vmid);
+		destvm[i].perm = cpu_to_le32(newvm[i].perm);
+		destvm[i].ctx = 0;
+		destvm[i].ctx_size = 0;
+		next_vm |= BIT(newvm[i].vmid);
+	}
+
+	ret = __qcom_scm_assign_mem(__scm->dev, mem_to_map_phys, mem_to_map_sz,
+				    ptr_phys, src_sz, dest_phys, dest_sz);
+	dma_free_coherent(__scm->dev, ALIGN(ptr_sz, SZ_64),
+			  ptr, ptr_phys);
+	if (ret) {
+		dev_err(__scm->dev,
+			"Assign memory protection call failed %d.\n", ret);
+		return -EINVAL;
+	}
+
+	*srcvm = next_vm;
+	return 0;
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
index e538047..6f8da9e 100644
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
+			       unsigned int *src, struct qcom_scm_vmperm *newvm,
+			       int dest_cnt);
 extern void qcom_scm_cpu_power_down(u32 flags);
 extern u32 qcom_scm_get_version(void);
 extern int qcom_scm_set_remote_state(u32 state, u32 id);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
