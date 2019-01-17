Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from szxga06-in.huawei.com ([45.249.212.32]:50668 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729644AbfAQHFW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Jan 2019 02:05:22 -0500
From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] remoteproc: qcom: remove duplicated include from qcom_sysmon.c
Date: Thu, 17 Jan 2019 15:04:59 +0800
Message-ID: <20190117070459.10788-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-remoteproc-owner@vger.kernel.org
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/remoteproc/qcom_sysmon.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index e976a60..603b813 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -7,7 +7,6 @@
 #include <linux/notifier.h>
 #include <linux/slab.h>
 #include <linux/io.h>
-#include <linux/notifier.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/remoteproc/qcom_rproc.h>
-- 
2.7.0
