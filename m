Return-Path: <SRS0=uUKq=D2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B00C433DF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 20:35:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C47F7223EA
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 20:35:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tnZ/stZ5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731744AbgJSUfX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 19 Oct 2020 16:35:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731735AbgJSUep (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Oct 2020 16:34:45 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 950EBC0613D1
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2020 13:34:43 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id v12so389540ply.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2020 13:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DRyC4BkRIjVW2RAG/n3mUIB9LduXxDrVKGCqI5z3OuY=;
        b=tnZ/stZ58cth4vmStEO2fybOnAYcAk7K+4lkMWWIGUN9hEcwYY61Tvg6JyHy8sQEsn
         dJkKlAk7IlC/0fL5RBZIHt8KT6tWTXSCoMNiMgv1YIO/yd8wuFXKow5J1/01ei8nUPIz
         U9MA12f/1JvTvQU0ws44lJPg3XbztnwJJKlfSicnMf+Qke7Zx6V198snU+gsMsIZa2Wh
         dytEFdlGEOkF3eZbF8yiX6djm8qX22Ke9t7dwwkIs+y4+5cOZbEgXXxNV5qXL5a/tD4D
         yDc5E14pT47XR3g14DGYWHwZ4OMnu+vux4HvGOfMGZQMW5Wp5tnjnk+W41p8SesgUiBP
         aLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DRyC4BkRIjVW2RAG/n3mUIB9LduXxDrVKGCqI5z3OuY=;
        b=VVaTVMLBIFdWblnDiwg0L4C7YesP06E+l715zjJ67gmn9bIZRQ6FaUMW/zeRjWENud
         /dMUS8DlSEivNDBxmGeYDnDsw3zfD7X9drdpuGbtHnTd9mlqjYO4OI6RlRQrmLrcX/SQ
         csxarqcRAUagCtSBAz5PHebA9N3BxGjXqJzrPqCJI1EMDbsMcNh3pXFP/ZpZLlDzkMPv
         UsmDS5h/idp6JjrDJ0jkhfjfwaQNzFgq9DHmt2hHLKLNgWsZxd66HBTnEG7tmG7LHMj8
         etVCBkgDPKSvmg7ifcdDzUNWSAHjwQLDXxxTmBGxsEzc1X28pcnp2XFSB5zpXNnc+95N
         36Tg==
X-Gm-Message-State: AOAM532eFVJpv3QnBylzFlAmhPWiaDCYcJkKzQsfC5nIND5XQAT05DX8
        S14jYR+G9DRWOhaG9KuIKKQWVg==
X-Google-Smtp-Source: ABdhPJwok/aGfHzHBAPwKsm+ViMsEKGffXxzEprZMCbHZFStBhY0AlPftaPoFLU1Wkyf6v7IYv4sDA==
X-Received: by 2002:a17:90b:a8e:: with SMTP id bn14mr1227827pjb.164.1603139683141;
        Mon, 19 Oct 2020 13:34:43 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id q123sm631847pfq.56.2020.10.19.13.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:34:42 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/8] rpmsg: virtio: Move from virtio to rpmsg byte conversion
Date:   Mon, 19 Oct 2020 14:34:32 -0600
Message-Id: <20201019203438.501174-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201019203438.501174-1-mathieu.poirier@linaro.org>
References: <20201019203438.501174-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use rpmsg byte conversion functions in order for the RPMSG
headers and generic functions to be used by external entities.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 53 +++++++++++++++++---------------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 9006fc7f73d0..8927bcad56fd 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -19,11 +19,11 @@
 #include <linux/mutex.h>
 #include <linux/of_device.h>
 #include <linux/rpmsg.h>
+#include <linux/rpmsg_byteorder.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/virtio.h>
-#include <linux/virtio_byteorder.h>
 #include <linux/virtio_ids.h>
 #include <linux/virtio_config.h>
 #include <linux/wait.h>
