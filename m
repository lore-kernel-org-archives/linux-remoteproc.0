Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B1627A108
	for <linux-remoteproc@vger.kernel.org>; Tue,  1 Jul 2025 15:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383659; cv=none; b=e+5xe4oPUKkysNr4ErfAff6tnAxTKrHE7kT1la05gE2Huo+yiRfUwr5qG+95fvaLzDBL1wX5TKX3rHSDbUwZNI5REoYXdl/h0h9tW+wpbbWtN2EN4HGFyPwTVWeYi8ki5J5KnD0D094H4alDBEnEN5z9TkBzAV1Dbu7fNUs3aiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383659; c=relaxed/simple;
	bh=9liZjkpuVRzepUk67tgGkXDJwUW2A930piJLEnM5Yb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wzh/nQL4Z2Au/Ke6E8sKBWyLRbdZ0l+hinHy0ijvBIIM9xTK7s6ZnYcp1eUY0ko6HTrFbYSt1qJgZuW/aO38ZegKZlC6ap0/KlqivNNXb6Ng2M0WHyz5T60N21XZJkbnHshK303ICxOEa/HNF6Q3kqJGs0WTGaohzlpFTLb7mqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tKLpF9Uf; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tKLpF9Uf"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-74af4af04fdso4228590b3a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 01 Jul 2025 08:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751383656; x=1751988456; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/0SAjT3Kg+X8y37BzmTeLChqfzpi9tbPWxRH4vKr8Jw=;
        b=tKLpF9UfPmGeQ0TxU6gGzERL4IxjvlYihUxbI0RXvJSOLj4qv8Lf4hL6NsVLMq8mV/
         56QGQUjpp3IY08KF6FxrOKC0zppONE7f1EdZ6LgNjTsTnJ8vcq6zwX3jefqKs7tBOiaH
         vnsYZmFSnI+9FEB2OdksKj1jjNzeAf5DtxG1ZhGTihecSzQaDx37lOKxk/IyRFPl9+yG
         o5Qqcy6oOhn8L1FtEdR7xoREPRNWkOlQ13mFrSnzosbV93jEvXcv9o+xuFLLNfl5qylm
         m+jM+QODc5ZvxtO2umjKw5Khq3F5VZHNFeYJ9xWPAFmZnx9zpkxVPHUgT3ARj30dRs5r
         amMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751383656; x=1751988456;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/0SAjT3Kg+X8y37BzmTeLChqfzpi9tbPWxRH4vKr8Jw=;
        b=iwNdz0POkPk6mhrHMMmAwQIChyh79hrdFsqcHp+ucn4IfnZlT+1p6of7OC4Pp8X/hU
         1q86srsl4+YeOfFY6i7ZT1cz4m+U+eN9bQuEwZeNkWCSWhBDCTkMIlpcGMeVWuqD7NU0
         ZQ3+qhDFd7gneXuseOD24PQG5l7YGoWfgv3A8C00kdEy+LWfKm4+Xj0i3TcAcgu24Tdn
         qyxCDPBST6jMrry9pVPuEUr4NWteCtKar9RBArFD6I04RiaCnPRhWpYI7j8LDm2XRjoJ
         oOYrsykBwlt0qoFYBgY/SJ1ueZUm6PHi+Fj3CockEzeoPmLVCGGTLFkpB//3/diXR7Wz
         kNBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy1iO0Eh2Im1Hd7OPYb8917+xPiZ35SYos1EjfW4jrZi81CEPRHopHZJJZCIGJ/os41YbOoBjZU0yOTyKlPwha@vger.kernel.org
X-Gm-Message-State: AOJu0YyqXuy6JaSdbbduAuYrin1iwPJjQVXj3LhGEkFUYFAnYwGRnyT0
	GkHXD7Fuhm+72IPXzl3KA3Li8XpzUjvZoA2sm5Yhf7JmF3dBYTM77zvQmrqfHeAmTJE=
