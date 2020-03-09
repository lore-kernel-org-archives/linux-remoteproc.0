Return-Path: <linux-arm-msm-owner@vger.kernel.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 3/3] remoteproc: qcom_q6v5_mss: Request direct mapping for firmware subdevice
Date: Mon,  9 Mar 2020 23:52:55 +0530
Message-Id: <20200309182255.20142-4-sibis@codeaurora.org>
In-Reply-To: <20200309182255.20142-1-sibis@codeaurora.org>
References: <20200309182255.20142-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, joro@8bytes.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org, linux-remoteproc@vger.kernel.org, ohad@wizery.com, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The Q6 modem sub-system has direct access to DDR through memnoc and
an indirect access routed through a SMMU which MSS CE (crypto engine
sub-component of MSS) uses during out of reset sequence. Request direct
mapping for the modem-firmware subdevice since smmu is not expected
to provide access control/translation for these SIDs (sandboxing of the
modem is achieved through XPUs engaged using SMC calls).

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 68 ++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index d7667418a62f4..ceb7f71dd17df 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
+#include <linux/iommu.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
@@ -202,6 +203,7 @@ struct q6v5 {
 	struct qcom_rproc_subdev smd_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
 	struct qcom_sysmon *sysmon;
+	struct device *fw_subdev;
 	bool need_mem_protection;
 	bool has_alt_reset;
 	bool has_halt_nav;
@@ -378,6 +380,67 @@ static void q6v5_pds_disable(struct q6v5 *qproc, struct device **pds,
 	}
 }
 
+static int qcom_init_firmware(struct q6v5 *qproc)
+{
+	struct platform_device_info info;
+	struct platform_device *pdev;
+	struct device_node *np;
+	int ret;
+
+	np = of_get_child_by_name(qproc->dev->of_node, "modem-firmware");
+	if (!np)
+		return 0;
+
+	memset(&info, 0, sizeof(info));
+	info.fwnode = &np->fwnode;
+	info.parent = qproc->dev;
+	info.name = np->name;
+
+	pdev = platform_device_register_full(&info);
+	if (IS_ERR(pdev)) {
+		of_node_put(np);
+		return PTR_ERR(pdev);
+	}
+
+	pdev->dev.of_node = np;
+	ret = of_dma_configure(&pdev->dev, np, true);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to configure DMA\n");
+		goto err_unregister;
+	}
+
+	ret = iommu_request_dm_for_dev(&pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to request direct mapping\n");
+		goto err_unregister;
+	}
+
+	qproc->fw_subdev = &pdev->dev;
+	of_node_put(np);
+	return 0;
+
+err_unregister:
+	platform_device_unregister(pdev);
+	of_node_put(np);
+	return ret;
+}
+
+static void qcom_remove_firmware(struct q6v5 *qproc)
+{
+	struct iommu_domain *iommu;
+
+	if (!qproc->fw_subdev)
+		return;
+
+	iommu = iommu_get_domain_for_dev(qproc->fw_subdev);
+	if (!iommu)
+		return;
+
+	iommu_detach_device(iommu, qproc->fw_subdev);
+	iommu_domain_free(iommu);
+	platform_device_unregister(to_platform_device(qproc->fw_subdev));
+}
+
 static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int *current_perm,
 				   bool local, bool remote, phys_addr_t addr,
 				   size_t size)
@@ -1722,6 +1785,10 @@ static int q6v5_probe(struct platform_device *pdev)
 	if (ret)
 		goto detach_proxy_pds;
 
+	ret = qcom_init_firmware(qproc);
+	if (ret)
+		goto detach_proxy_pds;
+
 	qproc->mpss_perm = BIT(QCOM_SCM_VMID_HLOS);
 	qproc->mba_perm = BIT(QCOM_SCM_VMID_HLOS);
 	qcom_add_glink_subdev(rproc, &qproc->glink_subdev);
@@ -1759,6 +1826,7 @@ static int q6v5_remove(struct platform_device *pdev)
 	qcom_remove_glink_subdev(qproc->rproc, &qproc->glink_subdev);
 	qcom_remove_smd_subdev(qproc->rproc, &qproc->smd_subdev);
 	qcom_remove_ssr_subdev(qproc->rproc, &qproc->ssr_subdev);
+	qcom_remove_firmware(qproc);
 
 	q6v5_pds_detach(qproc, qproc->active_pds, qproc->active_pd_count);
 	q6v5_pds_detach(qproc, qproc->proxy_pds, qproc->proxy_pd_count);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
