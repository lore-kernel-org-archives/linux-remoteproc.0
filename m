Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: rishabhb=codeaurora.org@mg.codeaurora.org
From: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 2/2] remoteproc: core: Register the character device interface
Date: Tue, 21 Apr 2020 11:10:18 -0700
Message-Id: <1587492618-15896-3-git-send-email-rishabhb@codeaurora.org>
In-Reply-To: <1587492618-15896-1-git-send-email-rishabhb@codeaurora.org>
References: <1587492618-15896-1-git-send-email-rishabhb@codeaurora.org>
To: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: bjorn.andersson@linaro.org, mathieu.poirier@linaro.org, ohad@wizery.com, tsoni@codeaurora.org, psodagud@codeaurora.org, sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add the character device during rproc_add. This would create
a character device node at /dev/remoteproc<index>. Userspace
applications can interact with the remote processor using this
interface.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
---
 drivers/remoteproc/remoteproc_core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 097f33e..76ba171 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1916,6 +1916,13 @@ int rproc_add(struct rproc *rproc)
 	/* create debugfs entries */
 	rproc_create_debug_dir(rproc);
 
+	/* add char device for this remoteproc */
+	ret = rproc_char_device_add(rproc);
+	if (ret) {
+		dev_err(dev, "Failed to add char dev for %s\n", rproc->name);
+		return ret;
+	}
+
 	/* if rproc is marked always-on, request it to boot */
 	if (rproc->auto_boot) {
 		ret = rproc_trigger_auto_boot(rproc);
@@ -2137,6 +2144,7 @@ int rproc_del(struct rproc *rproc)
 	mutex_unlock(&rproc->lock);
 
 	rproc_delete_debug_dir(rproc);
+	rproc_char_device_remove(rproc);
 
 	/* the rproc is downref'ed as soon as it's removed from the klist */
 	mutex_lock(&rproc_list_mutex);
@@ -2220,6 +2228,7 @@ static int __init remoteproc_init(void)
 {
 	rproc_init_sysfs();
 	rproc_init_debugfs();
+	rproc_init_cdev();
 
 	return 0;
 }
@@ -2231,6 +2240,7 @@ static void __exit remoteproc_exit(void)
 
 	rproc_exit_debugfs();
 	rproc_exit_sysfs();
+	rproc_exit_cdev();
 }
 module_exit(remoteproc_exit);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
