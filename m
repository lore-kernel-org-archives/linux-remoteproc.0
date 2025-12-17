Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E0A2D24A0
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 20:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766001938; cv=none; b=m1dXvPBbMfycoixFP4ZPtT2nGEDUm2pq/OuAbzDyyL8m8CT8dZWULLwYG2HZhjRFp+0v8WGrU7oEJ0CL5kSsP+ScHChxEW792TT+FZuh+JkzNl5hX4ITOYGW0wl7xCfj/qfdGedjoHZLsfRVIuOLv88ZS0Xc+/83rsPOSWd0Yx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766001938; c=relaxed/simple;
	bh=kHsJJXikGda2OOJmHWSibF48zid1V8ZPxUY3m+9TzjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5TEgm6nXsg6Iu0Spx+NAe0+QXdQPEKoHLQhHuW5dkfPf9NnlCof/fjTzEu4YSxU6qmIsm/p/SVAJOZDE8ZbJIoouNO1y873nWV33nkQhqv4H537CqFD0iJYwq/aQsCeHH446x0DbuGiZIZMXsQYwkVYWz2CzyImvXxFb51yENg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZFyBq+vn; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZFyBq+vn"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so7098690b3a.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 12:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766001936; x=1766606736; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KkZw88bP/WyfJ8Slp31S2XqQ4vEo9HvTWj1BeMFalg4=;
        b=ZFyBq+vnpqjFqYft7rNblDaGlDDRNxeWEM4zSf7xWB+HMd72Stjsg+lbug9DFzRdwb
         nXRSz+X7KetCcFqnk7wYuWA6F1+pCYTzYDd+ehiLs7Y4I5lIG/KDqryM5LReCprd9fOV
         zKi+B6DCcGRDYrN8i/DdSE2xkX3J2j74Uaxj63wewiddHzv1Ei0Eyy1NJDsk1zrlEAT2
         Bz+uG05N6+QTaqgLev0gJGUTcsQAHlLNwJh4M+4uR2rCe4ZNDOZ0FyzrnvWvERjnkdEM
         y1yF8HRpidpVxopInqLvVRoQu7iwB4f7WbcSsJfPwI4LSAk9Kc9Cl+9880FNMZoWy1eZ
         DxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766001936; x=1766606736;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KkZw88bP/WyfJ8Slp31S2XqQ4vEo9HvTWj1BeMFalg4=;
        b=wCadax2SVv8QjCQXGMuIpuM90XAGyfqppJv3hbc2CAWcIvf+yzeAokuLiP/d66NfGp
         2yTDx6i5LIsGvMZBlV0FviD+a9fy6TI7CGPeF6IFJpw7nci3tfqGAk2AONGsQP+B1p+O
         xEtw2zvFjuCT+EZ2OYKKaOQIgyt7Mt2dRreBD3Kmjgbq19bMY5A/bJIpvqMdtt5UIAtV
         lrLQGRkkZyafGxxeqOCFpfPYcxTjNdm7h1XOb6VGcQim3JQaZuZ7DPdTNqRpwAZhKlR7
         RtptSdk/jGQjPCdUJLsbp480ApxHPn0O4ZTJCqVPcxnShPjmJplqGRRD3W5Qv64xw+QE
         JObw==
X-Forwarded-Encrypted: i=1; AJvYcCXz2VhLzaVvqUDj8+IlU6J3lX1lj0sIUtVI8OxcDPMJNmzIke6FU7OywV7MOxcLgM6C9gr07S2kvOsuqtaWgh5M@vger.kernel.org
X-Gm-Message-State: AOJu0Yws8/qQ7/+rrUTKIbmcNW7Ehvk5p0VN7ZibWSdDKX7702bgf5kd
	k48QcVVM/UwCDs9aKOHxhJNVrWETnEF7Gj24ryqzm1lXCUBtrZ0lBnzu7lNmRwk0av8=
