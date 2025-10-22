Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267F4279784
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Oct 2025 03:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103731; cv=none; b=aLjTztdQW5ry88VPH3jbuAg2+waUcH0+n9PSSjabafj5lq9dnXLCUIA+07ETw6haNX1VRhSdjKVW4K2U38UDXXTykHr76BpPV3jJGM6z1/J7IBBkMbOpHDCDY9PT8OlEW7HAJ/1kJdYGv+BDRg8gBqG8PoaxWQpu/rvgackyXN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103731; c=relaxed/simple;
	bh=Z+8QvGLxa7PNLUYVmbKc9cl0VkWkiixq5srn7slPGEk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aLnYHht1bkUb6GOuuUCJkt5TxDk1dU9cR2lAV6MK+gwpiBKme2JIo9/Azr4qO5M/qbn+tVS1KpA4SZaRB6nBr5HvSVp6meGX4tAsPUUXLxdHT2V09EPIusQbUpckLHoEOE03HkO0e9T+CTdzZ0hndnlXvUtf3JHdJyLRI9GfjJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hoCsQgTz; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hoCsQgTz"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b6271ea39f4so4402488a12.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Oct 2025 20:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761103729; x=1761708529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lADXJaM4Pmom652Ho+Y70+UP4X6H2HcUSGV8SCrHkEI=;
        b=hoCsQgTzVKUs1SUsVAlA7BFCVVtb3abndSe9GPNBVk+dr9AiUDkr2KF6rhEu3VM2NH
         qdwQ47rsSCOvkU95Jujq0JhC3849k6lIvdlx1mb9mg6bO2bAGEO24pdH6uomAyjK2IRX
         lqyjswP/0pajXaJJ8an4NOSYEcy+DPDiZsZ9cNaB2i3UQYzYI/My2LOPLt1frAWYvnWg
         D+9BhGlFIIW4Tmhqx0PkmgHf6ZDgnRPGCpAiaNThuIcBeOGzjc9GT5aP68mLjGHhGwKD
         swL/6iC/PAm6uvTkcgK/J43El89PSAXf5VAe6KNzpccmAn4ALXq1WQCmdqCTExu8HWhe
         3hSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761103729; x=1761708529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lADXJaM4Pmom652Ho+Y70+UP4X6H2HcUSGV8SCrHkEI=;
        b=Cr6qy1GC2zjNxYt8QDSCRuWRTlrQfjc8x5jQNntNyKH9nFubMcjgAyT9bbv7vQ8522
         vw2/du0pEopdbFBntbaqW3KQYwmNfu6Z1tHx2dk2qzMnUw/YHp6z0rItpWNWPUZts+sR
         RkGgMhm9bKC32JOaB7wpVd2eHBftop+tMRAyM7AhBmGa8oZE8m9Xw0nti008vaBI816o
         2XXqUhccRvy/+SXNHhLODcDxqNPwtmG2ewduu0K43slRZYr0y+V6GpokHTAuoGiY4zCd
         OdpxrXU5KkQ5L7c6Tn5iwNSCwWMziG14jtna0vGpnomATgBRulVFHhRmvq6l7hDUD/PM
         4SIA==
X-Gm-Message-State: AOJu0Yx08wXqIag++OHDFYmyOTPfmnLAnzb2JkTc5V8NW9Udh5xUu1hq
	apK168cJxxjFvKSbtXfNNPaXeXpcgCW7J9u5NAxqPuPoxNVCWST8y6lbWOOK3KJ3
X-Gm-Gg: ASbGncvk2EnlPSBEGjZXdtk7L1E1ch11ct7J//QuibWqkAl1EMg9JgJuD6xkL3v5zOQ
	vlIvF37TvEobCcZPe1rDTKE1Iit0jMUGj0BLzUHaDJ6Ypvh3pBjijb9LZ8ynr5AihAygtegWkKy
	xvb+Rp0sJUIZSiSJ4lD2gpJKJoNrLOe3ybr1TYNtArB+8j9PlMSgrolJ7ZjBwJ0xZ41fo/IXsOa
	tVoonT0mr2igH9lg/uUYy+lHKhKkxLy5kqCceM2q1h/4WOPCYmKtMfXyMgYWFdYWuAXPXtuZJee
	YIaAVEGEGezV3+AZD+xWcdAHoW+h8u8J6d9WIGoMmZryxrivi9MgcVXG9+zNktcu0zrlrESdUWv
	xhp+raaHYl7UG42LXqKzRdy4MKUl+ybqlqw6CR03jl2whP7jpcUbqqa210yWvc2JmPb7ENNGEZc
	G8YcIc3iF8I0wGbUEdi8PRoUFlrdj0y2kjdo4VgmlWaTtXYt54gpPByOlXF+x2ozLr6A==
