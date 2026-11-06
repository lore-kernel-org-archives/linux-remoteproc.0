Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990619;
	b=MJt8WgvttlOU7+727wWOifRvf3HE4/f/pc7Ub50XdRSdVzFen1j+L1OeawjZl5+OaEdt
	 ofLOB+JHXafuTsuwGjm6HNNdvZSCC75vH6CUFl1C0qr9dXqpUWiVHB1cMKh+J0prYQ4Di
	 XhAbZyy63RvnKRO840BDrz3RCQvGfFHQuiaS63OLywiLxcNV2DNnA4XPeCe+YHkzhs+39
	 VqySxkQU9idAKZXSSY5S1ebg5P6k1MTJ3yZf3bipk4KGN2YobaZbukpOqypug4Q+RzqFm
	 qBy8pRFeG39Q0dRW80tivx+maAukeoiY+2BydMBaH7vhW06cuGqisVgagiMLq1BQoLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5QKJmKMjkfOGpFABXHpSYbL0DQQPz9RbFTdkuxGPANc=;
	b=5XqOkcf2/Q1BVkeZ93YF8FRx9HuRQkWgqXBR29CN1g4WevmJWHBv4hLqdgOD+0Pq/1ly
	 wZq88My7jGMa21NsvF/jT3fSf81/mfIlXlm8mnSu1fUOlJX0GlWg3m3W1go6IEnJFylj/
	 nmhVLjT6Ujz7VU1p9faij5TOsxbYpvo5oUcoICvOwXMzYYeTX1+IJtX7+PwVjvRTDjZzK
	 2jl0iJ4OCSNhbQ44mHIYVY9RThH29+kXUvTcQCctfuUxua2pZitznAx+1krGZ2cbuFKgD
	 mA2VQibcc671c63+zZBV5gccVv160JzAJR9QzjSUQUdZDsPaz6zZ9+5fVmKhe6v4vaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ie83F/uF";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE695606D805
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Nov 2026 18:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE695606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ie83F/uF
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so1784099eec.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Nov 2026 10:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990618; x=1794595418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5QKJmKMjkfOGpFABXHpSYbL0DQQPz9RbFTdkuxGPANc=;
        b=Ie83F/uFyrVvA0/rLV0W04tYhHf6e6Cpe7Y6MzfUmnHvUN6DPHPiDadmgPBq7S1vw9
         Ti/H6+8h1/yQczrluJ9FOmwKR1ZBvkWm+5kfCom6MegrpnwGxpgq/qvkkZ5Y9Hmra3z9
         mdnMi3gWUsLNOvEIK5EgSgWOmF7029ojTahMe3ehiyokJ+zXDGPVefiDLNVfk+bqesOD
         SXKwO8WgR78UJaDk5lPBD8xr25XyztL/eiuNh5V9nxbsPr2KssLVh+B8ZBC6PosPkkSQ
         3fWOPFm96SjEfX5z84DDedWKEy9vab53DsAFfn6roHaJMPhGT0hyOuM5GPj6kn7jX4Om
         +adg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990618; x=1794595418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5QKJmKMjkfOGpFABXHpSYbL0DQQPz9RbFTdkuxGPANc=;
        b=xR+U+krbWxZ5GGfywdxJwsHnFtn1wOi0yRnR+yMcBKaH89+N9XsRdA2n1TeGSTO7YF
         c2D+/i9RwpbQ6vFro2uFSH3RtFxDu1nboBDpbUIjfII17bO/Krfsy+B0DfAisV5yzuaN
         iO9YaSe4COYURkFwQmB3+d53m+0LcyznRWq9kgI0/dRgjGYuaRgKv4ThHphSqPwSlJpz
         bPaKlw/2GhRshVQ3rJMd4mMHym7t9/Mydf6CzcTzisPbOckK78dO99xbQduGV8Y1QFhz
         M+adz409dXrV/I+uMoE2SUXw+q4qM2RMKFDULEXr1GIA9JfGvZmBeUAqqYY8S/hS5nqB
         QsJw==
X-Gm-Message-State: APuU4Z+uRxnCAwi37g6W3sipIkRgphY4J6+Yt6UEkXzdspOv3G/Esxb0
	BnWAUCZtkgzyKytrWEL3InPbgEJw7NirMg68buyYYnzVnhxhiDU5+0Q2
