Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793728076;
	b=KYpSR/fU3boxBjVTwzPVvO1Za5WmroDTDNcGy68y++AxH4QJ8dRE5uoyT4HVfsceutGE
	 7TNQJ+ww/xwRPEuBFl12le/kpMO9MYHULl3zIZBL9pit4VZ98xK28G1+Ue6OLP1sHSrPJ
	 YWwpEShnWwP+NNk8rGP5We4p74e5JSdoyqB5ydSAb6s69dos+ZSWheLRpE6qwpjzXhPbn
	 xFpFK8M4U1xldQEtjdXXwaLrqsDV5Clkae5Ou8GgrMncQdNliEK7LtdhOEvQ0oqpFPrv0
	 0s/0xiRqtmDs0mJm9MeuXTxdjOhMZUasaAjZSiPYG1vhYzwIrb8gyTpWx5nLbDZXYLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=n99mPQj1ZJP498NFAs6mVC9Ln+V99W5mU+3ATj0pCRE=;
	b=tfWoBHwiPMVBXnBrKquFqNHMdC0KBhzfrSv3scJZYwkkdO829FpmjCNH7O+tBGszEigm
	 0c/JgxL7sazjwSuvLsixZ/ALDjO5lWYJYZ7blsQXv7MiCQcRxD9vuzUDc7PUW+JZDpgAy
	 f3vMtoXundJTOhvdskLFE7q93J3bie0MW3h+3/YNpbXnwr/3rrBEtm7/rC/9kF97KqdjF
	 1PKLLvC0cCuzc21rZOusoAjkIdy1fGlyqsiY489Zm42VCQv5iPNBFdVzq3mX9YWgFMd9r
	 zP6KxWysn2HigqJvHWehwE7xEj9kCdbVi8dk/OSs6IfZ5B7KxR9R1y5xO/V2OxuK0HQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J3KIFfY5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BB4606A324
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Nov 2026 17:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70BB4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J3KIFfY5
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso30124935e9.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Nov 2026 09:47:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793728075; cv=none;
        d=google.com; s=arc-20260327;
        b=JdXdNVFqybv9Bph1JrdNWRmUe8YAxejooHDhWxGgiwxWnlukzL+0MCdmk4bPw99rvD
         rNdV7eXj6c5n4rI+uBwxRpv4RJqnN1TvGtOtaYwab06A4nG1Gpc5puFMODvuXUqRDQnW
         uyFnNU9NMcjnS/syGRkLMaAPnM7b/UnEAZzXSsSdmEiiIqRmTcQjK5aUgktDwsL2VBL0
         Ubs2NxYCbMXRRIQh9OJRsapjAgTsuLDT5bIy+hG3XTxF/Tc1sP5DBSv2WCuoK6L5NDKl
         GTljA7i7rouDa1wQvUp/5BWRhzv/rYmlSr/y2uk4LaBkhTYdX4rUVgEUJ37uNPkWKKkZ
         rDHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n99mPQj1ZJP498NFAs6mVC9Ln+V99W5mU+3ATj0pCRE=;
        fh=e9FMAJMBkAJa2ISXCocPptil3jRM91WURcrVN90cHKw=;
        b=cJgwCIlfYdLij1fMQoLUlk0de61flrwn8ArcxBfgCYPgp07zTWpFdBlp2tsK4hOE4K
         0QwuVjGbdur8ZhN8sUhiB7YMZw2x/QI8QCRbaAfwi6YMzsvKTv6DoOWks9eE13rQR9Em
         c3Jnesa6tKz2USXly4HkkMP21foItlM6nSvuWHiXLha6HiKPdDOqFSZhaZf0wOikaHXe
         C8fNKwOtIiebPG6AYa/uU50o9y/98tGj6e+ljoRmiMQZFlRDz0t47rcAqeMm96zcy919
         GBEYWHkzE2Nbw+ZZLoIMWvtxAKj+9t2a/forvxKaG18XesFOg7NDwV/2DeNPh8rJSV3+
         p1LQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793728075; x=1794332875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n99mPQj1ZJP498NFAs6mVC9Ln+V99W5mU+3ATj0pCRE=;
        b=J3KIFfY59hOhjhOy0qmIXAJZ5B3hDT1mclNiZP6MSPOzRvAjY0eVXa1YJW0/JfzBks
         FP26H3hNgp3zyn1JC3hWXg4OrqjeWmqB1gHwRiKAJDR1NmklcLKqp5Eu6V6CYlUV33A4
         tf+0lhOq4TEPUBLDHXvCWvrAs6QWZxH0hm4qIM3+RsgH3T8zZB6hjoI5wQvVm9HCM6ix
         d8bSnsIvySZtgyN8kb6hdxkUtc42aN49P3jYjt/dGkQPFJWKU4Pi83ByNcxupUrYhbMV
         chEVda0Ayamp7ZFx91m4X4b1QEQuuaK0IWNg4QGTFdVhyqERSUvzflAellxIWFES8kRB
         /xxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728075; x=1794332875;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n99mPQj1ZJP498NFAs6mVC9Ln+V99W5mU+3ATj0pCRE=;
        b=0nje3YaYlGRX6DxJFxbBP3Mll3fFONlIax1zoEObkhvdWDqwSCDobIxkFb+i2BKVAL
         LSYITHPUml0YB60gWrigzM/a+TQC+ujyIXhkLDTEZRTJg/+nMOOJ+8z6wD9qOZqCGFNO
         37xc09/LCQLHnJjjW/0QT3yyFAm/wd58pmIdnbULFLDabEscuz7w/qetv7/ZgVVjGiv/
         AXNusz55TOByqiuxaPfg0q5uIy6t+VUdZQvPtKEejBidwuWUhnBh0d7JLcVTrtXYhrRQ
         ah64ZfhxUznc1e8QY4a2dB0ijWiU8n7emM1k5PuELL+8aRbBmHx2KsVKwKc1jVQXRr5k
         F8oQ==
