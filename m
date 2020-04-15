Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 2/2] remoteproc: qcom_q6v5_mss: Remove unused q6v5_da_to_va function
Date: Wed, 15 Apr 2020 12:46:19 +0530
Message-Id: <20200415071619.6052-2-sibis@codeaurora.org>
In-Reply-To: <20200415071619.6052-1-sibis@codeaurora.org>
References: <20200415071619.6052-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org
Cc: agross@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, ohad@wizery.com, evgreen@chromium.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Remove unsed q6v5_da_to_va function as the mss driver uses a per segment
dump function.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index b781fc8de3597..6a19e0e77236e 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -196,7 +196,6 @@ struct q6v5 {
 
 	phys_addr_t mpss_phys;
 	phys_addr_t mpss_reloc;
-	void *mpss_region;
 	size_t mpss_size;
 
 	struct qcom_rproc_glink glink_subdev;
@@ -1342,18 +1341,6 @@ static int q6v5_stop(struct rproc *rproc)
 	return 0;
 }
 
-static void *q6v5_da_to_va(struct rproc *rproc, u64 da, size_t len)
-{
-	struct q6v5 *qproc = rproc->priv;
-	int offset;
-
-	offset = da - qproc->mpss_reloc;
-	if (offset < 0 || offset + len > qproc->mpss_size)
-		return NULL;
-
-	return qproc->mpss_region + offset;
-}
-
 static int qcom_q6v5_register_dump_segments(struct rproc *rproc,
 					    const struct firmware *mba_fw)
 {
@@ -1399,7 +1386,6 @@ static int qcom_q6v5_register_dump_segments(struct rproc *rproc,
 static const struct rproc_ops q6v5_ops = {
 	.start = q6v5_start,
 	.stop = q6v5_stop,
-	.da_to_va = q6v5_da_to_va,
 	.parse_fw = qcom_q6v5_register_dump_segments,
 	.load = q6v5_load,
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
