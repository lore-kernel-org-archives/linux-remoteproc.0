Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81E336B05E;
	Mon, 23 Feb 2026 19:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771874844; cv=none; b=QT+Ixg5UbW8xtt6N8J26XDa/b1u2AHaxinbhGec7XoKj4zyaa/N5gP7q1CjwH3YJLiEt0+DbbDiQ5YGeE9+iFJjF1M7FdwI2paiKEHfrgEJ5qU+NmSGu5l1qDVXh2tUfxNbFSUhHokxIBzR+dWvsqJDCL1IIZtAlzdmfFucOg+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771874844; c=relaxed/simple;
	bh=cdL5E8L7wDke+1k8iOjg7CKlpIWn7nq9gy97LHlIQw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNOwS/OwD2lJxzW3yNY62B/5ZiQz/uUdvsmhckZxzxBodXFJfzhKenFMHY3Ze49m+fZ3oGHVTbHNQcfGLW4A/0BDpIe8vwjBOwjRCjVf2pxb2DrdwGrXUoRYgUdFRuQAodHZCydWyLOpKHSz2YvjOwD3GVZu9gR8ShV4WLiOhYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LLQ7DZzx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LLQ7DZzx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C55E5C116C6;
	Mon, 23 Feb 2026 19:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771874844;
	bh=cdL5E8L7wDke+1k8iOjg7CKlpIWn7nq9gy97LHlIQw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LLQ7DZzxqXlDTE7Bdlikdi1jX3N0oBseX3KjblWANrmUwh5f2cIZn5ATEnOIj4Goe
	 p4fmtgHeX6ddvHd5/VYBKRz0qn1wq9BDyD82BbmV+lWp7uc1v1jhxQtwJ3dBBeSPA0
	 Mn8bmVd2QuhBJEg0I4z5EbPqs+nAY5p/umEX8tLDd3VAqfnyv+OAcAHfXm4Z7Zf4DS
	 tbBgn0sTIjxSZ2bSHNDxPyB4XFf+mMt7uztLhAy6OZvYDbW3gGlTw0zfwEEMEhlvRN
	 4E3mwQ9PC45nEqN7/HNb1V8u1ix7ljcovjHKctv9nKCDqhMKUBzWkSuVtHs6Z0fAuk
	 3x528uZAwXdPQ==
Date: Mon, 23 Feb 2026 13:27:21 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] remoteproc: core: full attach detach during
 recovery
Message-ID: <tggyglgkgwj4skvyyeg74gdhlzmw45pmpakvrnghp5jsv6ujtp@z32a7g2s6sle>
References: <20260223185006.1278518-1-tanmay.shah@amd.com>
 <20260223185006.1278518-2-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223185006.1278518-2-tanmay.shah@amd.com>

On Mon, Feb 23, 2026 at 10:50:05AM -0800, Tanmay Shah wrote:
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
> Changes in v3:
>  - both rproc_attach_recovery() and
>    rproc_boot_recovery() are called the same way.
>  - remove unrelated changes
> 
> Changes in v2:
>  - use rproc_boot instead of rproc_attach
>  - move debug message early in the function
> 
>  drivers/remoteproc/remoteproc_core.c | 33 +++++++++++-----------------
>  1 file changed, 13 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index aada2780b343..790ad7c6d12e 100644
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
> @@ -1790,10 +1790,14 @@ static int rproc_boot_recovery(struct rproc *rproc)
>  	struct device *dev = &rproc->dev;
>  	int ret;
>  
> -	ret = rproc_stop(rproc, true);
> +	ret = mutex_lock_interruptible(&rproc->lock);
>  	if (ret)
>  		return ret;
>  
> +	ret = rproc_stop(rproc, true);
> +	if (ret)
> +		goto unlock_mutex;
> +
>  	/* generate coredump */
>  	rproc->ops->coredump(rproc);
>  
> @@ -1801,7 +1805,7 @@ static int rproc_boot_recovery(struct rproc *rproc)
>  	ret = request_firmware(&firmware_p, rproc->firmware, dev);
>  	if (ret < 0) {
>  		dev_err(dev, "request_firmware failed: %d\n", ret);
> -		return ret;
> +		goto unlock_mutex;
>  	}
>  
>  	/* boot the remote processor up again */
> @@ -1809,6 +1813,8 @@ static int rproc_boot_recovery(struct rproc *rproc)
>  
>  	release_firmware(firmware_p);
>  
> +unlock_mutex:
> +	mutex_unlock(&rproc->lock);
>  	return ret;
>  }
>  
> @@ -1827,26 +1833,13 @@ static int rproc_boot_recovery(struct rproc *rproc)
>  int rproc_trigger_recovery(struct rproc *rproc)
>  {
>  	struct device *dev = &rproc->dev;
> -	int ret;
> -
> -	ret = mutex_lock_interruptible(&rproc->lock);
> -	if (ret)
> -		return ret;
> -
> -	/* State could have changed before we got the mutex */
> -	if (rproc->state != RPROC_CRASHED)
> -		goto unlock_mutex;
>  
>  	dev_err(dev, "recovering %s\n", rproc->name);
>  
>  	if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
> -		ret = rproc_attach_recovery(rproc);
> +		return rproc_attach_recovery(rproc);

rproc_trigger_recovery() can be called either from scheduled work or
directly from the debugfs/sysfs interface, it doesn't seem safe to me to
call rproc_attach_recovery() without ensuring mutual exclusion between
multiple parallel callers.

In fact, I can see the relationship between the commit message and the
changes in rproc_attach_recovery() and rproc_detach(), but I'm not sure
why you need to change rproc_boot_recovery() and
rproc_trigger_recovery(). Perhaps you're just missing some explanation
in the commit message?

Regards,
Bjorn

>  	else
> -		ret = rproc_boot_recovery(rproc);
> -
> -unlock_mutex:
> -	mutex_unlock(&rproc->lock);
> -	return ret;
> +		return rproc_boot_recovery(rproc);
>  }
>  
>  /**
> @@ -2057,7 +2050,7 @@ int rproc_detach(struct rproc *rproc)
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
