Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] remoteproc: qcom: hexagon: Clean up mpss validation
Date: Tue, 12 Jul 2016 17:15:45 -0700
Message-Id: <1468368945-9482-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

As reported by Dan the unsigned "val" can't be negative. But instead
correcting the check for early errors here followed by a wait for the
validation result to show the error or success we can consolidate these
two parts of the validation process into the validation function.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 63406ee689d9..b8fba4dc2447 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -386,7 +386,6 @@ static int q6v5_mpss_validate(struct q6v5 *qproc, const struct firmware *fw)
 	phys_addr_t fw_addr;
 	bool relocate;
 	size_t size;
-	u32 val;
 	int ret;
 	int i;
 
@@ -425,8 +424,13 @@ static int q6v5_mpss_validate(struct q6v5 *qproc, const struct firmware *fw)
 		writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
 	}
 
-	val = readl(qproc->rmb_base + RMB_MBA_STATUS_REG);
-	return val < 0 ? val : 0;
+	ret = q6v5_rmb_mba_wait(qproc, RMB_MBA_AUTH_COMPLETE, 10000);
+	if (ret == -ETIMEDOUT)
+		dev_err(qproc->dev, "MPSS authentication timed out\n");
+	else if (ret < 0)
+		dev_err(qproc->dev, "MPSS authentication failed: %d\n", ret);
+
+	return ret < 0 ? ret : 0;
 }
 
 static int q6v5_mpss_load(struct q6v5 *qproc)
@@ -463,14 +467,6 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 		goto release_firmware;
 
 	ret = q6v5_mpss_validate(qproc, fw);
-	if (ret)
-		goto release_firmware;
-
-	ret = q6v5_rmb_mba_wait(qproc, RMB_MBA_AUTH_COMPLETE, 10000);
-	if (ret == -ETIMEDOUT)
-		dev_err(qproc->dev, "MPSS authentication timed out\n");
-	else if (ret < 0)
-		dev_err(qproc->dev, "MPSS authentication failed: %d\n", ret);
 
 release_firmware:
 	release_firmware(fw);
-- 
2.5.0
