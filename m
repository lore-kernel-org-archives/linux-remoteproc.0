Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v5 4/5] remoteproc: qcom: q6v5-mss: Add custom dump function for modem
Date: Wed, 17 Oct 2018 19:25:26 +0530
Message-Id: <20181017135527.30592-5-sibis@codeaurora.org>
In-Reply-To: <20181017135527.30592-1-sibis@codeaurora.org>
References: <20181017135527.30592-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, kyan@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The per segment dump function is responsible for loading the mba
before device memory segments associated with coredump can be populated
and for cleaning up the resources post coredump.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 87d7f4d0c176..0d3b9d70823e 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -168,6 +168,9 @@ struct q6v5 {
 	bool running;
 
 	bool dump_mba_loaded;
+	unsigned long dump_segment_mask;
+	unsigned long dump_complete_mask;
+
 	phys_addr_t mba_phys;
 	void *mba_region;
 	size_t mba_size;
@@ -961,6 +964,33 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 	return ret < 0 ? ret : 0;
 }
 
+static void qcom_q6v5_dump_segment(struct rproc *rproc,
+				   struct rproc_dump_segment *segment,
+				   void *dest)
+{
+	int ret = 0;
+	struct q6v5 *qproc = rproc->priv;
+	unsigned long mask = BIT((unsigned long)segment->priv);
+	void *ptr = rproc_da_to_va(rproc, segment->da, segment->size);
+
+	/* Unlock mba before copying segments */
+	if (!qproc->dump_mba_loaded)
+		ret = q6v5_mba_load(qproc);
+
+	if (!ptr || ret)
+		memset(dest, 0xff, segment->size);
+	else
+		memcpy(dest, ptr, segment->size);
+
+	qproc->dump_segment_mask |= mask;
+
+	/* Reclaim mba after copying segments */
+	if (qproc->dump_segment_mask == qproc->dump_complete_mask) {
+		if (qproc->dump_mba_loaded)
+			q6v5_mba_reclaim(qproc);
+	}
+}
+
 static int q6v5_start(struct rproc *rproc)
 {
 	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
@@ -989,6 +1019,9 @@ static int q6v5_start(struct rproc *rproc)
 	if (xfermemop_ret)
 		dev_err(qproc->dev,
 			"Failed to reclaim mba buffer system may become unstable\n");
+
+	/* Reset Dump Segment Mask */
+	qproc->dump_segment_mask = 0;
 	qproc->running = true;
 
 	return 0;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
