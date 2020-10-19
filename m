Return-Path: <SRS0=uUKq=D2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B206BC43467
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 20:35:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 538F9223FB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 20:35:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bQK7ILBd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731726AbgJSUfN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 19 Oct 2020 16:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731740AbgJSUew (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Oct 2020 16:34:52 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE664C0613CE
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2020 13:34:50 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id v12so389730ply.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2020 13:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9LSb4MsWmnhqv7P8LvZUfJsJgEOQfxCKy2CzVLdM3ZQ=;
        b=bQK7ILBdCQYW8HvGsyAb4czAgM5fOvsQ1MNY1rimW3UtgnAW4oUuTdsIXButboPGGP
         130T8DXNdQfkZ8LEaWRm2Trw+CeScpB6hzIsF91vDAy4OFd7nvebg6XeX+st6GqsAlh9
         Cq8y9n+PDl6NJJzPiPLb+2IAzAV/7Tk7HCEU0Z6kjsEQ0Z+wt7xxbgiBqw4rXWudDAwt
         dE84n/9/s3ab/G5B9Cnox+KAIsk4OpaJCqbbziQk6IDPDLdTKTJn9XRS1rXQYWys67Hn
         3751wzAyVzH0OcLo2pc4jRhiV+PzIm+BTKBL/bXqsdgGpn1wPF0jnS9g6BO82iXgUp+F
         Wtdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9LSb4MsWmnhqv7P8LvZUfJsJgEOQfxCKy2CzVLdM3ZQ=;
        b=O9g+03nuT0lBE7TOCfjr9DPzGUFswceb18H5Pxrt7Xqd3Vo+LA8bMWIwhOd09lO+pu
         dEksPAUTtsnoUDY/kQkTjEiRkfrAX9kgWivmbDOPTJVVXv47D6yAJUuWYhQhsh11CsZY
         pe0675qFXWD91EKKH8BN74OVvwIKIwAEN3fNI+tNOqmXinSt/q8A0H4R9cl5VffIIFC3
         Siaru8lU6PGGSGHeFUGKp9IE8MIWNgNx0t1KmSzpqUg+hl8jJoC4CQUmWHy12cSYmTiR
         t0bT2Nz6UlCiSnDKbW/McPOUJahoCDTigqnZIuf5c1yj/bqa+NSR2fAZhPWbzk/axDl5
         CYHQ==
X-Gm-Message-State: AOAM531IVRVflBdWMmqUfHCktYYrunCL/11taVyBMJv6uMN0Bxg+At/b
        vIBy0P7B+1baD8AkwgF81P3NtQ==
X-Google-Smtp-Source: ABdhPJydhgu/wnfIiSagBci6RRrvNzXr8Du0s5+kc6cy4ODlxhu4buiDEt8Y0eoS4ijdCZL53v2Q+Q==
X-Received: by 2002:a17:90b:193:: with SMTP id t19mr1229670pjs.54.1603139690145;
        Mon, 19 Oct 2020 13:34:50 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id q123sm631847pfq.56.2020.10.19.13.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:34:49 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/8] rpmsg: Turn name service into a stand alone driver
Date:   Mon, 19 Oct 2020 14:34:38 -0600
Message-Id: <20201019203438.501174-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201019203438.501174-1-mathieu.poirier@linaro.org>
References: <20201019203438.501174-1-mathieu.poirier@linaro.org>
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
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/Kconfig            |   8 +++
 drivers/rpmsg/Makefile           |   1 +
 drivers/rpmsg/rpmsg_ns.c         | 108 +++++++++++++++++++++++++++++++
 drivers/rpmsg/virtio_rpmsg_bus.c |  86 ++++++------------------
 include/linux/rpmsg_ns.h         |  17 +++++
 5 files changed, 153 insertions(+), 67 deletions(-)
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
index 000000000000..8e26824ca328
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
+#include <linux/rpmsg_ns.h>
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
index e14390a81265..97ad471a3cae 100644
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
@@ -810,69 +808,14 @@ static void rpmsg_xmit_done(struct virtqueue *svq)
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
@@ -948,14 +891,26 @@ static int rpmsg_probe(struct virtio_device *vdev)
 
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
@@ -1008,9 +963,6 @@ static void rpmsg_remove(struct virtio_device *vdev)
 	if (ret)
 		dev_warn(&vdev->dev, "can't remove rpmsg device: %d\n", ret);
 
-	if (vrp->ns_ept)
-		__rpmsg_destroy_ept(vrp, vrp->ns_ept);
-
 	idr_destroy(&vrp->endpoints);
 
 	vdev->config->del_vqs(vrp->vdev);
diff --git a/include/linux/rpmsg_ns.h b/include/linux/rpmsg_ns.h
index bb479f430080..42786bb759b5 100644
--- a/include/linux/rpmsg_ns.h
+++ b/include/linux/rpmsg_ns.h
@@ -39,4 +39,21 @@ enum rpmsg_ns_flags {
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
+       strcpy(rpdev->id.name, "rpmsg_ns");
+       rpdev->driver_override = "rpmsg_ns";
+       rpdev->src = RPMSG_NS_ADDR;
+       rpdev->dst = RPMSG_NS_ADDR;
+
+       return rpmsg_register_device(rpdev);
+}
+
 #endif
-- 
2.25.1

