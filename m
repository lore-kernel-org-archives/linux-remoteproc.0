Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657713;
	b=OW+Q6w1sv/BIq5LGEhH2QJkGc06qsLIS4clELWaJIrt98KVZLhLf7XP7Z+vwRcwm57Gj
	 N9xrt1cLXBbqa1fth+1om/ZBkJq0M4cMormNLFnlMojGceDq5dYlLRwdoMCR150HXIfEe
	 aNb8I8+QoounlnH8gnty2rYFN6pyCLFhxDzz11b1l1qiz98vXpv31UfEnWS2+D7LTfRI8
	 Id0fWkfYReeqKSEbgAA0/Z1k5TwZtjqJjVKW0a0F06TdNF4n5nVtr65UEf7MYxM1pZ4Ro
	 9qQixw5VEDVQZlaLDeJAZMkMG2Dk/oEELLNW08JzwROxRxXIgDBfjIN/2RntxILQwHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DDDq9vrORSWbnT/BmB95bS2gOj2xanzImuHp41SDLD8=;
	b=o8Khk5mYWRa3i6uyByh5/92GZIUGdRK+sjPHuMu9zcG1UvFxC210vOZaqQXvYARurPaW
	 xdIOiC6zAPqXz1nrVBIETKkRtymYEbiGlM7ooUuRCVuaXpB/BNiI4rtrVCBlm8Ygldo1C
	 4Yxyyemi4U5plNBq2c9u/piyJR914LaXU7jq2vMhCD+U0eaCTKJRILCnd2d4Lw5HExYAQ
	 rz/yIoQuT47Q3qp65Vlt3ms6Ny0qu+s3pJkIs57rX542BMpdm2/XBTfsGH0qB5QiDcSLz
	 LP8z96EzhM1aNhQPDRDywTgKPr5vOz2ODrdWU0/JMfdfVAzbG7507j7rQFyfxcVzO/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=TokvcMKc;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9F0606A32D
	for <linux-remoteproc@vger.kernel.org>; Mon,  2 Nov 2026 22:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A9F0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=TokvcMKc
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so1673238a91.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Nov 2026 14:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1793657711; x=1794262511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DDDq9vrORSWbnT/BmB95bS2gOj2xanzImuHp41SDLD8=;
        b=TokvcMKc+KYIST87Mai260x4nopeORdiWMi79Bv4kzPWRQ+VEYVkBgKM7J7ubgfMct
         EAUHAd4PTv1r8+90sVT307xC2pRCL993JZJfQlLMk2O6IzZh1NLpuneUl+BUTtg8XxYx
         /QTo1JyjHQrs21R11/IBFyP5jg0n9Iy6VouHwlbd7HPaMecsZ/Wd/mOSzz0t9MTSXdHE
         aLOuN4vTnqJnwHQIzjkLQ3OlWd9efODyiNk9U0HJfXWPInLzKqDV8kugDOiez/o1io2s
         hF/KO9aruPizc94q+0RDxqUUSB5RHH4v19BLqwrotuv1CHCNEUPHBmPNWoT2ul3T99/0
         V06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657711; x=1794262511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDDq9vrORSWbnT/BmB95bS2gOj2xanzImuHp41SDLD8=;
        b=Luoc+0MGvS+L9HFyIG/B4Mq+PapsgJLPUI2xnJOUkNBz7+rJtfZEXBemyRHez7ZDib
         M6tpaQQ2a+TCJQYIxTqo0L3ZZm6aoQ9XcPadEpDfZz2WIg6vQgZruLX0Da6OAB/SxhdJ
         fNsS5gY1wz1q3OJD+8f5K9diV3JrOUdKXs33wiGKzAI4f+mCucMWjatMPOPktBYI881b
         OJevqaeJRcCAvA7yIxQjlFuW1+5a4QW5PY6UG6L1bDdnNV+RkKQ3UmN90OuAKnlIAT0E
         EjeFiMpJWc/f+j9jTtuk7R9uxq+DrOF7bPcHZe3YU8h9Don0WPSNgcjxXArEHY652f7X
         XoZA==
X-Forwarded-Encrypted: i=1; AKwUvBwNU7GPEKLE+Oref46S2U50O2qJle0MySMk2CtVyjS0+xR7sRZENdCmToG//dXURdwTJgrPvmxeccH/ELoySNx8@vger.kernel.org
X-Gm-Message-State: APuU4Z+CF1duZADA6AkZgwxa3CdPzd4534N5Qi9C2bJFitqaT/y+fouG
	jpnESVi4qhqOAgtgf91IoZmLyNvmJYBaFu7/VNMNLIrXSHUTz8Mi9fDdzahbXCKhEg==
