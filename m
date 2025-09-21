Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451442F29;
	Sun, 21 Sep 2025 03:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758423651; cv=none; b=qzJb2NT8z5f2UMEEnKNR0ck4M1BOrAYfqQaHKtd24a7snuyvKl4YvjJx3qvxJBLqx+fiwfiJLG4aEqJ8prfzwm5E3F/r+APMGvMaEpR8vlHYhH/aLrVIRTM8NvO1zNjHES758Z1cXrmfC/ncBYkEtk6Dt3Ak90HNNmbBUrEsqok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758423651; c=relaxed/simple;
	bh=7Sqew7VnB4Jph6FHKh9b5Kf91xZLXtkgSSFLTMlmuhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GE91L4MW4mFJftiWlvasqfqzJ5xkMImV8627feywPBvV3BI4ppZrwFBioaztmceHhesfLWg5xFoGgv9XQVUFy9O4EuqoiRsxWEA4g7/vrjmCX/cwjja6kIUefShu+0eTQpkovG2Twoar5anNL95b9HX+R9cStGj0lFDOpUJ7EwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bH+tA6DI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bH+tA6DI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B79EC113CF;
	Sun, 21 Sep 2025 03:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758423650;
	bh=7Sqew7VnB4Jph6FHKh9b5Kf91xZLXtkgSSFLTMlmuhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bH+tA6DIaYzJMI9SIwvY/pl891+2rbdH8J3JMlfI6LqZ3RYUp1H0K/KMfP7vAnSDK
	 rWNPdIMfjNQMsy88LSUcp/K5nrnX7w+TN8d7sUibVHDB7RlpBkG6eaRJYHxWz+ul2N
	 +uz7MIsXZ7ODBPoGt4TozN6KyNuWQfWgOuAL4AGTu6A2iEQhT1C6feS+P9Aj+qRf6/
	 4qUmXjACsFA+wtv2pzgbXkC8yvgTGXc6bycyrKQGERclvSru5paepTIn+KAhA/SYKI
	 cwIAM/fuS+dDiRiYdPRA7IN0hD9ezCqfnrNNIH4NwYbP8oBcnD+qO5LuaOsvFV2yBV
	 xQGS7w+J8kXgw==
Date: Sat, 20 Sep 2025 22:00:48 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Souradeep Chowdhury <souradeep.chowdhury@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Souradeep Chowdhury <quic_schowdhu@quicnc.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v7] remoteproc: Add device awake calls in rproc boot and
 shutdown path
Message-ID: <ud4nodcdhxr4pux6nsvqzaclqrnmct6ehjr5bmsxdgjby5xs4k@4c23gunpbf4z>
References: <20250828092615.2114183-1-souradeep.chowdhury@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828092615.2114183-1-souradeep.chowdhury@oss.qualcomm.com>

On Thu, Aug 28, 2025 at 02:56:15PM +0530, Souradeep Chowdhury wrote:
> If an user stops and starts rproc by using the sysfs interface, then on
> pm suspension the firmware fails to load as the request_firmware call
> under adsp_load relies on usermodehelper process via firmware_fallback_sysfs 
> which gets frozen on pm suspension.

How does it fail? Is the firmware load aborted? Does it time out while
we're suspended?

The usermodehelper is optional, adsp_load() doesn't rely on
usermodehelper, it relies on the firmware class, which might perform
usermodehelper.

Please describe how and why it fail, so that help educate others (me
included) about what the actual problem you're seeing is.

> Currently pm_awake calls are present 
> in the recovery path, add the same in start and stop path of rproc for 
> proper loading of the firmware in non-recovery path.  

I would expect/hope that the git log tells us that the pm_stay_awake()
in the recovery path is there to prevent the system from being suspended
while we're restarting the remotproc, as this is expected to lead to
functional degradation and suboptimal low power state.

"They call this function over there" is not sufficient motivation.


But just to be clear, I'm not saying that this patch is wrong. I'm
saying I don't understand your problem/motivation.

> 
> Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicnc.com>
> Signed-off-by: Souradeep Chowdhury <souradeep.chowdhury@oss.qualcomm.com>

This is both you, no need to carry both.

> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v7
> 
> *Justify this fix by adding more details in commit message

Please start use b4, so we get proper links to old submissions here.
 
Regards,
Bjorn

> Changes in v6
> 
> *Add some correction to commit message
> 
> Changes in v5
> 
> *Added more details to commit description
> 
> Changes in v4
> 
> *Remove stability from mailing list
> *Remove the extra tab in v3
> *Change the commit description
> 
>  drivers/remoteproc/remoteproc_core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index c2cf0d277729..5d6c4e694b4c 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1917,6 +1917,7 @@ int rproc_boot(struct rproc *rproc)
>  		return -EINVAL;
>  	}
>  
> +	pm_stay_awake(rproc->dev.parent);
>  	dev = &rproc->dev;
>  
>  	ret = mutex_lock_interruptible(&rproc->lock);
> @@ -1961,6 +1962,7 @@ int rproc_boot(struct rproc *rproc)
>  		atomic_dec(&rproc->power);
>  unlock_mutex:
>  	mutex_unlock(&rproc->lock);
> +	pm_relax(rproc->dev.parent);
>  	return ret;
>  }
>  EXPORT_SYMBOL(rproc_boot);
> @@ -1991,6 +1993,7 @@ int rproc_shutdown(struct rproc *rproc)
>  	struct device *dev = &rproc->dev;
>  	int ret = 0;
>  
> +	pm_stay_awake(rproc->dev.parent);
>  	ret = mutex_lock_interruptible(&rproc->lock);
>  	if (ret) {
>  		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
> @@ -2027,6 +2030,7 @@ int rproc_shutdown(struct rproc *rproc)
>  	rproc->table_ptr = NULL;
>  out:
>  	mutex_unlock(&rproc->lock);
> +	pm_relax(rproc->dev.parent);
>  	return ret;
>  }
>  EXPORT_SYMBOL(rproc_shutdown);
> -- 
> 2.34.1
> 
