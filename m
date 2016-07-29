Return-Path: <weiyj.lk@gmail.com>
Return-Path: <weiyj.lk@gmail.com>
From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] remoteproc: qcom: hexagon: Fix error return code in q6v5_probe()
Date: Fri, 29 Jul 2016 15:56:52 +0000
Message-Id: <1469807812-32765-1-git-send-email-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Wei Yongjun <weiyj.lk@gmail.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Fix to return a negative error code from the state get failed error
handling case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <weiyj.lk@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 2479188..0ad536d 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -864,8 +864,10 @@ static int q6v5_probe(struct platform_device *pdev)
 		goto free_rproc;
 
 	qproc->state = qcom_smem_state_get(&pdev->dev, "stop", &qproc->stop_bit);
-	if (IS_ERR(qproc->state))
+	if (IS_ERR(qproc->state)) {
+		ret = PTR_ERR(qproc->state);
 		goto free_rproc;
+	}
 
 	ret = rproc_add(rproc);
 	if (ret)
