Return-Path: <rfried@codeaurora.org>
From: Ramon Fried <rfried@codeaurora.org>
Subject: [PATCH] rpmsg: added MODULE_ALIAS for rpmsg_char
Date: Fri, 23 Mar 2018 00:09:12 -0400
Message-Id: <20180323040912.1659-1-rfried@codeaurora.org>
To: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org
Cc: Ramon Fried <rfried@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Added "rpmsg:rpmsg_chrdev" MODULE_ALIAS to autoload
rpmg_chrdev module automatically.

Signed-off-by: Ramon Fried <rfried@codeaurora.org>
---
 drivers/rpmsg/rpmsg_char.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index e0996fce3963..6a5b5b16145e 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -581,4 +581,6 @@ static void rpmsg_chrdev_exit(void)
 	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
 }
 module_exit(rpmsg_chrdev_exit);
+
+MODULE_ALIAS("rpmsg:rpmsg_chrdev");
 MODULE_LICENSE("GPL v2");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
