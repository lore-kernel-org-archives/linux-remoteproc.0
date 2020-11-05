Return-Path: <SRS0=+gsc=EL=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E02ABC388F7
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Nov 2020 22:50:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 751822083B
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Nov 2020 22:50:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hxmB1G0X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732533AbgKEWul (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Nov 2020 17:50:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732518AbgKEWuk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Nov 2020 17:50:40 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62541C0613D4
        for <linux-remoteproc@vger.kernel.org>; Thu,  5 Nov 2020 14:50:40 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id y7so1465421pfq.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Nov 2020 14:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=axE/CQEQXzlFPcsXjFn+hjLuJgBjjkdY7LhnvC+80e8=;
        b=hxmB1G0XtSGdipb2gYqxHw7Y6CMWV9BdavOaUKcyb5cD8+4qT9j1qxlSzIno0Ka2Og
         OzvDjeJ5DfJ+tfcR/78J2qny0lzQB3/lvBUxLRoUts29N7oWJpLUkHqSwwmkhympdtUQ
         nFwPEDxK8yDbw0As2aVstGK6dBoFIpFLuZY43thyi/7724JSc0+TLqm9Gn2ES0+I6mQC
         /1nMWHeLaiEX7MjtZkRbdRQf3ndxD6g4iwpy7CPZuXiAvmUwRnEALk5FxjMc/1HDbc2i
         linL6v7SgNzNFI44lG+edEMa5bFBdpVZ/7Say/OcB3BsKu6cceuZIRpNBYcfQ5x0mPqD
         wZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=axE/CQEQXzlFPcsXjFn+hjLuJgBjjkdY7LhnvC+80e8=;
        b=AJY6m2h/aFukldqSCcYMR6XrCBogy1Bzlz/99MJVwym44RdrWLX3Z1QwvM5AHmU+ao
         qb6DbAJxdCVpRUNl5qxFIq9YEh05Jwabe300SKg7CPjJImzm/sDTwXmUBVawFDBy40d3
         uChQwu2Vw/Geue42P+bD8g/D8GScHHxbM9ydHqHS4JZJUJenkMWNqf4vJeyI95TYM0Bg
         HBZoC/VySFCHMcc2Y79sqE5F0Hxy1+nA9UnH7ZJvJlSzQmpzufX68BlCfOJH1tmAzUz8
         Zax2DF8af3399I0Xui20s2+pz7JVRDAZU2oT2sa8ZdEnXBlsSuZLPaHDnBeOBKQHjIS/
         VVGg==
X-Gm-Message-State: AOAM531JRqP4OsE5eqhzr97K3cG1rX5FoWhdZ5jBoeUUItqd1fdAPXw0
        Nmem7SXMmTT3PZIOeac15LvG4Q==
X-Google-Smtp-Source: ABdhPJyPgdXKUO0LerMvV9eZdWAzkLQEbbaYyXUIAJxDFqrVLB+dUOMjNtPGOZYKQHlSjO2kZrOqCg==
X-Received: by 2002:a17:90a:b393:: with SMTP id e19mr4608498pjr.40.1604616639816;
        Thu, 05 Nov 2020 14:50:39 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id d145sm3854501pfd.136.2020.11.05.14.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 14:50:38 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 8/8] rpmsg: Turn name service into a stand alone driver
Date:   Thu,  5 Nov 2020 15:50:28 -0700
Message-Id: <20201105225028.3058818-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105225028.3058818-1-mathieu.poirier@linaro.org>
References: <20201105225028.3058818-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Make the RPMSG name service announcement a stand alone driver so that it
can be reused by other subsystems.  It is also the first step in making the
functionatlity transport independent, i.e that is not tied to virtIO.

Co-developed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/Kconfig            |   8 +++
 drivers/rpmsg/Makefile           |   1 +
 drivers/rpmsg/rpmsg_ns.c         | 108 +++++++++++++++++++++++++++++++
 drivers/rpmsg/virtio_rpmsg_bus.c |  86 ++++++------------------
 include/linux/rpmsg/ns.h         |  18 ++++++
 5 files changed, 154 insertions(+), 67 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_ns.c

diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index f96716893c2a..c3fc75e6514b 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -15,6 +15,14 @@ config RPMSG_CHAR
 	  in /dev. They make it possible for user-space programs to send and
 	  receive rpmsg packets.
 
+config RPMSG_NS
+	tristate "RPMSG name service announcement"
+	depends on RPMSG
+	help
+	  Say Y here to enable the support of the name service announcement
+	  channel that probes the associated RPMsg device on remote endpoint
+	  service announcement.
+
 config RPMSG_MTK_SCP
 	tristate "MediaTek SCP"
 	depends on MTK_SCP
diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
index ffe932ef6050..8d452656f0ee 100644
--- a/drivers/rpmsg/Makefile
+++ b/drivers/rpmsg/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
 obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
+obj-$(CONFIG_RPMSG_NS)		+= rpmsg_ns.o
 obj-$(CONFIG_RPMSG_MTK_SCP)	+= mtk_rpmsg.o
 qcom_glink-objs			:= qcom_glink_native.o qcom_glink_ssr.o
 obj-$(CONFIG_RPMSG_QCOM_GLINK) += qcom_glink.o
diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
new file mode 100644
index 000000000000..5bda7cb44618
--- /dev/null
+++ b/drivers/rpmsg/rpmsg_ns.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
+ */
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/rpmsg.h>
+#include <linux/rpmsg/ns.h>
+
+#include "rpmsg_internal.h"
+
+/* invoked when a name service announcement arrives */
+static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
+		       void *priv, u32 src)
+{
+	struct rpmsg_ns_msg *msg = data;
+	struct rpmsg_device *newch;
+	struct rpmsg_channel_info chinfo;
+	struct device *dev = rpdev->dev.parent;
+	int ret;
+
+#if defined(CONFIG_DYNAMIC_DEBUG)
+	dynamic_hex_dump("NS announcement: ", DUMP_PREFIX_NONE, 16, 1,
+			 data, len, true);
+#endif
+
+	if (len != sizeof(*msg)) {
+		dev_err(dev, "malformed ns msg (%d)\n", len);
+		return -EINVAL;
+	}
+
+	/* don't trust the remote processor for null terminating the name */
+	msg->name[RPMSG_NAME_SIZE - 1] = '\0';
+
+	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
+	chinfo.src = RPMSG_ADDR_ANY;
+	chinfo.dst = rpmsg32_to_cpu(rpdev, msg->addr);
+
+	dev_info(dev, "%sing channel %s addr 0x%x\n",
+		 rpmsg32_to_cpu(rpdev, msg->flags) & RPMSG_NS_DESTROY ?
+		 "destroy" : "creat", msg->name, chinfo.dst);
+
+	if (rpmsg32_to_cpu(rpdev, msg->flags) & RPMSG_NS_DESTROY) {
+		ret = rpmsg_release_channel(rpdev, &chinfo);
+		if (ret)
+			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
+	} else {
+		newch = rpmsg_create_channel(rpdev, &chinfo);
+		if (!newch)
+			dev_err(dev, "rpmsg_create_channel failed\n");
+	}
+
+	return 0;
+}
+
+static int rpmsg_ns_probe(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_endpoint *ns_ept;
+	struct rpmsg_channel_info ns_chinfo = {
+		.src = RPMSG_NS_ADDR,
+		.dst = RPMSG_NS_ADDR,
+		.name = "name_service",
+	};
+
+	/*
+	 * Create the NS announcement service endpoint associated to the RPMsg
+	 * device. The endpoint will be automatically destroyed when the RPMsg
+	 * device will be deleted.
+	 */
+	ns_ept = rpmsg_create_ept(rpdev, rpmsg_ns_cb, NULL, ns_chinfo);
+	if (!ns_ept) {
+		dev_err(&rpdev->dev, "failed to create the ns ept\n");
+		return -ENOMEM;
+	}
+	rpdev->ept = ns_ept;
+
+	return 0;
+}
+
+static struct rpmsg_driver rpmsg_ns_driver = {
+	.drv.name = "rpmsg_ns",
+	.probe = rpmsg_ns_probe,
+};
+
+static int rpmsg_ns_init(void)
+{
+	int ret;
+
+	ret = register_rpmsg_driver(&rpmsg_ns_driver);
+	if (ret < 0)
+		pr_err("%s: Failed to register rpmsg driver\n", __func__);
+
+	return ret;
+}
+postcore_initcall(rpmsg_ns_init);
+
+static void rpmsg_ns_exit(void)
+{
+	unregister_rpmsg_driver(&rpmsg_ns_driver);
+}
+module_exit(rpmsg_ns_exit);
+
+MODULE_DESCRIPTION("Name service announcement rpmsg Driver");
+MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
+MODULE_ALIAS("rpmsg_ns");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 6ec299f7f790..338f16c6563d 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -49,7 +49,6 @@
  * @endpoints_lock: lock of the endpoints set
  * @sendq:	wait queue of sending contexts waiting for a tx buffers
  * @sleepers:	number of senders that are waiting for a tx buffer