X-Gm-Gg: AY/fxX64aG6IhyuXXuYsTgqRTiyy72xZaQcfbuOK6qsm3bEUmc18Zh4qXzDIjWEhEts
	cZucdiTLk3z55bAPz5g4jUlxJfk90638mBg0LhyOsjyvbJsSMjd3rlQdhsyhp/cHezaQufonUJR
	93kvJYP857yZMWPLrj2SNByg+9axC16n99lWItPHSSr9E31OjQxqSxkSSqR24y5VFKtgOF3oD7h
	d2XEEUMMiRCo4kkgwhpxlDn0JBL0W1kboMpnwz/ohRGC+Q01PMzw+Dgh6Q5a+8nd2gdZjd+nhPG
	gQDdHBVXWeVP51snmz2qJVOgbxHxjRgd7q5278SqQ6+OAKFkqu7WM8joi5RVyjcKY038k+ncEae
	9aKCuM3U3hFaE16L6btr3ViGW+9VlOQOV3TjuVVnkWMEXvxqfEabati+/LzZwgau+OC205/lWQj
	V0xMMQHyzBvWCsOaRanFa0Gxs=
X-Google-Smtp-Source: AGHT+IGVFo2yytymuAHw5hqToh3gZn9Ym3kLzhpy9bauNTlCV7XCowv2jhys9XWTGUuET8Vi204aBA==
X-Received: by 2002:a05:6a20:7344:b0:366:581e:1a07 with SMTP id adf61e73a8af0-369afff165cmr18496165637.60.1766001936049;
        Wed, 17 Dec 2025 12:05:36 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:cfb9:c35:9f28:8222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1d304d1909sm206545a12.31.2025.12.17.12.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 12:05:35 -0800 (PST)
Date: Wed, 17 Dec 2025 13:05:32 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, andersson@kernel.org,
	m.szyprowski@samsung.com, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com,
	arnaud.pouliquen@foss.st.com, robh@kernel.org,
	geert+renesas@glider.be, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iuliana.prodan@nxp.com
Subject: Re: [PATCH v2] remoteproc: imx_dsp_rproc: Fix multiple start/stop
 operations
Message-ID: <aUMNDPDgN7ACvry9@p14s>
References: <20251210154906.99210-1-daniel.baluta@nxp.com>
 <aUHZaapZ1IAs_mRE@p14s>
 <CAEnQRZC0WU+MGfZ5z3yJCz==MBCcFG4BUwNs2v1ABOMkiRbPrw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZC0WU+MGfZ5z3yJCz==MBCcFG4BUwNs2v1ABOMkiRbPrw@mail.gmail.com>

