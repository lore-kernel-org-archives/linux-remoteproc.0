Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504474;
	b=x/f/b/aNBvJxvVSCTAIFf/+8hsm/617U06NWdaUmTiAgudyHS2lGKDNmocLdKkeDw03E
	 OTDSmZKST4M4fOIf5IWyj1Pugidf6jGyX6e1/OVWefwYQiZK4OQjqzeLc6wVqiddr7Fbp
	 pFcM/FRmWKocCvMhQc0EZIwGwDC46ldA90yCeLG/KOBPtfbL4HkVjKjrQ6blhWuJ8rsaS
	 /YnK7GqNkzhKtIcrGJjKqXL+R6zrLcDt9p6TC3BGKJ2GQ7Hlo4KOjgYijFu9Vl85JdVDK
	 MmAtFdodjuZJxBpklZku1QOcM9KEVVXy2+TlMnheuEGyasNzhjVc66cVUPyGHyzm/tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=LAq2DbxeZILLxvhcSwaRL4Dj4tgtiHKeHZHk2yK0WuY=;
	b=QsChyvztx1EXsOP1qHkrOnyhUMlAq5G6yX1Ne7gmVI+rzCNFswjhFWrwqIcMUHJiBRba
	 1VNwuNDEPzk7G1TKZnvap0ixPeABudgZjMLBjUBA3jPA4Hv91XfB5GYB7zNR7jnZYXh/K
	 ollzyUGrKGcEEfnoy1lCgdN/Roe/roA8hVz4ZrJG1FtsoRSbh+TqLk+j3iOLC1uMnkJMq
	 JjmJSz65qoQR4Fk6/mbmYL/lgYZgxyAMtl28lzYe4UgLIOKKE9ei67mLatB/bdo2s0V5H
	 bv5hNUpdmgEVw05eWVw+ADXGlhhUQCEQr6omN1GEdZrkNVGlz8kvn4wOKR+C1YGffIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cno1UpEe;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19C2606A31E
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 07:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B19C2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cno1UpEe
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so2110534b3a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Nov 2026 23:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795504473; x=1796109273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LAq2DbxeZILLxvhcSwaRL4Dj4tgtiHKeHZHk2yK0WuY=;
        b=Cno1UpEeosAC6mD+3etNspr12WHfikJ8O5g72jn7q7WIx1rNlK0Ay/v/tN2cPWAxl1
         0aZPfNjZsXo20YmHdrfp7YTqHdvesiM/HQKqvdituSFEQuxeonbpnDzXOHw8SYnHM1qd
         YDhO5UkO1qDQMb/WQH+bsqTbF3bRx134MFGc/3zC/dfeU0c4xc0Z2aVcw6gqBw1U0HfH
         TXs+yRFw2IPmaHDArU28Xeo3+TK9C+T57FpB2Y3SEo7pzOm2SvSVmoS32DaBnHG/sW2K
         AAPrPfpKA9BPmOy3LwVoayeMvvjtznaHF5whoP9oE+mP/aTx18sglY9j66dMw/tyO1kw
         RSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795504473; x=1796109273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LAq2DbxeZILLxvhcSwaRL4Dj4tgtiHKeHZHk2yK0WuY=;
        b=F931PZpDlgndnsjdYXNSUESTqipmNLM+dQgmZWQUmE31nt4/bpuzQhZCn7lTVtyB5g
         rV1D/LiLskQ2SSSVZEuM/E+Aa4WtfWCAupqB6AfBRjPzhIC1SC8g9lnFBOcHJQKS6P/W
         lCNf2nF3QP3dTFrJo2hEnTB0Qjtl6/4nvRhxbnEsegXtRveQwDYPOxgjxwefFSNBrlu5
         +rOWiBkT8H4o7R1Mg5xbe5PI7e9sb/BjaGrqcUVwakOD5yos+lN81DaqVZGRseMlxDGv
         BJy/BJbU/XzNod75P+Xoc7hEIUAu119FlfHOGhtzyGFA+pTwoxj9pjicUOpMty4wMQ8d
         Wh8Q==
X-Gm-Message-State: APuU4Z+K5B/SSzxwGu73PbScs5FowjXl8WqdZQRPLMSHEIts0y+JCcUm
	rqfMfmOk84NnUAJRmU3GjR2Xh/3qXwePaHn63na85crNeeeMMG6/IwSH
