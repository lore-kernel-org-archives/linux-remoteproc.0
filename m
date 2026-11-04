Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793810402;
	b=gqCrHtgfrMF4pTOVAx0J1mlaFkc9EMk2CRvXHsVwM5PgslzGVbWZ8wLWQM7+MIf9Xg/d
	 tHQgDUi6HXhv9zHuXHXT3+xX+slxvWxdkse5JB5U4jzULvtRX9+QWoA8T3wLyPmObbv9P
	 fDjkIzg0tUDW80eJzmJ13VBcnmaqQ1Or/94Ozw9JD6sNv7eiloZO184bz9+f4VwoPwPWp
	 3dTPvTwaIUGtAv2D+tKAQK1c05GowBvL+zvlMZLD4mBkZYGNlFtENTEnT10Vmsm+aYF0r
	 Vy2g+/u8modoVEXfVaWVSLU/yG9DR0uDPwaR8IRFty19PqAM0qhGbpXE/5K52JLPmHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ica2AeJsSVCzfiGFSHSAqHf7Clww1d8oAWk+wiGvyOc=;
	b=ULA6orxAkLlQMIt8FoJKLrBQNPL05nPOeb2FnEKRFtV2sUmTsEkBUkf0+hhOuLUXJ0/S
	 BMBn08B3dAMbmlW1z5aZjZ7rM7fUrk1/VCB3wU+rrTQU23iLzYzKHRms6stv9MLXcIEpt
	 sYavoD6PwPhrlKyRbTWuKNODcf6mCUjUWLf0JIdy90vkZ7rN/9dpuxYuOSxUZZhLlPZfA
	 9TaU4Hc9SABiyZHY1UqCzU9fQKCdWLm2ReQSazYyO+6JPyHUwFY+8lRPvcEcBtmasuqZm
	 AElSwKaEXgqbuwTVNXBS4Kl23UkOXl5V5dGwyHPWNbNE4fg6uJ9vBGtZTjvwy5/MIHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gbYMDKDt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5982A606A328
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Nov 2026 16:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5982A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gbYMDKDt
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a215e64962so9053095e9.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Nov 2026 08:40:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793810400; cv=none;
        d=google.com; s=arc-20260327;
        b=ouPUjTT+htPtkegooi1x9Yk5w2eJnKCGLQkOU6ztjOa4mqRlPhzT67LXxSakvkZ8v6
         j6rWkXjXMpRs4HH8JXOy6sKZ72kLUR3/MIdSfpRUWQmcnq8h6ZqM6qJd441Ihd9hBl/S
         xdpVEi3Jb5pnsVd6Sj4XNfU2soIiotZsmV9T39Y/GWSPByoUqhRJaXw6IBVz729U7Eu5
         ndTF0PuRkmcfs7JDWxoLEquunSm819N5nn55u7PP3pO4HVaiMVZ4a32H8AfT4CMK63Cj
         KFq1rWh8XoI55HyagD/WsIyzCn4XZUW5+vFkfYyyr5DyO19CHw+qBIczB0UmNI5WTscX
         u1wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ica2AeJsSVCzfiGFSHSAqHf7Clww1d8oAWk+wiGvyOc=;
        fh=rPqtBaeYuTfxrmUQl1QpTMCjxJmaqmJ9DSCZYDEfepM=;
        b=JcEyFgfheRHBWR/k5BfzB8HxAv/r8MfYvBq8V3EeITDYhxbxVCuP+XEAy4tp96d4dJ
         eMxrXv/WVb+rGQUNpmtGJBN0vmrBQT44nHDsxVyL0VupVCaPs35zpLmUzwh4FAha+igC
         AqgZxwO1eM6OMLw1X6o0fREy05DTgMKU72PAW/XWrks+If5w2+sxu+HirS+50mxhVd3d
         uBdB2YXt6jCoEUPbhZ0usOQzDsg8V4y+bTKYDiHjfjslCyTDT9Ef3l9ucU6HIu+cFJWz
         isOAJUqdiR6Ef79kKO2FCfQq26vJOeAMY5ZijJv1yBj7rSVW0lblXeAK9OBAosChFFRY
         PQow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810400; x=1794415200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ica2AeJsSVCzfiGFSHSAqHf7Clww1d8oAWk+wiGvyOc=;
        b=gbYMDKDttZC5ZB/bBqSOID4nCxbOTpVrZA/ywJOOeDHrJCgMmdf/1KKCUKO51RX2ty
         uE6GY5l08Upf9S0zH/lzgzNsBQ7KGuZJdWj9eEhvD2Mf0nb81wYZNQb/WOJVsUm+/wdw
         N5XrJQGR1plIAPVjWLO1ivjZVtKvIujXboASiU8Zfv4M7gpCQl1iMjgIkgnvioYUFInx
         5ViSM0jWm7pHr98NxTtgbvLyGgACTkgtyDAtsO7EUaQCWW/eDLT9DL46GsF9nEHSq1Uf
         AkL3DejH06eS8U30n3zOcjkhfLRjLbAbL4eKQUmsH4MUH3Dsnof2VXBFXr5k8PGPT/32
         XDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810400; x=1794415200;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ica2AeJsSVCzfiGFSHSAqHf7Clww1d8oAWk+wiGvyOc=;
        b=XWTQxRSHxWQzNpNcGR+WS/yLmxKhjZjmRI1JiIDu3K8EQ1Ok8oqVQQCrngOekRjD+x
         iYjvyBknnMYGiCr6y8emtH2lfcwbQl4tXslvDy2jj/q8uXQVU+grNMASBVR3c7PHhVxc
         SulWLu4+SsF6lbzlwC8iSTNGOd41TEfPa3+plu1W9iC1AFNfqUtzl+AlC0ICGUIuFQRm
         4LJTGEunMzaEUJREED7xofTmlD5FCqHkcLLreZSpEHR3b/VCy4IXvpEBxLNLS8xbdKGv
         HLF4hpDYimsB42snWz467KJ7AK1yCpWs0UU9I5BiPTzlWl0ABPx7FCNZ7cZks8CNukCd
         /9aw==
