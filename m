Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795056176;
	b=i45BnAT/zzwxBnkwp49X2ItNYLg/rVhSCXbZGEaa9LszBnfS0XLC8HPM5CXMS3qhLWp8
	 B3KRPwLQEZ+LZF1XpOPUWoiKbpyYwz025oNYQyasNGjofMAsJZlQnTo+6d7qq2lpIfTDj
	 pb0M8RnGbye6iZYuXJeUN7wTnew6zN79x48TFrot2GdR+5fD/eEVDxOyuz0u2h+ybqkLe
	 j6V7PQEGmJN6VheA+I5YTO2/7wX0x8jLSh1Z2sd7uJENSdct3HKhV1TOy5d4KwC3L78yV
	 9vDztdHzxW5DF1DM0uRTE3iTRt+2Xc0yhfP59c648w8uWUp36KOa3pOSajtzHAnMvyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795056176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=gvwBtBtWBTyL0msAk1+Yh/BrQynyxbXAePg5UyBFNd4=;
	b=2A/jFuePMwreQC7wfWpub8EwEhIkjv/1eLg3aIeDBgtzQ3uGjUPN3vcYF7tnD1VuDMwj
	 9zijAzynzSd1DmvOvGM/OmlTk2VFU8Yzk7WZxj2dfFUpZgIvrRfJ8h/sskx98ly5g3NrM
	 Y7XkvC9xgw7B8K/y963xFswA0phieQuzjU0jtPcS/0Y5BX7srzUqj9IBfgcKso0TJxzZD
	 FFDgvoKS7Z5p2Mz5FbsLflIpSzuQKQ3YeEIIG0a21RZqZq4wm8ceu04ppj8CPSHJH48yT
	 T/Uw5x0apyRMs9cfIIEXPxAF+XXf+xDk8zkFx7wucT0b/BfEQIN44VHbii42q6+43PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yeHru24W;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C048F606A31C
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 02:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C048F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yeHru24W
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36f8cdd30beso2171492eec.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 18:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795056175; x=1795660975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gvwBtBtWBTyL0msAk1+Yh/BrQynyxbXAePg5UyBFNd4=;
        b=yeHru24WluSVKY9k9VhARxYpYnMSoiH5ZI1e6/pkXXzV3qiUPfPwXLa9m20NGvkbk9
         V7mtEg3xjzPGswLwnA4Trrqo8iqrFxbfFCAcv8fXlZHIV3PvH6gO/biVuTtqBCo93Le7
         lomypd8XlWyJsraBh5kGmmgbgSpLLtCecamQ/25Pykoc8j2HQPvNz9XY9GZJEGEHCfFE
         F5EWpKJG2TZHv+K2WNaS56JLEOwkXbkHdCpYvJ4ypBMTEBgErVvkOfFU1or5+4gQvdiq
         zp3wvFcKJHAyFgY6fgSTf4cKyu8oxvBi/oLVYUMD1OivSh35Mn8jv7C62hyGYNU1XxeS
         275Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795056175; x=1795660975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gvwBtBtWBTyL0msAk1+Yh/BrQynyxbXAePg5UyBFNd4=;
        b=i28xFeOrrpYizUkmlA80NJ//DaMVlo13XQ+Bick+7EXcOvCKARpfe31Q+6qUT8tVDs
         SxNms22TJNchbyErb6RXAYOLAKjZqtqc+lJz5ynP37sbM5J5YDhJBdSuMCzoB3E/4Hql
         9jqSx7LLkgaKM3cnetnK8HsN8+5Bmyb7Qtkpl4+gfn3VD5o8EeYG0OPsGxvmWcbSmu9m
         aWItzViuMSkTim2PTrgOILd4SQc/NA/a3qFXss9A4Op7SiZKQD22NZR8uamKtZztyJ6m
         0CLgfCLp1I0bPuXxyhEPtfVctcY0LpfzEhyWpSFdnUgTyPf5awIsjRT0NrfpoSsOsZP5
         TCwg==
