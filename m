Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B8A2737E7
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 12:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976096; cv=none; b=Pzgp/RSZE61+uq9KtjXaDggzGzbwKKkRa7i57kFK8hX6V96ZcBtytMw4Et85LWdRZeIpU9kZOv5jnKyrZugGiiWnG4sMBZQYYed7Tjredm2ERki2ZTq99YbZmxWlA5RzWkmjyxkWHBFmzifn7nuH83j3Gj3NlzDNeHC5vlKUAEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976096; c=relaxed/simple;
	bh=G4F2uaGJQmt7bSFp2+IgrlP6CrHtglRAzxQKVYY8gok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBvfN1WitYHd8NsEJc7vv0US/KL5YEV6W6ehbOGVjrkTyG8cZ5NZWHiwUYTAIp5IgwKdLnU4iyvZ6lQjNc+gyZjE5hlfsiem+8GPqXyQ3nJoKnX0AaI660clrGu60Q/PjGfUCqGt9yVQCnw5lJZJRax8fPPf5KecLoiMR+LDH2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYlvhW1j; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYlvhW1j"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0f3f74587so40649735ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 04:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765976094; x=1766580894; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WB9IDMyF7C6rUTb7bWFFG4m+8S18M2qqzE6q3X6CiU=;
        b=SYlvhW1jG3cFUro/PJNxE13VJMj4FBm73WAbkEG3B0fB0iKlT+yqCt0uJ06ue4db5H
         B3aGcs3Uc0kNaSYCrGFbmiLpk+5J84PUqIZDzIpiB6yvLVaw+z78Bv2EIE0RuqWuDa4d
         HJx4vd0TdfTrSdsly1rzmXQ6EHiHwQ6bgH7N/9/HK7m5bD/6q/SHTpFsIGoU6eBojPz0
         UumNCGuNDx3sr/BQY0CYS8MtXM+c8RMA1xDcxDTvLWfpIGZ0lFih1duq8ue7GFhb8UpL
         AhUYXl+dPlsfnb4cUW/QK9SVQMycuamoLtuI2wvjgYNUwSe7Ri5DUkAAjmqXymQahbcB
         0eNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765976094; x=1766580894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1WB9IDMyF7C6rUTb7bWFFG4m+8S18M2qqzE6q3X6CiU=;
        b=WVMbPEXjdrbkJWp4AmkMY4yiWTBdsN8gK09ZA5z4ywIWYe0r/5GCnIL6IWiYXvSKlW
         P+NnMrtQe7TD6osvKvRHQD6dHuRJudKfTeRToP8gRRyyVKDQo9PzjDHoutUrw4PTNHgz
         KINA0MPD5mcBqzrZW6qnvp+AY1raq+4xk4gv1mFI416kuK787nRFt8qRQVgpM0VNa5R7
         t4/XaR6fX+MJ5m4Oh+t9z/Mgk431kTWHmM9P+HMSGZUNuxCPEVrsvz+sTkz7H2YfTutg
         DD0D+1/DXfvKBRnVx12VyGhdzkxKvDCQgfpx55Wn/1wTN/EC3M/967hypcJp/DRdTS3U
         2BBw==
X-Forwarded-Encrypted: i=1; AJvYcCVl1KPQiczTZCPnBIB6FbjZOJYxtpwLl22Xzfpj1gryUp+fAh5TkLRrRRIyHE5lZW6o1+UizfkEdQKRvEPxb/Iy@vger.kernel.org
X-Gm-Message-State: AOJu0YzxOpk5yf3iG5sx+PaQZiKdaPadHrQtJ/wow7QR/7/ykhvSzxq1
	QkqtPgpFO4Le0ZXfFDrxtztZvanAJPTy0kegjmhZjdVDEqWQPd/uth+0ucRuYQyStwNsSZt3nD0
	SZcR2+OH45sqlaMRNXpLxWtrcSMVQG+k=
X-Gm-Gg: AY/fxX6jKxTAb2yuJ/S/nwBlK13lnacNzq997d2cydihnBdetAW+lzt7kI/vwoVvdr4
	MnlmvKqd3sqKb3fNQsIbCKZdsjs/1jMHsbmv/ie75rsLUGdAKB8DsqAbIKN0qsgZfJ4CGM7bSEM
	VdBjIlGeSI3q2gxbMAyRt0zQo3qOJh2SolBx1nLTgfITlOPsvhXH/DzyisRX6nt+zTl5IvYPgA+
	pf+1rVp4EiKfnQeyaob7B9EnqxTdODCKK+4BLvCLhytjsHDiD1xRckxmho+dVpTf4FqU1WarIDl
	UjeucCvJA5jIiB4Ti2wEO9N0W3eM8o61PS+hmcBqgfHhNjzatbHrlNo0CaXQ6HEmUaezR5ZKPC/
	lbIWq17AptA==
X-Google-Smtp-Source: AGHT+IFCVxVZKfQazz0Hf+zlDf4DPsGc7oERAwp/C9jL/RfYpJUNkkyKQjqWAoT+yyXwjrVLjDdhD4cpWBi7QA+Z/RI=
X-Received: by 2002:a05:7022:4393:b0:119:e569:fb96 with SMTP id
 a92af1059eb24-11f354776a3mr16162731c88.5.1765976094025; Wed, 17 Dec 2025
 04:54:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251210154906.99210-1-daniel.baluta@nxp.com> <aUHZaapZ1IAs_mRE@p14s>
