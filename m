Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from szxga05-in.huawei.com ([45.249.212.191]:15180 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726459AbeK3Wiu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 30 Nov 2018 17:38:50 -0500
From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] remoteproc: remove duplicated include from qcom_sysmon.c
Date: Fri, 30 Nov 2018 19:29:23 +0800
Message-ID: <20181130112923.1168-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-remoteproc-owner@vger.kernel.org
To: linux-remoteproc@vger.kernel.org, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-kernel@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
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
