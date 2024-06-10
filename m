Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD9B1474A9
	for <linux-remoteproc@vger.kernel.org>; Mon, 10 Jun 2024 16:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718038043; cv=none; b=kmC9rTEY92OrMfylEvihqPdlpyBcYVcKqckkbYsaEmGKjsobQRi63MY7VOD7Rr+ogUjyuNjI0NqAxJxMwRQByicFDR1119dbi7Ja4Alw7Vok9Vf/OIOhQQsI5G4btXKHMSPT/9hVbmpS4WhMb8XBJOWP+KY4DQK6daENPA0ZCSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718038043; c=relaxed/simple;
	bh=4Hj9IG1LMlzHH3A3y0qYTvhcNtKcDqLmxJ6EzjUt+qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PABKVWyoPRzn63oZeP5jz+rL2bmQdRDBK8ise98Fb3eAFVR+unIBRI3xNuOtVTrQ1oFOnrgCtA7dwW5LCRmliycdOFp6bZmt7YsEJJy81p9donBBT/XsUQwcOxGW6n6MgDF7tlcfijGPBizoX8D7lsOSBewGIJaEne9JBIck1ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CEmR3EIJ; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CEmR3EIJ"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-704261a1f67so156029b3a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Jun 2024 09:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718038041; x=1718642841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GltpCEOROqdEZtPzqZDYIjfn931I+xP8uUPheSuWph8=;
        b=CEmR3EIJ4PoH1DfyHnjBX5hNlJ9uYuGFk88XT3SmMao9uI6Yhe9HXqP6qybWOG58NH
         fnhSlY5S46dpm4rzVDVm+NMbaXkIcTPyznOTFHXaTX/ofyA6DreOeUZInOV3JlCdgWyg
         2WGbd+J+2ugZEXDzReyiifJU272zUmi2XbvSaQR5tIO9ihLHh/2Qfybd5K0U8QqUk0P7
         PI5fL5kHL9laNZZkQq+hMaea4cWSyZGw1lBGGt5tL3pn7YOzZVCYBvk9YpYhEjH43uSW
         ++THTrMQ0oFbUjDDKsaGL1knxZCPu6MWHYQDHqec5YBNdnqyxAhH+IawtAoFdcCfP+Aw
         sEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718038041; x=1718642841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GltpCEOROqdEZtPzqZDYIjfn931I+xP8uUPheSuWph8=;
        b=uiWDDaS+/cNhR33gQvYyL9PavHSa8PG66DGlpzZFF9rpSmhIeSxvdiPlEvRF1Tf+OJ
         0yA5ktVFR+dHXBlVouve31b3i9F7F6pqR6tsgKw9KxbnSOgKL7sJfVCMSnK0Eeg8XCcD
         EtuihWlVmnwl8sHQGETDaW9y1SYqWYT9IsRMYI6R1/9VjFOxE4MlToa0F+8VN/L8CcGX
         mhf+BKSy2WBrB6rUlX4JEYEkkEOCxkEnC5WcPwlT1I6KceOp2KZLzgBF8qjLq238ezSt
         ma90+Tcq8Vgfp91FrGIewNLBc6Y4y5lWwmcNFlD4dpqvBzzmIhdutP5NFnNsaufSyEux
         TYDA==
X-Forwarded-Encrypted: i=1; AJvYcCXTdbkWCk5ON9d7/nLO5Q5GPbhj3y3EiPtRTgUhooU8RaLMzHlE2js5bUWJjkui2maWNlL2fbxF5IOU6+FsIiJBBbmePSrvr4TlBpf5SKsNdg==
X-Gm-Message-State: AOJu0Yw+MrLgh5ql07ynNHeX+9VZhACZEtaqOS1PaWyqpOzGwskbNA9E
	OLndyZqBdZzg/HapTBJsV+MV7ARifP/zO4nkmW4bSjqxOZJ5b7dHeW+oWtTrXTw=
X-Google-Smtp-Source: AGHT+IGb/lXCCC+JbIDGUdr375qb0RgEL7LsqGDkkx+quxB1SnI5zlcCI8SeIz3Y9Zc+WyklRsuyOQ==
X-Received: by 2002:a05:6a00:8506:b0:704:25de:f297 with SMTP id d2e1a72fcca58-70425def3f2mr4676511b3a.29.1718038041356;
        Mon, 10 Jun 2024 09:47:21 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9b34:fecc:a6c:e2bc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70426cc74f3sm4045691b3a.35.2024.06.10.09.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 09:47:20 -0700 (PDT)
Date: Mon, 10 Jun 2024 10:47:17 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Aleksandr Mishin <amishin@t-argos.ru>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] remoteproc: imx_rproc: Adjust phandle parsing issue
 while remapping optional addresses in imx_rproc_addr_init()
Message-ID: <ZmcuFRfjKRQG9OXI@p14s>
References: <20240606075204.12354-1-amishin@t-argos.ru>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606075204.12354-1-amishin@t-argos.ru>

On Thu, Jun 06, 2024 at 10:52:04AM +0300, Aleksandr Mishin wrote:
> In imx_rproc_addr_init() "nph = of_count_phandle_with_args()" just counts
> number of phandles. But phandles may be empty. So of_parse_phandle() in
> the parsing loop (0 < a < nph) may return NULL which is later dereferenced.
> Adjust this issue by adding NULL-return check.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: a0ff4aa6f010 ("remoteproc: imx_rproc: add a NXP/Freescale imx_rproc driver")
> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> ---
>  drivers/remoteproc/imx_rproc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 5a3fb902acc9..39eacd90af14 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -726,6 +726,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  		struct resource res;
>  
>  		node = of_parse_phandle(np, "memory-region", a);
> +		if (!node)

You're missing an "of_node_put()" before continuing.

> +			continue;
>  		/* Not map vdevbuffer, vdevring region */
>  		if (!strncmp(node->name, "vdev", strlen("vdev"))) {
>  			of_node_put(node);
> -- 
> 2.30.2
> 
> 
