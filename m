Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E62B369996
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2026 16:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774370159; cv=none; b=m6XwLJae/Qr5IPqC9MaCxt0tscR3XaXvD8PGIme2kqCfu6cCRLQWyIc46j4cedPsnqxoZ7DwYUnfiOydciZ3By8Jjy4jI+Qx4UsoW8KBv0g57yhjbOJhdwdnbaVQDnwuRxRk0bMn7yK8HbPjINuPF0sjv9fdt5sgSzjzpIMEN78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774370159; c=relaxed/simple;
	bh=lsnjJ8/ec8jiFLpe2KNzg98GKRz0z6bdgCeuwg06JLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p2gjFENCUXSY8uIDkeXVwmLFshCqbXZpCeqIZxX3J9BMLcjjfZSGpnkzBK977hjVyDUOqBhhQcaR9vTaernBYJtkJNlydpaDMxH/V8ttq9D3x43wTe3MSrJpaFsCarhePWYTQlmrq6Xp/qXh9G9n9pTjrOP/yhhCsfOgYO+lqho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JE/atEqP; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JE/atEqP"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c741db5d610so1741510a12.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2026 09:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774370157; x=1774974957; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=17gapahkvrjgJAf0ibu+DTJZewyuZg/tunMddSRxAlo=;
        b=JE/atEqPLm7nAngZZA7ri2S3jmia83ts8pHsvm+y5vy9mk0K+nzHX39ZhL3apz6SYM
         r3yhj8jZFP/F9Hmy4UAnashE8tlwb4oQbrzfoBLrw5cggfBCd7jx65eqB7gIhEMWpHNZ
         bEErE/lgm4OX1ZSqMz2tKf+Egzb4Yay1/D03bPoRq6jPXCWlz19aQ0S73srwUPbF+Vzr
         dzOQN0BenVYSzewCanrK969RDpTkVYSgcGRLveE/Q5Aexmsi8shJwJrq++oTb/uDTdmm
         slIwNEqeMDnSMi2ybZqgE0Xv8XK275yc8Lt7NAoqICD8PWUJzTLBamWjKjSFSw4sJ7Wz
         VdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774370157; x=1774974957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17gapahkvrjgJAf0ibu+DTJZewyuZg/tunMddSRxAlo=;
        b=TyTzbrgkTj8O6Kt60gi6qCKBdStSmnne3Jb3HKOsGnRtqseJMsPETPpZdHjBUpdEXg
         +L5TCn0Ma3RnMr8zFkmyi51ZNP/i+/rXbFx+qkRhSEsmkv6+dwJObV+oaJDTrjoSqHHB
         u14DCFBiwvR6Z3rzgxASc++BUn0Wm+t9xnLyZ8Tv2bvciclvt71uR+HTuJoCTEp/Kcv8
         AeGN4dKyzDBNKAfMT5wE3FSJ1YCZepjaTWoCuWfcPsKw9zitMb1ZvGN1KKAWeXOgTLAI
         +EFJkWvFdJMLAqWhr6Pn4KkWicH3pm+lpWN40e72cQsjRtuKl0R+jzmyeyMwYEyGKpRW
         n+iw==
X-Forwarded-Encrypted: i=1; AJvYcCUUPPyJdNaOdTWCG2gHxiqyskhbcYHEsqQkSQz3taNWzMqnxez36YXqqLg56eoSFW4y7d6DnTAtecBgwriTeDcy@vger.kernel.org
X-Gm-Message-State: AOJu0YyGs03tsZl6+/eRRRNWoa4wKkB95bwX6hHNYNmtvhfa1eIZA++i
	8qP8tzqdhFhwzjxBqV2HvWg7T4+aceeSTAf7rAfPV2cQEeQXKsbOEoyMtgpBUSuZogI=
X-Gm-Gg: ATEYQzzRm2t/oP/l0gGSdmOja4aobRt3XxTY64cLotd3weHooSWZo1p7Uec/o/3We0H
	UGNXwZEihGaWT3JlrO/dK4sWE0TVZUB4KpyUHsiQmoabFtpqkdnsiseTgrL7WFXiJbt4/1zjg+t
	kCJk8E3oALrEjP7wWJi+VhVWaMJEOOlTQrWUS2Gu0qIXJQdTRDFCOobQ+ISo+3+0kxTZJdxOzhC
	mPxyok+sGGzJxtuiEbrLsaZJD9Ce2zf5d1ngH/pDqutxyBiGVE3pgc+Tft9FDvwp5u9JuqrZ4Qm
	W2OzIM7z+Bjn8xEOwuh2SEwY0BmMebcI9Fto/AN55+QIoaabBhmvY1DkZT3h4M0iBVpmG6RnAyC
	jA2O2XCZJm67t5z/Pe55dL9O0ACkrGZ9ONAGND/pgGrOS5PixqEqK6ytjIGnuOCkXiEM7ty6LD2
	pS7Gwu7MGUdKHIz+KSsw7vNINU8Ok=
X-Received: by 2002:a17:903:183:b0:2ae:44db:56ed with SMTP id d9443c01a7336-2b0b09f7066mr3054845ad.15.1774370156329;
        Tue, 24 Mar 2026 09:35:56 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:6416:274f:1546:52e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836b6dc8sm158960865ad.82.2026.03.24.09.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:35:51 -0700 (PDT)
Date: Tue, 24 Mar 2026 10:35:48 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Anas Iqbal <mohd.abd.6602@gmail.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: use SIZE_MAX in rproc_u64_fit_in_size_t()
Message-ID: <acK9ZAw8OdBKPwRl@p14s>
References: <20260314110137.178981-1-mohd.abd.6602@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314110137.178981-1-mohd.abd.6602@gmail.com>

On Sat, Mar 14, 2026 at 11:01:37AM +0000, Anas Iqbal wrote:
> Smatch reports:
> 
> drivers/remoteproc/remoteproc_elf_loader.c:221
> warn: always true condition '(val <= -1)'
> 
> The helper function rproc_u64_fit_in_size_t() compares the value
> against (size_t)-1, which is equivalent to SIZE_MAX but can confuse
> static analysis tools and lead to the above warning.
> 
> Replace (size_t)-1 with SIZE_MAX to make the intent explicit and
> avoid the Smatch warning without changing the behavior.
> 
> Signed-off-by: Anas Iqbal <mohd.abd.6602@gmail.com>
> ---
>  drivers/remoteproc/remoteproc_internal.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 0cd09e67ac14..0a5e15744b1d 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -218,7 +218,7 @@ bool rproc_u64_fit_in_size_t(u64 val)
>  	if (sizeof(size_t) == sizeof(u64))
>  		return true;
>  
> -	return (val <= (size_t) -1);
> +	return val <= SIZE_MAX;

Applied.

Thanks,
Mathieu

>  }
>  
>  #endif /* REMOTEPROC_INTERNAL_H */
> -- 
> 2.43.0
> 
