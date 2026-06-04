Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CF9311C32
	for <linux-remoteproc@vger.kernel.org>; Thu,  4 Jun 2026 18:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780596326; cv=none; b=P0F6z7FABdbMxo7N9bsCwGMHB2ahzW5WUNJDW5XwXKs9OGZU9izZHpaW9apDcdwqxNQz+2c3rgzi0nuurlgFUdqjWpAA1HrAgeklbJwJqcdyMbQAL2M0e16uXRqoWXbUjtL0aW/4Ai90B47JkRsvFyJ+is/GS9ObWO7P26cRVuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780596326; c=relaxed/simple;
	bh=eiC2Sv92zgt1vHvdbV+SbNCuzy9QLGT/IwMB3G/ng7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObbZHRObs1Cfp2Kak2PEAtbHUt/ftQzAyyiCfSy2065hYlF5lYQfOJTTIFwGjUMDYfRSe1EcKl17CIWv12SsrUdGYDqbb14qOiHN+lzN2eXN7CF4TqkyULvljbRspeMn4UwRIjnSIVGbW+mGUqgfI0rIDReGw6b4i678tgjo2uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qQEpFsit; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qQEpFsit"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0c2c7e0c5so7566575ad.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 Jun 2026 11:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780596325; x=1781201125; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iVP3hFBo+HJYV4EfPNLFkfa8vrbFxQZdqZVYHfJ6hyM=;
        b=qQEpFsitkWhqzf4ZfRNL4LnOTb4kJRT00UZbZH5dZ2/+p0N5LbhNv2J3aSqddO/D5l
         DmwxHfcd7qz0Aj3wef9B2JLU2ASzTNRtkj6C/C62aRCJPAYIaZiHYsX40OsruKTIKXgb
         iycKgnLLtwFF8A4+zyR4IAef9jAPfSKHruXGqskDYkwF04MpwV9R2CufeaVgyHIwv7wR
         ror5DBgh7P5L1jDJBq/GbEz/q+FZRSbSJ5jCWAAUCgFQ7yx2NwV1UDMZl9RYbAr0YjM8
         d4VHbbT7tzGhTB2lkBxEVl1MezztznpQpG9I40YXVCupJeSp4T49DuFK1HfobYwa5XDe
         EEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780596325; x=1781201125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iVP3hFBo+HJYV4EfPNLFkfa8vrbFxQZdqZVYHfJ6hyM=;
        b=E/AvxfVVyLoVaH82fToXpJbzzvTfc85Fueg61CaMxNkxZsETxDSOF8jFirNjFtKaxa
         OSE/YSCQaYVrS04uJCGmQHbXNRHK79Q26q3qS71df2L8ld+m+JDrg+fHb7epvymJPpwP
         2yqRT/oYTOwsUAX+YrC3Znrc/BEJrRTKJVMYANui9suk52IbKAX+Dy+ANFE+IGKBhH/8
         tlUMingZxbHHRyLH2IUJQD79zMd6fdo8Y9Kc3soQjrUERb0RcTj/P+6g63KcDSoUgdEC
         NNnyERBIvjHVaCyJ8ZUmPca4WgBcu2KX4S+cC/gkGnuVTLiqSL1zfd5/2wMuJ0b38oZY
         kwcA==
X-Forwarded-Encrypted: i=1; AFNElJ9o4ohTtvNSb+i5AJN7oWv7DKW2tSLf9VLagNvlMIF5tRYv5C5Pv5fBeeTf5icjVAvj1JOu+YZ5Lp4aiiJPgqu7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0q1RCsfgkn/29qyr25r92E2SUp7xoXytrLcuAiM7nzgxO0WdI
	+A46XhEfodM/5HxyhL/5zHIzK6GQ9M+A88RjwVggnqzIlVEMB4WKtBxDSzBxsdkoEJI=
