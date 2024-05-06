Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EC4157E62
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 May 2024 19:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715024616; cv=none; b=jsPGIQ55t0jVCCCPw1fM5mGB1YZQIUiciMzYYLwMF6sXJQldDpp/WzF6AGK46nTLh92tNftZU6RBppg/slkdjBF0GicilQWuZS9JbloHP639k+KuqF836gkdc5UxcKJFYvwaE9yf7fizxXS7JoopNvIiqWYViNDQp/cz5PJ9rLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715024616; c=relaxed/simple;
	bh=DKq1/S1mvND3bjPrxatyn7VET9OItUwcH7q3NBufJKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdSTn8DXbX5hdjuFNovsX/h4Z8sH2nohJV92tygJ96i/QSRMpKnDLYfbaSda7j+Qn87+ek1C88hqOocDjsR9P0nuU/iTNRqr8kimiCOTNh7VgpPpB7tBmLTsyQGQvXkG3lonID9xd2I9vz17Vuuct+4ruX8Vzyy2iWKW9k78gCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s8/zrvH2; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s8/zrvH2"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2b239b5fedaso1846865a91.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 May 2024 12:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715024615; x=1715629415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HfyTe+aA68nIYMVD5N9eoPdgr6eemqU/CSX3fB6JqgI=;
        b=s8/zrvH2PP02FyIYUm630fpQIr9AuuQb5IXm7WAjLE48zxIUHC8KQKZDK/z+rN8op3
         DQno0AK92LsNAU8WkmlbkI1KH2/p6mPP1bCod2kBvvXKgIgpj00vfdJufhZcytPaiSoe
         PWRsmrVdRDCacYvREfGSiKaQBTXDdG6/bctIdvVMxksvSZLwRG1z+kfcRlJmbhpRzLpH
         lSk6M3ILILmcYacZSojev5M7qUqmatQ9+PKpFP7PAA9mUAxDWunBFiGN9k0p1SaBxKsc
         MgjQ+/AZBIdapT+Olj+l/E9sIPKY/e4nJAtxq1fxs4WZpt9Kh+0Sf3fx5mw/9mhMZ2ut
         tnpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715024615; x=1715629415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfyTe+aA68nIYMVD5N9eoPdgr6eemqU/CSX3fB6JqgI=;
        b=aMhRm9hS/iAmTk//wtnAICCVhC3sQdPAcQca8OgGABXNlvmicgKNTOB+xhqEtx0rLp
         GIvm0UXThkGktDb1kWSLvVDtFcRbFLCoyIsEPb1/jpX989Cdf5Z8OXwGMFDuZbGfXGr4
         cpPxHcsGUH+0EFpWYB9HWuLb7EysXLw8Y/z9ptbpZ3FM18+i5SX/0FNl9IZbjqNZEcPE
         mN1CiA86N+ffKFXiGu6oRjLNTMoA5uIM85jn+xn2lfRCkm3jTsAkS1hlSkIgO6GxPacd
         9ahyB5u/EXkgxVEPwrLJPU3+QnrGU00l2wA4L5Dg+97FgY/FmtQlWu4o/SJV/NIxpv+k
         od+g==
X-Forwarded-Encrypted: i=1; AJvYcCWpv7gA09v5y67ssTiDpE+WjFpBDzVjtKzbagbol/pIe7bDLlvQFI5yvbz9GlkDHduSVZGr+dgMI3UFsEZsXDtfBoFnjDDl6dHGy9ygXu6xvA==
X-Gm-Message-State: AOJu0YxwY+UBHO9XLTZhA0RUXLsUKHeaCYyK9uI4SXiDnQvp0WqqPEF7
	fFSFhebHh2NCt5Mx92i/vDLtUwiVm1Ds/nlvZ1FbjOt6QR1ebvWHImokbHEaAtI=
X-Google-Smtp-Source: AGHT+IGkB7X6GUEdfi+4pYo7W9/+lkuI+IkhEHYzDeewt/ILJR/tYZgRUhk8GJOD/BNtvf2Lt54RFg==
X-Received: by 2002:a17:90a:68ce:b0:2a5:badb:30ea with SMTP id q14-20020a17090a68ce00b002a5badb30eamr9053231pjj.36.1715024614703;
        Mon, 06 May 2024 12:43:34 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d0a8:32b:6e71:43af])
        by smtp.gmail.com with ESMTPSA id st12-20020a17090b1fcc00b002a5d62a7e75sm10393094pjb.52.2024.05.06.12.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 12:43:34 -0700 (PDT)
Date: Mon, 6 May 2024 13:43:29 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org,
	hnagalla@ti.com, devarsht@ti.com, nm@ti.com, s-anna@ti.com,
	u-kumar1@ti.com
Subject: Re: [PATCH] remoteproc: k3-r5: Jump to error handling labels in
 start/stop errors
Message-ID: <Zjky4V7dAcaDKjL3@p14s>
References: <20240506141849.1735679-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506141849.1735679-1-b-padhi@ti.com>

On Mon, May 06, 2024 at 07:48:49PM +0530, Beleswar Padhi wrote:
> In case of errors during core start operation from sysfs, the driver
> directly returns with the -EPERM error code. Fix this to ensure that
> mailbox channels are freed on error before returning by jumping to the
> 'put_mbox' error handling label. Similarly, jump to the 'out' error
> handling label to return with required -EPERM error code during the
> core stop operation from sysfs.
> 
> Fixes: 3c8a9066d584 ("remoteproc: k3-r5: Do not allow core1 to power up before core0 via sysfs")
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> As stated in the bug-report[0], Smatch complains that:
> drivers/remoteproc/ti_k3_r5_remoteproc.c:583 k3_r5_rproc_start() warn: missing unwind goto?
> drivers/remoteproc/ti_k3_r5_remoteproc.c:651 k3_r5_rproc_stop() warn: missing unwind goto?
> 
> This patch addresses the warnings by jumping to appropriate error
> labels in case an error occurs during start/stop operation from sysfs.
> 
> [0]-https://lore.kernel.org/all/acc4f7a0-3bb5-4842-95a5-fb3c3fc8554b@moroto.mountain/
> 
>  drivers/remoteproc/ti_k3_r5_remoteproc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 1799b4f6d11e..50e486bcfa10 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -580,7 +580,8 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>  		if (core != core0 && core0->rproc->state == RPROC_OFFLINE) {
>  			dev_err(dev, "%s: can not start core 1 before core 0\n",
>  				__func__);
> -			return -EPERM;
> +			ret = -EPERM;
> +			goto put_mbox;
>  		}
>  
>  		ret = k3_r5_core_run(core);
> @@ -648,7 +649,8 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>  		if (core != core1 && core1->rproc->state != RPROC_OFFLINE) {
>  			dev_err(dev, "%s: can not stop core 0 before core 1\n",
>  				__func__);
> -			return -EPERM;
> +			ret = -EPERM;
> +			goto out;
>  		}

Applied

Thanks,
Mathieu

>  
>  		ret = k3_r5_core_halt(core);
> -- 
> 2.34.1
> 