In-Reply-To: <aUHZaapZ1IAs_mRE@p14s>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 17 Dec 2025 14:57:24 +0200
X-Gm-Features: AQt7F2pCrjbzUdKtcqyy6UJ2W0Ki6ZTb9uglvOiXJFQ03JP1g08LOHMbnAHpvt0
Message-ID: <CAEnQRZC0WU+MGfZ5z3yJCz==MBCcFG4BUwNs2v1ABOMkiRbPrw@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: imx_dsp_rproc: Fix multiple start/stop operations
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, andersson@kernel.org, m.szyprowski@samsung.com, 
	shawnguo@kernel.org, kernel@pengutronix.de, festevam@gmail.com, 
	arnaud.pouliquen@foss.st.com, robh@kernel.org, geert+renesas@glider.be, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	iuliana.prodan@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 12:13=E2=80=AFAM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Good day,
>
> On Wed, Dec 10, 2025 at 05:49:06PM +0200, Daniel Baluta wrote:
> > After commit 67a7bc7f0358 ("remoteproc: Use of reserved_mem_region_*
> > functions for "memory-region"") following commands with
> > imx-dsp-rproc started to fail:
> >
> > $ echo zephyr.elf > /sys/class/remoteproc/remoteproc0/firmware
> > $ echo start > /sys/class/remoteproc/remoteproc0/state
> > $ echo stop > /sys/class/remoteproc/remoteproc0/state
> > $ echo start > /sys/class/remoteproc/remoteproc0/state #! This fails
> > -sh: echo: write error: Device or resource busy
> >
> > This happens because aforementioned commit replaced devm_ioremap_wc wit=
h
> > devm_ioremap_resource_wc which will "reserve" the memory region with th=
e
> > first start and then will fail at the second start if the memory
> > region is already reserved.
> >
> > Even partially reverting the faulty commit won't fix the
> > underlying issue because we map the address in prepare() but we never
> > unmap it at unprepare(), so we will keep leaking memory regions.
> >
> > So, lets use alloc() and release() callbacks for memory carveout
> > handling. This will nicely map() the memory region at prepare() time
> > and unmap() it at unprepare().
> >
> > Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* function=
s for "memory-region"")
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> > Changes since v1:
> >  * https://lore.kernel.org/imx/091a4f29-5435-428a-9a1c-ef82465211cb@nxp=
.com/T/#t
> >  * took a different approach and instead of partially reverting the
> >   faulty patch, used alloc() and release() callbacks to handle memory
> >   region mapping.
> >  drivers/remoteproc/imx_dsp_rproc.c | 50 ++++++++++++++++++++----------
> >  1 file changed, 33 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/im=
x_dsp_rproc.c
> > index 5130a35214c9..83468558e634 100644
> > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > @@ -644,6 +644,32 @@ static void imx_dsp_rproc_free_mbox(struct imx_dsp=
_rproc *priv)
> >       mbox_free_channel(priv->rxdb_ch);
> >  }
> >
> > +static int imx_dsp_rproc_mem_alloc(struct rproc *rproc,
> > +                                struct rproc_mem_entry *mem)
> > +{
> > +     struct device *dev =3D rproc->dev.parent;
> > +     void *va;
> > +
> > +     va =3D ioremap_wc(mem->dma, mem->len);
> > +     if (!va) {
> > +             dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> > +                     &mem->dma, mem->len);
> > +             return -ENOMEM;
> > +     }
> > +
> > +     mem->va =3D va;
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx_dsp_rproc_mem_release(struct rproc *rproc,
> > +                                  struct rproc_mem_entry *mem)
> > +{
> > +     iounmap(mem->va);
> > +
> > +     return 0;
> > +}
> > +
> >  /**
> >   * imx_dsp_rproc_add_carveout() - request mailbox channels
> >   * @priv: private data pointer
> > @@ -659,7 +685,6 @@ static int imx_dsp_rproc_add_carveout(struct imx_ds=
p_rproc *priv)
> >       struct device *dev =3D rproc->dev.parent;
> >       struct device_node *np =3D dev->of_node;
> >       struct rproc_mem_entry *mem;
> > -     void __iomem *cpu_addr;
> >       int a, i =3D 0;
> >       u64 da;
> >
> > @@ -673,15 +698,10 @@ static int imx_dsp_rproc_add_carveout(struct imx_=
dsp_rproc *priv)
> >               if (imx_dsp_rproc_sys_to_da(priv, att->sa, att->size, &da=
))
> >                       return -EINVAL;
> >
> > -             cpu_addr =3D devm_ioremap_wc(dev, att->sa, att->size);
> > -             if (!cpu_addr) {
> > -                     dev_err(dev, "failed to map memory %p\n", &att->s=
a);
> > -                     return -ENOMEM;
> > -             }
> > -
> >               /* Register memory region */
> > -             mem =3D rproc_mem_entry_init(dev, (void __force *)cpu_add=
r, (dma_addr_t)att->sa,
> > -                                        att->size, da, NULL, NULL, "ds=
p_mem");
> > +             mem =3D rproc_mem_entry_init(dev, NULL, (dma_addr_t)att->=
sa,
> > +                                        att->size, da, imx_dsp_rproc_m=
em_alloc,
> > +                                        imx_dsp_rproc_mem_release, "ds=
p_mem");
>
> Was there a reason you kept those here rather than moving them to probe()=
 as
> Iuliana suggested?  Note that I would be fine with this solution since th=
is is
> how it was before, but if we have to go through a refactoring we may as w=
ell
> take those things into account.

Tried moving imx_dsp_rproc_add_carveout at probe() time but it doesn't work
because stop() will clean the carveout list and then the next start() will =
fail.

at probe()
imx_dsp_rproc_add_carveout
-> rproc_add_carveout (adds allocated carveout to the list).

at start():
   -> first start OK

at stop()
   -> rproc_shutdown
       -> rproc_stop
       -> rproc_resource_cleanup ;//cleans up careveout allocations

at next start()
     -> CRASH
