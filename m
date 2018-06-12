Return-Path: <loic.poulain@linaro.org>
Return-Path: <loic.poulain@linaro.org>
From: Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] remoteproc: wcnss: Wait for iris before starting
Date: Tue, 12 Jun 2018 18:58:31 +0200
Message-Id: <1528822711-13342-1-git-send-email-loic.poulain@linaro.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

wcnss_start fails when called by remoteproc before iris probing.
Fix this by adding synchronization/completion on iris assignment.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/remoteproc/qcom_wcnss.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index b0e07e9..e5fbf91 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -86,6 +86,7 @@ struct qcom_wcnss {
 
 	struct mutex iris_lock;
 	struct qcom_iris *iris;
+	struct completion iris_assigned;
 
 	struct regulator_bulk_data *vregs;
 	size_t num_vregs;
@@ -146,6 +147,7 @@ void qcom_wcnss_assign_iris(struct qcom_wcnss *wcnss,
 
 	wcnss->iris = iris;
 	wcnss->use_48mhz_xo = use_48mhz_xo;
+	complete(&wcnss->iris_assigned);
 
 	mutex_unlock(&wcnss->iris_lock);
 }
@@ -221,6 +223,13 @@ static int wcnss_start(struct rproc *rproc)
 	struct qcom_wcnss *wcnss = (struct qcom_wcnss *)rproc->priv;
 	int ret;
 
+	ret = wait_for_completion_timeout(&wcnss->iris_assigned,
+					  msecs_to_jiffies(5000));
+	if (ret == 0) {
+		dev_err(wcnss->dev, "Timeout waiting for iris device\n");
+		return -ENODEV;
+	}
+
 	mutex_lock(&wcnss->iris_lock);
 	if (!wcnss->iris) {
 		dev_err(wcnss->dev, "no iris registered\n");
@@ -496,6 +505,7 @@ static int wcnss_probe(struct platform_device *pdev)
 
 	init_completion(&wcnss->start_done);
 	init_completion(&wcnss->stop_done);
+	init_completion(&wcnss->iris_assigned);
 
 	mutex_init(&wcnss->iris_lock);
 
-- 
2.7.4
