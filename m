Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC0037F727
	for <linux-remoteproc@vger.kernel.org>; Tue,  8 Sep 2026 05:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845994; cv=none; b=Oa3feIspxCjjIAP+MwnJInC6KPFlMsx1rvTREaSddXEVdBCPLodbDm0BAclqAM3URP3pKt0od6FRYpyFs0XxLMcL1Y3f56hZyQ9MKXaRXbiI9xeMM6ehwilg9lLGF+lbRo4QUXnC2uJ86hytjYpSyIRbMy6SBPHWMuDljiJmpjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845994; c=relaxed/simple;
	bh=Z1mqy3qNtdRxgKwEWqMkljOG1k4ekHUKiS2/6Ca17Yo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZJyOx2OwQTsHHrQ+7X8hICTOcyseKhsmbYbsDsWk9Cb6Q5X7GaAOtwV+0XviX8taKc/S2UKHaBgoTSiT/2phMGEodTkv64+HLPsYyiUxoYawdqBTpznvehVZj0yJHxSKbZSGTQ6R/FqOP2YEJNpxYRM93c2/lUYuzDhmFLvHa+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmjpCI8s; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmjpCI8s"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4956869750eso37502535e9.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 07 Sep 2026 22:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845988; x=1789450788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0UrpxibHZnDBNXE1bN5qrJqc7sTw2Bd+aGpZLtd0Ug=;
        b=UmjpCI8s7t3E+4yRhKMceIDOKBrqYNOKBZjVaryoL+Wx8/5meM4sQ9XpZurZfH3zlS
         fm9dPFfnx8NWhVMpEnO10cGpwzMYuIbKyGY2YuHQfXYqFDhg6uepkDSAbaDSU9HEDtlu
         MwjTnuF26Niwb9CNviqGtmx4WwjStW+BJ1nPjnxMHE5c1ZoVPpi7WYhT0dm2ReieAxbi
         CEV1OpQOMg3cbWpcFghWbSrBG5sOmvQMxBpbpHBVK0haUEZzsGRlCb+OqTdIr9oBGio4
         6sDz2wkoyVcw+4UAETBV79kQRFAvgWv6+QUPewowi4qDn3CuhbBW78rMGb81BCHJCwo1
         IlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845988; x=1789450788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l0UrpxibHZnDBNXE1bN5qrJqc7sTw2Bd+aGpZLtd0Ug=;
        b=n88qnR2Ru3XVMPRIyNDUT11OuSwcJc1+9ZzT4YHXLwTH8TYTMlkPmXFz2B+ImUcbSH
         mvX8b6jbs9SD4LSjK5I055mrC6nO/Wj2e6/b2olPxSivXG7lrNkZxlK2dGL9Y5u6Se/j
         /KdASg8pbddvVdXVWoQ78s/MViSSkBk9aTmJjt4GDBD4YjhfyLCSfRpMr/oExUH4NwCr
         YN9CC1wqSJQK/0sXQ5O7V5DABqy1apD7p3f5xZz+97nqV+W5exMmkOBtcy8baxeLaDYP
         1JdRbjyzNnhXSKjfk8CgPegdm3wsKjiZ85/UlQ1HlbtRIxONvw2Lx10TSSzpHcI6Vz+i
         zRbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCoH8Zj9dbg0U79NEIjUJ0wycYx2xUyeAksDnvYadD3FP6s7Y02V4xaLoYvTW0iqa2ZMLkFUNduIA99aZKdEU8@vger.kernel.org
X-Gm-Message-State: AFuF++lyGb32Gdp7XLJ30Gk7LA1vEAhZ3rrCWqkD/POdtBOVTsY57YJp
	NyMWrZzKFaSJCEE4+wTumRNiPrig3n85C7/SBZuQcEsnbVX7SbMZ/ns8
X-Gm-Gg: AYBFou1erkMKQqCeSOW/RZh8CVHXUo/uHqYw2ytxC29Wf4Gap+g0lrLz962j+HUnkLi
	eglqO7tTN6uNyghrtxJB62xnpAQJUgmQE7EE3afYNNCt+y7N3Wg4boUhOm1QuGSRlkKOGn9ypWI
	Vs4z+IVeVso/KedaYMCVXussky4Og4w+fCeHsGNRdLQEbZc5Z8its11teanFCtjZoCAPuFRDChx
	KVZ8cjxkSwmOp4TXrUSx7urANvo7owwhOuKqK6CQU6ZalX3q8YkPJ4+ZB5CXE6FLDuD387DoUod
	jP6J6x5au34BpJC5HefjpOCHvEaWuwoBLXAGdcobejyUlnw/UpvT3P3SxgI/wG7OGX6T9F+2Q6w
	mtJ3ydYIf6FYZzhazHSAckMgOT0XryIXfxnL4WW1a1zB2ACgKEnqq/KJjBjbbGba8pmuvIEl/oo
	UcCEa346A1uiLxgR+6XS9Zfj/HUIY8LUG2tZLMhtTOQmxh+/o3Eh9wldItPkfY2LjB5UXoCwKrL
	CYcqSuW69/PyCpjqYzJmM/PoBsUuk3uRGioNcoSweaIHXupHq8lxt7A+NpCjrbBOr2cQZMRSN2/
	U6UVAFHRdHRmP03C7qsgu6lfOrOYrz0=
