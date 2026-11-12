Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498583;
	b=pLH8S2rGaU5u1+1xdDJ8UJpMfZQfUqui0f8FrD2/D2eilPrOMOMJ1CwaU7qd/d7NmKKz
	 2uwmapy6VThBwBF4RxwixKUAW2WEcwze/k2FAk2BMmyZSzA7KHLCg4xEUvctflgQ+gY8d
	 dV8QtMDoY157vjdzk8yV8kU94fkkTZS4G2t3m9HPbtcSuCx1aZEx/hnY7PJhQ+hqJoWG+
	 jYvGqcq2G4qyofNPngmFHh9sdrvwA58n7cf+i8qZv7mrMhKgVEpfd6KEKeYUwBOe78VTA
	 YMIJQ73vcJFqDkpt0E+Z2NlsmbSxdnOcgaECu4Lmfy7h7WRYp+ufmZQAF1l56W7EA2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CxFoK2bKFif4r5nTuXcKQcoyXDPnIP5aTxYirQtgrTk=;
	b=M+pUibJTV6R37LbUHGvIjKgGqxMgsG2Nx/+7HS8L1B2rXYX0LBMToWkK8RWqQ8hJ32b/
	 5Dazk5B0shPArJI5SEZNqY7nuNls0GCFI9qWdOu6fZiIG66VgZDQi67Xrdh1rHGbVSRA0
	 gMhngwg2JPH1a6Un4A7Or+4hlSSUNNKRx0d6Jjj4oJ5TtKT7l53zq4d2C80HIGs42xRcr
	 lac4QS2Xu1aozDAirRaH55lM/rdVMfpN2rZIsKmPvYC9A6z73zM2dbetjXS3fx2tebf0X
	 WUIOY4sauTZP77LYpc/m/xeQY9w2MC9wPxZYwapBQWSgIXBCL45lhKj5gP42pQtllWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yfKRugOW;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74557606A8AD
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2026 15:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74557606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yfKRugOW
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so26450245e9.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2026 07:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794498581; x=1795103381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CxFoK2bKFif4r5nTuXcKQcoyXDPnIP5aTxYirQtgrTk=;
        b=yfKRugOWfcfaIv6xP1t5aR7F/giQtXW7S6EIguozBBemQNiM0fVWzVLqUK6OaXmQsF
         iDvbnC/g1w6KufcFXi893HkN9mtaOgotq3QlyHfkf6o/t/3iF9dNb07YxO/xYmqlUBfn
         gjupDXlhxlSTlL/KRv6AzN6mBWqrpWLIBu9nMF33r/gbWwnFIaMBjrkGT1SMrv80Fzv1
         NoBH55GLomb1ycxpKxTjRX2a8YAQv3vIc9oplTc0ji1+AXrDShpOuStMvwZA+ZAVr3lL
         AuQi6hjaYxQ49niKOUc3dUihin2HgykQeyo5tdVA4rURwYj+rJFKZm/9YL1qUcFhq7s+
         RS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794498581; x=1795103381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CxFoK2bKFif4r5nTuXcKQcoyXDPnIP5aTxYirQtgrTk=;
        b=SSnHdtYXzH9J97UuW1VqVHssGyBkW63TkAhZh0sXdpMTypdh+4t0czPcsoyGfVrsZd
         x9xR8f0FXKs7QVnmhXXFr7wbZFhJyPqyeBqJicfP6wWxyTcWjrlmuTxitwSBHCI89tj5
         MXSC+2DYzY1sobXCys2d3YsuaHiGPDxAvxwUbd2gPvMyEUW+lAvc9reIzNrZ0PHFcJAw
         y+nPXOzzmJ8zFkfj0QfrmvRAoYITUfZLPRoVAU1uZFUwLdfQDHdtynqd90b/kvLAdkAE
         6xMfhGozaZUcqkQgPs2eJ2Uw+6Z8c6YIG5OIvof0x7pYbnHxYkJkiPy/nxZN+REWk4Kg
         Ko1w==
X-Forwarded-Encrypted: i=1; AL+hErHldGl03dwNy/RGxdtzW+X4iEwHzCulsx/8ipDUURTRzOl0oDVn7TDJFc9r/I7qQdLNStcU/Iao4KKIZcuPejWK@vger.kernel.org
X-Gm-Message-State: APuU4Z/N5ABUvB3MYNpCEYOvdd8AOPzOjh85yHmg7kkG1uHIUZpCmxnZ
	jpf8WL1q21bBhHOue2qPf7CBXUT/DEjAPHH88/2oLUwfgFGlfuO79NRf