X-Google-Smtp-Source: AGHT+IG7Qze6ZwX8JIqQC3tXa6asadCj0SQ4HLyeTvZsw2mMXCyPoFwROvDRawylnz/3gMbOu0Novg==
X-Received: by 2002:a17:903:22c3:b0:290:c317:a34e with SMTP id d9443c01a7336-290c9cd4b8fmr273557065ad.25.1761103728866;
        Tue, 21 Oct 2025 20:28:48 -0700 (PDT)
Received: from pox13 (2403-5800-b00a--17c.ip6.aussiebb.net. [2403:5800:b00a::17c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fd7e61sm124414295ad.35.2025.10.21.20.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 20:28:48 -0700 (PDT)
From: patrick.oppenlander@gmail.com
To: linux-remoteproc@vger.kernel.org
Cc: mathieu.poirier@linaro.org,
	andersson@kernel.org,
	Patrick Oppenlander <patrick.oppenlander@gmail.com>
Subject: [PATCH] rpmsg: virtio: EPOLLOUT support
Date: Wed, 22 Oct 2025 14:28:17 +1100
Message-ID: <20251022032817.320378-1-patrick.oppenlander@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Patrick Oppenlander <patrick.oppenlander@gmail.com>

Previously, polling an rpmsg endpoint (e.g. /dev/ttyRPMSGx) would
generate EPOLLIN events but no EPOLLOUT events.

Unfortunately, poll support means that we can no longer disable
tx-complete interrupts as there is no way to know whether a poller is
waiting in sendq, so we always need notifications.

Signed-off-by: Patrick Oppenlander <patrick.oppenlander@gmail.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 101 ++++++++++---------------------
 1 file changed, 32 insertions(+), 69 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 484890b4a6a74..79d983055b4d6 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -41,13 +41,12 @@
  * @buf_size:   size of one rx or tx buffer
  * @last_sbuf:	index of last tx buffer used
  * @bufs_dma:	dma base addr of the buffers
- * @tx_lock:	protects svq, sbufs and sleepers, to allow concurrent senders.
+ * @tx_lock:	protects svq and sbufs, to allow concurrent senders.
  *		sending a message might require waking up a dozing remote
  *		processor, which involves sleeping, hence the mutex.
  * @endpoints:	idr of local endpoints, allows fast retrieval
  * @endpoints_lock: lock of the endpoints set
  * @sendq:	wait queue of sending contexts waiting for a tx buffers
- * @sleepers:	number of senders that are waiting for a tx buffer
  *
  * This structure stores the rpmsg state of a given virtio remote processor
  * device (there might be several virtio proc devices for each physical
@@ -65,7 +64,6 @@ struct virtproc_info {
 	struct idr endpoints;
 	struct mutex endpoints_lock;
 	wait_queue_head_t sendq;
-	atomic_t sleepers;
 };
 
 /* The feature bitmap for virtio rpmsg */
@@ -144,6 +142,8 @@ static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len,
 static int virtio_rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len);
 static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
 				  int len, u32 dst);
+static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
+				  poll_table *wait);
 static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept);
 static struct rpmsg_device *__rpmsg_create_channel(struct virtproc_info *vrp,
 						   struct rpmsg_channel_info *chinfo);
@@ -154,6 +154,7 @@ static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
 	.sendto = virtio_rpmsg_sendto,
 	.trysend = virtio_rpmsg_trysend,
 	.trysendto = virtio_rpmsg_trysendto,
+	.poll = virtio_rpmsg_poll,
 	.get_mtu = virtio_rpmsg_get_mtu,
 };
 
@@ -436,7 +437,6 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
 	unsigned int len;
 	void *ret;
 