X-Gm-Message-State: APuU4Z8J0eQzSlN/Cn2bI3JvJdNQHRbcMMKrOtXu9w5Gkj1yWkFgSkmV
	49PFg4qmtlBRKE7RbxKi2ZrD1DRuaSduqhXzJmk9VZXp3Fu9HDhNScIJViS3wrn8U4o=
X-Gm-Gg: AZFdTZccxM3TGfnqSkpcbXCtI+NeK+yuAdXEFbdCwFMOmWxKSMaZtdeu3ETl9VGebcO
	QqzCqkc+oNXKxOpt7yzLcaelhGO+ncGkXfVwGXouGsaF++3XuNw3pC+D48479TR0OkIA6O3Ac/G
	0/VlL+Y3k5dK8BqIixhjvE0J/BswoMkQxb63XDxNGrmPIFCFlCSryAMrLmdVVutOmtX4M+Ez/DE
	AKBPKhQPRNxxdaixEf2dA+3ChKm0lxxoX8SWYN+Ka/9R+Tbm1pUEk31Rkrsy/9xdd/1EZx5a41Q
	Sad8XjMk2267W7UfuSuipo1ncopvNhUHswTmP5JYZsYqkR6xVyxG5+4l5FHLCAYxv/JVtENwMdi
	v/xZtk7ldAk0QwS4NyCJThwkHWhIYLjzJQ+fj2dG+g7mSLzMAa0lAsj7DjTkEfgasej2EE3bo4J
	ystAy1mZ0rzrIMTN8ZvLct96ZRu27Kj6vvPg73LwahqFkzJHJKefNLWCgqY/ATCL7UN3nYCHGh7
	XWwmiiXy/OlIoAceIKzcwj3ev/vsWyOgGnq6ppw5UfAFg/Lznnu3L0FPrETSv7EMwoHaVRSMM5V
	TLZLN5jY/7GU+/pJiX0ueNS/2zOxeZBDxqC6LPAsrwm0G6v9TZNw2vqTs0+EqCpxD3uTavhlpoP
	q9Gxf/Bt+OwRlCLtbwerunXG0jJb5ZkjIvRaMm6pv
X-Received: by 2002:a05:7301:18aa:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-38281813bc6mr3906712eec.30.1795056174453;
        Wed, 18 Nov 2026 18:42:54 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:38a8:0:f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a79c96b2sm13276451eec.24.2026.11.18.18.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 18:42:53 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] rpmsg: stop the inbound callbacks before the driver is removed
Date: Thu, 19 Nov 2026 10:42:48 +0800
Message-Id: <20261119024248.1497433-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

rpmsg_dev_remove() calls rpdrv->remove() and destroys the default
endpoint only afterwards.  Until the endpoint is destroyed it keeps
delivering inbound messages to rpmsg_ept_cb() and flow control
notifications to rpmsg_ept_flow_cb(), both with ept->priv pointing to the
per-endpoint data that the driver releases during its remove.  For the
default endpoint of rpmsg_chrdev that data is the rpmsg_eptdev that is
freed as soon as the channel goes away.

Add an optional quiesce_ept operation that stops the inbound callbacks
without releasing the endpoint, and call it from rpmsg_dev_remove()
before rpdrv->remove(), and from the probe failure path which calls the
driver remove callback as well.  The endpoint itself is still destroyed
after the driver remove() returns, so drivers that want to send a last
message keep working.  No in-tree RPMsg driver sends on the endpoint
from its remove callback.

The operation runs in process context; it is not an atomic one.  Virtio
takes the mutex it already holds around the callbacks, mtk_rpmsg waits
for an RCU grace period, and qcom_smd and qcom_glink take their receive
spinlock.  Callback execution context is transport specific: a callback
invoked under a spinlock or an RCU read side section must not sleep, and
the operation preserves the context each transport already used.  Glink
also takes recv_lock around the flow control callback, whose only
in-tree implementation, rpmsg_ept_flow_cb(), sets two flags and wakes
the read queue; glink is also the only transport that delivers that
callback today.

qcom_smd skips the callback once it is gone and mtk_rpmsg switches the
callback pointer to RCU because its IPI handler runs without a lock.  The
warning that mtk_rpmsg_ipi_handler() prints for a failing callback has to
be inside the RCU read side section: quiesce_ept() waits for the readers
with synchronize_rcu(), and afterwards the endpoint and the device it
names may be gone.

