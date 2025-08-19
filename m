Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88605322A1A
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 11:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755601705; cv=none; b=rmGY4ZWxoo2i1ywASfwXRRnVmb4+ZJ4IKzBAr/uEyVpt6/rtl8hn92+DD7sry1QODd2oTU8qaJiVUEMSc3Quy0uzSmXBBL4wmroiP1EA/CQpvj1qd5IaQ5raetowV4BeYkOklWWsyY0LJFzuQr5/G4M6MVD23Qo8M6GHN5TL9k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755601705; c=relaxed/simple;
	bh=FDAp9yWzU6h2a01wyYHSgRU7k3MWfcA551Cze90JEG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XDfyZrAEzXWxy2S9O6Rbp/qyM3M09/6+5zwcCsTf2Wo9du9bBKWD2KUYCOa3y+9iP6ZGZJjaRWiXe5EcbdzKCchtXMBchL2m9Jtxgk9ytMo8K4zm26KLLTNgGEE4RDFm58Q64w2e0ZLJum40Jfwj0Px+zhEiwA9hhfjzCKN0w+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xgNIohIh; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xgNIohIh"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6188b5ad4f0so6924374a12.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 04:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755601702; x=1756206502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqqWuSSSaSs4/5B548uIsqcez7udu8s/zMuVb9X/jRU=;
        b=xgNIohIh+9ndLl+Wl3N64y7YH3Y3/TbI6SrWuwMwHho3k1uclPbHPkdkgYXlY07cx4
         aVj81yWjAvTcHifWJhiCuwG+pOIrvKqJlGafSTHGNQ+QMUcDkplpkA4aWViStPOphzxc
         tbgmkM4Lj76BXLd1qfmcFLD36Wa+dB7vc7/mBc+Kep4vnnl+u9pCEPn+c46aggRcKYbp
         vAil5mOJ+bURC4uL6ke2DasKa8YTwLpTa6shm+8g6HxvihtpESUNlHy8ZZ3rl84sfL/Y
         dMcIg+29Z4Gu0oV2/PjqEx67ZSaG4WA/jTHrpO/0j4RcyqIxYE8AqsRxrfB8BsTcECFA
         6ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755601702; x=1756206502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqqWuSSSaSs4/5B548uIsqcez7udu8s/zMuVb9X/jRU=;
        b=QMBUnYNUezHrByRstiUg1x9WEqRO6jNo9QRoryfZusBayOVg79rhnAKY1ssj3N+Cjf
         b7h+4ivNbMSyCrm9uQqubDQWWsnERpEfU/HJ0B729wK5nfSszIRDuVPfpYBcsouu/O39
         V7V1bN4yHUeiREuKRPDD8IBPCp12qBwCRLjX12hRxLaStrXBvGmEinVeyixwB5d7wOtG
         EEfYUhg7L7hSYIPrAPJOTyaKMUBCiq4o/nxP8z8Fp+DUjAgYCHjMQidI7M9NxkmLoxix
         DxKHHqGdr66nw8TmD/thUbMaztvWv3cTRjhNvo0VYpzPdJH1xkCDOT0VTe2ZldNyh1Bp
         KiVA==
X-Forwarded-Encrypted: i=1; AJvYcCVA+8yISHmh4ziDaALWki6pP2p2wtyI8lzAmAUNRohQpWsGHMBkasunQ9PTKfogFrovp//IrJQa3wIX9CetsF8F@vger.kernel.org
X-Gm-Message-State: AOJu0Yxiz7O/f4mQ0c0doS//9MPTgL8dTs0I2H8/lqLjCbmj8j0DdDan
	vd1bD2IMrcKRdnoVbd4RoEFtz1IKJT729RgZRyC1Mo3e6bw6XC1SmgLZd8cKLM/uc+4=
X-Gm-Gg: ASbGncu4KxkXnAGneVM6YNCoeZLrTJkYVN6dwO51IDSmszmdhixFtM9JDrWzDY03At6
	tR5Au7Kwz6km54Cfye3gfXAUh79tRTt5rkfEk+me9Tjltj8qugCpK/FNvmTVlYg6bNHsMWuJfZ9
	kiiM5grPS2omoUyjzYtO6iQFA6+ABtVwm3kCwnQGRwlJnsRo6tq1RhyvAEMlv3FaD7Sj4CMH7Pr
	04315ZDXIX1eSxuSPECeXzwEj3IcpYDOvrtPG5dBL7eB9z9bDeovodwzS3HO0TQoR2ucLwvtBEK
	4G50zEh3+GlKLjR5BMADWQ+vxqVuYa8UdaV1Cu9j1s0wwjl3hAsXsl1GvS9kHXrvcL9Y3LRqpCn
	qjG1wt/hWCUfIAndgX/YxyisiIHocCOYbAzTJyVIGKZs04zPb
X-Google-Smtp-Source: AGHT+IEu47SOpD2q0+bOP6DYIa6GuWe1e9d5W3TXltO+50fVmPfaG/a5eVbK0rgp24zmwdwtvRU6Hg==
X-Received: by 2002:a17:907:3e10:b0:afd:d9e4:51e9 with SMTP id a640c23a62f3a-afddd24e9d1mr167513266b.65.1755601701738;
        Tue, 19 Aug 2025 04:08:21 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:db5f:8096:4609:9b24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd01096csm974845466b.88.2025.08.19.04.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:08:21 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 19 Aug 2025 13:08:02 +0200
Subject: [PATCH 1/3] remoteproc: qcom_q6v5: Avoid disabling handover IRQ
 twice
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-rproc-qcom-q6v5-fixes-v1-1-de92198f23c7@linaro.org>
References: <20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org>
In-Reply-To: <20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2

enable_irq() and disable_irq() are reference counted, so we must make sure
that each enable_irq() is always paired with a single disable_irq(). If we
call disable_irq() twice followed by just a single enable_irq(), the IRQ
will remain disabled forever.

For the error handling path in qcom_q6v5_wait_for_start(), disable_irq()
will end up being called twice, because disable_irq() also happens in
qcom_q6v5_unprepare() when rolling back the call to qcom_q6v5_prepare().

Fix this by dropping disable_irq() in qcom_q6v5_wait_for_start(). Since
qcom_q6v5_prepare() is the function that calls enable_irq(), it makes more
sense to have the rollback handled always by qcom_q6v5_unprepare().

Fixes: 3b415c8fb263 ("remoteproc: q6v5: Extract common resource handling")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/remoteproc/qcom_q6v5.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 4ee5e67a9f03f5f766f04396b9a3e45f77293764..769c6d6d6a731672eca9f960b05c68f6d4d77af2 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -156,9 +156,6 @@ int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout)
 	int ret;
 
 	ret = wait_for_completion_timeout(&q6v5->start_done, timeout);
-	if (!ret)
-		disable_irq(q6v5->handover_irq);
-
 	return !ret ? -ETIMEDOUT : 0;
 }
 EXPORT_SYMBOL_GPL(qcom_q6v5_wait_for_start);

-- 
2.50.1

