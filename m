Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238367;
	b=RJRSXGC7uZ7afVVojfPi93rGPiSMg3opwHBJH7HbqFKDd9d9U0P9QEQ2necs4HBb82aq
	 B7Zr8hdeLVl5PpfLNUV6VFcQbYhQkiYoQ2Fmt5eDSz7bW0O8z6bKqg5PW2pSruozGg3Dm
	 X/M2xqiagQBlOeKcoahGKu9ob1fGo6XiNA7sjo4FrmkupMSamtw4Hu1j/yKVaQuq7OPda
	 A6w6PhhsrNFc4oOeC4RUufJyV4hJKq0Chz6n2Fh2fzyeHuDqC2xTRWZrXRhHj/OZMI8eu
	 wCjZ9lIUE/zH45O2VBLulQs+gak7EVHKr98kTkE2p2DIYIL2CBByzjXiPqBLLQXso2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JRRwWfbameCVHtptgrmOT/aq7z3ehbGnOR3u7VnEKf8=;
	b=NDMuoC4yhqcJCjVhNYs9PkQBLUxMqFD6Bz8cjc9/T0ojC6fsK0YoBq6u93V9ppvH5Nwv
	 mM0AJ1N8eA+VI8z1Z0wLzaWGM83K2MQ0t8NYl6cxpYWEzKT73ps3z1MQBysepkUyofStT
	 75emiDH3fXaBSilmkoX2VMdODkcDGAOMvCcTVcjy9x/nZYeoF+tt6JYbbKTyaShlf0BDu
	 ip2UUwD6WHkVo0R1mCYvxlrQVm+HMOMMpHJ6MU8xYkJJ7S8TzuTrlXrQdKD6FZrjDu00c
	 2uz+wX4k5zPS9oI9ah23x2Wcoix01C5oeKE68U5yHa6CV1ZD7cja8SH9NFIdYQpx5Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=baN5DaMG;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BD7606A31C
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Nov 2026 15:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53BD7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=baN5DaMG
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so822810a91.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Nov 2026 07:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794238367; x=1794843167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JRRwWfbameCVHtptgrmOT/aq7z3ehbGnOR3u7VnEKf8=;
        b=baN5DaMGiM6qHSdYHDSDoyHaIJOhVwf7Vg4GJegxyqtcXwtspqftwSfIh9oM3oo/ZX
         Qa0SRA2E9jlqw7hJb24zdbidMde+uXRfeH1b1ZN37+r6Z2DRQC10Qa/wR3n4Tlkefpw+
         nKHi38g9Ivlvpq1MdFCR9ACJD3Gy/80Nq8vUcutlAVjFzUCtucSoxeXY90hbJ2EdTaB1
         JQ0WqT547HRVbNWSXh7KTT7b0KL5ybEGVoWDdS4K54v0Ki5sKV5nTwfzc1aiOnfs5JCB
         8j+HnxD5sq+1t//BA5devnwABKBbQ6gU0Vp9rcEGDTk833oo6MLKSsEzYDIvFV+Pt3X3
         mGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238367; x=1794843167;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JRRwWfbameCVHtptgrmOT/aq7z3ehbGnOR3u7VnEKf8=;
        b=eaMb7BPbYlP7/sg81xpM0hZFffkHGJjxtrxozw9GgBU1qKyqIaOY7fRzyUFa2kZ0Fi
         4y86KK0by0usu6wjhi4Qsouy54ylAXERi470xGovaocgTGlF/Wf3aljA8PuH0K4KPRx1
         edUcA7/cItnycnadmCihoWXAvFx+sLORn8E/Pyc82ejRGqpHzRQZoNt/9Z5sm3k3+y0U
         TIkJ+jeAOqBoaYROXe25PpnMgpQX7Ga9rW4YX0eeQZSeV8j0vyF9HPQKJ6EpmRz+X6Fb
         9ohHtwLx17Y55bKa3jh7hD+g6nJbSGtK/zLzWMvNpwBTHnAY3Jvr0e0tMnOM6mHs0NL0
         HQMw==