-	/* support multiple concurrent senders */
 	mutex_lock(&vrp->tx_lock);
 
 	/*
@@ -454,62 +454,6 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
 	return ret;
 }
 
-/**
- * rpmsg_upref_sleepers() - enable "tx-complete" interrupts, if needed
- * @vrp: virtual remote processor state
- *
- * This function is called before a sender is blocked, waiting for
- * a tx buffer to become available.
- *
- * If we already have blocking senders, this function merely increases
- * the "sleepers" reference count, and exits.
- *
- * Otherwise, if this is the first sender to block, we also enable
- * virtio's tx callbacks, so we'd be immediately notified when a tx
- * buffer is consumed (we rely on virtio's tx callback in order
- * to wake up sleeping senders as soon as a tx buffer is used by the
- * remote processor).
- */
-static void rpmsg_upref_sleepers(struct virtproc_info *vrp)
-{
-	/* support multiple concurrent senders */
-	mutex_lock(&vrp->tx_lock);
-
-	/* are we the first sleeping context waiting for tx buffers ? */
-	if (atomic_inc_return(&vrp->sleepers) == 1)
-		/* enable "tx-complete" interrupts before dozing off */
-		virtqueue_enable_cb(vrp->svq);
-
-	mutex_unlock(&vrp->tx_lock);
-}
-
-/**
- * rpmsg_downref_sleepers() - disable "tx-complete" interrupts, if needed
- * @vrp: virtual remote processor state
- *
- * This function is called after a sender, that waited for a tx buffer
- * to become available, is unblocked.
- *
- * If we still have blocking senders, this function merely decreases
- * the "sleepers" reference count, and exits.
- *
- * Otherwise, if there are no more blocking senders, we also disable
- * virtio's tx callbacks, to avoid the overhead incurred with handling
- * those (now redundant) interrupts.
- */
-static void rpmsg_downref_sleepers(struct virtproc_info *vrp)
-{
-	/* support multiple concurrent senders */
-	mutex_lock(&vrp->tx_lock);
-
-	/* are we the last sleeping context waiting for tx buffers ? */
-	if (atomic_dec_and_test(&vrp->sleepers))
-		/* disable "tx-complete" interrupts */
-		virtqueue_disable_cb(vrp->svq);
-
-	mutex_unlock(&vrp->tx_lock);
-}
-
 /**
  * rpmsg_send_offchannel_raw() - send a message across to the remote processor
  * @rpdev: the rpmsg channel
@@ -582,9 +526,6 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 
 	/* no free buffer ? wait for one (but bail after 15 seconds) */
 	while (!msg) {
-		/* enable "tx-complete" interrupts, if not already enabled */
-		rpmsg_upref_sleepers(vrp);
-
 		/*
 		 * sleep until a free buffer is available or 15 secs elapse.
 		 * the timeout period is not configurable because there's
@@ -595,9 +536,6 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 					(msg = get_a_tx_buf(vrp)),
 					msecs_to_jiffies(15000));
 
-		/* disable "tx-complete" interrupts if we're the last sleeper */
-		rpmsg_downref_sleepers(vrp);
-
 		/* timeout ? */
 		if (!err) {
 			dev_err(dev, "timeout waiting for a tx buffer\n");
@@ -676,6 +614,34 @@ static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
 	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
 }
 
+static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
+				  poll_table *wait)
+{
+	struct rpmsg_device *rpdev = ept->rpdev;
+	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
+	struct virtproc_info *vrp = vch->vrp;
+	__poll_t mask = 0;
+
+	poll_wait(filp, &vrp->sendq, wait);
+
+	/* support multiple concurrent senders */
+	mutex_lock(&vrp->tx_lock);
+
+	/*
+	 * check for a free buffer, either:
+	 * - we haven't used all of the available transmit buffers (half of the
+	 *   allocated buffers are used for transmit, hence num_bufs / 2), or,
+	 * - we ask the virtqueue if there's a buffer available
+	 */
+	if (vrp->last_sbuf < vrp->num_bufs / 2 ||
+	    !virtqueue_enable_cb(vrp->svq))
+		mask |= EPOLLOUT;
+
+	mutex_unlock(&vrp->tx_lock);
+
+	return mask;
+}
+
 static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
 {
 	struct rpmsg_device *rpdev = ept->rpdev;
@@ -922,9 +888,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
 		WARN_ON(err); /* sanity check; this can't really happen */
 	}
 
-	/* suppress "tx-complete" interrupts */
-	virtqueue_disable_cb(vrp->svq);
-
 	vdev->priv = vrp;
 
 	rpdev_ctrl = rpmsg_virtio_add_ctrl_dev(vdev);
-- 
2.51.1.dirty

