Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373C03CD8C7
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Mar 2026 14:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773066368; cv=none; b=IvupSs3+q2UJEJZsN7Q0QbGYDcDMgRT7hhyWKJjm6htfM8u1b+cCXTDB4r0eKjTz+tlOEBjDQ0Fa6ywzsV13SNMA23BTG6vpYO2hCMGmdoVQv8RsS/z3IpuG/dGK35x1/4Yvn978xGv6MVosTuq0qARcps4gy+7tUjEFFjCKdWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773066368; c=relaxed/simple;
	bh=0GzH/WbkPxuwUlkTNUh22Q69q46ZpYbEGhCSmH4mU2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXNoEcLYqOG8kuzSqM25eLUyFgKs5tb8UO65EqrgHFACESv6vOGEzKcVh64Yqi8tES3uqwI44geWV6Ya1970PbZ9J/CUAlN4GbfSVulet0I94fffcRE2s3Mc+/Eu8IZc0FQ5NJFVux25HZf7WemY4XBlIMo95YpY5uKbB03gJg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LdXCEi29; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LdXCEi29"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35691a231a7so7259343a91.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 07:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773066366; x=1773671166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fBrm9MTDNHeQZv4wJ0CXspPHqOyz2SoB+5IA+qzdZls=;
        b=LdXCEi29nj/zxzt9jH3uU16Svz33wDY1upwuF7Ah4oJCH79vByAIyc/mvzFZEMeNgl
         CKEscjbDgMAl/KHpC+yj8rj/oZH5U3i0kuolgd24TajHsWX3xzlawzWZFUU2/iysFabZ
         jVouzVUcz8MDt/C498/Wn9/Gh3RQN+QvWdVy8HPrkZb2NU0GXjlqXZrrkdwNghpWMnd2
         LyIyGZ8bRrfHws+VyBUzFRxhQ9NvxYsRrm+s0debhU4m2Mp/ZnlKF0rQGtdM3quaITMg
         yYHFvfvCAS5VgRSp2AxeewfS/Yt8FIbB15NmGvJYy6Mlj1QI3+n95XXkkZ3KC+c238Kb
         GW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773066366; x=1773671166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fBrm9MTDNHeQZv4wJ0CXspPHqOyz2SoB+5IA+qzdZls=;
        b=Qo6t+PkHD+GM+6+oEf8ImWjWHAU8emdI0QOo0IbdBw+E+b56b8otJiXa2bp8Omgtc1
         Q6hDohOAcdbUTm/KNCEtCKdr2Cj6fiu45Ywy01JdiOocBkp2DsGUT/10Qdv/BRJMYpPU
         8SXAgFF4iF5IgKwvkQEMmZz9h7Gir4MbLxtO5qEA/7RJnNkmAsRvekTw9Ha3Ygv8GxGC
         FYdWrk7yCZoWmf8N7CKc8hWfl8Kw/FO/5EvK3ap+Z0sRRaAopgOhyeuh8PU7QaAYHS/h
         G9KW27T8PDzAhDtwCj6E1WUs4vZATtJSx3fMNa1qNpc/D0hAmr4LrWI4jJ327Q02H0k8
         GYRw==
X-Forwarded-Encrypted: i=1; AJvYcCVtFvyveMvzaEP8myjFCJNt/LhuBriIcZKlNW8jCcESaq/hB8aHW9yPr6VZKqOqAGJsIwGQVZ8sbUDKVdW4ZUvX@vger.kernel.org
X-Gm-Message-State: AOJu0YyK1kyKHpboizqyx80HIzLqobTYc+YTE+cB9uyuQftbjptDAGzb
	d2g8i7iz+VtzdNWMkeUrNIigIgVX3GAkY0RkmPUf7eHi3HRrVp+zcL7sw4uOh8+2GQI=
X-Gm-Gg: ATEYQzw/vU0XPcVaHLlOcMhBnOYR+s42KbswGVMPMYv9UW2il+eKWmdW6mG6KDm0O3x
	xHwhkZmfJ5vpkuGzRfH8fv4Ku8f6c4T3tOTFJxovlGL/cP5rfnCJh5HbljQMluVldsTgwcTUtf2
	L8yb4caoicpq3hAsj5Z33zrNJyxmWNkyW85Ir+qMQEQh+uO+vFVUoXF6Y8h9/9WSya6O7XW9VFG
	oEkpdSOBeyg1deWKkVfEuAH2et0p8cMY1eFcrs0hC7cnEc6pd7eKkOCggt2A/mljuEgMg/nITJI
	d1A4qbB5sD3tYIb837sZwiiTKWlnCRXUr8+ELi2SR+1q1JSZiixL0jiqc3qx1O4ZRNu87q4lK8W
	yTqwNig847Q7xGaZuKYrNOI8xKQP08NATusLMXtFF+XVX5Eg+jr6wFmEMfHTnLR8yPoKQr5kpFd
	38ys8zxAFGFIyooKTJdt1jEugNHaM=
X-Received: by 2002:a17:90b:2496:b0:359:8564:dc0e with SMTP id 98e67ed59e1d1-359be21aab6mr5402377a91.3.1773066366110;
        Mon, 09 Mar 2026 07:26:06 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9504:de97:a114:6f18])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bbcacf06sm4290839a91.4.2026.03.09.07.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:26:05 -0700 (PDT)
