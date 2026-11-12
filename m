Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794499141;
	b=pcR/RHS/v70UQfxbc0gHGYMV6Qb2JvYceCQsTqPowi37cFKLDtktXvZXxTmPDgyR1FWq
	 wWZMKdHETrOLUw6s1wKHy++pa8/pHZ9VP/Cl2oJdycBuuIAbxZqMsqBzbcuy8gLX0TGhF
	 PNv10NU0p4WJSM4RezYSLWqMgza4YZS1a+wK6tArvpbWmRScg/cVdvJyY68+ncPzB7xYq
	 xaP9RAoqQdkCekJuhYX5WQTInFVOhB5eXbQtqfVtmX1KgFU1mO0IOnv99/cw19UU4U1nr
	 mrjymxjEE2ib/lsE8doP2kJdMBHWSRJSOkUFLwjCP1BSbRBECuZzSvbWYMYPDmN5n7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EToOYHBqGwgtyDkqIQcDhA4CxlT1wDNVLj3GFZUClsE=;
	b=My1aQ0BCpc+cOYFKPmGv6L90u/zxHgitki1+5d7gnmHLI7ZkeD7KEIE5h8lw7eTvWN8D
	 eiFAzc/tM4WdzoiYXjeys/QnulXhM8ZaLdrXrsbx4BwG5ItZloTH+nnG/9UO42Oq8RTDt
	 t9ejGIPVSD0+LvfmJ2GaKZ2snlErDt9zjpmeorHOjTyiaNPQLv1gj/7TbXDhdyWdsNiiC
	 q1KWXh10IxsVS+3oU72pSXLUehwvDdFq11S87QNGyBqIEB+lqninodQSO6wmhlxtmDCEl
	 lsF5WxI/V4jQMddIuhsv8PyF5t0wnSgyfv0ukAxS6LbFGf3M4m+fmd3F+dZa0P4MVzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ku4CEMDs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE548606A32D
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2026 15:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE548606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ku4CEMDs
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c40e30c26a4so193148066b.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2026 07:59:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794499139; cv=none;
        d=google.com; s=arc-20260327;
        b=SgGlivY7zuVKEmXGqU0iG8Rt8VHa8I1yHmcd7XLvgnBTSEqpEy2ruT4fk2DdoIYoLO
         kNXv8TcowMSpr4HHsXSovbe6iPQk3E2PQikOmvHgqEbwfnsAGbHnkwQ03Phxd4ojsyXf
         ujSYs8m/rAbosvIEsrQBep4Z1Ph//SDd6gmCqw12ft2D2nXGdWG6ZESBK4FYI/CIrnrX
         B1AJ9lO98DRZLsxd/2EekAJY9g8JdLUKqAEF3NDB1HYNsL6qfYmcfwATgtVuUuUMWgkn
         2xR4ld9hGIkQNZv1oFTQO/Iwq/809j8rvp5rc+5p0dOt11rQpORgu4hw7v1IE6+lwaNO
         ZqKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EToOYHBqGwgtyDkqIQcDhA4CxlT1wDNVLj3GFZUClsE=;
        fh=h0LXJSS07KzCjswL+yI+5JfA6q8ekO15bMaxooLga1w=;
        b=JipjaY2yWwKIXi6BhsOu4IZjXWDHSKFjiVHcjQ7fg/g1JMYNK5wxUhKC5E8wRWgCSh
         8dwBtAkHvzelLvrQpXqwNChDqXRkA7huWPRU4pWMsCN0a+X/5NPJ5hg17hRf2kJpgKxT
         6BQPRucivJPWN4DwTKHYQa+qiLt0ojkeu5C6XIvwxsXmRYqfOB5Ll9Y27puqcWr4m0lv
         1DLSjNlnivrnO356UJDhskBOe23QdLrs6oaiKZR+AKxf9l7cecvPE0H5uVbqHYj9TfJD
         jmPO6+6LlAZecsQDigSvcZG6muWp2jb3I8n+MFdYRT7cHt0fDPjySfx3QksYDJgugycF
         Po2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499139; x=1795103939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EToOYHBqGwgtyDkqIQcDhA4CxlT1wDNVLj3GFZUClsE=;
        b=Ku4CEMDsKOxYuTHkxS9/ZHfKqGyAbdFRF2MhC+3pPVtK6HWONFWDHL0g5iHPdORXmq
         oCNp3Ku1XxNdlRsjeMWKEImwVaAdfEzOqrYLgHa918s+FR1IyQ1fmPX5yHMmwCHxBzhf
         C8I0Qvdbnem2LkbMyzKrKCl7Y2MCBgHox/1RAIyYZq3DxBL5cwjOWIAybt5G4EDXKqbz
         IcH0qvA4gzCnGPHCIZWCOFUN+Lhb6gmwwQ70/pLxaiJ6SpjrZkRCa503mcGDAryxhNXu
         CPV1l/eYc2VrMSVlZkLRDPuSigrh0dBYR7xqiJDS+5z+h+ShAd88L9C2HgrhMLu5YGw+
         kogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499139; x=1795103939;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EToOYHBqGwgtyDkqIQcDhA4CxlT1wDNVLj3GFZUClsE=;
        b=jxP4is62xuzVR+jUJOzW5y8YT8U85nKOzL6e+RnPFt+C2hbvd6Aht1B2EibGBsvuPD
         3+psguQM0CPWtMLcKNdQuSqEV8b9d38GY/BFNxkuycBwegz5DBbIpbvRdDoRs/AGskz8
         DyL/PCueQKREqTx6yipQFdBZ4RJny00cF19EYFbfUJaOR1jSUR1BfjlZTTsRLuDp5OdM
         iARW+wU9yRHkJvaquvMInlnioeuctw48AVWAy5fgGphfK4TDZSsfRDPw7uL4aja7ucYN
         gKVYPFlkuVLhu84Gpdu0Vs5Zop+URNLq8skreXqvGNTA7T/U7aTWvSxhdKOh5qG44NxR
         cg6Q==
