Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162204AE130
	for <linux-remoteproc@vger.kernel.org>; Tue, 15 Sep 2026 15:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487066; cv=none; b=icqamUWlrLF5w+/gIJeb2TRKRr9xe5qq3ENm2gCtAYyqOYeqZbGMpyaxFxz8isfS5XbwPuZieO6Wc6gxA/gKIEPA4uhVbrg3ZV+JaDNrIrygUd/Ey1qzBEzCQjds6FlxGm4x30LL22XbNm5SHZ7ebtrCwp5b0kRD3o3FBcwnqmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487066; c=relaxed/simple;
	bh=env0qPIF9DewCq2PfOD6GGppl/OaacpMsO2lEiM/rko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlWQt52nltnCafFHXT+2hgAN1bEeTvwVDUpJcwD28BJXASwcSBOq0yOPXJIAeOd3dborwRbYEDi4wVWeVozTErtpFIYl1aOzXpxM5NAfuQTEzEI/9unz96uCnnBr9aYRr/pomLMPLdh+fiaDfYzRSvAQ4AYEh6G+EZORbmGKAzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mhx+F9fe; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mhx+F9fe"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d90ba1d807so45160555ad.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 15 Sep 2026 08:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789487063; x=1790091863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2jGhgew52Ip1BMkCxx2nRWz9HzaSh1cnk1PxwhNr4ZA=;
        b=Mhx+F9feI3YhkiWZjFT4aaHTCqwzWoktrMsxANEpbPFFRpWY/2+0lY46hcKuCqF3Qg
         u4PUljcuUt0f0KCwFCgNAyzfOmGam4Cf/V+Cze2z/b4c+exvw6XHPSuSCiUX+9V8on1B
         QZ2Ei3VbAU99W1MUVARcTmkN1gnZUyP+liFFYxmRzLeXUTkoqAT5vtQ5A63yFiOXbH4+
         k0zn0UQMQ/lI2j+x8cwervRmhTmTt0ZfzMxZeihVL5Q2HW4Y0wSZGCY6YBLdywAXR2KX
         OZxo3c7GeOyWPSsgRtOOZzdAMBW8ZJl/YK51ISAlXrC2lSvbG+MaZaEhm7t4wJJhjE7A
         N5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789487063; x=1790091863;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jGhgew52Ip1BMkCxx2nRWz9HzaSh1cnk1PxwhNr4ZA=;
        b=TDXUyInjTzceMei/Vn51Qt7G4WDEgkEQoAANixuQ8yABkQf8Z7fmwwhQjBnsYp2ipC
         A3jceNuMShd0zNnhd2uLxzjkUVCuh53lfBvidv7Vk05wYlLzG0DaRG1eeiDq/hXjHv6c
         Jxv5yo4L/suNwaCozXeeuB8VINXXAnoycrt7GwGuBvm1s3ayrfbnjyXDLAO9YX34LiYW
         H95OuzWAA1lMd4d20oRSGf/Eb6IisZGjve55WaVPtDPMuzit2bfroR8xtMsAnZRvVVqr
         4en9/Cyq2JfYvlo34Dk+D+spuit5Xh8JJaUW5RMQkiimlpkErsfPiMDYEcGfh5+aiP2z
         SmoQ==
X-Forwarded-Encrypted: i=1; AKwUvBytmkaXhT1+MaypnwKeBquE7i6QLle9/OHm/Q2NRsx380srsTD5SbcuZkjbr2TYoMGTWCFnpdJY9hzVEO4CamIV@vger.kernel.org
X-Gm-Message-State: AFuF++l4flIJvyxjVFl1go9dRgQUuT1JE6fYt7zWCKxL9UgiS642ZjN8
	Kbr9Z6tLLkcH3ReP7A0wZ7EoomM2ytirmAWVRlA2/EgEylNzFTOHO+39HxRaLt1FnMY=
X-Gm-Gg: AYBFou3G/YIKgm6lY0XqclKN9jvnRirfq+BUKRnakEKQoouEEdYKP3js3O12XxfEG7B
	Un58lx9scRJ3NNlGueW4c42ktD7yhJb8Gi6b+FOBBp89KtqaWCWzsI6d6tw5LxFpslvqsdCAizv
	5JB8cOnZCkAE40YRY2Gyf+dboVxZzT3j+8G+5RFxY9+uGtLBtLqvL1YEmEo3Ux7vGZt662SJVCz
	gxV81P+LGqPXrVezig5haMyiY56ZXwTjxCQhBi0VPo0W2sksEWRtRE1X/vJFChGFH+QozwUVcoU
	N7sIjTsp38VVU92Gkn8+dbLmEdbZMvHtaJ1vgLYWLh4kah3BUMaHBuARKj7KPRQgQUDclpRSuvz
	BoWPEi5RD5u4iGdkBAL4g1cbFWfK9p+GRIWhw36TgcHWKnnSs54ul2FhhWXWuZyD784pIj6TCuw
	eRCPXfeemu7arJ0E0yDebmDK9zbpJfa8MR9RRJuXfxI3BTvZCvSAPvvGu2QZLeJoD3DL56LB9Z3
	wFS8p9RsasKuw==