X-Gm-Gg: AZFdTZdgrW68S2wqBr9cHwXau99hNBLuFkbe7AOKfUXefTZqWDOoO1AqcF66FzZ8Y4T
	PQ3dq21EBoZ2yyxXyX+ioWSOCU1jBIc53KhOKS0x1kTSUjZYnBBexu/wzRzOq3FlFVi4b13huff
	0qRvin355E1aH5Uzkq6MBfoq6YOnmP3HliMkCJCMlscOFZbgx346bThtgpygd9SzPAHi02ci71h
	R/xjnL1jocP2HhozJ5CJnXC1VMJhwV6UZhrbJYTgKVNh7LBU9D6RaKmcIAJrumqTRFGT9FeovV7
	Rs9HsPRiFfyAdZy29c8erktr1dLtrJGeq60YpZ66DwaxvG5tT+u3e4QU/1bNtCeXfAWNPrmtTzY
	twXJkSLC0qGBuxFNgwrTumyKIDw6rodwX7WXOEMh1BbxniDLEjkCxTDmHHm6plZZORN8Kw5faWx
	b/Q2SF9kzfjdwkpT59YwzoypGJIJUFlRko+n343zkfafpZdpN4k0ddIoblpSilN3469uVqB1aNJ
	Lz5/plTeB1O+AGxg/11xs1PnvIB2ErpgfDI2yGbzFGRajL+zzgMSFWNUzUjwAPWtGzbLQ3keEnO
	GLPucNEFw8pvqVKeG3QbEjSVOHyPgLfk174F58kwKEIDfgNo
X-Received: by 2002:a05:6a21:4cc1:b0:3e0:dbf5:59f1 with SMTP id adf61e73a8af0-4014e6565eemr12593150637.91.1795504472734;
        Mon, 23 Nov 2026 23:14:32 -0800 (PST)
Received: from embedsky001.tail6d6b2f.ts.net ([183.13.19.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfcadffsm6475836a12.9.2026.11.23.23.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:14:32 -0800 (PST)
From: Yonghao Zhang <hyz3367@gmail.com>
To: mathieu.poirier@linaro.org,
	andersson@kernel.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonghao Zhang <hyz3367@gmail.com>
Subject: [PATCH v2 0/4] remoteproc: core: Fix the error unwind paths
Date: Tue, 24 Nov 2026 15:14:05 +0800
Message-Id: <20261124071409.972-1-hyz3367@gmail.com>
X-Mailer: git-send-email 2.34.1
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

This series fixes four problems in the error unwind paths of the
remoteproc core.

The most visible change in v2 is 3/4.  It no longer reworks the attach
unwind to prefer detach() over stop(): without the STM32 review that
behaviour change required, it could not be justified.  The patch now
only guards the unconditional ops->stop() call against an
implementation that does not provide it, exactly as 2/4 does in
rproc_start().  Implementations that provide stop() keep the existing
unwind, so the STM32 detach() path is not affected.  The detach()-first
semantics can be revisited separately with the platform maintainers.

The patches:

 - 1/4 resets a freed vring entry to FW_RSC_ADDR_ANY instead of 0.
   0 is a valid device address, so a remote processor that reads the
   entry while it is still running could mistake it for a real vring.
   The sentence in the comment above the reset that is no longer true
   is dropped at the same time.

 - 2/4 skips the stop() rollback in rproc_start() when the
   implementation does not provide it, instead of dereferencing NULL.

 - 3/4 adds the same guard to the attach unwind in __rproc_attach().

 - 4/4 releases the resources of a boot that a failed recovery was
   trying to restore, following the cleanup sequence of
   rproc_shutdown(), and voids the power references when the failure
   leaves the processor offline or detached.

Testing: on an Allwinner T153 (sun8iw22) with an E907 remote core,
driven by an out-of-tree platform driver.  The vring reset of 1/4 and
the recovery failure of 4/4 were exercised on this hardware.  The
guards in 2/4 and 3/4 cover configurations that the in-tree drivers do
not exercise today.

---
Changes in v2:
- 1/4: Keep the existing comment and drop only the sentence that
  became obsolete; trim the changelog (Mathieu).
- 2/4: Select between stop_rproc and unprepare_subdevices at the
  rproc_start_subdevices() error path instead of branching in the
  shared unwind path (Mathieu).
- 3/4: Replace the detach()-first rework with a guard against a
  missing stop(), so no existing driver changes behaviour.  The
  STM32 detach() path is not affected anymore.
- 4/4: Describe the code as applied, follow the __rproc_shutdown()
  cleanup sequence, and check for RPROC_OFFLINE/RPROC_DETACHED
  explicitly; trim the changelog (Mathieu).

v1: https://lore.kernel.org/all/20260929075453.2324597-1-hyz3367@gmail.com

Yonghao Zhang (4):
  remoteproc: core: Reset freed vring entries to FW_RSC_ADDR_ANY
  remoteproc: core: Guard against a missing stop() in rproc_start()
  remoteproc: core: Guard against a missing stop() in the attach unwind
  remoteproc: core: Clean up after a failed recovery

 drivers/remoteproc/remoteproc_core.c | 47 +++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 7 deletions(-)


base-commit: f39ba58941efa63e6c7d10d53d183d6077524bdb
-- 
2.34.1