X-Forwarded-Encrypted: i=1; AL+hErFrel6yRbqcXsxNPQP0CnXm/E1KadDHQT8il6FZ45uoIFUMTBQ+exBdMzG3mD3zU3pZlAaE5Wb2FLG6CJfMSZHj@vger.kernel.org
X-Gm-Message-State: APuU4Z9nRL2gZV0235Lbukplgm2I+SMDVpq0tes9/+EWMcAqYn3w+I1Q
	YZCTBFybvR+182Kh9q0zuJ0IUtJIRfXwXnpkBlMojkNXBTLXNuBAjqsWI8hXOzkgXtxw+fvyPfv
	PKJPetM6iwd7jIGoKeEJ90OxRjBSPLLVtMVM8prnwKg==
X-Gm-Gg: AYBFou0qvFm1gqHfykyJBGKJv9bxKcVwnTeAVY4v258wAsBTqkTq0yw9WOdzqLO7KFF
	vKcZMMQ2s+Rpk+hHIJsWLzBWcwAlZsRpYheWAu8TiOc8HtKDaCxp9PFijfuMy9euVOwrDyRwgVD
	waUyCxEv0572Fxo5PmZa9otkzWI8GhR0IjWoipMkLbkig8xJQdAROrjNewAlEvJqxuwjaoRxDBt
	B+0nGJscZc0LZ9gZRmgUwg5mMj84yI56FQ55fXp0DSZnlULGh2D2EHIIjJ3iKusZlpCZ5qNE5Ll
	V1dNGE/IonQIwKQTWCqkOIOAMRYf8UAVSaohHNbjiGZFVUv57gUEL9AJrfjPHpPpheJyg5M3gTQ
	3A8Vv1U5XJtisMZTBATZCUfvgVDRJQ+jeaIu+z+ZXcj8YeqJWSZgZadX0VoHYdSYNjEr9
X-Received: by 2002:a17:907:8e96:b0:c2e:616b:6763 with SMTP id
 a640c23a62f3a-c507b2cc1b7mr331620166b.3.1794499139114; Thu, 12 Nov 2026
 07:58:59 -0800 (PST)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111172947.3579982-1-stjepan.poljak@gmail.com>
 <20261111172947.3579982-2-stjepan.poljak@gmail.com> <avThD0u2WQx8drWl@bywater>
In-Reply-To: <avThD0u2WQx8drWl@bywater>
From: Stjepan Poljak <stjepan.poljak@gmail.com>
Date: Thu, 12 Nov 2026 16:58:47 +0100
X-Gm-Features: AclHuK9hu2IpdVTiqRNx47radQxfPWpOJNlyZZoNO2fwaqJTR4WiC67svYMPEKw
Message-ID: <CAKVkeTyjZmNsyT4D_evW6pikwnNEtTY66HvOi4KKwB0aY+a+XA@mail.gmail.com>
Subject: Re: [PATCH 1/2] virtio_ring: reject a split ring size that is not a
 power of two again
To: Francesco Valla <francesco@valla.it>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Andy Lutomirski <luto@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	virtualization@lists.linux.dev, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Francesco,

On Wed, Nov 11, 2026 at 10:51=E2=80=AFPM Francesco Valla <francesco@valla.i=
t> wrote:
>
> This is definitely and error, and should be logged as such (I know, the
> same message is printed as a warn in vring_alloc_queue_split(), but we
> have no ABI to align to here).
>
> Also, consider to adopt a message a bit more descriptive; maybe
> something like this is sufficient:
>
>    "Bad virtqueue length %u (not a power of two)\n"
>
> > +             return NULL;
> > +     }
> > +
> >       vring_init(&vring_split.vring, num, pages, vring_align);
> >       return __vring_new_virtqueue_split(index, &vring_split, vdev, wea=
k_barriers,
> >                                    context, notify, callback, name,
> >
> > base-commit: 1a577f9402c1780cc1e663f48d5dd54c02051b09
> > --
> > 2.53.0
> >
> >
>
> Thank you!
>
> Regards,
> Francesco
>

Agreed on both, thanks. v2 uses dev_err() with your message:
https://lore.kernel.org/r/20261112154927.4004184-1-stjepan.poljak@gmail.com

Stjepan
