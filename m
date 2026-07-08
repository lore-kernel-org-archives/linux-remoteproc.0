Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C8642DA37
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Jul 2026 16:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783527825; cv=none; b=fWHRtgG5UNFACLaVX4yZilYduEw72yMl1jMgzWpyEbNUCytTAP4HDzqL/TdfKNckINkoJ8bVDpe/Pi5vLFBGleWZS2FW49zSYjGMbe//Eh+axZzcF9EcIDjFSHzbFtYL7yK30daBeaSqqFssUca2YdWgtTBtSCpRhD92jxgpLc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783527825; c=relaxed/simple;
	bh=8azP0Cijh1nnaagGzwRqUiPDjacYh/Giv4QUGa1YjZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/O6iEKJ/WWLydqz7ymGsD6Qm0pYpynyiMTK4YZqW6+OTwFe+zvxeFajsB0RzgPRNRu04PYxs5UOKMuFKXPgsotfRzkLHY0bRk1IEc40xaTTysppd/HLbWvXS7rdPyESD/62B7DjOl2TF/qstz/9p6AD8EARHI0j9TYjiz49opw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NeFfCW/5; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NeFfCW/5"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso9833455ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jul 2026 09:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783527824; x=1784132624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MJyOd6fr7Ceor1quC3ITK7yhzshrFTskwqPW5tLgVUo=;
        b=NeFfCW/5jHuCuALUsTeOA5DH52BkVTcpvarJm1mguF5Fk2/qJd6sBo8VmLz+QoxLwv
         HVyHIWNkV2n/2medWI01pvhuGMQX5XKmhYfTV4LU9KWT3X8yiMl+s+QnXc4ekOw8eJjD
         hH6ULsuaDGELEyJa3FOFcgBwraVmeTrv7HKjnrv0fovtCtz+AlgUphx0E9EyHP77S2cQ
         gi/pXeLsHb992f7xLNiBhFlf5rxXksML950voh3rEzbgtcuxbg0Sy6glTdTTi+DGajSJ
         u3dtUzvMXLMho/zFQhrE8R5DBq9HyAOqbZ9IzvBKAC0rF/b+WH5sPLRNYFiLGNXH39FQ
         HARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783527824; x=1784132624;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MJyOd6fr7Ceor1quC3ITK7yhzshrFTskwqPW5tLgVUo=;
        b=GKrwQa5l5Q9lIZukJAaSXJ+E2PhaAPaYTKIse6rjMR9djLX/MkPzC8t7pEXlLOHSJX
         a7cbrhDlpNJEfUl+mubrKCqLKsezyyUhxfNzs3fBJr09MxYrK2xWJaPN3Yrscpgk06ri
         K9Sl87SrNnpB930k8/wJytzSARlFV9S7QhE5Vsb9LcTjgmSeyb4oTQW1kPTDF51MQzxG
         8I+zJmdgi/pqmhahW4auW+mVH2KTbHLyC5wnbyhXDTV2TWaMHe9Lp/5TxabJDkXHz9zw
         n0C/8FKzDknmQUNQUmwVplV6ngusKi1elddRCofRZ9m/OtCPxtrI7hUSJG8Z+JLC2dzz
         TUrA==
X-Forwarded-Encrypted: i=1; AHgh+RqHC3RwSp6TrY7FIulh2I81vHIz7m4AQMEEL8w0wsHTYA6WMyT6sKfPLaY8BcoSDzB6qDaPEIeC5eYgPGux6Z1Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0rMumbPBQW+dRBXVW6mWeF3ubBN6FjFP0Ja7uTQAXG8gKWTNj
	V4QVrHVlTl9tqyeCTME4oMOAvJsMB6Um/kA/CrwktmPUKqWNj5VtF/RgW6Q9buu7J28=
X-Gm-Gg: AfdE7ckPgo3GaSqC2aJOam2qfZQm6Xzi7Qs3RuXLOEVYMCPpy/eNeL7q/ge5Gny/xKn
	8vEw6jMZt2WWVEDlgKA1kwfFfaGguVLaSk+oEJFmda4jUfPgTghG3NzJdLkxXfsZKKkAX+0WwRq
	7UOMVH6UCiKsN3nkp66oYHC92eq6H6wonsrhyWXYWq+6PGZpTc/Q6ZybtGTfFU9hbXeORrXkDUO
	sLgZyzHkGjdwA4hZeb3z96SjpTD3FmNZ0lGFCi0MN6DBxpHS58uqz3nJfky/5txjvFC5L+BIVdy
	RjNmqIQIhrgK7AHbmlmaS/d1hL6TCOdlm8k0SCZ498RCMUzl/Ezj0R3ZaNdslTQudjxmc7R16Jb
	p6ueAMUmap6hd0XYTT5QxcTKjZHPnEkoaV2ogB/PDTs5lPA4jcODcqsyotmS982GB1twFi1bHu0
	Ffhd57rrHjrm6/90/D
X-Received: by 2002:a17:902:c94e:b0:2ca:4cfd:a6df with SMTP id d9443c01a7336-2ccea45f347mr36685055ad.43.1783527823391;
        Wed, 08 Jul 2026 09:23:43 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:da71:a4fe:1ac2:9750])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb73asm30310015ad.17.2026.07.08.09.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:23:42 -0700 (PDT)
