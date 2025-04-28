Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C7B26982E;
	Mon, 28 Apr 2025 14:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745849434; cv=none; b=t6JO1QsU5EaZjHA/7RdLNo4ZUFZmIIj3SI2wKzG3Mn46A0HhKmkf0kpZ30rK8Ml0OJqSBVFD5HdeMq7Q+LHIKT5C6uehuUzGut+caXCaetXTtOgO1mhwyPUm51/gQqYo48E1HrpCHKGR4NTTJNYw2QeRx+78wRaoSn+yxZTv0jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745849434; c=relaxed/simple;
	bh=BOuEWK+UmYfg4VYZdZhbRi1314+0MdlONTfS2GDO590=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8Q/WvOGHDNh9G4AHuGrVihu9yUl1Z6N5H19fuDF+bJ7+dPD57t3qAsaQta+KsoBgtIffa1eje27RhFTlGJNWas+u+R6cE5HdZbNKkJqmx2/Pc5Nn53aJ2fCS62KldxUNgoZVx+GqUImrrJjsbWqKhEPST6Iqy/AzXcHsYRRSk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXoPNepp; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXoPNepp"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736a72220edso4792725b3a.3;
        Mon, 28 Apr 2025 07:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745849432; x=1746454232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GEvTqKjHd/gxofN54tYASAmooBFL0e/b3JPxl2GoRUQ=;
        b=EXoPNeppOu7B/N8Wu+AhlRh05xFXtWErbGzfQKN3X094s598m5LnoCqcV8P5zKpXRD
         Y20HB35i3sLUz1v1Ed8HJP4qPV/1ppBffdOI26Vl+xMoKnPVY7OB0YCGzOBgGiZblZ0v
         0cLoZxuOkk1HtGFD8CbANvnysI70UMRdTBwCrAskFss001Fy7u/9WVUCoQCXGLeBb3U9
         OVxlJb24QeT0uwnTKKTb51AT/50HPX0UR+/GcfG8FMHB9NZPivnaNVsJXVdc4BIF7qug
         bdostMv6nj9nDu/u3MLNKTkMYMhtwUAhKwJpKxT2kL/13UjZGXo2aGWSyuEMXhS5peC0
         yUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745849432; x=1746454232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEvTqKjHd/gxofN54tYASAmooBFL0e/b3JPxl2GoRUQ=;
        b=KpdGzgd9BP/yXSWlzb1P8mFBMmFtASInhARFE09/f0FdCkGf5+JYTMsTUvhiAV1/WG
         r/nywgp3T5xVv9F6Xmx5kyz1niHDBbA+mFNTeMRSV28cGtJ00Sfyd2yXYnuvZrW1aDW3
         Ts6x/68EqCb6MUTyzxPHqNdWNPRk+KwUiYfr8bgpuoVq4Hqt5TL4ShByQzQpMhsUuI3r
         RaAUygrLfArRtqbyczAKsi7KNgj8vnA9ophUEsxmH9mdB3u9eRu/241fipOAq0NIoLIA
         yxzBN3x2RfdUy0uuPlA1i/9Q488ZhZBddWWyb8qsrPpoc6kuJKgpYQne4LT3EfaaoCCV
         65SA==
X-Forwarded-Encrypted: i=1; AJvYcCUT+GPvR8xR64WhMh/+bjoPx8X6n7EjgnL6vxXzG4m4yDhlZfjJeRDjOoAJ+dvVZ6eGXqQPtF23boO+41M=@vger.kernel.org, AJvYcCXbPdKwgGBu2U8nFLhuMM8w7+xckGyxXudlgMAOXBLy8Qjuf2UtWpsAhCrSzD0X9ZkEmCef8Y3YnltghQ9GKA4S/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD8OGPzYMyo5SwSQHAj1ou/jbWWUKelNhdwZyRsI3T68hawW+a
	mukEyn/P4ZtrOfPTi5Oe+JNxaS40v04fGH0QsYmROXeRVEdrZLHK