X-Received: by 2002:a17:902:e54b:b0:2d7:203b:9863 with SMTP id d9443c01a7336-2dd6c5b1084mr143737855ad.1.1789487062887;
        Tue, 15 Sep 2026 08:44:22 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b81f:e807:f8d5:6e56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc2d3bsm72313825ad.48.2026.09.15.08.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 08:44:22 -0700 (PDT)
Date: Tue, 15 Sep 2026 09:44:20 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Padhi, Beleswar" <b-padhi@ti.com>
Cc: Andrew Davis <afd@ti.com>, Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: Add compile testing for additional TI
 drivers
Message-ID: <aqln1OjBIsMt8wIv@p14s>
References: <20260904195634.2275867-1-afd@ti.com>
 <20260904195634.2275867-3-afd@ti.com>
 <0c4cdd98-4029-48a0-9a04-e2bd5f062eb1@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c4cdd98-4029-48a0-9a04-e2bd5f062eb1@ti.com>

On Tue, Sep 15, 2026 at 08:03:22PM +0530, Padhi, Beleswar wrote:
> 
> On 9/5/2026 1:26 AM, Andrew Davis wrote:
> > Many Remoteproc drivers, including K3, can and are built for compile
> > testing. The WKUP_M3, Keystone, and DA8xx can be also, enable this here.
> > 
> > Doing this exposes a compile warning on 64bit platforms as size_t changes
> > size, use the correct printf format specifier for size_t.
> > 
> > We cannot compile test for OMAP_REMOTEPROC due to dependency on OMAP
> > clock framework. But while here fix up the Kconfig help text which claims
> > this driver only works for OMAP4, when it really works across several
> > OMAP-class devices.
> > 
> > Signed-off-by: Andrew Davis <afd@ti.com>
> 
> 
> Thanks for cleaning this up. Test suite is happy.
> 
> Reviewed-by: Beleswar Padhi <b-padhi@ti.com>
> Tested-by: Beleswar Padhi <b-padhi@ti.com>
> 
> Nit: A cover letter would be good to send R/B and T/B for the entire series.

I agree with Beleswar.  I applied all 3 patches.

Thanks,
Mathieu

> 
> Thanks,
> Beleswar
> 
> > ---
> >   drivers/remoteproc/Kconfig           | 10 ++++------
> >   drivers/remoteproc/omap_remoteproc.c |  2 +-
> >   2 files changed, 5 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> > index 5b56b2dcc725f..73500fdc227db 100644
> > --- a/drivers/remoteproc/Kconfig
> > +++ b/drivers/remoteproc/Kconfig
> > @@ -83,9 +83,7 @@ config OMAP_REMOTEPROC
> >   	select OMAP2PLUS_MBOX
> >   	help
> >   	  Say y here to support OMAP's remote processors (dual M3
> > -	  and DSP on OMAP4) via the remote processor framework.
> > -
> > -	  Currently only supported on OMAP4.
> > +	  and DSP) via the remote processor framework.
> >   	  Usually you want to say Y here, in order to enable multimedia
> >   	  use-cases to run on your platform (multimedia codecs are
> > @@ -108,7 +106,7 @@ config OMAP_REMOTEPROC_WATCHDOG
> >   config WKUP_M3_RPROC
> >   	tristate "AMx3xx Wakeup M3 remoteproc support"
> > -	depends on SOC_AM33XX || SOC_AM43XX
> > +	depends on SOC_AM33XX || SOC_AM43XX || COMPILE_TEST
> >   	help
> >   	  Say y here to support Wakeup M3 remote processor on TI AM33xx
> >   	  and AM43xx family of SoCs.
> > @@ -120,7 +118,7 @@ config WKUP_M3_RPROC
> >   config DA8XX_REMOTEPROC
> >   	tristate "DA8xx/OMAP-L13x remoteproc support"
> > -	depends on ARCH_DAVINCI_DA8XX
> > +	depends on ARCH_DAVINCI_DA8XX || COMPILE_TEST
> >   	depends on DMA_CMA
> >   	help
> >   	  Say y here to support DA8xx/OMAP-L13x remote processors via the
> > @@ -141,7 +139,7 @@ config DA8XX_REMOTEPROC
> >   config KEYSTONE_REMOTEPROC
> >   	tristate "Keystone Remoteproc support"
> > -	depends on ARCH_KEYSTONE
> > +	depends on ARCH_KEYSTONE || COMPILE_TEST
> >   	help
> >   	  Say Y here here to support Keystone remote processors (DSP)
> >   	  via the remote processor framework.
> > diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> > index efff95b8e363f..1e96506ce7ca7 100644
> > --- a/drivers/remoteproc/omap_remoteproc.c
> > +++ b/drivers/remoteproc/omap_remoteproc.c
> > @@ -1208,7 +1208,7 @@ static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
> >   		oproc->mem[i].dev_addr = data->mems[i].dev_addr;
> >   		oproc->mem[i].size = resource_size(res);
> > -		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %p da 0x%x\n",
> > +		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%zx va %p da 0x%x\n",
> >   			data->mems[i].name, &oproc->mem[i].bus_addr,
> >   			oproc->mem[i].size, oproc->mem[i].cpu_addr,
> >   			oproc->mem[i].dev_addr);
