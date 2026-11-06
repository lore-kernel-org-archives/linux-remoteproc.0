Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007409;
	b=h3A/fBgVsq4dSg/5aON0SuZCNWabdTejtQ+hc2rYVAlzC3ea7A0tSMpLtbTJjjGaRKzj
	 PnR1WIv04nlQhzSwZ2CtM2G10qOX+/VxT7FNrukJlmLAMMWwunLePdrCDtr9JyVPiOpKR
	 Tiz5N4tJJSASPGYYgXq2sCvQYDvaHzzfYVN9j9sLUz2WQN4mBQ17tqC8l3e2N9C1PnVfI
	 7Bmn2sZhD7eHT0URnI9l0+XCj4ZWJBcJKJfJjcRPgCu8EiMZM0nC0u+i/XCkAFgH/BNwX
	 cXkq0znMNw1ps0wZEfHIQK4jNIBsaRMQkMu16vWeOZdnhkYQ6JMpCt1RENpEyLJ4dUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HFolVHsdlQxrFn7oJcUktRPcmpRgRmH6vLNq3RWKHsU=;
	b=fJK4nA/nezsm+6H/+CIj+J00i0lTVAhOnNIgvvRVtS7Wc1Wc486P0GCQ0h+MiKEg4SFL
	 DsfYat1l3pfawS4WVM5aoyfO8jOa8yNtrygjf9YEzPjYstrkV5ja+SaavkMBQb/rSDNFb
	 LB4AGWgDOEMWm0Dq6dj7jP4xyew8znRnt+2hqPDqYkda584gS5KnXj5VLkdTmWGFqIDIq
	 V1FXluMy5oY6byXNcz6pkbYnYwkSPZF8zxbSbWZPjVLHtQGIoE2cTz3WFS4TSY38rIQS6
	 QaldeFh5a+uipggWx0ReOrdTFpdTwiWdxh3Vg0s04hLEl2BqL9+FHVs5goyDRofb7qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=beLxm6Tc;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB0D606D80C
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Nov 2026 23:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FB0D606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=beLxm6Tc
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a058f74a54so522725b3a.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Nov 2026 15:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1794007407; x=1794612207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HFolVHsdlQxrFn7oJcUktRPcmpRgRmH6vLNq3RWKHsU=;
        b=beLxm6Tc+6Bxsxoeh2ubotiYZME2+AaKr51XOjMpuAM+32lbdM0ERjIFNpsP6laipI
         wOCiy8RKV3rp5a8r2vBwM7Ko2yk7VBEQ21t9H1AWid9L9lq/Cv3SucgAN+DSkr4alx2O
         PQKAmsj3j5iYVD4RlkwnO/ClKhDu3DaG0mcYwgaZYlJ2NxXBZgxEtIy1HKJj9s5AreV8
         L49LkACX8K5T8lCSK6843GjGBjqxDTZcEhqVu3GtqFba8zdK60w4zgOaeUgcsqSON2ha
         hpPFXsPo7rqDqh1v8Bgx1Nf5f8c+eqFMpEPjWiU3w8cUJfheHpNa05ny8zTBNzIMtS7r
         LJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007407; x=1794612207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HFolVHsdlQxrFn7oJcUktRPcmpRgRmH6vLNq3RWKHsU=;
        b=GiHZGUT2JjhtCdPruJizStMRB+DVQi3KZaE0JBcvwfa5C8pS0Sbp9TAcu2g4JtU4tD
         SVg1SQBZXplmdWj4SXN+qSdzcRmAMG4y0z/UWdEdPhfTBYXcMKYNVu43dkdHl6SPtAo6
         F/a38s9aj9PAlVUO71rYfgCMYrelJmv7a/V5nef09MLX7buH2ZmzkW0+2boVIyjXcnI0
         uGlSxSZWe0RpxJXdp2UZWjgE+zXfMWSjycFZI9vYi+PYWVPWrP1q/+NUSTe68o/25aQY
         v+kE4+NzawNAB43Z6EIR0tT6PgBQ8wNMUQMH5MxEVMKoxY0BJjs1aYH3TCBE7I76KlYz
         15nA==
