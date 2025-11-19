Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF2F30BF4E
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 17:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763572464; cv=none; b=jmnebVjyl4Y8QNMXT/pwkkNEI/jSNiOcV41Xg53ER79ih2VqTB4ZvZe53ziSgBZz9KWSzE8CZ8faUovadbo0XSSRyxFAsoueNqZqG76DnSpIx/hsc/cvRu0kEzTXbbF2p2H2xgRuGLHuVexbwFtpglp6+QNBxEkigAuOBHvh9K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763572464; c=relaxed/simple;
	bh=pdlBOU4a/12sE7yZesshah5K94/hzkOUf6YByxux4BU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6Snjl6EpnzHfyCwjJ19oyGgokx747U9zXiPwODTh+MZkUaUBvq1a5AkA+5LqMr5IeBoQZjn/aL5jkLPCd6GBFW+yurF9P6xVUqeHAVNCHKgjjzy+YMd81Cp/MiNpxjxSdhnE1WEENfjkA3CDNCDuLprXEsil+fGAuEawjSTrH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mXk7Isqz; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mXk7Isqz"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29853ec5b8cso79870655ad.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 09:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763572462; x=1764177262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Csf+sQh2Hq3MaeSUCxFoGGktulefW5FB0Z/SVdF6eR8=;
        b=mXk7IsqzWmdGMEUb3W7Csm9RC8xk433UC1E+erVSkbRMZQcpKAYGWsmd1m9HItm40e
         rExOHx7iTpEr0t2If5kNofUOKZXQe3AUbMT7J0de7mID8qmeQ7q13rLUCLvj1Ww7DmNw
         p8rkbFTUXyCRM1RGetUW2cSbU1U2nckxQJBdQIpa507fAUcC3lcDTmen3gAk/TOtSITn
         PynWx/InDywDRyKOrNfMAM5kuDaicsACmzettDSbNJrbZUeMIB9eb5X4h+K5jC0Gcw1t
         e0d4QE/vDM86EsQEk249gdYm56ABSlqrE0C8a1lFJsRPHB9EdsGEu98BGUcnZXyZSpBx
         Nuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763572462; x=1764177262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Csf+sQh2Hq3MaeSUCxFoGGktulefW5FB0Z/SVdF6eR8=;
        b=TTYYlyhqbG7F7ax3fKFJbcyb+5Q3nuvrVu+D7OcATedYZdUxLj31XlWkmUzOuXMPDg
         KjQwxsI0rieqeCE/WNvLAiUeMZu+s7Sc4rfF9O2wnrKRPtehRQMsciTVJLSH017EDiDz
         eQGqWZPGtc8w2gEINXrB5ECTXYvr0eKP/2LXtFrSxrLtUOAOkdKp8G/2Abj81nUD9THw
         iPO/T2gF5ZYE7iSMU6DOmisKzD7HnWoXQy1K0Nx/i06C8LEX7Ml1JFjRlURAHSodqlnk
         djYGQyV2mbq4vMhVU8UUaDqZUl4Z/vqOaCpnezRQwDBeRuKTdLxOaeE2meQ1Ct0e+qzW
         T+Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWVc8cvPVNTmUkQyC4Lg9+VbBBCvYHIxlW/EZzHTnhpk1flnVVyzugR5Sp3KOfrvFFpbo9DfHWeuvQf7ASOh4eE@vger.kernel.org
X-Gm-Message-State: AOJu0YyQCShnQlnxz8fxN1WLjgU57gk5Q8OcCE0sjZmtDPdJqxV7RM9K
	eNZ8ptVTYqbdvWbFVr2C/3oAR+JgZ3XwIGAqa0tNCzh0MK+aOAYhTSoU1c25feizKs8dO5eT2zt
	GeXIFWoo=
X-Gm-Gg: ASbGncsdMjmFvhQMl715xnfKDbqXQ0iNtUSzPYGW8pD7GiWLV1mM/2b8O09yZlKZ5iQ
	DcBBXVAibzQa4BBqXcxxXMTtHXcArwsAAG985bzDxTSt8mAHD77bC65sa1L1CPXdBu+vSBq0lQ9
	our0ZXCkwpQ3qzdKB3FhbKELF94YWpob0RDEc+1xU3r0INlca8V5J6QckRAIItWTwVi7NxrqGUu
	Ke92o13J2v/2C40pPsNuCrru+mtWeispS2/Te3YrBczuZpocj9vjA7ImbqzVn2uGnepRKbDWe7p
	p8qINfI64/pFayPNDmoNofKoXRreYTQfmGGO3cXfRoat5h9M5bAl19ze6oMEjk7K2rq2PNp37Mq
	wnnRtjvTqbDa/zty3qK1fCwbPcST5SiaEsXB8bSG+mlhmHplLA3d6u0T749luv8OvuYz5+bE+RQ
	qWVujWwy3aGpnOZMYhovQAFjVC