Date: Wed, 8 Jul 2026 10:23:40 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Ben Levinsky <ben.levinsky@amd.com>, andersson@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, tanmay.shah@amd.com
Subject: Re: [PATCH v4 2/2] remoteproc: add AMD BRAM-based remote processor
 driver
Message-ID: <ak55jBBfQMJ71Afj@p14s>
References: <20260629164003.3940208-1-ben.levinsky@amd.com>
 <20260629164003.3940208-3-ben.levinsky@amd.com>
 <akfl1Uhn9QHRwE6n@p14s>
 <30c8d353-f0ec-4ee2-bbaa-0d21e2b985f1@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30c8d353-f0ec-4ee2-bbaa-0d21e2b985f1@amd.com>

On Tue, Jul 07, 2026 at 10:59:55AM +0200, Michal Simek wrote:
> 
> 
> On 7/3/26 18:39, Mathieu Poirier wrote:
> > Hi Ben,
> > 
> > On Mon, Jun 29, 2026 at 09:40:03AM -0700, Ben Levinsky wrote:
> > > Add a remoteproc driver for AMD soft-core processor subsystems
> > > instantiated in programmable logic and using dual-port BRAM for
> > > firmware storage and execution.
> > > 
> > > The driver parses the firmware memory window from the remoteproc device
> > > node's reg property, interprets that address and size in the
> > > processor-local address space, and then uses standard devicetree
> > > address translation through the parent bus ranges property to obtain
> > > the corresponding Linux-visible system physical address.
> > > 
> > > The resulting translated region is registered as the executable
> > > remoteproc carveout and coredump segment.
> > > 
> > > The processor is controlled through an active-low reset GPIO and a
> > > subsystem clock. The clock is enabled before reset is released, and the
> > > processor is kept in reset until firmware loading completes.
> > > 
> > > The firmware-name property is optional, allowing firmware to be
> > > assigned later through the remoteproc framework. Firmware images
> > > without a resource table are also accepted.
> > > 
> > > Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> > > ---
> > >   drivers/remoteproc/Kconfig          |  11 ++
> > >   drivers/remoteproc/Makefile         |   1 +
> > >   drivers/remoteproc/amd_bram_rproc.c | 213 ++++++++++++++++++++++++++++
> > >   3 files changed, 225 insertions(+)
> > >   create mode 100644 drivers/remoteproc/amd_bram_rproc.c
> > > 
> > > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> > > index c521c744e7db..58fa566b609f 100644
> > > --- a/drivers/remoteproc/Kconfig
> > > +++ b/drivers/remoteproc/Kconfig
> > > @@ -23,6 +23,17 @@ config REMOTEPROC_CDEV
> > >   	  It's safe to say N if you don't want to use this interface.
> > > +config AMD_BRAM_REMOTEPROC
> > > +	tristate "AMD BRAM-based remoteproc support"
> > > +	depends on OF && COMMON_CLK && (GPIOLIB || COMPILE_TEST)
> > > +	help
> > > +	  Say y or m here to support a BRAM-based remote processor managed
> > > +	  through the remoteproc framework.
> > > +
> > > +	  The processor is controlled through a reset GPIO and clock.
> > > +
> > 
> > This last sentence doesn't belong here - please remove.
> > 
> > Looking at the bindings and this Kconfig I wonder why the emphasis of the naming
> > convention, i.e "BRAM-based remoteproc" is placed on the kind of memory the
> > remote processor is connected to rather than the remote processor itself.
> > 
> > Wouldn't it be better to have something like "AMD MicroBlaze/V remote
> > processor"?  What happens when we get another AMD softcore that is completely
> > different than MicroBlaze/V that is also connected to the same type of memory?
> > 
> > I'm good with the implemenation, I just wonder about the name...
> 
> We started with very generic amd,bram-proc compatible string and then based
> on discussion
> https://lore.kernel.org/all/20260427162703.1644103-2-ben.levinsky@amd.com/

Thanks for the link, it provides useful context.

> we got recommendation to treat is as soc specific instead of generic.
> Which give us back to origin point if driver should be more soc specific or not.
> 
> I think no issue with AMD prefix.

Agreed.

> 
> BRAM - that's technology used for access. And I see value in symbol to state
> it because access to different memory can be done differently too.
> 

Agreed.

> Shouldn't be there any soc string? This is for zynqmp, versal* SOCs that's
> why hard to choose which one.
> 

Why not just adding a Zynqmp somewhere in there?  But admittedly, the relation
between Zynqmp and MicroBlaze/V is unknown to me.

> The driver is written in very generic way that if there is arm, mips, ppc,
> different risc-v or others access will be the same. Our primary target is
> obviously MicroBlaze/V and I don't think it is a problem to change
> description to just reference them even it is technically possible to
> connect different cpus too.
> 
> Is this enough?
> 
> -	tristate "AMD BRAM-based remoteproc support"
> +	tristate "AMD MicroBlaze/V BRAM-based remoteproc support"

Yes, that would be just fine. "AMD Zynqmp BRAM-based remoteproc support" would
also work.

> 
> Are you fine with AMD_BRAM_REMOTEPROC symbol name?

AMD_MBV_BRAM_REMOTEPROC or AMD_ZQ_BRAM_REMOTEPROC

I'm good with anything that is slightly more descriptive, just pick the one that
makes the most sense.  

> 
> Thanks,
> Michal
