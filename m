Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] remoteproc: qcom q6v5: fix modular build
Date: Fri,  6 Jul 2018 14:57:53 +0200
Message-Id: <20180706125804.3572356-1-arnd@arndb.de>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Rohit kumar <rohitkr@codeaurora.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The new driver only works as built-in code at the moment but fails
with a link error when configured as a loadable module:

WARNING: modpost: missing MODULE_LICENSE() in drivers/remoteproc/qcom_q6v5.o
see include/linux/module.h for more information
ERROR: "qcom_q6v5_init" [drivers/remoteproc/qcom_q6v5_pil.ko] undefined!
ERROR: "qcom_q6v5_wait_for_start" [drivers/remoteproc/qcom_q6v5_pil.ko] undefined!
ERROR: "qcom_q6v5_prepare" [drivers/remoteproc/qcom_q6v5_pil.ko] undefined!
ERROR: "qcom_q6v5_unprepare" [drivers/remoteproc/qcom_q6v5_pil.ko] undefined!
ERROR: "qcom_q6v5_request_stop" [drivers/remoteproc/qcom_q6v5_pil.ko] undefined!
ERROR: "qcom_q6v5_init" [drivers/remoteproc/qcom_adsp_pil.ko] undefined!
ERROR: "qcom_q6v5_wait_for_start" [drivers/remoteproc/qcom_adsp_pil.ko] undefined!
ERROR: "qcom_q6v5_prepare" [drivers/remoteproc/qcom_adsp_pil.ko] undefined!
ERROR: "qcom_q6v5_unprepare" [drivers/remoteproc/qcom_adsp_pil.ko] undefined!
ERROR: "qcom_q6v5_request_stop" [drivers/remoteproc/qcom_adsp_pil.ko] undefined!

This exports the internal symbols as needed and adds the MODULE_LICENSE()
and MODULE_DESCRIPTION() tags. I could not figure out the author, so I
did not add a MODULE_AUTHOR() tag for now.

Fixes: 3b415c8fb263 ("remoteproc: q6v5: Extract common resource handling")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/remoteproc/qcom_q6v5.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 400cdf936f6b..61a760ee4aac 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
+#include <linux/module.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 #include <linux/remoteproc.h>
@@ -32,6 +33,7 @@ int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(qcom_q6v5_prepare);
 
 /**
  * qcom_q6v5_unprepare() - unprepare the qcom_q6v5 context after stop
@@ -45,6 +47,7 @@ int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5)
 
 	return !q6v5->handover_issued;
 }
+EXPORT_SYMBOL_GPL(qcom_q6v5_unprepare);
 
 static irqreturn_t q6v5_wdog_interrupt(int irq, void *data)
 {
@@ -114,6 +117,7 @@ int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout)
 
 	return !ret ? -ETIMEDOUT : 0;
 }
+EXPORT_SYMBOL_GPL(qcom_q6v5_wait_for_start);
 
 static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
 {
@@ -157,6 +161,7 @@ int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5)
 
 	return ret == 0 ? -ETIMEDOUT : 0;
 }
+EXPORT_SYMBOL_GPL(qcom_q6v5_request_stop);
 
 /**
  * qcom_q6v5_init() - initializer of the q6v5 common struct
@@ -241,3 +246,7 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(qcom_q6v5_init);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Qualcomm Peripheral Image Loader for Q6V5");
-- 
2.9.0