- * @ns_ept:	the bus's name service endpoint
  *
  * This structure stores the rpmsg state of a given virtio remote processor
  * device (there might be several virtio proc devices for each physical
@@ -68,7 +67,6 @@ struct virtproc_info {
 	struct mutex endpoints_lock;
 	wait_queue_head_t sendq;
 	atomic_t sleepers;
-	struct rpmsg_endpoint *ns_ept;
 };
 
 /* The feature bitmap for virtio rpmsg */
@@ -815,69 +813,14 @@ static void rpmsg_xmit_done(struct virtqueue *svq)
 	wake_up_interruptible(&vrp->sendq);
 }
 
-/* invoked when a name service announcement arrives */
-static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
-		       void *priv, u32 src)
-{
-	struct rpmsg_ns_msg *msg = data;
-	struct rpmsg_device *newch;
-	struct rpmsg_channel_info chinfo;
-	struct virtproc_info *vrp = priv;
-	struct device *dev = &vrp->vdev->dev;
-	bool little_endian = virtio_is_little_endian(vrp->vdev);
-	int ret;
-
-#if defined(CONFIG_DYNAMIC_DEBUG)
-	dynamic_hex_dump("NS announcement: ", DUMP_PREFIX_NONE, 16, 1,
-			 data, len, true);
-#endif
-
-	if (len != sizeof(*msg)) {
-		dev_err(dev, "malformed ns msg (%d)\n", len);
-		return -EINVAL;
-	}
-
-	/*
-	 * the name service ept does _not_ belong to a real rpmsg channel,
-	 * and is handled by the rpmsg bus itself.
-	 * for sanity reasons, make sure a valid rpdev has _not_ sneaked
-	 * in somehow.
-	 */
-	if (rpdev) {
-		dev_err(dev, "anomaly: ns ept has an rpdev handle\n");
-		return -EINVAL;
-	}
-
-	/* don't trust the remote processor for null terminating the name */
-	msg->name[RPMSG_NAME_SIZE - 1] = '\0';
-
-	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
-	chinfo.src = RPMSG_ADDR_ANY;
-	chinfo.dst = __rpmsg32_to_cpu(little_endian, msg->addr);
-
-	dev_info(dev, "%sing channel %s addr 0x%x\n",
-		 __rpmsg32_to_cpu(little_endian, msg->flags) & RPMSG_NS_DESTROY ?
-		 "destroy" : "creat", msg->name, chinfo.dst);
-
-	if (__rpmsg32_to_cpu(little_endian, msg->flags) & RPMSG_NS_DESTROY) {
-		ret = rpmsg_unregister_device(&vrp->vdev->dev, &chinfo);
-		if (ret)
-			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
-	} else {
-		newch = __rpmsg_create_channel(vrp, &chinfo);
-		if (!newch)
-			dev_err(dev, "rpmsg_create_channel failed\n");
-	}
-
-	return 0;
-}
-
 static int rpmsg_probe(struct virtio_device *vdev)
 {
 	vq_callback_t *vq_cbs[] = { rpmsg_recv_done, rpmsg_xmit_done };
 	static const char * const names[] = { "input", "output" };
 	struct virtqueue *vqs[2];
 	struct virtproc_info *vrp;
+	struct virtio_rpmsg_channel *vch;
+	struct rpmsg_device *rpdev_ns;
 	void *bufs_va;
 	int err = 0, i;
 	size_t total_buf_space;
@@ -953,14 +896,26 @@ static int rpmsg_probe(struct virtio_device *vdev)
 
 	/* if supported by the remote processor, enable the name service */
 	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_NS)) {
-		/* a dedicated endpoint handles the name service msgs */
-		vrp->ns_ept = __rpmsg_create_ept(vrp, NULL, rpmsg_ns_cb,
-						vrp, RPMSG_NS_ADDR);
-		if (!vrp->ns_ept) {
-			dev_err(&vdev->dev, "failed to create the ns ept\n");
+		vch = kzalloc(sizeof(*vch), GFP_KERNEL);
+		if (!vch) {
 			err = -ENOMEM;
 			goto free_coherent;
 		}
+
+		/* Link the channel to our vrp */
+		vch->vrp = vrp;
+
+		/* Assign public information to the rpmsg_device */
+		rpdev_ns = &vch->rpdev;
+		rpdev_ns->ops = &virtio_rpmsg_ops;
+		rpdev_ns->little_endian = virtio_is_little_endian(vrp->vdev);
+
+		rpdev_ns->dev.parent = &vrp->vdev->dev;
+		rpdev_ns->dev.release = virtio_rpmsg_release_device;
+
+		err = rpmsg_ns_register_device(rpdev_ns);
+		if (err)
+			goto free_coherent;
 	}
 
 	/*
@@ -1013,9 +968,6 @@ static void rpmsg_remove(struct virtio_device *vdev)
 	if (ret)
 		dev_warn(&vdev->dev, "can't remove rpmsg device: %d\n", ret);
 
-	if (vrp->ns_ept)
-		__rpmsg_destroy_ept(vrp, vrp->ns_ept);
-
 	idr_destroy(&vrp->endpoints);
 
 	vdev->config->del_vqs(vrp->vdev);
diff --git a/include/linux/rpmsg/ns.h b/include/linux/rpmsg/ns.h
index 73ecc91dc26f..e267dd5f909b 100644
--- a/include/linux/rpmsg/ns.h
+++ b/include/linux/rpmsg/ns.h
@@ -4,6 +4,7 @@
 #define _LINUX_RPMSG_NS_H
 
 #include <linux/mod_devicetable.h>
+#include <linux/rpmsg.h>
 #include <linux/rpmsg/byteorder.h>
 #include <linux/types.h>
 
@@ -39,4 +40,21 @@ enum rpmsg_ns_flags {
 /* Address 53 is reserved for advertising remote services */
 #define RPMSG_NS_ADDR			(53)
 
+/**
+ * rpmsg_ns_register_device() - register name service device based on rpdev
+ * @rpdev: prepared rpdev to be used for creating endpoints
+ *
+ * This function wraps rpmsg_register_device() preparing the rpdev for use as
+ * basis for the rpmsg name service device.
+ */
+static inline int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
+{
+	strcpy(rpdev->id.name, "rpmsg_ns");
+	rpdev->driver_override = "rpmsg_ns";
+	rpdev->src = RPMSG_NS_ADDR;
+	rpdev->dst = RPMSG_NS_ADDR;
+
+	return rpmsg_register_device(rpdev);
+}
+
 #endif
-- 
2.25.1

