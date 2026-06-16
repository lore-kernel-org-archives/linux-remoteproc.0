Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E5E37DEBF
	for <linux-remoteproc@vger.kernel.org>; Tue, 16 Jun 2026 15:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781623757; cv=none; b=PMXhtZQP1fyp4IBDEGJ5booGuDn99Q/jKFInX/z0n9cyDwb+oxwHf5xBg4fQkIM8qL5Ggaq6M631uqAR3YuXhEo061LAuaFvikosUrFDyLrdnHRDh8x98mCoPvNrU1JOmB/Y392gPj0aYPewoGiqcw6+Y9B+i6eXqi+oOMCWlSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781623757; c=relaxed/simple;
	bh=Z4wO3pxTs0luD9NhJFzofL2aCzjd+n1rNShWhdQjvyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sz1a7toLa1QE+j7OZ5hM72XQjeVgbvNlly2/KVJ3OHlaV3fA1123eZeCZrj28pyxn2s7ajx1MroVCKZOaQFlsHatmKKj3SIj3pX9W6WiTH6780RQm0BkWSuXBlVE9hkAAqQVP8WK/atcy17MUg/avaVtT6Sw9x7RC3MZcJ3Ul3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CRtgevLi; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CRtgevLi"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-37c8e7c8185so40601a91.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Jun 2026 08:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781623753; x=1782228553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HmTxXF5cZkGYxc1VSn87KOQRothuoF2vpV5jTzMsxKI=;
        b=CRtgevLigfu4eIb9MDO+OEKreT7z9/BbC5b3NvWTmOY+uM4XvvDi9j7P5DcJFGT3Ya
         SmuLPi/+yzqRjJSweNtMpm2HkzAY+9JJcb7UqXMmRaxyemO3U7XXiiWbwr8fE5Ffbvwb
         k/3AzSR4+CxVBDNy8kyrmNV44F/uYzRTgB5pbuXzw3ZG2dIWw3Bbn3GSxP0w8usLGuHR
         kquKDLhZVNa/VLqSEs1z9vnmPxTY2LJj69ZyM0FCfQumx0FdhhIf/PMBTSfKck+pih8w
         z/UOUViHF6XZEnXxL+cR4ggIsn2VBDzd2ZQPSQOW5GYgcs71czBdE0yfVAfpoMWjtJIM
         EvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781623753; x=1782228553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HmTxXF5cZkGYxc1VSn87KOQRothuoF2vpV5jTzMsxKI=;
        b=T7mZeC5Iwpr33uhVaFxNV9rcd9E32vU9dQmX6T+ig5vLw5uu6jA/8FtnGfIqBQa8kb
         SZ5U5IIuBntZcgQDbO3LC4xm7YoT0QwJJFGw3nZY0xFvKWcUYWCHmNFlIJiezbgGLk/Q
         ApWYQdyqtCcJIELpHYL4oO6RvCz1VTiUbeqknsU/wn9+Ip9i4W5NsPz6IUCyGNYSMPul
         v1aJOH5CudinI0AWrlEnfpOwicxx+8hEY7Dx/x1OYSlywPG3B/7Jdg0QAMRs3QBMjP0Z
         8UZ+nMA7flCsa8FOms23j5rX6I3Q1UxW/waLzifL1azN6Dkrla0Oky1xvMF+whjd8Y4l
         jirg==
X-Forwarded-Encrypted: i=1; AFNElJ8cf9UsbgnZMW4s4kqWa4JTkw/9Y434godeIPBsbEYg1A6NeJ2eXhfzmIeig37HupGruCi0dfrj2bDAS67hCJbn@vger.kernel.org
X-Gm-Message-State: AOJu0YwVxYgoGq8xoYop3xeRVajSYXJtOUoraygMO1e843J/0d00RUU2
	Yt1h94WLjTSE47P1z8rvno1dNy4tKVTmmynDJJMECqzW5mGCjF6a2GZQbPMA1/Cw0Q4YUlm1tSl
	40MWxlyw=
X-Gm-Gg: Acq92OHDZ9rxt0oxmca+Tbj837emBsv0BrlkY1wJQ0/jlsJogJB5a3LVVG560l2IALI
	T3/WM9P4Rp4A7Zx7Jwtp87TTqI350zmPnaW7DjDerZfji1ZrB7JghOrGkZ6D1k6Q29A06s0AWA4
	4ZodsOX+cOgwEzjT8+HeAGod2dnIntl1IxYmemDo90bS7v46qdqTKnV1owbdZ5UiXGFXnbU6tQL
	INe9EcviJLNDPQ+AmWpiuEpC7lCmKYQwiqR8bb/DSei98iRQhgi0QOCLn1bqn2q0uEvCU7XXiD4
	AKC+6DUhhR0HqrX1OSIMsB1Ji4ZtfSGThAQ54LG8s+q1+KcHq8PHr8FpVAjWZgQN07aCO0oOL6F
	7q3/I+NWvLODxo56+gMhjzdvQHmbMsMTI/dpR1/+VxEU/v6LNkkQjo6GNuORsOKVmQkCOLl9C6t
	UzhT3BVSDMas+gVvfHBcUsghuBiqDRCEfmjOgrnw==
X-Received: by 2002:a17:90b:1cc5:b0:37c:18e0:90ea with SMTP id 98e67ed59e1d1-37c2bd29455mr16579323a91.18.1781623753052;
        Tue, 16 Jun 2026 08:29:13 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1850:280c:40de:53f0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c5228eb5bsm3239749a91.12.2026.06.16.08.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 08:29:12 -0700 (PDT)
Date: Tue, 16 Jun 2026 09:29:10 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] remoteproc: core: full attach detach during
 recovery
Message-ID: <ajFrxvdmz6gb782Y@p14s>
References: <20260610182711.1758544-1-tanmay.shah@amd.com>
 <20260610182711.1758544-2-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610182711.1758544-2-tanmay.shah@amd.com>

Hi Tanmay,

On Wed, Jun 10, 2026 at 11:27:10AM -0700, Tanmay Shah wrote:
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
>  drivers/remoteproc/remoteproc_core.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index f003be006b1b..8393468fa1ee 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1776,7 +1776,20 @@ static int rproc_attach_recovery(struct rproc *rproc)
>  	if (ret)
>  		return ret;
>  
> -	return __rproc_attach(rproc);
> +	/* clean up all acquired resources */
> +	rproc_resource_cleanup(rproc);
> +
> +	/* release HW resources if needed */
> +	rproc_unprepare_device(rproc);
> +
> +	rproc_disable_iommu(rproc);
> +
> +	/* Free the copy of the resource table */
> +	kfree(rproc->cached_table);
> +	rproc->cached_table = NULL;
> +	rproc->table_ptr = NULL;
> +
> +	return rproc_attach(rproc);

That part works.

>  }
>  
>  static int rproc_boot_recovery(struct rproc *rproc)
> -- 
> 2.34.1
> 
