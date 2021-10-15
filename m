Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D30A8C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Oct 2021 09:47:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B85BF61213
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Oct 2021 09:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234082AbhJOJtu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 15 Oct 2021 05:49:50 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:37356 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232983AbhJOJts (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 15 Oct 2021 05:49:48 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19F4uh36028649;
        Fri, 15 Oct 2021 11:47:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=UMTQgjR3bwMtJUUizl6ZxoSP6nAtkPRIzzS9+q44ugA=;
 b=IRklu2cdIv7km1x7CQroFA9tXhJajrnO0wJZgK08UYDc4hUtjkeKTtTPwgnEVj1IshHH
 lGd6CArqqZJi+MTOwSMkQq+M3yp77PpHTcaXJNX/zFvFqXMTWTKnvUkT7KtNb0Jg4Kfv
 NbR70OdiO6oRFTYhvzTn1Fp6nEUAKGn7UZRQ/jEC4VKcWPzovjQXJOSshBfLFPEoYfj8
 Eq1waDS33YUmjoZI3HLHnyqQ/rQ1mzaOfLLK7PWx/NhBrJhiQA0RmK8PJtb129Gw/rvr
 sK6m1WaPyaLxHadSOO+tqCvOSvGA94ZlRlQTJ687zAGbf0ONpFbPD1OPABaNakxdDP8O lA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bq32b9py2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Oct 2021 11:47:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 08F0D100038;
        Fri, 15 Oct 2021 11:47:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F3B1421ED3B;
        Fri, 15 Oct 2021 11:47:27 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 15 Oct 2021 11:47:27
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        <arnaud.pouliquen@foss.st.com>, Suman Anna <s-anna@ti.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>
Subject: [PATCH v10 2/2] tty: add rpmsg driver
Date:   Fri, 15 Oct 2021 11:47:01 +0200
Message-ID: <20211015094701.5732-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211015094701.5732-1-arnaud.pouliquen@foss.st.com>
References: <20211015094701.5732-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-15_03,2021-10-14_02,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This driver exposes a standard TTY interface on top of the rpmsg
framework through a rpmsg service.

This driver supports multi-instances, offering a /dev/ttyRPMSGx entry
per rpmsg endpoint.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

---
Update from V9
=> Update based on Mathieu Poirier comments:
 - replace dev print by it's ratelimited version.
 - add Reviewed-by: Mathieu Poirier
---
 drivers/tty/Kconfig     |  12 ++
 drivers/tty/Makefile    |   1 +
 drivers/tty/rpmsg_tty.c | 274 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 287 insertions(+)
 create mode 100644 drivers/tty/rpmsg_tty.c

diff --git a/drivers/tty/Kconfig b/drivers/tty/Kconfig
index 23cc988c68a4..cc30ff93e2e4 100644
--- a/drivers/tty/Kconfig
+++ b/drivers/tty/Kconfig
@@ -368,6 +368,18 @@ config VCC
 
 source "drivers/tty/hvc/Kconfig"
 
+config RPMSG_TTY
+	tristate "RPMSG tty driver"
+	depends on RPMSG
+	help
+	  Say y here to export rpmsg endpoints as tty devices, usually found
+	  in /dev/ttyRPMSGx.
+	  This makes it possible for user-space programs to send and receive
+	  rpmsg messages as a standard tty protocol.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called rpmsg_tty.
+
 endif # TTY
 
 source "drivers/tty/serdev/Kconfig"
diff --git a/drivers/tty/Makefile b/drivers/tty/Makefile
index a2bd75fbaaa4..07aca5184a55 100644
--- a/drivers/tty/Makefile
+++ b/drivers/tty/Makefile
@@ -26,5 +26,6 @@ obj-$(CONFIG_PPC_EPAPR_HV_BYTECHAN) += ehv_bytechan.o
 obj-$(CONFIG_GOLDFISH_TTY)	+= goldfish.o
 obj-$(CONFIG_MIPS_EJTAG_FDC_TTY) += mips_ejtag_fdc.o
 obj-$(CONFIG_VCC)		+= vcc.o
+obj-$(CONFIG_RPMSG_TTY)		+= rpmsg_tty.o
 
 obj-y += ipwireless/
diff --git a/drivers/tty/rpmsg_tty.c b/drivers/tty/rpmsg_tty.c
new file mode 100644
index 000000000000..813076341ffd
--- /dev/null
+++ b/drivers/tty/rpmsg_tty.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 STMicroelectronics - All Rights Reserved
+ *
+ * The rpmsg tty driver implements serial communication on the RPMsg bus to makes
+ * possible for user-space programs to send and receive rpmsg messages as a standard
+ * tty protocol.
+ *
+ * The remote processor can instantiate a new tty by requesting a "rpmsg-tty" RPMsg service.
+ * The "rpmsg-tty" service is directly used for data exchange. No flow control is implemented yet.
+ */
+
+#include <linux/module.h>
+#include <linux/rpmsg.h>
+#include <linux/slab.h>
+#include <linux/tty.h>
+#include <linux/tty_flip.h>
+
+#define MAX_TTY_RPMSG	32
+
+static DEFINE_IDR(tty_idr);	/* tty instance id */
+static DEFINE_MUTEX(idr_lock);	/* protects tty_idr */
+
+static struct tty_driver *rpmsg_tty_driver;
+
+struct rpmsg_tty_port {
+	struct tty_port		port;	 /* TTY port data */
+	int			id;	 /* TTY rpmsg index */
+	struct rpmsg_device	*rpdev;	 /* rpmsg device */
+};
+
+static int rpmsg_tty_cb(struct rpmsg_device *rpdev, void *data, int len, void *priv, u32 src)
+{
+	struct rpmsg_tty_port *cport = dev_get_drvdata(&rpdev->dev);
+	int copied;
+
+	if (!len)
+		return -EINVAL;
+	copied = tty_insert_flip_string(&cport->port, data, len);
+	if (copied != len)
+		dev_err_ratelimited(&rpdev->dev, "Trunc buffer: available space is %d\n", copied);
+	tty_flip_buffer_push(&cport->port);
+
+	return 0;
+}
+
+static int rpmsg_tty_install(struct tty_driver *driver, struct tty_struct *tty)
+{
+	struct rpmsg_tty_port *cport = idr_find(&tty_idr, tty->index);
+
+	tty->driver_data = cport;
+
+	return tty_port_install(&cport->port, driver, tty);
+}
+
+static int rpmsg_tty_open(struct tty_struct *tty, struct file *filp)
+{
+	return tty_port_open(tty->port, tty, filp);
+}
+
+static void rpmsg_tty_close(struct tty_struct *tty, struct file *filp)
+{
+	return tty_port_close(tty->port, tty, filp);
+}
+
+static int rpmsg_tty_write(struct tty_struct *tty, const u8 *buf, int len)
+{
+	struct rpmsg_tty_port *cport = tty->driver_data;
+	struct rpmsg_device *rpdev;
+	int msg_max_size, msg_size;
+	int ret;
+
+	rpdev = cport->rpdev;
+
+	msg_max_size = rpmsg_get_mtu(rpdev->ept);
+	if (msg_max_size < 0)
+		return msg_max_size;
+
+	msg_size = min(len, msg_max_size);
+
+	/*
+	 * Use rpmsg_trysend instead of rpmsg_send to send the message so the caller is not
+	 * hung until a rpmsg buffer is available. In such case rpmsg_trysend returns -ENOMEM.
+	 */
+	ret = rpmsg_trysend(rpdev->ept, (void *)buf, msg_size);
+	if (ret) {
+		dev_dbg_ratelimited(&rpdev->dev, "rpmsg_send failed: %d\n", ret);
+		return ret;
+	}
+
+	return msg_size;
+}
+
+static unsigned int rpmsg_tty_write_room(struct tty_struct *tty)
+{
+	struct rpmsg_tty_port *cport = tty->driver_data;
+	int size;
+
+	size = rpmsg_get_mtu(cport->rpdev->ept);
+	if (size < 0)
+		return 0;
+
+	return size;
+}
+
+static const struct tty_operations rpmsg_tty_ops = {
+	.install	= rpmsg_tty_install,
+	.open		= rpmsg_tty_open,
+	.close		= rpmsg_tty_close,
+	.write		= rpmsg_tty_write,
+	.write_room	= rpmsg_tty_write_room,
+};
+
+static struct rpmsg_tty_port *rpmsg_tty_alloc_cport(void)
+{
+	struct rpmsg_tty_port *cport;
+	int err;
+
+	cport = kzalloc(sizeof(*cport), GFP_KERNEL);
+	if (!cport)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_lock(&idr_lock);
+	cport->id = idr_alloc(&tty_idr, cport, 0, MAX_TTY_RPMSG, GFP_KERNEL);
+	mutex_unlock(&idr_lock);
+
+	if (cport->id < 0) {
+		err = cport->id;
+		kfree(cport);
+		return ERR_PTR(err);
+	}
+
+	return cport;
+}
+
+static void rpmsg_tty_release_cport(struct rpmsg_tty_port *cport)
+{
+	mutex_lock(&idr_lock);
+	idr_remove(&tty_idr, cport->id);
+	mutex_unlock(&idr_lock);
+
+	kfree(cport);
+}
+
+static const struct tty_port_operations rpmsg_tty_port_ops = { };
+
+static int rpmsg_tty_probe(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_tty_port *cport;
+	struct device *dev = &rpdev->dev;
+	struct device *tty_dev;
+	int ret;
+
+	cport = rpmsg_tty_alloc_cport();
+	if (IS_ERR(cport)) {
+		dev_err(dev, "Failed to alloc tty port\n");
+		return PTR_ERR(cport);
+	}
+
+	tty_port_init(&cport->port);
+	cport->port.ops = &rpmsg_tty_port_ops;
+
+	tty_dev = tty_port_register_device(&cport->port, rpmsg_tty_driver,
+					   cport->id, dev);
+	if (IS_ERR(tty_dev)) {
+		dev_err(dev, "Failed to register tty port\n");
+		ret = PTR_ERR(tty_dev);
+		goto  err_destroy;
+	}
+
+	cport->rpdev = rpdev;
+
+	dev_set_drvdata(dev, cport);
+
+	dev_dbg(dev, "New channel: 0x%x -> 0x%x : ttyRPMSG%d\n",
+		rpdev->src, rpdev->dst, cport->id);
+
+	return 0;
+
+err_destroy:
+	tty_port_destroy(&cport->port);
+	rpmsg_tty_release_cport(cport);
+
+	return ret;
+}
+
+static void rpmsg_tty_remove(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_tty_port *cport = dev_get_drvdata(&rpdev->dev);
+
+	dev_dbg(&rpdev->dev, "Removing rpmsg tty device %d\n", cport->id);
+
+	/* User hang up to release the tty */
+	if (tty_port_initialized(&cport->port))
+		tty_port_tty_hangup(&cport->port, false);
+
+	tty_unregister_device(rpmsg_tty_driver, cport->id);
+
+	tty_port_destroy(&cport->port);
+	rpmsg_tty_release_cport(cport);
+}
+
+static struct rpmsg_device_id rpmsg_driver_tty_id_table[] = {
+	{ .name	= "rpmsg-tty" },
+	{ },
+};
+MODULE_DEVICE_TABLE(rpmsg, rpmsg_driver_tty_id_table);
+
+static struct rpmsg_driver rpmsg_tty_rpmsg_drv = {
+	.drv.name	= KBUILD_MODNAME,
+	.id_table	= rpmsg_driver_tty_id_table,
+	.probe		= rpmsg_tty_probe,
+	.callback	= rpmsg_tty_cb,
+	.remove		= rpmsg_tty_remove,
+};
+
+static int __init rpmsg_tty_init(void)
+{
+	int err;
+
+	rpmsg_tty_driver = tty_alloc_driver(MAX_TTY_RPMSG, TTY_DRIVER_REAL_RAW |
+					    TTY_DRIVER_DYNAMIC_DEV);
+	if (IS_ERR(rpmsg_tty_driver))
+		return PTR_ERR(rpmsg_tty_driver);
+
+	rpmsg_tty_driver->driver_name = "rpmsg_tty";
+	rpmsg_tty_driver->name = "ttyRPMSG";
+	rpmsg_tty_driver->major = 0;
+	rpmsg_tty_driver->type = TTY_DRIVER_TYPE_CONSOLE;
+
+	/* Disable unused mode by default */
+	rpmsg_tty_driver->init_termios = tty_std_termios;
+	rpmsg_tty_driver->init_termios.c_lflag &= ~(ECHO | ICANON);
+	rpmsg_tty_driver->init_termios.c_oflag &= ~(OPOST | ONLCR);
+
+	tty_set_operations(rpmsg_tty_driver, &rpmsg_tty_ops);
+
+	err = tty_register_driver(rpmsg_tty_driver);
+	if (err < 0) {
+		pr_err("Couldn't install rpmsg tty driver: err %d\n", err);
+		goto error_put;
+	}
+
+	err = register_rpmsg_driver(&rpmsg_tty_rpmsg_drv);
+	if (err < 0) {
+		pr_err("Couldn't register rpmsg tty driver: err %d\n", err);
+		goto error_unregister;
+	}
+
+	return 0;
+
+error_unregister:
+	tty_unregister_driver(rpmsg_tty_driver);
+
+error_put:
+	tty_driver_kref_put(rpmsg_tty_driver);
+
+	return err;
+}
+
+static void __exit rpmsg_tty_exit(void)
+{
+	unregister_rpmsg_driver(&rpmsg_tty_rpmsg_drv);
+	tty_unregister_driver(rpmsg_tty_driver);
+	tty_driver_kref_put(rpmsg_tty_driver);
+	idr_destroy(&tty_idr);
+}
+
+module_init(rpmsg_tty_init);
+module_exit(rpmsg_tty_exit);
+
+MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>");
+MODULE_DESCRIPTION("remote processor messaging tty driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

