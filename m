Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9BD2192FE
	for <linux-remoteproc@vger.kernel.org>; Thu,  8 May 2025 06:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746686433; cv=none; b=TRkPUBjkTv4t3XkzElaWsA+zI8951P5k20lSJUo0eY3uYCpGQRRqy3ztryZxsAQkXzFmBbOhi459NuAD4AGyxQLPeFpaSE7HLs5FloYTp8okmB4C+z9p9jalCisbDCG8YUm7LJ9rLDa7WbVPGqxU5QgjgVRilDHaEmmOsi8b1rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746686433; c=relaxed/simple;
	bh=mo7aBOYxy2laS+VfZHPupXplp+OJ0XZ0QwmwUj+Cx7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odTm66gk4Pw5ThpWiS3A48j0ZRjFCu9A94JLgDHSsLSsjWvix0ICltrrlqlWPUV9cJ8RWOb73z4B7bkGXJkU1WXKqJaVVoKxVHYsvrCe1DQV7PShPJLdjrXlM/G4pXMQJc0ZXh+X/HZtJt3ppIIMQ92azkQAfsLThAWzXmPJR5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CkVsDYMz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CkVsDYMz"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso5565895e9.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 May 2025 23:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746686429; x=1747291229; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m0BYhiXUdA6i9dCcFIqo30mmGVKS8d1Kjub/7fShZA0=;
        b=CkVsDYMzDpzRHRO6FcVVzzHLgRGY4XxjKvk3TqtyBCrBQQMfFO0SleHFkpRLJZPB89
         terLxyDUCkNb/9OW1fmRTLcNTGnDwWS3OB/mCPUR28HD8+j8WA3IeQQEyItIgOK/gnUR
         88VcAsrNKud4mY4WMJ87NrUHoiBzwFP8LGA7qag3DYb+QG4dAQGjwIgH22k445UE2fDv
         tsNpQhiTladg92zjGW2oS90vcZ5JzZG2nfHeWwj15lJgXJjks1lTSPL7j+EnmNFIAVV/
         1RXk5sRaPtimqAnJjb/VnHsH5PQnsJuAS731kwCsv9xO8SYMHqfKvQh/TeX0LOa/RyNX
         7Ihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746686429; x=1747291229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0BYhiXUdA6i9dCcFIqo30mmGVKS8d1Kjub/7fShZA0=;
        b=e0m8M3kqlTDGxnFwBAC1JCcG+DiSdhNmh7EF8IEK7pwhNC1HhR2KVlX6RkYl1TlI6T
         usBSAjbeyGzpoDDYeXs2Xaqn7wU5N2xCKewuXdJsgp5l0pTxpyn6Ooy1g1lSyOYEM6ed
         T5+EHP+GZIgNS2Ka1iy58z/YVH8r3UxGy/gvK16Mtv+YqGhZIqjGSNBqYmRWjNQluuZ0
         yGt6VZPXfQUn8kn6fSXqd8YYizRn42vE65EIouxHd5ITiFT8JloeBfKyUIdRrreqGZXe
         coHGy5UjGoV6/zkdylctLmMi8AjOUdoQB2bfYNNdNi+sG5EpYQs2vov3mMq66jE6Vr/M
         Yt1A==
X-Forwarded-Encrypted: i=1; AJvYcCWxZYAC+go5Qtfjczn6qNa0K0tRVXsf8yfPpMcwSb/+gW2tTuuSs2Gjccp07iQJ9DT9CqgXnpXeKiq4T8q9mmmQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo9FxKy/Pts/8UUZgoysp2lmHx6ke32v7XY3TkiDjcD04ZthQM
	1zmsyPiEN2Wm3QNqCGEo4q7xEISQmcD893OgUwFr6kmWoN0mjMufPWC6q949OZI=
X-Gm-Gg: ASbGncvdc26/psTh8O5fpAA8ZYbs5DOwcAwO5uVTp/TDqbdz8TJbdYw+4qsKgsICd6p
	1y3uiPq6Y2NQOZGfz217r2rfareC4pQoKDfddDSCKfQf9fR32BmsqQJRE7+M6LUfrulY9IR3DxB
	EV0dRG/jgETshpx9EYqioh4Gj0rjmP8c6u+51RihIfUWIxndjRcF2X/24UnpbyJWnKDqsJMYgqm
	RU85fTI91PqbgvOCoR1pYB7OXSkzr1qnXCxi17KwMvI+TPY4K9JXGUpGP316ytNvZDrDo2ffodP
	dylY3pHzb3pEWHaPzO7XeSlAkteKSHCfm34tRSZpkKje0Yuku8aUB8yX
X-Google-Smtp-Source: AGHT+IFZRIfE5PxRRbMe4B54cwayzKdn3VEZhgxzfmBDRkxcWCbiRLfEqYjfrSNjGm+C2f+T0IBaxg==
X-Received: by 2002:a05:600c:628d:b0:43d:fa:1f9a with SMTP id 5b1f17b1804b1-441d44e3359mr67512805e9.30.1746686429396;
        Wed, 07 May 2025 23:40:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd35f40asm25158595e9.27.2025.05.07.23.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 23:40:28 -0700 (PDT)
Date: Thu, 8 May 2025 09:40:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org, patches@lists.linux.dev,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH] rpmsg: qcom_smd: Fix uninitialized return variable in
 __qcom_smd_send()
Message-ID: <aBxR2nnW1GZ7dN__@stanley.mountain>
References: <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>
 <aAkhvV0nSbrsef1P@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAkhvV0nSbrsef1P@stanley.mountain>

Hi Greg,

I'm sorry I forgot to add the:

Cc: stable@vger.kernel.org

to this patch.  Could we backport it to stable, please?

regards,
dan carpenter

On Wed, Apr 23, 2025 at 08:22:05PM +0300, Dan Carpenter wrote:
> The "ret" variable isn't initialized if we don't enter the loop.  For
> example,  if "channel->state" is not SMD_CHANNEL_OPENED.
> 
> Fixes: 33e3820dda88 ("rpmsg: smd: Use spinlock in tx path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Naresh, could you test this patch and see if it fixes the boot
> problems you saw?
> 
>  drivers/rpmsg/qcom_smd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 40d386809d6b..bb161def3175 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -746,7 +746,7 @@ static int __qcom_smd_send(struct qcom_smd_channel *channel, const void *data,
>  	__le32 hdr[5] = { cpu_to_le32(len), };
>  	int tlen = sizeof(hdr) + len;
>  	unsigned long flags;
> -	int ret;
> +	int ret = 0;
>  
>  	/* Word aligned channels only accept word size aligned data */
>  	if (channel->info_word && len % 4)
> -- 
> 2.47.2
