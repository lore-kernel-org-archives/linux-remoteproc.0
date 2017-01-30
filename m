Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v2 1/3] soc: qcom: Add scm call to protect modem mem in qcom scm driver.
Date: Mon, 30 Jan 2017 16:14:02 +0530
Message-Id: <1485773044-31489-2-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1485773044-31489-1-git-send-email-akdwived@codeaurora.org>
References: <1485773044-31489-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch add scm call support to make hypervisor call for protecting
memory region on armv8 arch cpu's.
This is required to bring up modem on msm8996. MSS rproc driver will
make hypervisor call for protecting and granting permission of DDR region
where MBA, MDT, FW are loaded.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 drivers/firmware/qcom_scm-64.c | 17 +++++++++++++++++
 drivers/firmware/qcom_scm.c    | 14 ++++++++++++++
 drivers/firmware/qcom_scm.h    |  3 +++
 include/linux/qcom_scm.h       |  1 +
 4 files changed, 35 insertions(+)

diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 4a0f5ea..5f00a64 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -358,3 +358,20 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 
 	return ret ? : res.a1;
 }
+
+int __qcom_scm_assign_mem(struct device *dev, void *data)
+{
+	int ret;
+	struct qcom_scm_desc *desc = data;
+	struct arm_smccc_res res;
+
+	desc->arginfo = QCOM_SCM_ARGS(7, QCOM_SCM_RO, QCOM_SCM_VAL,
+				QCOM_SCM_RO, QCOM_SCM_VAL, QCOM_SCM_RO,
+				QCOM_SCM_VAL, QCOM_SCM_VAL);
+
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
+				QCOM_MEM_PROT_ASSIGN_ID,
+				desc, &res);
+
+	return ret ? : res.a1;
+}
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 893f953ea..f476803 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -292,6 +292,20 @@ int qcom_scm_pas_shutdown(u32 peripheral)
 }
 EXPORT_SYMBOL(qcom_scm_pas_shutdown);
 
+/**
+ * qcom_scm_assign_mem() - Apply new access permission of DDR
+ * region passed via descriptor and does second stage
+ * translation of intermediate physical address.
+ * @desc: descriptor to send to hypervisor
+ *
+ * Return 0 on success.
+ */
+int qcom_scm_assign_mem(void *desc)
+{
+	return __qcom_scm_assign_mem(__scm->dev, desc);
+}
+EXPORT_SYMBOL(qcom_scm_assign_mem);
+
 static int qcom_scm_pas_reset_assert(struct reset_controller_dev *rcdev,
 				     unsigned long idx)
 {
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 3584b00..d88fd4b 100644
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
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
