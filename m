Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813071361
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 May 2025 12:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747397271; cv=none; b=gCY9xloNbxLl6q6yOSmzsFCBXBN3FmIij2yFrKZw++2wSXCKB1Yyf9F8u76QK1Cbsgni1/Wxx59S+OwpdkOn5m2uOIBGYXi4WCqai1gUJ0bPB2FBs6dZQqG6e5fYEwQyF05Ur3qxYscWUDkTJ4QIQDyyihGGjn4tNGB4uir7cFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747397271; c=relaxed/simple;
	bh=wC0JoQ2jtOkGfxIeSX2wwCEjyGoWayjcplNo+j9yLvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTHS1EpCnkE5dDGO5L6wafDZcbR27qb6RoETrdDD4oLUSUPMavhx4jY8/PQs0yzZ9KJGfue2U4UcSG49Txbx92ZV9y92HqW+V28p6p9LHXnYZ5Sg8Mash2DPv4fSjruE3ySYRyeVBFSKl6UlbBZUkGF3sZ0egbU3AI010WMpoMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IV8OkrRB; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IV8OkrRB"
Date: Fri, 16 May 2025 20:07:08 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747397265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2PQP4CfvZo5c+28K4YG9Cb+1p+vxFB02sB5cLp2u7Ho=;
	b=IV8OkrRBrBjRKKc5Fv224BT+fk0nuMYqnz9hYX+d7Np3h5W8T+pHqqj54dla5UpRwu9v4b
	Y3W3ZSPqHm65PO2s6JLkvcN7KJcDSO9dmjCeKmmlmmYnwI90WmO24Z8VcG3r23SzULDUuk
	q2mvfkFypOhyyXJ3LDwDAlVwEpxq7fA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Dawei Li <dawei.li@linux.dev>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, set_pte_at@outlook.com,
	dawei.li@linux.dev
Subject: Re: [PATCH v2 1/3] rpmsg: char: Reuse eptdev logic for anon device
Message-ID: <20250516120708.GA10474@wendao-VirtualBox>
References: <20250509155927.109258-1-dawei.li@linux.dev>
 <20250509155927.109258-2-dawei.li@linux.dev>
 <aCZNZPkb5oPZiz9G@p14s>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCZNZPkb5oPZiz9G@p14s>
X-Migadu-Flow: FLOW_OUT

Hi Mathieu,

Thanks for reviewing.

On Thu, May 15, 2025 at 02:24:04PM -0600, Mathieu Poirier wrote:
> Hi,
> 
> On Fri, May 09, 2025 at 11:59:25PM +0800, Dawei Li wrote:
> > Current uAPI implementation for rpmsg ctrl & char device manipulation is
> > abstracted in procedures below:
> > 
> > Current uAPI implementation for rpmsg ctrl & char device manipulation is
> > abstracted in procedures below:
> > - fd = open("/dev/rpmsg_ctrlX")
> > - ioctl(fd, RPMSG_CREATE_EPT_IOCTL, &info); /dev/rpmsgY devnode is
> >   generated.
> > - fd_ep = open("/dev/rpmsgY", O_RDWR)
> > - operations on fd_ep(write, read, poll ioctl)
> > - ioctl(fd_ep, RPMSG_DESTROY_EPT_IOCTL)
> > - close(fd_ep)
> > - close(fd)
> > 
> > This /dev/rpmsgY abstraction is less favorable for:
> > - Performance issue: It's time consuming for some operations are
> > invovled:
> >   - Device node creation.
> >     Depends on specific config, especially CONFIG_DEVTMPFS, the overall
> >     overhead is based on coordination between DEVTMPFS and userspace
> >     tools such as udev and mdev.
> > 
> >   - Extra kernel-space switch cost.
> > 
> >   - Other major costs brought by heavy-weight logic like device_add().
> > 
> > - /dev/rpmsgY node can be opened only once. It doesn't make much sense
> >     that a dynamically created device node can be opened only once.
> > 
> > - For some container application such as docker, a client can't access
> >   host's dev unless specified explicitly. But in case of /dev/rpmsgY, which
> >   is generated dynamically and whose existence is unknown for clients in
> >   advance, this uAPI based on device node doesn't fit well.
> > 
> > An anon inode based approach is introduced to address the issues above.
> > Rather than generating device node and opening it, rpmsg code just make
> > a anon inode representing eptdev and return the fd to userspace.
> 
> Please change occurences of "anon" for "anonyous".  "Anon" was used to avoid
> writing "anonymous" all the time in the code, but description should not use the
> shorthand.  In the title, this patch and all other patches.

