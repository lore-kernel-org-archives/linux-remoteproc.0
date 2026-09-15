Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4881E3AB286
	for <linux-remoteproc@vger.kernel.org>; Tue, 15 Sep 2026 15:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485383; cv=none; b=QEhBIOiPI7vr7m1GbGZ7+HM5x81U8oS0KyGlW2adqgMVo5kEdZh2NtWwG4xRKOoUVrUQVJtmGxDrRHBQLDNyQWNNw/pOmIBezPs5NHYQfgtm80Hod4PzMOI3Mh/cFmRvTfdE8s+gybJasr+LKLb6d+SkDjnVlEeN9MuyxYw+M5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485383; c=relaxed/simple;
	bh=b2QftFVLPYqRACJSpjFpmCaTKeWLxHvEmXWINIzgdQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMoZScIBWCIxJKdhKfT4c/yQGXy6UHYsCX6wiuLbXl3jyNORiwH+jVPIiOEU//1pXiDXCkcNBvhAy/34y9Tbo0ySEEJrdvdOFyE9B7uDJ6dQrDf4GXHE2L+ZxuyT4nl1/PxNzCJ1oD1uDzYpYjRBLp/wRz6tksT0dmy5SaUicNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JkIe7h/u; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JkIe7h/u"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso330944a12.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 15 Sep 2026 08:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789485381; x=1790090181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SB4zcB7/b1E5VrGeX9dszrXkW4TrqUa6JoRNfjOeW2I=;
        b=JkIe7h/uhXGvKcJHK+KaT3Yuek8rBwtfpu9U4noSmgxX1cpt2pcqNT9GFl11Tp09+M
         jQ080oWJrlw08jV0Up8LQtvK2Lmk6ZOOYUNUdLz644E48nI10jXLDX4u57FXu6iEdyIW
         aUBmmB0L8mmwz0KNkZ5Acs3kuP8fl9wVzm3eJPbWrw94dGuFQxQydqk00GXut7+ztEYW
         KeOEaz2VE+U9Ev7swwOJLT7n/DB/iFlE5bhsRnjOYJni4pu+eiFky8p7TZDvhrSyQOu3
         NpIXS3yWOpnSHfik2RjsTdqE17+BeQUExxYCV3FNnbraVc7GAI45+9NVRG8m3p51s9LG
         V+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789485381; x=1790090181;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SB4zcB7/b1E5VrGeX9dszrXkW4TrqUa6JoRNfjOeW2I=;
        b=JVl0gJNoeBqwo9Z+E4V/dSAryWaEpSHHVBbNPHSGI2vyNiOhx9z4R0NMGf5sRNjmm4
         1qD5MDu9wyY8DQ64BLGbqvToCcvBa7MdtBXR2E6PilOMvMbx2kf3HPq5g3BbZ2YqMVej
         VX4JEa4BON1YigddEax7KNdaFc8CXYQt6ks7IZzD+2DdAwYGBJbT17vJD5hIuXx0XWVV
         M3wPcLrmN8v+kcSuqNJs8OYJ2J3Qb3WBIXYd8TTDzdbn7mjUHZop5CmyYoHX5AKe+gbw
         BRVe6A7LtQj2t68jP3UUufZApW0F+ZiqBXKM2BLGmrdNu2CsUKyewjxXf5AlY0A2UepR
         +ZJg==
X-Forwarded-Encrypted: i=1; AKwUvBztlVB8Fzpqmxe0y0o6g1Gkk8LtGbBinUS5Dk2dYPSSf1eTEV94kSGsG4155VEEhG9iombmf3xft+1IvxOJRSsS@vger.kernel.org
X-Gm-Message-State: AFuF++l88cj9mXNZNJGqjMUKVtf2YUHuCuWd6b99bk0c9girZ/Y514US
	EaSjrPS1dLXJnEAHLAuOLd8kF5i8aEHaYocVWSKuelKFi5gCAzK3XXtI2O9vEhzPsEw=
