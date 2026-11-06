Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793947869;
	b=PDEKKfrR8squesBjVK+AjOTp30Ur9rviTXdp2LFJSvLOwniHbw+b1WehUfPOcbMv7E40
	 YMk++iNiX3Pp0TuI/1tLp/vqJuoAgzebJa49soExq9DjLblxuoSiNfsmhCE7/ouWUC8Op
	 wM/HMcirog45QTDs0Aj8F938PN6ZV4UQm7RAYbUUibGmbApOb/DP4lqewdTsZRC+VRUYg
	 0l7FWtEyid7P1bEOMrJtAsOKTuSWHsG9dEtXt5VBiCvSTI6qMvsXQ33GeT17cgAqcvxgc
	 RbZY206o1YyO5B29/+nKdd5JRALSiXlnbqdiIrYygXoW9NTJPUBT14asPPhy33Z/ubg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793947869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=HY6NyKTM8r0x5O+rVjJnGBZO/BpAxBcqOXQFhbzKwHQ=;
	b=TJc4e/8/hMGOGJEYDeEP3mphKOkgjxn3y1Ui11tnAILPV88CWPiHFzrZm6LixCsA77N4
	 Uek9BcMQbJdwAb0zakkJz5g64SnCCANDgH9LY8m9Y4ZVjRWcr60vMPoNSanA7wDpUpzCf
	 CtFGtaTO989ZXTv+sGjdvxxdavnQWXoDTi3ziJwll4GP0s/A0K46trNjIxXu6yUx6aid9
	 Erx5M5HY//ofHV7TJJ6uNHSXJ+QVrfoHnHuPnU9S+dW4mO+SVqIMmTcJ2SADZUvnIegao
	 ba3igrhL+NqQkd7+yBlKfTUNDfR+56PzXv4wshx0/h71+1wjZMOTyTpnAl2Zw7ebsMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWtVX+9y;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6BF606A33F
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Nov 2026 06:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E6BF606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWtVX+9y
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so528840eec.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Nov 2026 22:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793947868; x=1794552668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HY6NyKTM8r0x5O+rVjJnGBZO/BpAxBcqOXQFhbzKwHQ=;
        b=OWtVX+9yJiDrq0rs2SpBd1em1ofisUH7B0auKEjhCJaJR29DjdEYtxDQlX+Dw88AH3
         3scUaZMgYjvdWP6yejXOIoQTt8JFDEsneRU6k+BjRU/wXaYOyANu40T81x914lb0M4Nc
         kfIa1BRPkCDHu3LsYSyKL+1kN9OrruoODUS3W8BbQEXCjrd7RE5Dy7LlKw5LElg8OlLU
         ScnnOIekOhEoMnGJBQP1n6VtNynZ/4Gro8USt/QjLxFhILpJVqWByAJy5ma6NlqIpFgj
         w7TbiXpwxmWNXntPnIEsFqSIcgVSfqHazGSBIyGTO3R7L6GuTCTxsE7wuFbJOVVFcnai
         NfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793947868; x=1794552668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HY6NyKTM8r0x5O+rVjJnGBZO/BpAxBcqOXQFhbzKwHQ=;
        b=GsEnGEsq/1dh5ZwnbGfK6mdk0rB8Il6EKF7fUiZ567e/pzg9ISOr5VnjuciPZpLnqs
         aA+F0e+AuG77wHAxjW3PO62yE/b/TPyMtoezqg1JsXRmA9MOHf14SaFg4DdshgEIxS6C
         WJxK1so/svT3tMpP21HTsRCDzjLrfxyrXwpR9413qVrTBcQwsZD9nrvxpyMGnno1QRsq
         wByM0XWG79ZhbExIRfqstIdL2aAwYQsFmGapgVJ857TRuetp3fvCFLuVxMenHWLzxP81
         k7e3w5PaV6lVHarsAMoD1i5RWgf97cvfohfefin9kF3/VZI2gtoQk+4MH6cwXuLhF9vi
         t35A==
