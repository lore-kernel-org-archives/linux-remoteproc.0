Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D56C329E64
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Feb 2026 16:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770395397; cv=none; b=Uw8u4H63HPJvkqauqs3iKEHHhqI7oRqflbqOD8ZicTE6AVGHe1Fgo8Sgpi9NLJtDD0Cshj9U39ibAlwqN8fqZsg/0dOk4Fig0YWYubcd8PTkhCUkGw8zthETQd04N71XI+PMYVtzU9pMUvqgdZOgWQE303gCrUjj4iP5YmY+UbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770395397; c=relaxed/simple;
	bh=6jpZjKarYEJycrttZRXjR637/qtxgdxfXkrX2Ex1vPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQlxmETvu5Tfm/hn4FFPZv/2JDslEJagEWOR59e7+SyCVFzGwkvkWfJXTKG7Ksp4LWik4UiMvvGb6VsRxmgeEZ8IALxVrDNiCWn4gaoziNIEGv2l+ts5EbzvSmFauS22SXiF0UhAckpyeNpTrH93PAkV0eAZ/FWvLtm4C77Ju2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I+U1iqLN; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I+U1iqLN"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-81f39438187so1715872b3a.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Feb 2026 08:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770395397; x=1771000197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X7fQkwk+wPXieg0NkOTWjKgPZp/IlTl5T8xOo7PjnBw=;
        b=I+U1iqLNOBd06FMVvclGS7HxxJhmVD2ysDT/Srh0T+CAwZ0CypxrRkQk4+vdWuYp/K
         Zwq31HaTLUT7mJp+abPbR/kco1EYUPX/2DqQ4ZqeeahcXjuGi3KoEJ/6/aP5c13nLuzY
         SLv+NmcX1zMC2zkt2xc3mSPb+kYBqh+APnkAWH0BNCY7/yUTzZseJK/hi20h8Y6yFOoe
         Ao+WxdpD7kIdPd9Tpw8qvZeOjWeEgtsixEvrBxr71hXgHctTBrfYB19sLGxcZ7fOANWj
         auP63dyU4OUNL7x/L5q1HtDdco+zzs9gn1bNyBO7btyHaRXIVMithuH+2Z1pmgUK1SvF
         o3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770395397; x=1771000197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X7fQkwk+wPXieg0NkOTWjKgPZp/IlTl5T8xOo7PjnBw=;
        b=IMg0WGl61JYUKINemj6inpYqzKAKScL7pY8AvIMcVFw8Z0ltJfVB6FJF/N5Cmb3ArR
         tJ+rNtLYGiwHlsl9IVp/+KJr6eG5nfUMLjcj+hP1ZeIVAy/Oho0xupx9yrK1Wn+u4WWh
         alPjP982T28CHpfu80Otal8qeJaWRUkm0i9mJ6t52pTzfAkpxvcHsaNCQmtRaTNLcwGv
         gPsRom1xaAfgEkr83U7AxM/8XFgU8TgLyqdsE7vQCJl8NVEyRbxV4V+DLS2uXPs/FJxJ
         xi1vyXjDUgbZjW9tU+3ZLSkjGjeDyT1wwKUCzg0SKv3XP5IjcbnkjdSlseCG66iUi/pt
         5eyw==
X-Forwarded-Encrypted: i=1; AJvYcCWzja+sN+NgoVfGTBNNxUrSy+lj5R3UgBrM7DnNkSMOdkoFghBV9WGW27tbR7TCGaByfN8gPGWdU5JcOuLIl2Nv@vger.kernel.org
X-Gm-Message-State: AOJu0YzKnj654LNZyetV2s/B9ERrcZwp2ve7Wd9Rmv6kS1gzYkKs78ri
	5PeO+c86PfRPmUNgFA0LupeoqB/yyIxQu7UGlVTG5+VlWyPQQUzR+kcFJkKlpiboAW8=
