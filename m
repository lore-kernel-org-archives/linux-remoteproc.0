Return-Path: <matteo.sartori@t3lab.it>
Return-Path: <matteo.sartori@t3lab.it>
Date: Tue, 30 Aug 2016 16:39:32 +0200
From: Matteo Sartori <matteo.sartori@t3lab.it>
Subject: [PATCH 1/1] rpmsg: driver which exposes channels through char devices
Message-ID: <20160830143932.GA25638@alexat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: bjorn.andersson@linaro.org
Cc: takahiro.akashi@linaro.org, alessio.paccoia@t3lab.it, michele.rodolfi@t3lab.it, claudio.salati@t3lab.it, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Define a new rpmsg driver that matches rpmsg devices named "rpmsg-char-dev".
For each probed channel the driver spawns a char device with the naming
scheme "rpmsgX", where X is the minor number. It creates a new class named
"rpmsg_chardev".
Data received from the bus is put in a per-device kfifo which is
RPMSG_BUF_SIZE * 4 large. If the kfifo is found full the message is dropped.
The driver also supports three ioctls for giving the user the possibility to
examine the state of the underlying buffer.

This patch is based on the code found in OpemAMP repository
 https://github.com/OpenAMP/open-amp
at the location
 obsolete/system/linux/kernelspace/rpmsg_user_dev_driver/rpmsg_user_dev_driver.c

Signed-off-by: Matteo Sartori <matteo.sartori@t3lab.it>
---
 drivers/rpmsg/Kconfig         |   7 +
 drivers/rpmsg/Makefile        |   1 +
 drivers/rpmsg/rpmsg_chardev.c | 335 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 343 insertions(+)
 create mode 100644 drivers/rpmsg/rpmsg_chardev.c

diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index 69a2193..6119c1e 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -6,4 +6,11 @@ config RPMSG
 	select VIRTIO
 	select VIRTUALIZATION
 
+config RPMSG_CHARDEV
+	tristate "rpmsg char device driver"
+	select RPMSG
+	help
+	  This driver permits userspace programs to access rpmsg channels
+	  through char devices.
+
 endmenu
diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
index 7617fcb..b45f1eb 100644
--- a/drivers/rpmsg/Makefile
+++ b/drivers/rpmsg/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_RPMSG)	+= virtio_rpmsg_bus.o
+obj-$(CONFIG_RPMSG_CHARDEV) += rpmsg_chardev.o
diff --git a/drivers/rpmsg/rpmsg_chardev.c b/drivers/rpmsg/rpmsg_chardev.c
new file mode 100644
index 0000000..664e9a6
--- /dev/null
+++ b/drivers/rpmsg/rpmsg_chardev.c
@@ -0,0 +1,335 @@
+/*
+ * Rpmsg driver exporting matched channels to userspace through char devices.
+ *
+ * Copyright (C) 2014 Mentor Graphics Corporation
+ * Copyright (C) 2015 Xilinx, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/cdev.h>
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/kfifo.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/rpmsg.h>
+#include <linux/uaccess.h>
+#include <linux/wait.h>
+
+#define RPMSG_BUF_SIZE			512
+#define RPMSG_KFIFO_SIZE		(RPMSG_BUF_SIZE * 4)
+#define RPMSG_MAX_MINORS		10
+#define RPMG_INIT_MSG			"init_msg"
+
+#define IOCTL_CMD_GET_KFIFO_SIZE	1
+#define IOCTL_CMD_GET_AVAIL_DATA_SIZE	2
+#define IOCTL_CMD_GET_FREE_BUFF_SIZE	3
+
+/**
+ * struct rpmsg_cdev_private - char device driver private data
+ * @rpmsg_minor:	char device minor number
+ * @rpmsg_dev:		this is allocated through device_create()
+ * @sync_lock:		used for gaining exclusive access to the kfifo
+ * @rpmsg_kfifo:	given the fact rpmsg receive operations are asynchronous
+ *			we need a buffer to store received messages from the bus
+ * @usr_wait_q:		syncronization to block and to awake read() syscalls
+ *			when new data has been received from the bus
+ * @block_flag:		flag to signal stopping and waking conditions
+ * @rpmsg_chnl:		rpmsg channel instance this cdev is bound to
+ * @tx_buff:		upon a write() syscall the message is copied inside a
+ *			temporary buffer prior to send it through rpmsg_send()
+ *
+ * This struct represents private data to each rpmsg channel found on the bus
+ * that is to be exposed to userspace through a char device. We need two
+ * buffers, one for tx the other for rx, and a work_queue to implement blocking
+ * read() syscalls.
+ */
+struct rpmsg_cdev_private {
+	int rpmsg_minor;
+	struct device *rpmsg_dev;
+	struct cdev cdev;
+	struct mutex sync_lock;
+	struct kfifo rpmsg_kfifo;
+	wait_queue_head_t usr_wait_q;
+	int block_flag;
+	struct rpmsg_channel *rpmsg_chnl;
+	char tx_buff[RPMSG_BUF_SIZE];
+};
+
+static struct class *rpmsg_cdev_class;
+static int rpmsg_cdev_major;
+static int rpmsg_cdev_next_minor;
+
+static int rpmsg_cdev_open(struct inode *inode, struct file *p_file)
+{
+	struct rpmsg_cdev_private *local =
+		container_of(inode->i_cdev, struct rpmsg_cdev_private, cdev);
+
+	p_file->private_data = local;
+	return 0;
+}
+
+static ssize_t rpmsg_cdev_write(struct file *p_file, const char __user *ubuff,
+				size_t len, loff_t *p_off)
+{
+	int err;
+	unsigned int size;
+	struct rpmsg_cdev_private *local = p_file->private_data;
+
+	size = len < RPMSG_BUF_SIZE ? len : RPMSG_BUF_SIZE;
+
+	if (copy_from_user(local->tx_buff, ubuff, size)) {
+		dev_err(local->rpmsg_dev, "User to kernel buffer copy error\n");
+		return -1;
+	}
+
+	err = rpmsg_send(local->rpmsg_chnl, local->tx_buff, size);
+
+	if (err) {
+		dev_err(local->rpmsg_dev, "rpmsg_send error: %d\n", err);
+		size = 0;
+	}
+
+	return size;
+}
+
+static ssize_t rpmsg_cdev_read(struct file *p_file, char __user *ubuff,
+			       size_t len, loff_t *p_off)
+{
+	int retval;
+	unsigned int data_available, data_used, bytes_copied;
+	struct rpmsg_cdev_private *local = p_file->private_data;
+
+	mutex_lock(&local->sync_lock);
+
+	data_available = kfifo_len(&local->rpmsg_kfifo);
+
+	if (data_available ==  0) {
+		mutex_unlock(&local->sync_lock);
+
+		/* If non-blocking read is requested return error. */
+		if (p_file->f_flags & O_NONBLOCK)
+			return -EAGAIN;
+
+		wait_event_interruptible(local->usr_wait_q,
+					 local->block_flag != 0);
+		mutex_lock(&local->sync_lock);
+	}
+
+	local->block_flag = 0;
+
+	data_available = kfifo_len(&local->rpmsg_kfifo);
+	data_used = (data_available > len) ? len : data_available;
+	retval = kfifo_to_user(&local->rpmsg_kfifo, ubuff, data_used,
+			       &bytes_copied);
+
+	mutex_unlock(&local->sync_lock);
+
+	return retval ? retval : bytes_copied;
+}
+
+static long rpmsg_cdev_ioctl(struct file *p_file, unsigned int cmd,
+			     unsigned long arg)
+{
+	unsigned int tmp;
+	struct rpmsg_cdev_private *local = p_file->private_data;
+
+	switch (cmd) {
+	case IOCTL_CMD_GET_KFIFO_SIZE:
+		tmp = kfifo_size(&local->rpmsg_kfifo);
+		if (copy_to_user((unsigned int *)arg, &tmp, sizeof(int)))
+			return -EACCES;
+		break;
+	case IOCTL_CMD_GET_AVAIL_DATA_SIZE:
+		tmp = kfifo_len(&local->rpmsg_kfifo);
+		if (copy_to_user((unsigned int *)arg, &tmp, sizeof(int)))
+			return -EACCES;
+		break;
+	case IOCTL_CMD_GET_FREE_BUFF_SIZE:
+		tmp = kfifo_avail(&local->rpmsg_kfifo);
+		if (copy_to_user((unsigned int *)arg, &tmp, sizeof(int)))
+			return -EACCES;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rpmsg_cdev_release(struct inode *inode, struct file *p_file)
+{
+	/*
+	 * Nothing to release.
+	 */
+	return 0;
+}
+
+static const struct file_operations rpmsg_cdev_fops = {
+	.owner = THIS_MODULE,
+	.open = rpmsg_cdev_open,
+	.read = rpmsg_cdev_read,
+	.write = rpmsg_cdev_write,
+	.unlocked_ioctl = rpmsg_cdev_ioctl,
+	.release = rpmsg_cdev_release,
+};
+
+static void rpmsg_cdev_drv_cb(struct rpmsg_channel *rpdev, void *data, int len,
+			      void *priv, u32 src)
+{
+	struct rpmsg_cdev_private *local = dev_get_drvdata(&rpdev->dev);
+
+	mutex_lock(&local->sync_lock);
+
+	/* Drop the message if the kfifo is full. */
+	if (kfifo_avail(&local->rpmsg_kfifo) < len) {
+		mutex_unlock(&local->sync_lock);
+		dev_dbg(local->rpmsg_dev, "kfifo is full, message dropped\n");
+		return;
+	}
+
+	kfifo_in(&local->rpmsg_kfifo, data, (unsigned int)len);
+	mutex_unlock(&local->sync_lock);
+
+	/* Wake up any blocking contexts waiting for data. */
+	local->block_flag = 1;
+	wake_up_interruptible(&local->usr_wait_q);
+}
+
+static int rpmsg_cdev_drv_probe(struct rpmsg_channel *rpdev)
+{
+	int status;
+	struct rpmsg_cdev_private *local;
+
+	dev_dbg(&rpdev->dev, "Matched rpmsg channel: %s\n", rpdev->id.name);
+
+	local = devm_kzalloc(&rpdev->dev, sizeof(struct rpmsg_cdev_private),
+			     GFP_KERNEL);
+	if (!local)
+		return -ENOMEM;
+
+	memset(local, 0x0, sizeof(struct rpmsg_cdev_private));
+
+	dev_set_drvdata(&rpdev->dev, local);
+
+	local->rpmsg_chnl = rpdev;
+	local->block_flag = 0;
+	mutex_init(&local->sync_lock);
+	init_waitqueue_head(&local->usr_wait_q);
+	status = kfifo_alloc(&local->rpmsg_kfifo, RPMSG_KFIFO_SIZE, GFP_KERNEL);
+	if (status) {
+		dev_err(&rpdev->dev, "Failed to allocate kfifo\n");
+		goto err;
+	}
+	kfifo_reset(&local->rpmsg_kfifo);
+
+	/* Send a init message to signal successful channel creation. */
+	sprintf(local->tx_buff, RPMG_INIT_MSG);
+	if (rpmsg_send(local->rpmsg_chnl, local->tx_buff,
+		       sizeof(RPMG_INIT_MSG))) {
+		dev_err(&rpdev->dev, "Failed to send init msg\n");
+		goto err_free;
+	}
+
+	/* Initialize and create character device. */
+	if (rpmsg_cdev_next_minor < RPMSG_MAX_MINORS) {
+		local->rpmsg_minor = rpmsg_cdev_next_minor++;
+	} else {
+		dev_err(&rpdev->dev, "Cannot allocate cdev. Max minors: %d\n",
+			RPMSG_MAX_MINORS);
+		goto err_free;
+	}
+
+	cdev_init(&local->cdev, &rpmsg_cdev_fops);
+	local->cdev.owner = THIS_MODULE;
+	if (cdev_add(&local->cdev,
+		     MKDEV(rpmsg_cdev_major, local->rpmsg_minor), 1)) {
+		dev_err(&rpdev->dev, "Failed to register the cdev\n");
+		goto err_free;
+	}
+
+	local->rpmsg_dev = device_create(rpmsg_cdev_class, &rpdev->dev,
+				MKDEV(rpmsg_cdev_major, local->rpmsg_minor),
+				NULL, "rpmsg%u", local->rpmsg_minor);
+
+	if (local->rpmsg_dev == NULL) {
+		dev_err(&rpdev->dev, "Failed to create the device file\n");
+		goto err_free;
+	}
+
+	dev_dbg(&rpdev->dev, "Allocated rpmsg%u dev for channel 0x%x - 0x%x\n",
+		local->rpmsg_minor, rpdev->src, rpdev->dst);
+	return 0;
+
+err_free:
+	kfifo_free(&local->rpmsg_kfifo);
+err:
+	return -ENODEV;
+}
+
+static void rpmsg_cdev_drv_remove(struct rpmsg_channel *rpdev)
+{
+	struct rpmsg_cdev_private *local = dev_get_drvdata(&rpdev->dev);
+
+	dev_dbg(&rpdev->dev, "%s\n", __func__);
+	device_destroy(rpmsg_cdev_class,
+		       MKDEV(rpmsg_cdev_major, local->rpmsg_minor));
+	cdev_del(&local->cdev);
+	kfifo_free(&local->rpmsg_kfifo);
+}
+
+static struct rpmsg_device_id rpmsg_cdev_drv_id_table[] = {
+	{ .name = "rpmsg-char-dev" },
+	{},
+};
+
+static struct rpmsg_driver rpmsg_cdev_driver = {
+	.drv.name = "rpmsg_chardev",
+	.drv.owner = THIS_MODULE,
+	.callback = rpmsg_cdev_drv_cb,
+	.probe = rpmsg_cdev_drv_probe,
+	.remove = rpmsg_cdev_drv_remove,
+	.id_table = rpmsg_cdev_drv_id_table,
+};
+
+static int __init init(void)
+{
+	dev_t dev;
+
+	rpmsg_cdev_class = class_create(THIS_MODULE, "rpmsg_chardev");
+	if (rpmsg_cdev_class == NULL) {
+		pr_err("Failed to register rpmsg_char_dev class\n");
+		return -1;
+	}
+
+	if (alloc_chrdev_region(&dev, 0, RPMSG_MAX_MINORS, "rpmsg_chardev") < 0) {
+		pr_err("Error allocating char device\n");
+		class_destroy(rpmsg_cdev_class);
+		return -1;
+	}
+
+	rpmsg_cdev_major = MAJOR(dev);
+	return register_rpmsg_driver(&rpmsg_cdev_driver);
+}
+
+static void __exit fini(void)
+{
+	unregister_rpmsg_driver(&rpmsg_cdev_driver);
+	unregister_chrdev_region(MKDEV(rpmsg_cdev_major, 0), RPMSG_MAX_MINORS);
+	class_destroy(rpmsg_cdev_class);
+}
+
+module_init(init);
+module_exit(fini);
+
+MODULE_DESCRIPTION("Driver to expose rpmsg channels to userspace via char devices");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4
