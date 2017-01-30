Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] rpmsg: qcom: smd: Return positively when not enabled
Date: Mon, 30 Jan 2017 09:00:07 -0800
Message-Id: <20170130170007.4578-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Remoteproc treats the error codes returned from the stubbed SMD API as
errors, but the fact that SMD is not enabled should not affect
remoteproc's ability to start the remote processors.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 include/linux/rpmsg/qcom_smd.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/linux/rpmsg/qcom_smd.h b/include/linux/rpmsg/qcom_smd.h
index e674b2e3074b..8ec8b6439b25 100644
--- a/include/linux/rpmsg/qcom_smd.h
+++ b/include/linux/rpmsg/qcom_smd.h
@@ -18,14 +18,12 @@ static inline struct qcom_smd_edge *
 qcom_smd_register_edge(struct device *parent,
 		       struct device_node *node)
 {
-	return ERR_PTR(-ENXIO);
+	return NULL;
 }
 
 static inline int qcom_smd_unregister_edge(struct qcom_smd_edge *edge)
 {
-	/* This shouldn't be possible */
-	WARN_ON(1);
-	return -ENXIO;
+	return 0;
 }
 
 #endif
-- 
2.11.0
