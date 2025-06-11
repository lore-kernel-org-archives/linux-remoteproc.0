Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABDE79C4
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Jun 2025 03:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749613836; cv=none; b=QOL8fFnsGl0H9Rv2+6hMeQrumjNxTL5ciGpMjaxlLv8i96DBeKxzNQVr4TE1wbMIxX72ukZEyhfM77jpIzF31jl5iLx+YHETrJ1P+WJLB8Z/mIRBwibUR47TdRdgLvcJYxBEg4dMVGG274xB4zHDBd9m+gNalzF3pEVDgmPGCBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749613836; c=relaxed/simple;
	bh=PojrnmG6Vilx3yTXVnizxzhbCq/ZLNWfSkIT3FyigPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=apRPBIhpUF+UzhWNvkBSXJ+Wes7KAidZmCmsU0fku9GdGGCzuMgErWmlr+GpJLcGnXGCk59wCdq4bNk+XnyTd4aME6YZtxUHv+hXZsTCb6bJykRdhYemIW9tAwytUfqIoabESacFRT+9TPw8JONONEovbXWG2+gSkwHgpZ37E4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c11U+BWO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c11U+BWO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A11EC4CEEE;
	Wed, 11 Jun 2025 03:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749613835;
	bh=PojrnmG6Vilx3yTXVnizxzhbCq/ZLNWfSkIT3FyigPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c11U+BWOfXU9nXudcOJz8SU9Rt1XciaLm1LHcTuBLfklNWb/M/+V5QFBv3Gb1K8G9
	 +b7kkQD4k87olwFY1A1Sm0RTmt0SOYw7Jxu6TNvrIikw/TWZPvtVznp3tbsVm53P0g
	 2TeB8UBwpuU/hKvMqS4yHaenDI5/EFa8lrZffqA32ae4FzlfZPpDVFbN+OXX90zGLN
	 FZNmi4Sp0KE5m2rslbJK6RNFo+kCuuLVd0o78O2sCLi1gq6sBXWdahPGbN8obnWvOx
	 32vsqSVjjcXv7/BN+RZnRgPKh6p8kQyJdHi0tm4fTp5b2BfoZdf18wA2x2aVHzl9vB
	 55XghqCteYeew==
Date: Tue, 10 Jun 2025 22:50:33 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Li Jun <lijun01@kylinos.cn>
Cc: mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: Cancel init error to zero
Message-ID: <qsxegdcyfgohvmq7nzvemani6xvwpbrzubxl2vsdjwg3ht723o@w3mrp5clgzcd>
References: <20250609010817.26498-1-lijun01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609010817.26498-1-lijun01@kylinos.cn>

On Mon, Jun 09, 2025 at 09:08:17AM +0800, Li Jun wrote:
> the reset_control_assert(wkupm3->rsts) should assign a value
> to 'error' before it is return, so the var don't need init
> to 0.
> 

The zero-initialization is indeed unnecessary, but your commit message
describe a problem that doesn't exist.

The current code matches the style of the Linux kernel better, with
local variables declared before the body of the function.

Regards,
Bjorn

> Signed-off-by: Li Jun <lijun01@kylinos.cn>
> ---
>  drivers/remoteproc/wkup_m3_rproc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
> index d8be21e71721..24d72fcc26f9 100644
> --- a/drivers/remoteproc/wkup_m3_rproc.c
> +++ b/drivers/remoteproc/wkup_m3_rproc.c
> @@ -77,9 +77,7 @@ static int wkup_m3_rproc_stop(struct rproc *rproc)
>  	struct platform_device *pdev = wkupm3->pdev;
>  	struct device *dev = &pdev->dev;
>  	struct wkup_m3_platform_data *pdata = dev_get_platdata(dev);
> -	int error = 0;
> -
> -	error = reset_control_assert(wkupm3->rsts);
> +	int error = reset_control_assert(wkupm3->rsts);
>  
>  	if (!wkupm3->rsts && pdata->assert_reset(pdev, pdata->reset_name)) {
>  		dev_err(dev, "Unable to assert reset of wkup_m3!\n");
> -- 
> 2.25.1
> 