X-Gm-Gg: Acq92OEciGOj2pJp03wBhv8rJyJCJGyRQQF6ljkmEBR62cJm4hDP5Dpf/whNMQjq8um
	g7UvfcZxtbAD1yGFXWap/QKKr9D0WIRKPAks0veKE6wIVZ1qyjVPnuadLTH3aUIBzrmLbtyMWG9
	597ZjlfwOyT3OkQgQrtytBybLAh9LAKOTxZSxMu8jsamINAux3XecXrwTLHyUbiSpn3Hc9VmM6X
	/zq6DOdijORR8/dxRQ8pfRbBMQwZDnTWkxDcoWCy5MxOYrLlKFix/q6MQ0i7bb30E8zlnDEJwqd
	/tzaIFsCeJUFGOdqTmdfYkF/gliR4oJNeVqCMMtenSZBCiZCM+8Sj9xm6hP15QMLMMDs6TW8tRP
	Xr5MlHl45zjtC1oUz0oo9VL/+EzMEE7RwRD/QvZ5KbugxAzWkk6HY78Dx1ZjwValPMvrcsPHZNJ
	Ou9UrXEG8fIlLeivfC+7KmhnRMC/YGhOpEeCwgKQ==
X-Received: by 2002:a17:903:3b85:b0:2c1:8fea:4dbf with SMTP id d9443c01a7336-2c18fea4df8mr64105455ad.8.1780596324785;
        Thu, 04 Jun 2026 11:05:24 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:7a42:c699:9c48:5a81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649fcdfsm85352065ad.78.2026.06.04.11.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 11:05:24 -0700 (PDT)
Date: Thu, 4 Jun 2026 12:05:21 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rpmsg: char: fix use-after-free on probe error path
Message-ID: <aiG-YQi2W6iEY3oq@p14s>
References: <20260601183247.1962010-1-dbgh9129@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601183247.1962010-1-dbgh9129@gmail.com>

On Mon, Jun 01, 2026 at 02:32:47PM -0400, Yuho Choi wrote:
> rpmsg_chrdev_probe() stores the newly allocated eptdev in the default
> endpoint's priv pointer before calling rpmsg_chrdev_eptdev_add(). If
> rpmsg_chrdev_eptdev_add() then fails, its error path frees eptdev while
> the default endpoint may still dispatch callbacks with the stale priv
> pointer.
> 
> Avoid publishing eptdev through the default endpoint until
> rpmsg_chrdev_eptdev_add() succeeds. Messages received before the priv
> pointer is published should be ignored by rpmsg_ept_cb(). Flow-control
> updates can hit rpmsg_ept_flow_cb() in the same window, so make both
> callbacks return success when priv is NULL.
> 
> Fixes: bc69d1066569 ("rpmsg: char: Introduce the "rpmsg-raw" channel")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---
> Changes in v2:
> - Use a 12-character Fixes SHA.
> - Drop the unnecessary asm-generic/rwonce.h include.
> - Handle NULL priv in rpmsg_ept_flow_cb() as well.
>  drivers/rpmsg/rpmsg_char.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index ca9cf8858a5e..bff5aefee212 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -104,6 +104,9 @@ static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
>  	struct rpmsg_eptdev *eptdev = priv;
>  	struct sk_buff *skb;
>  
> +	if (!eptdev)
> +		return 0;
> +
>  	skb = alloc_skb(len, GFP_ATOMIC);
>  	if (!skb)
>  		return -ENOMEM;
> @@ -124,6 +127,9 @@ static int rpmsg_ept_flow_cb(struct rpmsg_device *rpdev, void *priv, bool enable
>  {
>  	struct rpmsg_eptdev *eptdev = priv;
>  
> +	if (!eptdev)
> +		return 0;
> +
>  	eptdev->remote_flow_restricted = enable;
>  	eptdev->remote_flow_updated = true;
>  
> @@ -490,6 +496,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>  	struct rpmsg_channel_info chinfo;
>  	struct rpmsg_eptdev *eptdev;
>  	struct device *dev = &rpdev->dev;
> +	int ret;
>  
>  	memcpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
>  	chinfo.src = rpdev->src;
> @@ -502,13 +509,17 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>  	/* Set the default_ept to the rpmsg device endpoint */
>  	eptdev->default_ept = rpdev->ept;
>  
> +	ret = rpmsg_chrdev_eptdev_add(eptdev, chinfo);
> +
> +	if (ret)
> +		return ret;
>  	/*
>  	 * The rpmsg_ept_cb uses *priv parameter to get its rpmsg_eptdev context.
> -	 * Storedit in default_ept *priv field.
> +	 * Stored it in default_ept *priv field.
>  	 */
>  	eptdev->default_ept->priv = eptdev;
>  
> -	return rpmsg_chrdev_eptdev_add(eptdev, chinfo);
> +	return 0;
>  }
>  
>  static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
> -- 
> 2.43.0
> 
