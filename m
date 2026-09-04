Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A5F40B109
	for <linux-remoteproc@vger.kernel.org>; Fri,  4 Sep 2026 09:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513182; cv=none; b=sL5AkXUfZyvNGv0CejPiZNngCPfNLz0gHn/bNeJ2Rz8Xt3G1JlQepXjZ1MKgexgPjtCZP6BDQjD9Y9Xj02Nsabfk6E4dqNfwL89VEQWJ5+bnrwfqf0nxDD9aeUibni3uImBLyYlENodyp2y2GKaiG5R5kQZeLX6td+8u2NTNlS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513182; c=relaxed/simple;
	bh=UlKtSFgJbq4itWjVY4UghG+VhKebOP6CuaZQzBNuzME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SOUwGyo4J+i7rLD3KB7G6dfVcTDl/8JHabku1IMPpP5wRxBjYrigolUgG0198lPB4YgTflU/I/ppI7gyId9SfUn0oE+UI7m6qVs8h30IUbkW3WoXRXCHJKtLNzkxzQlAK0vbA6D+unMGULhVXJxrG7yVNRwIU1Z4NHqHgCaensE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSZtgP70; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSZtgP70"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d91ded8174so6673595ad.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Sep 2026 02:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788513175; x=1789117975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f2uDduOSprb24UTS5mMjO2bGXJg9YYeJ4jGweCvX+II=;
        b=GSZtgP70jCU/DHrqqoL+9YJEfIo0QLn+YCts6OD2xMSUQ6ahZUwdMo6lbNun1R84fK
         1edHF5c2sJV4qG1f2+CLFBeVqj984hIL9x784fN+Wx5Qex4dnyPscoYVCOXnzl4P8vsU
         UaJBkZon623OKBz8Ch/eETmrICss1SfYq0kZSuIBFcmlwKuKH28UOJ5ptSlb/KloshZq
         nG9aP0OYB64mHWKeeS9YudgtPdb8s7qKCHWGjEb/WZG+6HayJjWTo6s/q/f0HN7ZsGDD
         9+R46yJDbVAZ/hBaqj5/akMOq8coJPbxwjUaKaThf6M8SnY3RVUgbl7n705oKrEsas49
         d5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788513175; x=1789117975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2uDduOSprb24UTS5mMjO2bGXJg9YYeJ4jGweCvX+II=;
        b=U30cKCRBrJiiVktgo+YuLZ5AHcwTuhgGwhdwd04UihC5ALPSRpVQOmTZYzm29hfuq/
         TaP/r/lbEWhliBURpS629q62LFz005Q837FtToC4j3ZwoKEXDvwbSC20SPf5dwaG3HGw
         /iMoLk12q8i7pC/+fzTK8OYRN6Bs8n9d2YN8utvpIxebaun1kiBsKtmlQvmrjWqna9Zq
         ZR4nyXo+YaPzADprxw4XqVQmb34mtUUktl3VxRDbKQ2vxwgtn2BDDaNwiADud6PZ/XIx
         F1g8zUhm3alPbE4JrPzrL+pUxNCA78N6x3BDpg0yhoYKNNSc10Hvg4/66d4NMGrKPDED
         r6aA==
X-Forwarded-Encrypted: i=1; AKwUvBwG6ti7lGe4119i5boQk28imKcqACxt2+78VWLeshmM4KVlqxudgZWDbIR4LFCjB61KIZBIs9DuC/daKAT1c4kD@vger.kernel.org
X-Gm-Message-State: AFuF++msjJ82Dj6C+7ipu/gaimxHXPQMSBRNB3vpHjWDKcaTGYylY2dw
	rNEcYXP+FYZtYvk0U1Cgf36AuV4z9pcuUjxmW5yV4C3sJ8yL8s4MRtXnPvWpRQ==
X-Gm-Gg: AYBFou0K49z3Da7BRpBVhaBEbIs2dIYQ5iDPBCUcUu9cPDeYuBLRjdOZ62NFIW86xOx
	WeY1D3bkLmON2QB6akPCPwnGvmIKMTn4kB/1afQbUuM+2oeS+OICoSg+TmExIjqEYgnOcj3g3kg
	1FTzfV2AXnXtgqqy5HOBoL73RMJsmutnvda45Pqy6biAq065oAdri8E57GtvEYHb7QiVuPHkYsA
	nouoJPJHtef+VyBJIT7K/aMt0Cx3jyUaFy8RWb4fYs5/JsYEsaADTKhPQcxoZZWXaRW8uBTLxme
	FdTETEu/Kt8h8W6wrmde2mjZ9XtMEYrMUTlVqswqj/sOYeo5GNMdYgAT8eriyUVh3aoHg99T0zs
	P4x4kUsspHqoCcOeYvX1p+nvtAcB8ETRjWtmB8naJZYd21XkF7sitHWeXsFcOmiGxTKoiZX5T2a
	s8ZCHakF0AMW/6xplvKcxNfP0hdDCdCPWidYMH6lYNrGrcdbwCC2nHAtRyQg5ZxGhQ1sRM5pwRK
	Zrdnvnxe3RdzLX7y8l6H07yZhVmBSfV+gR5cQMUJhBT5VuJOUCL+u4elQzyvfP0HbQwdE4LMwQD
	Sfhb
X-Received: by 2002:a17:90b:394e:b0:37f:fd1f:d30f with SMTP id 98e67ed59e1d1-39b26272d76mr7654274a91.12.1788513175260;
        Fri, 04 Sep 2026 02:12:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612d3f1sm3443708a91.13.2026.09.04.02.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:12:55 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	linux-remoteproc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2] remoteproc: stm32_rproc: Propagate errors from optional IRQ lookup
Date: Fri,  4 Sep 2026 16:12:30 +0700
Message-ID: <20260904091230.58665-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Instead of only checking for -EPROBE_DEFER, propagate all error codes
returned by platform_get_irq_optional() other than -ENXIO, so that
failures are properly reported to the caller.

Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add Arnaud Pouliquen's Acked-by tag.

 drivers/remoteproc/stm32_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 1fe4cdc0a13a..a47e040c6db8 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -675,7 +675,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 	int err, irq;
 
 	irq = platform_get_irq_optional(pdev, 0);
-	if (irq == -EPROBE_DEFER)
+	if (irq < 0 && irq != -ENXIO)
 		return irq;
 
 	if (irq > 0) {
-- 
2.43.0

