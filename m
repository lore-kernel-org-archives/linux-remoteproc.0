Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4351E158D98
	for <linux-remoteproc@vger.kernel.org>; Sun, 11 Aug 2024 21:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723413558; cv=none; b=hq7XwC434UHYHGh5wUPRvvEz0SNRcf+NjJgmR3vMd6KPDHG6gCQ4/CrKy2K9bgasTnMlhq4f67PnpmDoLl7Y1+7puSlw/H7TWqOr8A8AScgs5gMXp6VbcTO00ZaJBX2NCoNX5hMZmX3qnNfqZuQlfxIhA+XPlzFHFscstLNL848=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723413558; c=relaxed/simple;
	bh=jgINCKXy1M7ipw0bUlnzEjZAtO8nuKxB6NMM8yG+mfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaYh91omzyYts8VlwBTnU4x9wmixYc9cFsHqlM92RvXs9owJzmLZrWsYWn6VDXR4MCBe53fB2l6t8ewWEFKt3mAD229FV1D/G8udySVTvZusaP4DlL2Kf2g7Kjg05eIkjsU5wjcAIYpBeGZrZCSML+vfJlUk+DFMxOuPKXUTw6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E2Y7UYVG; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E2Y7UYVG"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-66526e430e0so35021547b3.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 11 Aug 2024 14:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723413556; x=1724018356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FVeTnkNK4o+915OQ50meYfGSgzhYk12S1v4XIFKF0zo=;
        b=E2Y7UYVGyl+BMzwsue+ezNDZWVSAjbmt0jsXtenFqnwghjTaTkj6VgQ53KzxHJfGtm
         d3GzLuyYUT24HPCgo7HH0R+2DfC0LZstkDvoQXMNrWpMyz6YremUooOIXl2em37vPb3B
         VfwyEocNRW3MsTmMCRoYa/Bj2ALVPYmABQKKWZqIU/idIGAE7cLhHdND7Dol37O19LHv
         EYW1lEQgBwefIDOU6P282HcqMb55j94ii6lDM0xfeROKU5LQcw6eljldf3j7L7cMvhkU
         7be+V3613O/4yQqs7MT9b6sGqZBYFdPHnIpDEmXPTROK+d5p74JN9+Y8w85CeWzwXxRE
         TimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723413556; x=1724018356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVeTnkNK4o+915OQ50meYfGSgzhYk12S1v4XIFKF0zo=;
        b=Cr+1KmCvO3m9cMzwnK05hDkF0bOHcYSDayTUPHeAj2VU3YpmBCm4hr03JsLT1TYmSV
         i65JV4S92v8+3xbhq3x8deWHsqI2cBri745FOZrOHk+II4IgJji0jD0P3bvJ5wRTSWqF
         dBKYZ6qeTcvHSEKGfPpPAoEf6YiDfxw+ROaJ9eR/gbUQL7NRMFf7l2FZ1uxXflBZCqTW
         6PNFI6QCRxss0YXfqp5rJ2v53nIoPRtftYKQXZEDoAJEyFoniY8kGnD4nY/mklsRxjRo
         RtS398Bd0Rt/w/cfLXfYljoAoWg3ftMAIlc03YxqaDO0vKcXnyF4AgpcSzog6JAIRTb4
         4Vhw==
X-Forwarded-Encrypted: i=1; AJvYcCUICOHAVkZqsYQKvkcqC5BouksbRccVwoKSKhGzksJHXQuMOSCGkTTUp50m6lkpv1F7rQZxTrlpdrROw/es4VKTgbbmNZywgJDm1JmMrULKOw==
X-Gm-Message-State: AOJu0YwF2kh3KfJpDwbAX2U8TsdkEqTzLz/U2h1jBNC6J5TBywRfMRYf
	nt7Z8G3wU/sRo9L1pYFfgc25SLNCTJF5Sh6xHm4gJNr0W5GbVcF1ctjgStL4ZpQ=
X-Google-Smtp-Source: AGHT+IG6Uf2s+cJIAuVJOZUuYMZ6RQpmyWtobeduvMQxy7djfZiGVOotbgm8Hyedt1nGUZVSRl7Fxw==
X-Received: by 2002:a05:690c:300a:b0:64b:5fcb:6847 with SMTP id 00721157ae682-69ec5d5367dmr78530547b3.16.1723413556319;
        Sun, 11 Aug 2024 14:59:16 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c044:c4f8:9353:51ef])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bb8fd835sm26334915ad.89.2024.08.11.14.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 14:59:15 -0700 (PDT)
Date: Sun, 11 Aug 2024 15:59:13 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Andrew Davis <afd@ti.com>
Cc: Hari Nagalla <hnagalla@ti.com>, Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rpmsg: char: Export alias for RPMSG ID rpmsg-raw from
 table
Message-ID: <Zrk0MeDFI1vvsK9A@p14s>
References: <20240729164527.340590-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729164527.340590-1-afd@ti.com>

Hi Andrew,

On Mon, Jul 29, 2024 at 11:45:27AM -0500, Andrew Davis wrote:
> Module aliases are used by userspace to identify the correct module to
> load for a detected hardware. The currently supported RPMSG device IDs for
> this module include "rpmsg-raw", but the module alias is "rpmsg_chrdev".
> 
> Use the helper macro MODULE_DEVICE_TABLE(rpmsg) to export the correct
> supported IDs. And while here, to keep backwards compatibility we also add
> the other ID "rpmsg_chrdev" so that it is also still exported as an alias.
> 
> This has the side benefit of adding support for some legacy firmware
> which still uses the original "rpmsg_chrdev" ID. This was the ID used for
> this driver before it was upstreamed (as reflected by the module alias).
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index eec7642d26863..96fcdd2d7093c 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -522,8 +522,10 @@ static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
>  
>  static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
>  	{ .name	= "rpmsg-raw" },
> +	{ .name	= "rpmsg_chrdev" },
>  	{ },
>  };
> +MODULE_DEVICE_TABLE(rpmsg, rpmsg_chrdev_id_table);

So you want to be able to do both "modprobe rpmsg-raw" and "modprobe
rpmsg_chrdev" ?

I'm not sure to get the aim of your patch and will need a little more details.

Thanks,
Mathieu

>  
>  static struct rpmsg_driver rpmsg_chrdev_driver = {
>  	.probe = rpmsg_chrdev_probe,
> @@ -565,6 +567,5 @@ static void rpmsg_chrdev_exit(void)
>  }
>  module_exit(rpmsg_chrdev_exit);
>  
> -MODULE_ALIAS("rpmsg:rpmsg_chrdev");
>  MODULE_DESCRIPTION("RPMSG device interface");
>  MODULE_LICENSE("GPL v2");
> -- 
> 2.39.2
> 