X-Gm-Gg: AYBFou3Y5k9yHFWd8FYO6Er8WeokGl/L6Bnguvg7uT3QwDYETiLyZHcmKI7FROuk+h6
	ra3qGBob4wlCLO6wVsN4j+pzJyMyV7iLyLWl7FEfi6A89uM+fKKjKe0T0iiCytYLgfEqA1xX4Zs
	Uv7fUGFjEjWn/bIE9p7lwJY6bZ4+VlsopVZNNUq8LM33aoWb1fVc0r1W5wlZ3m3lgf6Sl1lBB0Q
	0JX2HMxJCltX+F6HTjPLz0o11GjksxkFtVHpwcsM58Em92HmRtLUCQTgS7etS/YTPBsGrAtu+yl
	1Vsex7afCu1YrwxzasX679UPZv5m0WTFU6KpzqeHbWHDZjo9rchyMXdOnhqHg0kGH30HKGW2Vx8
	MoCcEU6Mw43BYCZOfOYUBz84YA2MGuZuLkbFkHPUBr7TdUskVniRyjL0Q3PxwONUiNdzy6sIEmi
	5Iispo8/FMaHx53zIzR6VTi7J/AQ+cd1IFpHbqW+kmUl/+/HRtGTUie5JCvYOGbmd5o7lkRrsWR
	gI=
X-Received: by 2002:a17:90b:1dcd:b0:39d:f253:ed66 with SMTP id 98e67ed59e1d1-39e11046a24mr2892192a91.22.1789485374684;
        Tue, 15 Sep 2026 08:16:14 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b81f:e807:f8d5:6e56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfba23bbfsm2179718a91.2.2026.09.15.08.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 08:16:14 -0700 (PDT)
Date: Tue, 15 Sep 2026 09:16:12 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yonghao Zhang <hyz3367@gmail.com>
Cc: andersson@kernel.org, rishabhb@codeaurora.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: sysfs: Fix stale coredump attribute
 documentation
Message-ID: <aqlhPFma-h9TjRc6@p14s>
References: <20260911030944.1645477-1-hyz3367@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911030944.1645477-1-hyz3367@gmail.com>

On Fri, Sep 11, 2026 at 11:09:44AM +0800, Yonghao Zhang wrote:
> The documentation of the 'coredump' sysfs entry still advertises a
> "default" configuration option and describes it as the default value
> of the entry.  Both date back to before the option was renamed to
> "enabled" and the default configuration was changed to "disabled".
> 
> Update the comment to describe the three options the store callback
> actually accepts, "disabled", "enabled" and "inline", along with the
> real default value, and fix the coredump_show() comment which wrongly
> claims the configuration is exposed via debugfs.
> 
> Fixes: bf41a0910cb2 ("remoteproc: Change default dump configuration to "disabled"")
> Assisted-by: Claude-Code:glm-5.3
> Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
> ---
>  drivers/remoteproc/remoteproc_sysfs.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>

I applied both of your patches.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index 925b0cdbe577..c37736ff4acc 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -76,7 +76,7 @@ static const char * const rproc_coredump_str[] = {
>  	[RPROC_COREDUMP_INLINE]		= "inline",
>  };
>  
> -/* Expose the current coredump configuration via debugfs */
> +/* Expose the current coredump configuration via sysfs */
>  static ssize_t coredump_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)
>  {
> @@ -87,14 +87,15 @@ static ssize_t coredump_show(struct device *dev,
>  
>  /*
>   * By writing to the 'coredump' sysfs entry, we control the behavior of the
> - * coredump mechanism dynamically. The default value of this entry is "default".
> + * coredump mechanism dynamically. The default value of this entry is
> + * "disabled".
>   *
>   * The 'coredump' sysfs entry supports these commands:
>   *
>   * disabled:	This is the default coredump mechanism. Recovery will proceed
>   *		without collecting any dump.
>   *
> - * default:	When the remoteproc crashes the entire coredump will be
> + * enabled:	When the remoteproc crashes the entire coredump will be
>   *		copied to a separate buffer and exposed to userspace.
>   *
>   * inline:	The coredump will not be copied to a separate buffer and the
> -- 
> 2.34.1
> 
