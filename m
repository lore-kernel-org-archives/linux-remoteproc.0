Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A702E610F
	for <linux-remoteproc@vger.kernel.org>; Fri, 14 Nov 2025 19:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763147099; cv=none; b=U3JDsGKm991YA2DsdHNSi3m2+oyvFIrAKn/FW+osXDJUcLoqqsY6xyu2ImGx2Kpyu4+H11+elJeQpIhttLmF+82NN8ZBRD4mpuPwA3HT1k12ku7S6gYaI42hx8Wwt8luXJGCBsGTh3CrCyA8A0dK1o+rpfW11rAoDF7Diou1OuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763147099; c=relaxed/simple;
	bh=M3e3utOPbpx8hPf1y1icwX9zY21LD2B25JJVojjQ19k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+AINw3Ff8ghXPQuq1utLirEv81dkVeI6EUg4yrbx65f+BJ+KBo/6nstXGzPXhk8rKWdSaJPYL6515z+iZn8CIAWumDL9K+GFxUiQkFAQZEWvjnZPSpqhE7eJoo3wexi/SA16wwge0ogM+gm/SiYCiNnr86rvbiSiGu7ODLKzi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CHRyhLzB; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CHRyhLzB"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7b6dd81e2d4so2125148b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 14 Nov 2025 11:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763147097; x=1763751897; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BetbtNepftNPwtT7TMrGjbCKY0xag6LCqeb+veSVYD0=;
        b=CHRyhLzBpcTTyoBZzgyqbX50ZKOmASHquIdG24UyKCOaivBx6SmkQR69CLFVJtRT+q
         gFOUyXc5N6PL9qRwaekZbwbOeujbjPPjhRol8yHBnVYUBsms8ltKXcLz4OxrvmtW1RHU
         S1wittSCZnn9Id8sfw/XGGYocUu2r4+sIHuNrgETYXVC4SK9DBHKLtu1D+gOrpnlVKxK
         deoOSuhpzjMvQvaOGaI+g4+ChNvHypNTte+LjyfZL8kcVtKVlpsI1dwfsiyoGqdVWA86
         wvDGgb6blBSUOkZ+X+aCglOsJrNKEll+B7/HWwSgdfj0R+ZXzE1CqSGVAPyLjSmsVy4G
         yFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763147097; x=1763751897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BetbtNepftNPwtT7TMrGjbCKY0xag6LCqeb+veSVYD0=;
        b=CN/+Z6jM/Nc7edyF4U2ILPkuOEbFVctU4VNWzQUnIvcnSV4qaNLOEWunhupHgMYcHL
         IGYnRiBzaiUnIeWX3mNbVEUBou3ZgStDY4p+mtmostvGGX4GBizPehlZ9dJAgGhhdqin
         CD9w2HymLF8+CCXxYKHfmTaNa+O8F+WYmowb1yu36IAYUZjl0petwBGg33GSV0OsxEZT
         xX+KpRXdZr0wxGk25nuAigIlVfOOWNn5+5pddNzDFVs8AewxiiA847t31a2uoubRsrUi
         sTSwWKYjkc1x44x7z26Fh3FvbB10AMRodNUdzqAAFatefgWQXb/kHYnI7KMzr9fmkjEE
         psog==
X-Forwarded-Encrypted: i=1; AJvYcCVrL/+keBFi8pibb5YFU2nTBYVx2VqdBff+xFr8CihANnU3aoFxPRyIQHDM+jYsIP9epO5JjgijjbuRXZOTXoyZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxshAiCgbE5VJCZztHT8K5r+uE8bH+ahsd9dtLZgBCFuUEs0zXv
	BpiB4+XTnKq49jWtmBYqfDeNnQIhnCcSBSPkBPN+GRDaXQFYPhLuv9BF3cpAXeqMYRg=
X-Gm-Gg: ASbGnct8WiJycFLD0SUqP9k7NzeL7kGJzVB/9voRjwKWt/7r/9Qf7IpIx05KrsDME0r
	ml5sgrSWX5z/Cjs2rbTxmhw+BPRCvIPyG0pdhf2kgbc9s68SPgKBeg8XnFN8zWxB2tsnoQzXpqu
	E0AFsvzq1NYvs/VO9U+3uKp4ncoFIgOeqM/prtnmognHMTenENUIaVNHIgL0zE6E2Km6p1uDO92
	TnKeIach+eBdnD2WDkg6nj1JaiPkKW/nVNLA2+IDu/ecgVw0AAzkSjSnKjUHd8Eo+DcZF1pndOk
	/HuftINMURRcCW+rxjcwo/IS3KST+kGDKtg6gF0wBprjO9TPC87+cq24g4w18LjZiyrnWY9+RlV
	UL5DbYdiWJ5TWYJAxj44e83UbNcvAIFqF4Ql+xLq7jhqRofuAuH183rk3EEfWbakzEOo7BZim6q
	6I1iQ=