X-Gm-Gg: ASbGncuu+Uq6JJJIlZv8FvugPv/YrXXr/n0b2xqM17vyghI9NmvdIqVaMgmANDNsV6m
	LkOYxy4shXqUCGktwqQvQVsBmZIy0ZvvHdBDinQv7vm2vAAS1YcSMdz57KpERWWPEhSKISmz9Sy
	DGMVXNONfZJEJgHtyGobQXMhH3aHfEd9VV5+nzO4aSjKKPfnq2GM5F2lhNLPZz0SPII6vPSC2k1
	dky0kKZRhHvnROarsTO4VXVQc94Rpt+0KycVgd0LHUwSe3O08A+nyhOcnRHaREtSdQmmxuOKZuS
	QGiPhomUIJBkoV7BK5KCaHxsc8W34y4UDBOVSKHvlD03xL6ucMoZnnWtu1BKioDj+g==
X-Google-Smtp-Source: AGHT+IHwXE6TtTbogZXGrSWNeH17X1Eg9b1iMZBmFtEaqZg3w/0LyLCHYU1l4YImcwX/ylYXOnxCQw==
X-Received: by 2002:a05:6a20:914d:b0:220:8ccc:2feb with SMTP id adf61e73a8af0-222c99ba442mr6683521637.12.1751383656024;
        Tue, 01 Jul 2025 08:27:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:94b9:2bc2:7ead:7a72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ef4dbsm12287004b3a.160.2025.07.01.08.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:27:35 -0700 (PDT)
Date: Tue, 1 Jul 2025 09:27:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iuliana.prodan@nxp.com,
	daniel.baluta@nxp.com
Subject: Re: [PATCH 2/2] remoteproc: imx_dsp_rproc: Add support of coredump
Message-ID: <aGP-ZVuhBdd1GPLe@p14s>
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-3-shengjiu.wang@nxp.com>
 <aGLBvXtSRlaKujqM@p14s>
 <CAA+D8AO4o7dqTyL4aZ+H5VnroTQUNAHM-io5rvJ2r_sasPYs9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8AO4o7dqTyL4aZ+H5VnroTQUNAHM-io5rvJ2r_sasPYs9g@mail.gmail.com>

On Tue, Jul 01, 2025 at 10:28:33AM +0800, Shengjiu Wang wrote:
> On Tue, Jul 1, 2025 at 1:05 AM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > On Wed, Jun 18, 2025 at 02:26:44PM +0800, Shengjiu Wang wrote:
> > > Add call rproc_coredump_set_elf_info() to initialize the elf info for
> > > coredump, otherwise coredump will report an error "ELF class is not set".
> > >
> > > Remove the DSP IRAM and DRAM segment in coredump list, because after
> > > stop, DSP power is disabled, the IRAM and DRAM can't be accessed.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  drivers/remoteproc/imx_dsp_rproc.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> > > index 9b9cddb224b0..9e7efb77b6e5 100644
> > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > @@ -738,9 +738,7 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
> > >               mem = rproc_mem_entry_init(dev, (void __force *)cpu_addr, (dma_addr_t)att->sa,
> > >                                          att->size, da, NULL, NULL, "dsp_mem");
> > >
> > > -             if (mem)
> > > -                     rproc_coredump_add_segment(rproc, da, att->size);
> > > -             else
> > > +             if (!mem)
> >
> > Flag rproc->recovery_disabled is never set to true, meaning that since this
> > driver was introduced, some kind of recovery was available.
> 
> Actually since this driver was introduced, the recovery can't work.
> We didn't test the recovery function before. sorry for the mistake.

Let me see if I get this right:

(1) Almost 5 years ago you sent me a driver with code you did not test.
(2) It took all this time to realize and fix the problem.
(3) I should trust that, this time, you have tested your code.

Did I understand all that correctly? 

> 
> >
> > I worry that your work will introduce regression for other users.  Daniel and
> > Iuliana, once again have to ask you to look at this patchset.
> >
> > Thanks,
> > Mathieu
> >
> > >                       return -ENOMEM;
> > >
> > >               rproc_add_carveout(rproc, mem);
> > > @@ -1203,6 +1201,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
> > >               goto err_detach_domains;
> > >       }
> > >
> > > +     rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
> > > +
> > >       pm_runtime_enable(dev);
> > >
> > >       return 0;
> > > --
> > > 2.34.1
> > >
> >