X-Gm-Message-State: APuU4Z9BiDxJz4BumLMnHVfJZvQw46fTTA9pWWF30gYIoWY3ecoT//ZE
	gK/JI8jcNMayDQWw8Z/ohsxiNoTMkoa1UB/iSW6yjSSa+lG/GANmqlUAuxT4N7fCdmc=
X-Gm-Gg: AYBFou1PMmPtjH/TqhCH09ZgRlM9NhRdPuHNxgz0wcceno57NK5fgLckexEdSdSNu9J
	IyMI2H3OXI2sMBRPEiHMZhdxxyS8WH7/YKXXpx2YVaezxLkKxcV/r4M5TXteeor+T4ZxSCKaehi
	NfcNXbZ/rdaI0stSzqaxPC3EGrZreT//NwG3btQ7ZOtcIsUbXUz3TiBt4tz7/Df6JGq5MW4CIl5
	u8LQEW+wQBP2LLf5sxiS9vRdrrrn0SAOhTp9BVvM1oiDEPUAVtNYSrLYmT8N7k62ETD/HIikTn0
	MUOtXrTtYOpk1jHC6XOQUvEbE03yjP6W1Sb7OUTD7upuZBg4y9I2rRUOtYQYUChoUPJ+dpoR4eY
	HvljLBE96edAZ/dq0K2psAwca6UBdXiWIrj45mfYoVAFvEy4GVEkOnzGsQrqZz7ulPhKXc1lp/3
	AWNQIrbNGI9SKe3Z+6fM3EiCqvWF0l4loeX4P9Pa0mFVtihiQDveTmUi0N1to4dHfs65FOhvA4b
	JawYH9D257rz3SD4mvrY0BlRmj8To4VymU70G85hfGjZ20sq0u8GTUnm6EuLDEKu1kbbUJSrUmI
	l/ocA4oIVZ9C65GIMj5kuBq2VRGCEyL2U23ZFySXME0ig7jk3MiT
X-Received: by 2002:a05:7022:3b83:b0:1b2:4cc7:7db2 with SMTP id a92af1059eb24-1b25d34ed54mr2078977c88.47.1793947868395;
        Thu, 05 Nov 2026 22:51:08 -0800 (PST)
Received: from localhost.localdomain ([117.20.154.48])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4d22cesm3196906c88.16.2026.11.05.22.51.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 22:51:07 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] remoteproc: core: Do not put the device when device_add() fails
Date: Fri,  6 Nov 2026 14:51:00 +0800
Message-ID: <20261106065100.44269-1-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
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

In rproc_add(), put_device() is called when device_add() fails.
But st_slim_rproc_alloc(), xlnx_r5_remoteproc and the other 23
drivers (which use devm_rproc_alloc() and so devm_rproc_free()) then
call rproc_free(), which puts the device again. The reference is
dropped twice, and st_slim_rproc_alloc() uses the rproc after it is
freed.

Remove the put_device() in rproc_add() and add a comment saying why.

Fixes: 7dbdb8bd7c02 ("remoteproc: core: Cleanup device in case of failure")
Cc: stable@vger.kernel.org
Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
---

Notes:
    Changes in v2:
    - Comment in the device_add() failure branch (Mathieu).
    - Shorter changelog.
    - Rebased on rproc-next.
    
    Bug was found by kbound, an internal static analysis prototype.
    The reproduction was assisted by Claude Opus 5.5.
    
    v1: https://lore.kernel.org/linux-remoteproc/20261029130037.5505-1-izaiahsun@gmail.com/

 drivers/remoteproc/remoteproc_core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index d5fa9d23bd5c..d0b1f6ee49d3 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2312,7 +2312,10 @@ int rproc_add(struct rproc *rproc)
 
 	ret = device_add(dev);
 	if (ret < 0) {
-		put_device(dev);
+		/*
+		 * Do not put_device() here: the caller's rproc_free() does
+		 * it, and the reference would be dropped twice.
+		 */
 		goto rproc_remove_cdev;
 	}
 

base-commit: b16b5a4fdf7d1f4ec15a53622d9b66081325fbf9
-- 
2.53.0

