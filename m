Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F6422257E
	for <linux-remoteproc@vger.kernel.org>; Thu, 20 Nov 2025 17:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763661506; cv=none; b=mAwCZsb1W56XvHGYWP8Dd7pOSHZSy578vKCaV120io591jqWyyWcnZjwrFgxFZSz/zquOTOyEuJkNslx9aMkL0k5Wgs1JvYXmSm2BUA+8qO6XNtqGGs6jSWCCD4q+HhZMIpVfQ8i3dN1O4g6zwi11mlyJJhLrH9Gx+D9tSVpQWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763661506; c=relaxed/simple;
	bh=e/rWWjnF8wbNY62JkWWzbaPkZREI40lkpc1skO8jIvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWY6ERnvyHCkIQV0oL79fll3J90hOpTdsFLLj36muX+Vp7Ho7sWMoHk5CgIV+8HTArTo0AiOE8o+AI26q6hd+KnSq62THukJsiDkX61Uy6T+Yk27BvdN431+dgvBVDehWB/miKcDVZ1OpEqZP6LbZGx890HEv4F2MnWRTsAkHLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xBbS9yvH; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xBbS9yvH"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29586626fbeso14173435ad.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 20 Nov 2025 09:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763661504; x=1764266304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=81Hr5jtNndhTD+szOLsCA5qYSFkSUAdLD3dMu1GvSpQ=;
        b=xBbS9yvH5jNRg86UUqQbH6mF/wpAezUNiF/izsVpF60nlp53TB6rO+ykbjGU8ANGbG
         2v0xR6pqWmQV9tY4MM3nu+Azi/ivUm7QN9qiZgJQPmNRMVHLClFjNGFB01fVT69YIaMQ
         0lld7zqpNsmztP6DWmzrLflOzXv3ZgFKM9uEQadlnBOqegigVtaoXmI1dmEqbmz+Q5GW
         W/dBYLpQDeqvWtC0vfOnZXONPBhxESi+ja8tAV9DjELGolZXHPzF4xKiet/G+ILvHW9L
         qUDfRctqHHcYtuPZItCDVadUiIVKca2C5MDdhfvzDSywGaof7rKr5TVq9M7KDe9sDfrp
         t+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763661504; x=1764266304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81Hr5jtNndhTD+szOLsCA5qYSFkSUAdLD3dMu1GvSpQ=;
        b=f4KiK4OeSYh5MhCbPiPrmDHLjrhs/OoRGCEBf5FhXTdRFbctHWVa3aIfnuXS80RoXQ
         rX6N/u7htR/KjSJKxIhrpD29ca/2gStaHUQHOOy2seYz+2grk+coE5L20pDzuka0mnfA
         HuO2fkBDT/c7awbDJsXC/NdODIu90PCjkNjHigVNiP9ySl63fiESGKCj37g5VRDGLBrS
         aEeb2MyIGboFYIBMdLv7yMMH5PSC2W0zHnJVWepxQatBJXq3BHlW4IxWzKF7KoYEVaAV
         fJUJ4vTr/bvW6iPjfY3I28ml3cKT31LPHEHeZoeulkLeA/DINJM8Ifs2BkUHGYRKCMvl
         mdfg==
X-Forwarded-Encrypted: i=1; AJvYcCV/1ea+WhqUSLLy6iRqJ1rxd1bF8VkPqm1fnYrR9GFTTCPzkEOzR89rCXtlPy6qBHGVyi3vpgwtdn2/5MQVgqm+@vger.kernel.org
X-Gm-Message-State: AOJu0YxVIw/r4J/3o+Q/vAdKTiH4stPl0fQYdph4RsMcm4LNeszD5sgu
	8FvEYmPDZNOsnX5OSc/ayf61ytHEIc4knQoRwzjien9z2Q/Indczvq6JsTOOzIFRVFI=
X-Gm-Gg: ASbGncsw7H1Q/uwdjkg/VRKFindw0t6c2WKGvswx382U5wyWWJbJnXiQjF5iT7FmQQP
	7i0GwAJF1Uru7sErihx78d9g5w6318nhYdMqd4OnvNYUR6Ul/9JSLRehmOtODQIx3E9lcB54DRi
	mOtxVXaGKziExppqeWkCfr8rDrgcG3t0G9Dv2zmcVkvOG65IkjvNXGKqAwOC5dkGdXNPidx+Jq4
	IVgtIe9ehoQQlQ8fc2zMF0wuXhbsWU49mVedg744PVC1Btr2SZFSCCD8ky0ZCY5mQ8lfY0TmfPU
	2ze6Ut5cB9b9lsh8voRLU3DIfueAgBrxusY1NGN+E2MUcOsD//mYojD9rnhl0iDur5HPBVi8vaH
	T0tezxgR6W64no2Z9jsbl+vHstWfSj0KG/gaRgwno6i07cmaaczcn8alt/dqIKTjYAPXHKpYT5d
	IanRF/xM4ML8g1/iV7OLK2Qi0F
