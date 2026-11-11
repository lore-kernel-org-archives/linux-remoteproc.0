Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418202;
	b=Y8b/W/FaYE9QS4MAbLqhbXt5bQxJElBif2miYnbPQcfPGXRLDnnq10SQphP2IpGjq+yd
	 Jou6qsxx3NJMf7yLiqsrmkLdp+GPI5iz966a3YXS+L3ZPB2Lg2zQbdmCbl4GLjcYi12Lp
	 c/PSb9Z4kvsk/wAichEHfNYBjZO/R83EH+F7d9T/0ILadEBA+t06Uts7eM1PhEMq4Cd6C
	 ypxED02X3KetkSchVABv83oZt0OGa4EgeiG/OQotsd+nFpS901HlooHnA/1MxAUMYBOZC
	 otCY7JgQvl9mcPkVm6gnE5qRcdJXNUKg+8Lsn/v0vZ4AvxZodfC7/CUptMfrlvPU8/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IKVepiIWQTpytFczV61SNR3/LqMGsWtSoR5eXQ7P2qo=;
	b=KUC01y/f+rRNCIIEl5VK6sQpZWMNgcCLBjd1pXMef1aGcJCzBB/QKUcqcZAMMbAH2SV0
	 jgiFzYYtngDvY3f3PMKjDXPvS4KeVEVZGwKWxby7iUZMoKO3txLMElQOizc3Ml4l2fbLf
	 CIA1d+bPBzd0CKcID3gLd8VsLkp9T4mQFzwEkckNxvlgSEl+JE/7pV5PxfNNKO9tnGeKx
	 kkARQUK0zShOqSYXCUcOCx9Na2gjFnYZga2B4OOOLyI2KucMOKJ3BXac+IN6hN8731x0x
	 SmdBeTr/cMPWV6IP8jWKXUFSf1EaJoM3zmDc/OkEWjTHIBjjtTEby4KAWFaDrP0/YZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bFYIA7rT;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D106606A339
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Nov 2026 17:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D106606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bFYIA7rT
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2905213f8f.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 11 Nov 2026 09:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794418200; x=1795023000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IKVepiIWQTpytFczV61SNR3/LqMGsWtSoR5eXQ7P2qo=;
        b=bFYIA7rTFpVLFPJXTWF8QK4+hM2Or5vOWroxph9yVjplrAoN/vP/bKUIl/pYcuK8JC
         YJbwsvJ5yTovuXwHRm2uxofSk6xWm8mCfnfHYXLqy0GQ0goXqs5a3Kjbd03Q3hL7sm4N
         0svMgeGguAZEHU03OiXJFUwgylI2oxgB5rJVoZi8gQwxSkdtfm6u1evlwYjfUuZiuYME
         pI2cdIJKdrwWuZ41Mbszl+PkrdDdMFQ67zc1NQk1FYzszNscI591YdAB95skQA7YsNyW
         7QEVRz0wOGA2TYtddYp1McFL13EtoR7HT3tu1wUFaoCrohyKyLcCz9W//Amf2m0pwKOx
         mczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418200; x=1795023000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IKVepiIWQTpytFczV61SNR3/LqMGsWtSoR5eXQ7P2qo=;
        b=ib/bKZNxaJ1HHtYgHk6dFN9Kcz5/c8eoxx4dAa7aIhJZUhGXWnipyFNyU5l3HzhGoI
         mNOORAEHQGriolj86fJ6Na+vy3EdY4T0O+2gSlBBZcoBPvJWyw9FkGp6Hodt6HwiRSqM
         g3x3oSx1m6yaISyms1Tjg5S+MBFtshIixEsE2BXzzovxQxJ/KN1uII2fwRSu5J0cv4iv
         /Q4qYIogQkcAVKnQPdr0pQThxsCrHtiWS/L1Q/StFbpqS8Uqc3ldKpJWoxfiCpmXWMdJ
         T7HIe2AsoqBpMfT9Kz0pHR5AGGsnv0EiYeGjjE0beVsowScKkXokDLKycL0UVdJGPSF4
         jhfA==
X-Forwarded-Encrypted: i=1; AL+hErEXk7B7bJUGvtFXEaU+uUyi2dC1lx1FjOwgEL6I8Ifn8rPrtjQQobFDMxR2iU+qCNPWnkkTpaerQpls3NpOmWMU@vger.kernel.org
X-Gm-Message-State: APuU4Z80YMU+PfN/7njNHmLKd0B9lCm3zgJx9aVxqw6L27ioIcRUg+y+
	F2sMJ2Mk3pTGGhTBnsdmt//iCm2j3ntAe9KT9mgBwzlgVjtBHRSrAYwo
X-Gm-Gg: AYBFou3beW6CpyQLrLIrQ3JGWgDlYu/XI7MYAyZqidkET4sGwLxeqnw7DhVY0N7zXrv
	0Ms5sn16oUL4ArgPcTbtrymiMa0zm8N/04pvivyHxl62pqx4dYrc5O4SHlmBSXwcXvrBQWMIc5K
	69YTUhTuNWdNB5d2sccJEcWS38u0MYO7y0bxI9Vdx+C5yWN2+XR/RzczFFrr2eMpaJ2fcjN0kjj
	LIZUgs24c5zunOEm1N80swhCgWkzfiFATJADHL2neGbxjNcJHcpcOATxQz/h8zEuLrMFnN5OQiz
	ub2+vSwQCFSLoTGkBhNNCc/4BVU1dOX9qTdlkCqfJaJrn0E9rUexv0H/LVu6JESyEaFwoM3o36Q
	DmLKPTmgDghP7q+s11JxrP4RHNe651iEQbdX5Q5u5oZ1M0jcidG6RhQvbbXFA91bFTPS5rm/Q2i
	Ctfx/CLI3q8kEfumuslbEPrx+OLTeOFHgeTX30rIQ1BR3PtQORU0dMHHjnS0YILUYWHAbZBlg7s
	rbOLp2V5szFuuXC7NHWMdaOMHnFNQk9ZFQtrzBpltSYDW44qaC/Ek0FQuxg1Iao8vYj904a2zwH
	wmx5a8EDFZN7xzCKVNrXKgLd/s8PiLQOIq/oe2Y1UDx0+SVZ1Ago+h65DIlKNw==
X-Received: by 2002:a05:600c:1e04:b0:4a7:9025:5c3b with SMTP id 5b1f17b1804b1-4ba093b9702mr55946345e9.19.1794418199918;
        Wed, 11 Nov 2026 09:29:59 -0800 (PST)
Received: from stjepan-Aspire-F5-573G.tailc0f20e.ts.net ([2a00:1bb8:118:d39e:d655:6a9b:5ab8:7f68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e26700fsm3134525e9.10.2026.11.11.09.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:29:59 -0800 (PST)
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
Subject: [PATCH 2/2] tools/virtio: vringh_test: check that a split ring must be a power of two
Date: Wed, 11 Nov 2026 18:29:38 +0100
Message-ID: <20261111172947.3579982-3-stjepan.poljak@gmail.com>
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

vring_new_virtqueue() used to accept a split ring of any size, although
the ring is indexed with num - 1 as a mask. Check that it now refuses
one size short of RINGSIZE.

Without the preceding fix, vringh_test fails with:

  vringh_test: vring_new_virtqueue accepted size 255

With it, vring_new_virtqueue() prints "Bad virtqueue length 255" and the
rest of the test runs as before.

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

