Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D89634;
	Wed,  6 Aug 2025 17:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754502626; cv=none; b=LNxtKRQwFnLrHqswMVVpAqHc5WUwRv30fEcjc0owr7FF7TUpRG5+bzryf92p9DK0Z0NSAg2xHnG9mmg7RYEZNO1VbBs5GF321afNgoFk44Vxhj0qY/TtNJUd2ui4q9GTt0+Y3T7Q6/fcKAdkCgCuAFQz0YGnrNEjG/uBksPfzQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754502626; c=relaxed/simple;
	bh=Hu6WZjPemFodp3JLevtL6447g8/QOnhK3vD96hyJ/3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QyXhsJh+iKh8T+xsoDuNg2Qu4mW+FtHQof3CfYYEOYRg01zW6St2r50GfS4C8aLHqwXmitiZ2E0KdOPxG2iGyiVE/NyUGPUqh1u1M/CecRnb6B3PO6awxQGn5h7mlSA4exXB5Nbb11MjagZUKVlWuzkO14k51Nl888vJkoLFLHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHTHSAWW; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHTHSAWW"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso50479a12.3;
        Wed, 06 Aug 2025 10:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754502624; x=1755107424; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pS0JnO832HN3eiTqbQzpacwvyb0+NRv9ozqKtDwtM+0=;
        b=BHTHSAWWnswM0O2Kb4SmkzFqOoWGnRPoxZKjTILB0c419yZ6Hn8fk1Ho9pE0eGF6iN
         rU1fMcn+RuY8KWujV3YrDeb4H0rfeL5ahp1s2CS9JJLPi5udzp9+WQxUIuzk4OnZdGft
         Y5Rv4HDPl7GHLxz4eCwTWSo6cy9WpAiIgplmRv2rIhLN8/5hwJbvSZhi7ozWG+ZK0roB
         0kS3/XHhxiTKdBL6C1caGX/z61j8s+pGtDD8+/p3+z/Ep+aqkdN0FSowANZ/Bp05f+Qd
         F2pH1YtWxn5nsWiOJWQ52WQcPdXN2dbiD9N7fMJeVky7Nl0XSSLX3Uhf6LAKcMP1szPF
         V0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754502624; x=1755107424;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pS0JnO832HN3eiTqbQzpacwvyb0+NRv9ozqKtDwtM+0=;
        b=X4eJ4kU17jVTZ3N8UUUJwekaVC74qlv5DuD3LbQUsT6FwLDaTl/QOvNoDDLSHEnsK8
         Iga8Y4s2ZAfYqk8aUwtFAlsqA8zXD0tyeDFFocoHX9QuEvGoU7QS2xOo+cpTkQkBIHw3
         iU0ikS03isoUDBR9B9NKmlcJThHw5y0eyivBCcgexyYedvWBYphJA8GBRwrf4BhIoZUm
         Es9gRd6+KD9KtuUZ/LigxPfgCHAx7Fcn8ztOPM3se1Mn94asRwtDKT9REAHWnJPlSRuO
         WMCH0Q88FdbMnW3WRrQJyWFsk+7/zqZFmKU44LXBGRYAhaqbjXwLsPe/1hx729x25N+7
         8L1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUX4aANtlI8Eygvan2/+iEgySu8vdWazu3+rmbOhSnQndVnoLy8D3aUkPA7gWc7Lr++f0Krq1/LJTIgwYyX2ChnwQ==@vger.kernel.org, AJvYcCUrGltGzQFSFBlm35Eb+sI5G6d44r6AJgqvnNnAS03n9+dObw4Rir+ugTXMj563ZlgmHKbBbEMxYOAgzSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTGs3XsxqzF4OXlmHWhZ4+HmWrZGxcwwXljmiXnWZAPSWl5z2K
	qbvc7o2n0K71KO7V40ydr12KjuOq39uEnfuE0tgXlxbdMp43iZle4pZY
X-Gm-Gg: ASbGncuiB1H7PKCSR+coGq7zFzWUgafGwkWOqm7P8Qf6IRrf7ikXqAd3yuxuCxMjx52
	lc/vUVefZ4cJgtLnlW+qMO0nCQwi5Yc7TQPETHso3bUqbuMaWanhLQh+TjuOb9SmjQMPu7j4Zbc
	tyJWfoyvUDhg6bq/Ws1T5Vilx3QTq1LKfU4YAHhhaSydABJP5quS7iD7LaOnpUmMZQ4xEVpbyk5
	LoiI6y0rXdHdABrUjNFuDOYK/3pVQonhnbUh2uD2CMPDZC7CaX5gvj8XWSSBXCdcpe6U6uvwf8u
	g2za90ap1MQ44yoGFyBT6qB9hGI1o0EXFGd1EAhE2PsoUXHX25u6geTuOCTFoX9Vv6lrcAVALUm
	HT+JtTK/b2/Ly4pzOQuU+VYnG
