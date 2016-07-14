Return-Path: <weiyj_lk@163.com>
From: Wei Yongjun <weiyj_lk@163.com>
Subject: [PATCH -next] remoteproc: qcom: remove redundant dev_err call in q6v5_init_mem()
Date: Thu, 14 Jul 2016 12:57:44 +0000
Message-Id: <1468501064-17683-1-git-send-email-weiyj_lk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 4913ec6..790ec6f 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -679,17 +679,13 @@ static int q6v5_init_mem(struct q6v5 *qproc, struct platform_device *pdev)
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qdsp6");
 	qproc->reg_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(qproc->reg_base)) {
-		dev_err(qproc->dev, "failed to get qdsp6_base\n");
+	if (IS_ERR(qproc->reg_base))
 		return PTR_ERR(qproc->reg_base);
-	}
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rmb");
 	qproc->rmb_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(qproc->rmb_base)) {
-		dev_err(qproc->dev, "failed to get rmb_base\n");
+	if (IS_ERR(qproc->rmb_base))
 		return PTR_ERR(qproc->rmb_base);
-	}
 
 	ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
 					       "qcom,halt-regs", 3, 0, &args);
