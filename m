Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E882A3D3001
	for <linux-remoteproc@vger.kernel.org>; Fri, 10 Apr 2026 14:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775831296; cv=none; b=hm0VXhhWEgLBUjaJasUIJMCiGST53Yl/qwQQxzbgIPxgoiTaq4mXVKvHrN1nIYTSSycUF+HEpNWP6YFzIFt1/kDrlYOIH/qjvvUOQIMC8Y0po/nLKrYvStksO1Gr8y08SVkog5a1BVNhpfNVHq6Q7ZxnyVt6AsiwHITJ/DF2UJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775831296; c=relaxed/simple;
	bh=SlHkwVDj6sqnc4C0GPhidA6If3ojZ4N4s0pvp5GpblU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0T/+2jF/j+42taRmUFjSMzB8kqUvx+kTQtKvJi7W9zl1lBShsE4CS3HKYOsXmp9cN78brlLaU6JGdPfI5h/VAz2+XdiwHxAjTeSgZdFa8c2Bt3UHeLXxRgJny5DS0GP6D9y5WNX2eatSrpJaQMFsrpV/t+J7NzpFXNwiN53cPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aSvWFVwm; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aSvWFVwm"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488c21c636dso12450065e9.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 10 Apr 2026 07:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775831293; x=1776436093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ADKIwr4ulE9AlL8WuP29OLGHGCvedZpXQ2D+7VFVVM=;
        b=aSvWFVwmNadM5+UM92ybSDn7nwmUUnnp+Iw3sxXRqDPBuYynR9WRy4YTDlnS5b7sQm
         AfDiWRBDLOAe1XXjFjLgWdUOxSiuN+PTqJywHdh8Im5jP4P6gprZdEx2ceJERUynuI4C
         JS4dRa44PUI5GOv5KFSDqBV7Swyu9OnZ7mHI8WIP3S6AMY5S04KBuVUJaFn8B7W44O+L
         d1+bS/PDCcdZeNcgl9GLFN9Ac1GW96gvKB4rdrvdifEHWKupKtRzG0wGMBg6RGS7+TFz
         5Z7T1nHxLF0q0h3HgDab8fFGNwJJKr4ds0NxJWfgJ/2XlEIFgR5dJnMMYUIg0oz+BOy/
         fsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775831293; x=1776436093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ADKIwr4ulE9AlL8WuP29OLGHGCvedZpXQ2D+7VFVVM=;
        b=oKv1WK21UvxeGGJdW2lFGHlE4SJHa5GtUOw6bUzcX4PNFR3sLnlvVM1yN/ruf/I+Nx
         YDyPOc1P+8uIVnXN6+KLvdXA0tiOCz+GhknpR+RyE0rNqbyGRF6ANLA9VQnAf4fa9kBf
         WaS8OAhdlikGixy2AYV21O3H091ZwUGBtG8mcbjRljJvjeKmUx3iyruprkHmtjQB/WwD
         9NhB7vzoeCUouFnZajTWqDg/pBHySAVIZzwRcOmtlh7NdQlOn+/JVHw11zWOz0Z9mCR5
         5x5fCA910p2T21bHwGGAf73+ryudJy+XYBXBHQkROnOvGdS8U7I78Caqcblincpfk/Ja
         783Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGunAj6512bD0tx42YQRB7vj/b6XivEx65rMiYXPLYa7KjfwU+MeaiE0ZE8bMWazjB9XeE19op2VHNgIpDYc4y@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz/QlJI2fpmeGwI11Enp7jmdVM1tD3ohaCGuLCMjmarheh733+
	AQODk1PvJTdOvFZzfGAF6ztTNzBjYLT8kQbTcm3HlhtWmiVn22EtokyJIumxXNDfW/A=
