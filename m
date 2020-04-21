Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: rishabhb=codeaurora.org@mg.codeaurora.org
From: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 1/2] remoteproc: Add remoteproc character device interface
Date: Tue, 21 Apr 2020 11:10:17 -0700
Message-Id: <1587492618-15896-2-git-send-email-rishabhb@codeaurora.org>
In-Reply-To: <1587492618-15896-1-git-send-email-rishabhb@codeaurora.org>
References: <1587492618-15896-1-git-send-email-rishabhb@codeaurora.org>
To: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: bjorn.andersson@linaro.org, mathieu.poirier@linaro.org, ohad@wizery.com, tsoni@codeaurora.org, psodagud@codeaurora.org, sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add the character device interface into remoteproc framework.
This interface can be used in order to boot/shutdown remote
subsystems and provides a basic ioctl based interface to implement
supplementary functionality. An ioctl call is implemented to enable
the shutdown on release feature which will allow remote processors to
be shutdown when the controlling userpsace application crashes or hangs.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
 drivers/remoteproc/Kconfig                         |   9 ++
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/remoteproc_cdev.c               | 143 +++++++++++++++++++++
 drivers/remoteproc/remoteproc_internal.h           |  21 +++
 include/linux/remoteproc.h                         |   3 +
 include/uapi/linux/remoteproc_cdev.h               |  20 +++
 7 files changed, 198 insertions(+)
 create mode 100644 drivers/remoteproc/remoteproc_cdev.c
 create mode 100644 include/uapi/linux/remoteproc_cdev.h

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 2e91370..412b2a0 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -337,6 +337,7 @@ Code  Seq#    Include File                                           Comments
 0xB4  00-0F  linux/gpio.h                                            <mailto:linux-gpio@vger.kernel.org>
 0xB5  00-0F  uapi/linux/rpmsg.h                                      <mailto:linux-remoteproc@vger.kernel.org>
 0xB6  all    linux/fpga-dfl.h
+0xB7  all    uapi/linux/remoteproc_cdev.h			     <mailto:linux-remoteproc@vger.kernel.org>
 0xC0  00-0F  linux/usb/iowarrior.h
 0xCA  00-0F  uapi/misc/cxl.h
 0xCA  10-2F  uapi/misc/ocxl.h
diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index de3862c..6374b79 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -14,6 +14,15 @@ config REMOTEPROC
 
 if REMOTEPROC
 
+config REMOTEPROC_CDEV
+	bool "Remoteproc character device interface"
+	help
+	  Say y here to have a character device interface for Remoteproc
+	  framework. Userspace can boot/shutdown remote processors through
+	  this interface.
+
+	  It's safe to say N if you don't want to use this interface.
+
 config IMX_REMOTEPROC
 	tristate "IMX6/7 remoteproc support"
 	depends on ARCH_MXC
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index e30a1b1..b7d4f77 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -9,6 +9,7 @@ remoteproc-y				+= remoteproc_debugfs.o
 remoteproc-y				+= remoteproc_sysfs.o
 remoteproc-y				+= remoteproc_virtio.o
 remoteproc-y				+= remoteproc_elf_loader.o
+obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
 obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
 obj-$(CONFIG_MTK_SCP)			+= mtk_scp.o mtk_scp_ipi.o
 obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