X-Forwarded-Encrypted: i=1; AKwUvByiudPIOL2muDXEraUkRRZci0jln8cTCzKQoL357WqfOh6lSXa52bV5rr3kO3x6CRVvmT9Srvg5d1T78kez8KW2@vger.kernel.org
X-Gm-Message-State: APuU4Z/YwfvvtmyB/YkSbcK57h+ifzxa95FnjhxH2qtt+92dPoyMRGoD
	Xxi5E2E0GTR7mqpw8b8jqrfpAK+zdSliHZ4693UPnBQcasLW8ubd0ZBYaqgoKXgvjEptrBd3Tyd
	MAOBnu9iYIVqfdRTZfQVELQSd3QyR4ec=
X-Gm-Gg: AYBFou1mflSuz1Ev7Dmtc2opoO3ZZXI2/8ajvPXZgCdUNJ9TjyVNR5cgfS+U5bZdI37
	69I5CRXesxfHBmWAaqfZxiZvzDDKx0v+itD+jdTFdZIK0Pvz57/F7TY61fvskArjpGgdPbPRC1E
	TzXlKcxtpIgfmBx4p1qZKi90gH5MibEQyxIPmVHvC8vTEKbWGF44cvTXcFBabRusXdNMXvXj6RU
	kRQhQVgcSyKHg7IgJtjRuFIn/+pc1LemqX4XDKHo8b/vdOdSH1nWR/wPOTrGb0ThMRLIm89hdjd
	A6O/RQVfG2eTMK7sllLNV9J8ahEWj/RAmwSvNvyQbUTcBT45/4J+1oyk/JFw8W28/3cNAWfNYDx
	dumoZodzEe8MghaLRNLXL+mMlrEwUb5/cRdmH
