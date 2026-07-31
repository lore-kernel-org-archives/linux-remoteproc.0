Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D70F31355C
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 08:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785487348; cv=none; b=fS32zq2pKM9pXpPmnwMF9c02nZ44lwdZDDsTYvTrhQHXg2pteyWasX/90bCCIlwuoFOSedNepcmcJb8mwDzvtJgP2FJisvq1HZysnnAMdh4jcIu1xCLcp0gK4NbZkZc1oHuORigxMdTrzSHy1XDEAWeGMZq4yVBR2CSqsPtKfEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785487348; c=relaxed/simple;
	bh=2bl5wAmnUTHzjKbybxG5QyI0LMWehbAV7C+Ga4rO9Pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cn8SvgUw2C+osa23rafXAUJuZC0QKR7Kd6tGBDqmdt+IIBrp1goeidMzOmA7u788zauYjOOTNTB4h+GCH0Xe4mqGyGA0GMwtLUtLq7YFuoktFZZ4g132pKuHu00Sseloov1oMZC06v5b+w94KzTgAzUje6VnLxk12/i3FCXajYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=juotZF77; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="juotZF77"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c197f968b3cso102958166b.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 01:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785487345; x=1786092145; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6YYZSGPYrwfGLVVwyM4m5pQRYBmdHVg4RU/DDbjdfi0=;
        b=juotZF77xpm1qy7mRYACsQkXQgMvCV4tJsz3Ah/81VBK7t6+NrIwxKD3VAetQyGUtj
         dKKfDIYFmoo1nbJ93BTwq3lZ0WGnKxp90T7ZPPPk/0TojrddsC+nZQPxqOULdDOL6zpH
         5HmKOcSbM1u3B0+EeG5XNknJ1ElubKmubNGNAOGStnXyVOqaOiiaHU8b7kG8j5b5XRe3
         QGjzFpNf0IpvkblWqCD/Z86ocIrqYoKV57AV3fuHvGIjeo37SFLWnssa5yAnTvk8Ev7B
         E8eh4hToqQMbqc5S7kbURn1J0APWDdnNDam8XCop+xKPQUgDbKYhe5shpSvoZox828Ot
         iGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785487345; x=1786092145;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6YYZSGPYrwfGLVVwyM4m5pQRYBmdHVg4RU/DDbjdfi0=;
        b=aipqWV5W8FyBlt2F4MI5wAIjwc5pYozRjW9jHUfORjzkrDR/Y10Q8nfooU46Avlo2r
         zrx1a22w32lCFhUBWuteVcvvonRjeGVEhqyLjYEBkwdAEkiJamboIbzYbXaS4OkNTueU
         LvrB3citBiSvwAG+lJor4b8oVOjT++/PH8+80id3KVnkmHuDDhzcJiGo/B3VaNJhZuhC
         fNeWg4k6xoR1Y+ke74rGvC/jRBYNgfeZjLUy2YeQC3SfB6BSajnwpaL6TjQfVJk3kTPR
         L9MtjNAgNzk++M2Jo4JoTX7DJAQ1drqITCdo2//MFYGtMoFoUzSANiJG7S29Q5LoH937
         FXuQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr11dt4AtyzkHG0jPTpaCry1BM/I2/vQZot4LK3UGryQCBmbi8NA9I7yGTvm69oueL4W0GO9eLt3SfJKNjaAXbo@vger.kernel.org
X-Gm-Message-State: AOJu0YwsnvcC4Q4vzrK+o59orn/2KpPfojo8H7C4FCwXX6Qz9LKWiJFL
	GWkPgPxfg4an/JZM3PSMmPg+/XWbRJNwFjA3ZT5jNEP5PZkCiVpxB9jGxzTjs5i97gA=
