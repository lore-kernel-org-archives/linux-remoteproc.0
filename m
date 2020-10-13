Return-Path: <SRS0=ISGM=DV=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A6CC433E7
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 09:22:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58BE720B1F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 09:22:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zco7rub1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729848AbgJNJWF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 05:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731154AbgJNJVz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 05:21:55 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A061C08EA73
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2020 16:25:25 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a17so384126pju.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2020 16:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mv3AqdsXk34lvmbhy/w0WOQHCbmdUZwNkrverLNgIFw=;
        b=Zco7rub1ajhWwIuTzU92newmNnhdcRQwLGiO3egVls7ADGGbiLB8aRe1YYPOkE4MOu
         aGD8YT2Im7caamhK5tuGKBDteHoKIqjjIA65DlCkdMbzWb+JSrdVq2gqSVHx5h5sWOUc
         WjorI4vfZJiO1RT6sLLFtHDehcgRjscE6tu8x6fOJfJ2PVRJ9FCajkFAsmKVjMhn/l+n
         4tjWpiScDZg+Y3g2kmWGjV590ong2Xo9JlgtpiIY7Oo6GZyj6aAHGtjLIz4iOINifHEK
         DP+rZAVfo0K0Niy9iiPmf3tOpu3wMw65tnparL1ASzfIqTnLi5U5NzPDFPs6OrDWf2Xi
         ypsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mv3AqdsXk34lvmbhy/w0WOQHCbmdUZwNkrverLNgIFw=;
        b=trKC2hLBulmBQx92B1B1hwj6T5ZU5/y+O+9MX6+1uQ4dMQsJAgTcLg0ElAYw+fTGdP
         MaUL+7VABBySEVq7xyyLja6LzZ1qmn6CZZNP/wG/JYK1gcikhPfOR5Wr8xXog4gR6rPs
         NpkcQeT3IUESOB4+lPOo5jv/w1GQNAyWdf8v/P2F9lz/sZWs8UWMPuhvG+hFVH5nWmhV
         3t7wVgz3mlIWH3sjQGkp4sVHM3NXtHgfBXhY+j2g+tadQ0YRZdoTMSEdKLzePrAKjiMQ
         zcC8Y2SFuAeHwf8c2Ebo/1dov8011jTnfj4PQ3TenDXpTj74acSnMuROxvz87IyxxJcM
         2R2g==
X-Gm-Message-State: AOAM530hh0ok7Bsl+9sLejti6Vt+PbyRp9yJmFIyI+vhfmxPrRAoefP3
        3rRx4c1tVwBcCX821Bhx7nrzhw==
X-Google-Smtp-Source: ABdhPJw+B7rpK0zF59iaO8J06TxDvR0JX3X0xAJvFHnUqEVUmmrpzBLTNI56qFphMS6gOGryzUTs0w==
X-Received: by 2002:a17:902:b286:b029:d3:f6b1:3261 with SMTP id u6-20020a170902b286b02900d3f6b13261mr1656376plr.61.1602631524999;
        Tue, 13 Oct 2020 16:25:24 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id b8sm791871pfr.159.2020.10.13.16.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 16:25:24 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/9] rpmsg: virtio: Move from virtio to rpmsg byte conversion
Date:   Tue, 13 Oct 2020 17:25:13 -0600
Message-Id: <20201013232519.1367542-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201013232519.1367542-1-mathieu.poirier@linaro.org>
References: <20201013232519.1367542-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use rpmsg byte conversion functions in order for the RPMSG
headers and generic functions to be used by external entities.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 60 +++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 25 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 9006fc7f73d0..793fe924671f 100644
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
@@ -280,6 +280,14 @@ static struct rpmsg_endpoint *__rpmsg_create_ept(struct virtproc_info *vrp,
 	return NULL;
 }
 
+static bool virtio_rpmsg_is_little_endian(struct rpmsg_device *rpdev)
+{
+	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
+	struct virtproc_info *vrp = vch->vrp;
+
+	return virtio_is_little_endian(vrp->vdev);
+}
+
 static struct rpmsg_endpoint *virtio_rpmsg_create_ept(struct rpmsg_device *rpdev,
 						      rpmsg_rx_cb_t cb,
 						      void *priv,
@@ -336,8 +344,8 @@ static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
 		struct rpmsg_ns_msg nsm;
 
 		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
-		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
-		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_CREATE);
+		nsm.addr = cpu_to_rpmsg32(rpdev, rpdev->ept->addr);
+		nsm.flags = cpu_to_rpmsg32(rpdev, RPMSG_NS_CREATE);
 
 		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
 		if (err)
@@ -360,8 +368,8 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
 		struct rpmsg_ns_msg nsm;
 
 		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
-		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
-		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_DESTROY);
+		nsm.addr = cpu_to_rpmsg32(rpdev, rpdev->ept->addr);
+		nsm.flags = cpu_to_rpmsg32(rpdev, RPMSG_NS_DESTROY);
 
 		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
 		if (err)
@@ -372,6 +380,7 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
 }
 
 static const struct rpmsg_device_ops virtio_rpmsg_ops = {
+	.is_little_endian = virtio_rpmsg_is_little_endian,
 	.create_ept = virtio_rpmsg_create_ept,
 	.announce_create = virtio_rpmsg_announce_create,
 	.announce_destroy = virtio_rpmsg_announce_destroy,
@@ -613,10 +622,10 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
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
 
@@ -705,14 +714,15 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 {
 	struct rpmsg_endpoint *ept;
 	struct scatterlist sg;
-	unsigned int msg_len = virtio16_to_cpu(vrp->vdev, msg->len);
+	bool little_endian = rpmsg_is_little_endian();
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
@@ -731,7 +741,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 	/* use the dst addr to fetch the callback of the appropriate user */
 	mutex_lock(&vrp->endpoints_lock);
 
-	ept = idr_find(&vrp->endpoints, virtio32_to_cpu(vrp->vdev, msg->dst));
+	ept = idr_find(&vrp->endpoints, __rpmsg32_to_cpu(little_endian, msg->dst));
 
 	/* let's make sure no one deallocates ept while we use it */
 	if (ept)
@@ -745,7 +755,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 
 		if (ept->cb)
 			ept->cb(ept->rpdev, msg->data, msg_len, ept->priv,
-				virtio32_to_cpu(vrp->vdev, msg->src));
+				__rpmsg32_to_cpu(little_endian, msg->src));
 
 		mutex_unlock(&ept->cb_lock);
 
@@ -853,13 +863,13 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
 
 	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
 	chinfo.src = RPMSG_ADDR_ANY;
-	chinfo.dst = virtio32_to_cpu(vrp->vdev, msg->addr);
+	chinfo.dst = rpmsg32_to_cpu(rpdev, msg->addr);
 
 	dev_info(dev, "%sing channel %s addr 0x%x\n",
-		 virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY ?
+		 rpmsg32_to_cpu(rpdev, msg->flags) & RPMSG_NS_DESTROY ?
 		 "destroy" : "creat", msg->name, chinfo.dst);
 
-	if (virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY) {
+	if (rpmsg32_to_cpu(rpdev, msg->flags) & RPMSG_NS_DESTROY) {
 		ret = rpmsg_unregister_device(&vrp->vdev->dev, &chinfo);
 		if (ret)
 			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
-- 
2.25.1