X-Gm-Gg: AeBDievS+E2yrnpyVE0fKF2ehDM9EKbz9VKfjedM6w6Y7NbWPKlqKaAsnPduJ9yeA3B
	BqYsyxvvCkuV+IdfriXQgCfzDtDQEZB2LdZtUQuTYZJdirEEpMnOb9YSUvLgJSaQfXaIKg6nNn1
	13qTWZEOoo9xgrI88lRy/TfPnrV6DNyt5V0DDIzAXovMusgMcq2wzxXiYTKpzE/x53hl0/Jg8Lu
	SEjkJMK3qhnJeRTKxCgNWolINSS9DJBrZAUPyCZzBARRimhGgS49AYqzr/dvZX/Y0FEfr+6m0K2
	+OfRuLAUYsypu+651EO3oWuYg9gulHQEuNjWHvYnZQqWCYh7KMBjpCj+e4YIFQOSmNywXJc4Hf6
	eLOBOBVeT/hibGwCmHa4UWLs9/SRVxwJ1ociWXvJq7R134JQMfSQ9kPediqTpHNtsmEfqBupB2G
	upOtOz0OmoLA6J9ESXvXzST5rQuBes
X-Received: by 2002:a05:600c:674f:b0:488:a82f:bb9b with SMTP id 5b1f17b1804b1-488d68cb47amr48303285e9.30.1775831293221;
        Fri, 10 Apr 2026 07:28:13 -0700 (PDT)
Received: from linaro.org ([77.64.147.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d9dd86sm36941185e9.4.2026.04.10.07.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 07:28:12 -0700 (PDT)
Date: Fri, 10 Apr 2026 16:28:01 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] remoteproc: core: Attach rproc asynchronously in
 rproc_add() path
Message-ID: <adkI8Si4ejf6T73T@linaro.org>
References: <20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com>
 <20260409-rproc-attach-issue-v1-1-088a1c348e7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-rproc-attach-issue-v1-1-088a1c348e7a@oss.qualcomm.com>

+Cc Bartosz, Dmitry

On Thu, Apr 09, 2026 at 01:46:21AM -0700, Jingyi Wang wrote:
> For rproc with state RPROC_DETACHED and auto_boot enabled, the attach
> callback will be called in the rproc_add()->rproc_trigger_auto_boot()->
> rproc_boot() path, the failure in this path will cause the rproc_add()
> fail and the resource release, which will cause issue like rproc recovery
> or falling back to firmware load fail. Add attach_work for rproc and call
> it asynchronously in rproc_add() path like what rproc_start() do.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 20 ++++++++++++--------
>  include/linux/remoteproc.h           |  1 +
>  2 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index b087ed21858a..f02db1113fae 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1673,18 +1673,21 @@ static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
>  	release_firmware(fw);
>  }
>  
> +static void rproc_attach_work(struct work_struct *work)
> +{
> +	struct rproc *rproc = container_of(work, struct rproc, attach_work);
> +
> +	rproc_boot(rproc);
> +}
> +
>  static int rproc_trigger_auto_boot(struct rproc *rproc)
>  {
>  	int ret;
>  
> -	/*
> -	 * Since the remote processor is in a detached state, it has already
> -	 * been booted by another entity.  As such there is no point in waiting
> -	 * for a firmware image to be loaded, we can simply initiate the process
> -	 * of attaching to it immediately.
> -	 */
> -	if (rproc->state == RPROC_DETACHED)
> -		return rproc_boot(rproc);
> +	if (rproc->state == RPROC_DETACHED) {
> +		schedule_work(&rproc->attach_work);
> +		return 0;
> +	}

I think the change itself is reasonable to make "auto-attach" behavior
consistent with "auto-boot". The commit message is a bit misleading
though:

 - You're really doing two separate functional changes here:

   (1) Ignore the return value of rproc_boot() during auto-boot attach,
       to keep the remoteproc registered and available in sysfs even if
       attaching fails.
   (2) Run the rproc_boot() in the background using schedule_work().
       [To improve boot performance? To work around some locking issues?]

 - The actual issue you are seeing sounds like a use-after-free in the
   remoteproc core error cleanup path. I think this one is still
   present, we should really have a call to
   cancel_work_sync(&rproc->crash_handler) as Dmitry wrote in the
   previous discussion [1].

Thanks,
Stephan

[1]: https://lore.kernel.org/all/ce24a2sgg4b6wymoxwgl2ve6np2nxn2wuxfqxfpmvqqrpvgouf@xihd6ziqwu4m/
