Return-Path: <javier@osg.samsung.com>
From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 3/3] remoteproc: qcom: wcnss_iris: Fix module autoload
Date: Tue, 18 Oct 2016 18:24:21 -0300
Message-Id: <1476825861-7880-4-git-send-email-javier@osg.samsung.com>
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

$ modinfo drivers/remoteproc/qcom_wcnss_iris.ko | grep alias
$

After this patch:

$ modinfo drivers/remoteproc/qcom_wcnss_iris.ko | grep alias
alias:          of:N*T*Cqcom,wcn3680C*
alias:          of:N*T*Cqcom,wcn3680
alias:          of:N*T*Cqcom,wcn3660C*
alias:          of:N*T*Cqcom,wcn3660
alias:          of:N*T*Cqcom,wcn3620C*
alias:          of:N*T*Cqcom,wcn3620

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 drivers/remoteproc/qcom_wcnss_iris.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_wcnss_iris.c b/drivers/remoteproc/qcom_wcnss_iris.c
index f0ca24a8dd0b..07ef653cfbdf 100644
--- a/drivers/remoteproc/qcom_wcnss_iris.c
+++ b/drivers/remoteproc/qcom_wcnss_iris.c
@@ -173,6 +173,7 @@ static const struct of_device_id iris_of_match[] = {
 	{ .compatible = "qcom,wcn3680", .data = &wcn3680_data },
 	{}
 };
+MODULE_DEVICE_TABLE(of, iris_of_match);
 
 static struct platform_driver wcnss_driver = {
 	.probe = qcom_iris_probe,
-- 
2.7.4
