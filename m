Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 2/3] remoteproc: qcom_q6v5_mss: Request direct mapping for modem device
Date: Tue, 17 Mar 2020 20:39:09 +0530
Message-Id: <20200317150910.26053-3-sibis@codeaurora.org>
In-Reply-To: <20200317150910.26053-1-sibis@codeaurora.org>
References: <20200317150910.26053-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, joro@8bytes.org, robin.murphy@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org, linux-remoteproc@vger.kernel.org, ohad@wizery.com, agross@kernel.org, dianders@chromium.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Request direct mapping for modem on platforms which don't have TrustZone
(which programs the modem SIDs) to prevent the following global faults seen
on Cheza/Trogdor:

arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
arm-smmu 15000000.iommu: GFSR 0x80000002, GFSYNR0 0x00000000,
			 GFSYNR1 0x00000781, GFSYNR2 0x00000000

arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
arm-smmu 15000000.iommu: GFSR 0x80000002, GFSYNR0 0x00000000,
			 GFSYNR1 0x00000461, GFSYNR2 0x00000000

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/iommu/arm-smmu-qcom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
index ff746acd1c816..5dd7a788f59e1 100644
--- a/drivers/iommu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm-smmu-qcom.c
@@ -20,12 +20,18 @@ static const struct arm_smmu_client_match_data qcom_mdss = {
 	.direct_mapping = true,
 };
 
+static const struct arm_smmu_client_match_data qcom_mss = {
+	.direct_mapping = true,
+};
+
 static const struct of_device_id qcom_smmu_client_of_match[] = {
 	{ .compatible = "qcom,adreno", .data = &qcom_adreno },
 	{ .compatible = "qcom,mdp4", .data = &qcom_mdss },
 	{ .compatible = "qcom,mdss", .data = &qcom_mdss },
 	{ .compatible = "qcom,sc7180-mdss", .data = &qcom_mdss },
+	{ .compatible = "qcom,sc7180-mss-pil", .data = &qcom_mss },
 	{ .compatible = "qcom,sdm845-mdss", .data = &qcom_mdss },
+	{ .compatible = "qcom,sdm845-mss-pil", .data = &qcom_mss },
 	{},
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
