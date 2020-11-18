Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E11DC6379D
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 21:37:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 198E6246C0
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 21:37:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vmAj+dxg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbgKRVhG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Nov 2020 16:37:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727136AbgKRVhF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Nov 2020 16:37:05 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4659C061A48
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2020 13:37:04 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id q5so2387419pfk.6
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2020 13:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FveG7gwXoxnfUqfAm1M6z1jk2IKd8VxnJz1cUoAZjBk=;
        b=vmAj+dxgLtPefqa6k3LzHLJ4WQV50D9CIMqRnQgzpAeuIoqum7B9HJcdwQPNb/i0+L
         L/uDU9kiNtjejNOZpRNidi2/Hg+7EdgAiaGVFSWaMIpHgm22EsIFd2yKZGic2+QCVEAy
         /2RaAo+ioaYP/MKmCcgpdql6neWDtNXEHpY3OgS9fPanhobsDbdPgixG1xfCQMB/fmOY
         Q9IcRxK1B/aGRPe5GTgCfLR+18c8PAQr26Xe+KxVedu29akJs0K/4cFs4FtoebHWdbdf
         zlV1P7tgZS9HGg0yR8/2wLQfTNojP3UiQKSdf1rohRTCiRggyC+Au9Ep3SivaP6uQ+JC
         fBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FveG7gwXoxnfUqfAm1M6z1jk2IKd8VxnJz1cUoAZjBk=;
        b=crsfHHTmmVs+Bmd4cScMGw3PEoL1rKj3fe7viYZs9HtfGx1RjNxcS716Bl8/5XYV3e
         g+3E6S/f2lRbNs6lYMJiigltlsRBltFDobILpSe88ui7zPeWhucOAriFH2kv3Y1RntsW
         N/HqyLk7drSPnnBscvxtoUCncgbnAPSmShDl1QFDyRN55pfnfIDB+1HowIPLZSLSlxXb
         wpXR2uMLJGR/OCNVZpGhxqs89BrEnjUxaP52IQQJs3yqPh+Om8V1LZ4rpckrKBRyLpjM
         ZotIQIJRrGVzRVe2gZvSj709BxQ5RMuOxFUM86Q1rK5qnKjT0fki16NIXel2ZbU10Xae
         +inA==
X-Gm-Message-State: AOAM533vyhohKqliIWrTGr93R4BceItS9yp55/r9olyoJUJz4RdrUK+c
        C5m1wELtyja9mWIsBggPOGoQfg==
X-Google-Smtp-Source: ABdhPJwto/HcVjb9O2fQsVqzkSct7vA2/9P0limkn7UnYkH/2z9d2xSRJtE3MpMy43IQToUKhygpIw==
X-Received: by 2002:a63:e24:: with SMTP id d36mr9878602pgl.373.1605735424421;
        Wed, 18 Nov 2020 13:37:04 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e6sm26575694pfn.190.2020.11.18.13.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 13:37:03 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/8] rpmsg: virtio: Move from virtio to rpmsg byte conversion
Date:   Wed, 18 Nov 2020 14:36:54 -0700
Message-Id: <20201118213700.74106-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201118213700.74106-1-mathieu.poirier@linaro.org>
References: <20201118213700.74106-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use rpmsg byte conversion functions in order for the RPMSG
headers and generic functions to be used by external entities.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 53 +++++++++++++++++---------------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 7d7ed4e5cce7..5259fbbc8e68 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -19,11 +19,11 @@
 #include <linux/mutex.h>
 #include <linux/of_device.h>
 #include <linux/rpmsg.h>
+#include <linux/rpmsg/byteorder.h>
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
@@ -341,8 +341,8 @@ static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
 		struct rpmsg_ns_msg nsm;
 
 		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
-		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
-		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_CREATE);
+		nsm.addr = cpu_to_rpmsg32(rpdev, rpdev->ept->addr);
+		nsm.flags = cpu_to_rpmsg32(rpdev, RPMSG_NS_CREATE);
 
 		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
 		if (err)
@@ -365,8 +365,8 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
 		struct rpmsg_ns_msg nsm;
 
 		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
-		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
-		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_DESTROY);
+		nsm.addr = cpu_to_rpmsg32(rpdev, rpdev->ept->addr);
+		nsm.flags = cpu_to_rpmsg32(rpdev, RPMSG_NS_DESTROY);
 
 		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
 		if (err)
@@ -425,6 +425,7 @@ static struct rpmsg_device *rpmsg_create_channel(struct virtproc_info *vrp,
 	rpdev->src = chinfo->src;
 	rpdev->dst = chinfo->dst;
 	rpdev->ops = &virtio_rpmsg_ops;
+	rpdev->little_endian = virtio_is_little_endian(vrp->vdev);
 
 	/*
 	 * rpmsg server channels has predefined local address (for now),
@@ -618,10 +619,10 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
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
 
@@ -710,14 +711,15 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
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
@@ -736,7 +738,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 	/* use the dst addr to fetch the callback of the appropriate user */
 	mutex_lock(&vrp->endpoints_lock);
 
-	ept = idr_find(&vrp->endpoints, virtio32_to_cpu(vrp->vdev, msg->dst));
+	ept = idr_find(&vrp->endpoints, __rpmsg32_to_cpu(little_endian, msg->dst));
 
 	/* let's make sure no one deallocates ept while we use it */
 	if (ept)
@@ -750,7 +752,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 
 		if (ept->cb)
 			ept->cb(ept->rpdev, msg->data, msg_len, ept->priv,
-				virtio32_to_cpu(vrp->vdev, msg->src));
+				__rpmsg32_to_cpu(little_endian, msg->src));
 
 		mutex_unlock(&ept->cb_lock);
 
@@ -830,6 +832,7 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
 	struct rpmsg_channel_info chinfo;
 	struct virtproc_info *vrp = priv;
 	struct device *dev = &vrp->vdev->dev;
+	bool little_endian = virtio_is_little_endian(vrp->vdev);
 	int ret;
 
 #if defined(CONFIG_DYNAMIC_DEBUG)
@@ -858,13 +861,13 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
 
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

