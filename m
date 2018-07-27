Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 4/6] remoteproc: qcom: q6v5-pil: Add custom dump function for modem
Date: Fri, 27 Jul 2018 20:50:01 +0530
Message-Id: <20180727152003.11663-5-sibis@codeaurora.org>
In-Reply-To: <20180727152003.11663-1-sibis@codeaurora.org>
References: <20180727152003.11663-1-sibis@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, ohad@wizery.com, kyan@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The per segment dump function is responsible for loading the mba
before device memory segments associated with coredump can be populated
and for cleaning up the resources post coredump.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index eacf9f0bf49e..ac3342f9ea5a 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -182,6 +182,7 @@ struct q6v5 {
 	struct qcom_sysmon *sysmon;
 	bool need_mem_protection;
 	bool has_alt_reset;
+	u32 valid_mask;
 	int mpss_perm;
 	int mba_perm;
 	int version;
@@ -924,6 +925,30 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 	return ret < 0 ? ret : 0;
 }
 
+static void qcom_q6v5_dump_segment(struct rproc *rproc, void *ptr, size_t len,
+								   void *priv)
+{
+	int ret = 0;
+	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
+	static u32 pending_mask;
+
+	/* Unlock mba before copying segments */
+	if (!qproc->mba_loaded)
+		ret = q6v5_mba_load(qproc);
+
+	if (!ptr || ret)
+		memset(priv, 0xff, len);
+	else
+		memcpy(priv, ptr, len);
+
+	pending_mask++;
+	if (pending_mask == qproc->valid_mask) {
+		if (qproc->mba_loaded)
+			q6v5_mba_reclaim(qproc);
+		pending_mask = 0;
+	}
+}
+
 static int q6v5_start(struct rproc *rproc)
 {
 	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
