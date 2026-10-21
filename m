Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601166;
	b=K/uy0ZgVzxkphTGE/nzAfIMhnnxNV8+mIfV2TBiZhnpXLtCkOVONpeKUhAt5LIS9bW23
	 ODKd4lXSB/lcMHT5XdSLAZb1fUyXKt8JY0O88bPUx6mLYFmqpQvRPPebyXtFJZiXIcGjx
	 hAIf0DNoBLdA6pEq5wN9erWJPTnz2HtMMRuMfX6s1FfXH84FQMRQWGRr5KKMWln75bP1y
	 L6dxiA96wPQZ5+M9EULERaBTSPxZ0xluG7fMkbQi7EAuSCnvx5djEOL3C9GQkLs1dc/05
	 sI45Cd62j6satr2+1++gavs9gOf+vfNzvziaU1VcugoZ3WoWu4MszbVtF/SmSw8fvrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=dF4yv29xeHxp5oouM1g/+wO1bkqJd+iEZY5rkBGL5kc=;
	b=fCdZszH2nO01VBVCWJ3xmu0ZXnu+aFdwZ4ZcbRfSk43Il/JKM4As7oVdXc3A5wg9j7Zl
	 1gYkFtv/JKlN4W0mKyzy2DN1oxzQDZ5JkVRxYMqZfALDtZeVnPwEV64MMJHtYH111M86s
	 tIXpS/URFTG4i5mgGVcmbJDmLM8/4uGqR0DMD8NsiN77iNi0UINW9bfSY8+NOpCZb22l5
	 iOmHhJ8mR9+IiOO64ItUlssjYEIFGKjKoYFzv/Z42trGay30aArQu5itfAG6wI+78PkvD
	 cYh5Mq/llaeXaMkZug+oZEhfFG4Y10L3nqit+m+eF0sO2OYOXm04A3hjzkntZ+kkXyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Hs5Q5RBr;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA4C606A31E
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 16:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAA4C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Hs5Q5RBr
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so32629b3a.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Oct 2026 09:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792601165; x=1793205965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dF4yv29xeHxp5oouM1g/+wO1bkqJd+iEZY5rkBGL5kc=;
        b=Hs5Q5RBr7Ssh5S0squT+11n0j7qso9pKq9aeNkxI2xjRWFoTzcCZLqCtuhjwOg4ZU4
         ESD5rXrSY8ykcIuQNUA+1/B4QzwyFq3ogpxbQJqBg3nr6OY/jDyQtKxsc0WXELJgS9uO
         tGB/RquFMua1Hi5WYIeFJ6VxwI/Wj6ytHTFCanbj0/cAelq4jpKH9AqC5VS24ku11zBZ
         MIE7VBtvSh/JnVBY9i4wDHBe5gCVZMCRA8VYpfMeCmpiU32taKe8Y5LeZEvTY9WO0eAb
         obCk43GkeN70HwLVCSRVnodQwJ/1vtlH5fimsSE1wFI2dKgN2qxvKgLYNvTAW/KCCIDX
         GKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601165; x=1793205965;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dF4yv29xeHxp5oouM1g/+wO1bkqJd+iEZY5rkBGL5kc=;
        b=XHAvCM3g/T5Yg6J/NB6Ka3v9WIrQ9xyAbOlZwctZ8B5RGwiRqoZieHUcgc9Q5CThB1
         p9Cj/UkN3HOVNBK+97Ws/8YOAsAi7UtRLXxsanma5vKMBEQB9c5U9Dx+FfWeTwK3FNrZ
         9XsoZMavfhjR9BguXRHdFUh3cx4PkBXLwZjww+nAvCjPMVeS2Cbc5VLT5AqpkqmmgtBu
         kv4/ua6CTn2/xgxMAXgIWzM4vGDU74ucAORRG3+bTp//zwNgNgrSufEn6mQt64/5sgSP
         MidxIC6f1GCuRifLuJkuoY/M1qKw9VbRcpAzxjKTooJqpjDiDtzSlXnXOG3RARgf1Xvu
         cu/Q==
X-Gm-Message-State: AFq9FYIGtVwY1M3tP8zKN33QGZNAU9+9L/qIZOB6nCqCgCHWHrrWq1wP
	eJNnmCSxfYTcSR8cSPayYBYY0L1E73IcE0Y/6gElX8r+xAhwTDIt65E/+aST6apMBOoE8fBzcFy
	BfU8K
X-Gm-Gg: AYBFou0NBWc342ZEZyOj/Fw9sXXPKqfzKR/UOUFFAd87+pi30F7+0551e4ibig2v2yV
	S0lEL0QPAdvCq4SEaePaDnh9V1LpH+1/HTM+119prywY0ZUA8fDn98RKxhfcV7N38S9w0lGr0Db
	lb/tCukVXISPCiGiSPYDTrTfXRqdv/McONIW4l0Ah26C6jkjkXF18/pU9TixFsbEfgUi5jezLPs
	PM6yXaYO2cZT9UUezOOkWDbDY6wFfuTmlAJkPDqzTDC4kUu74nCQqsmyqBNpPFDw9b6JIrVCFA7
	4cl3NbbLbtN8SSgEFATzmfwjGbRyX42TQvxnM2WWVIofPWAsWARba0S6DlqaJmSdHBJefdwfxGY
	vjJK+bSev5u4N3VcLhmTwQ5MgWf3C9lcCMzXu8c/VR3b0to/BNoWH3bk7ABXp7L1AyaqKI34Qme
	QS10zghvsJEIklL0dr+NG+sM5hxM9aRrvLIuv0+IxU3uRYG16lNX5AGIjc4TgSlWBZJNgtYBZ0F
	L0sRX9zLBcyo+j2il8eZQ2zLn1y1hyjyNB9puj3Os4hYwdZHioWe18aVp6I
X-Received: by 2002:a05:6a00:4003:b0:8a0:4e73:7e1e with SMTP id d2e1a72fcca58-8a07c041050mr3232851b3a.44.1792601164858;
        Wed, 21 Oct 2026 09:46:04 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8e8e:37a7:da6e:5dab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895c109csm1143100b3a.24.2026.10.21.09.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:46:04 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:46:01 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Atul Akella <atul.akella@gmail.com>
Cc: linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/2] remoteproc: mtk_scp: Fix bounds checks in da_to_va
 callbacks
Message-ID: <atjsSS1_dA7nhXmD@p14s>
References: <cover.1791198233.git.atul.akella@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1791198233.git.atul.akella@gmail.com>

On Mon, Oct 05, 2026 at 11:25:16AM +0000, Atul Akella wrote:
> mt8183_scp_da_to_va() and mt8192_scp_da_to_va() validate the device
> address and length that the ELF loader passes in from the firmware's
> program headers. Both checks can be bypassed through integer truncation
> or wraparound. These two patches fix them with overflow-safe comparisons.
> 
> The fixes have different origin commits, so they are split for stable
> backporting.
> 
> Compile tested only (arm64 defconfig, W=1). Not tested on hardware.
> 
> Atul Akella (2):
>   remoteproc: mtk_scp: Fix bounds check in mt8183_scp_da_to_va()
>   remoteproc: mtk_scp: Fix bounds check in mt8192_scp_da_to_va()
> 
>  drivers/remoteproc/mtk_scp.c | 32 +++++++++++++++++---------------
>  1 file changed, 17 insertions(+), 15 deletions(-)

I will apply this set when 7.4-rc1 comes out.

Thanks,
Mathieu

> 
> -- 
> 2.43.0
> 
> 