X-Forwarded-Encrypted: i=1; AKwUvBzB3tFGN30B4m2JTfzna51zPF581+TKGEkeZj4IqIrtYXzTRZ0yqPYOGilQqC5Mzk64I3eTm58o82HcyLm374OI@vger.kernel.org
X-Gm-Message-State: APuU4Z8C7Y/5SsKAui6Rwca0fGrcKj5AtpDr/0CGisJH+0y/rZx9CsmJ
	WRh3JCy8IfKZs8z+/80Latr7ZVHpE1o7QP5IheJJIHT5bJxRVfPc1bvN6goEFh/3JNVMWtu9gL7
	yM4AzrAjG052yhAJoqKQ1Y3e8oCip7b4=
X-Gm-Gg: AYBFou2MmBYJzw104zbBNeHu7ZNGL70PzOB3ZrzQGexu/E0ucYXiElNaTw0RJn+J7/k
	JWCqVHlI0P4m0FhVOqYq32JboDywPgBlRpoloP78Z54ciyKnsfsiWh2mQjt2YP8NxOmHPxQAjm1
	owmH4v9kq30SQ1FrwFn4fPJo0LqxJEIZIBkDzWVvHTSLQ3NkHrvDd7h6k1KPnXM1g2ZZg7gyMjr
	jr+jvZ1VfMhveVRAgv+Fzsh+mUtPYRtiyRBm1sDtcQevaid69ShDgpBf/B8Bz34WqPjcPOUKFS9
	SUINFCUetReBmI52SDQ+fjaWczTWHvq+jgr1yHdsHQlpNq9CYiF7YuZnsyEe5+XaT1GKmE2S7w8
	9x+HHEHaB+9Tr+nO6NVUYcZCU+IOf9wP2X9/SmZXyvkg5ZMuACBTsDNoopVZ0vI1Abd+7
X-Received: by 2002:a05:600c:871a:b0:4a7:d9b1:b684 with SMTP id
 5b1f17b1804b1-4ac14ec7947mr323859765e9.2.1793728074629; Tue, 03 Nov 2026
 09:47:54 -0800 (PST)
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
In-Reply-To: <auoLrJPq9eRAbeQa@p14s>
From: Yuqiang Sun <izaiahsun@gmail.com>
Date: Wed, 4 Nov 2026 01:47:41 +0800
X-Gm-Features: AclHuK_glufPx3VPzKUbs-tqY6RCK_e-0Xc3jXhDCTseeM-7NDt0oT0ktRFS9Mc
Message-ID: <CACdDPuwmyAjC3kje+nYJ3yz7RePg8JzXsKGkzx-Ksxb=-_CZ8A@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: core: Do not put the device when device_add() fails
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Unfortunately I do not have the time to read through and digest what Clau=
de has
> generated in the changelog.

Sorry for the long content.
There is a human-written summary about the bug.

> The documentation for device_add() is clear, and looking at the implement=
ation
> of device_add(), I understand why put_device() needs to be called here.

I agree that as documented in device_add, the put_device must be called
if it fails.

