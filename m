Return-Path: <aneela@codeaurora.org>
From: Arun Kumar Neelakantam <aneela@codeaurora.org>
Subject: [PATCH 2/5] rpmsg: Add signal callback to rpmsg char device
Date: Wed,  3 Oct 2018 17:04:20 +0530
Message-Id: <1538566463-24627-3-git-send-email-aneela@codeaurora.org>
In-Reply-To: <1538566463-24627-1-git-send-email-aneela@codeaurora.org>
References: <1538566463-24627-1-git-send-email-aneela@codeaurora.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org, sricharan@codeaurora.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Arun Kumar Neelakantam <aneela@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Register a callback to get the signal notifications from rpmsg.

Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
---
 drivers/rpmsg/rpmsg_char.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index a76b963..86003d5 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2012, PetaLogix
  * Copyright (c) 2011, Texas Instruments, Inc.
  * Copyright (c) 2011, Google, Inc.
+ * Copyright (c) 2018, The Linux Foundation.
  *
  * Based on rpmsg performance statistics driver by Michal Simek, which in turn
  * was based on TI & Google OMX rpmsg driver.
@@ -120,6 +121,12 @@ static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
 	return 0;
 }
 
+static int rpmsg_sigs_cb(struct rpmsg_device *rpdev, void *priv,
+			 u32 old, u32 new)
+{
+	return 0;
+}
+
 static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
 {
 	struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
@@ -136,6 +143,7 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
 		return -EINVAL;
 	}
 
+	ept->sig_cb = rpmsg_sigs_cb;
 	eptdev->ept = ept;
 	filp->private_data = eptdev;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
