Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0FB2FDC51
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Oct 2025 14:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760453283; cv=none; b=AmPX/iVoi7IZnp4xZeAt4rnbj/fs+MY/bGTiXIstqDJ9mK63+/dNJ/OCJGlT4B5GB+aQCiqbzDcEPJ26d5cYPVhTI9I9jYxuJbJD42ONDb/jfL5oEbmrH6vidGd5jvv+jMBYaqv+ZmT/dhvQ2T2M3VKJdKOfw8mEs7ZP2r4HwkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760453283; c=relaxed/simple;
	bh=t3JeelhavgJlvR1ZwyHoapB3tFs5Z7kTAMrAmctRWGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlojYvDhKWbr1LSQhwW4pu2QAJCB3QZ2ZPXRZxHwHxlcl6+EskPP8FGV0quM6u2d5XDzUc7Dtns69/+CsMnQIG1pRNAmTYUcktL30pELsq7wFjSG2Qdculn9e4h0OqVhOtNdJoLixRilzTdOltMqIoWw/kJZ1lfoHFgSelY3zSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vV3Uoitp; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vV3Uoitp"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-780fc3b181aso3228515b3a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Oct 2025 07:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760453279; x=1761058079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1VMcv/WwJNqD/h/B11jXsfWcJyNALBVGkv849SpavMk=;
        b=vV3Uoitp8Aukhu2RowZJIq6s+IAG5Y+PTgMLAjaKbJ4biLMW/kXde6ttjAV1VurSyz
         N+gJazeUU35ZC2MtK8QD59MXFqP7aF7XCkwDd4YO0/IUSMNqeay5nLSyewcCrpEGlvsf
         GAwqDwQcdXXQ8x5NjH0aykL6LxDeCSctr+FlIl49zAqI3qXciGGRyfZdGzlGHQm7MtTQ
         rzfeT2BmgFP7JUiD/aowXOdvWvtjysSkhlf9SYQ1t1YnHXpRnbHMMVy84zHeMlPVhMg9
         8RWArdNiJWrvBsj1eqwe4BupPtA5wkG1HcQi0PtM15Z/yb7WQc/wl1K3c8FKJmiwZhW8
         fZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760453279; x=1761058079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VMcv/WwJNqD/h/B11jXsfWcJyNALBVGkv849SpavMk=;
        b=OqPE6Ni0Sur1Uanr91XBaUV1Ne+kZrTmD4t+TrWDRf3LcLwB6A7xJekYVOfdqnbxdN
         gLKsPRNDKq2HWWAOUjhmGeuYHXkYxlYdYkS+h9iqbnSR6XAACczlljcT3dzhZmPeE0GN
         154kM49eoDTBC1l0RMOwOl8F9WiwkCC5to7OHDntPOZJ6ANDfdpqUrcztWU0QpEBfv8i
         jXWPM5+oQHW6kwmr1/U19LfRMkpKG4gdIJVHIh+Il62fG6w6eLaDUbN0Q8TwMeY08lXT
         HrVZmakWhSeXgPO1noOyBYzjBAjxV+DAmTc3Rt7XVjgw3V2E5KcOrZXNCM/f3nUGp2yv
         qQPg==
X-Forwarded-Encrypted: i=1; AJvYcCXsHDXf98GIfGQOWCTjSReasIC4MhzrwhWWs227D4lKyIfiRJEnK3b9lvIQKWGD9T4JlLz/bnXCT++4/zFinRo0@vger.kernel.org
X-Gm-Message-State: AOJu0YxlwtKvCo38kUdsgFgYeqwR0sLDYKMKlExjc+jsnGjOETuvsZgy
	IvwAYMGevgaQnT0PKZFlxT1Gdr9jIf7ttWWOpT9kYl2FDJYHJ9p1wEv0m5/Ketxg4MA=
X-Gm-Gg: ASbGncsCiEItax6Xz1E/5nK/buJW6vWOfrtp/vqYMiNEoLNJisnytGRvbU/jbNBgPPJ
	4BuBGTeA63oX6d4kct5+s67kt3mjNqiuWlz13myQOXrCbM2lWDeV5Yw7gsB7OffMiW4AYT4cLn1
	XYnNOQBlH2irONpCy7SN5mXGypQ05P55sEqg7g3WGVB2Ooj8uzZPooCxOCaLlFLCjUD32fZ6uHb
	hcprb6rafvgt3uXUQ8b4nP2m6wxrBLMU3G6ewjq41l93Vr+wHZT2MW7ejqJmVCuOME0PMSzN3J7
	NYkxY3vCZ2xEjT/q/nU/XoBxzT4cQ7tmv/AQcSTBbV+xEOXQPO25CaqcaXy5DABo+GH2E5rRIn5
	guSg45E1ZGbLnmtgYuLA9VI0I67zq0aKgyB20j3TwkH0oUsv5
X-Google-Smtp-Source: AGHT+IE531tDBs5FFqjRlBMygQj0EV+WwZcvk7j9g7oDPATu+ePcqqw7IhSErv/dNjmnMcH6Dc3ZYQ==
X-Received: by 2002:a05:6a00:1956:b0:781:15b0:beb4 with SMTP id d2e1a72fcca58-79387242fd1mr28404032b3a.21.1760453278868;
        Tue, 14 Oct 2025 07:47:58 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:68ce:31e8:3a83:30af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0966d7sm15310465b3a.40.2025.10.14.07.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 07:47:58 -0700 (PDT)
Date: Tue, 14 Oct 2025 08:47:56 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Dawei Li <dawei.li@linux.dev>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, set_pte_at@outlook.com
Subject: Re: [PATCH v4 1/3] rpmsg: char: Reuse eptdev logic for anonymous
 device
Message-ID: <aO5inFRpD_aVxtxD@p14s>
References: <20250609151531.22621-1-dawei.li@linux.dev>
 <20250609151531.22621-2-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609151531.22621-2-dawei.li@linux.dev>

Hi,

On Mon, Jun 09, 2025 at 11:15:29PM +0800, Dawei Li wrote:
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
> - Performance issue: It's time consuming for some operations are involved:
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
>   host's device node unless specified explicitly. But in case of
>   /dev/rpmsgY, which is generated dynamically and whose existence is
>   unknown for clients in advance, this uAPI based on device node doesn't
>   fit well.
> 
> An anonymous inode based approach is introduced to address the issues above.

The above line is too long and gives me a checkpatch warning.  Please refactor
and send again.

Thanks,
Mathieu

> Rather than generating device node and opening it, rpmsg code just creates
> an anonymous inode representing eptdev and return the fd to userspace.
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
> index eec7642d2686..6c19f2146698 100644
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
> +static struct rpmsg_eptdev *rpmsg_eptdev_alloc(struct rpmsg_device *rpdev,
> +					       struct device *parent, bool cdev)
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
> +	return rpmsg_eptdev_alloc(rpdev, parent, true);
> +}
> +
> +static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
> +			    struct rpmsg_channel_info chinfo, bool cdev)
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
> +	/* Anonymous inode device still need device name for dev_err() and friends */
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
> +	return rpmsg_eptdev_add(eptdev, chinfo, true);
> +}
> +
>  int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
>  			       struct rpmsg_channel_info chinfo)
>  {
> -- 
> 2.25.1
> 
