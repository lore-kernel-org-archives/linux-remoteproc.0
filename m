Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC30D1CAA87
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 May 2025 15:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747410342; cv=none; b=JTf9xJ0Z0fhUb+iWAsOQGTrH23Jvg28I63iLDMOfBlmX1t7lkXbVgQMBQkd7a9G+1mxN6SkY4saQtqD6Cuwbrpdect13wTT5P+l5ZAW+d23qEaKd6m0Ivxl0ihzhZ9ebqx9Pyzrwlw2D2/8v5uoKPAkGQI6pdMoEsvVG3OT45EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747410342; c=relaxed/simple;
	bh=jujzv1V5FoF1DLtFut6okDvwAGrioiNeTy6wRdYWa68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5VCsoKEMJ5zwBfQaqZUrZyVnbsFI6HYyg1BMdZ3cNn37PITpgnNCOPlwcfGaJrvkAJnzaZXtmo1zMaR94mAtQrwSLHDd8K1y4v4Lomc5EEwYfca6OZZrylASxIm7FOQPshWuZDQys6cT/h4fYZonY1jop0AfDELqwJItKEkqDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YhWNTKQw; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YhWNTKQw"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so3025642b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 May 2025 08:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747410339; x=1748015139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jyfabEg48G74deVXTHyeyMTZY+4ojLpW8QPxHyY6vtk=;
        b=YhWNTKQwaXWxaQictf5oy8L7a/hwUATxr1diUPzBs1S1+I34oDtWxmUKPWAzwog1Iw
         ISNUhaP5ws5l2ZCxerhA1VK7RJzLyjQOFJnEgLaOkSpkn29MxrcSNN62rKuiDvI+qnus
         LLwi6u2M9Ijk8Nol8lxELNEEn/AzuGuaH3IBGpVCUfFoWk9LXwouan9scEoDpX2nDeU6
         h6D9l3fG6hcM+/NTY41CXIJkpU/G9MPoPJX2jQCGoB2U8unB9K+PLkDmCNl7Etkdxcpf
         YWF8ZK35ZEunQp87m9dP0c1TLJm99F5rpFuHCxo1zfzdLLa9z9EcPG0PQDncEc7Qttlz
         yDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747410339; x=1748015139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyfabEg48G74deVXTHyeyMTZY+4ojLpW8QPxHyY6vtk=;
        b=rCk0zc/Ya7Ss02nSx1Bh+tBJtNnKskjK/3IbbDoUA05RGubNCTw0Jm8Ar5jS8oxYSf
         QY+J/d9vST2M4+b9xIDBMUqMCzCPj2N8HKe2ieClr9/ty2x5bjqWRp6PmnhIeTevU7Cb
         IL+sP3zu11YJe+EDEHNtF7+JMmq4tSatPLtwvmNr52NwqzX70L6sfr7FQawG4F6A4vMr
         KtYhEjDF7jtrWZ9h1DX8JRKH1XBi5UeQ9q5TiGhsGDL469jXrRXKu+RN/NAE98qsPgSj
         RIS1KKYx+KamwP2SdpKRXGHx4fKyl3nUJdzezzaIcFOQqKFQIXm9trC9TpUXUZNrM0MP
         cNSA==
X-Forwarded-Encrypted: i=1; AJvYcCXFO/CwTIe5C0mcI74G2oGZMk6V3DRuwC/qcekskSE8fSMq6Rc8jeWwmw2zyGGJCGtJvuHYLqkXyiLNn+xH2DmR@vger.kernel.org
X-Gm-Message-State: AOJu0YzH00H5DiCmfK88A9kOQtgPRbUj8I9XY0m3KNlZxaVyJIVkjein
	F5PAEGRziYFBihi+ctJm01kW203AM6RXA/dvgufiotC88kvyyyb+S+5GFZ2jxTGczzU=
X-Gm-Gg: ASbGnct5zgbkWzbAeP4srNAAcbWp7g9f5MOPxlm5ZV7VucLy3B+gPhMhrsYEiAZ3rYg
	G08Ck+GuiVfl6WvgjbScDjF4dZdPHEHgaMOQk9iwhwFNv9AW2787/T3CprLobmbEQ/KXKhhynoR
	HpOru6bjmq8Oo5eCJTLZijKAaR0GVR8NDc/w1noW5w7ObM1uTPg7Xf4felv9SMkwL53BaE9LOAY
	NYtXU4eMFbjsZQ7At0OIVQwOwibshTBo9EsGg1C1YrmZc9sOZxQAKcT/KqZW6NtLxblixAR4VhX
	L0X+8ggmeYihORklsd5EvtM8774hDAczZYWRqe/uAIszoFIv4bmbsH0=
X-Google-Smtp-Source: AGHT+IF7qGPz4GJBtmzZCIHFP6fMe3cGuzibtQz/jTyla7h3D463M0OhWgLhYsPbMJPUv6Yrvu3jnw==
X-Received: by 2002:a05:6a21:6b86:b0:201:8a06:6e3b with SMTP id adf61e73a8af0-2165f684437mr5348926637.9.1747410339080;
        Fri, 16 May 2025 08:45:39 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d663:63f9:913d:ba0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb09ffb8sm1701801a12.70.2025.05.16.08.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 08:45:38 -0700 (PDT)
Date: Fri, 16 May 2025 09:45:36 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, afd@ti.com, hnagalla@ti.com, u-kumar1@ti.com,
	jm@ti.com, jan.kiszka@siemens.com, christophe.jaillet@wanadoo.fr,
	jkangas@redhat.com, eballetbo@redhat.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 04/36] remoteproc: k3-m4: Don't assert reset in
 detach routine
Message-ID: <aCddoCUIpIV1ZxEW@p14s>
References: <20250513054510.3439842-1-b-padhi@ti.com>
 <20250513054510.3439842-5-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513054510.3439842-5-b-padhi@ti.com>

On Tue, May 13, 2025 at 11:14:38AM +0530, Beleswar Padhi wrote:
> The rproc_detach() function invokes __rproc_detach() before
> rproc_unprepare_device(). The __rproc_detach() function sets the
> rproc->state to "RPROC_DETACHED".
> 
> However, the TI K3 M4 driver erroneously looks for "RPROC_ATTACHED"
> state in its .unprepare ops to identify IPC-only mode; which leads to
> resetting the rproc in detach routine.
> 
> Therefore, correct the IPC-only mode detection logic to look for
> "RPROC_DETACHED" in k3_m4_rproc_unprepare() function.
>

This driver has been upstream for 9 whole months, it is hard for me to believe
this but was just noticed.  Martyn from Collabora should be CC'ed on this, and I
will also need the required R-b/T-b tags.

Typically bug fixes are not part of refactoring exercises.  I suggest to apply
this set without this patch - you can then work on fixing this bug.

Thanks,
Mathieu

> Fixes: ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem")
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> v12: Changelog:
> 1. New patch. Fixup a state detection logic.
> 
>  drivers/remoteproc/ti_k3_m4_remoteproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> index a16fb165fcedd..6cd50b16a8e82 100644
> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> @@ -228,7 +228,7 @@ static int k3_m4_rproc_unprepare(struct rproc *rproc)
>  	int ret;
>  
>  	/* If the core is going to be detached do not assert the module reset */
> -	if (rproc->state == RPROC_ATTACHED)
> +	if (rproc->state == RPROC_DETACHED)
>  		return 0;
>  
>  	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> -- 
> 2.34.1
> 
