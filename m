Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9813769E7
	for <linux-remoteproc@vger.kernel.org>; Tue,  8 Sep 2026 05:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845985; cv=none; b=DrhFglvx8BXUQOqJOgRu+eZQYM0gB01pQs4BwSHVOk+3ExezWe7OF1/7rtUUJdehPl6vMcoffXt5gSbfOdwrr3gLSVYM1zWApkDCd6df/5uziV/+wpCFvNqwaNKTTvK1urxAM0UqhP7ZrwF29fs9/FfsGxss1UwCUHmrdC3CSZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845985; c=relaxed/simple;
	bh=faRvsNO+3ng5yp7scD2ooEy+g3RDxAsErW36M1n5UGc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ccoD9hRlhNfMGVSgvPXetpgaJbCHtPgUmq/nL9dMjiWqimaHhfvmnvHeNASiGZJNf7sklS2AxAjU7z7BfOeYfjxYFIts6jFJguSmudS+2lHo174h94fsdK8K+sRYgC3IrFWm+oClFNjCnGOTCZbkAadG/JrrQrel76HCb9/pfbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3xFggSd; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3xFggSd"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49954b88fffso31118265e9.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 07 Sep 2026 22:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845979; x=1789450779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Ry5IsRI3u6+OA2QrlJEuTetR9sltFKry3tbM/33hEE=;
        b=m3xFggSdQQMBIZKvFKAVdG3FM6JbMZdD5AVitmU25Sw/nIYzpGh1jHuCl3u2qGnSX5
         wbtEyT9jpSW+bzep6HhLaFnJGg+uDwbTI4v3MFZuRwitHS179JMx27LRgxfUmzjeuh8u
         +PpXBYa0itQd4NkhxDzXKxEzcT7QpViN3cEn/UOjBjcS2hFhiMH0xf/H6FLLVfK2etrL
         +6kvJ15Pc2chJKXRTmHAZtnE2V1p6uhYPT4S5n3usGkcuIoLmnyT7BS7Oec6UosEJoNm
         qopxOEO/xlQyz0VI7aZSKdbbY4XX2t+2jeEWcqHt4j5goH0tv34Gaml7bxbJSjE4beak
         mg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845979; x=1789450779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Ry5IsRI3u6+OA2QrlJEuTetR9sltFKry3tbM/33hEE=;
        b=aJKI/XhHmoUqcU3ECMzb/KT3YIRTLybMzc5Oq+ig6dXmLkMynm+27/NdHbRNBa3pCw
         dDK2zmUPHD7bklWM6SZxzAeb8Mba2RRZ7Ni78bzMlLEWpxluo/0ZdhjHYZM7BJCFqwbT
         ZQOl8sFCfIX8uOqerrNOrOfgmpGl3KMxea95nSDDDs/6OALSjcqR1yXnXeqU9KfR2GKQ
         buSujZfG2lQ79f3TybWMJs3y87yM2jOC9TApL1fOA80ME//JG4xHF6h//jo94YPbH+M/
         QBM6vx8TEWXOu/YDmZkSStNHf/zHMYDd9a3wp+J1vkz3v6ln4A7tLzxhBA80k+PEAirq
         +60A==
X-Forwarded-Encrypted: i=1; AKwUvBz1MYqD83/fsZFwGdmVWc+uW8NEIm6UdKpJUmx3Z+ShsbKwy+p6GU6Ne+XNBI+59Ssukg2ILxC7S1C08e8HJght@vger.kernel.org
X-Gm-Message-State: AFuF++kQqMUdV3BEFpSaIxJDqftoYLri61Gc05ZCjhCNbfT0/8usCUB6
	XzSA5JwI6UTx6nm/rDCmwK/7HM452WRstb8V8aapsP8l7BLckRSuUYbT
X-Gm-Gg: AYBFou3pugsTKJo7mUU0fxIcb69vrnI1zL6sTkCJ6LPpWi7cptEFwhXf5K7OYVOTMp/
	v9Uq9SWEbbdUmdlg5qfKXCmOqeFlHdtQBzBEYVJMaM+o+DdvthNYhW9/EGyQcweHpKUxZwymrvT
	Df5r/F5Wy+RsPoRWlUZTxCjxKE9QzL0tlCeBbyzRsaw+9isfGX4z57Es3oXzyy+NYvXzUJHhz1x
	fRafVNxGTxZWu11FSI9SCwvEiiZn2vJ9rhCS+kkIlS30MbbKdItJW5Q/Sd2aG41YokPa7+BTIsU
	wEa4U+8g18p2neI6iCVKaV0o3VKPUZkMIlp3sWhI6jfZp7Zqbb1pwiYZnRi3IU+n9YzFvBlYTNV
	1aRQPX+of0erI6urN5B1WKZAW9j4UkPh2SbgDWGlMKqnUGdtSVbq3neI26j68ELB7Ut1vsEFk5Q
	0eU/bHm9+KwUYfMBzo1n04IRLAvr9jJDxtJ48RdW+KolWljNcDYipYNI1f2EA8Vo7/NuLLE+1BM
	Ei0vI5iNveqQ8sFiqxK/2nhtqqtjSUVOj4pNYVmRYjumWBVuPw+CmjHI/uuALEaFNlVw9m3qNWu
	iKR8gmwzgVb8uqIMIiFLDG2V+N00Mq/yKrot2BRDfA==
X-Received: by 2002:a05:600c:6748:b0:49c:fc6c:bdfa with SMTP id 5b1f17b1804b1-49cfc6cbfa2mr234336305e9.17.1788845978942;
        Mon, 07 Sep 2026 22:39:38 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-170-066.95.117.pool.telefonica.de. [95.117.170.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7fec25sm523841335e9.13.2026.09.07.22.39.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 22:39:38 -0700 (PDT)
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
Subject: [PATCH v3 1/6] virtio_ccw: fix synchronize_cbs() after interrupt fallback
Date: Tue,  8 Sep 2026 07:38:12 +0200
Message-Id: <20260908053817.26065-2-kmehltretter@gmail.com>
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

virtio_ccw_synchronize_cbs() assumes the device uses adapter interrupts
when vcdev->airq_info is not NULL. If registering adapter indicators
fails, virtio_ccw_find_vqs() falls back to classic interrupts but can
leave airq_info set.

With VIRTIO_HARDEN_NOTIFICATION enabled,
virtio_ccw_int_handler() invokes callbacks under vcdev->irq_lock.
synchronize_cbs() instead takes the indicator area lock, so it does
not synchronize with those callbacks.

Use vcdev->is_thinint, which the fallback clears, to select the lock.
Keep the airq_info check because is_thinint can be set before the
first find_vqs() call, when airq_info is still NULL.

Fixes: 3a232277c1ac ("virtio-ccw: implement synchronize_cbs()")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/s390/virtio/virtio_ccw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
index bab6cad3fd5c..b90299205698 100644
--- a/drivers/s390/virtio/virtio_ccw.c
+++ b/drivers/s390/virtio/virtio_ccw.c
@@ -1062,7 +1062,7 @@ static void virtio_ccw_synchronize_cbs(struct virtio_device *vdev)
 	struct virtio_ccw_device *vcdev = to_vc_device(vdev);
 	struct airq_info *info = vcdev->airq_info;
 
-	if (info) {
+	if (vcdev->is_thinint && info) {
 		/*
 		 * This device uses adapter interrupts: synchronize with
 		 * vring_interrupt() called by virtio_airq_handler()
-- 
2.39.5 (Apple Git-154)
