Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16A62EBBAC;
	Wed, 18 Jun 2025 14:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257167; cv=none; b=ZL9luTwp5zrQZkvrek0vY96aEfSeHPYZ6zgz4/8PMxV3S4KRx0Pu+2yMrj0w7g9jL68/WJfp7svuKWELkLGBLzGwJ1MhVhISzd1ni8ZEi5gjeK87HLsvdLH2PKA4oXWJ6xetc5+AvDxLlp3WEaHyQf/S3KaQdbfreBzSehlBGiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257167; c=relaxed/simple;
	bh=KAVdzvilE+pDc1pQTRefxg04/Waau9dPnmCfPrHicBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oH1QpzkacamNFH9cs5QlvcPtAg5CvA4DjG05LT9Qcclm6LJd/uS3JEzZvV9XrV5fXqWc+1g50KfB7TH5cOaB/bdneJilL39JHk2UHy7LkaGk8L90KFS1zFRkuJnVl9AnRzobJv7sl26EuTOepY111H77LNAPXXHFX9MY02yQC/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u7grdHCI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u7grdHCI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7111CC4CEE7;
	Wed, 18 Jun 2025 14:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750257166;
	bh=KAVdzvilE+pDc1pQTRefxg04/Waau9dPnmCfPrHicBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u7grdHCIP8d+bl1OxZxQcEfzA3z5xUaAzWL3MDmFeqelVU8S2eN7EaDLaXNhGoGq1
	 hGyDyIKpV50u8yx7dAOK5uAB5Upo+yxHd1SVOVEwSjUNADWn0QsAf878+4QFseSjzA
	 lCqCRfLYtRo7TzgLit++M39YCWtjlfdiBbeu7/nhEfRW4xBgQXU6Le3lPngpd1c23i
	 P8MvPz8qc/XfjXQjOEdT+YN6DQMtBKRI3l7mWptkJ0vZjY/2rahiovAxYFESero7HO
	 2udrqN8wsi3S/R2azO6lG5/AXlDvQ1vx1RofNXDL403zb34awDBmW5j4yTfEbey0Dn
	 Nib15HREGhQhQ==
Date: Wed, 18 Jun 2025 09:32:44 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v6] remoteproc: Add device awake calls in rproc boot and
 shutdown path
Message-ID: <u326j22wteqtadni7wawvwbr6ai3h72iszwtfjwwbaztxj245c@5q4y7xlb3xnk>
References: <20250618094441.1994965-1-quic_schowdhu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618094441.1994965-1-quic_schowdhu@quicinc.com>

On Wed, Jun 18, 2025 at 03:14:41PM +0530, Souradeep Chowdhury wrote:
> Device awake calls are only present in the recovery path of remoteproc.

This is not the problem, this merely documents a related fact. Might be
worth mention after the problem has been established.

> If an user stops and starts rproc by using the sysfs interface, then on
> pm suspension the firmware fails to load as the request_firmware call
> under adsp_load relies on usermodehelper process which gets freezed on
> pm suspension.

I asked why is this a problem, what happens when the usermodehelper
processes gets frozen, why does this cause an issue for the starting
remoteproc?

Why does it cause issues during shutdown?

Regards,
Bjorn

> Add device awake calls in the rproc boot and shutdown path
> to fix this.
> 
> Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
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
