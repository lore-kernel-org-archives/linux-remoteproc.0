Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v5 8/8] remoteproc: qcom: Allow defining GLINK edge for mss remoteproc
Date: Mon, 21 May 2018 22:57:14 +0530
Message-Id: <20180521172714.8551-9-sibis@codeaurora.org>
In-Reply-To: <20180521172714.8551-1-sibis@codeaurora.org>
References: <20180521172714.8551-1-sibis@codeaurora.org>
To: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, sibis@codeaurora.org, georgi.djakov@linaro.org, jassisinghbrar@gmail.com, ohad@wizery.com, mark.rutland@arm.com, kyan@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Add GLINK subdevice to allow definition of GLINK edge as a
child of modem-pil.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 5e85ce975ef8..7656731a6c51 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -183,6 +183,7 @@ struct q6v5 {
 	void *mpss_region;
 	size_t mpss_size;
 
+	struct qcom_rproc_glink glink_subdev;
 	struct qcom_rproc_subdev smd_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
 	struct qcom_sysmon *sysmon;
@@ -1347,6 +1348,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	}
 	qproc->mpss_perm = BIT(QCOM_SCM_VMID_HLOS);
 	qproc->mba_perm = BIT(QCOM_SCM_VMID_HLOS);
+	qcom_add_glink_subdev(rproc, &qproc->glink_subdev);
 	qcom_add_smd_subdev(rproc, &qproc->smd_subdev);
 	qcom_add_ssr_subdev(rproc, &qproc->ssr_subdev, "mpss");
 	qproc->sysmon = qcom_add_sysmon_subdev(rproc, "modem", 0x12);
@@ -1370,6 +1372,7 @@ static int q6v5_remove(struct platform_device *pdev)
 	rproc_del(qproc->rproc);
 
 	qcom_remove_sysmon_subdev(qproc->sysmon);
+	qcom_remove_glink_subdev(qproc->rproc, &qproc->glink_subdev);
 	qcom_remove_smd_subdev(qproc->rproc, &qproc->smd_subdev);
 	qcom_remove_ssr_subdev(qproc->rproc, &qproc->ssr_subdev);
 	rproc_free(qproc->rproc);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