X-Received: by 2002:a05:600c:3b0e:b0:4a7:7d22:c50c with SMTP id
 5b1f17b1804b1-4ac150b2243mr410233905e9.2.1793810399442; Wed, 04 Nov 2026
 08:39:59 -0800 (PST)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029130037.5505-1-izaiahsun@gmail.com> <auoLrJPq9eRAbeQa@p14s>
 <CACdDPuwmyAjC3kje+nYJ3yz7RePg8JzXsKGkzx-Ksxb=-_CZ8A@mail.gmail.com> <autelF5ReC1j7C5Y@p14s>
In-Reply-To: <autelF5ReC1j7C5Y@p14s>
From: Yuqiang Sun <izaiahsun@gmail.com>
Date: Thu, 5 Nov 2026 00:39:47 +0800
X-Gm-Features: AclHuK9kNYyLkUFr4w50ROJ6iC04Nerrhm8DCRYIIi4MOBdCvg2A7K4r9WBabjk
Message-ID: <CACdDPuzvE1Y3MTQWYKLJARJBAuZq1i=zrKYL_aPKqNX5-SfJHQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: core: Do not put the device when device_add() fails
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure. I will resubmit a version with the comment and with shorter changelog=
.

Thanks,
Yuqiang

Mathieu Poirier <mathieu.poirier@linaro.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=
=885=E6=97=A5=E5=91=A8=E5=9B=9B 00:34=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Nov 04, 2026 at 01:47:41AM +0800, Yuqiang Sun wrote:
> > > Unfortunately I do not have the time to read through and digest what =
Claude has
> > > generated in the changelog.
> >
> > Sorry for the long content.
> > There is a human-written summary about the bug.
> >
> > > The documentation for device_add() is clear, and looking at the imple=
mentation
> > > of device_add(), I understand why put_device() needs to be called her=
e.
> >
> > I agree that as documented in device_add, the put_device must be called
> > if it fails.
> >
> > But in st_slim_rproc_alloc() (drivers/remoteproc/st_slim_rproc.c), when
> > rproc_add() returns the error, the driver calls rproc_free() at its err
> > label, which is put_device(&rproc->dev). With the put_device() in
> > rproc_add(), that reference is dropped twice, and the driver uses the
> > rproc after it is freed.
> >
> > The same happens in every other caller: xlnx_r5_remoteproc calls
> > rproc_free() too, and the other 23 use devm_rproc_alloc(), whose
> > devm_rproc_free() does it.
> >
>
> This is the kind of information that is useful to find in a changelog.
>
> > That is why I did not change device_add() or one caller, but
> > rproc_add().
> >
>
> I agree with your assessment.  The problem is that both success and error=
 path