X-Gm-Gg: AYBFou0/FFJ3YNlCsQkLV6D4DIkNZz6M81K3r4IyjoKXNMKHyzTK52btmx/ohEamQ4T
	v3EI54oRCk2ZjN+XN5XMCwaClBJRncnqQBId2sOOM6rJ7oPnuPp20KYpsZqtRwlNGo2VjeVOzTf
	9A2MJgF92m9His7eB15XKQiMmEuiY7iREiqv+YFYbGvjmefToHxSuflKwNp5L8h0TLcW8XQMrvm
	20ZRtbPjOuaOuxmDH/EziyXSS5tr3BYkLv8mhy8JzeDgBukXmJGU/ehPE15nXxVi6j6j+PPlkSD
	N/bS8Pvj+fXzAp5NFdaz4EHWzjUih385gSZBgKUIWrZ+4xb0HEARa/3Fol++WZKLluFHh1dYd9M
	OgiIzPWjXcWJALOpgrWCtwPq6JPvum/bZPDIacd4fV+SerqmWyAkYvYFNcQAsa0JylMIdvtozgP
	OrSmKwaSTPimWca6ohzsqSsPT+85w5pNVyEXZ9/xGPuhcfeGl7d1Y+7fp3+oTebQupA83EKgFTO
	W+VpIAz9O71xLtCWB6IoNDLj6LOJ6C1VWjVlsb9Si0AdLlPFWyuY5oXbpiuk+6Jon8GH3YLPkCE
	pp7T3M+BzGH/VAoflTfMHun+C6dceqlltKbIhH0=
X-Received: by 2002:a17:90a:fc4b:b0:3ab:b64:5893 with SMTP id 98e67ed59e1d1-3ae8981bf35mr8240104a91.53.1793657711239;
        Mon, 02 Nov 2026 14:15:11 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8b1913sm984336a91.10.2026.11.02.14.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:15:10 -0800 (PST)
From: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH] rpmsg: virtio: Reject a message shorter than its header
Date: Tue,  3 Nov 2026 07:15:04 +0900
Message-ID: <20261102221504.175116-1-lian@is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.56.0
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

rpmsg_recv_single() rejects a message whose msg_len exceeds len -
sizeof(struct rpmsg_hdr), where len is the used length the device
reported. Since len is an unsigned int, a used length shorter than the
header wraps the difference, and every msg_len passes. The endpoint
callback receives up to 65535 bytes from a receive buffer of 512 bytes
by default, and rpmsg_char copies them into an skb that userspace reads.
The receive and transmit buffers share one DMA allocation, so the copy
can run through the following buffers and, with small vrings, past the
end of the allocation. With vrings of 16 buffers and a header claiming
65535 bytes, KASAN reports:

  BUG: KASAN: slab-out-of-bounds in rpmsg_ept_cb+0x4d/0xb0
  Read of size 65535 at addr ffff888002484010 by task rpmsg_echo/140
  Call Trace:
   rpmsg_ept_cb+0x4d/0xb0
   rpmsg_recv_done+0x29f/0x840
   vring_interrupt+0x32a/0x540
   vp_interrupt+0x146/0x180

Compare the sum of the header size and msg_len with len. The sum cannot
overflow, since msg_len has 16 bits. Move the check ahead of the debug
output, since dynamic_hex_dump() reads sizeof(*msg) + msg_len bytes
when its dynamic debug site is enabled.

This patch is assisted by Claude Opus 5.5.

Fixes: 9648224e564a ("rpmsg: validate incoming message length before propagating")
Cc: stable@vger.kernel.org
Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 23ff6c8b7a20b..a9125e81cb150 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -661,6 +661,16 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 	unsigned int msg_len = __rpmsg16_to_cpu(little_endian, msg->len);
 	int err;
 
+	/*
+	 * We currently use fixed-sized buffers, so trivially sanitize
+	 * the reported payload length.
+	 */
+	if (len > vrp->rx_buf_size ||
+	    sizeof(struct rpmsg_hdr) + msg_len > len) {
+		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
+		return -EINVAL;
+	}
+
 	dev_dbg(dev, "From: 0x%x, To: 0x%x, Len: %d, Flags: %d, Reserved: %d\n",
 		__rpmsg32_to_cpu(little_endian, msg->src),
 		__rpmsg32_to_cpu(little_endian, msg->dst), msg_len,
@@ -671,16 +681,6 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 			 msg, sizeof(*msg) + msg_len, true);
 #endif
 
-	/*
-	 * We currently use fixed-sized buffers, so trivially sanitize
-	 * the reported payload length.
-	 */
-	if (len > vrp->rx_buf_size ||
-	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
-		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
-		return -EINVAL;
-	}
-
 	/* use the dst addr to fetch the callback of the appropriate user */
 	mutex_lock(&vrp->endpoints_lock);
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

