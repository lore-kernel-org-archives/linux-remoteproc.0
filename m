Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AD01F5827
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 May 2025 20:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747340649; cv=none; b=k98LwUxwf7JA+8Hzj9PXrUMi2EDtrh4Vcs8XDBtvK2CI9eeSYLs2hwfZmxdYiVikEGBdLa9CM3xYqVnwutOUq9wwVnedSfkAcw5xbPf1diWCwg4XbeR/PQwIwRgAUyTCLLhPLmBUawqS6eV1OeGJr8iBjXfmp1Jrzhzos6LiKnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747340649; c=relaxed/simple;
	bh=+kMqPl0JDQX7QaGiLL+7LffY8No4gEZI/PY3gX1O+3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRwoHK8QkYTmrT8fg7fCPPDkwcVF+b8ACx07C1ZD9fvLdPRtfspKB3Cl3WkeIbgdeQWyjL/bRMe4aF/xsF/gVX8O5JO0N6abCWfEScE7dRqJJjvPQcxGSXEKdAsbPwwoHlh+GqmRAhaWQ9ytTMA9peeF6GUKXV58rZUbAsa1rko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vR31NpxZ; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vR31NpxZ"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-af5085f7861so923869a12.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 15 May 2025 13:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747340647; x=1747945447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V2VSQyhTZNV0jvE/2WckSMtS0BAnsxh057td4KI4roM=;
        b=vR31NpxZu4LV64sFMxPKBqLZ+9y+SSKZxWVxHeusVkHcDu5dT10QZKZx1+vaGlngZg
         UXCFikaqCNIg1M8GsfRWXZj9MmZBVH1NbMSLE54OdXehyoATD15boYIb/ZelZwrtNK8m
         7r+TOWfE0CqOd0jJ5+O1qKxshvBa/hYDzZENc66sp9orB6eBT1M7qG3xjVDtifADklFe
         8opgwi1+XkdSbc/RvtcKNYE5+AXBtZ1CzpIuKhoI1q6zkAhZXZApzbkTRggdR384bRhF
         l4ita13wBQrJ6Byo4UqWMI0FShyhfc4GzKIM8RWFrnDw6c6E8Kzs2Uchs92+rzMxhTGS
         +orA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747340647; x=1747945447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2VSQyhTZNV0jvE/2WckSMtS0BAnsxh057td4KI4roM=;
        b=ZWs43tw4fXl3m1j1mW0/xueTu9z8Je5YuYSulZKVXCbQR2U4eOQMmtIsiRuC9m8cuk
         wG1HQeyE/no/Yv2RFaBTumybrn03XPGJer99ilUT5vm3nqc3wZtEBFVjkTJcuoKhj0wF
         EQ62SYVFDAwxRuZF/rYHT/yokUQgenrjk/2P5HZTk3EDI30Y6ylvtLU6g1XVcAXnEQ7y
         dBm/t5kg2e+nzbIiK6DBnF1xfwciXn1iahQWNCpfh+hTzg5Q01ruggVR5TgEUrRj1qu3
         Y05lX22Q4Sy0YpKH6y/flX1Wr+TZfqysYm1y14UAD0AE5iytNkBVoB+QJOkzV0uzDp/x
         Ru8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDp1PtfdTomkDUM0uMJdDNzHoGf85yaOsGFrRADtV1jwHmDp5tORY4WSQ8sItwABBZOqDNy3kWNLZt4TEWYLNc@vger.kernel.org
X-Gm-Message-State: AOJu0YxMqWJ7JYIB/6O6A7fdYJVfHVd72MAHit2VmYxDFt4rq4h+sxav
	aCIvqjLdrtq8wZ/yDjZ2FY/bDBQz2nMFA8+2rZGIeh9u/u+QYinjTNeZOqu1g2vJAKg=
X-Gm-Gg: ASbGncs6cfzzazhxmjRmvRqAWdXRmWKZScrb3Mvn1Wu4cttZu2XURPH7Nd5JsFKdd4H
	5VIBnfofp6mWWmUclnLnNiZc4eHhFzUe6LMhYAv+Mz65Q0NiawgrQy5wobSdmk7Q1NBkktQ2r8U
	bXl0X1AvBB5Y/HLAscmuj3kr5dLJTMCCENKQTjbj1wU9VKRzX8bWyd3FpdE9WB8xr1YCnwXvJv1
	sHE3/rLoiNRBG7QY1jVfaWRbm+Ck3LC0FJ2/IRr7iUv3k8hVzpB2HgFaYCCu2zlqWdozYLKhdvE
	wZqnXpElsfl7UNndrZtaR6FmRxlAxaKyhwCgbmqGduj3EirDGA21zi20rqITKUOQ/Q==
