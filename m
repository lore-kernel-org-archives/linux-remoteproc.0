Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE9C3DFC9D
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Mar 2026 16:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772553750; cv=none; b=dWExILFVfOjGgYhsxrIp0NxVGqO+5GkClUOwzt9JaeNvM2Oj/VQp0zSPtPJ1WBSzRz2ZF9jQ7tAHN3Rq23FGRd1ppbNTGMUtm885072HunacrTiKeXj7QEaUJAijSvOb6P7FpdIdpbu96W9e/HJwScAXshKfffQ7kvQRQL3JRNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772553750; c=relaxed/simple;
	bh=2ThdlDR2fomdpDt+xUQtYYIxOWeCkt16rAHOH2nd77E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVv37GdCVjA+c0eU7xTDSFIZohxYC1Ml1mJsUT92de6A3eCV4BFZIcRirdJnotce8GprvRSwe6GL5TTsQvvpdX/QydZ9wvW5ere2RC4nA2l4hl5LwD4LIGGmQEMh5LXAGZxRUin0DGj4+Xfpk578OZz0OPsfNR7/OKWVpS4OCJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HHSufo0Y; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HHSufo0Y"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so1904332a12.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Mar 2026 08:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772553748; x=1773158548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HDGtbAfmALXYRSFyyHa1QCHifKrbqmjs2VXoKTNT2WM=;
        b=HHSufo0Y5dfXJ/X1X61ojot3VfIvGkco50aEwp5SCvxrpOFC/ISNMdn7DWjkALuO8i
         xYOVTPU4iefhoJQMszaC4uEHkbUTm3eFQtmIkRD0OhGckfq5MzW0stlEdf94s+/HSrDk
         8oMRssrUwsXi7M4URlDdmO2JpcVCmWFQvH0waxlanz026OU72DRbRXLpEpD4tc+z0g5a
         GJzwGxn80CzhipJQlC/PhTHCiKfl0Q8n4VxPL5N9E4QkkmghGHZBwwr6BkLkulia+yLu
         3VRzUDnw4hPf3rSLBxikn7mMSPeBpCF3323FqfA2Sx9hvM+05PI+ZRqdDq5Kv5eJDnvU
         vZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772553748; x=1773158548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDGtbAfmALXYRSFyyHa1QCHifKrbqmjs2VXoKTNT2WM=;
        b=G/DWLPhSCKQAQm6wzOtb4S51osRn/FOTw/BbNoiMDwIAxMH9Kll+SQ+Hk6d9HPGsyJ
         0tgHjuU262dEiMVN4kC6rNZXNor3B2i3xpY3g3yaH2BQpbdoyhFwXhO/SzXrJ9D3Nw8z
         VScbrEBRcC4LssEoBBiM96YSIMblCqY/2+kcPNop/WXak9cxxTF41XOsWEUZECPZAIs6
         RiUhv4pWuSbrM/k6d5sk8BjG7abpv3bcWMr1jZKtLxPVlOoitXzCv16amzZ3Ki0dqSR5
         UZ5TTIlZhmmUMZngQ3bSP6ceNM02Doq7rm7tAEBkZBRrrFZzrR/w/YmCRqoBRkB8Vjuk
         Pdqg==
X-Forwarded-Encrypted: i=1; AJvYcCVvAArevIQIINMnsO4wib/NHqXDjSJQKQoyD2WmJQczGmz4tAlyvupXKie8/XsjD8b3g2vBiqeQ6CHAt4k8wKoa@vger.kernel.org
X-Gm-Message-State: AOJu0YzR+XYjlMPIVaILrLNRyiMwDZwWA3jc+1s8YXkEotT35VppV3cN
	RIITg8+H04fzY9a4nRDa2Q0HTvVdcBw+6Pxf1TZ6aO7Vjx9jD/vFMQcyYI1YPl8qhCM=
X-Gm-Gg: ATEYQzydF5z3ds7Pc4Q4Wo0QNjtR8DwBihhvLZyNvAxPPAEQn1LoivKXr7Bt4ANubnK
	m9vryeEsKgqJLESzrVofN9Jzzglwme6pq0d/UH8VcL2DM/t02SZcvnT1WH1egfdiBAYQaXHiRhA
	hippRc1vgs+sepx/Q4Tyzx5aG9dUhRcEvpA3BD+kwLfrR2/EOdPCxM1rPjRgY8AfTZjSLVXG57N
	rVh85le3Y/dd1x+t6D8+pflMqGBvFyyg29+Fdi28HjadjfVwIC1y2QubYd3+dAY7ERLkS7UV8Es
	SO51NgCgtx5TSAY9Taa/wCpeonpAQyPOSYw5hKIbXCV7PleUvDA9evI2hMhnLnDJFRtX8NC1inf
	lixP6mt5Tsw6HgMiqMLNb6m5y8HcGbEd+n+fYoY9n4Zl5KjFTGI1wO5rRvhGAnUmaNWCCEEwfHW
	3i7+Jrh/QQ4Y8jA7xTg3vUeYRNoQw=
X-Received: by 2002:a17:903:1aa7:b0:2a9:622e:fd3e with SMTP id d9443c01a7336-2ae2e251a00mr156399355ad.4.1772553747566;
        Tue, 03 Mar 2026 08:02:27 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:f82f:a1ac:3cff:8c7b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae54e394aasm79225135ad.77.2026.03.03.08.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 08:02:26 -0800 (PST)
Date: Tue, 3 Mar 2026 09:02:24 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: andersson@kernel.org, robh@kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: k3: Fix NULL vs IS_ERR() bug in
 k3_reserved_mem_init()
Message-ID: <aacGEIWvvdy6k4kx@p14s>
References: <20260227092110.4044313-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227092110.4044313-1-nichen@iscas.ac.cn>

On Fri, Feb 27, 2026 at 05:21:10PM +0800, Chen Ni wrote:
> The devm_ioremap_resource_wc() function never returns NULL, it returns
> error pointers.  Update the error checking to match.
> 
> Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/remoteproc/ti_k3_common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

I have applied both patches.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> index 32aa954dc5be..3cb8ae5d72f6 100644
> --- a/drivers/remoteproc/ti_k3_common.c
> +++ b/drivers/remoteproc/ti_k3_common.c
> @@ -513,7 +513,7 @@ int k3_reserved_mem_init(struct k3_rproc *kproc)
>  		kproc->rmem[i].dev_addr = (u32)res.start;
>  		kproc->rmem[i].size = resource_size(&res);
>  		kproc->rmem[i].cpu_addr = devm_ioremap_resource_wc(dev, &res);
> -		if (!kproc->rmem[i].cpu_addr) {
> +		if (IS_ERR(kproc->rmem[i].cpu_addr)) {
>  			dev_err(dev, "failed to map reserved memory#%d at %pR\n",
>  				i + 1, &res);
>  			return -ENOMEM;
> -- 
> 2.25.1
> 