X-Gm-Gg: AZuq6aIkm5vtpP+lrizf4y8Ium4LIbN2OPunFn0727M9+2oYuJLIO4n/ohebEVXd8lr
	h0jJZI4aT14UtefpvinHi+YE7LgoPZXna++ndRiV3FirnKvR3wfXnyZjbxl9fmQwrUICsqGPGkW
	IREEV67yAUNnNMg4ZsDWn6YRKp75AteThbo4YKu6Hh0WKc6hHsOzsHHmA5/2A9rRgmn/z/iBFIH
	h0TDq589/cfezwrHQoDfRVsFfMZPwmVsZlbfBcQyEGwB/YpZXNmAcnyuYqUFNi2K3Z2q/nZ8yJN
	goBl+UClOgIVSV3iOE3WAbhf5DgmtQPPQcv3ueKFNjSaRXPKmIE5sJ8dRK1+t+4IyCwl7zh0BXN
	GRSZpaLHMbALZxeRs5/z9X1MlEWBQ70DT12n4r2NPeOdhDevaB0BUAg7Qi+AFHV/ByYAEYZ2+b9
	GDfOp7KCKwCor5
X-Received: by 2002:a05:6a00:37c4:b0:821:70e7:74ca with SMTP id d2e1a72fcca58-824417df29fmr2464858b3a.70.1770395396788;
        Fri, 06 Feb 2026 08:29:56 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:fa3:e3b4:3597:587a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441884959sm2603694b3a.32.2026.02.06.08.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 08:29:56 -0800 (PST)
Date: Fri, 6 Feb 2026 09:29:53 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [bug report] remoteproc: imx_rproc: Introduce prepare ops for
 imx_rproc_dcfg
Message-ID: <aYYXAa2Fj36XG4yQ@p14s>
References: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
 <aYXveV_Y1gT73JoK@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYXveV_Y1gT73JoK@stanley.mountain>

On Fri, Feb 06, 2026 at 04:41:13PM +0300, Dan Carpenter wrote:
> [ Smatch checking is paused while we raise funding.  #SadFace
>   https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]
> 
> Hello Peng Fan,
> 
> Commit edd2a9956055 ("remoteproc: imx_rproc: Introduce prepare ops
> for imx_rproc_dcfg") from Jan 9, 2026 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/remoteproc/imx_rproc.c:648 imx_rproc_prepare()
> 	warn: ignoring unreachable code.
> 
> drivers/remoteproc/imx_rproc.c
>     605 static int imx_rproc_prepare(struct rproc *rproc)
>     606 {
>     607         struct imx_rproc *priv = rproc->priv;
>     608         struct device_node *np = priv->dev->of_node;
>     609         struct rproc_mem_entry *mem;
>     610         int i = 0;
>     611         u32 da;
>     612 
>     613         /* Register associated reserved memory regions */
>     614         while (1) {
>     615                 int err;
>     616                 struct resource res;
>     617 
>     618                 err = of_reserved_mem_region_to_resource(np, i++, &res);
>     619                 if (err)
>     620                         return 0;
>     621 
>     622                 /*
>     623                  * Ignore the first memory region which will be used vdev buffer.
>     624                  * No need to do extra handlings, rproc_add_virtio_dev will handle it.
>     625                  */
>     626                 if (strstarts(res.name, "vdev0buffer"))
>     627                         continue;
>     628 
>     629                 if (strstarts(res.name, "rsc-table"))
>     630                         continue;
>     631 
>     632                 /* No need to translate pa to da, i.MX use same map */
>     633                 da = res.start;
>     634 
>     635                 /* Register memory region */
>     636                 mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
>     637                                            resource_size(&res), da,
>     638                                            imx_rproc_mem_alloc, imx_rproc_mem_release,
>     639                                            "%.*s", strchrnul(res.name, '@') - res.name,
>     640                                            res.name);
>     641                 if (!mem)
>     642                         return -ENOMEM;
>     643 
>     644                 rproc_coredump_add_segment(rproc, da, resource_size(&res));
>     645                 rproc_add_carveout(rproc, mem);
>     646         }
>     647 
> --> 648         if (priv->ops && priv->ops->prepare)
>     649                 return priv->ops->prepare(rproc);
> 
> This is unreachable code.

It looks like Dan (and Smatch) has a point.

> 
>     650 
>     651         return 0;
>     652 }
> 
> regards,
> dan carpenter
> 