X-Google-Smtp-Source: AGHT+IEUFKVx7oIa2XqCPU17O56pYWL4lei0a4c8lfjHEvBMewyutxU8qjTgh8IMG0LEf2+RATTOXg==
X-Received: by 2002:a17:90b:3a88:b0:30e:7b3b:b901 with SMTP id 98e67ed59e1d1-30e7d558c1emr1000521a91.18.1747340646700;
        Thu, 15 May 2025 13:24:06 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1d7a:b4f2:fe56:fa4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e334fb0d0sm3879347a91.41.2025.05.15.13.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 13:24:06 -0700 (PDT)
Date: Thu, 15 May 2025 14:24:04 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Dawei Li <dawei.li@linux.dev>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, set_pte_at@outlook.com
Subject: Re: [PATCH v2 1/3] rpmsg: char: Reuse eptdev logic for anon device
Message-ID: <aCZNZPkb5oPZiz9G@p14s>
References: <20250509155927.109258-1-dawei.li@linux.dev>
 <20250509155927.109258-2-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509155927.109258-2-dawei.li@linux.dev>

Hi,

On Fri, May 09, 2025 at 11:59:25PM +0800, Dawei Li wrote:
> Current uAPI implementation for rpmsg ctrl & char device manipulation is
> abstracted in procedures below:
> 
> Current uAPI implementation for rpmsg ctrl & char device manipulation is
> abstracted in procedures below:
> - fd = open("/dev/rpmsg_ctrlX")
> - ioctl(fd, RPMSG_CREATE_EPT_IOCTL, &info); /dev/rpmsgY devnode is
>   generated.
> - fd_ep = open("/dev/rpmsgY", O_RDWR)
> - operations on fd_ep(write, read, poll ioctl)
> - ioctl(fd_ep, RPMSG_DESTROY_EPT_IOCTL)
> - close(fd_ep)
> - close(fd)
> 
> This /dev/rpmsgY abstraction is less favorable for:
> - Performance issue: It's time consuming for some operations are
> invovled:
>   - Device node creation.
>     Depends on specific config, especially CONFIG_DEVTMPFS, the overall
>     overhead is based on coordination between DEVTMPFS and userspace
>     tools such as udev and mdev.
> 
>   - Extra kernel-space switch cost.
> 
>   - Other major costs brought by heavy-weight logic like device_add().
> 
> - /dev/rpmsgY node can be opened only once. It doesn't make much sense
>     that a dynamically created device node can be opened only once.
> 
> - For some container application such as docker, a client can't access
>   host's dev unless specified explicitly. But in case of /dev/rpmsgY, which
>   is generated dynamically and whose existence is unknown for clients in
>   advance, this uAPI based on device node doesn't fit well.
> 
> An anon inode based approach is introduced to address the issues above.
> Rather than generating device node and opening it, rpmsg code just make
> a anon inode representing eptdev and return the fd to userspace.

Please change occurences of "anon" for "anonyous".  "Anon" was used to avoid
writing "anonymous" all the time in the code, but description should not use the
shorthand.  In the title, this patch and all other patches.

> 
> The legacy abstraction based on struct dev and struct cdev is honored
> for:
> - Avoid legacy uAPI break(RPMSG_CREATE_EPT_IOCTL)
> - Reuse existing logic:
>   -- dev_err() and friends.
>   -- Life cycle management of struct device.
> 
> Signed-off-by: Dawei Li <dawei.li@linux.dev>
> ---
>  drivers/rpmsg/rpmsg_char.c | 80 ++++++++++++++++++++++++++------------
>  1 file changed, 56 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index eec7642d2686..5b2a883d6236 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -91,7 +91,8 @@ int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
>  	/* wake up any blocked readers */
>  	wake_up_interruptible(&eptdev->readq);
>  
> -	cdev_device_del(&eptdev->cdev, &eptdev->dev);
> +	if (eptdev->dev.devt)
> +		cdev_device_del(&eptdev->cdev, &eptdev->dev);
>  	put_device(&eptdev->dev);
>  
>  	return 0;
> @@ -132,21 +133,17 @@ static int rpmsg_ept_flow_cb(struct rpmsg_device *rpdev, void *priv, bool enable
>  	return 0;
>  }
>  
> -static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
> +static int __rpmsg_eptdev_open(struct rpmsg_eptdev *eptdev)
>  {
> -	struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
>  	struct rpmsg_endpoint *ept;
>  	struct rpmsg_device *rpdev = eptdev->rpdev;
>  	struct device *dev = &eptdev->dev;
>  
> -	mutex_lock(&eptdev->ept_lock);
>  	if (eptdev->ept) {
> -		mutex_unlock(&eptdev->ept_lock);
>  		return -EBUSY;
>  	}
>  
>  	if (!eptdev->rpdev) {
> -		mutex_unlock(&eptdev->ept_lock);
>  		return -ENETRESET;
>  	}
>  
> @@ -164,21 +161,32 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  	if (!ept) {
>  		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
>  		put_device(dev);
> -		mutex_unlock(&eptdev->ept_lock);
>  		return -EINVAL;
>  	}
>  
>  	ept->flow_cb = rpmsg_ept_flow_cb;
>  	eptdev->ept = ept;
> -	filp->private_data = eptdev;
> -	mutex_unlock(&eptdev->ept_lock);
>  
>  	return 0;
>  }
>  
> -static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
> +static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  {
>  	struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
> +	int ret;
> +
> +	mutex_lock(&eptdev->ept_lock);
> +	ret = __rpmsg_eptdev_open(eptdev);
> +	if (!ret)
> +		filp->private_data = eptdev;
> +	mutex_unlock(&eptdev->ept_lock);
> +
> +	return ret;
> +}
> +
> +static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
> +{
> +	struct rpmsg_eptdev *eptdev = filp->private_data;
>  	struct device *dev = &eptdev->dev;
>  
>  	/* Close the endpoint, if it's not already destroyed by the parent */
> @@ -400,12 +408,13 @@ static void rpmsg_eptdev_release_device(struct device *dev)
>  	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
>  
>  	ida_free(&rpmsg_ept_ida, dev->id);
> -	ida_free(&rpmsg_minor_ida, MINOR(eptdev->dev.devt));
> +	if (eptdev->dev.devt)
> +		ida_free(&rpmsg_minor_ida, MINOR(eptdev->dev.devt));
>  	kfree(eptdev);
>  }
>  
> -static struct rpmsg_eptdev *rpmsg_chrdev_eptdev_alloc(struct rpmsg_device *rpdev,
> -						      struct device *parent)
> +static struct rpmsg_eptdev *__rpmsg_chrdev_eptdev_alloc(struct rpmsg_device *rpdev,
> +							struct device *parent, bool cdev)


