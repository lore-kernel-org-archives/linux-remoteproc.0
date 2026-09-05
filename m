Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB9A3793B1
	for <linux-remoteproc@vger.kernel.org>; Sat,  5 Sep 2026 15:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788621686; cv=none; b=sT0/dyp+CwNGIhfo0/upadmdfp7wPFZdFUZLK5c4EQzLNbzbA6PQj9sm2Y/6VeklRTdtBWlSvK0W//hm28IzdOU3VQTtyZ+fJyFo4hJxrEpddxNutSp4yN6V6iJB5vXRSTo3kKpJ1P/kg9Pl9nSN5t/r7CLCq1SrQbzwbT5RxFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788621686; c=relaxed/simple;
	bh=eXG5r4mV6mtliuq56rwsHZv1ZiQbQWPta1t7fNcCzjM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MJ7JH+gB1Dbi+zn2MmF5DOvv3kAsbKbrTNPtOB41Ma5Jg9ouXRNsHLO4mr5H4kx3lUdKKM4G2cElAaDxCut+50f1EIoyzt/4k2JWs5UQGz6waXanGWlf+ZpSoUFqBBtdE64hdpqd16XLOc1GPTJaLIvJoos/94/g1iwNQKT+ijM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKwDBaR+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKwDBaR+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-495590dde14so28351445e9.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 05 Sep 2026 08:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788621679; x=1789226479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2bLrkBK78EZ1kRlLHpZelHwP/1fERAUtU0NobzNbNE=;
        b=KKwDBaR+xVoJNuPew2OPxzm00SvEId9Hgpcslag6yAa1f+7i34VUFHTw5Z5mpCZYF2
         00KfOp+vgRP5EYe/z6D4Myq+2L2nZAWMygqyMpDtcMMDUaqZ/rjDsQg2xTyRV7OwzplS
         EL140uDju05eBMwgpSzR5x4sqtSDz/kxs282bJX1sUWzdt/Z1t0oHjy3AHOsDZiF+GjS
         QzQe4t0iW/YjAwBQm3zoEDNIEaO9B8LFs3uSLVKq9aQtZ1zr0WkYNz5jYdONYF+BkkAZ
         SuxVrZZSE9yvdy4zeudQ+xYJxtSlhu8pqC3bjoh16ZiZ1YNSlYswHhHQkydbdi8NmiiC
         lGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788621679; x=1789226479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z2bLrkBK78EZ1kRlLHpZelHwP/1fERAUtU0NobzNbNE=;
        b=MEvUGfoKI6x7NokuqpT82M+g/77vU4QC3oLaA8sWTPNoq4HIpir+5BcJ1BJPpfQOY0
         XVVxUJJmLA/g5HO5LddNCL3P7obr8GDJrGaibTVhZycZ1WflVuDHzXBNTeC2bHrdLhiy
         +DyfSdGjPy/nw5F9K6iTpWkW+GPZ6wMx7oe/KFs5XGEAS61IleV5aG/IbgUrEe00fAim
         zMZ+UeB7TksQjoPB/WtJHR6auUC03/Cj7+NC3QfsRPO4tEbHHenyFukSxizt/NCHpjFD
         c4zLoQZzLQf0q7dwyixANxPBz+bpnOIeJlN3gZK8mLXJQ54cvt/IPiafSGztEE9szMLN
         E99A==
X-Forwarded-Encrypted: i=1; AKwUvByitzYlrxNRSBSJ6HGYaibJZGGCPSYTUuewMQ1wflPgIQOMaebilyv8W+sh4TEao3hM6wLrCfuU6kL/ezC7jB30@vger.kernel.org
X-Gm-Message-State: AFuF++lVQMR+plU9uUG6KsYNjBSfTnKajuWjtKHisKEw4yyAs/0lF8c9
	jN/J2sfobDdxhIU8Ic0eIEXUXqzvRlqRIXWWRDAqaM5Y2348PihXb56R