X-Google-Smtp-Source: AGHT+IHYwFf7+NaXyMe8AHBJnYbpi5NdrBt0F5VZtx+xzw5AtAbIt4qRmikBMKsFagWSIpq2Heha3g==
X-Received: by 2002:a05:6a00:986:b0:7b7:ac37:9235 with SMTP id d2e1a72fcca58-7ba3be8dae4mr5002740b3a.15.1763147097445;
        Fri, 14 Nov 2025 11:04:57 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:734d:a808:2eb1:a1ea])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924aee8afsm6010118b3a.8.2025.11.14.11.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 11:04:56 -0800 (PST)
Date: Fri, 14 Nov 2025 12:04:54 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Dawei Li <dawei.li@linux.dev>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, set_pte_at@outlook.com,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v3 3/3] rpmsg: char: Rework exception handling of
 rpmsg_eptdev_add()
Message-ID: <aRd9VkbwGGg72Hed@p14s>
References: <20251113153909.3789-1-dawei.li@linux.dev>
 <20251113153909.3789-4-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113153909.3789-4-dawei.li@linux.dev>

On Thu, Nov 13, 2025 at 11:39:09PM +0800, Dawei Li wrote:
> Rework  error handling of rpmsg_eptdev_add() and its callers, following
> rule of "release resource where it's allocated".
> 
> Fixes: 2410558f5f11 ("rpmsg: char: Implement eptdev based on anonymous inode")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aPi6gPZE2_ztOjIW@stanley.mountain/
> 
> Signed-off-by: Dawei Li <dawei.li@linux.dev>
> ---
>  drivers/rpmsg/rpmsg_char.c | 60 +++++++++++++++++++++-----------------
>  1 file changed, 33 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 0919ad0a19df..92c176e9b0e4 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -460,44 +460,34 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
>  
>  	eptdev->chinfo = chinfo;
>  
> -	if (cdev) {
> -		ret = ida_alloc_max(&rpmsg_minor_ida, RPMSG_DEV_MAX - 1, GFP_KERNEL);
> -		if (ret < 0)
> -			goto free_eptdev;
> -
> -		dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
> -	}
> -
>  	/* Anonymous inode device still need device name for dev_err() and friends */
>  	ret = ida_alloc(&rpmsg_ept_ida, GFP_KERNEL);
>  	if (ret < 0)
> -		goto free_minor_ida;
> +		return ret;
>  	dev->id = ret;
>  	dev_set_name(dev, "rpmsg%d", ret);
>  
> -	ret = 0;
> -
>  	if (cdev) {
> +		ret = ida_alloc_max(&rpmsg_minor_ida, RPMSG_DEV_MAX - 1, GFP_KERNEL);
> +		if (ret < 0) {
> +			ida_free(&rpmsg_ept_ida, dev->id);
> +			return ret;
> +		}
> +
> +		dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
> +
>  		ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
> -		if (ret)
> -			goto free_ept_ida;
> +		if (ret) {
> +			ida_free(&rpmsg_ept_ida, dev->id);
> +			ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
> +			return ret;
> +		}
>  	}
>  
>  	/* We can now rely on the release function for cleanup */
>  	dev->release = rpmsg_eptdev_release_device;
>  
> -	return ret;
> -
> -free_ept_ida:
> -	ida_free(&rpmsg_ept_ida, dev->id);
> -free_minor_ida:
> -	if (cdev)
> -		ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
> -free_eptdev:
> -	dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
> -	kfree(eptdev);
> -
> -	return ret;
> +	return 0;
>  }
>  
>  static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_channel_info chinfo)
> @@ -509,12 +499,17 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>  			       struct rpmsg_channel_info chinfo)
>  {
>  	struct rpmsg_eptdev *eptdev;
> +	int ret;
>  
>  	eptdev = rpmsg_chrdev_eptdev_alloc(rpdev, parent);
>  	if (IS_ERR(eptdev))
>  		return PTR_ERR(eptdev);
>  
> -	return rpmsg_chrdev_eptdev_add(eptdev, chinfo);
> +	ret = rpmsg_chrdev_eptdev_add(eptdev, chinfo);
> +	if (ret)
> +		kfree(eptdev);

Previous patch.

> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
>  
> @@ -545,6 +540,12 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
>  
>  	ret =  rpmsg_eptdev_add(eptdev, chinfo, false);
>  	if (ret) {
> +		dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
> +		/*
> +		 * Avoid put_device() or WARN() will be triggered due to absence of
> +		 * device::release(), refer to device_release().
> +		 */
> +		kfree(eptdev);

Previous patch.

>  		return ret;
>  	}
>  
> @@ -572,6 +573,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>  	struct rpmsg_channel_info chinfo;
>  	struct rpmsg_eptdev *eptdev;
>  	struct device *dev = &rpdev->dev;
> +	int ret;
>  
>  	memcpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
>  	chinfo.src = rpdev->src;
> @@ -590,7 +592,11 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>  	 */
>  	eptdev->default_ept->priv = eptdev;
>  
> -	return rpmsg_chrdev_eptdev_add(eptdev, chinfo);
> +	ret = rpmsg_chrdev_eptdev_add(eptdev, chinfo);
> +	if (ret)
> +		kfree(eptdev);

Previous patch.

> +
> +	return ret;
>  }
>  
>  static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
> -- 
> 2.25.1
> 
