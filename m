Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.177.127.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461332;
	b=zs6FqQ+KESSJDxxZavpZArLGhubsgDhv2zH+2QMHEkngTu9xw3WJDqCPn22jb6F9/hur
	 u9gVd2xN5y04ZG2JejHNyndpyUO/I9VALnw7Uw3jXjTtuxqAv8Jed1bzpaC5BZBjXWhPP
	 XcMM8gfvtgIcohSdVQgTt0amtn5cZaAXux93Y22mcfXFD7I0IW46/XhH5w6QhadDmgZ2w
	 m4ufhOe3OEm80SiLaGf8GqdV+wi14QMkp4Jrtu8Rqztbk2CnLyu5EYw2Sv5L+arjI3F55
	 Ku0Jj7xVHpCJ7gnLsCYs6MuPWvYXOvphF2TgMPC5/2ot6NE4yMF8b8ZDIWFCc3BamHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461332;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Envelope-From;
	bh=ZGoQIJfWER74Lse2hNucFJ7/DwQhKg86bX5l6vAf1lY=;
	b=3m6EN8GYN/A6+URcH/afdUxEmXVKOZgQoJ04bUpjcTm+JkVNJYJFg51jJmq9nFHbUcHK
	 ZHcOU1OPM76XX5aQixhdkdyG/kdFNN1s9adYZyzunTuYLnDlLV3o8gOhkp1kM4hytGSmF
	 oV+QVR0bNftJGUTxi1iEOC81QGRFqX9cnDYuyaXoJyOGTCcKW3QQKW+ViZ9A7Uz8/F6Lw
	 qDVZ2PxbPoIbMfTTF2Z1I0ylnvXLcnHAXgIE+5SPulSffekZR0GhyPKnQzrfodnCjbJ4k
	 ietyFJhj9Ids08Z2ezETKOGPMSCGn9exmWhxckwo/8i5Ykk0vGnGtN7uY3fvP2uRIhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=CMlWzdIG;
	arc=none smtp.remote-ip=198.177.127.193
Received: from out-utut-a193.jellyfish.systems (out-utut-a193.jellyfish.systems [198.177.127.193])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53446606A31A
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Nov 2026 19:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53446606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=CMlWzdIG
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jYFy44Qqxz2x9V;
	Mon, 23 Nov 2026 19:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1795461311;
	bh=ZGoQIJfWER74Lse2hNucFJ7/DwQhKg86bX5l6vAf1lY=;
	h=From:To:Cc:Subject:Date:From;
	b=CMlWzdIGl7oKUumU5vBvLW8Tu2NprrIBUvXKfkPfBf4UGrHN4nUYkx7pbhtkaSQKY
	 mzd3yFx7WTu5D7ZzDyuJo1yu3EFi51zyh4u3RLazbJlIvZP++hJbzehudj5n1ly8lc
	 U7nokRS+6ND0t/C4p5VL0hBbwllc6zFKz2EauPV6BiWCNVvweiU2Zbv4yr2wbLzs3t
	 zYmW3tcjbEWJP8Nv5eP/Q5jZZ6quY60l0z7MSyvyc78PxJMlX83iTT0VjzWeTaIDgL
	 yiiQqyyamLLOHSaBq2fbRW+UgyD1PW8/t0gRn4Ln6QVOqr6gviZ0fMlyzuCHgPjYd3
	 yPKwaq9OI8xzw==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chrispine Tinega <dev@chrispinetinega.com>
Subject: [PATCH v2] rpmsg: char: Drop messages that arrive while the device is closed
Date: Mon, 23 Nov 2026 22:14:53 +0300
Message-ID: <20261123191453.1172967-1-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: dev@chrispinetinega.com

A char device bound to an rpmsg channel reuses the channel's default
endpoint, and that endpoint stays bound when the last file is closed.
rpmsg_ept_cb() keeps running and appends an skb to eptdev->queue for
every message, with no limit. The queue is purged only on release, so
nothing frees it while the device stays closed.

An endpoint created through RPMSG_CREATE_EPT_IOCTL does not have this
problem: it is destroyed on release, and messages sent to it while the
device is closed are dropped by the bus.

On a TI AM62x whose M4F core sends about four 64-byte messages a
second, kernel memory that cannot be reclaimed grew by 2.2 MB in the
10 minutes the reading process was stopped, about 850 bytes a message.
At that rate a reader that is down for a day holds about 320 MB.

Drop messages for a default endpoint while eptdev->ept is NULL, as the
bus already does for an endpoint that does not exist. Non-default
endpoints are not checked here because a transport may invoke
rpmsg_ept_cb() from rpmsg_create_ept() before rpmsg_eptdev_open() sets
eptdev->ept.

