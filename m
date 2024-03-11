Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC7A42073
	for <linux-remoteproc@vger.kernel.org>; Mon, 11 Mar 2024 15:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710171678; cv=none; b=V5k44DCDOYPAk1Dqdt/Rzh5D/+NBDWicbOX9LMBFUt6XYfkJIlelHQ802HFx4GdxCy+iY+HR8TB589De4Ov++fKFdDaTECCPLy06P33db2cIlnM/efQYnsUKtzXRPgymnSAxTqLZd3Km5hjyG18UvUyngMq4toDuvUog165uOdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710171678; c=relaxed/simple;
	bh=65RmhXITVBF2DUiglAzoWFHlJWw/+bVEXciL2O91Udc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FelK/E9Fw3I3nDAJsjFsgQau0mrcIRnNH0OG0wj/97trEQoNyWiDz7QiQRplJsDTKWa4PcCIBSUHPuBSe+2Vqx36xrgh0ocPHT/feIuJkL50G98QqfqGOwWaJQHPKZowMjJoHV6KxJvE+6/DqcKvMBxIi97VJmmgrIKFdsp0Gic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DDJBOM1K; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DDJBOM1K"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e627596554so2125807b3a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Mar 2024 08:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710171675; x=1710776475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=az7pxOUTtC99E/nCsqZY/RpkHzzHxoMCaIdDuXLu05o=;
        b=DDJBOM1KwdLjEWtvXUuhxlf0POjSM63NvVp2H3E2IMiJcC8sLC8PqXjdWPfnbQkOB2
         sJXllbPIUeurRfbZddz1c05UeqXLmuXDBLkJvf+qZBYkM9I3NlSKOGleOTIODrrt5j/d
         8utBClwhYF/GYOZuvS90I8kw1gYgE1VCFhwgxJ2HYDuPyWLUGc/IGEoYnpHK0ocaHy6F
         ivTuNfWMUxNCEmaEsJ/cY/+LqYNEsmZvUvY8qVXh0qAOb31vBSbwUt0Pefc2C+OLE8MF
         FzEAKzhH68cCLQKX2bX78LgnGbZgT2mq6SoIGH1FhcrtsOIhSJYLj2tIexsQAX74JQGK
         KvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710171675; x=1710776475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=az7pxOUTtC99E/nCsqZY/RpkHzzHxoMCaIdDuXLu05o=;
        b=j+Vf7qewsuRTMHwAAsPgxTaULzcIrHhZrAAYEsrg1gSCu/RpxTxFW1JaaiTG93Mz1W
         B6knsUxkDCwXq12VZYJW6Jd7ju3XI2iIapVd61s6IAqAq9MZqUEa3r6nmL++OhRnFyNR
         XvJnEuDV7izzbcYXVlZr/J0LbMJn4et3tTDNeVyyxs894x9ltWU05AdsqKfJYQMEjs3F
         dtGsM2OPrrySKiyKquEKCYhgHLb6DfFB8bjWGCi8N0sOr0wltezsSDPgxC37HFB3EL4U
         jTTdXruclYS+qXb+0v90TzEiR2NwVFznAptL/yR5u/crJZgga1TfOJYrnzJEbUAqJMd9
         pZzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8QTx1WR9GQG+ZvR4ptLjNc5yVT0k+gaaLzTdTAzWZ9UDAHcbXDie+NQ1xX+NYo63a7z2ipZ1YjG2JE15omwe2rIUkdSbpLIXU0WIN5ywg5g==
X-Gm-Message-State: AOJu0YwZNc822CAy8FCGyaZr98jcbzGm5kBn/8qy3j2LQlSQrG7doRNm
	HfS2Le3nN1P9bIdhRfmiB2ELNBGuUhGV4ma5/UvqDtvzZfr24nxjtJTB1eofoV0=
X-Google-Smtp-Source: AGHT+IHnecQiqxR3jQm1Eh77qQGEz/xlr2QYNXEOKQpNFmpcHiV/zxE2mVkzCfq/hmpfyMGErALpIw==
X-Received: by 2002:a05:6a20:3424:b0:19e:9c82:b139 with SMTP id i36-20020a056a20342400b0019e9c82b139mr3706769pzd.45.1710171675495;
        Mon, 11 Mar 2024 08:41:15 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:54e3:49ee:91e7:653e])
        by smtp.gmail.com with ESMTPSA id u2-20020a056a00098200b006e04d2be954sm4523584pfg.187.2024.03.11.08.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 08:41:14 -0700 (PDT)
Date: Mon, 11 Mar 2024 09:41:12 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] remoteproc: make rproc_class constant
Message-ID: <Ze8mGDstC9l7X+l9@p14s>
References: <20240305-class_cleanup-remoteproc2-v1-1-1b139e9828c9@marliere.net>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305-class_cleanup-remoteproc2-v1-1-1b139e9828c9@marliere.net>

Hi Ricardo,

On Tue, Mar 05, 2024 at 04:40:23PM -0300, Ricardo B. Marliere wrote:
> Since commit 43a7206b0963 ("driver core: class: make class_register() take
> a const *"), the driver core allows for struct class to be in read-only
> memory, so move the rproc_class structure to be declared at build time
> placing it into read-only memory, instead of having to be dynamically
> allocated at boot time.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> ---
>  drivers/remoteproc/remoteproc_internal.h | 2 +-
>  drivers/remoteproc/remoteproc_sysfs.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index f62a82d71dfa..0cd09e67ac14 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -72,7 +72,7 @@ void rproc_init_debugfs(void);
>  void rproc_exit_debugfs(void);
>  
>  /* from remoteproc_sysfs.c */
> -extern struct class rproc_class;
> +extern const struct class rproc_class;
>  int rproc_init_sysfs(void);
>  void rproc_exit_sysfs(void);
>  
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index 8c7ea8922638..138e752c5e4e 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -254,7 +254,7 @@ static const struct attribute_group *rproc_devgroups[] = {
>  	NULL
>  };
>  
> -struct class rproc_class = {
> +const struct class rproc_class = {
>  	.name		= "remoteproc",
>  	.dev_groups	= rproc_devgroups,
>  };
>

I am in agreement with both patches and will add them to 6.9-rc1 when it comes
out.

Thanks,
Mathieu

> ---
> base-commit: 8b46dc5cfa5ffea279aed0fc05dc4b1c39a51517
> change-id: 20240305-class_cleanup-remoteproc2-f1212934f990
> 
> Best regards,
> -- 
> Ricardo B. Marliere <ricardo@marliere.net>
> 
