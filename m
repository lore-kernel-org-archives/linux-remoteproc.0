Return-Path: <SRS0=mmP+=AS=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B190C433E1
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Jul 2020 15:34:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F7D220663
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Jul 2020 15:34:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728392AbgGGPeu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 7 Jul 2020 11:34:50 -0400
Received: from mga18.intel.com ([134.134.136.126]:24762 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728165AbgGGPer (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Jul 2020 11:34:47 -0400
IronPort-SDR: D9GdVEvhRBb+qPek4H6oTwZlF1XMIMT3v5m7FvPvbvcr5gBlpT6/kEt1mo0aCO5JewPY8d8es1
 W7ar747kYDKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="135091635"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; 
   d="scan'208";a="135091635"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2020 08:34:41 -0700
IronPort-SDR: +aJBUIAYvyhcW6UoSCvogAJLQsRiV0NiyomDmEsnJCsshOy2AkJf/29SiHLHfNdQDZ0sEMlf0M
 N15nBzWlaJXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; 
   d="scan'208";a="266856889"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.52.138])
  by fmsmga007.fm.intel.com with ESMTP; 07 Jul 2020 08:34:38 -0700
Date:   Tue, 7 Jul 2020 17:34:38 +0200
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: [PATCH v4] rpmsg: virtio: add endianness conversions
Message-ID: <20200707153436.GA5970@ubuntu>
References: <20200608123932.GF10562@ubuntu>
 <20200615204707.GA231755@xps15>
 <20200616061456.GA2999@ubuntu>
 <20200616073011.GB2999@ubuntu>
 <20200630175057.GA3831001@xps15>
 <20200701055912-mutt-send-email-mst@kernel.org>
 <20200706124716.GA5457@ubuntu>
 <20200706125657.GB5457@ubuntu>
 <20200706133835.GC5457@ubuntu>
 <c5a4b0c7-859e-24ad-cf1e-3f80a2f15f38@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5a4b0c7-859e-24ad-cf1e-3f80a2f15f38@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

According to the VirtIO 1.0 spec data, sent over virtual queues must
be in little-endian format. Update the RPMsg VirtIO implementation
to enforce that but let legacy configurations continue use native
endianness.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Tested-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---

Mathieu, I had to remove your "Reviewed-by" because this is a modified version...

v4: fix a left-over use of an LE value in calculation - thanks to Arnaud for catching!

v3: use the virtio_byteorder.h header

v2: Following suggestions from Michael and Mathieu switch to using virtio16/32
types and conversion functions.

 drivers/rpmsg/virtio_rpmsg_bus.c | 63 +++++++++++++++++---------------
 1 file changed, 34 insertions(+), 29 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 07d4f3374098..9006fc7f73d0 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -23,6 +23,7 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/virtio.h>
+#include <linux/virtio_byteorder.h>
 #include <linux/virtio_ids.h>
 #include <linux/virtio_config.h>
 #include <linux/wait.h>