X-Google-Smtp-Source: AGHT+IGvPnxVxKCfuMPhP6oFtCx0nkN2I/Ao/y08ITdWcR7Gt5WiB8RV6AlPRV6Ni5bchtOcYauv8A==
X-Received: by 2002:a17:903:13ce:b0:298:5abe:4b1 with SMTP id d9443c01a7336-29b5b11c635mr1436275ad.52.1763572461540;
        Wed, 19 Nov 2025 09:14:21 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:f8d9:9ae3:90a2:d39e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138bd7sm469415ad.28.2025.11.19.09.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 09:14:20 -0800 (PST)
Date: Wed, 19 Nov 2025 10:14:18 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Dawei Li <dawei.li@linux.dev>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, set_pte_at@outlook.com
Subject: Re: [PATCH v4 1/3] rpmsg: char: Fix WARN() in error path of
 rpmsg_eptdev_add()
Message-ID: <aR366kJhviG-ashA@p14s>
References: <20251118154107.3100-1-dawei.li@linux.dev>
 <20251118154107.3100-2-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118154107.3100-2-dawei.li@linux.dev>

On Tue, Nov 18, 2025 at 11:41:05PM +0800, Dawei Li wrote:
> put_device() is called on error path of rpmsg_eptdev_add() to cleanup
> resource attached to eptdev->dev, unfortunately it's bogus cause
> dev->release() is not set yet.
> 
> When a struct device instance is destroyed, driver core framework checks
> the possible release() callback from candidates below:
> - struct device::release()
> - dev->type->release()
> - dev->class->dev_release()
> 
> Rpmsg eptdev owns none of them so WARN() will complain the absence of
> release().
> 
> Fix it by:
> - Pre-assign dev->release() before potential error path.
> - Check before ida_free() in dev->release().
> 
> By fixing error path of rpmsg_eptdev_add() and fixing potential memory
> leak in rpmsg_anonymous_eptdev_create(), this work paves the way of rework
> of rpmsg_eptdev_add() and its callers.
> 
> Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
> Signed-off-by: Dawei Li <dawei.li@linux.dev>
> ---
>  drivers/rpmsg/rpmsg_char.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 34b35ea74aab..373b627581e8 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -408,8 +408,13 @@ static void rpmsg_eptdev_release_device(struct device *dev)
>  {
>  	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
>  
> -	ida_free(&rpmsg_ept_ida, dev->id);
> -	if (eptdev->dev.devt)
> +	/*
> +	 * release() can be invoked from error path of rpmsg_eptdev_add(),
> +	 * WARN() will be fired if ida_free() is feed with invalid ID.
> +	 */
> +	if (likely(ida_exists(&rpmsg_ept_ida, dev->id)))
> +		ida_free(&rpmsg_ept_ida, dev->id);
> +	if (eptdev->dev.devt && likely(ida_exists(&rpmsg_minor_ida, MINOR(eptdev->dev.devt))))
>  		ida_free(&rpmsg_minor_ida, MINOR(eptdev->dev.devt));
>  	kfree(eptdev);
>  }
> @@ -458,6 +463,8 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
>  	struct device *dev = &eptdev->dev;
>  	int ret;
>  
> +	dev->release = rpmsg_eptdev_release_device;
> +

A device's release function if for an allocated device, not to address an error
path.  This should have been left where it was.

>  	eptdev->chinfo = chinfo;
>  
>  	if (cdev) {
> @@ -471,7 +478,7 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
>  	/* Anonymous inode device still need device name for dev_err() and friends */
>  	ret = ida_alloc(&rpmsg_ept_ida, GFP_KERNEL);
>  	if (ret < 0)
> -		goto free_minor_ida;
> +		goto free_eptdev;
>  	dev->id = ret;
>  	dev_set_name(dev, "rpmsg%d", ret);
>  
> @@ -480,22 +487,13 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
>  	if (cdev) {
>  		ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
>  		if (ret)
> -			goto free_ept_ida;
> +			goto free_eptdev;
>  	}
>  
> -	/* We can now rely on the release function for cleanup */
> -	dev->release = rpmsg_eptdev_release_device;
> -
>  	return ret;
>  
> -free_ept_ida:
> -	ida_free(&rpmsg_ept_ida, dev->id);
> -free_minor_ida:
> -	if (cdev)
> -		ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
>  free_eptdev:
>  	put_device(dev);
> -	kfree(eptdev);

You're doing two things at the same time, i.e dealing with the kfree() _and_
put_device().  As indicated before, if this function fails the kfree() needs to
happend in the error handling of rpmsg_eptdev_add() in
rpmsg_anonymous_eptdev_create() and not in rpmsg_eptdev_release_device().

I am now at a point where I have spent too much time on this patchet -
continuing to work on it would be unfair to other people waiting for their
patches to be reviewed.  As such I have backed-out this feature from the
rpmsg-next tree.  

Thanks,
Mathieu

>  
>  	return ret;
>  }
> @@ -561,6 +559,8 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
>  
>  	if (!ret)
>  		*pfd = fd;
> +	else
> +		put_device(&eptdev->dev);
>  
>  	return ret;
>  }
> -- 
> 2.25.1
> 