X-Google-Smtp-Source: AGHT+IEi8cM1CIzgcmszW9SQnYjK09JCR0Q6AhXxWUnW+K/OtzywbTM5ivUVzOlsKeFa+uMdzIHcdQ==
X-Received: by 2002:a17:903:166e:b0:298:3aa6:c03d with SMTP id d9443c01a7336-29b691d63b8mr4431025ad.57.1763661504479;
        Thu, 20 Nov 2025 09:58:24 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:17b0:cde9:c3a1:870b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b29978fsm32158705ad.84.2025.11.20.09.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 09:58:24 -0800 (PST)
Date: Thu, 20 Nov 2025 10:58:21 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] remoteproc: core: full attach detach during
 recovery
Message-ID: <aR9WvVjvBhXoO3oh@p14s>
References: <20251113154403.2454319-1-tanmay.shah@amd.com>
 <20251113154403.2454319-3-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113154403.2454319-3-tanmay.shah@amd.com>

On Thu, Nov 13, 2025 at 07:44:03AM -0800, Tanmay Shah wrote:
> Current attach on recovery mechanism loads the clean resource table
> during recovery, but doesn't re-allocate the resources. RPMsg
> communication will fail after recovery due to this. Fix this
> incorrect behavior by doing the full detach and attach of remote
> processor during the recovery. This will load the clean resource table
> and re-allocate all the resources, which will set up correct vring
> information in the resource table.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changes in v2:
>   - use rproc_boot instead of rproc_attach
>   - move debug message early in the function
> 
>  drivers/remoteproc/remoteproc_core.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index aada2780b343..f65e8bc2d1e1 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1777,11 +1777,11 @@ static int rproc_attach_recovery(struct rproc *rproc)
>  {
>  	int ret;
>  
> -	ret = __rproc_detach(rproc);
> +	ret = rproc_detach(rproc);
>  	if (ret)
>  		return ret;
>  
> -	return __rproc_attach(rproc);
> +	return rproc_boot(rproc);
>  }
>  
>  static int rproc_boot_recovery(struct rproc *rproc)
> @@ -1829,6 +1829,11 @@ int rproc_trigger_recovery(struct rproc *rproc)
>  	struct device *dev = &rproc->dev;
>  	int ret;
>  
> +	dev_err(dev, "recovering %s\n", rproc->name);
> +
> +	if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
> +		return rproc_attach_recovery(rproc);
> +

Humm... I find this a little messy.  Taking [1] as an example, I suggest moving
the "unlock_mutex" block to line 1846 and add mutex calls to
rproc_boot_recovery().  That way both rproc_attach_recovery() and
rproc_boot_recovery() are called the same way.

[1] https://elixir.bootlin.com/linux/v6.17.8/source/drivers/remoteproc/remoteproc_core.c#L1832

>  	ret = mutex_lock_interruptible(&rproc->lock);
>  	if (ret)
>  		return ret;
> @@ -1837,12 +1842,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
>  	if (rproc->state != RPROC_CRASHED)
>  		goto unlock_mutex;
>  
> -	dev_err(dev, "recovering %s\n", rproc->name);
> -
> -	if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
> -		ret = rproc_attach_recovery(rproc);
> -	else
> -		ret = rproc_boot_recovery(rproc);
> +	ret = rproc_boot_recovery(rproc);
>  
>  unlock_mutex:
>  	mutex_unlock(&rproc->lock);
> @@ -1860,6 +1860,7 @@ static void rproc_crash_handler_work(struct work_struct *work)
>  {
>  	struct rproc *rproc = container_of(work, struct rproc, crash_handler);
>  	struct device *dev = &rproc->dev;
> +	int ret;
>  
>  	dev_dbg(dev, "enter %s\n", __func__);
>  
> @@ -1883,8 +1884,11 @@ static void rproc_crash_handler_work(struct work_struct *work)
>  
>  	mutex_unlock(&rproc->lock);
>  
> -	if (!rproc->recovery_disabled)
> -		rproc_trigger_recovery(rproc);
> +	if (!rproc->recovery_disabled) {
> +		ret = rproc_trigger_recovery(rproc);
> +		if (ret)
> +			dev_warn(dev, "rproc recovery failed, err %d\n", ret);

I would prefer a patch on its own for this one.

I'm running out of time for today, I'll review patch 3/3 tomorrow.

Thanks,
Mathieu

> +	}
>  
>  out:
>  	pm_relax(rproc->dev.parent);
> @@ -2057,7 +2061,7 @@ int rproc_detach(struct rproc *rproc)
>  		return ret;
>  	}
>  
> -	if (rproc->state != RPROC_ATTACHED) {
> +	if (rproc->state != RPROC_ATTACHED && rproc->state != RPROC_CRASHED) {
>  		ret = -EINVAL;
>  		goto out;
>  	}
> -- 
> 2.34.1
> 