quiesce_ept is optional, so the guarantee is per transport: only a
transport that implements it can promise that no inbound callback is
left when the driver remove callback returns.  All four in-tree
transports do.

Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
 drivers/rpmsg/mtk_rpmsg.c         | 28 +++++++++++++++++++++++-----
 drivers/rpmsg/qcom_glink_native.c | 17 ++++++++++++++---
 drivers/rpmsg/qcom_smd.c          | 20 +++++++++++++++++---
 drivers/rpmsg/rpmsg_core.c        | 11 +++++++++++
 drivers/rpmsg/rpmsg_internal.h    | 18 ++++++++++++++++++
 drivers/rpmsg/virtio_rpmsg_bus.c  | 16 ++++++++++++----
 6 files changed, 95 insertions(+), 15 deletions(-)

diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
index 430a9b2aa7bb..37d573287ced 100644
--- a/drivers/rpmsg/mtk_rpmsg.c
+++ b/drivers/rpmsg/mtk_rpmsg.c
@@ -73,12 +73,23 @@ static void mtk_rpmsg_ipi_handler(void *data, unsigned int len, void *priv)
 {
 	struct mtk_rpmsg_endpoint *mept = priv;
 	struct rpmsg_endpoint *ept = &mept->ept;
+	rpmsg_rx_cb_t cb;
 	int ret;
 
-	ret = (*ept->cb)(ept->rpdev, data, len, ept->priv, ept->addr);
-	if (ret)
-		dev_warn(&ept->rpdev->dev, "rpmsg handler return error = %d",
-			 ret);
+	/*
+	 * The warning has to be inside the read side section as well: @ept and
+	 * the device it points to are released once quiesce_ept() has waited
+	 * for the readers, and that wait would be over right after the unlock.
+	 */
+	rcu_read_lock();
+	cb = rcu_dereference(ept->cb);
+	if (cb) {
+		ret = cb(ept->rpdev, data, len, ept->priv, ept->addr);
+		if (ret)
+			dev_warn(&ept->rpdev->dev,
+				 "rpmsg handler return error = %d", ret);
+	}
+	rcu_read_unlock();
 }
 
 static struct rpmsg_endpoint *
