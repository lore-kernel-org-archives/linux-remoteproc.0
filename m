Return-Path: <loic.poulain@linaro.org>
Return-Path: <loic.poulain@linaro.org>
From: Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] remoteproc: qcom: wcnss: Add iris completion barrier
Date: Wed, 12 Feb 2020 18:54:03 +0100
Message-Id: <1581530043-12112-1-git-send-email-loic.poulain@linaro.org>
To: bjorn.andersson@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, anibal.limon@linaro.org, Loic Poulain <loic.poulain@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

There is no guarantee that the iris pointer will be assigned before
remoteproc subsystem starts the wcnss rproc, actually it depends how
fast rproc subsystem is able to get the firmware to trigger the start.

This leads to sporadic wifi/bluetooth initialization issue on db410c
with the following output:
 remoteproc remoteproc1: powering up a204000.wcnss
 remoteproc remoteproc1: Booting fw image qcom/msm8916/wcnss.mdt...
 qcom-wcnss-pil a204000.wcnss: no iris registered
 remoteproc remoteproc1: can't start rproc a204000.wcnss: -22

This patch introduces a 'iris_assigned' completion barrier to fix
this issue. Maybe not the most elegant way, but it does the trick.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/remoteproc/qcom_wcnss.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index a0468b3..c888282 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -84,6 +84,7 @@ struct qcom_wcnss {
 
 	struct completion start_done;
 	struct completion stop_done;
+	struct completion iris_assigned;
 
 	phys_addr_t mem_phys;
 	phys_addr_t mem_reloc;
@@ -138,6 +139,7 @@ void qcom_wcnss_assign_iris(struct qcom_wcnss *wcnss,
 
 	wcnss->iris = iris;
 	wcnss->use_48mhz_xo = use_48mhz_xo;
+	complete(&wcnss->iris_assigned);
 
 	mutex_unlock(&wcnss->iris_lock);
 }
@@ -213,6 +215,10 @@ static int wcnss_start(struct rproc *rproc)
 	struct qcom_wcnss *wcnss = (struct qcom_wcnss *)rproc->priv;
 	int ret;
 
+	/* Grant some time for iris registration */
+	wait_for_completion_timeout(&wcnss->iris_assigned,
+				    msecs_to_jiffies(5000));
+
 	mutex_lock(&wcnss->iris_lock);
 	if (!wcnss->iris) {
 		dev_err(wcnss->dev, "no iris registered\n");
@@ -494,6 +500,7 @@ static int wcnss_probe(struct platform_device *pdev)
 
 	init_completion(&wcnss->start_done);
 	init_completion(&wcnss->stop_done);
+	init_completion(&wcnss->iris_assigned);
 
 	mutex_init(&wcnss->iris_lock);
 
-- 
2.7.4
