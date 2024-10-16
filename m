Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C64E54F95
	for <linux-remoteproc@vger.kernel.org>; Wed, 16 Oct 2024 16:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729094565; cv=none; b=Ordpu1oChOTM6XysabNG+Vd+XCW0V32PakUSSaTQLTfsrVSC1Il227DPjTVM8LVSPFw0c7hH7CGT2ettO2o5pdaeYbWiK8rmR6dEiCTvo2qTTDPv+kKHanxJHo6GiXJrW0q/9muZu3hmOqS8gVhYaj09bWFIUFhiE/sF6O7801U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729094565; c=relaxed/simple;
	bh=7METC6jN6G8PZeGWbioMgR4Fp1p2aozF6/VPN8mvWBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVPIkIKaxpLG4OfqZhev6q2eE+qobyR8Rj2tlf6QhnD9QYTT1vroJmGqctHKVBPoNohIUj1ti89iSP2eifcIcgoz7pero4MUfqAtI1AtxjRF/AkxFlazLNfNeqW+jSRIbVLv55JcNxDdqL2Mv7EjdhD9SlmYOa7VVZAHNU16Eiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JjZHqekn; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JjZHqekn"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so5505297a12.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Oct 2024 09:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729094563; x=1729699363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=502Ngocc/Ryi+yCr04OyS0HdJEQRXBupe8eMfPyehwg=;
        b=JjZHqeknqpIHNQL2qY0scGP6huP2/rM8oMWhAQUfDFbNPzHo7xyb6oC2jvqbHhy2Dz
         cmcQK4/xc/1EKawE7A4V1ASentdMcrOFE/9CyN9F/Ol0+tmbhLAaPpFnawO+3rT5Onzy
         RBIUxTvTo2/myh9TXivvUiJv/LuwOr+5D+ygMn3NoTGPfzUBaiWZGvuSFWi7ty70U9sb
         aGntdIDCCW/QrMDvD1/+nnWhj/RVIptYxD2S7qFEHPB+uc6x5KZj+dqWGDFciQRaLnKu
         PIh5Lj4eB0ndmcYkIv6wIC41wWHfNs+mc/VliLDt5CQ8LiW8ShEmF7Hi5T39xAAxoTkX
         +1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729094563; x=1729699363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=502Ngocc/Ryi+yCr04OyS0HdJEQRXBupe8eMfPyehwg=;
        b=V/l6FblplL1YkmlaRUPM3LZ1u9O6RGQRyUTKPH73eEI52znaCxkuoBWKOJaxKuMjKX
         CB5Mnzjg6VYLlErbrRri8v9XE7CoUMiN+Pzw+Qt3z1qLe1BpdcdZOp4eyCnXUWt5/acg
         H8UkRjtG6qx378iKMZmqkr/Cn4FoNl3JTX6GmANCUxB3JU8whXNyGCslulCow7m3tayA
         IaYf3M2jxAiQWR/zSco4if5EbqJk+DKfYVHiTBTSyRfpa6s2AiIC7jZC94EghxNc3obd
         FHoEFfuGYNZZJrAvqVu+IFR46w/SnMNNYMQ5LD3k3JBNYbaZYWZnwPFapaeppFjsVYgb
         v3QA==
X-Forwarded-Encrypted: i=1; AJvYcCX+YOK0Y/Xvh5zs4KQIa3QATdRKZ0UoHF1DS+tHyDJI3CkS9yCogaEuHH8L3vz+MgW/dhg9kf5wOo9TRDBdo8jp@vger.kernel.org
X-Gm-Message-State: AOJu0YxdCu9Q1bmH8s10gpKwTZhQ4LvvTsb/cEaixcZFZSWMOLsu9m6I
	18b+KDCt9i1VnGNdLpU4G51M4lXqsibA4uEVDbc4PfjWrXqnLC14mx6dKKsFN5Y=
X-Google-Smtp-Source: AGHT+IFX2XjVApVDJfPBlxPEXd5Ohsyfm3+IvbCgmTwH5ZLSs9OXlEEOYLesp3zSocwQaY+SsyQRFg==
X-Received: by 2002:a05:6a20:2d2a:b0:1d8:aa64:8733 with SMTP id adf61e73a8af0-1d8bcf430edmr26699382637.26.1729094562872;
        Wed, 16 Oct 2024 09:02:42 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2add:7601:8402:667])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77370a04sm3230082b3a.1.2024.10.16.09.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 09:02:35 -0700 (PDT)
Date: Wed, 16 Oct 2024 10:02:26 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Andrew Davis <afd@ti.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Martyn Welch <martyn.welch@collabora.com>,
	Hari Nagalla <hnagalla@ti.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mailbox, remoteproc: k3-m4+: fix compile testing
Message-ID: <Zw/jkpnGXW6ez56o@p14s>
References: <20241007132441.2732215-1-arnd@kernel.org>
 <4d8a9786-ee4b-43b8-9207-e048c66349fe@ti.com>
 <Zw/bIItwk0jeqKoR@p14s>
 <07e5b001-b251-4f4f-8ce9-56b43032b5c4@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07e5b001-b251-4f4f-8ce9-56b43032b5c4@ti.com>