X-Gm-Gg: AYBFou2HBjviDK6XloIfRjQ0ptQwVCfY/jjaMy1z81tnvM0PLsE8qAY86oNUzQSVg0i
	fcsPvLei+N1t+AJrsB43RQeg1YUu0cEwJYRG9n2PdqxQg4HflDrnfeHWddM+RWWwBfMclx8gem8
	CuEdOqfsYHr2GPmgDWDF/BFr5zcp4928RLrBIo3vjtjuWvsXfXeaoymIHY1xcm2Czw1ZfUl6kTB
	C+w5XOmTLe/v5Ag7cewvgb9Slp411yHNfofG7JbPOIu0VLzBJWuy4fsNp19dm0uVbKJ/t6eYlMG
	OjpwLnA1+jw104V5bpTszqgBkP7ouJ47EO0kboFwpmwEnxzOaAzTJt/SYVGvfQRyVr740SLQWOK
	GMZz6drPJ9Uvm4emi5Ew4cdOrfXXJtMzLqz2nvQalIA2fQqJSO/S7B16+TDMZlpBjuL9Rfmb+6G
	ui4XsBupeSmVYKJZ2sM469Q146YCvNvM0dXPHxchNmrtt+Slcbs04EVVGvAM/XiZPGEqw4rVPKO
	YgxYLdl2BY/6VKvXLSCHSQDyb5kuUrM1fI8R7dfpU6XZzSoq4YZ1KtxA/5Et6wSFKnpPoZl5s1N
	mDrxAtrDHaLPrMUqw6u1OsbPBFBM
X-Received: by 2002:a05:7300:b196:b0:36a:437a:4c00 with SMTP id 5a478bee46e88-36f7611ec7bmr4202731eec.24.1793990617663;
        Fri, 06 Nov 2026 10:43:37 -0800 (PST)
Received: from JMD ([2405:201:d028:10ff:eceb:5028:6b10:da7c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea414sm8278073eec.16.2026.11.06.10.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:43:37 -0800 (PST)
From: Atul Akella <atul.akella@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	sibi.sankar@oss.qualcomm.com,
	quic_srichara@quicinc.com
Cc: linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Atul Akella <atul.akella@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/4] remoteproc: qcom: Fix bounds check in qcom_pas_da_to_va()
Date: Sat,  7 Nov 2026 00:13:09 +0530
Message-ID: <20261106184312.100-3-atul.akella@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261106184312.100-1-atul.akella@gmail.com>
References: <20261106184312.100-1-atul.akella@gmail.com>
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

offset is calculated as da - pas->mem_reloc and stored in a
32 bit signed int, while da and pas->mem_reloc are both u64.
For a sufficiently small da, the 64bit difference is truncated
into the 32 bit int, bypassing the offset < 0 underflow check
with a small positive value. Additionally, offset + len >
pas->mem_size can itself overflow when offset and len are both
large, providing a second bypass.

da and len come from firmware's ELF program headers via
rproc_da_to_va(), and the result is used by the ELF loader
to write firmware segments, so a malformed firmware image can
cause writes outside the carveout.

Rewrite the bounds check entirely in u64 arithmetic. Reject
underflow before computing offset (da < pas->mem_reloc).
Replace the addition based overflow check with a
subtraction based one (len > pas->mem_size - offset) so no
intermediate sum can wrap.

Fixes: b9e718e950c3 ("remoteproc: Introduce Qualcomm ADSP PIL")
Cc: stable@vger.kernel.org
Signed-off-by: Atul Akella <atul.akella@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index f37b77ae187e..8cade27a6495 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -473,10 +473,12 @@ static int qcom_pas_stop(struct rproc *rproc)
 static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_pas *pas = rproc->priv;
-	int offset;
+	u64 offset;
 
+	if (da < pas->mem_reloc)
+		return NULL;
 	offset = da - pas->mem_reloc;
-	if (offset < 0 || offset + len > pas->mem_size)
+	if (offset > pas->mem_size || len > pas->mem_size - offset)
 		return NULL;
 
 	if (is_iomem)
-- 
2.43.0

