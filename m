Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418199;
	b=DmBxYvOzyox3gdJ1VpwfFviNvFYTRG4wkoJgRdsqi85N24zWPX9Hr0XtTqT2YcZg6+Hz
	 cBF2zHDZytZUu/3deGRNGyER1yjLVQNv4MrhGpwgdVcnd58R1lN9CGa1+1MZSw3VUJgIT
	 fodpAsgsuUk8miDHGrHerzi+iiWpGJ1N7DHjOKcsMroc4tAhzeW3IcZq3u5r4r3vg1wd4
	 giOIIVPZDlaxQ2J8nnFt/mMAZa42jVbhrJJHHKRfhcLNaeEJyr7exnjH34Tr6z70PoHc4
	 RijLAG0j+BDL+nyxVIEST7tALPB/VVDyBNERFgocNfjy8WvJDIaEATV+aVjG7+JkQyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hWVnipVnpqlmDrtqQEQzI1nIW+peyVDfq10bD9YNiNU=;
	b=nSFrZzYD1MHXLRyJLzjKo928iIhhlhcgYKVDRRxpEH/OGZdRYGkQOYLDsvjOjcJP3RYZ
	 Y5PJpZ7c6uRqQBRHiMghUb64vAlZVOnMD6glgdcjpNgM97RljNfUNulPNItn+lgGE4853
	 hgCKIa3EXzs0ELIvWC8039HM/rrBgjM1lNW1xwxQZvAZC0lfCmeApdmp//q+ZuwpY/4fo
	 kN6bEnlg04I6K2CYvPTX4zm1FJWcNjvppbuko+HevEiCvXusoxpBFjZZCEruDwujJBiif
	 5XASo/hmXO10+o+tVY5YmN78/e/cETnqvMgmf2xja+c5oug5vId3N43dRhACB1Eqy7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vJF4jtNG;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EF2606A332
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Nov 2026 17:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69EF2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vJF4jtNG
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a215e64962so38279045e9.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 11 Nov 2026 09:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794418198; x=1795022998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hWVnipVnpqlmDrtqQEQzI1nIW+peyVDfq10bD9YNiNU=;
        b=vJF4jtNG9ztldXnWy3XgVGfj+s8YQWsZfHIbDvGy3dQTi4BzCXol6j5PdIf2vBtn6H
         KFPM/yBRMuMATvpT4o8vfjAA3dRLviT6V3rUeKVqQLr1QzGdQxaMsr7yOdeKqxAJ9JWt
         P0JZOqZ215Fz6ewfN4NoxLkSsXrXO4h67rIPbmljO3oqJ0RP/G7KpOa0SVIF4wvbrFMz
         tUtwSW/vX3vrEGUWk3YXtqgcsHe+n/aeYRg71fYJAsmY1fLX/Zo9YyV3+Phidn6Q3HMD
         SGPMSeUfi+KrkrweDZ9Lp/Taepi4lWEM+gxq5gJuGWJ5e9LY8qpDAZ6kBWX259kau+/W
         HZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418198; x=1795022998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hWVnipVnpqlmDrtqQEQzI1nIW+peyVDfq10bD9YNiNU=;
        b=oMe7LssRr3LbXkvT/wBBOgPgl5Ba4bJ1WFleukYuy1w76XJ3h/qWku8tGmqNIPFUxR
         qQ/Cqpdv+4tLE3AXEnIdPRO5wEMudkx3BX37uCcQ1aXYzNdeoWT7cFn0Op3h3b3h8++4
         OE7sR7YtXk74Bku8emrsOJF1LNQBahRj3PbbLbPBD/GUQgYzESSZJIxlfrzRt7q+hFFY
         4u3WCWTZNxM6qyO4K2c/dKpyGn24wyowlwVUik0Zfy4SuVeOHtXBFwgltMywhR74TjdE
         gdJppcesULzCX7Auh+6YHq5i4KAVZqVBg38iR8LWXbfLPfVG1bAVkV253f33Gypk7Nxe
         XWpg==
X-Forwarded-Encrypted: i=1; AL+hErFxVIidDMFpZESEBcBqqlZK6/WQ0q4CIhH5IN1QCxnLxa5qEa8b76BxodRtbXE7OS6eZ6tTFIovyEu536SnNmzM@vger.kernel.org
X-Gm-Message-State: APuU4Z/zZkOUQBYJO4gPhzS0w7824DN3kqNh0gAR0xedNvlxebmtTjwQ
	CCbEXSIxhjU8r/S0kFYSDSzpyY0tZvCZpxNuGFIsvU3HbYNcQNn0nIcZ
