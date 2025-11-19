Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5633B3346B2
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Nov 2025 10:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763549793; cv=none; b=oUEMWQ04F259tv7QltNR0+BcSJNeOVP5axT8S0qeTFcozChyAwvbThVZ7HjBFvqdkUggiX8P6CAvKVCi8LpDKnWhrzZb2E8gWc9qy8JMsQpNIMNsWuhONcZl8weephOVyOVuK1rv+ubraQy6LNX6PGuQTPyDF5HwVZgarA3ZUqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763549793; c=relaxed/simple;
	bh=+dd4aTM+DdkzF0AEV7r1PusXMSIFr993O52L94Gcaic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZGNIfX2XGvuEeBA51hIuFGdJaHKMPmjzIL6xar1ndNS641AcrGDs+g3MuejM9ZDphsKXIcRMHxGJg7tOKYisRHfPvA3/AgR/c+XwPn7Hx7krTr2Gu6wJsB096EnyH/AT7xH99aOEX3321g1yUuvvaiaM7w8I5o22TYXI42FNnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bkNzVuH5; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bkNzVuH5"
Date: Wed, 19 Nov 2025 18:56:12 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763549787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hQDn+ececBTWzmGEZTahpjGE7pcstk+NGXj1VClJDZE=;
	b=bkNzVuH57H7bBu6+41sOjSj//Qf+YheIGGe69MNsXzMfTSs+xG51KmnRVu924SpMtmBSzk
	BVUfZ7pftSx2q+xmJBgdKCDyBhtEjoqDB+he6w9PtPU0x/ktVBgJmYxIjND1M3m5tboSnp
	5O6mA7pyluRenSwmXW9DC7VfNStoob4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Dawei Li <dawei.li@linux.dev>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	set_pte_at@outlook.com, dawei.li@linux.dev
Subject: Re: [PATCH v4 1/3] rpmsg: char: Fix WARN() in error path of
 rpmsg_eptdev_add()
Message-ID: <20251119105612.GA4907@wendao-VirtualBox>
References: <20251118154107.3100-1-dawei.li@linux.dev>
 <20251118154107.3100-2-dawei.li@linux.dev>
 <38308885-af2e-4b61-9653-00bfca8ca0e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38308885-af2e-4b61-9653-00bfca8ca0e9@oss.qualcomm.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Nov 19, 2025 at 12:07:02PM +0800, Zhongqiu Han wrote:
> On 11/18/2025 11:41 PM, Dawei Li wrote:
> > put_device() is called on error path of rpmsg_eptdev_add() to cleanup
> > resource attached to eptdev->dev, unfortunately it's bogus cause
> > dev->release() is not set yet.
> > 
> > When a struct device instance is destroyed, driver core framework checks
> > the possible release() callback from candidates below:
> > - struct device::release()
> > - dev->type->release()
> > - dev->class->dev_release()
> > 
> > Rpmsg eptdev owns none of them so WARN() will complain the absence of
> > release().
> > 
> > Fix it by:
> > - Pre-assign dev->release() before potential error path.
> > - Check before ida_free() in dev->release().
> > 
> > By fixing error path of rpmsg_eptdev_add() and fixing potential memory
> > leak in rpmsg_anonymous_eptdev_create(), this work paves the way of rework
> > of rpmsg_eptdev_add() and its callers.
> > 
> > Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
> > Signed-off-by: Dawei Li <dawei.li@linux.dev>
> > ---
> >   drivers/rpmsg/rpmsg_char.c | 26 +++++++++++++-------------
> >   1 file changed, 13 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> > index 34b35ea74aab..373b627581e8 100644
> > --- a/drivers/rpmsg/rpmsg_char.c
> > +++ b/drivers/rpmsg/rpmsg_char.c
> > @@ -408,8 +408,13 @@ static void rpmsg_eptdev_release_device(struct device *dev)
> >   {
> >   	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
> > -	ida_free(&rpmsg_ept_ida, dev->id);
> > -	if (eptdev->dev.devt)
> > +	/*
> > +	 * release() can be invoked from error path of rpmsg_eptdev_add(),
> > +	 * WARN() will be fired if ida_free() is feed with invalid ID.
> > +	 */
> > +	if (likely(ida_exists(&rpmsg_ept_ida, dev->id)))
> > +		ida_free(&rpmsg_ept_ida, dev->id);
> > +	if (eptdev->dev.devt && likely(ida_exists(&rpmsg_minor_ida, MINOR(eptdev->dev.devt))))
> >   		ida_free(&rpmsg_minor_ida, MINOR(eptdev->dev.devt));
> >   	kfree(eptdev);
> >   }
> > @@ -458,6 +463,8 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
> >   	struct device *dev = &eptdev->dev;
> >   	int ret;
> > +	dev->release = rpmsg_eptdev_release_device;
> > +
> >   	eptdev->chinfo = chinfo;
> >   	if (cdev) {
> > @@ -471,7 +478,7 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
> >   	/* Anonymous inode device still need device name for dev_err() and friends */
> >   	ret = ida_alloc(&rpmsg_ept_ida, GFP_KERNEL);
> >   	if (ret < 0)
> > -		goto free_minor_ida;
> > +		goto free_eptdev;
> >   	dev->id = ret;
> >   	dev_set_name(dev, "rpmsg%d", ret);
> > @@ -480,22 +487,13 @@ static int rpmsg_eptdev_add(struct rpmsg_eptdev *eptdev,
> >   	if (cdev) {
> >   		ret = cdev_device_add(&eptdev->cdev, &eptdev->dev);
> >   		if (ret)
> > -			goto free_ept_ida;
> > +			goto free_eptdev;
> >   	}
> > -	/* We can now rely on the release function for cleanup */
> > -	dev->release = rpmsg_eptdev_release_device;
> > -
> >   	return ret;
> > -free_ept_ida:
> > -	ida_free(&rpmsg_ept_ida, dev->id);
> > -free_minor_ida:
> > -	if (cdev)
> > -		ida_free(&rpmsg_minor_ida, MINOR(dev->devt));
> >   free_eptdev:
> >   	put_device(dev);
> > -	kfree(eptdev);
> 
> 
> Hi Dawei,
> 
> Thanks for your new version~
> 
> Patch 1/3 will introduce a use-after-free of eptdev in func
> rpmsg_anonymous_eptdev_create(),
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/rpmsg/rpmsg_char.c?h=for-next#n548
> 
> even though this issue will be resolved in 2/3. However, 1/3, as an
> independent commit, should not introduce a new bug.

FWIW, it's not new bug introduced by this commit, it's introduced by
2410558f5f11, which is supposed to be fixed in patch[2/3].

And new reorganize of series is trying to address the comments from
Mathieu[1], If I understand it correctly.

Bjorn, Mathieu,
What's your inputs on this? I will respin v5 if you find it necessary.

Diff between v5 from v4:
patch[1/3]: Remove dev_err(&eptdev->dev) from rpmsg_anonymous_eptdev_create();

patch[2/3]: Bring back dev_err(&eptdev->dev) to rpmsg_anonymous_eptdev_create();

[1] https://lore.kernel.org/all/aRd8mDzQWXtEFnmt@p14s/

> 
> 
> >   	return ret;
> >   }
> > @@ -561,6 +559,8 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
> >   	if (!ret)
> >   		*pfd = fd;
> > +	else
> > +		put_device(&eptdev->dev);
> >   	return ret;
> >   }
> 
> 
> -- 
> Thx and BRs,
> Zhongqiu Han

Thanks,

	Dawei
