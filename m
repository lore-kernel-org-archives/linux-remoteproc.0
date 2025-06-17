Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558612E7166;
	Tue, 17 Jun 2025 13:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750166073; cv=none; b=XXp1iJJ5mq20N/E9mo/gxfQ3EKp6w7yxCYfqOIX7wt0ItkTZ+AyVUD8rnxNy2t7dz21asohaSnrQg/r5tJiRK/nQnEo2bgr8tCKXtfkY1PfDUVVqmhbvgjyzRMI5RZh1FhRYdjv5WFGeS+WLt21VcU8HOuSJDraQNzHvTyLkgiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750166073; c=relaxed/simple;
	bh=0LVGSzjpwovh30wyVpbwCgepNApCu+zccovSdlBTF/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWd7F5llHdR1lP3KDt6+PrMLAEraEz6hL/Hw/A782/ycHbd7pigalVK0l2uYS7vS6X3OBZ7j9wy72pGpI2aEHPLcObMQ6I7OuuWNruQMlm07O+yhEesjabm2VobJ8Dx5Bco6mOiJHOPpITvOWRiGb5IJWxdAZYad/Ad3NGh+MTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+40mfOC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+40mfOC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C3B4C4CEE3;
	Tue, 17 Jun 2025 13:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750166072;
	bh=0LVGSzjpwovh30wyVpbwCgepNApCu+zccovSdlBTF/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a+40mfOCghiaCI3d0KSVALtjmhxZJ/ZB5G9TvM4lNwVuY0IDj1D1HZG1LGKa7sggb
	 Uty+f9DuDun9IRNAf/j2FKI1/eg8uBBNuHG35MChBFR7jXMnIhHf/wRi3ZHFV27biY
	 vte+ELk4Va+wVUBT0/Lm+y+PJ8Cxg2a8HcLNM277B9DXbH/snpVojgAVbJbp92ObH3
	 xxoHOGpD4HyCXMh8QAbqsoAr5OMyET/HvPVYIviyWkeCYdy0wMNbYtQXiWpKmUdkNV
	 n5WwyE1SyEUGCUvrmFwT2qBxU24QPRQmgw7PATB8NL/VutywV+JeQek9mGQXGNlT3i
	 VlJCyUoPmLSBQ==
Date: Tue, 17 Jun 2025 08:14:29 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v5] remoteproc: Add device awake calls in rproc boot and
 shutdown path
Message-ID: <2vzz6gtepjp4zmeei3jbxaagpluxs5owjctahn5qczmwa74tc6@2yzzvb26cjvk>
References: <20250408104317.926833-1-quic_schowdhu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408104317.926833-1-quic_schowdhu@quicinc.com>

On Tue, Apr 08, 2025 at 04:13:17PM +0530, Souradeep Chowdhury wrote:
> Add device awake calls in case of rproc boot and rproc shutdown path.
> Currently, device awake call is only present in the recovery path
> of remoteproc. If an user stops and starts rproc by using the sysfs
> interface, then on pm suspension the firmware fails to load as the
> request_firmware call under adsp_load relies on usermodehelper 
> process which gets freezed on pm suspension. Add device awake calls 
> to fix this.
> 

This is much better, but it still leaves me guessing what the actual
problem is. Does the firmware call time out? Does firmware loading
explicitly fail upon a freeze?

Also, please rephrase the commit message to follow the order defined in
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes 
i.e. start with the description of the problem, not the word "Add".

Regards,
Bjorn

> Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
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
