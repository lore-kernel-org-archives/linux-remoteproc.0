Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 3/4] rpmsg: Driver for user space endpoint interface
Date: Fri,  2 Dec 2016 14:03:36 -0800
Message-Id: <1480716217-23303-3-git-send-email-bjorn.andersson@linaro.org>
In-Reply-To: <1480716217-23303-1-git-send-email-bjorn.andersson@linaro.org>
References: <1480716217-23303-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Marek Novak <marek.novak@nxp.com>, Matteo Sartori <matteo.sartori@t3lab.it>, Michal Simek <monstr@monstr.eu>
List-ID: <linux-remoteproc@vger.kernel.org>

This driver allows rpmsg instances to expose access to rpmsg endpoints
to user space processes. It provides a control interface, allowing
userspace to export endpoints and an endpoint interface for each exposed
endpoint.

The implementation is based on prior art by Texas Instrument, Google,
PetaLogix and was derived from a FreeRTOS performance statistics driver
written by Michal Simek.

The control interface provides a "create endpoint" ioctl, which is fed a
name, source and destination address. The three values are used to
create the endpoint, in a backend-specific way, and a rpmsg endpoint
device is created - with the three parameters are available in sysfs for
udev usage.

E.g. to create an endpoint device for one of the Qualcomm SMD channel
related to DIAG one would issue:

  struct rpmsg_endpoint_info info = { "DIAG_CNTL", 0, 0 };
  int fd = open("/dev/rpmsg_ctrl0", O_RDWR);
  ioctl(fd, RPMSG_CREATE_EPT_IOCTL, &info);

Each created endpoint device shows up as an individual character device
in /dev, allowing permission to be controlled on a per-endpoint basis.
The rpmsg endpoint will be created and destroyed following the opening
and closing of the endpoint device, allowing rpmsg backends to open and
close the physical channel, if supported by the wire protocol.

Cc: Marek Novak <marek.novak@nxp.com>
Cc: Matteo Sartori <matteo.sartori@t3lab.it>
Cc: Michal Simek <monstr@monstr.eu>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Add separate Kconfig option
- Add poll support
- Added some kerneldoc
- Corrected synchronization issue for destruction of open endpoints racing on
  rpmsg_destroy_ept()
- Corrected error paths issues related to ida handling

 Documentation/ioctl/ioctl-number.txt |   1 +
 drivers/rpmsg/Kconfig                |   8 +
 drivers/rpmsg/Makefile               |   1 +
 drivers/rpmsg/rpmsg_char.c           | 589 +++++++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h       |  15 +
 include/uapi/linux/rpmsg.h           |  35 +++
 6 files changed, 649 insertions(+)
 create mode 100644 drivers/rpmsg/rpmsg_char.c
 create mode 100644 include/uapi/linux/rpmsg.h

diff --git a/Documentation/ioctl/ioctl-number.txt b/Documentation/ioctl/ioctl-number.txt
index 81c7f2bb7daf..08244bea5048 100644
--- a/Documentation/ioctl/ioctl-number.txt
+++ b/Documentation/ioctl/ioctl-number.txt
@@ -321,6 +321,7 @@ Code  Seq#(hex)	Include File		Comments
 0xB1	00-1F	PPPoX			<mailto:mostrows@styx.uwaterloo.ca>
 0xB3	00	linux/mmc/ioctl.h
 0xB4	00-0F	linux/gpio.h		<mailto:linux-gpio@vger.kernel.org>
+0xB5	00-0F	uapi/linux/rpmsg.h	<mailto:linux-remoteproc@vger.kernel.org>
 0xC0	00-0F	linux/usb/iowarrior.h
 0xCA	00-0F	uapi/misc/cxl.h
 0xCA	80-8F	uapi/scsi/cxlflash_ioctl.h
diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index de31c5f14dd9..fa0d582efb3d 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -4,6 +4,14 @@ menu "Rpmsg drivers"
 config RPMSG
 	tristate
 