X-Received: by 2002:a05:600c:3587:b0:49d:17d8:abec with SMTP id 5b1f17b1804b1-49d17d8abf5mr31972855e9.21.1788845987998;
        Mon, 07 Sep 2026 22:39:47 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-170-066.95.117.pool.telefonica.de. [95.117.170.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7fec25sm523841335e9.13.2026.09.07.22.39.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 22:39:47 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
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
	linux-kernel@vger.kernel.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>
Subject: [PATCH v3 6/6] virtio_vdpa: implement synchronize_cbs()
Date: Tue,  8 Sep 2026 07:38:17 +0200
Message-Id: <20260908053817.26065-7-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260908053817.26065-1-kmehltretter@gmail.com>
References: <20260908053817.26065-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virtio_vdpa relies on the core's synchronize_rcu() fallback for callback
synchronization. That covers IRQ handlers and sections with interrupts,
preemption or bottom halves disabled. virtio_vdpa does not enforce any
of those contexts when a vDPA driver invokes a callback.

Add an SRCU domain per device and enter it around the virtqueue and
config callbacks. Implement synchronize_cbs() with synchronize_srcu()
so it covers the callbacks regardless of the calling context.

SRCU uses per-CPU reader accounting, avoiding a single callback lock
shared by all queues. Cover the config callback too, as virtio-pci
does for its config vector.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/virtio/virtio_vdpa.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/virtio/virtio_vdpa.c b/drivers/virtio/virtio_vdpa.c
index 6bcf4567a929..f9559b6b2e0b 100644
--- a/drivers/virtio/virtio_vdpa.c
+++ b/drivers/virtio/virtio_vdpa.c
@@ -12,6 +12,7 @@
 #include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
+#include <linux/srcu.h>
 #include <linux/uuid.h>
 #include <linux/group_cpus.h>
 #include <linux/virtio.h>
@@ -27,6 +28,7 @@
 struct virtio_vdpa_device {
 	struct virtio_device vdev;
 	struct vdpa_device *vdpa;
+	struct srcu_struct cb_srcu;
 	u64 features;
 };
 
@@ -114,8 +116,11 @@ static bool virtio_vdpa_notify_with_data(struct virtqueue *vq)
 static irqreturn_t virtio_vdpa_config_cb(void *private)
 {
 	struct virtio_vdpa_device *vd_dev = private;
+	int idx;
 
+	idx = srcu_read_lock(&vd_dev->cb_srcu);
 	virtio_config_changed(&vd_dev->vdev);
+	srcu_read_unlock(&vd_dev->cb_srcu, idx);
 
 	return IRQ_HANDLED;
 }
@@ -123,8 +128,22 @@ static irqreturn_t virtio_vdpa_config_cb(void *private)
 static irqreturn_t virtio_vdpa_virtqueue_cb(void *private)
 {
 	struct virtqueue *vq = private;
+	struct virtio_vdpa_device *vd_dev = to_virtio_vdpa_device(vq->vdev);
+	irqreturn_t ret;
+	int idx;
+
+	idx = srcu_read_lock(&vd_dev->cb_srcu);
+	ret = vring_interrupt(0, vq);
+	srcu_read_unlock(&vd_dev->cb_srcu, idx);
+
+	return ret;
+}
+
+static void virtio_vdpa_synchronize_cbs(struct virtio_device *vdev)
+{
+	struct virtio_vdpa_device *vd_dev = to_virtio_vdpa_device(vdev);
 
-	return vring_interrupt(0, vq);
+	synchronize_srcu(&vd_dev->cb_srcu);
 }
 
 static struct virtqueue *
@@ -440,6 +459,7 @@ static const struct virtio_config_ops virtio_vdpa_config_ops = {
 	.reset		= virtio_vdpa_reset,
 	.find_vqs	= virtio_vdpa_find_vqs,
 	.del_vqs	= virtio_vdpa_del_vqs,
+	.synchronize_cbs = virtio_vdpa_synchronize_cbs,
 	.get_features	= virtio_vdpa_get_features,
 	.finalize_features = virtio_vdpa_finalize_features,
 	.bus_name	= virtio_vdpa_bus_name,
@@ -454,6 +474,7 @@ static void virtio_vdpa_release_dev(struct device *_d)
 	struct virtio_vdpa_device *vd_dev =
 	       container_of(vdev, struct virtio_vdpa_device, vdev);
 
+	cleanup_srcu_struct(&vd_dev->cb_srcu);
 	kfree(vd_dev);
 }
 
@@ -467,6 +488,11 @@ static int virtio_vdpa_probe(struct vdpa_device *vdpa)
 	if (!vd_dev)
 		return -ENOMEM;
 
+	if (init_srcu_struct(&vd_dev->cb_srcu)) {
+		kfree(vd_dev);
+		return -ENOMEM;
+	}
+
 	vd_dev->vdev.dev.parent = vdpa->map ? &vdpa->dev :
 				  vdpa_get_map(vdpa).dma_dev;
 	vd_dev->vdev.dev.release = virtio_vdpa_release_dev;
@@ -489,10 +515,12 @@ static int virtio_vdpa_probe(struct vdpa_device *vdpa)
 	return 0;
 
 err:
-	if (reg_dev)
+	if (reg_dev) {
 		put_device(&vd_dev->vdev.dev);
-	else
+	} else {
+		cleanup_srcu_struct(&vd_dev->cb_srcu);
 		kfree(vd_dev);
+	}
 	return ret;
 }
 
-- 
2.39.5 (Apple Git-154)