X-Gm-Gg: AR+sD13OhFjSxeop8LoCljME42Vmh8bN/bhlQUJhLphRCrSC0F7PJd/Ni95hIOuf/Wq
	YxORs5C76N6tZF1XegyAKnaunCGdfEJb25NtuCZEh341rbeBcskU8cx05mxrTiJAk7tG2gafKvn
	Qit/QXJ9dzAMwbvQr/pjwDBNLw3UPs+fUVJ3KRB0epI2n19HcSTo2l5GDvo8CkDTRlrBD3Evm78
	0sdQmWhWwFfSSMH7uxeo3pZiDOJYFP3kq9KpmlgLK/0n7RON7OtW/KRF9rVT/f2Pk5ZMPFdqMBr
	2/lC38Sxjwg15ngn5JHcEKvUh3FWevZpz1zpyNZQiDTdv66ga01/Yh5MPsLnRjYOZIKSc6EGkk+
	wSPyr846T/YYuO50VlJeAZJqlzmABnwk+U6OSIgRgLjazuwFKevQCi4C/2hr0kSSkc0wQ4N1NBy
	DgJLXR+9a4z8ssQquQvygazMURxZ2NnZBk4kg2O9f6hJVyexAHQOFNVL53KvZwhkkRtQwjpHxT
X-Received: by 2002:a17:907:724e:b0:c1f:5f64:1912 with SMTP id a640c23a62f3a-c1fd23a2b2amr58114266b.7.1785487344823;
        Fri, 31 Jul 2026 01:42:24 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:7ede:c11d:7b86:c71c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4537702sm64697766b.53.2026.07.31.01.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:42:24 -0700 (PDT)
Date: Fri, 31 Jul 2026 10:42:20 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: q6v5: Ignore stale handover IRQ
 delivered on attach
Message-ID: <amxf7MODINj26a4m@linaro.org>
References: <20260731025655.2642860-1-shengchao.guo@oss.qualcomm.com>
 <20260731025655.2642860-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731025655.2642860-3-shengchao.guo@oss.qualcomm.com>

On Fri, Jul 31, 2026 at 10:56:54AM +0800, Shawn Guo wrote:
> Commit bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make handover IRQ one-shot")
> dropped the check that ignored a handover interrupt after handover
> had already been issued, relying instead on disabling the IRQ after
> its first delivery to make it one-shot.
> 
> That is not sufficient for qcom_pas_attach(): when attaching to a
> remote processor that was already booted by the bootloader, handover
> has already happened out-of-band, before this driver ever probed.
> qcom_pas_attach() sets handover_issued = true and unmasks the
> handover IRQ to keep the enable/disable tracking consistent, but the
> transition that signals handover is latched at the interrupt
> controller while masked, so unmasking still delivers that one IRQ.
> 
> Since this driver instance never ran qcom_pas_start() for that boot,
> it never took the proxy power-domain/clock/regulator votes that
> q6v5->handover() releases. Running the handover callback for this
> stale, already-accounted-for signal disables those votes without a
> matching enable, producing:
> 
>   genpd genpd:0:4c00000.remoteproc: Runtime PM usage count underflow!
>   genpd genpd:1:4c00000.remoteproc: Runtime PM usage count underflow!
> 
> Restore the early-return when handover_issued is already set, so a
> stale IRQ delivered on attach is dropped after being disabled instead
> of re-running the handover callback.
> 
> Fixes: bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make handover IRQ one-shot")
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index 10fa38f264c8..e715083846aa 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -210,10 +210,23 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
>  {
>  	struct qcom_q6v5 *q6v5 = data;
>  
> -	q6v5->handover_issued = true;
> -
>  	qcom_q6v5_handover_irq_disable(q6v5, false);
>  
> +	/*
> +	 * When attaching to an already-running remote processor,
> +	 * handover_issued is set before the IRQ is unmasked, since the
> +	 * handover already happened out-of-band, before this driver probed.
> +	 * The transition that signals it is latched at the interrupt
> +	 * controller while masked, so unmasking still delivers this one
> +	 * IRQ. Ignore it: this driver instance never enabled the resources
> +	 * (proxy PDs, clocks, etc.) that the handover callback would tear
> +	 * down.
> +	 */
> +	if (q6v5->handover_issued)
> +		return IRQ_HANDLED;
> +

The goal of Abel's patch was to have the handover interrupt unmasked
only when needed. If you just bail out here and do nothing then there
was no need to unmask it in the first place. Can you just drop enabling
the handover IRQ in qcom_pas_attach()?

Thanks,
Stephan