X-Gm-Gg: AYBFou0Q5z/sfgabQ/PaQ3S4VXZfTcWdoen9osefHKyalfBNhaDCYaSIP3hPlvymZ6Z
	A2fGB73DU3PVxmz8WuEvGEu83TthLc6iteO68Q/WjinW9h5vSQ3ZpXJwEVqbqctQcpN/eMmGSB1
	1VdiOnmTxETN5wTnm65ZGB4K8EJqsxOYZZ7xr846Rw4c7VgTTUwPDYFo5nxB9r1gELCmTUuUzGc
	MOA+wrk1RdBBxhHqIIto14+nkhaowGihgCSqFsaucKCNsbmcy2gEtsSrbLj2hoXwE+sPUYuWfvd
	iFEpiRClKIB3Ach45K7HEfx3SbymFqoA4B5xcUPqokk8w6Ioe7zij0yC8UJ9RD/8MDHZML/1w/A
	2HN90AtcMjR6GQi6XqS/kKKNFp5/utiIItYOGP411WBQ8CAtko8UbJoFzelcgnDhZqH+Dom4QPg
	Df3meiSaq2zrsfrae/jyL5oiWL94T/yO7hXUypBVrwiuVM8rBFCcurfH2KK2dXW971RaeqRFrRX
	WF5sO3EyTTf39D9UnbUGDX5pAH7ZxfcbDwYE3QSxQWX/OFxTyngR25YdAcMhkaerqPJhYkY/BAp
	dSKhKx15bi0xe13EmwdI/QrwTZMNReQMYA7sJhRPa29mZRXH2a2aEBBDlby1OP7kAng=
X-Received: by 2002:a05:600c:64c8:b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-49cf81f692bmr245105885e9.7.1788621678914;
        Sat, 05 Sep 2026 08:21:18 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm267779515e9.1.2026.09.05.08.21.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 08:21:18 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Pawel Moll <pawel.moll@arm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	virtualization@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-s390@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-um@lists.infradead.org,
	platform-driver-x86@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] virtio_input: stop callbacks before unregistering input device
Date: Sat,  5 Sep 2026 17:20:58 +0200
Message-Id: <20260905152059.89560-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905152059.89560-1-kmehltretter@gmail.com>
References: <20260905152059.89560-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virtinput_remove() unregisters the input device before resetting the
virtio device. virtinput_recv_events() drops vi->lock around input_event(),
so clearing vi->ready does not stop a callback that passed the entry check.
It can still use vi->idev, requeue buffers and kick the queue.

Reset first, as virtinput_freeze() already does. With the preceding core
change, reset waits for callbacks before input_unregister_device() can
free vi->idev. Recheck vi->ready after taking the lock again: keep draining
completed events so an input packet is not truncated, but stop requeueing
buffers and kicking the queue.

With evdev attached, input_unregister_handle() currently waits for an RCU
grace period, which also waits out IRQ callbacks. This masks the lifetime
bug on PCI and MMIO, but does not protect sleepable callbacks on other
transports.

Fixes: 271c865161c5 ("Add virtio-input driver.")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/virtio/virtio_input.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio_input.c b/drivers/virtio/virtio_input.c
index deec24e8e682..7b654af0a42c 100644
--- a/drivers/virtio/virtio_input.c
+++ b/drivers/virtio/virtio_input.c
@@ -49,9 +49,12 @@ static void virtinput_recv_events(struct virtqueue *vq)
 				    le16_to_cpu(event->code),
 				    le32_to_cpu(event->value));
 			spin_lock_irqsave(&vi->lock, flags);
+			if (!vi->ready)
+				continue;
 			virtinput_queue_evtbuf(vi, event);
 		}
-		virtqueue_kick(vq);
+		if (vi->ready)
+			virtqueue_kick(vq);
 	}
 	spin_unlock_irqrestore(&vi->lock, flags);
 }
@@ -350,8 +353,9 @@ static void virtinput_remove(struct virtio_device *vdev)
 	vi->ready = false;
 	spin_unlock_irqrestore(&vi->lock, flags);
 
-	input_unregister_device(vi->idev);
+	/* Callbacks use vi->idev. */
 	virtio_reset_device(vdev);
+	input_unregister_device(vi->idev);
 	while ((buf = virtqueue_detach_unused_buf(vi->sts)) != NULL)
 		kfree(buf);
 	vdev->config->del_vqs(vdev);
-- 
2.39.5 (Apple Git-154)