X-Forwarded-Encrypted: i=1; AL+hErGi/kn/aI8z6ANof7/X8uy6iXfu0C//cYm73oE7wXIkwllX6IjMZpaFYgnmfbg+6xLro6m1NAygXleg041ZF23e@vger.kernel.org
X-Gm-Message-State: APuU4Z82giAiv8NGrZ7zT9TcHuR62pESHPaFhyiXq+7G3zdFMRjZJAX9
	ptrq2AvjRSGJPT8RsZ9l/b3+mQLSgjftyUzXN7oB4DKOUmlNsren6/AzKCUJoL6udS8YUGjLLkK
	th0CC
X-Gm-Gg: AYBFou19OwYaOsjzbxbE7Jsg3bEdoX7U4JbpbHl4bt9dB1sC25UhOXN3QmAVSoPOsl9
	b9MsM9GI1Mqh9p8e48W9fDw2GpAjFffHjVvAaWPXahv3CV962nOHxuAsyzYL5HWkXwkBqZBlYlA
	et64Emkc61z43yxJ8zYrmOJXnVZQ3Bzlq2vCW9gF3yZaNrmLlwJxu9UdVBHbzy8LIr157Vauj6k
	fTJYFkI3cE51zvFWnw8JsG2JJEtFeHLnOmCgesQSAlT7hZFt9Oshqm7AMMXcnyy7GavrTITXv/Z
	YiUg42bt2Jl/rP+tU5gPAT2MinimSTSBL3F3+FmS48C5lcvfnArIWIvIdtek9moJXQ7sZXfqwf6
	HhjcWFe/mi5vj9M8XaTHsF+SNn+69oT4KRezDjTjzsbR1CG1TIrcGKO6goszpAo3eFuNNG/yHLt
	bJaksKJB9+BG3PPGtk83muS+EsZFHRGsjs4gIYND2HL34Q5Jb98LTfx8JQIkMaaut+33deKpKrY
	kHUv6ZZxH2obWQlcPXtIRZyyo9o6HK5J954BIllxo+JIDNskgW+WHG5MHq4TCNp3ctGuhuqSuqr
	8A0EevQoggvqkORzdBMQ1P/YRd88vsLpY043L1rS8JvN/zVZU+w=
X-Received: by 2002:a17:90b:5307:b0:3ab:e789:ce84 with SMTP id 98e67ed59e1d1-3b12d51ee2emr4031188a91.65.1794238366553;
        Mon, 09 Nov 2026 07:32:46 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd88e5fed3sm315273a12.8.2026.11.09.07.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:32:46 -0800 (PST)
Date: Mon, 9 Nov 2026 09:32:44 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-remoteproc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: stm32_rproc: Do not request reset by index
Message-ID: <avHnnBUiH-kLOrCU@p14s>
References: <20261106-reset-deindex-rproc-v1-1-41a03fcc8496@pengutronix.de>
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
In-Reply-To: <20261106-reset-deindex-rproc-v1-1-41a03fcc8496@pengutronix.de>

On Fri, Nov 06, 2026 at 04:46:15PM +0100, Philipp Zabel wrote:
> There is no need to request a single reset by index.
> Use devm_reset_control_get_exclusive() to request the first and only
> reset.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/remoteproc/stm32_rproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied.

Thanks,
Mathieu

> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index a47e040c6db8..1443a4013d6c 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -696,8 +696,8 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  
>  	ddata->rst = devm_reset_control_get_optional(dev, "mcu_rst");
>  	if (!ddata->rst) {
> -		/* Try legacy fallback method: get it by index */
> -		ddata->rst = devm_reset_control_get_by_index(dev, 0);
> +		/* Try legacy fallback method: get the first reset */
> +		ddata->rst = devm_reset_control_get_exclusive(dev, NULL);
>  	}
>  	if (IS_ERR(ddata->rst))
>  		return dev_err_probe(dev, PTR_ERR(ddata->rst),
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261106-reset-deindex-rproc-3c1aa2e9325f
> 
> Best regards,
> --  
> Philipp Zabel <p.zabel@pengutronix.de>
> 