@@ -84,11 +85,11 @@ struct virtproc_info {
  * Every message sent(/received) on the rpmsg bus begins with this header.
  */
 struct rpmsg_hdr {
-	u32 src;
-	u32 dst;
-	u32 reserved;
-	u16 len;
-	u16 flags;
+	__virtio32 src;
+	__virtio32 dst;
+	__virtio32 reserved;
+	__virtio16 len;
+	__virtio16 flags;
 	u8 data[];
 } __packed;
 
@@ -106,8 +107,8 @@ struct rpmsg_hdr {
  */
 struct rpmsg_ns_msg {
 	char name[RPMSG_NAME_SIZE];
-	u32 addr;
-	u32 flags;
+	__virtio32 addr;
+	__virtio32 flags;
 } __packed;
 
 /**
@@ -335,8 +336,8 @@ static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
 		struct rpmsg_ns_msg nsm;
 
 		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
-		nsm.addr = rpdev->ept->addr;
-		nsm.flags = RPMSG_NS_CREATE;
+		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
+		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_CREATE);
 
 		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
 		if (err)
@@ -359,8 +360,8 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
 		struct rpmsg_ns_msg nsm;
 
 		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
-		nsm.addr = rpdev->ept->addr;
-		nsm.flags = RPMSG_NS_DESTROY;
+		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
+		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_DESTROY);
 
 		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
 		if (err)
@@ -612,18 +613,18 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 		}
 	}
 
-	msg->len = len;
+	msg->len = cpu_to_virtio16(vrp->vdev, len);
 	msg->flags = 0;
-	msg->src = src;
-	msg->dst = dst;
+	msg->src = cpu_to_virtio32(vrp->vdev, src);
+	msg->dst = cpu_to_virtio32(vrp->vdev, dst);
 	msg->reserved = 0;
 	memcpy(msg->data, data, len);
 
 	dev_dbg(dev, "TX From 0x%x, To 0x%x, Len %d, Flags %d, Reserved %d\n",
-		msg->src, msg->dst, msg->len, msg->flags, msg->reserved);
+		src, dst, len, msg->flags, msg->reserved);
 #if defined(CONFIG_DYNAMIC_DEBUG)
 	dynamic_hex_dump("rpmsg_virtio TX: ", DUMP_PREFIX_NONE, 16, 1,
-			 msg, sizeof(*msg) + msg->len, true);
+			 msg, sizeof(*msg) + len, true);
 #endif
 
 	rpmsg_sg_init(&sg, msg, sizeof(*msg) + len);
@@ -704,13 +705,17 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 {
 	struct rpmsg_endpoint *ept;
 	struct scatterlist sg;
+	unsigned int msg_len = virtio16_to_cpu(vrp->vdev, msg->len);
 	int err;
 
 	dev_dbg(dev, "From: 0x%x, To: 0x%x, Len: %d, Flags: %d, Reserved: %d\n",
-		msg->src, msg->dst, msg->len, msg->flags, msg->reserved);
+		virtio32_to_cpu(vrp->vdev, msg->src),
+		virtio32_to_cpu(vrp->vdev, msg->dst), msg_len,
+		virtio16_to_cpu(vrp->vdev, msg->flags),
+		virtio32_to_cpu(vrp->vdev, msg->reserved));
 #if defined(CONFIG_DYNAMIC_DEBUG)
 	dynamic_hex_dump("rpmsg_virtio RX: ", DUMP_PREFIX_NONE, 16, 1,
-			 msg, sizeof(*msg) + msg->len, true);
+			 msg, sizeof(*msg) + msg_len, true);
 #endif
 
 	/*
@@ -718,15 +723,15 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 	 * the reported payload length.
 	 */
 	if (len > vrp->buf_size ||
-	    msg->len > (len - sizeof(struct rpmsg_hdr))) {
-		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg->len);
+	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
+		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
 		return -EINVAL;
 	}
 
 	/* use the dst addr to fetch the callback of the appropriate user */
 	mutex_lock(&vrp->endpoints_lock);
 
-	ept = idr_find(&vrp->endpoints, msg->dst);
+	ept = idr_find(&vrp->endpoints, virtio32_to_cpu(vrp->vdev, msg->dst));
 
 	/* let's make sure no one deallocates ept while we use it */
 	if (ept)
@@ -739,8 +744,8 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 		mutex_lock(&ept->cb_lock);
 
 		if (ept->cb)
-			ept->cb(ept->rpdev, msg->data, msg->len, ept->priv,
-				msg->src);
+			ept->cb(ept->rpdev, msg->data, msg_len, ept->priv,
+				virtio32_to_cpu(vrp->vdev, msg->src));
 
 		mutex_unlock(&ept->cb_lock);
 
@@ -846,15 +851,15 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
 	/* don't trust the remote processor for null terminating the name */
 	msg->name[RPMSG_NAME_SIZE - 1] = '\0';
 
-	dev_info(dev, "%sing channel %s addr 0x%x\n",
-		 msg->flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
-		 msg->name, msg->addr);
-
 	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
 	chinfo.src = RPMSG_ADDR_ANY;
-	chinfo.dst = msg->addr;
+	chinfo.dst = virtio32_to_cpu(vrp->vdev, msg->addr);
+
+	dev_info(dev, "%sing channel %s addr 0x%x\n",
+		 virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY ?
+		 "destroy" : "creat", msg->name, chinfo.dst);
 
-	if (msg->flags & RPMSG_NS_DESTROY) {
+	if (virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY) {
 		ret = rpmsg_unregister_device(&vrp->vdev->dev, &chinfo);
 		if (ret)
 			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
-- 
2.27.0