X-Gm-Gg: ASbGnctdD9P98YiB4xb43nonmED8zZrzZBtXyTb61qyatZoctU+4ZaQgvEH0BnplsZs
	SSZkCWMRCC9oluUBV6vret0k6FCYCNXG4Yht5KG1Uf3hQZPzAe+4ArHuQ+vE+YVuKJ5mHvMY7Yd
	Q12NZu+vrGTNiJkmL3N5XXHBYxh2qsCyGRooPzY5PafmmiQJnpvBtx8xNBfhMJJrHduS0eZophc
	Nmbqvi/WZz7+JtDvscMOJ0VrqWJqnP7A7YGJq7oqbz+D2Rbpcfk2Zx72y+nV8QqFjJ7BjtYyJ04
	5rlPhDE/nDzdpwotH/rcHAcP5WGOVJ3coA/ce3A=
X-Google-Smtp-Source: AGHT+IFPQFBivSHKCoihIOXfE6lIJJ5LhZaUT+yQbp62PbM2nBEezYpi5ZMGrhr3CBfTWdfDJQ3wig==
X-Received: by 2002:a05:6a00:2382:b0:730:99cb:7c2f with SMTP id d2e1a72fcca58-73fd6fdd3aemr14893591b3a.6.1745849431973;
        Mon, 28 Apr 2025 07:10:31 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e2593f621sm8002237b3a.39.2025.04.28.07.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 07:10:31 -0700 (PDT)
Date: Mon, 28 Apr 2025 11:10:26 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com, linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: replace devm_clk_get() with
 devm_clk_get_optional()
Message-ID: <20250428141026.pvbk5qrgflv4wkak@hiago-nb>
References: <20250423155131.101473-1-hiagofranco@gmail.com>
 <aAkf6bxBLjgFjvIZ@p14s>
 <20250423192156.b44wobzcgwgojzk3@hiago-nb>
 <20250426134958.GB13806@nxa18884-linux>
 <CANLsYkzLZKHpwv+Zz7YqtU4NCy7ZmapuzpgtfxsRfoV=Ve8rVg@mail.gmail.com>
 <20250427020825.GC13806@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427020825.GC13806@nxa18884-linux>

On Sun, Apr 27, 2025 at 10:08:25AM +0800, Peng Fan wrote:
> On Sat, Apr 26, 2025 at 03:47:50PM -0600, Mathieu Poirier wrote:
> >On Sat, 26 Apr 2025 at 06:41, Peng Fan <peng.fan@oss.nxp.com> wrote:
> >>
> >> On Wed, Apr 23, 2025 at 04:21:56PM -0300, Hiago De Franco wrote:
> >> >Hi Mathieu,
> >> >
> >> >On Wed, Apr 23, 2025 at 11:14:17AM -0600, Mathieu Poirier wrote:
> >> >> Good morning,
> >> >>
> >> >> On Wed, Apr 23, 2025 at 12:51:31PM -0300, Hiago De Franco wrote:
> >> >> > From: Hiago De Franco <hiago.franco@toradex.com>
> >> >> >
> >> >> > The "clocks" device tree property is not mandatory, and if not provided
> >> >> > Linux will shut down the remote processor power domain during boot if it
> >> >> > is not present, even if it is running (e.g. it was started by U-Boot's
> >> >> > bootaux command).
> >> >>
> >> >> If a clock is not present imx_rproc_probe() will fail, the clock will remain
> >> >> unused and Linux will switch it off.  I think that is description of what is
> >> >> happening.
> >> >>
> >> >> >
> >> >> > Use the optional devm_clk_get instead.
> >> >> >
> >> >> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> >> >> > ---
> >> >> >  drivers/remoteproc/imx_rproc.c | 2 +-
> >> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >> >
> >> >> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> >> >> > index 74299af1d7f1..45b5b23980ec 100644
> >> >> > --- a/drivers/remoteproc/imx_rproc.c
> >> >> > +++ b/drivers/remoteproc/imx_rproc.c
> >> >> > @@ -1033,7 +1033,7 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
> >> >> >    if (dcfg->method == IMX_RPROC_NONE)
> >> >> >            return 0;
> >> >> >
> >> >> > -  priv->clk = devm_clk_get(dev, NULL);
> >> >> > +  priv->clk = devm_clk_get_optional(dev, NULL);
> >> >>
> >> >> If my understanding of the problem is correct (see above), I think the real fix
> >> >> for this is to make the "clocks" property mandatory in the bindings.
> >> >
> >> >Thanks for the information, from my understanding this was coming from
> >> >the power domain, I had a small discussion about this with Peng [1],
> >> >where I was able to bisect the issue into a scu-pd commit. But I see
> >> >your point for this commit, I can update the commit description.
> >> >
> >> >About the change itself, I was not able to find a defined clock to use
> >> >into the device tree node for the i.MX8QXP/DX, maybe I am missing
> >> >something? I saw some downstream device trees from NXP using a dummy
> >> >clock, which I tested and it works, however this would not be the
> >> >correct solution.
> >>
> >> The clock should be "clocks = <&clk IMX_SC_R_M4_0_PID0 IMX_SC_PM_CLK_CPU>;" for
> >> i.MX8QX. This should be added into device tree to reflect the hardware truth.
> >>
> >> But there are several working configurations regarding M4 on i.MX8QM/QX/DX/DXL.
> >>
> >> 1. M4 in a separate SCFW partition, linux has no permission to configure
> >>   anything except building rpmsg connection.
> >> 2. M4 in same SCFW partition with Linux, Linux has permission to start/stop M4
> >>    In this scenario, there are two more items:
> >>    -(2.1) M4 is started by bootloader
> >>    -(2.2) M4 is started by Linux remoteproc.
> >>
> >>
> >> Current imx_rproc.c only supports 1 and 2.2,
> >> Your case is 2.1.
> >
> >Remoteproc operations .attach() and .detach() are implemented in
> >imx_rproc.c and as such, 2.1 _is_ supported.
> 
> For i.MX8QM/QXP/DX/DXL, attach/detach is for case 1.
> 
> To support case 2.1, more code needs to be added in imx_rproc_detect_mode,
> 
> Something as below(no test, no build, just write example):
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 09d02f7d9e42..eeb1cd19314c 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1019,6 +1019,9 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>                         if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
>                                 return -EINVAL;
> 
> +                       if (imx_sc_cpu_is_started(M4X))
> +                               priv->rproc->state = RPROC_DETACHED;
> +
>                         return imx_rproc_attach_pd(priv);
>                 }
> 
> 
> When we let uboot to start M4(case 1), we(NXP) only wanna to add some test
> code in U-Boot. Not intended to make it for remoteproc
> 
> But if there are users wanna case 1 in their product, we could support it,
> 1. adding cpu state detection in drivers/firmware/imx/
> 2. Use the cpu state API in imx_rproc.c to detect cpu is started by bootloader
>    when the cpu is owned by linux.

