Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D332E4278
	for <linux-remoteproc@vger.kernel.org>; Fri, 14 Nov 2025 19:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763146910; cv=none; b=GTLz2OMxrkvJDKT+Gq4J7f4/lEio9vZzHTK2QHL9wNWXuYtSYWNVhyR2c/o5LTR8Sf4NsDBNQg8JFflo79qAgUxGKj9g0ambMNVD67PRhWAc0rV1oVYB9zq8jLt9R5ZCd8oRE64sZQmwafRASNwZNOKgz0bqtYvj4uHUD60OUhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763146910; c=relaxed/simple;
	bh=kaLk7O9IgC4dwMqc4t/lZeHpMOn+o5Eia31EOxhi304=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMm8vHruCR/UYBAVylATbST56nQqKYVtr2vvExME6GdTbBROGoEABv42Q6XFfIz81tjifgra1vFcMP1ekKJjXfXmqCxjiIAUMycwqe/fOmJwlBQQ6Mld0swB7DBE/IaSCvNnud0R+3qqycFK1z8B8z4ahkN2WSqaI5PP9wzL8NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R4foYk/R; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R4foYk/R"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-298145fe27eso27899325ad.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 14 Nov 2025 11:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763146907; x=1763751707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4877up8mZr4cJKLdQ6c/MarpAyP2iyiw3d6T1PmrtCM=;
        b=R4foYk/Rs86XckQ1zx7IDnLWeKCbQmMTpu8YVpVljgkHAVwJu2iVsq1PaBX03g3qB8
         7GI+z/qzYHkfFNMWM/NUrXbYGMCTFzGRtImh6YFQZgYcdXf4eztE5ZPyHv9X43cR+dFJ
         PnuX2u0lknZy3NBkekwIM2a/4SMCXOdqnjtrFQZLf3bHOGBR3caIIJ22ZldWvNN1cE4e
         sjEQTUKtsfWNFYGRaFmg/rABVvLbz0UqMVBTM/L8RNgcOay0spFk9GP/01bIxLkd6Y3u
         DE010JyqJQnb8Ew5u5dsiMjpBa/zndttr2Nhdm6Ygwx4FMf4VmIrZ+n3zjNf31qt1exh
         w+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763146907; x=1763751707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4877up8mZr4cJKLdQ6c/MarpAyP2iyiw3d6T1PmrtCM=;
        b=jS+FfUfsHP1S8Tl8UAE4ZKwsbkoT0SCnZgiXzMBZgOaV4grR1F0jp5op36s/TgjiCM
         afcuk2nj50RUdWCKnqbqXUUk90LdcPikrfNBY84znmheITq0/B5l+eA9TwYVrReACamT
         roYeme1mPbuOI7221Ubf1m89zncsGEcdlsbZBwCivNxHC5q8Au9dVIivznV5cGKkeEQJ
         Otn0ObvvpO1mKpEF4vjZ7HwpUh/0Tejp42Ux993DYszcMNxSkcHEfWrIha4W5ytqPIux
         5O2c1P8eJcqoQv5Q6I6i9T8zHiMvW07YQBZlZdy5pXjtaTZv+i1WdVRWnMOnlZe0O35u
         0tcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpRGvH0DcnkJfyazm80aOsAnZC3Jlr9/6a4xT41xgXGgtoyBAAQ2fUAIcSqHkmqhc+HioqPqnwk+wCDgsl7KcJ@vger.kernel.org
X-Gm-Message-State: AOJu0YytN2Q/Ypm+iJIdclXtOz5Lfrwznh7S2chf8YNmR6T1aKAepmUy
	9fPvS18VQ7Vfbz0TWkXHAbERXPqEHX+Rl5u412LsFle22sMhti3MMr/+KJLV0Baqob0UQsveC9N
	oDoJ6lxc=
X-Gm-Gg: ASbGncstv3VTJOe/5dLgN4lS/pOXOIxlxFBpJCTiSI9wyUp+8V70KpXOu+TFrFbJWjJ
	vyWyJ0HUetTe9DlzQhmqTHXpIOLIR/RtZT5F6ieKLaethzQIHnyA+MPU1Q+DDqT+rqI+hmE41oF
	U/YgROzEGRc6PyrtXXqxIfu5uhXVqx/+Hfzi1vfQ618gRaopP9q3poOgtRVQ/ZXJxDeaiIGAxop
	V/ouf1QjyDc/heYE3pztlCm/1NpTOPpceVIHYpv+fQUMsFDHYroMvRtJjVGWBGYLVatr9attmdF
	c/Q7LuJ/yz932F4vVgBgIXkkyDY0MKUVzifWU87I0z8aordBMz3i2HbWAF/BZ1PolGOClZXmtmA
	3kPsFinzG8nGiyKD3iPp6tHGiMuW7Ai/IF5itFx2mxzCSisEFJ6FDqwBVMdfE2E1RgmwFYFFycw
	IDw7/SD4Rfka0YLw==
X-Google-Smtp-Source: AGHT+IG9NByy6HTh13pQIoNFuEdh51UpLcUX019n9sQ2W4d/ZF6AyzejANFUwG/+FAffRPi+Ku6bRQ==
X-Received: by 2002:a17:903:2bce:b0:295:1626:6be5 with SMTP id d9443c01a7336-2986a751eccmr46230435ad.44.1763146907340;
        Fri, 14 Nov 2025 11:01:47 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:734d:a808:2eb1:a1ea])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3456516cf7esm1292950a91.12.2025.11.14.11.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 11:01:46 -0800 (PST)
Date: Fri, 14 Nov 2025 12:01:44 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Dawei Li <dawei.li@linux.dev>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, set_pte_at@outlook.com,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v3 2/3] rpmsg: char: Fix UAF and memory leak in
 rpmsg_anonymous_eptdev_create()
Message-ID: <aRd8mDzQWXtEFnmt@p14s>
References: <20251113153909.3789-1-dawei.li@linux.dev>
 <20251113153909.3789-3-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113153909.3789-3-dawei.li@linux.dev>

On Thu, Nov 13, 2025 at 11:39:08PM +0800, Dawei Li wrote:
> Potential UAF and memory leak exsit in exception handling paths for
> rpmsg_anonymous_eptdev_create(), fix them.
> 
> - If rpmsg_add_eptdev() failes, eptdev is freed in it.
>   Subsequent call of dev_err(&eptdev->device) triggers a UAF.
> - If __rpmsg_eptdev_open() fails, eptdev is supposed to be freed by
>   put_device().
> 
> Fixes: 2410558f5f11 ("rpmsg: char: Implement eptdev based on anonymous inode")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aPi6gPZE2_ztOjIW@stanley.mountain/
> Signed-off-by: Dawei Li <dawei.li@linux.dev>
> ---
>  drivers/rpmsg/rpmsg_char.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 1b8297b373f0..0919ad0a19df 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -494,6 +494,7 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
>  	if (cdev)
>  		ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
>  free_eptdev:
> +	dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
>  	kfree(eptdev);
>  
>  	return ret;
> @@ -544,7 +545,6 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
>  
>  	ret =  rpmsg_eptdev_add(eptdev, chinfo, false);
>  	if (ret) {
> -		dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);

This doesn't neet to be done if kfree(eptdev) is moved out of
rpmsg_eptdev_add().

>  		return ret;
>  	}
>  
> @@ -560,6 +560,8 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
>  
>  	if (!ret)
>  		*pfd = fd;
> +	else
> +		put_device(&eptdev->dev);

This goes in the previous patch.

>  
>  	return ret;
>  }
> -- 
> 2.25.1
> 
