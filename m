Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 4/5] remoteproc: qcom: q6v5-mss: Add custom dump function for modem
Date: Tue,  9 Oct 2018 21:53:38 +0530
Message-Id: <20181009162339.30522-5-sibis@codeaurora.org>
In-Reply-To: <20181009162339.30522-1-sibis@codeaurora.org>
References: <20181009162339.30522-1-sibis@codeaurora.org>
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
 drivers/remoteproc/qcom_q6v5_mss.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index c475af65ba1d..85db95bfd355 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -182,6 +182,7 @@ struct q6v5 {
 	struct qcom_sysmon *sysmon;
 	bool need_mem_protection;
 	bool has_alt_reset;
+	unsigned long dump_segment_cnt;
 	int mpss_perm;
 	int mba_perm;
 	int version;
@@ -932,6 +933,30 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 	return ret < 0 ? ret : 0;
 }
 
+static void qcom_q6v5_dump_segment(struct rproc *rproc,
+				   struct rproc_dump_segment *segment,
+				   void *dest)
+{
+	int ret = 0;
+	struct q6v5 *qproc = rproc->priv;
+	unsigned long dump_cnt = (unsigned long)segment->priv;
+	void *ptr = rproc_da_to_va(rproc, segment->da, segment->size);
+
+	/* Unlock mba before copying segments */
+	if (!dump_cnt)
+		ret = q6v5_mba_load(qproc);
+
+	if (!ptr || ret)
+		memset(dest, 0xff, segment->size);
+	else
+		memcpy(dest, ptr, segment->size);
+
+	dump_cnt++;
+	/* Reclaim mba after copying segments */
+	if (dump_cnt == qproc->dump_segment_cnt)
+		q6v5_mba_reclaim(qproc);
+}
+
 static int q6v5_start(struct rproc *rproc)
 {
 	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