Date: Mon, 9 Mar 2026 08:26:03 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Andrew Davis <afd@ti.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: keystone: Request IRQs in probe()
Message-ID: <aa7Ye7_c3nU5J4Qx@p14s>
References: <20260302201734.320747-1-afd@ti.com>
 <aasMuUHVnyAx3FmS@p14s>
 <5d2936a4-9124-4910-93ed-c898d6facdb1@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d2936a4-9124-4910-93ed-c898d6facdb1@ti.com>

On Fri, Mar 06, 2026 at 11:29:09AM -0600, Andrew Davis wrote:
> On 3/6/26 11:19 AM, Mathieu Poirier wrote:
> > Good day,
> > 
> > On Mon, Mar 02, 2026 at 02:17:34PM -0600, Andrew Davis wrote:
> > > IRQs can be registered in probe and only need to be enabled/disabled
> > > during remoteproc start/stop. This lets us catch IRQ issues early
> > > and simplify remoteproc start/stop.
> > > 
> > > Signed-off-by: Andrew Davis <afd@ti.com>
> > > ---
> > >   drivers/remoteproc/keystone_remoteproc.c | 41 +++++++++---------------
> > >   1 file changed, 15 insertions(+), 26 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
> > > index 4d6550b485675..e7fde55097866 100644
> > > --- a/drivers/remoteproc/keystone_remoteproc.c
> > > +++ b/drivers/remoteproc/keystone_remoteproc.c
> > > @@ -173,35 +173,16 @@ static int keystone_rproc_start(struct rproc *rproc)
> > >   	INIT_WORK(&ksproc->workqueue, handle_event);
> > > -	ret = request_irq(ksproc->irq_ring, keystone_rproc_vring_interrupt, 0,
> > > -			  dev_name(ksproc->dev), ksproc);
> > > -	if (ret) {
> > > -		dev_err(ksproc->dev, "failed to enable vring interrupt, ret = %d\n",
> > > -			ret);
> > > -		goto out;
> > > -	}
> > > +	enable_irq(ksproc->irq_ring);
> > > +	enable_irq(ksproc->irq_fault);
> > > -	ret = request_irq(ksproc->irq_fault, keystone_rproc_exception_interrupt,
> > > -			  0, dev_name(ksproc->dev), ksproc);
> > > +	ret = keystone_rproc_dsp_boot(ksproc, rproc->bootaddr);
> > >   	if (ret) {
> > > -		dev_err(ksproc->dev, "failed to enable exception interrupt, ret = %d\n",
> > > -			ret);
> > > -		goto free_vring_irq;
> > > +		flush_work(&ksproc->workqueue);
> > > +		return ret;
> > >   	}
> > > -	ret = keystone_rproc_dsp_boot(ksproc, rproc->bootaddr);
> > > -	if (ret)
> > > -		goto free_exc_irq;
> > > -
> > >   	return 0;
> > > -
> > > -free_exc_irq:
> > > -	free_irq(ksproc->irq_fault, ksproc);
> > > -free_vring_irq:
> > > -	free_irq(ksproc->irq_ring, ksproc);
> > > -	flush_work(&ksproc->workqueue);
> > > -out:
> > > -	return ret;
> > >   }
> > >   /*
> > > @@ -215,8 +196,8 @@ static int keystone_rproc_stop(struct rproc *rproc)
> > >   	struct keystone_rproc *ksproc = rproc->priv;
> > >   	keystone_rproc_dsp_reset(ksproc);
> > > -	free_irq(ksproc->irq_fault, ksproc);
> > > -	free_irq(ksproc->irq_ring, ksproc);
> > > +	disable_irq(ksproc->irq_fault);
> > > +	disable_irq(ksproc->irq_ring);
> > >   	flush_work(&ksproc->workqueue);
> > >   	return 0;
> > > @@ -427,10 +408,18 @@ static int keystone_rproc_probe(struct platform_device *pdev)
> > >   	ksproc->irq_ring = platform_get_irq_byname(pdev, "vring");
> > >   	if (ksproc->irq_ring < 0)
> > >   		return ksproc->irq_ring;
> > > +	ret = devm_request_irq(dev, ksproc->irq_ring, keystone_rproc_vring_interrupt,
> > > +			       IRQF_NO_AUTOEN, dev_name(dev), ksproc);
> > > +	if (ret)
> > > +		return dev_err_probe(dev, ret, "failed to request vring interrupt\n");
> > >   	ksproc->irq_fault = platform_get_irq_byname(pdev, "exception");
> > >   	if (ksproc->irq_fault < 0)
> > >   		return ksproc->irq_fault;
> > > +	ret = devm_request_irq(dev, ksproc->irq_fault, keystone_rproc_exception_interrupt,
> > > +			       IRQF_NO_AUTOEN, dev_name(dev), ksproc);
> > 
> > request_irq() sets irqflags IRQF_COND_ONESHOT, something that is not done here.
> > Are you sure this is what you want?
> > 
> 
> devm_request_irq() looks to also set IRQF_COND_ONESHOT matching request_irq().
>

You are correct - I have applied this patch.
 
> Not sure it would matter anyway as these IRQs are not shared, behavior would
> be unchanged.
> 
> Andrew
> 
> > Thanks,
> > Mathieu
> > 
> > > +	if (ret)
> > > +		return dev_err_probe(dev, ret, "failed to enable exception interrupt\n");
> > >   	ksproc->kick_gpio = devm_gpiod_get(dev, "kick", GPIOD_ASIS);
> > >   	ret = PTR_ERR_OR_ZERO(ksproc->kick_gpio);
> > > -- 
> > > 2.39.2
> > > 
> 