X-Google-Smtp-Source: AGHT+IHxkFimw7Pa8s5ydrvXBTllzTVINSVoqWMTMFdYIS/Fcs1L5rJhbqTgnQ7KUsbBVdJiwoVKRg==
X-Received: by 2002:a17:902:ea08:b0:240:bf59:26bb with SMTP id d9443c01a7336-2429ee8be31mr55304365ad.19.1754502623655;
        Wed, 06 Aug 2025 10:50:23 -0700 (PDT)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0e7d8sm164359725ad.42.2025.08.06.10.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 10:50:22 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
Date: Wed, 06 Aug 2025 14:48:17 -0300
Subject: [PATCH] remoteproc: ti_k3_common: remove remote processor mailbox
 ping
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250806-v1-fix-am62-hmp-suspend-v1-1-1c4a81bb5dde@toradex.com>
X-B4-Tracking: v=1; b=H4sIAGCVk2gC/x2MQQqAIBAAvxJ7bsEWlOgr0UFyyz1k4lIE4d+Tj
 gMz84JyEVaYuhcK36JypgZD38EafdoZJTQGMmTNaCzeA27yoD8cYTwy6qWZU0DPwfkxsCGy0Op
 cuHn/eV5q/QBVMhiMaQAAAA==
X-Change-ID: 20250805-v1-fix-am62-hmp-suspend-aed6a8de0225
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Andrew Davis <afd@ti.com>, Beleswar Prasad Padhi <b-padhi@ti.com>, 
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hiago De Franco <hiago.franco@toradex.com>
X-Mailer: b4 0.14.2

From: Hiago De Franco <hiago.franco@toradex.com>

As of today, pinging the remote processor during k3_rproc_request_mbox()
does not have any functional effect. This behavior was originally based on
the OMAP remoteproc driver, where the idea was to send messages such as
suspend requests (among others) to the remote processor, but this was
never upstreamed.

Currently, the ping message has no effect in upstream usage and causes an
unread message to remain in the mailbox, which ultimately prevents the
system from entering suspend mode:

Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
printk: Suspending console(s) (use no_console_suspend to debug)
omap-mailbox 29000000.mailbox: fifo 1 has unexpected unread messages
omap-mailbox 29000000.mailbox: PM: dpm_run_callback(): platform_pm_suspend returns -16
omap-mailbox 29000000.mailbox: PM: failed to suspend: error -16

The ping is only replied if the remote core firmware is capable of doing
it, otherwise the unread message stays into the mailbox.

Remove the ping and fix the suspend issue.

Suggested-by: Andrew Davis <afd@ti.com>
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
Hi,

this is the result patch of the discussion from

https://lore.kernel.org/lkml/20250725150713.barg5lhqr4reoxv3@hiagonb/
---
 drivers/remoteproc/ti_k3_common.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index d4f20900f33bdd92a59c62d0a7b166c4ad66ed16..8266e11914af87ac38977763099521dee4334348 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -160,7 +160,6 @@ int k3_rproc_request_mbox(struct rproc *rproc)
 	struct k3_rproc *kproc = rproc->priv;
 	struct mbox_client *client = &kproc->client;
 	struct device *dev = kproc->dev;
-	int ret;
 
 	client->dev = dev;
 	client->tx_done = NULL;
@@ -173,20 +172,6 @@ int k3_rproc_request_mbox(struct rproc *rproc)
 		return dev_err_probe(dev, PTR_ERR(kproc->mbox),
 				     "mbox_request_channel failed\n");
 
-	/*
-	 * Ping the remote processor, this is only for sanity-sake for now;
-	 * there is no functional effect whatsoever.
-	 *
-	 * Note that the reply will _not_ arrive immediately: this message
-	 * will wait in the mailbox fifo until the remote processor is booted.
-	 */
-	ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
-	if (ret < 0) {
-		dev_err(dev, "mbox_send_message failed (%pe)\n", ERR_PTR(ret));
-		mbox_free_channel(kproc->mbox);
-		return ret;
-	}
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);

---
base-commit: 6bcdbd62bd56e6d7383f9e06d9d148935b3c9b73
change-id: 20250805-v1-fix-am62-hmp-suspend-aed6a8de0225

Best regards,
-- 
Hiago De Franco <hiago.franco@toradex.com>

