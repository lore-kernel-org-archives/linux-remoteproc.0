Return-Path: <weiyj.lk@gmail.com>
Return-Path: <weiyj.lk@gmail.com>
From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] remoteproc: qcom: wcnss: Fix return value check in wcnss_probe()
Date: Sun, 21 Aug 2016 14:39:30 +0000
Message-Id: <1471790370-3127-1-git-send-email-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

From: Wei Yongjun <weiyongjun1@huawei.com>

In case of error, the function devm_ioremap_resource() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR().

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/remoteproc/qcom_wcnss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 14c4585..1917de7 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -528,8 +528,8 @@ static int wcnss_probe(struct platform_device *pdev)
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pmu");
 	mmio = devm_ioremap_resource(&pdev->dev, res);
-	if (!mmio) {
-		ret = -ENOMEM;
+	if (IS_ERR(mmio)) {
+		ret = PTR_ERR(mmio);
 		goto free_rproc;
 	};
