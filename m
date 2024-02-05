Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2702E136672
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Feb 2024 20:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707165938; cv=none; b=SMewJTk4SM8dLoiNYsgkKfQ+vBJdZ7jiGuXLrqyN6sUpz5Msy8+nX+dnVj/mm6HRNMSh1UOZHh36SffZm/7dHkHgnHlpk7UabERnwhwFP9GdGj/B0Qoh/wot6mUuv1J8gi1qmDA0dMa6GjpjNcKWp/szd1ZxQ8E7DPrFLVw6OQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707165938; c=relaxed/simple;
	bh=ygRGucqaMLwxL3Kdf40djz6ywtjVLa2NZm3HDYPub8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTBPWfLbEDFGaJXKP86ksGDVDQaCJRUJ+qmHABEmz3zuipd4XoZ8/pCykgNouUU5jupFzlkXgEXVPp1Z7KSZ7QJ9En/FnsTYgoEq96+xY4c4MdkadoRhzIi6c/oJ9viUi5WBOhFxIo/i+suOnpX+7oQWGiryTbNIth5SpP9zEQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kCM0J8k2; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kCM0J8k2"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5d8df2edd29so3845514a12.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Feb 2024 12:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707165935; x=1707770735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gXFGgWyPcWGflVAexaM3XESfm97YoxfWDohm7Vcj5pQ=;
        b=kCM0J8k2KPlciSjR1Q3XwnBe/we9vFJ8tlKeLFNjyL/Iw8rc8ZVEKWLkwOWhd1H9Sj
         xZO8QFHcPyyqX63V2ZRQeKva2gzDMfot75JzJVU1ofsxyuF1gin5SHuebYNtaodlBytC
         uyj9rG4KXZcnd6l/tfdxV/mY+qtYuBp+pJGpCKIzPcrH0nkujPhk/b98G+PrdBc66HQu
         5I/z+oma+ODjxt+DF/7asHIOTrwJX75U4QGZOWIkz6JZVAgioZyDNkmy+lpgUHgByd3I
         Ea53VLZZ/wKdbuDcpMxz/+6SLKwCCfRsaVSuZOrvhEBD+E7wa+5VWcLc20eA2ZwwUTyO
         gVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707165935; x=1707770735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXFGgWyPcWGflVAexaM3XESfm97YoxfWDohm7Vcj5pQ=;
        b=uLOV1zwNMNHonAllnCBOJqAch1c5vD+kVwWEu7MuYGConvvBeC49Sab4yE+TNn87uK
         98LDxxWAwGvaPfX2DwzGKOtpKZ2aJ8EYOTBXRkMNccsNc5mjrD03sNLcVp0RJIfiCPBy
         +rIsHHW5mwBhe2L8jCRqjwFvBBo6WZVssDze3ErPpyfs/WC73M8uA+x4l9/WYIZeMZjJ
         +p+XOp7+2Ng9+V3TUeq9DqfsLjSTADhqfkAr23BTar2ClB2NAtlXushQaN/UUg1cImaf
         EKcs5ME+Q7MBYjypWMqnQ6TnPsFRtLFY5pdTrwuLDpwkrxbD8ycdvytzpq9aV13aSro2
         72Yg==
X-Gm-Message-State: AOJu0YzN+Yao6veZl8g23Z6AKiA3lYtXsLerX7Xf31a1Z/ThlAGWQath
	DFWyeWkNKUg9OAVOUksL53l3LblnVkoEyZowJHDVWnNV3s4KyPmARSQKeeqvC4s=
X-Google-Smtp-Source: AGHT+IFyOcCUbcXKdRZejiz6dGLO1KJroU5hYatedJsc2N8dt+d6Pliznc79eZIotq8WtX3H/H2T4w==
X-Received: by 2002:a05:6a20:2c88:b0:19c:b10a:61d0 with SMTP id g8-20020a056a202c8800b0019cb10a61d0mr650996pzj.25.1707165935416;
        Mon, 05 Feb 2024 12:45:35 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUzi63dWtPMGbfeEJ2/tU4iT8nlvZTvfcnE7VXxxprez2/CQjR6bXRjptDytMqri1FE206NABSN4eLcX28hUgnr9fWN3x0+pc1uu9n+kz/XPCFlbjBFZ5OtTQWbiQlwbdWVGFM5zwAiDap3jVCk2yywtJF5G5gQxTdsY5LCpefjC2hhwIQ7rAcVaH5yAY3UUPBTzgG/6Q==
Received: from p14s ([2604:3d09:148c:c800:c88e:5ce2:4df2:aaa0])
        by smtp.gmail.com with ESMTPSA id h3-20020a63e143000000b005d7994a08dcsm484530pgk.36.2024.02.05.12.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 12:45:34 -0800 (PST)
Date: Mon, 5 Feb 2024 13:45:32 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Andrew Davis <afd@ti.com>
Cc: Jai Luthra <j-luthra@ti.com>, Hari Nagalla <hnagalla@ti.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] K3 DSP Remoteproc remove cleanup
Message-ID: <ZcFI7EHGjc4gZ0Yg@p14s>
References: <20240205182753.36978-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240205182753.36978-1-afd@ti.com>

On Mon, Feb 05, 2024 at 12:27:48PM -0600, Andrew Davis wrote:
> Hello all,
> 
> This series uses various devm_ helpers to simplify the device
> removal path.
> 
> Removing an unused var "ret1" got squashed into the wrong patch in
> the v1 series causing a bisectability error. v2 is based on -next
> with the first 3 already taken. These are the last 5 patches of the
> v1 series[0].
> 
> Thanks,
> Andrew
> 
> [0] https://lore.kernel.org/lkml/20240123184913.725435-4-afd@ti.com/T/
> 
> Andrew Davis (5):
>   remoteproc: k3-dsp: Use devm_ti_sci_get_by_phandle() helper
>   remoteproc: k3-dsp: Use devm_kzalloc() helper
>   remoteproc: k3-dsp: Add devm action to release tsp
>   remoteproc: k3-dsp: Use devm_ioremap_wc() helper
>   remoteproc: k3-dsp: Use devm_rproc_add() helper
> 
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 116 ++++++----------------
>  1 file changed, 32 insertions(+), 84 deletions(-)
> 

I have applied this set.

Thanks,
Mathieu

> -- 
> 2.39.2
> 