On Wed, Oct 16, 2024 at 10:37:35AM -0500, Andrew Davis wrote:
> On 10/16/24 10:26 AM, Mathieu Poirier wrote:
> > On Mon, Oct 14, 2024 at 09:56:11AM -0500, Andrew Davis wrote:
> > > On 10/7/24 8:23 AM, Arnd Bergmann wrote:
> > > > From: Arnd Bergmann <arnd@arndb.de>
> > > > 
> > > > The k3-m4 remoteproc driver was merged with incorrect dependencies.
> > > > Despite multiple people trying to fix this, the version 6.12-rc2
> > > > remains broken and causes a build failure with CONFIG_TI_SCI_PROTOCOL=m
> > > > when the driver is built-in.
> > > > 
> > > > arm-linux-gnueabi-ld: drivers/remoteproc/ti_k3_m4_remoteproc.o: in function `k3_m4_rproc_probe':
> > > > ti_k3_m4_remoteproc.c:(.text.k3_m4_rproc_probe+0x76): undefined reference to `devm_ti_sci_get_by_phandle'
> > > > 
> > > > Fix the dependency again to make it work in all configurations.
> > > > The 'select OMAP2PLUS_MBOX' no longer matches what the other drivers
> > > > dependencies. The link failure can be avoided with a simple 'depends
> > > > do, so turn that into the same 'depends' to ensure we get no circular
> > > > on TI_SCI_PROTOCOL', but the extra COMPILE_TEST alternative is what
> > > > we use elsehwere. On the other hand, building for OMAP2PLUS makes
> > > > no sense since the hardware only exists on K3.
> > > > 
> > > > Fixes: ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem")
> > > > Fixes: ba0c0cb56f22 ("remoteproc: k3-m4: use the proper dependencies")
> > > > Fixes: 54595f2807d2 ("mailbox, remoteproc: omap2+: fix compile testing")
> > > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > > ---
> > > >    drivers/remoteproc/Kconfig | 6 +++---
> > > >    1 file changed, 3 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> > > > index 955e4e38477e..62f8548fb46a 100644
> > > > --- a/drivers/remoteproc/Kconfig
> > > > +++ b/drivers/remoteproc/Kconfig
> > > > @@ -341,9 +341,9 @@ config TI_K3_DSP_REMOTEPROC
> > > >    config TI_K3_M4_REMOTEPROC
> > > >    	tristate "TI K3 M4 remoteproc support"
> > > > -	depends on ARCH_OMAP2PLUS || ARCH_K3
> > > > -	select MAILBOX
> > > > -	select OMAP2PLUS_MBOX
> > > > +	depends on ARCH_K3 || COMPILE_TEST
> > > > +	depends on TI_SCI_PROTOCOL || (COMPILE_TEST && TI_SCI_PROTOCOL=n)
> > > 
> > > This line is odd. IMHO "COMPILE_TEST" should only be added to ARCH_*
> > > dependencies, as often only one ARCH can be selected which prevents
> > > compile testing drivers with various multiple architecture deps in
> > > one compile test.
> > > 
> > > Normal dependencies, on the other hand, can simply be enabled if one
> > > wants to compile test its dependent drivers. In this case, TI_SCI_PROTOCOL
> > > cannot be enabled as it has a dependency up the chain that doesn't
> > > allow selecting when not on a TI platform. We can fix that as I posted
> > > here[0]. With that fix in, this line can be simply become:
> > > 
> > > depends on TI_SCI_PROTOCOL
> > 
> >  From the above and the follow-on conversation with Nishanth, should I understand
> > you are working on a patchset to address this issue?  If not I will apply Arnd's
> > patch.  People are sending different fix [1] - the issue needs to be addressed
> > well before the end of the cycle.
> > 
> 
> This is a bit complex as it touches multiple subsystems. You should take Arnd's
> patch. This will fix this for M4, I will then add a follow on patch doing the same
> for the other two remoteproc drivers (DSP and R5).
> 
> When my series here[0] goes in I will then send a final patch removing the depends
> TI_SCI_PROTOCOL=n oddness from all 3 drivers. This final step does not need to happen
> this cycle though, only the first two steps are needed to prevent any further compile
> test issues.
>

I have applied Arnd's patch.

> Andrew
> 
> [0] https://lore.kernel.org/lkml/20241015213322.2649011-1-afd@ti.com/
> 
> > [1]. https://lore.kernel.org/linux-arm-kernel/20241016013922.1392290-1-zengheng4@huawei.com/T/
> > 
> > > 
> > > Andrew
> > > 
> > > [0] https://lore.kernel.org/lkml/20241014144821.15094-1-afd@ti.com/
> > > 
> > > > +	depends on OMAP2PLUS_MBOX
> > > >    	help
> > > >    	  Say m here to support TI's M4 remote processor subsystems
> > > >    	  on various TI K3 family of SoCs through the remote processor
