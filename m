Return-Path: <javier@osg.samsung.com>
From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 1/3] remoteproc: qcom: q6v5_pil: Fix module autoload
Date: Tue, 18 Oct 2016 18:24:19 -0300
Message-Id: <1476825861-7880-2-git-send-email-javier@osg.samsung.com>
In-Reply-To: <1476825861-7880-1-git-send-email-javier@osg.samsung.com>
References: <1476825861-7880-1-git-send-email-javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

If the driver is built as a module, autoload won't work because the module
alias information is not filled. So user-space can't match the registered
device with the corresponding module.

Export the module alias information using the MODULE_DEVICE_TABLE() macro.

Before this patch:

$ modinfo drivers/remoteproc/qcom_q6v5_pil.ko | grep alias
$

After this patch:

$ modinfo drivers/remoteproc/qcom_q6v5_pil.ko | grep alias
alias:          of:N*T*Cqcom,q6v5-pilC*
alias:          of:N*T*Cqcom,q6v5-pil

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 drivers/remoteproc/qcom_q6v5_pil.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 2e0caaaa766a..b08989b48df7 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -894,6 +894,7 @@ static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,q6v5-pil", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, q6v5_of_match);
 
 static struct platform_driver q6v5_driver = {
 	.probe = q6v5_probe,
-- 
2.7.4
