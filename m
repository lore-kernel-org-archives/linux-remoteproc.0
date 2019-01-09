Return-Path: <brajeswar.linux@gmail.com>
Return-Path: <brajeswar.linux@gmail.com>
Date: Wed, 9 Jan 2019 19:59:59 +0530
From: Brajeswar Ghosh <brajeswar.linux@gmail.com>
Subject: [PATCH] remoteproc/qcom_sysmon.c: Remove duplicate header
Message-ID: <20190109142959.GA29659@hp-pavilion-15-notebook-pc-brajeswar>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: jrdr.linux@gmail.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, sabyasachi.linux@gmail.com
List-ID: <linux-remoteproc@vger.kernel.org>

Remove linux/notifier.h which is included more than once

Signed-off-by: Brajeswar Ghosh <brajeswar.linux@gmail.com>
---
 drivers/remoteproc/qcom_sysmon.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index e976a602b015..603b813151f2 100644
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
2.17.1
