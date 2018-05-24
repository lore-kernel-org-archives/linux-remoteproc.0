Return-Path: <ramon.fried@gmail.com>
Return-Path: <ramon.fried@gmail.com>
From: Ramon Fried <ramon.fried@gmail.com>
Subject: [PATCH] remoteproc: qcom_q6v5: don't auto boot remote processor
Date: Thu, 24 May 2018 22:21:41 +0300
Message-Id: <20180524192141.20323-1-ramon.fried@gmail.com>
To: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ramon Fried <ramon.fried@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Sometimes that rmtfs userspace module is not brought
up fast enough and the modem crashes.
disabling automated boot in the driver and triggering
the boot from user-space sovles the problem.

Signed-off-by: Ramon Fried <ramon.fried@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index cbbafdcaaecb..719ee96445b3 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -1133,6 +1133,8 @@ static int q6v5_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	rproc->auto_boot = false;
+
 	qproc = (struct q6v5 *)rproc->priv;
 	qproc->dev = &pdev->dev;
 	qproc->rproc = rproc;
-- 
2.17.0