@@ -100,7 +111,7 @@ __mtk_create_ept(struct mtk_rpmsg_rproc_subdev *mtk_subdev,
 	kref_init(&ept->refcount);
 
 	ept->rpdev = rpdev;
-	ept->cb = cb;
+	RCU_INIT_POINTER(ept->cb, cb);
 	ept->priv = priv;
 	ept->ops = &mtk_rpmsg_endpoint_ops;
 	ept->addr = id;
@@ -126,6 +137,12 @@ mtk_rpmsg_create_ept(struct rpmsg_device *rpdev, rpmsg_rx_cb_t cb, void *priv,
 	return __mtk_create_ept(mtk_subdev, rpdev, cb, priv, chinfo.src);
 }
 
+static void mtk_rpmsg_quiesce_ept(struct rpmsg_endpoint *ept)
+{
+	rcu_assign_pointer(ept->cb, NULL);
+	synchronize_rcu();
+}
+
 static void mtk_rpmsg_destroy_ept(struct rpmsg_endpoint *ept)
 {
 	struct mtk_rpmsg_rproc_subdev *mtk_subdev =
@@ -158,6 +175,7 @@ static int mtk_rpmsg_trysend(struct rpmsg_endpoint *ept, const void *data, int l
 }
 
 static const struct rpmsg_endpoint_ops mtk_rpmsg_endpoint_ops = {
+	.quiesce_ept = mtk_rpmsg_quiesce_ept,
 	.destroy_ept = mtk_rpmsg_destroy_ept,
 	.send = mtk_rpmsg_send,
 	.trysend = mtk_rpmsg_trysend,
diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index f848ab46161d..5b88a70ed08c 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1165,8 +1165,11 @@ static void qcom_glink_handle_signals(struct qcom_glink *glink,
 
 	enable = sigs & NATIVE_DSR_SIG || sigs & NATIVE_CTS_SIG;
 
+	spin_lock_irqsave(&channel->recv_lock, flags);
 	if (channel->ept.flow_cb)
-		channel->ept.flow_cb(channel->ept.rpdev, channel->ept.priv, enable);
+		channel->ept.flow_cb(channel->ept.rpdev, channel->ept.priv,
+				     enable);
+	spin_unlock_irqrestore(&channel->recv_lock, flags);
 }
 
 void qcom_glink_native_rx(struct qcom_glink *glink)
@@ -1408,16 +1411,23 @@ static void qcom_glink_remove_rpmsg_device(struct qcom_glink *glink, struct glin
 	channel->rpdev = NULL;
 }
 
-static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
+static void qcom_glink_quiesce_ept(struct rpmsg_endpoint *ept)
 {
 	struct glink_channel *channel = to_glink_channel(ept);
-	struct qcom_glink *glink = channel->glink;
 	unsigned long flags;
 
 	spin_lock_irqsave(&channel->recv_lock, flags);
 	channel->ept.cb = NULL;
+	channel->ept.flow_cb = NULL;
 	spin_unlock_irqrestore(&channel->recv_lock, flags);
+}
+
+static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
+{
+	struct glink_channel *channel = to_glink_channel(ept);
+	struct qcom_glink *glink = channel->glink;
 
+	qcom_glink_quiesce_ept(ept);
 	qcom_glink_send_close_req(glink, channel);
 }
 
@@ -1611,6 +1621,7 @@ static const struct rpmsg_device_ops glink_device_ops = {
 };
 
 static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
+	.quiesce_ept = qcom_glink_quiesce_ept,
 	.destroy_ept = qcom_glink_destroy_ept,
 	.send = qcom_glink_send,
 	.sendto = qcom_glink_sendto,
diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 7dbe1c6efe41..a27964c757ca 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -558,9 +558,11 @@ static int qcom_smd_channel_recv_single(struct qcom_smd_channel *channel)
 		len = channel->pkt_size;
 	}
 
-	ret = ept->cb(ept->rpdev, ptr, len, ept->priv, RPMSG_ADDR_ANY);
-	if (ret < 0)
-		return ret;
+	if (ept->cb) {
+		ret = ept->cb(ept->rpdev, ptr, len, ept->priv, RPMSG_ADDR_ANY);
+		if (ret < 0)
+			return ret;
+	}
 
 	/* Only forward the tail if the client consumed the data */
 	qcom_smd_channel_advance(channel, len);
@@ -950,6 +952,17 @@ static struct rpmsg_endpoint *qcom_smd_create_ept(struct rpmsg_device *rpdev,
 	return NULL;
 }
 
+static void qcom_smd_quiesce_ept(struct rpmsg_endpoint *ept)
+{
+	struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
+	struct qcom_smd_channel *channel = qsept->qsch;
+	unsigned long flags;
+
+	spin_lock_irqsave(&channel->recv_lock, flags);
+	ept->cb = NULL;
+	spin_unlock_irqrestore(&channel->recv_lock, flags);
+}
+
 static void qcom_smd_destroy_ept(struct rpmsg_endpoint *ept)
 {
 	struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
@@ -1052,6 +1065,7 @@ static const struct rpmsg_device_ops qcom_smd_device_ops = {
 };
 
 static const struct rpmsg_endpoint_ops qcom_smd_endpoint_ops = {
+	.quiesce_ept = qcom_smd_quiesce_ept,
 	.destroy_ept = qcom_smd_destroy_ept,
 	.send = qcom_smd_send,
 	.sendto = qcom_smd_sendto,
diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 04bfcc75f05b..b832345ca262 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -481,6 +481,9 @@ static int rpmsg_dev_probe(struct device *dev)
 	return 0;
 
 remove_rpdev:
+	if (ept && ept->ops->quiesce_ept)
+		ept->ops->quiesce_ept(ept);
+
 	if (rpdrv->remove)
 		rpdrv->remove(rpdev);
 destroy_ept:
@@ -498,6 +501,14 @@ static void rpmsg_dev_remove(struct device *dev)
 	if (rpdev->ops->announce_destroy)
 		rpdev->ops->announce_destroy(rpdev);
 
+	/*
+	 * Stop the inbound callbacks before the driver releases the data
+	 * reachable through @ept->priv.  The endpoint itself is destroyed
+	 * below, once the driver does not need it anymore.
+	 */
+	if (rpdev->ept && rpdev->ept->ops->quiesce_ept)
+		rpdev->ept->ops->quiesce_ept(rpdev->ept);
+
 	if (rpdrv->remove)
 		rpdrv->remove(rpdev);
 
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index a8b7065fd165..02dda4b6809b 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -61,6 +61,24 @@ struct rpmsg_device_ops {
  * @trysend, while the variants sending data off-channel are optional.
  */
 struct rpmsg_endpoint_ops {
+	/*
+	 * Stop the inbound callbacks of the endpoint without releasing it.
+	 * Optional: a transport that does not implement it keeps delivering
+	 * messages until the endpoint is destroyed, so only the transports
+	 * that do can promise that no callback is left when the driver
+	 * remove callback returns.
+	 *
+	 * Called from a sleepable context.  An implementation must wait for
+	 * the endpoint callbacks that are in flight before it returns, with
+	 * whatever lock already serializes them with its receive path.
+	 *
+	 * The context the callbacks themselves run in is transport
+	 * specific: a callback invoked under a spinlock or an RCU read side
+	 * section must not sleep.  A transport keeps the context it already
+	 * used for its callbacks.
+	 */
+	void (*quiesce_ept)(struct rpmsg_endpoint *ept);
+
 	void (*destroy_ept)(struct rpmsg_endpoint *ept);
 
 	int (*send)(struct rpmsg_endpoint *ept, const void *data, int len);
diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 23ff6c8b7a20..c8a15bb63841 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -137,6 +137,7 @@ struct virtio_rpmsg_channel {
  */
 #define RPMSG_RESERVED_ADDRESSES	(1024)
 
+static void virtio_rpmsg_quiesce_ept(struct rpmsg_endpoint *ept);
 static void virtio_rpmsg_destroy_ept(struct rpmsg_endpoint *ept);
 static int virtio_rpmsg_send(struct rpmsg_endpoint *ept, const void *data, int len);
 static int virtio_rpmsg_sendto(struct rpmsg_endpoint *ept, const void *data,
@@ -152,6 +153,7 @@ static struct rpmsg_device *__rpmsg_create_channel(struct virtproc_info *vrp,
 						   struct rpmsg_channel_info *chinfo);
 
 static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
+	.quiesce_ept = virtio_rpmsg_quiesce_ept,
 	.destroy_ept = virtio_rpmsg_destroy_ept,
 	.send = virtio_rpmsg_send,
 	.sendto = virtio_rpmsg_sendto,
@@ -292,6 +294,15 @@ static struct rpmsg_endpoint *virtio_rpmsg_create_ept(struct rpmsg_device *rpdev
  * name service endpoint, which isn't bound to an rpmsg channel.
  * See also __rpmsg_create_ept().
  */
+static void virtio_rpmsg_quiesce_ept(struct rpmsg_endpoint *ept)
+{
+	/* make sure in-flight inbound messages won't invoke cb anymore */
+	mutex_lock(&ept->cb_lock);
+	ept->cb = NULL;
+	ept->flow_cb = NULL;
+	mutex_unlock(&ept->cb_lock);
+}
+
 static void
 __rpmsg_destroy_ept(struct virtproc_info *vrp, struct rpmsg_endpoint *ept)
 {
@@ -300,10 +311,7 @@ __rpmsg_destroy_ept(struct virtproc_info *vrp, struct rpmsg_endpoint *ept)
 	idr_remove(&vrp->endpoints, ept->addr);
 	mutex_unlock(&vrp->endpoints_lock);
 
-	/* make sure in-flight inbound messages won't invoke cb anymore */
-	mutex_lock(&ept->cb_lock);
-	ept->cb = NULL;
-	mutex_unlock(&ept->cb_lock);
+	virtio_rpmsg_quiesce_ept(ept);
 
 	kref_put(&ept->refcount, __ept_release);
 }
-- 
2.34.1

