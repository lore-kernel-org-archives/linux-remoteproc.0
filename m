Return-Path: <aneela@codeaurora.org>
From: Arun Kumar Neelakantam <aneela@codeaurora.org>
Subject: [PATCH V4 9/9] rpmsg: Add compat ioctl for rpmsg char driver
Date: Fri, 27 Jul 2018 17:47:29 +0530
Message-Id: <1532693849-7037-10-git-send-email-aneela@codeaurora.org>
In-Reply-To: <1532693849-7037-1-git-send-email-aneela@codeaurora.org>
References: <1532693849-7037-1-git-send-email-aneela@codeaurora.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org, robh+dt@kernel.org, arnaud.pouliquen@st.com, andy.gross@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Arun Kumar Neelakantam <aneela@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add compat ioctl callback to support 32bit user space applications.

Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
---
 drivers/rpmsg/rpmsg_char.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 76a4477..a76b963 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -285,6 +285,7 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 	.write = rpmsg_eptdev_write,
 	.poll = rpmsg_eptdev_poll,
 	.unlocked_ioctl = rpmsg_eptdev_ioctl,
+	.compat_ioctl = rpmsg_eptdev_ioctl,
 };
 
 static ssize_t name_show(struct device *dev, struct device_attribute *attr,
@@ -445,6 +446,7 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
 	.open = rpmsg_ctrldev_open,
 	.release = rpmsg_ctrldev_release,
 	.unlocked_ioctl = rpmsg_ctrldev_ioctl,
+	.compat_ioctl = rpmsg_ctrldev_ioctl,
 };
 
 static void rpmsg_ctrldev_release_device(struct device *dev)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