Acked.

> 
> > 
> > The legacy abstraction based on struct dev and struct cdev is honored
> > for:
> > - Avoid legacy uAPI break(RPMSG_CREATE_EPT_IOCTL)
> > - Reuse existing logic:
> >   -- dev_err() and friends.
> >   -- Life cycle management of struct device.
> > 
> > Signed-off-by: Dawei Li <dawei.li@linux.dev>
> > ---
> >  drivers/rpmsg/rpmsg_char.c | 80 ++++++++++++++++++++++++++------------
> >  1 file changed, 56 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> > index eec7642d2686..5b2a883d6236 100644
> > --- a/drivers/rpmsg/rpmsg_char.c
> > +++ b/drivers/rpmsg/rpmsg_char.c
> > @@ -91,7 +91,8 @@ int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
> >  	/* wake up any blocked readers */
> >  	wake_up_interruptible(&eptdev->readq);
> >  
> > -	cdev_device_del(&eptdev->cdev, &eptdev->dev);
> > +	if (eptdev->dev.devt)
> > +		cdev_device_del(&eptdev->cdev, &eptdev->dev);
> >  	put_device(&eptdev->dev);
> >  
> >  	return 0;
> > @@ -132,21 +133,17 @@ static int rpmsg_ept_flow_cb(struct rpmsg_device *rpdev, void *priv, bool enable
> >  	return 0;
> >  }
> >  
> > -static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
> > +static int __rpmsg_eptdev_open(struct rpmsg_eptdev *eptdev)
> >  {
> > -	struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
> >  	struct rpmsg_endpoint *ept;
> >  	struct rpmsg_device *rpdev = eptdev->rpdev;
> >  	struct device *dev = &eptdev->dev;
> >  
> > -	mutex_lock(&eptdev->ept_lock);
> >  	if (eptdev->ept) {
> > -		mutex_unlock(&eptdev->ept_lock);
> >  		return -EBUSY;
> >  	}
> >  
> >  	if (!eptdev->rpdev) {
> > -		mutex_unlock(&eptdev->ept_lock);
> >  		return -ENETRESET;
> >  	}
> >  
> > @@ -164,21 +161,32 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
> >  	if (!ept) {
> >  		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
> >  		put_device(dev);
> > -		mutex_unlock(&eptdev->ept_lock);
> >  		return -EINVAL;
> >  	}
> >  
> >  	ept->flow_cb = rpmsg_ept_flow_cb;
> >  	eptdev->ept = ept;
> > -	filp->private_data = eptdev;
> > -	mutex_unlock(&eptdev->ept_lock);
> >  
> >  	return 0;
> >  }
> >  
> > -static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
> > +static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
> >  {
> >  	struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
> > +	int ret;
> > +
> > +	mutex_lock(&eptdev->ept_lock);
> > +	ret = __rpmsg_eptdev_open(eptdev);
> > +	if (!ret)
> > +		filp->private_data = eptdev;
> > +	mutex_unlock(&eptdev->ept_lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
> > +{
> > +	struct rpmsg_eptdev *eptdev = filp->private_data;
> >  	struct device *dev = &eptdev->dev;
> >  
> >  	/* Close the endpoint, if it's not already destroyed by the parent */
> > @@ -400,12 +408,13 @@ static void rpmsg_eptdev_release_device(struct device *dev)
> >  	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
> >  
> >  	ida_free(&rpmsg_ept_ida, dev->id);
> > -	ida_free(&rpmsg_minor_ida, MINOR(eptdev->dev.devt));
> > +	if (eptdev->dev.devt)
> > +		ida_free(&rpmsg_minor_ida, MINOR(eptdev->dev.devt));
> >  	kfree(eptdev);
> >  }
> >  
> > -static struct rpmsg_eptdev *rpmsg_chrdev_eptdev_alloc(struct rpmsg_device *rpdev,
> > -						      struct device *parent)
> > +static struct rpmsg_eptdev *__rpmsg_chrdev_eptdev_alloc(struct rpmsg_device *rpdev,
> > +							struct device *parent, bool cdev)
> 
> 
> I would simply rename this rpmsg_eptdev_alloc() and then use is in
> rpmsg_chrdev_eptdev_alloc() and rpmsg_anonynous_eptdev_alloc()

Agreed. rpmsg_eptdev_alloc() is much better.

> 
> >  {
> >  	struct rpmsg_eptdev *eptdev;
> >  	struct device *dev;
> > @@ -428,33 +437,50 @@ static struct rpmsg_eptdev *rpmsg_chrdev_eptdev_alloc(struct rpmsg_device *rpdev
> >  	dev->groups = rpmsg_eptdev_groups;
> >  	dev_set_drvdata(dev, eptdev);
> >  
> > -	cdev_init(&eptdev->cdev, &rpmsg_eptdev_fops);
> > -	eptdev->cdev.owner = THIS_MODULE;
> > +	if (cdev) {
> > +		cdev_init(&eptdev->cdev, &rpmsg_eptdev_fops);
> > +		eptdev->cdev.owner = THIS_MODULE;
> > +	}
> >  
> >  	return eptdev;
> >  }
> >  
> > -static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_channel_info chinfo)
> > +static struct rpmsg_eptdev *rpmsg_chrdev_eptdev_alloc(struct rpmsg_device *rpdev,
> > +						      struct device *parent)
> > +{
> > +	return __rpmsg_chrdev_eptdev_alloc(rpdev, parent, true);
> > +}
> > +
> > +static int __rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev,
> > +				     struct rpmsg_channel_info chinfo, bool cdev)
> 
> Same here, rpmsg_eptdev_add()

Acked.

All the issues above, including those for patch 2/3, will be fixed in
V3.

Thanks,

	Dawei

> 
> >  {
> >  	struct device *dev = &eptdev->dev;
> >  	int ret;
> >  
> >  	eptdev->chinfo = chinfo;
> >  
> > -	ret = ida_alloc_max(&rpmsg_minor_ida, RPMSG_DEV_MAX - 1, GFP_KERNEL);
> > -	if (ret < 0)
> > -		goto free_eptdev;
> > -	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
> > +	if (cdev) {
> > +		ret = ida_alloc_max(&rpmsg_minor_ida, RPMSG_DEV_MAX - 1, GFP_KERNEL);
> > +		if (ret < 0)
> > +			goto free_eptdev;
> >  
> > +		dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
> > +	}
> > +
> > +	/* Anon inode device still need dev name for dev_err() and friends */
> >  	ret = ida_alloc(&rpmsg_ept_ida, GFP_KERNEL);
> >  	if (ret < 0)
> >  		goto free_minor_ida;
> >  	dev->id = ret;
> >  	dev_set_name(dev, "rpmsg%d", ret);
> >  
> > -	ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
> > -	if (ret)
> > -		goto free_ept_ida;
> > +	ret = 0;
> > +
> > +	if (cdev) {
> > +		ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
> > +		if (ret)
> > +			goto free_ept_ida;
> > +	}
> >  
> >  	/* We can now rely on the release function for cleanup */
> >  	dev->release = rpmsg_eptdev_release_device;
> > @@ -464,7 +490,8 @@ static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_cha
> >  free_ept_ida:
> >  	ida_free(&rpmsg_ept_ida, dev->id);
> >  free_minor_ida:
> > -	ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
> > +	if (cdev)
> > +		ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
> >  free_eptdev:
> >  	put_device(dev);
> >  	kfree(eptdev);
> > @@ -472,6 +499,11 @@ static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_cha
> >  	return ret;
> >  }
> >  
> > +static int rpmsg_chrdev_eptdev_add(struct rpmsg_eptdev *eptdev, struct rpmsg_channel_info chinfo)
> > +{
> > +	return __rpmsg_chrdev_eptdev_add(eptdev, chinfo, true);
> > +}
> > +
> >  int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
> >  			       struct rpmsg_channel_info chinfo)
> >  {
> > -- 
> > 2.25.1
> > 
