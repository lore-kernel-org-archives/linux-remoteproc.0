Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16072C11C6
	for <linux-remoteproc@vger.kernel.org>; Sun,  8 Feb 2026 04:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770523474; cv=none; b=Pbel4DfbSfPr0RocSA641p2vVKFQ4TGEHZDoZ3U/nXf2uzr8U0+6PzIfnMF5siiz9PlNidKrHBXaIr9mK122NN9ltO0AlyriXjP7G9x+/066L8Lebma5aIX7Jbvr8JtolF6tjVuPZd8/mjFS141rg+neozO6654DgvAVfjvgXbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770523474; c=relaxed/simple;
	bh=XFJ6n04/sV0RGWx96Y0deEcCBY9lYJ4aO3gH79dt61A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XRvPSm6RAIDZqQq2hEdXIqbCdB/zxqlLMx6MlwMxOS2kCOxq43LSBawvQFy5TiCPVz0Rio+bHsGkKueDeeyu4qvTV2yN5llxzIky1TRNKHeyjtiqe3I6N+DHWruquJTZ8bWT419FQ0pWCaEwsi07qFlpVE5t9LwEVOBwW2R/0AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hgxq1nOq; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hgxq1nOq"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1271195d2a7so1695163c88.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 07 Feb 2026 20:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770523473; x=1771128273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xeTwNqi+XJ/8HLrMMWD9b0KlELdWsXmDwflMIt0OPRI=;
        b=hgxq1nOq02T0QogV3fyJQfW79F0GIaC8H/BZ8cCtW4RhigiY0Wn1h7UyP1o9ysdari
         Gs34ygCFmkrJsi+ZuC+a6NFi0vwuwWdV9zXOeOXtaH3IZxRF21p/jnIJFBJXWN7JdAq2
         bAIMxaa4bzvi4Gj6UNhWWsQe8apDV4/pY4FKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770523473; x=1771128273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xeTwNqi+XJ/8HLrMMWD9b0KlELdWsXmDwflMIt0OPRI=;
        b=EKAQe1yHv6GWAoF8gBHGHlJp+pNAb9qUdZVvuWrRvs7RAjknx2IrExw3u/nBLCa67N
         894A22fNcEjbkoYxcD7d5RvYe4u3MQv3EGgJyvO6EDBf3FAtrBDpdXncmoAEElZQqMJW
         nEgLT4JbmST5QAACe4qt9xyg3L5/4M07S8DPLsUA1XYJtuWwk7C1bix1t799u75Xs8vg
         qRiREkZUJcHmZaqlmUQRnR4vahmzrjJK9H7wGEM9d5s3JuUcCMgFugsh6HpLJ1pE6Gs/
         459MGe11gxVj+VgCGbjJ7kr3amiPRr5ScL+Iw2Y/oyMwdkASJOFC5GmjFdpHFN2Aqjva
         n8sg==
X-Forwarded-Encrypted: i=1; AJvYcCX38D8rtu4ROMbhfPclch4l/YTXfkMqn54hFOpicQqfwLg5791DHgbBJsd+fg/AzUFWDVrS76QLcyUuhLL5JF4l@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Yv3h38+SXFhaHltn64HSCzmFUfcjAL1X12M8kkz3QxtzKUdY
	qSokBQLZtKSjvf4QRqnxA5nfq9EiQdFqHE3WQra7nhZTlQMwD2vEtTYUKf9CRrwbzA==
X-Gm-Gg: AZuq6aLrzJlAbrFQNG+3TQxgv++ikELSw7vA7NE+guV5hJ1/eGnpfjcmxFtrjCXpBqA
	DFGWzkTvMFB5NSdRaQehqznOwxhdOOJL+gJzsv6lIpcAWFksmwy4AF2UXEcwBzFv/0K2R9VGvp2
	a/vOHeQjKirFzA0ezckkU4q//tXnGTxlgknPkYzScNZXxHyFs5njBEsmFTlc2whdVMfcAv/zAVI
	N3fyN2dHYkhG/5MSbwy2fKHuerNr/xqjDlKYGKjhmEL3vLequEnCOEO9vjN/LluOSl82Fa7+Gf5
	trBIevlekv5I+gzBEGYvZEKtPkmWKV4E/r8RhtRvymFC9AZZQC3oLE2ZNX0BTKnOInG+uOZd4/C
	cBXDoHit9c3B07TsJcUxH4CaVtZhZ3bL9yf9NaIzuj1vqvdAqVO3kNHEopSbTVU7cjkL3PwPNKb
	o1aohMYTVburdP2th3fR2D477WBOlq9I0r3ydavFFr28oucJQr75kLo61QfGcMfgMvXFigulKeV
	4SywaQ04w==
X-Received: by 2002:a05:7022:7a6:b0:123:3bba:fc4c with SMTP id a92af1059eb24-1270407387amr3855209c88.38.1770523473030;
        Sat, 07 Feb 2026 20:04:33 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:6d43:22d7:40eb:81e6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm7085064c88.8.2026.02.07.20.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 20:04:31 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	mathieu.poirier@linaro.org
Subject: [PATCH v2 09/15] rpmsg: glink: smem: Use mbox_ring_doorbell() instead of NULL message
Date: Sat,  7 Feb 2026 20:01:31 -0800
Message-ID: <20260207200128.v2.9.I6973a32c3fcd6d2edebdd6fd868fe0a046420ed5@changeid>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
In-Reply-To: <20260208040240.1971442-1-dianders@chromium.org>
References: <20260208040240.1971442-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
messages to use mbox_ring_doorbell().

This client only ever sent NULL messages, so the transition is
straightforward. We can remove the call to mbox_client_txdone(). The
call didn't do anything for NULL messages and it's now officially
documented not to be called for doorbells.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/rpmsg/qcom_glink_smem.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 7a982c60a8dd..f2a6d94e72ea 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -197,8 +197,7 @@ static void glink_smem_tx_kick(struct qcom_glink_pipe *glink_pipe)
 	struct glink_smem_pipe *pipe = to_smem_pipe(glink_pipe);
 	struct qcom_glink_smem *smem = pipe->smem;
 
-	mbox_send_message(smem->mbox_chan, NULL);
-	mbox_client_txdone(smem->mbox_chan, 0);
+	mbox_ring_doorbell(smem->mbox_chan);
 }
 
 static irqreturn_t qcom_glink_smem_intr(int irq, void *data)
-- 
2.53.0.rc2.204.g2597b5adb4-goog