On Wed, Dec 17, 2025 at 02:57:24PM +0200, Daniel Baluta wrote:
> On Wed, Dec 17, 2025 at 12:13 AM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > Good day,
> >
> > On Wed, Dec 10, 2025 at 05:49:06PM +0200, Daniel Baluta wrote:
> > > After commit 67a7bc7f0358 ("remoteproc: Use of reserved_mem_region_*
> > > functions for "memory-region"") following commands with
> > > imx-dsp-rproc started to fail:
> > >
> > > $ echo zephyr.elf > /sys/class/remoteproc/remoteproc0/firmware
> > > $ echo start > /sys/class/remoteproc/remoteproc0/state
> > > $ echo stop > /sys/class/remoteproc/remoteproc0/state
> > > $ echo start > /sys/class/remoteproc/remoteproc0/state #! This fails
> > > -sh: echo: write error: Device or resource busy
> > >
> > > This happens because aforementioned commit replaced devm_ioremap_wc with
> > > devm_ioremap_resource_wc which will "reserve" the memory region with the
> > > first start and then will fail at the second start if the memory
> > > region is already reserved.
> > >
> > > Even partially reverting the faulty commit won't fix the
> > > underlying issue because we map the address in prepare() but we never
> > > unmap it at unprepare(), so we will keep leaking memory regions.
> > >
> > > So, lets use alloc() and release() callbacks for memory carveout
> > > handling. This will nicely map() the memory region at prepare() time
> > > and unmap() it at unprepare().
> > >
> > > Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
> > > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > > ---
> > > Changes since v1:
> > >  * https://lore.kernel.org/imx/091a4f29-5435-428a-9a1c-ef82465211cb@nxp.com/T/#t
> > >  * took a different approach and instead of partially reverting the
> > >   faulty patch, used alloc() and release() callbacks to handle memory
> > >   region mapping.
> > >  drivers/remoteproc/imx_dsp_rproc.c | 50 ++++++++++++++++++++----------
> > >  1 file changed, 33 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> > > index 5130a35214c9..83468558e634 100644
> > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > @@ -644,6 +644,32 @@ static void imx_dsp_rproc_free_mbox(struct imx_dsp_rproc *priv)
> > >       mbox_free_channel(priv->rxdb_ch);
> > >  }
> > >
> > > +static int imx_dsp_rproc_mem_alloc(struct rproc *rproc,
> > > +                                struct rproc_mem_entry *mem)
> > > +{
> > > +     struct device *dev = rproc->dev.parent;
> > > +     void *va;
> > > +
> > > +     va = ioremap_wc(mem->dma, mem->len);
> > > +     if (!va) {
> > > +             dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> > > +                     &mem->dma, mem->len);
> > > +             return -ENOMEM;
> > > +     }
> > > +
> > > +     mem->va = va;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int imx_dsp_rproc_mem_release(struct rproc *rproc,
> > > +                                  struct rproc_mem_entry *mem)
> > > +{
> > > +     iounmap(mem->va);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >  /**
> > >   * imx_dsp_rproc_add_carveout() - request mailbox channels
> > >   * @priv: private data pointer
> > > @@ -659,7 +685,6 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
> > >       struct device *dev = rproc->dev.parent;
> > >       struct device_node *np = dev->of_node;
> > >       struct rproc_mem_entry *mem;
> > > -     void __iomem *cpu_addr;
> > >       int a, i = 0;
> > >       u64 da;
> > >
> > > @@ -673,15 +698,10 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
> > >               if (imx_dsp_rproc_sys_to_da(priv, att->sa, att->size, &da))
> > >                       return -EINVAL;
> > >
> > > -             cpu_addr = devm_ioremap_wc(dev, att->sa, att->size);
> > > -             if (!cpu_addr) {
> > > -                     dev_err(dev, "failed to map memory %p\n", &att->sa);
> > > -                     return -ENOMEM;
> > > -             }
> > > -
> > >               /* Register memory region */
> > > -             mem = rproc_mem_entry_init(dev, (void __force *)cpu_addr, (dma_addr_t)att->sa,
> > > -                                        att->size, da, NULL, NULL, "dsp_mem");
> > > +             mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)att->sa,
> > > +                                        att->size, da, imx_dsp_rproc_mem_alloc,
> > > +                                        imx_dsp_rproc_mem_release, "dsp_mem");
> >
> > Was there a reason you kept those here rather than moving them to probe() as
> > Iuliana suggested?  Note that I would be fine with this solution since this is
> > how it was before, but if we have to go through a refactoring we may as well
> > take those things into account.
> 
> Tried moving imx_dsp_rproc_add_carveout at probe() time but it doesn't work
> because stop() will clean the carveout list and then the next start() will fail.
> 
> at probe()
> imx_dsp_rproc_add_carveout
> -> rproc_add_carveout (adds allocated carveout to the list).
> 
> at start():
>    -> first start OK
> 
> at stop()
>    -> rproc_shutdown
>        -> rproc_stop
>        -> rproc_resource_cleanup ;//cleans up careveout allocations
> 
> at next start()
>      -> CRASH

I have applied this patch.

Thanks,
Mathieu