> end up calling rproc_free().  I also agree with your (or the AI's) fix, b=
ut add
> a comment in the failure path of device_add() that explicitly mention tha=
t
> put_device() will be called in rproc_free() to avoid reducing the referen=
ce
> count twice.
>
> And please stop using AI to generate your changelog.
>
> > If necessary, I can send out the full document and PoC on
> > how to trigger the KASAN.
> >
> > Thanks,
> > Yuqiang
> >
> > Mathieu Poirier <mathieu.poirier@linaro.org> =E4=BA=8E2026=E5=B9=B411=
=E6=9C=884=E6=97=A5=E5=91=A8=E4=B8=89 00:28=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Thu, Oct 29, 2026 at 09:00:37PM +0800, Yuqiang Sun wrote:
> > > > When device_add() fails, rproc_add() calls put_device() and then
> > > > removes the character device.  The reference it drops is the one
> > > > rproc_alloc() took with device_initialize(), which belongs to the
> > > > caller: after a failed rproc_add(), every driver frees the rproc,
> > > > either with rproc_free() or through devm_rproc_alloc(), and both dr=
op
> > > > that reference again.
> > > >
> > > > So the rproc is freed inside rproc_add(): by the put_device() itsel=
f,
> > > > or, with CONFIG_REMOTEPROC_CDEV, by the cdev_del() that follows, wh=
en
> > > > the character device drops its reference on the parent device.  The
> > > > caller then uses the freed rproc and puts it a second time.
> > > >
> > > > With one allocation failure injected into device_add() (failslab
> > > > restricted to rproc_add) while st_fdma probes, KASAN reports:
> > > >
> > > >   BUG: KASAN: slab-use-after-free in slim_clk_disable+0x38/0xf4 [st=
_slim_rproc]
> > > >   Read of size 8 by task insmod/69
> > > >   Call trace:
> > > >    slim_clk_disable
> > > >    st_slim_rproc_alloc
> > > >    st_fdma_probe
> > > >   Freed by task 69:
> > > >    kfree
> > > >    rproc_type_release
> > > >    device_release
> > > >    kobject_put
> > > >    cdev_default_release
> > > >    kobject_put
> > > >    cdev_del
> > > >    rproc_char_device_remove
> > > >    rproc_add
> > > >    st_slim_rproc_alloc
> > > >
> > > > followed by use-after-free reports in kobject_put() and
> > > > refcount_warn_saturate() from the rproc_free() in
> > > > st_slim_rproc_alloc().
> > > >
> > > > Remove the put_device(): the caller's rproc_free() drops the refere=
nce
> > > > and releases the rproc, as it does for the other failures in
> > > > rproc_add().
> > > >
> > > > The problem was found with kbound, a static analysis prototype that
> > > > checks whether callers rely on an object after a callee returns a v=
alue
> > > > for which the callee may have released it, on v7.2.12; it is presen=
t
> > > > in rproc-next.
> > > >
> > > > Build-tested with x86_64 and arm64 allmodconfig (W=3D1, sparse): no=
 new
> > > > warnings.  Run-tested on QEMU's arm64 virt machine (TCG) with KASAN=
,
> > > > using a device tree node for an ST FDMA with a SLIM core, so that
> > > > st_fdma_probe() reaches rproc_add() without the hardware (no clocks=
,
> > > > MMIO windows only mapped), and failing each allocation in rproc_add=
()
> > > > in turn with failslab: before this patch every failure in device_ad=
d()
> > > > (9 of 9) gives the reports above; with it nothing is reported, and =
the
> > > > rproc is released once, by rproc_free().  Not tested on remoteproc
> > > > hardware.
> > > >
> > > > Fixes: 7dbdb8bd7c02 ("remoteproc: core: Cleanup device in case of f=
ailure")
> > > > Cc: stable@vger.kernel.org
> > > > Assisted-by: Claude:claude-opus-5-5 kbound
> > > > Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
> > > > ---
> > > >  drivers/remoteproc/remoteproc_core.c | 4 +---
> > > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remotep=
roc/remoteproc_core.c
> > > > index b88bf179507d..e4f44a3c8b4d 100644
> > > > --- a/drivers/remoteproc/remoteproc_core.c
> > > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > > @@ -2309,10 +2309,8 @@ int rproc_add(struct rproc *rproc)
> > > >               return ret;
> > > >
> > > >       ret =3D device_add(dev);
> > > > -     if (ret < 0) {
> > > > -             put_device(dev);
> > >
> > > The documentation for device_add() is clear, and looking at the imple=
mentation
> > > of device_add(), I understand why put_device() needs to be called her=
e.
> > >
> > > Unfortunately I do not have the time to read through and digest what =
Claude has
> > > generated in the changelog.
> > >
> > > Thanks,
> > > Mathieu
> > >
> > >
> > > > +     if (ret < 0)
> > > >               goto rproc_remove_cdev;
> > > > -     }
> > > >
> > > >       dev_info(dev, "%s is available\n", rproc->name);
> > > >
> > > >
> > > > base-commit: 82d0bbd67c42a44f0e18b0b7b0da0f3ace0c9527
> > > > --
> > > > 2.53.0
> > > >