I would simply rename this rpmsg_eptdev_alloc() and then use is in
rpmsg_chrdev_eptdev_alloc() and rpmsg_anonynous_eptdev_alloc()

>  {
>  	struct rpmsg_eptdev *eptdev;
>  	struct device *dev;
> @@ -428,33 +437,50 @@ static struct rpmsg_eptdev *rpmsg_chrdev_eptdev_alloc(struct rpmsg_device *rpdev
>  	dev->groups = rpmsg_eptdev_groups;
>  	dev_set_drvdata(dev, eptdev);
>  
> -	cdev_init(&eptdev->cdev, &rpmsg_eptdev_fops);
> -	eptdev->cdev.owner = THIS_MODULE;
> +	if (cdev) {
> +		cdev_init(&eptdev->cdev, &rpmsg_eptdev_fops);
> +		eptdev->cdev.owner = THIS_MODULE;
> +	}
>  
>  	return eptdev;
>  }
>  
> -static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_channel_info chinfo)
> +static struct rpmsg_eptdev *rpmsg_chrdev_eptdev_alloc(struct rpmsg_device *rpdev,
> +						      struct device *parent)
> +{
> +	return __rpmsg_chrdev_eptdev_alloc(rpdev, parent, true);
> +}
> +
> +static int __rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev,
> +				     struct rpmsg_channel_info chinfo, bool cdev)

Same here, rpmsg_eptdev_add()

>  {
>  	struct device *dev = &eptdev->dev;
>  	int ret;
>  
>  	eptdev->chinfo = chinfo;
>  
> -	ret = ida_alloc_max(&rpmsg_minor_ida, RPMSG_DEV_MAX - 1, GFP_KERNEL);
> -	if (ret < 0)
> -		goto free_eptdev;
> -	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
> +	if (cdev) {
> +		ret = ida_alloc_max(&rpmsg_minor_ida, RPMSG_DEV_MAX - 1, GFP_KERNEL);
> +		if (ret < 0)
> +			goto free_eptdev;
>  
> +		dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
> +	}
> +
> +	/* Anon inode device still need dev name for dev_err() and friends */
>  	ret = ida_alloc(&rpmsg_ept_ida, GFP_KERNEL);
>  	if (ret < 0)
>  		goto free_minor_ida;
>  	dev->id = ret;
>  	dev_set_name(dev, "rpmsg%d", ret);
>  
> -	ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
> -	if (ret)
> -		goto free_ept_ida;
> +	ret = 0;
> +
> +	if (cdev) {
> +		ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
> +		if (ret)
> +			goto free_ept_ida;
> +	}
>  
>  	/* We can now rely on the release function for cleanup */
>  	dev->release = rpmsg_eptdev_release_device;
> @@ -464,7 +490,8 @@ static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_cha
>  free_ept_ida:
>  	ida_free(&rpmsg_ept_ida, dev->id);
>  free_minor_ida:
> -	ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
> +	if (cdev)
> +		ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
>  free_eptdev:
>  	put_device(dev);
>  	kfree(eptdev);
> @@ -472,6 +499,11 @@ static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_cha
>  	return ret;
>  }
>  
> +static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_channel_info chinfo)
> +{
> +	return __rpmsg_chrdev_eptdev_add(eptdev, chinfo, true);
> +}
> +
>  int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
>  			       struct rpmsg_channel_info chinfo)
>  {
> -- 
> 2.25.1
> 