new file mode 100644
index 0000000..65142ec
--- /dev/null
+++ b/drivers/remoteproc/remoteproc_cdev.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Character device interface driver for Remoteproc framework.
+ *
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/cdev.h>
+#include <linux/fs.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/remoteproc.h>
+#include <uapi/linux/remoteproc_cdev.h>
+#include <linux/uaccess.h>
+
+#include "remoteproc_internal.h"
+
+#define NUM_RPROC_DEVICES	64
+static dev_t rproc_major;
+
+static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf,
+				 size_t len, loff_t *pos)
+{
+	struct rproc *rproc = container_of(filp->f_inode->i_cdev,
+					   struct rproc, char_dev);
+	int ret = 0;
+	char cmd[10];
+
+	if (!len || len > sizeof(cmd))
+		return -EINVAL;
+
+	ret = copy_from_user(cmd, buf, sizeof(cmd));
+	if (ret)
+		return -EFAULT;
+
+	if (sysfs_streq(cmd, "start")) {
+		if (rproc->state == RPROC_RUNNING)
+			return -EBUSY;
+
+		ret = rproc_boot(rproc);
+		if (ret)
+			dev_err(&rproc->dev, "Boot failed:%d\n", ret);
+	} else if (sysfs_streq(cmd, "stop")) {
+		if (rproc->state == RPROC_OFFLINE)
+			return -ENXIO;
+
+		rproc_shutdown(rproc);
+	} else {
+		dev_err(&rproc->dev, "Unrecognized option\n");
+		ret = -EINVAL;
+	}
+
+	return ret ? ret : len;
+}
+
+static long rproc_device_ioctl(struct file *filp, unsigned int ioctl,
+				unsigned long arg)
+{
+	struct rproc *rproc = container_of(filp->f_inode->i_cdev,
+					   struct rproc, char_dev);
+	void __user *argp = (void __user *)arg;
+	int ret;
+	bool param;
+
+	switch (ioctl) {
+	case RPROC_SET_SHUTDOWN_ON_RELEASE:
+		ret = copy_from_user(&param, argp, sizeof(bool));
+		if (ret) {
+			dev_err(&rproc->dev, "Data copy from userspace failed\n");
+			return -EINVAL;
+		}
+		rproc->cdev_put_on_release = param;
+		break;
+	case RPROC_GET_SHUTDOWN_ON_RELEASE:
+		ret = copy_to_user(argp, &rproc->cdev_put_on_release,
+				   sizeof(bool));
+		if (ret) {
+			dev_err(&rproc->dev, "Data copy to userspace failed\n");
+			return -EINVAL;
+		}
+		break;
+	default:
+		dev_err(&rproc->dev, "Unsupported ioctl\n");
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int rproc_cdev_release(struct inode *inode, struct file *filp)
+{
+	struct rproc *rproc = container_of(inode->i_cdev, struct rproc,
+					   char_dev);
+
+	if (rproc->cdev_put_on_release && rproc->state != RPROC_OFFLINE)
+		rproc_shutdown(rproc);
+
+	return 0;
+}
+
+
+static const struct file_operations rproc_fops = {
+	.write = rproc_cdev_write,
+	.unlocked_ioctl = rproc_device_ioctl,
+	.release = rproc_cdev_release,
+};
+
+int rproc_char_device_add(struct rproc *rproc)
+{
+	int ret;
+	dev_t cdevt;
+
+	cdev_init(&rproc->char_dev, &rproc_fops);
+	rproc->char_dev.owner = THIS_MODULE;
+
+	cdevt = MKDEV(MAJOR(rproc_major), rproc->index);
+	ret = cdev_add(&rproc->char_dev, cdevt, 1);
+	if (ret < 0)
+		goto out;
+
+	rproc->dev.devt = cdevt;
+out:
+	return ret;
+}
+
+void rproc_char_device_remove(struct rproc *rproc)
+{
+	__unregister_chrdev(MAJOR(rproc->dev.devt), rproc->index, 1, "rproc");
+}
+
+void __init rproc_init_cdev(void)
+{
+	int ret;
+
+	ret = alloc_chrdev_region(&rproc_major, 0, NUM_RPROC_DEVICES, "rproc");
+	if (ret < 0)
+		pr_err("Failed to alloc rproc_cdev region, err %d\n", ret);
+}
+
+void __exit rproc_exit_cdev(void)
+{
+	unregister_chrdev_region(MKDEV(MAJOR(rproc_major), 0),
+				 NUM_RPROC_DEVICES);
+}
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 493ef92..fb9d891 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -47,6 +47,27 @@ struct dentry *rproc_create_trace_file(const char *name, struct rproc *rproc,
 int rproc_init_sysfs(void);
 void rproc_exit_sysfs(void);
 
+#ifdef CONFIG_REMOTEPROC_CDEV
+void rproc_init_cdev(void);
+void rproc_exit_cdev(void);
+int rproc_char_device_add(struct rproc *rproc);
+void rproc_char_device_remove(struct rproc *rproc);
+#else
+static inline void rproc_init_cdev(void)
+{
+}
+static inline void rproc_exit_cdev(void)
+{
+}
+static inline int rproc_char_device_add(struct rproc *rproc)
+{
+	return 0;
+}
+static inline void  rproc_char_device_remove(struct rproc *rproc)
+{
+}
+#endif
+
 void rproc_free_vring(struct rproc_vring *rvring);
 int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 16ad666..9bd2ff5 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -40,6 +40,7 @@
 #include <linux/virtio.h>
 #include <linux/completion.h>
 #include <linux/idr.h>
+#include <linux/cdev.h>
 #include <linux/of.h>
 
 /**
@@ -514,6 +515,8 @@ struct rproc {
 	bool auto_boot;
 	struct list_head dump_segments;
 	int nb_vdev;
+	struct cdev char_dev;
+	bool cdev_put_on_release;
 };
 
 /**
diff --git a/include/uapi/linux/remoteproc_cdev.h b/include/uapi/linux/remoteproc_cdev.h
new file mode 100644
index 0000000..3975120
--- /dev/null
+++ b/include/uapi/linux/remoteproc_cdev.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * IOCTLs for Remoteproc's character device interface.
+ *
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+
+#ifndef _UAPI_REMOTEPROC_CDEV_H_
+#define _UAPI_REMOTEPROC_CDEV_H_
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+#define RPROC_MAGIC	0xB7
+
+#define RPROC_SET_SHUTDOWN_ON_RELEASE _IOW(RPROC_MAGIC, 1, int)
+#define RPROC_GET_SHUTDOWN_ON_RELEASE _IOR(RPROC_MAGIC, 2, int)
+
+#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
