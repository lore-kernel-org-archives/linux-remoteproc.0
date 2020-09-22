Return-Path: <SRS0=ZH1X=C7=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97528C4727C
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 00:10:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5ED952073A
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 00:10:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TANCw2bP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728497AbgIVAKc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Sep 2020 20:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729109AbgIVAKM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Sep 2020 20:10:12 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01CF2C0613D4
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2020 17:10:11 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id y1so10444606pgk.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2020 17:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tvjkMh1nVcvWbD/SxWJBLAgB6Awyphn/fwoUPXd6MgY=;
        b=TANCw2bP46+lHUHJ6IVsyt9iFSDzV5OjXuPP4mUnrBXHB4ToylojulONLPALSix5Tq
         /6UdjexfSznv3xXI3eVaqH2uhd4bryCOFNWEo+7aeOqKYAEGwG4S0NJotxLLuH8iumSf
         +aIlLZxLCZ1J7AcKXBnHK5uwVP782pH0YwU8dcU4ZAL7naUQioOtolm8ZNkQUHjlSTih
         wpW34ciGxJH7o7wXu5dlTrzwPFazP1vkO7wo4/SHvSTotZKiHbbCwaa2YA3RPAGnWrlQ
         VqAK/phE8cvxH+9tepGLqPEdn5zH4NGm7bDa2e9Y3/5WCrjqYijRznm7PatajNI4yZia
         e8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tvjkMh1nVcvWbD/SxWJBLAgB6Awyphn/fwoUPXd6MgY=;
        b=R9kmaEmNe0Am0YNzswTRrkY+rDFEyuZNhvc/sZtusVjG8hi3lv5uzLqZ7oLqDfpcTk
         abGCK5AW72bpLGgEjjcK+58JMbnhP6JCn0dQGs7nPObdCkJacvjKpNNQXbBuFxsCcAs3
         hcg/a1CoC9JW07CtcXsA8zBmQA12Svqo5Uirj1sK8laI3yG82HWJs90l0/3uT5r5z0XZ
         gkCuASLdu43vBlpfCTTaeboqCSDfx+FG9FxzzHlSYjD649ZysxmDz7KyqUHMuKz2Ei66
         W06h8WS7UaEePzR8LZHmW5/jGmNOELWtSOT5WEPz+dW07PhfEFgyh+NX8Z3qHibXm7eM
         WiUw==
X-Gm-Message-State: AOAM5303/vppt/cTmWIIbt8zWTjCYh3ZqxI/8BfYoDSd8+Y35jmmySTO
        pJ9jpTrVgU8JoqbNbTaKLYVC2A==
X-Google-Smtp-Source: ABdhPJzpg0kLRIy6LCYG7ZS1FVExxH9YQYaq9/FWFF1DrAgrVp+Zho5vFy9B3UB9BvS1KgUszvBM7w==
X-Received: by 2002:a17:902:fe85:b029:d1:e598:3ff7 with SMTP id x5-20020a170902fe85b02900d1e5983ff7mr2074081plm.49.1600733410518;
        Mon, 21 Sep 2020 17:10:10 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c9sm12807953pfn.78.2020.09.21.17.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 17:10:10 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        guennadi.liakhovetski@linux.intel.com
Cc:     loic.pallardy@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] rpmsg: virtio: use rpmsg ns device for the ns announcement
Date:   Mon, 21 Sep 2020 18:09:57 -0600
Message-Id: <20200922001000.899956-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200922001000.899956-1-mathieu.poirier@linaro.org>
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Arnaud Pouliquen <arnaud.pouliquen@st.com>

As generic NS driver is available, rely on it for NS management instead of
managing it in RPMsg virtio bus.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/Kconfig            |  1 +
 drivers/rpmsg/rpmsg_internal.h   |  2 -
 drivers/rpmsg/virtio_rpmsg_bus.c | 84 ++++++++------------------------
 3 files changed, 21 insertions(+), 66 deletions(-)

diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index c3fc75e6514b..1394114782d2 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -71,5 +71,6 @@ config RPMSG_VIRTIO
 	depends on HAS_DMA
 	select RPMSG
 	select VIRTIO
+	select RPMSG_NS
 
 endmenu
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index 04e6cb287e18..2e65386f191e 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -42,7 +42,6 @@
  * @endpoints_lock: lock of the endpoints set
  * @sendq:	wait queue of sending contexts waiting for a tx buffers
  * @sleepers:	number of senders that are waiting for a tx buffer
- * @ns_ept:	the bus's name service endpoint
  *
  * This structure stores the rpmsg state of a given virtio remote processor
  * device (there might be several virtio proc devices for each physical
@@ -61,7 +60,6 @@ struct virtproc_info {
 	struct mutex endpoints_lock;
 	wait_queue_head_t sendq;
 	atomic_t sleepers;
-	struct rpmsg_endpoint *ns_ept;
 };
 
 /**
diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 0635d86d490f..1c0be0ee790c 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -715,68 +715,14 @@ static void rpmsg_xmit_done(struct virtqueue *svq)
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
-	chinfo.dst = virtio32_to_cpu(vrp->vdev, msg->addr);
-
-	dev_info(dev, "%sing channel %s addr 0x%x\n",
-		 virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY ?
-		 "destroy" : "creat", msg->name, chinfo.dst);
-
-	if (virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY) {
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
@@ -852,14 +798,27 @@ static int rpmsg_probe(struct virtio_device *vdev)
 
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
+
+		rpdev_ns->dev.parent = &vrp->vdev->dev;
+		rpdev_ns->dev.release = virtio_rpmsg_release_device;
+
+		err = rpmsg_ns_register_device(rpdev_ns);
+		if (err) {
+			kfree(vch);
+			goto free_coherent;
+		}
 	}
 
 	/*
@@ -912,9 +871,6 @@ static void rpmsg_remove(struct virtio_device *vdev)
 	if (ret)
 		dev_warn(&vdev->dev, "can't remove rpmsg device: %d\n", ret);
 
-	if (vrp->ns_ept)
-		__rpmsg_destroy_ept(vrp, vrp->ns_ept);
-
 	idr_destroy(&vrp->endpoints);
 
 	vdev->config->del_vqs(vrp->vdev);
-- 
2.25.1