@@ -85,11 +85,11 @@ struct virtproc_info {
  * Every message sent(/received) on the rpmsg bus begins with this header.
  */
 struct rpmsg_hdr {
-	__virtio32 src;
-	__virtio32 dst;
-	__virtio32 reserved;
-	__virtio16 len;
-	__virtio16 flags;
+	__rpmsg32 src;
+	__rpmsg32 dst;
+	__rpmsg32 reserved;
+	__rpmsg16 len;
+	__rpmsg16 flags;
 	u8 data[];
 } __packed;
 
@@ -107,8 +107,8 @@ struct rpmsg_hdr {
  */
 struct rpmsg_ns_msg {
 	char name[RPMSG_NAME_SIZE];
-	__virtio32 addr;
-	__virtio32 flags;
+	__rpmsg32 addr;
+	__rpmsg32 flags;
 } __packed;
 
 /**
@@ -336,8 +336,8 @@ static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
 		struct rpmsg_ns_msg nsm;
 
 		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
-		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
-		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_CREATE);
+		nsm.addr = cpu_to_rpmsg32(rpdev, rpdev->ept->addr);
+		nsm.flags = cpu_to_rpmsg32(rpdev, RPMSG_NS_CREATE);
 
 		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
 		if (err)
@@ -360,8 +360,8 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
 		struct rpmsg_ns_msg nsm;
 
 		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
-		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
-		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_DESTROY);
+		nsm.addr = cpu_to_rpmsg32(rpdev, rpdev->ept->addr);
+		nsm.flags = cpu_to_rpmsg32(rpdev, RPMSG_NS_DESTROY);
 
 		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
 		if (err)
@@ -420,6 +420,7 @@ static struct rpmsg_device *rpmsg_create_channel(struct virtproc_info *vrp,
 	rpdev->src = chinfo->src;
 	rpdev->dst = chinfo->dst;
 	rpdev->ops = &virtio_rpmsg_ops;
+	rpdev->little_endian = virtio_is_little_endian(vrp->vdev);
 
 	/*
 	 * rpmsg server channels has predefined local address (for now),
@@ -613,10 +614,10 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 		}
 	}
 
-	msg->len = cpu_to_virtio16(vrp->vdev, len);
+	msg->len = cpu_to_rpmsg16(rpdev, len);
 	msg->flags = 0;
-	msg->src = cpu_to_virtio32(vrp->vdev, src);
-	msg->dst = cpu_to_virtio32(vrp->vdev, dst);
+	msg->src = cpu_to_rpmsg32(rpdev, src);
+	msg->dst = cpu_to_rpmsg32(rpdev, dst);
 	msg->reserved = 0;
 	memcpy(msg->data, data, len);
 
@@ -705,14 +706,15 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 {
 	struct rpmsg_endpoint *ept;
 	struct scatterlist sg;
-	unsigned int msg_len = virtio16_to_cpu(vrp->vdev, msg->len);
+	bool little_endian = virtio_is_little_endian(vrp->vdev);
+	unsigned int msg_len = __rpmsg16_to_cpu(little_endian, msg->len);
 	int err;
 
 	dev_dbg(dev, "From: 0x%x, To: 0x%x, Len: %d, Flags: %d, Reserved: %d\n",
-		virtio32_to_cpu(vrp->vdev, msg->src),
-		virtio32_to_cpu(vrp->vdev, msg->dst), msg_len,
-		virtio16_to_cpu(vrp->vdev, msg->flags),
-		virtio32_to_cpu(vrp->vdev, msg->reserved));
+		__rpmsg32_to_cpu(little_endian, msg->src),
+		__rpmsg32_to_cpu(little_endian, msg->dst), msg_len,
+		__rpmsg16_to_cpu(little_endian, msg->flags),
+		__rpmsg32_to_cpu(little_endian, msg->reserved));
 #if defined(CONFIG_DYNAMIC_DEBUG)
 	dynamic_hex_dump("rpmsg_virtio RX: ", DUMP_PREFIX_NONE, 16, 1,
 			 msg, sizeof(*msg) + msg_len, true);
@@ -731,7 +733,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 	/* use the dst addr to fetch the callback of the appropriate user */
 	mutex_lock(&vrp->endpoints_lock);
 
-	ept = idr_find(&vrp->endpoints, virtio32_to_cpu(vrp->vdev, msg->dst));
+	ept = idr_find(&vrp->endpoints, __rpmsg32_to_cpu(little_endian, msg->dst));
 
 	/* let's make sure no one deallocates ept while we use it */
 	if (ept)
@@ -745,7 +747,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 
 		if (ept->cb)
 			ept->cb(ept->rpdev, msg->data, msg_len, ept->priv,
-				virtio32_to_cpu(vrp->vdev, msg->src));
+				__rpmsg32_to_cpu(little_endian, msg->src));
 
 		mutex_unlock(&ept->cb_lock);
 
@@ -825,6 +827,7 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
 	struct rpmsg_channel_info chinfo;
 	struct virtproc_info *vrp = priv;
 	struct device *dev = &vrp->vdev->dev;
+	bool little_endian = virtio_is_little_endian(vrp->vdev);
 	int ret;
 
 #if defined(CONFIG_DYNAMIC_DEBUG)
@@ -853,13 +856,13 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
 
 	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
 	chinfo.src = RPMSG_ADDR_ANY;
-	chinfo.dst = virtio32_to_cpu(vrp->vdev, msg->addr);
+	chinfo.dst = __rpmsg32_to_cpu(little_endian, msg->addr);
 
 	dev_info(dev, "%sing channel %s addr 0x%x\n",
-		 virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY ?
+		 __rpmsg32_to_cpu(little_endian, msg->flags) & RPMSG_NS_DESTROY ?
 		 "destroy" : "creat", msg->name, chinfo.dst);
 
-	if (virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY) {
+	if (__rpmsg32_to_cpu(little_endian, msg->flags) & RPMSG_NS_DESTROY) {
 		ret = rpmsg_unregister_device(&vrp->vdev->dev, &chinfo);
 		if (ret)
 			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
-- 
2.25.1