X-Forwarded-Encrypted: i=1; AKwUvBz4dbF8ET7MuTMJmS+unIH1ROQ3IGJmpk9btL2ghESalF8EsV3gw5TzfB0oPUm4N8HpXRUyd/gW8ShWtcZCdnoh@vger.kernel.org
X-Gm-Message-State: APuU4Z+5I+e3E38tHdGYH6NWL/ZpOQMYjbAdVx8kLjhvpw3v7hlWsyC/
	cloKlU3FTJFKKhx2xQfIz0FSFNlnnGtaZqlbHX/kO+izpjYvgwHdszHZKzP5IJpyLQ==
X-Gm-Gg: AYBFou1vnm3HO391c0RddqmpJSQ5ag1Zu+YLdUIIzPXRttoYxTZTfOOTXGb5KceQZch
	lpKLF07hQpEuIn8FT+C0KRuUINt9Y9ywJvOr1PJiVF3C4TiYUceav51jJx7k6ZGuX4zQJomNoDT
	EHt9TvDPOoB6PHXzmBc+arW/jsstHQlzQ9tIjcbA85fzFGB9hFaGZerUmt38JuD8dn7lQa6dDmy
	uAyTxWs1zym2AoW7Pfo+ykrVXrJeMMP/XzHNGI8XLzW5ef6FCOysNg0Qic1JaFHK3NHQEc/YlbR
	4Lpv9EjGWNipjzzqZHa8Dhig0apsKnVYg1NYStqpx0Or7JwVBotaqgXN7i4Syzi/qwF4oPuGjI6
	aVHp4ME96HkQytjejLk03aOvIq3TWI074VWJNSlDoZh2TCyXxhXzlRmO6KySvRvIhlSpDfv9cAa
	uN2J3mAKv+0hvFWFIrW4iASIT9N1iN9Ygg4l7S1JQ4crJlA/AAx2sIVdXWNHChjmZrmf7I+Ilom
	SIiZnp2WSFOw3SGmpvF/aZp/v9d23S/Zyqr0chboa2o5q/EZZfUNLlifhrsHMLRgYoFWDPUy4FX
	GR354qtCi6RGY60F8aHNEJpeyXs58wi120oqTstx0RVyOBrj7XYnd1g3p2c=
X-Received: by 2002:a05:6a00:4515:b0:89f:e1e7:e7e8 with SMTP id d2e1a72fcca58-8b37aaa7740mr3885857b3a.18.1794007407226;
        Fri, 06 Nov 2026 15:23:27 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b356c2c5a5sm973657b3a.7.2026.11.06.15.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:23:26 -0800 (PST)
From: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH v2] rpmsg: virtio: Reject a message shorter than its header
Date: Sat,  7 Nov 2026 08:23:22 +0900
Message-ID: <20261106232322.1093165-1-lian@is.s.u-tokyo.ac.jp>
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

rpmsg_recv_single() checks the msg_len field of a message header against
the used length with an unsigned subtraction, so every msg_len passes
the check with a used length shorter than the header. The rx callback of
the destination endpoint can receive a message of up to 65535 bytes,
longer than the default receive buffer of 512 bytes, so rpmsg_char can
copy the whole message into an skb and read past the buffer:

  BUG: KASAN: slab-out-of-bounds in rpmsg_ept_cb+0x4d/0xb0
  Read of size 65535 at addr ffff888002484010 by task rpmsg_echo/140
  Call Trace:
   rpmsg_ept_cb+0x4d/0xb0
   rpmsg_recv_done+0x29f/0x840
   vring_interrupt+0x32a/0x540
   vp_interrupt+0x146/0x180

Compare the sum of the header size and msg_len with the used length, so
no subtraction wraps.

This patch is assisted by Claude Opus 5.5.

Fixes: 9648224e564a ("rpmsg: validate incoming message length before propagating")
Cc: stable@vger.kernel.org
Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
---
v2:
- Leave the check after the dynamic_hex_dump statement.
v1: https://lore.kernel.org/all/20261102221504.175116-1-lian@is.s.u-tokyo.ac.jp/

 drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 23ff6c8b7a20b..3d58bb19e9297 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -676,7 +676,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 	 * the reported payload length.
 	 */
 	if (len > vrp->rx_buf_size ||
-	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
+	    sizeof(struct rpmsg_hdr) + msg_len > len) {
 		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
 		return -EINVAL;
 	}

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