X-Gm-Gg: AYBFou31Msm4f+CT3Y69Z/00ZtTCG4pshFQwdXrH3KlEpVQFYuX7tLADlk5jAjC7Oe3
	qPCt7QcVsSatEX5tM1jBbkbjaYhXL/ateIOtqUI4WZMPGpEXA5m70XklQEPptMCezivibty+MXK
	v07MVaoDHNUbbLeyTsG2je+TDJyaJ6GF3qGj+69CdBsvT9H9AOWpBUhsYwmjsRyj40GO11IT6g1
	HItWSW/fp61K6Ng/2wgHp51hnEMwgYNTxsdC2ACgoRiL9usHi7QpZG8cys/zHQplGHisFflyLgo
	G00Z9056GFLGDGLQRE/PI+iNYiCfgl8UQyKpwXCEj+lTUQPpuAhhGLtaAJ1Di9ylqKeDsMUMrxg
	XQHgOtXpUQsnpime8FxpevClfusB4EVtB1xn8dmKcn8Yc6xDZDx4S9HsAzmjZPb2dIAf/ntlpAk
	pTrKqXZRmr4Ae1B7EI2l4idJjyG+de3XMEoZIyRQU/fxACtV2i4gjvgknI5gV8z5vqvKCdhMrta
	aryHcZlbLz9ega2xP2YHWHUn9gLgo1ilqOl38ewX2ivNyJ1SLrgomQveuox/BCrp1kIZ7mQ3+jt
	P8zg2JQOk1l+Oav4oGlQrIIhEntndWvL9WmW8jYsn3yAfl3gyesDeVTyRx1VPfxJmYRg0oKd/9z
	H
X-Received: by 2002:a05:600c:4e45:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4ba0936efc4mr61545245e9.14.1794418197595;
        Wed, 11 Nov 2026 09:29:57 -0800 (PST)
Received: from stjepan-Aspire-F5-573G.tailc0f20e.ts.net ([2a00:1bb8:118:d39e:d655:6a9b:5ab8:7f68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e26700fsm3134525e9.10.2026.11.11.09.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:29:57 -0800 (PST)
From: Stjepan Poljak <stjepan.poljak@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andy Lutomirski <luto@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	virtualization@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] virtio_ring: reject a split ring size that is not a power of two again
Date: Wed, 11 Nov 2026 18:29:37 +0100
Message-ID: <20261111172947.3579982-2-stjepan.poljak@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111172947.3579982-1-stjepan.poljak@gmail.com>
References: <20261111172947.3579982-1-stjepan.poljak@gmail.com>
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

The split ring indexes its avail and used rings with num - 1 as a mask,
so its size must be a power of two. Commit 2a2d1382fe9d ("virtio: Add
improved queue allocation API") moved that check from
vring_new_virtqueue() into the new allocation path, which
vring_new_virtqueue() does not use.

remoteproc calls vring_new_virtqueue() with a ring size from the
firmware, checked only to be non-zero. With 100 entries, for example,
the driver would put buffers 4 and 8 in avail slot 0. The device would
look for them at slots 4 and 8, possibly reading the wrong data.

Put the check back for the split ring; the packed ring has no such
restriction.

Fixes: 2a2d1382fe9d ("virtio: Add improved queue allocation API")
Signed-off-by: Stjepan Poljak <stjepan.poljak@gmail.com>
---
remoteproc still reports this as -ENOMEM, although the "Bad virtqueue
length" warning names the cause. Returning an error pointer from
vring_new_virtqueue() is left for later; the same change for
vring_create_virtqueue() is here:
https://lore.kernel.org/r/20261106055635.3019889-1-stjepan.poljak@gmail.com
---
 drivers/virtio/virtio_ring.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index f683a2d6a200..8da9bd0e70f4 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -3513,6 +3513,12 @@ struct virtqueue *vring_new_virtqueue(unsigned int index,
 						    name, map);
 	}
 
+	/* The split ring indexes its rings with num - 1 as a mask. */
+	if (!is_power_of_2(num)) {
+		dev_warn(&vdev->dev, "Bad virtqueue length %u\n", num);
+		return NULL;
+	}
+
 	vring_init(&vring_split.vring, num, pages, vring_align);
 	return __vring_new_virtqueue_split(index, &vring_split, vdev, weak_barriers,
 				     context, notify, callback, name,

base-commit: 1a577f9402c1780cc1e663f48d5dd54c02051b09
-- 
2.53.0