+config RPMSG_CHAR
+	tristate "RPMSG device interface"
+	depends on RPMSG
+	help
+	  Say Y here to export rpmsg endpoints as device files, usually found
+	  in /dev. They make it possible for user-space programs to send and
+	  receive rpmsg packets.
+
 config RPMSG_QCOM_SMD
 	tristate "Qualcomm Shared Memory Driver (SMD)"
 	depends on QCOM_SMEM
diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
index ae9c9132cf76..fae9a6d548fb 100644
--- a/drivers/rpmsg/Makefile
+++ b/drivers/rpmsg/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
+obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
 obj-$(CONFIG_RPMSG_QCOM_SMD)	+= qcom_smd.o
 obj-$(CONFIG_RPMSG_VIRTIO)	+= virtio_rpmsg_bus.o
diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
new file mode 100644
index 000000000000..07dde87d70fe
--- /dev/null
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -0,0 +1,589 @@
+/*
+ * Copyright (c) 2016, Linaro Ltd.
+ * Copyright (c) 2012, Michal Simek <monstr@monstr.eu>
+ * Copyright (c) 2012, PetaLogix
+ * Copyright (c) 2011, Texas Instruments, Inc.
+ * Copyright (c) 2011, Google, Inc.
+ *
+ * Based on rpmsg performance statistics driver by Michal Simek, which in turn
+ * was based on TI & Google OMX rpmsg driver.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#include <linux/cdev.h>
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/idr.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/poll.h>
+#include <linux/rpmsg.h>
+#include <linux/skbuff.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+#include <uapi/linux/rpmsg.h>
+
+#include "rpmsg_internal.h"
+
+#define RPMSG_DEV_MAX	(MINORMASK + 1)
+
+static dev_t rpmsg_major;
+static struct class *rpmsg_class;
+
+static DEFINE_IDA(rpmsg_ctrl_ida);
+static DEFINE_IDA(rpmsg_ept_ida);
+static DEFINE_IDA(rpmsg_minor_ida);
+
+#define dev_to_eptdev(dev) container_of(dev, struct rpmsg_eptdev, dev)
+#define cdev_to_eptdev(i_cdev) container_of(i_cdev, struct rpmsg_eptdev, cdev)
+
+#define dev_to_ctrldev(dev) container_of(dev, struct rpmsg_ctrldev, dev)
+#define cdev_to_ctrldev(i_cdev) container_of(i_cdev, struct rpmsg_ctrldev, cdev)
+
+/**
+ * struct rpmsg_ctrldev - control device for instantiating endpoint devices
+ * @rpdev:	underlaying rpmsg device
+ * @cdev:	cdev for the ctrl device
+ * @dev:	device for the ctrl device
+ */
+struct rpmsg_ctrldev {
+	struct rpmsg_device *rpdev;
+	struct cdev cdev;
+	struct device dev;
+};
+
+/**
+ * struct rpmsg_eptdev - endpoint device context
+ * @dev:	endpoint device
+ * @cdev:	cdev for the endpoint device
+ * @rpdev:	underlaying rpmsg device
+ * @chinfo:	info used to open the endpoint
+ * @ept_lock:	synchronization of @ept modifications
+ * @ept:	rpmsg endpoint reference, when open
+ * @queue_lock:	synchronization of @queue operations
+ * @queue:	incoming message queue
+ * @readq:	wait object for incoming queue
+ */
+struct rpmsg_eptdev {
+	struct device dev;
+	struct cdev cdev;
+
+	struct rpmsg_device *rpdev;
+	struct rpmsg_channel_info chinfo;
+
+	struct mutex ept_lock;
+	struct rpmsg_endpoint *ept;
+
+	spinlock_t queue_lock;
+	struct sk_buff_head queue;
+	wait_queue_head_t readq;
+};
+
+static int rpmsg_eptdev_destroy(struct device *dev, void *data)
+{
+	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
+
+	mutex_lock(&eptdev->ept_lock);
+	if (eptdev->ept) {
+		rpmsg_destroy_ept(eptdev->ept);
+		eptdev->ept = NULL;
+	}
+	mutex_unlock(&eptdev->ept_lock);
+
+	/* wake up any blocked readers */
+	wake_up_interruptible(&eptdev->readq);
+
+	device_del(&eptdev->dev);
+	put_device(&eptdev->dev);
+
+	return 0;
+}
+
+static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
+			void *priv, u32 addr)
+{
+	struct rpmsg_eptdev *eptdev = priv;
+	struct sk_buff *skb;
+
+	skb = alloc_skb(len, GFP_ATOMIC);
+	if (!skb)
+		return -ENOMEM;
+
+	memcpy(skb_put(skb, len), buf, len);
+
+	spin_lock(&eptdev->queue_lock);
+	skb_queue_tail(&eptdev->queue, skb);
+	spin_unlock(&eptdev->queue_lock);
+
+	/* wake up any blocking processes, waiting for new data */
+	wake_up_interruptible(&eptdev->readq);
+
+	return 0;
+}
+
+static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
+{
+	struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
+	struct rpmsg_endpoint *ept;
+	struct rpmsg_device *rpdev = eptdev->rpdev;
+	struct device *dev = &eptdev->dev;
+
+	get_device(dev);
+
+	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
+	if (!ept) {
+		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
+		put_device(dev);
+		return -EINVAL;
+	}
+
+	eptdev->ept = ept;
+	filp->private_data = eptdev;
+
+	return 0;
+}
+
+static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
+{
+	struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
+	struct device *dev = &eptdev->dev;
+	struct sk_buff *skb;
+
+	/* Close the endpoint, if it's not already destroyed by the parent */
+	mutex_lock(&eptdev->ept_lock);
+	if (eptdev->ept) {
+		rpmsg_destroy_ept(eptdev->ept);
+		eptdev->ept = NULL;
+	}
+	mutex_unlock(&eptdev->ept_lock);
+
+	/* Discard all SKBs */
+	while (!skb_queue_empty(&eptdev->queue)) {
+		skb = skb_dequeue(&eptdev->queue);
+		kfree_skb(skb);
+	}
+
+	put_device(dev);
+
+	return 0;
+}
+
+static ssize_t rpmsg_eptdev_read(struct file *filp, char __user *buf,
+				 size_t len, loff_t *f_pos)
+{
+	struct rpmsg_eptdev *eptdev = filp->private_data;
+	unsigned long flags;
+	struct sk_buff *skb;
+	int use;
+
+	if (!eptdev->ept)
+		return -EPIPE;
+
+	spin_lock_irqsave(&eptdev->queue_lock, flags);
+
+	/* Wait for data in the queue */
+	if (skb_queue_empty(&eptdev->queue)) {
+		spin_unlock_irqrestore(&eptdev->queue_lock, flags);
+
+		if (filp->f_flags & O_NONBLOCK)
+			return -EAGAIN;
+
+		/* Wait until we get data or the endpoint goes away */
+		if (wait_event_interruptible(eptdev->readq,
+					     !skb_queue_empty(&eptdev->queue) ||
+					     !eptdev->ept))
+			return -ERESTARTSYS;
+
+		/* We lost the endpoint while waiting */
+		if (!eptdev->ept)
+			return -EPIPE;
+
+		spin_lock_irqsave(&eptdev->queue_lock, flags);
+	}
+
+	skb = skb_dequeue(&eptdev->queue);
+	if (!skb)
+		return -EFAULT;
+
+	spin_unlock_irqrestore(&eptdev->queue_lock, flags);
+
+	use = min_t(size_t, len, skb->len);
+	if (copy_to_user(buf, skb->data, use))
+		use = -EFAULT;
+
+	kfree_skb(skb);
+
+	return use;
+}
+
+static ssize_t rpmsg_eptdev_write(struct file *filp, const char __user *buf,
+				  size_t len, loff_t *f_pos)
+{
+	struct rpmsg_eptdev *eptdev = filp->private_data;
+	void *kbuf;
+	int ret;
+
+	kbuf = kzalloc(len, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	if (copy_from_user(kbuf, buf, len)) {
+		ret = -EFAULT;
+		goto free_kbuf;
+	}
+
+	if (mutex_lock_interruptible(&eptdev->ept_lock)) {
+		ret = -ERESTARTSYS;
+		goto free_kbuf;
+	}
+
+	if (!eptdev->ept) {
+		ret = -EPIPE;
+		goto unlock_eptdev;
+	}
+
+	if (filp->f_flags & O_NONBLOCK)
+		ret = rpmsg_trysend(eptdev->ept, kbuf, len);
+	else
+		ret = rpmsg_send(eptdev->ept, kbuf, len);
+
+unlock_eptdev:
+	mutex_unlock(&eptdev->ept_lock);
+
+free_kbuf:
+	kfree(kbuf);
+	return ret < 0 ? ret : len;
+}
+
+static unsigned int rpmsg_eptdev_poll(struct file *filp, poll_table *wait)
+{
+	struct rpmsg_eptdev *eptdev = filp->private_data;
+	unsigned int mask = 0;
+
+	if (!eptdev->ept)
+		return POLLERR;
+
+	poll_wait(filp, &eptdev->readq, wait);
+
+	if (!skb_queue_empty(&eptdev->queue))
+		mask |= POLLIN | POLLRDNORM;
+
+	mask |= rpmsg_poll(eptdev->ept, filp, wait);
+
+	return mask;
+}
+
+static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
+			       unsigned long arg)
+{
+	struct rpmsg_eptdev *eptdev = fp->private_data;
+
+	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
+		return -EINVAL;
+
+	return rpmsg_eptdev_destroy(&eptdev->dev, NULL);
+}
+
+static const struct file_operations rpmsg_eptdev_fops = {
+	.owner = THIS_MODULE,
+	.open = rpmsg_eptdev_open,
+	.release = rpmsg_eptdev_release,
+	.read = rpmsg_eptdev_read,
+	.write = rpmsg_eptdev_write,
+	.poll = rpmsg_eptdev_poll,
+	.unlocked_ioctl = rpmsg_eptdev_ioctl,
+};
+
+static ssize_t name_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	struct rpmsg_eptdev *eptdev = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%s\n", eptdev->chinfo.name);
+}
+static DEVICE_ATTR_RO(name);
+
+static ssize_t src_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	struct rpmsg_eptdev *eptdev = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d\n", eptdev->chinfo.src);
+}
+static DEVICE_ATTR_RO(src);
+
+static ssize_t dst_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	struct rpmsg_eptdev *eptdev = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d\n", eptdev->chinfo.dst);
+}
+static DEVICE_ATTR_RO(dst);
+
+static struct attribute *rpmsg_eptdev_attrs[] = {
+	&dev_attr_name.attr,
+	&dev_attr_src.attr,
+	&dev_attr_dst.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(rpmsg_eptdev);
+
+static void rpmsg_eptdev_release_device(struct device *dev)
+{
+	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
+
+	ida_simple_remove(&rpmsg_ept_ida, dev->id);
+	ida_simple_remove(&rpmsg_minor_ida, MINOR(eptdev->dev.devt));
+	cdev_del(&eptdev->cdev);
+	kfree(eptdev);
+}
+
+static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
+			       struct rpmsg_channel_info chinfo)
+{
+	struct rpmsg_device *rpdev = ctrldev->rpdev;
+	struct rpmsg_eptdev *eptdev;
+	struct device *dev;
+	int ret;
+
+	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
+	if (!eptdev)
+		return -ENOMEM;
+
+	dev = &eptdev->dev;
+	eptdev->rpdev = rpdev;
+	eptdev->chinfo = chinfo;
+
+	mutex_init(&eptdev->ept_lock);
+	spin_lock_init(&eptdev->queue_lock);
+	skb_queue_head_init(&eptdev->queue);
+	init_waitqueue_head(&eptdev->readq);
+
+	device_initialize(dev);
+	dev->class = rpmsg_class;
+	dev->parent = &ctrldev->dev;
+	dev->groups = rpmsg_eptdev_groups;
+	dev_set_drvdata(dev, eptdev);
+
+	cdev_init(&eptdev->cdev, &rpmsg_eptdev_fops);
+	eptdev->cdev.owner = THIS_MODULE;
+
+	ret = ida_simple_get(&rpmsg_minor_ida, 0, RPMSG_DEV_MAX, GFP_KERNEL);
+	if (ret < 0)
+		goto free_eptdev;
+	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
+
+	ret = ida_simple_get(&rpmsg_ept_ida, 0, 0, GFP_KERNEL);
+	if (ret < 0)
+		goto free_minor_ida;
+	dev->id = ret;
+	dev_set_name(dev, "rpmsg%d", ret);
+
+	ret = cdev_add(&eptdev->cdev, dev->devt, 1);
+	if (ret)
+		goto free_ept_ida;
+
+	/* We can now rely on the release function for cleanup */
+	dev->release = rpmsg_eptdev_release_device;
+
+	ret = device_add(dev);
+	if (ret) {
+		dev_err(dev, "device_register failed: %d\n", ret);
+		put_device(dev);
+	}
+
+	return ret;
+
+free_ept_ida:
+	ida_simple_remove(&rpmsg_ept_ida, dev->id);
+free_minor_ida:
+	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
+free_eptdev:
+	put_device(dev);
+	kfree(eptdev);
+
+	return ret;
+}
+
+static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
+{
+	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
+
+	get_device(&ctrldev->dev);
+	filp->private_data = ctrldev;
+
+	return 0;
+}
+
+static int rpmsg_ctrldev_release(struct inode *inode, struct file *filp)
+{
+	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
+
+	put_device(&ctrldev->dev);
+
+	return 0;
+}
+
+static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
+				unsigned long arg)
+{
+	struct rpmsg_ctrldev *ctrldev = fp->private_data;
+	void __user *argp = (void __user *)arg;
+	struct rpmsg_endpoint_info eptinfo;
+	struct rpmsg_channel_info chinfo;
+
+	if (cmd != RPMSG_CREATE_EPT_IOCTL)
+		return -EINVAL;
+
+	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
+		return -EFAULT;
+
+	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
+	chinfo.name[RPMSG_NAME_SIZE-1] = '\0';
+	chinfo.src = eptinfo.src;
+	chinfo.dst = eptinfo.dst;
+
+	return rpmsg_eptdev_create(ctrldev, chinfo);
+};
+
+static const struct file_operations rpmsg_ctrldev_fops = {
+	.owner = THIS_MODULE,
+	.open = rpmsg_ctrldev_open,
+	.release = rpmsg_ctrldev_release,
+	.unlocked_ioctl = rpmsg_ctrldev_ioctl,
+};
+
+static void rpmsg_ctrldev_release_device(struct device *dev)
+{
+	struct rpmsg_ctrldev *ctrldev = dev_to_ctrldev(dev);
+
+	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
+	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
+	cdev_del(&ctrldev->cdev);
+	kfree(ctrldev);
+}
+
+static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_ctrldev *ctrldev;
+	struct device *dev;
+	int ret;
+
+	ctrldev = kzalloc(sizeof(*ctrldev), GFP_KERNEL);
+	if (!ctrldev)
+		return -ENOMEM;
+
+	ctrldev->rpdev = rpdev;
+
+	dev = &ctrldev->dev;
+	device_initialize(dev);
+	dev->parent = &rpdev->dev;
+	dev->class = rpmsg_class;
+
+	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
+	ctrldev->cdev.owner = THIS_MODULE;
+
+	ret = ida_simple_get(&rpmsg_minor_ida, 0, RPMSG_DEV_MAX, GFP_KERNEL);
+	if (ret < 0)
+		goto free_ctrldev;
+	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
+
+	ret = ida_simple_get(&rpmsg_ctrl_ida, 0, 0, GFP_KERNEL);
+	if (ret < 0)
+		goto free_minor_ida;
+	dev->id = ret;
+	dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
+
+	ret = cdev_add(&ctrldev->cdev, dev->devt, 1);
+	if (ret)
+		goto free_ctrl_ida;
+
+	/* We can now rely on the release function for cleanup */
+	dev->release = rpmsg_ctrldev_release_device;
+
+	ret = device_add(dev);
+	if (ret) {
+		dev_err(&rpdev->dev, "device_register failed: %d\n", ret);
+		put_device(dev);
+	}
+
+	dev_set_drvdata(&rpdev->dev, ctrldev);
+
+	return ret;
+
+free_ctrl_ida:
+	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
+free_minor_ida:
+	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
+free_ctrldev:
+	put_device(dev);
+	kfree(ctrldev);
+
+	return ret;
+}
+
+static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_ctrldev *ctrldev = dev_get_drvdata(&rpdev->dev);
+	int ret;
+
+	/* Destroy all endpoints */
+	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_eptdev_destroy);
+	if (ret)
+		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
+
+	device_del(&ctrldev->dev);
+	put_device(&ctrldev->dev);
+}
+
+static struct rpmsg_driver rpmsg_chrdev_driver = {
+	.probe = rpmsg_chrdev_probe,
+	.remove = rpmsg_chrdev_remove,
+	.drv = {
+		.name = "rpmsg_chrdev",
+	},
+};
+
+static int rpmsg_char_init(void)
+{
+	int ret;
+
+	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg");
+	if (ret < 0) {
+		pr_err("rpmsg: failed to allocate char dev region\n");
+		return ret;
+	}
+
+	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
+	if (IS_ERR(rpmsg_class)) {
+		pr_err("failed to create rpmsg class\n");
+		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
+		return PTR_ERR(rpmsg_class);
+	}
+
+	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
+	if (ret < 0) {
+		pr_err("rpmsgchr: failed to register rpmsg driver\n");
+		class_destroy(rpmsg_class);
+		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
+	}
+
+	return ret;
+}
+postcore_initcall(rpmsg_char_init);
+
+static void rpmsg_chrdev_exit(void)
+{
+	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
+	class_destroy(rpmsg_class);
+	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
+}
+module_exit(rpmsg_chrdev_exit);
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index 6176f2457b6b..0cf9c7e2ee83 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -82,4 +82,19 @@ int rpmsg_unregister_device(struct device *parent,
 struct device *rpmsg_find_device(struct device *parent,
 				 struct rpmsg_channel_info *chinfo);
 
+/**
+ * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
+ * @rpdev:	prepared rpdev to be used for creating endpoints
+ *
+ * This function wraps rpmsg_register_device() preparing the rpdev for use as
+ * basis for the rpmsg chrdev.
+ */
+static inline int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
+{
+	strcpy(rpdev->id.name, "rpmsg_chrdev");
+	rpdev->driver_override = "rpmsg_chrdev";
+
+	return rpmsg_register_device(rpdev);
+}
+
 #endif
diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
new file mode 100644
index 000000000000..dedc226e0d3f
--- /dev/null
+++ b/include/uapi/linux/rpmsg.h
@@ -0,0 +1,35 @@
+/*
+ * Copyright (c) 2016, Linaro Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _UAPI_RPMSG_H_
+#define _UAPI_RPMSG_H_
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+/**
+ * struct rpmsg_endpoint_info - endpoint info representation
+ * @name: name of service
+ * @src: local address
+ * @dst: destination address
+ */
+struct rpmsg_endpoint_info {
+	char name[32];
+	__u32 src;
+	__u32 dst;
+};
+
+#define RPMSG_CREATE_EPT_IOCTL	_IOW(0xb5, 0x1, struct rpmsg_endpoint_info)
+#define RPMSG_DESTROY_EPT_IOCTL	_IO(0xb5, 0x2)
+
+#endif
-- 
2.5.0
