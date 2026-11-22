Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795379071;
	b=WYcZR0pfu0wTt2C1TZY1tChnNlzCyOc00fjmA75Xtr6GVIYJ+6u7lT7+AIpPSLoL93nG
	 EStM34eE6J7dNQUll/R/k3p5bc69GQtwfTEhma5VFcW2Qwuaf6KawcdqCGCk8/xJzKzUL
	 hkfRwiuLXehVnaZ76Hsn3RgHS40HusbvviV53eNhYi0UO/VDZ0bUQMgTwRM5TjImcAAch
	 KWOAW3asCErc76xqktgVZWCCpaQdd578z57K498PjGq0+lAdDXrsZfdDjht+2xvRoQGSY
	 QblBrTvdfIYOzc0w8cknHPc77j5z3KkVlwmGgUXp37oBjbhmEdOMUjeOQ3enBt64AwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795379071;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QDtrPBIcyFXQMdfj4Utd9u/jKBuoe/6ug2mrTDf+LUQ=;
	b=5sW/akKYTHYm1sBcdZ+O1/gPGDVQTL38Lf0wPvePXItun/xbFsClfou+gU8msOugUoVK
	 wMCIVp6cAuPPQ9A5YxpbJalObGo6WlSFWOQyMsX79x72qHd7jfJbbHo0yZyCsWH4T+Kz8
	 X4fN84qGs7GbTKCrMoWlKrriT7xaRfHcqTy9uMsENw1gHZzrZVj+R1bDVlPQD/jSLsXRN
	 gcvgKxdJhTmwhoepJ+sVHxwgJX4lTEcvo/LEhVg/RJtot+Rl0Hin+aV2v4eTTCk6Wb2BV
	 fmva8wnIlK3xTl8W4VFciZ/LTb5VSs/9LSqOwxGsSLuEJuih08ZUloBq5W9S7oLrJdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KDjvrmLd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA819606A334;
	Sun, 22 Nov 2026 20:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KDjvrmLd
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795379071;
	b=2OY9LNUGQSiPe3+gBKYwNLJdD7MUp3wn88Q4Q+x6wVtdorR5dEWUhQwL6BncOv/VBP76
	 Jnf+ZMfknDhN9P73X6iGgwOh8Ow6x+44i1VcmhwldipWAC74G1H8EJAIuPKmdiUdxMI1W
	 F0weXDo4CtfuRLzQCO6P7T8Tq9biqqBHWs7XZk+z32+vxWl32l14KvrxBnf9ugUZRyjuU
	 ghWmzXBJUWm3sXfJlYCDBGZw/gIRZlvSo3GYOT9L/jL3xfnTq1NgPviXnnsnWLC0OgBUz
	 vMewfJGcFUCisbDcjyP1GXa1gDN1piARUnMGczz4rTspEQ08/qQDcV6qPkk21Yf3P9g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795379071;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QDtrPBIcyFXQMdfj4Utd9u/jKBuoe/6ug2mrTDf+LUQ=;
	b=T1pF4L0zH4abuIOpsgtuYWe20bA7BjB8rVbHDI5YK9bQbpTIUbzvCTw7lcd2HlEyDY6t
	 UUFfWZ0J8Yz2xUB+nJe6KGWXS1Yvnp0LtXltwFRPDd7KIcXJd0drQ0trG+Yl1rYdQdWrW
	 Oqob+lVHuN9JYM+2tPDMkCWlliM1DKhncP3ud4gjHlMTdPmAaMxWDddDPmtRMN0mCSByj
	 7MHjfZikOWZfA2UZMNJFxmUCUmETibStG4U+pnubncsPxoDehczIngCETGhUblBvV2WdC
	 bZuZxd9WfLNaE5JMk8gDKqNIVu2I4QLqMdJPWl06pJgpQRwjLdBLFCqREHM/tUhNT+Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 784251F000D0;
	Sun, 22 Nov 2026 20:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795379071;
	bh=QDtrPBIcyFXQMdfj4Utd9u/jKBuoe/6ug2mrTDf+LUQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KDjvrmLd78L+muQkuNcBNdcsgrYOYuwYdU2bg3vL6dnyLDa7WG+IYOHV4tMExv1V6
	 KNCUnoKGmLe0sFOxUlwn1sYOYc8J/pwng6Bn4x/Nqa/phU2ceRTASpm4Iw3wCOCLxv
	 tlzxYd06CTZgFiKMfcL+8sdmKZnpJSs3/TrUexacQeBvZ5v+KQcb0lhKijs5KyYfgI
	 o1YxwfhDgWqo0WLfvj5hiwM6D6o/JGICjvgxSslYhlbd6ajjp3/G0FOZP3Gyvvzbxx
	 DF1/wrDGVX+w1SOCqGDIilQzadK7s8/0LhvYd4JOikJe9Jg6GmbYGDDft5EalZNRSy
	 R4yoKClKIdl0A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0A4B44C1F6;
	Sun, 22 Nov 2026 20:24:21 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 22 Nov 2026 21:24:19 +0100
