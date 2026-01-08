Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253D82D7DC4
	for <linux-remoteproc@vger.kernel.org>; Thu,  8 Jan 2026 19:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767900235; cv=none; b=RJFxMG7EqbiyVWCsI06bbPa1nlukPromqx13OXS9aoApQufnyzVqZQTHGEuHNPZTNg1SCO3oBaoUvDxHeop7/h6YhXDt5SJNcKK56Fc/bW/0WrFKsUTf61z3ZCHRUrLhzU1GqcGWgn7Iy1EuTxvxVNPkCRaDTCKZSKm7aC9eeTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767900235; c=relaxed/simple;
	bh=bRU1SFloowJ/6x6bST4F8cNIRFA5KXZDHOjDPsLuYOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N9xASg+42S73msdB/zXNIhv43lat+a82/nam4gLvNGsraGzGMmkW7KpZsov6KbJuX8O8GaykBw+8cWubZZVuECTD1WhUi8O9n9MN4fRMwaJXPAre0VWJSyPtxMEaHoZ9opEgKdWENtAdgvRnIMiLivlT0SjYZH1Id0L933QLVAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNrosIHi; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNrosIHi"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59b7b27ebf2so663115e87.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 08 Jan 2026 11:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767900232; x=1768505032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+NsaDRgm6pKaTgWJiXTOhzG4JJGqiawgqcFp38h0kEE=;
        b=fNrosIHiMycsWt2zyv++An654f3QAAg/EA0dBzMpPTdiPjWIQ2yCyHeK8fjP58gARF
         dDWvPxL3cBLIyp0S1d/K3Z0yDdb9Iy4Fe7hA4YALNv9EM0n82gny88IJu+slKbHpjdNz
         zEnRn5gadiKzFbVWA2qK1d15HQzD+K3pRFeQ5TwbzFc3vj7mr5jTM5lz1QE++VxhX0jR
         CfePLcZNWXs0yMA0jIs3mIVilRR4HWo/3vvhoGGv09qB5JcDH64NID8ph/qkQuTGd2mZ
         4ADZK6xEUJcJw4HX8DMekH/2ghxAw83m6pbYMPW82gwYyVFeid/RcsTnlZ34C+SIW1Eu
         86pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767900232; x=1768505032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NsaDRgm6pKaTgWJiXTOhzG4JJGqiawgqcFp38h0kEE=;
        b=BzEdsBdwRmbk3++J3C/OFAQUyfHA0RvsZvkWhOU7nNHZwTilcpWxQRh9YJyV15ixPG
         RUWt86T0oLqX+s7IMvJtUGD+BBM9cfoG2cwPn08y+XIPVfxZYiWXUGXWZveMerZwfSA6
         qx7Oimtv8Q2hGQCjnfK5Qq86TuES4/QSg6BXrCev0D4KEmJSxBKonHRvhOfe2TZQKsiK
         0kpWFERAaCG5UfcjwllMQ6FH3sSHnG+zRdYFLxX2YTdr5+XHXc3AFOkGu+/FM8dXeNqW
         CXDQZGlgQi81RsHtr7FB7cOMQinMsFLa+i1e5C7z6USCF5f9l0Uj1RM0SxouIybtrd3x
         e7dw==
X-Gm-Message-State: AOJu0Yxdn/xOQ906Imv6v9BPQ+9hC96zXEgGKoi4HkPan5xqHR1cV8lC
	81E8zgVAomPwwNDqgRk/sqwR455YRyRu55Ee73l/y+iaG3pczjqTT5U=
X-Gm-Gg: AY/fxX7TrPrTevCYPRwJ9bDcuY2c6/vZjLwIlwyViPigdh6i4zj1tJDJcm7hYXKoR/P
	s+S6woZ3rWlPOTO5DhsUFtPsbxI3wCqZf+nP2BDs0JbPSBCt8tEbtyDHTjdcNGTsKSSOSoE2GGm
	wSqe9M3KWHAKYI0mv/F4ueIovJx5j3yIIVnLUVr28trov39ZCajCwZNXXGfErjOxJQWBhuii8GN
	HKhtYg5MhGWcQK1mb2Fhj+uVQ8e0pIJV5d+G2Mn+h37ww6ksiLdNDawQcP6alAe3sTq9HL6vLwd
	KKItYiv+UFKCiWL8reLz+5D8mr9OjFUZ4zo17YbPPGCgIpe15l8afyxqN7O8lWakvFWyLF4MXM5
	OS8tK5cFvl0EoVeZ4kwPaLb8lwiTSk/g6D0NooUoQipRbdJ9QVWp0tBSmGwiGJJPPTOqofaiqsV
	dpWxOc480t1TLj
X-Google-Smtp-Source: AGHT+IHmYecOwTPfis6meRCautaxv6Keb/SkBtMISHkv+OF9YZ564iWLRiRSf/NgQ8HbDTx6tN2vTw==
X-Received: by 2002:a05:6512:2205:b0:594:2654:5e3c with SMTP id 2adb3069b0e04-59b6f02fb50mr2452919e87.33.1767900231879;
        Thu, 08 Jan 2026 11:23:51 -0800 (PST)
Received: from DESKTOP-BKIPFGN ([45.43.86.16])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6792csm2273818e87.68.2026.01.08.11.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 11:23:51 -0800 (PST)
From: Kery Qi <qikeyu2017@gmail.com>
To: andersson@kernel.org
Cc: linux-remoteproc@vger.kernel.org,
	Kery Qi <qikeyu2017@gmail.com>
Subject: [PATCH] remoteproc: virtio: fix uninitialized buffer use in rproc_virtio_get()
Date: Fri,  9 Jan 2026 03:23:36 +0800
Message-ID: <20260108192336.1826-1-qikeyu2017@gmail.com>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rproc_virtio_get() returns early on out-of-bounds access without touching
the caller-provided buffer. Callers of virtio config accessors commonly
pass stack storage and do not get an error code back, so stale/uninit
bytes may be consumed as device configuration, leading to unpredictable
behavior and potentially leaking stack data if later exposed.

Always clear the destination buffer, reject offsets past config_len, and
clamp the read length to the available config bytes before copying.

Fixes: 92b38f851470 ("remoteproc: support virtio config space.")
Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
---
 drivers/remoteproc/remoteproc_virtio.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index c5d46a878149..8fa8c8a86b4b 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -298,10 +298,13 @@ static void rproc_virtio_get(struct virtio_device *vdev, unsigned int offset,
 	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
 	cfg = &rsc->vring[rsc->num_of_vrings];
 
-	if (offset + len > rsc->config_len || offset + len < len) {
-		dev_err(&vdev->dev, "rproc_virtio_get: access out of bounds\n");
+	memset(buf, 0, len);
+
+	if (offset > rsc->config_len)
 		return;
-	}
+
+		if (len > rsc->config_len - offset)
+			len = rsc->config_len - offset;
 
 	memcpy(buf, cfg + offset, len);
 }
-- 
2.34.1

