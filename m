Return-Path: <pravin.shedge4linux@gmail.com>
Return-Path: <pravin.shedge4linux@gmail.com>
From: Pravin Shedge <pravin.shedge4linux@gmail.com>
Subject: [PATCH 16/45] drivers: rpmsg: remove duplicate includes
Date: Wed,  6 Dec 2017 22:32:41 +0530
Message-Id: <1512579761-5613-1-git-send-email-pravin.shedge4linux@gmail.com>
To: linux-remoteproc@vger.kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-kernel@vger.kernel.org, pravin.shedge4linux@gmail.com
List-ID: <linux-remoteproc@vger.kernel.org>

These duplicate includes have been found with scripts/checkincludes.pl but
they have been removed manually to avoid removing false positives.

Signed-off-by: Pravin Shedge <pravin.shedge4linux@gmail.com>
---
 drivers/rpmsg/qcom_glink_smem.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 5cdaa5f..057528e 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -29,8 +29,6 @@
 #include <linux/workqueue.h>
 #include <linux/list.h>
 
-#include <linux/delay.h>
-#include <linux/rpmsg.h>
 #include <linux/rpmsg/qcom_glink.h>
 
 #include "qcom_glink_native.h"
-- 
2.7.4