Subject: [PATCH v2 2/2] rpmsg: char: Support waking up on endpoint rx
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-rpmsg-qcom-glink-v2-2-d60419793095@ixit.cz>
References: <20261122-rpmsg-qcom-glink-v2-0-d60419793095@ixit.cz>
In-Reply-To: <20261122-rpmsg-qcom-glink-v2-0-d60419793095@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Dylan Van Assche <git@dylanvanassche.be>, 
 Casey Connolly <casey.connolly@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1867; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=eIZGJEV5bvpHjBlQtn566xL+dxDC7tO9ywu0q8X1cHQ=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBrA09ysuizp1NKtYdtgBIsteeqYI5UrgT3HaQue
 IP+ojKIP5CJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCawNPcgAKCRBgAj/E00kg
 crObD/9zET8uD6rfp8sfJFqtGbV3/CcevOxnetsfGUZo3RHF24I6lulXMol7gNp6GETdPj/7+uh
 RZ3yCeOIID5XCnyNRbc87mtmPiBf33AC4jQv339fKgq2j8BVeea6NlGvx7e5874tvkTfRUy/KXJ
 Lvv65lH3cFe8Ho7MOpPX2bokJKVaGq7N9DGkqGUMkQPx8E2zmZUxkkhA6L9hnf7dff8obGIX7SQ
 xHSRok0FD3Uf6sYu/vMAi47qdF8F+W+GFXj7vA1EUbJtSFTVvZr05O0/hhsLSYDHW2zwt7d4Mn3
 BVJfMuyGDHoyMXIrRdKg4zlJ68Ts8mi1yLcU5SQI9BNg6mR/TZ/y0FoLDE7wUcXHpfm4lwMd+nW
 Iw4OedRlqSdfhUpQvDNgtxYozC+unhBFF3GK096OsDygeaMvFKFTJmeo/DiGhQpTJIYjwQhqB90
 ahbXpEr5v2yLNRmAS9CsFZjdqLL7lGH+QD7cJ2cBP+zmuUUAb0yhVIEF5vzkhN50JU4QJCsIjWe
 OF+apRKxBDtWjkOM0vbio7g5DM1NDXW83j3Xbgai1LeXn/l/Axrc+AkXAKUpxCghjc0jR47IgiE
 abdJhMSUXej45fI+5AnbyiMS50tro9bfkdpRRhQOO9XmLH0iQOSTAtOu68++GPk/mLRWlS8GjgF
 VejIIXG768DhhFw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

Configure rpmsg character endpoint devices (/dev/rpmsgX) as wakeup
capable and report a wakeup event when a message is received in
rpmsg_ept_cb().

This allows userspace to opt in to system wakeups per endpoint via
sysfs (/sys/class/rpmsg/rpmsgX/power/wakeup), covering dynamically
created endpoints opened through /dev/rpmsg_ctrlX across all rpmsg
transports without enabling wakeup by default.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/rpmsg/rpmsg_char.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index d8868faacdc3a..94307d1e0338b 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -119,16 +119,17 @@ static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
 	skb_put_data(skb, buf, len);
 
 	spin_lock(&eptdev->queue_lock);
 	skb_queue_tail(&eptdev->queue, skb);
 	spin_unlock(&eptdev->queue_lock);
 
 	/* wake up any blocking processes, waiting for new data */
 	wake_up_interruptible(&eptdev->readq);
+	pm_wakeup_hard_event(&eptdev->dev);
 
 	return 0;
 }
 
 static int rpmsg_ept_flow_cb(struct rpmsg_device *rpdev, void *priv, bool enable)
 {
 	struct rpmsg_eptdev *eptdev = priv;
 
@@ -446,16 +447,17 @@ static struct rpmsg_eptdev *rpmsg_chrdev_eptdev_alloc(struct rpmsg_device *rpdev
 	skb_queue_head_init(&eptdev->queue);
 	init_waitqueue_head(&eptdev->readq);
 
 	device_initialize(dev);
 	dev->class = &rpmsg_class;
 	dev->parent = parent;
 	dev->groups = rpmsg_eptdev_groups;
 	dev_set_drvdata(dev, eptdev);
+	device_set_wakeup_capable(dev, true);
 
 	cdev_init(&eptdev->cdev, &rpmsg_eptdev_fops);
 	eptdev->cdev.owner = THIS_MODULE;
 
 	return eptdev;
 }
 
 static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_channel_info chinfo)

-- 
2.55.0


