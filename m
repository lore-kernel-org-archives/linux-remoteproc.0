Return-Path: <javier@osg.samsung.com>
From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 2/3] remoteproc: qcom: wcnss: Fix module autoload
Date: Tue, 18 Oct 2016 18:24:20 -0300
Message-Id: <1476825861-7880-3-git-send-email-javier@osg.samsung.com>
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

$ modinfo drivers/remoteproc/qcom_wcnss.ko | grep alias
$

After this patch:

$ modinfo drivers/remoteproc/qcom_wcnss.ko | grep alias
alias:          of:N*T*Cqcom,pronto-v2-pilC*
alias:          of:N*T*Cqcom,pronto-v2-pil
alias:          of:N*T*Cqcom,pronto-v1-pilC*
alias:          of:N*T*Cqcom,pronto-v1-pil
alias:          of:N*T*Cqcom,riva-pilC*
alias:          of:N*T*Cqcom,riva-pil

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 drivers/remoteproc/qcom_wcnss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index f5cedeaafba1..e5d9de94c1db 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -609,6 +609,7 @@ static const struct of_device_id wcnss_of_match[] = {
 	{ .compatible = "qcom,pronto-v2-pil", &pronto_v2_data },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, wcnss_of_match);
 
 static struct platform_driver wcnss_driver = {
 	.probe = wcnss_probe,
-- 
2.7.4