But in st_slim_rproc_alloc() (drivers/remoteproc/st_slim_rproc.c), when
rproc_add() returns the error, the driver calls rproc_free() at its err
label, which is put_device(&rproc->dev). With the put_device() in
rproc_add(), that reference is dropped twice, and the driver uses the
rproc after it is freed.

The same happens in every other caller: xlnx_r5_remoteproc calls
rproc_free() too, and the other 23 use devm_rproc_alloc(), whose
devm_rproc_free() does it.

That is why I did not change device_add() or one caller, but
rproc_add().

If necessary, I can send out the full document and PoC on
how to trigger the KASAN.

Thanks,
Yuqiang

Mathieu Poirier <mathieu.poirier@linaro.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=
=884=E6=97=A5=E5=91=A8=E4=B8=89 00:28=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Oct 29, 2026 at 09:00:37PM +0800, Yuqiang Sun wrote:
> > When device_add() fails, rproc_add() calls put_device() and then
> > removes the character device.  The reference it drops is the one
> > rproc_alloc() took with device_initialize(), which belongs to the
> > caller: after a failed rproc_add(), every driver frees the rproc,
> > either with rproc_free() or through devm_rproc_alloc(), and both drop
> > that reference again.
> >
> > So the rproc is freed inside rproc_add(): by the put_device() itself,
> > or, with CONFIG_REMOTEPROC_CDEV, by the cdev_del() that follows, when
> > the character device drops its reference on the parent device.  The
> > caller then uses the freed rproc and puts it a second time.
> >
> > With one allocation failure injected into device_add() (failslab
> > restricted to rproc_add) while st_fdma probes, KASAN reports:
> >
> >   BUG: KASAN: slab-use-after-free in slim_clk_disable+0x38/0xf4 [st_sli=
m_rproc]
> >   Read of size 8 by task insmod/69
> >   Call trace:
> >    slim_clk_disable
> >    st_slim_rproc_alloc
> >    st_fdma_probe
> >   Freed by task 69:
> >    kfree
> >    rproc_type_release
> >    device_release
> >    kobject_put
> >    cdev_default_release
> >    kobject_put
> >    cdev_del
> >    rproc_char_device_remove
> >    rproc_add
> >    st_slim_rproc_alloc
> >
> > followed by use-after-free reports in kobject_put() and
> > refcount_warn_saturate() from the rproc_free() in
> > st_slim_rproc_alloc().
> >
> > Remove the put_device(): the caller's rproc_free() drops the reference
> > and releases the rproc, as it does for the other failures in
> > rproc_add().
> >
> > The problem was found with kbound, a static analysis prototype that
> > checks whether callers rely on an object after a callee returns a value
> > for which the callee may have released it, on v7.2.12; it is present
> > in rproc-next.
> >
> > Build-tested with x86_64 and arm64 allmodconfig (W=3D1, sparse): no new
> > warnings.  Run-tested on QEMU's arm64 virt machine (TCG) with KASAN,
> > using a device tree node for an ST FDMA with a SLIM core, so that
> > st_fdma_probe() reaches rproc_add() without the hardware (no clocks,
> > MMIO windows only mapped), and failing each allocation in rproc_add()
> > in turn with failslab: before this patch every failure in device_add()
> > (9 of 9) gives the reports above; with it nothing is reported, and the
> > rproc is released once, by rproc_free().  Not tested on remoteproc
> > hardware.
> >
> > Fixes: 7dbdb8bd7c02 ("remoteproc: core: Cleanup device in case of failu=
re")
> > Cc: stable@vger.kernel.org
> > Assisted-by: Claude:claude-opus-5-5 kbound
> > Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/=
remoteproc_core.c
> > index b88bf179507d..e4f44a3c8b4d 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -2309,10 +2309,8 @@ int rproc_add(struct rproc *rproc)
> >               return ret;
> >
> >       ret =3D device_add(dev);
> > -     if (ret < 0) {
> > -             put_device(dev);
>
> The documentation for device_add() is clear, and looking at the implement=
ation
> of device_add(), I understand why put_device() needs to be called here.
>
> Unfortunately I do not have the time to read through and digest what Clau=
de has
> generated in the changelog.
>
> Thanks,
> Mathieu
>
>
> > +     if (ret < 0)
> >               goto rproc_remove_cdev;
> > -     }
> >
> >       dev_info(dev, "%s is available\n", rproc->name);
> >
> >
> > base-commit: 82d0bbd67c42a44f0e18b0b7b0da0f3ace0c9527
> > --
> > 2.53.0
> >