Hold eptdev->queue_lock (irqsave) around the check and enqueue in
rpmsg_ept_cb() and around updates to eptdev->ept, and purge the queue
in rpmsg_eptdev_release() before releasing eptdev->ept_lock. This
prevents an in-flight callback from enqueuing an skb after release has
purged the queue, and prevents a concurrent open from racing with the
purge. Release already discards whatever the last reader left unread,
so delivery across a close is not something a reader can depend on
today.

Fixes: bc69d1066569 ("rpmsg: char: Introduce the "rpmsg-raw" channel")
Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>
---
Changes in v2:
- Scope the drop check to default endpoints (eptdev->default_ept),
  so initial messages arriving during rpmsg_create_ept() for a
  non-default endpoint are not dropped before eptdev->ept is set.
- Synchronize eptdev->ept updates and the rpmsg_ept_cb() check/enqueue
  under eptdev->queue_lock (irqsave), and purge eptdev->queue in
  rpmsg_eptdev_release() while still holding eptdev->ept_lock, so an
  in-flight callback cannot queue a stale or leaked skb after purge.
- Rebased onto rpmsg-next (965089d20).

v1: https://lore.kernel.org/all/20261115110040.363306-1-dev@chrispinetinega.com/

 drivers/rpmsg/rpmsg_char.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index d8868faac..c03b7a424 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -77,6 +77,7 @@ struct rpmsg_eptdev {
 int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
 {
 	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
+	unsigned long flags;
 
 	mutex_lock(&eptdev->ept_lock);
 	if (!eptdev->rpdev) {
@@ -89,7 +90,9 @@ int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
 		/* The default endpoint is released by the rpmsg core */
 		if (!eptdev->default_ept)
 			rpmsg_destroy_ept(eptdev->ept);
+		spin_lock_irqsave(&eptdev->queue_lock, flags);
 		eptdev->ept = NULL;
+		spin_unlock_irqrestore(&eptdev->queue_lock, flags);
 	}
 	mutex_unlock(&eptdev->ept_lock);
 
@@ -108,19 +111,31 @@ static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
 {
 	struct rpmsg_eptdev *eptdev = priv;
 	struct sk_buff *skb;
+	unsigned long flags;
 
 	if (!eptdev)
 		return 0;
 
+	spin_lock_irqsave(&eptdev->queue_lock, flags);
+	/*
+	 * A channel's default endpoint stays bound while the device is closed,
+	 * so this callback keeps running. Queuing now would grow the queue
+	 * without limit until the device is opened again. Drop the message.
+	 */
+	if (eptdev->default_ept && !eptdev->ept) {
+		spin_unlock_irqrestore(&eptdev->queue_lock, flags);
+		return 0;
+	}
+
 	skb = alloc_skb(len, GFP_ATOMIC);
-	if (!skb)
+	if (!skb) {
+		spin_unlock_irqrestore(&eptdev->queue_lock, flags);
 		return -ENOMEM;
+	}
 
 	skb_put_data(skb, buf, len);
-
-	spin_lock(&eptdev->queue_lock);
 	skb_queue_tail(&eptdev->queue, skb);
-	spin_unlock(&eptdev->queue_lock);
+	spin_unlock_irqrestore(&eptdev->queue_lock, flags);
 
 	/* wake up any blocking processes, waiting for new data */
 	wake_up_interruptible(&eptdev->readq);
@@ -149,6 +164,7 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
 	struct rpmsg_endpoint *ept;
 	struct rpmsg_device *rpdev = eptdev->rpdev;
 	struct device *dev = &eptdev->dev;
+	unsigned long flags;
 
 	mutex_lock(&eptdev->ept_lock);
 	if (eptdev->ept) {
@@ -180,7 +196,9 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
 	}
 
 	ept->flow_cb = rpmsg_ept_flow_cb;
+	spin_lock_irqsave(&eptdev->queue_lock, flags);
 	eptdev->ept = ept;
+	spin_unlock_irqrestore(&eptdev->queue_lock, flags);
 	filp->private_data = eptdev;
 	mutex_unlock(&eptdev->ept_lock);
 
@@ -191,19 +209,22 @@ static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
 {
 	struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
 	struct device *dev = &eptdev->dev;
+	unsigned long flags;
 
 	/* Close the endpoint, if it's not already destroyed by the parent */
 	mutex_lock(&eptdev->ept_lock);
 	if (eptdev->ept) {
 		if (!eptdev->default_ept)
 			rpmsg_destroy_ept(eptdev->ept);
+		spin_lock_irqsave(&eptdev->queue_lock, flags);
 		eptdev->ept = NULL;
+		spin_unlock_irqrestore(&eptdev->queue_lock, flags);
 	}
-	mutex_unlock(&eptdev->ept_lock);
 	eptdev->remote_flow_updated = false;
 
 	/* Discard all SKBs */
 	skb_queue_purge(&eptdev->queue);
+	mutex_unlock(&eptdev->ept_lock);
 
 	put_device(dev);
 
-- 
2.53.0

