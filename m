Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A632550AF;
	Wed, 12 Nov 2025 16:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762965464; cv=none; b=cNg243BdKyOkUOSTfYMtru/Ix1UmeHuCNbO4Oz+RJVmzCUNk3XRyJLT4KzdfqdzLuLhno1KzPGn+sX4qLkWhPiiHXQyQGttiw3C0zM4OKnmWVXk9bMDSMKyYmzblpc84DmLutU8zYlI0XiapN382xss5oTGhHZNoM1Xbnku0lPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762965464; c=relaxed/simple;
	bh=l4GXyKV/Cz3Ck66FAmBPqfmbKasFWSaJ+quqBmgBNs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1f8i0jiyNuQnb+434q1bmXEXJBAyr945LGGC66y0od2emoQ64lYyV2/HtUi94JfwYYaRe9teYDex9CKojIF3Ynvpfh6C98Fxai/wguFdDjyuY0TclFMsDJ++KPxrjn7Uj4BMO9NFw0ZjhNspdWuRGM8gseRD0uzQ+DnJhHwr68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZrpAvmtL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZrpAvmtL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8849CC19422;
	Wed, 12 Nov 2025 16:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762965464;
	bh=l4GXyKV/Cz3Ck66FAmBPqfmbKasFWSaJ+quqBmgBNs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZrpAvmtLt9Ubvlp82eqYMhmf/3mDVFBfrpDB2DtxMTRawTJS9mzRHdt569DiVjjCG
	 PcVWx2OdnuD67pWlLwrw8R/mbqLXZtm3TztFFwQt4nhp4333UT1Ey+VohkBXIcxpuo
	 LJNeNGWUULQjp1dv/SpYWpI1XtjjFDVyZUDpdrn0dHFUNrwk9DKeu97ly1VZHGNc/n
	 8fEgxpEW3yiP8zzmsm1hiDiPxIcxJ7da4YM3MH9ozx4nSymKxIN4XQRvY0GU++qpK7
	 4GT1yvGTZnHsYDPnOCcL650IxlkivIZnwclQF6+KtPl9TtNtfEb/lQ8+X/UyHb5lBF
	 DM3AtQHqPCr0A==
Date: Wed, 12 Nov 2025 10:42:01 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dawei Li <dawei.li@linux.dev>
Cc: mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, set_pte_at@outlook.com, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] rpmsg: char: Fix UAF and memory leak
Message-ID: <mxctlnzpywrdahcvuahmxaa4h5vttz6p5yiu7jvtsemahjcsgj@bflvnu7viwff>
References: <20251112142813.33708-1-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112142813.33708-1-dawei.li@linux.dev>

On Wed, Nov 12, 2025 at 10:28:13PM +0800, Dawei Li wrote:
> Potential UAF and memory leak exsit in exception handling paths for
> rpmsg_anonymous_eptdev_create(), fix them.

Please describe the condition where this happens.

> 
> While at it, rework the error handling of rpmsg_eptdev_add() and its
> callers, following rule of "release resource where it's allocated".

Can this be done in a separate patch, to limit the impact of the two
parts of this change?

Regards,
Bjorn

> 
> Fixes: 2410558f5f11 ("rpmsg: char: Implement eptdev based on anonymous inode")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aPi6gPZE2_ztOjIW@stanley.mountain/
> 
> Signed-off-by: Dawei Li <dawei.li@linux.dev>
> ---
>  drivers/rpmsg/rpmsg_char.c | 59 +++++++++++++++++++++-----------------
>  1 file changed, 32 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 34b35ea74aab..de058a8b99ff 100644
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
> -	put_device(dev);
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
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
>  
> @@ -546,6 +541,11 @@ int rpmsg_anonymous_eptdev_create(struct rpmsg_device *rpdev, struct device *par
>  	ret =  rpmsg_eptdev_add(eptdev, chinfo, false);
>  	if (ret) {
>  		dev_err(&eptdev->dev, "failed to add %s\n", eptdev->chinfo.name);
> +		/*
> +		 * Avoid put_device() or WARN() will be triggered due to absence of
> +		 * device::release(), refer to device_release().
> +		 */
> +		kfree(eptdev);
>  		return ret;
>  	}
>  
> @@ -571,6 +571,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>  	struct rpmsg_channel_info chinfo;
>  	struct rpmsg_eptdev *eptdev;
>  	struct device *dev = &rpdev->dev;
> +	int ret;
>  
>  	memcpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
>  	chinfo.src = rpdev->src;
> @@ -589,7 +590,11 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>  	 */
>  	eptdev->default_ept->priv = eptdev;
>  
> -	return rpmsg_chrdev_eptdev_add(eptdev, chinfo);
> +	ret = rpmsg_chrdev_eptdev_add(eptdev, chinfo);
> +	if (ret)
> +		kfree(eptdev);
> +
> +	return ret;
>  }
>  
>  static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
> -- 
> 2.25.1
> 