Thanks for the information Peng. I think the way forward is clear now, I
will prepare the patches to address the 2.1 use case (bootaux).

> 
> >
> >>
> >> There is a clk_prepare_enable which not work for case 1 if adding a real
> >> clock entry.
> >>
> >> So need move clk_prepare_enable to imx_rproc_start, not leaving it in probe?`
> >> But for case 2.1, without clk_prepare_enable, kernel clk disable unused will
> >> turn off the clk and hang M4. But even leaving clk_prepare_enable in probe,
> >> if imx_rproc.c is built as module, clk_disable_unused will still turn
> >> off the clk and hang M4.
> >>
> >> So for case 2.1, there is no good way to keep M4 clk not being turned off,
> >> unless pass "clk_ignore_unused" in bootargs.
> >>
> >
> >Isn't there something like an "always on" property for clocks?
> 
> There is CLK_IS_CRITICAL flag that could be added in clk driver, but this
> is harcoded in clk driver. Using this flag means for case 2.2, there is no
> chance to disable the clock when stop M4.
> 
> There is no device tree property to indicate a clk is always on as I know.
> 
> Regards,
> Peng
> >
> >>
> >> For case 2.2, you could use the clock entry to enable the clock, but actually
> >> SCFW will handle the clock automatically when power on M4.
> >>
> >> If you have concern on the clk here, you may considering the various cases
> >> and choose which to touch the clk, which to ignore the clk, but not
> >> "clk get and clk prepare" for all cases in current imx_rproc.c implementation.
> >>
> >> Regards,
> >> Peng
> >>
> >>
> >> >
> >> >[1] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
> >> >
> >> >Cheers,
> >> >Hiago.
> >> >
> >> >>
> >> >> Daniel and Iuliana, I'd like to have your opinions on this.
> >> >>
> >> >> Thanks,
> >> >> Mathieu
> >> >>
> >> >> >    if (IS_ERR(priv->clk)) {
> >> >> >            dev_err(dev, "Failed to get clock\n");
> >> >> >            return PTR_ERR(priv->clk);
> >> >> > --
> >> >> > 2.39.5
> >> >> >

Cheers,
Hiago.