X-Gm-Gg: AYBFou0hvtPn0LohUJ/l5tosLMOSm/r0C2aYT/wJg1R3PUSVjnUmY0NlebdzNsPyVNa
	X9r4DWpA9kQ7hnMbNSXPj8BVAzUzHu4dLYtBqUYE3j1mI85iAgfGx5TG7w8+5E8KMDshAmR6HcK
	RUdWJ2NJHF/Mk4w6vsd3FN3AvEqn25A0R0aViJx5j/xXiDVC40sA179Q1R/H+5OHrmPa+htLFmh
	+f1/v/PNI7XKqzmObaY/z6cumUgi9OX3giKfWNeDV+trvs3i0tWPrD0HTya6o7NwuRl/is7+wVD
	2+jakEGIprQnzzrl1PELkNQcFkqJdFP+6b+cNef/IoQUAIwMw/daOnVm5AZb6yd5QaAgZcYc8ef
	LqKrWu5D0q43SoXBHOVehb14x8UHKNXgBvJjU7kdPANJT4Y9h2Tq23DaIcZCpITrYJPr0Ol8M39
	9J/Ac/TLFLJfrDgkTYfJJIPYKrRH1Q31LtEQptBL0Dd1wSm0ok50bgoibdmGORZ2V9lM/7AFHhU
	C3J4u5hlPicG6dTrRzaIkRHdojYQwjDeAMOgbJnJvRx2h+AJqVmvjloKDdVWeKr1ERU/awFR85p
	iPY8w0cvl4OKQGVa5o423PIsUvh5FWDHY7vbUHiYFWxupWL7j/ae61ZB3xI3xKe7xQHEQaKqgz0
	=
X-Received: by 2002:a05:600c:34c7:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4ba09391696mr107327305e9.16.1794498580905;
        Thu, 12 Nov 2026 07:49:40 -0800 (PST)
Received: from stjepan-Aspire-F5-573G.tailc0f20e.ts.net ([2a00:1bb8:118:d39e:4868:f22e:b51d:7cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm139337155e9.1.2026.11.12.07.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:49:40 -0800 (PST)
From: Stjepan Poljak <stjepan.poljak@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>
Cc: Francesco Valla <francesco@valla.it>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andy Lutomirski <luto@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	virtualization@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] tools/virtio: vringh_test: check that a split ring must be a power of two
Date: Thu, 12 Nov 2026 16:49:17 +0100
Message-ID: <20261112154927.4004184-3-stjepan.poljak@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112154927.4004184-1-stjepan.poljak@gmail.com>
References: <20261112154927.4004184-1-stjepan.poljak@gmail.com>
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

vring_new_virtqueue() used to accept a split ring of any size, although
the ring is indexed with num - 1 as a mask. Check that it now refuses
one size short of RINGSIZE.

Without the preceding fix, vringh_test fails with:

  vringh_test: vring_new_virtqueue accepted size 255

With it, vring_new_virtqueue() prints:

  Bad virtqueue length 255 (not a power of two)

and the rest of the test runs as before.

Signed-off-by: Stjepan Poljak <stjepan.poljak@gmail.com>
---
 tools/virtio/vringh_test.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/virtio/vringh_test.c b/tools/virtio/vringh_test.c
index 2a5d7f7d2d6c..75c66385502d 100644
--- a/tools/virtio/vringh_test.c
+++ b/tools/virtio/vringh_test.c
@@ -494,6 +494,17 @@ int main(int argc, char *argv[])
 	__user_addr_max = __user_addr_min + USER_MEM;
 	memset(__user_addr_min, 0, vring_size(RINGSIZE, ALIGN));
 
+	/*
+	 * The split ring indexes its rings with num - 1 as a mask, so a
+	 * size that is not a power of two must be refused.
+	 */
+	vq = vring_new_virtqueue(0, RINGSIZE - 1, ALIGN, &vdev, true, false,
+				 __user_addr_min,
+				 never_notify_host, never_callback_guest,
+				 "guest vq");
+	if (vq)
+		errx(1, "vring_new_virtqueue accepted size %u", RINGSIZE - 1);
+
 	/* Set up guest side. */
 	vq = vring_new_virtqueue(0, RINGSIZE, ALIGN, &vdev, true, false,
 				 __user_addr_min,
-- 
2.53.0

