Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA76744F547
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 19:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790103726; cv=none; b=dOV7YeucV8LL830LWoX0f73yVKcFYVIccDkx4RUqJitPxzUrLHPk8RvVkqqgzA5FKAqH9HJ0KwGk1E8WeIJa9A97jtSjoOPRe3yflP+lYd9yjjw/N2f5y6EVrxCbFnGsa3sz8dz7L1BgP2I+OHFqsjCpnC0vjyfCc0CZeyk6wG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790103726; c=relaxed/simple;
	bh=fk5IGMlUmx2erYlv3iWAASgRYxopqVulZLvXRdcluOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c6XoGpbYQ3FWGf+EOkbo8zfaCdKQhb3SqMSECmMxtUGjKJc+wCiz0ImDjaM7BBncylGGxFVM2volv8QW4hpDQozJ57aIqh9IbExbBDUccwUZ5IdiTb1JGgnwmkM/RbVKRoduFkLIoWN7Svc8AUvrqEMqMz69o6MK1BAc4fDLnkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFEwd9VK; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFEwd9VK"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d4ddd179eso4284837b3.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 12:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790103724; x=1790708524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oJmvT8imiWD2jlinxDhTT/h6mjIMN5i048ei7lLYZQA=;
        b=TFEwd9VKPrL73sT5m6JEhYNkOkk9XRQ4+7gtO3ZIykPiwUrRhTLV8H7WGlsGsgazrn
         OWz3oRYSetUJMD5WKrAZVAGmMoZiz2DKsF5xsUaB6FkBHDXRgq5iiyXY60f4DFmh1EpJ
         0jeVMM8AvUo50lYAw7xVG874Tv2Nh05YNHDj4T0WT9ETr/OH66UeZXTPKbCe59gNfK2Y
         HtSh3Lt62qzi2YYb+wjUs7K0TSybCZu5Z9lc1CHobFX0TwSm2/A9bhU96iV7RNRZu8Mb
         wnLxnweYka7W9pkS6QHxTYsxGLkPtd+3LzDLGAHmF+ucz4BciI9pSk01xY/iGIX0rhaM
         9IBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790103724; x=1790708524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oJmvT8imiWD2jlinxDhTT/h6mjIMN5i048ei7lLYZQA=;
        b=SHJNZSITM0xcImqafmJmQhtkqB+BlEV4i5DJQx3qm7PHR30l1EL7hxcEa+XWEAdps0
         1Iw5NJs2rFqH/27xYkoi4yVfEMb4ebwTg5b+ClMjw2YR/v3E75vq+WUQn0xvGprMDwvD
         h5NnlKOQfiKLUzjUIZH2iC4xbrBEVKTo6BQst/2EfJXPau64GSx5Fbaced/nWRYc5Owm
         vp8Hk3atG4YQPmLhNTK0loLuKqQNK3Jf6FvmXSpiK9STdoTfFB92+wSeKGiznhDErki2
         bFmNw5OI7K46jvRWGiO5/TNyLDDVVOkVCld/MkF9mVo6Kx1Bp4hf+H2ctlOPWcSoq5B7
         MP7g==
X-Gm-Message-State: AFuF++mgxvdm+Q5oJ7zVxaK9uhD0ucudse74NP1Pg9QzLEaRdcKCm7LR
	SAS6WDPY9xoGNLIXMKMAf+P5DxWgDAe75OCWitr6+dbcT4hMv7A5uth5
X-Gm-Gg: AYBFou1JzGJgF9MUtgvI2v9IIjuJIdaSPlXKOh/rUFWBVKZQZILejH0PuXL+T6Gb6rV
	QBEQoHAhxGkHN5DOE4BGfKrHxVLHIC4VmKjaaI6X1Innjqz/ttEecHYqsoWygFZm7SeyOnSBiVY
	WUCAN8LkSFwfRZF5J95e6ye/g5F6eA82/2kmoK1luyFFF+CQb4zt9kLud6YD0qkZ2Yb2rIngG9n
	KLeBf+1ScS3Pknkaw+CDBXAfasV5kEXYJOT0yRyxuHRrUtpLzrHIUWGuWm5en/R+J6tdwj4ZoF1
	GSvBxqsfrT81fKyXVIXZhYtlVl4JNOSY82pFYEFJijznkZ2O7PuoflrPZ3w8EErWqflVkEemwrB
	Hs4KnHWx6psYwGGFsj3cEZIuIowhe7MGongH1jS5UiqquscSRQeVZG2+Hg8XiLL8ipzPqBBQksJ
	ljI5dGjvwbC699h5sZX+i8XdkO3jp4UvAn078Xs0XPBmDQJakiW8IMFblU6TSTy7s9+TcmUYVnM
	29hg5+QILYvW09WRpmf0A==
X-Received: by 2002:a05:690c:f15:b0:87d:b776:c659 with SMTP id 00721157ae682-8a457891193mr4457297b3.11.1790103723656;
        Tue, 22 Sep 2026 12:02:03 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb1e0196sm3449891cf.10.2026.09.22.12.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 12:02:03 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] remoteproc: virtio: Load rvring->vq once in rproc_vq_interrupt()
Date: Tue, 22 Sep 2026 15:01:40 -0400
Message-ID: <20260922190159.509836-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rproc_vq_interrupt() loads rvring->vq twice: once to test it for NULL and
once to pass it to vring_interrupt().  __rproc_virtio_del_vqs() clears the
same field, so the second load can return NULL after the first one has
passed the test, and vring_interrupt() dereferences its argument without
checking it.

Load the pointer once into a local variable and test that, and pair the
read with WRITE_ONCE() on the store that clears the field.

Fixes: 7a186941626d ("remoteproc: remove the single rpmsg vdev limitation")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Found by code review; compile-tested only.

 drivers/remoteproc/remoteproc_virtio.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index d5e9ff045a28a..fafd73e1368a0 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -89,14 +89,19 @@ static bool rproc_virtio_notify(struct virtqueue *vq)
 irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int notifyid)
 {
 	struct rproc_vring *rvring;
+	struct virtqueue *vq;
 
 	dev_dbg(&rproc->dev, "vq index %d is interrupted\n", notifyid);
 
 	rvring = idr_find(&rproc->notifyids, notifyid);
-	if (!rvring || !rvring->vq)
+	if (!rvring)
+		return IRQ_NONE;
+
+	vq = READ_ONCE(rvring->vq);
+	if (!vq)
 		return IRQ_NONE;
 
-	return vring_interrupt(0, rvring->vq);
+	return vring_interrupt(0, vq);
 }
 EXPORT_SYMBOL(rproc_vq_interrupt);
 
@@ -170,7 +175,7 @@ static void __rproc_virtio_del_vqs(struct virtio_device *vdev)
 
 	list_for_each_entry_safe(vq, n, &vdev->vqs, list) {
 		rvring = vq->priv;
-		rvring->vq = NULL;
+		WRITE_ONCE(rvring->vq, NULL);
 		vring_del_virtqueue(vq);
 	}
 }

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.43.0

