Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795187647;
	b=t8+GhKnm/umGXdOjHt7j9ZnoDE7h/ynkvr44h6ZqyvzTAWAr6FYn+31++VfTr/+wccLM
	 fHNaq+F7HIQefSb4m0flvUDfdjXzQ3kynJHxGXm6s/8ffafH9/rgwdaOSFzjVAMqOPBZS
	 4oxE5dYHha0Bmt+HOhNdWVQKw7sKV0l77IO9KaXZ9Reh8gDgtwE44DXT4/HvTjXTQ6lf9
	 Lw+2ESXZ8IKBSWwKf6BSCB0F/h8ae6IcVL/xvo+0VrEFyq4cU6TpVfrogLtP1hzktqN1L
	 Kdf5Be7hCDFLPU23/QWNHjfU6ykB6MzikldRvJq/rz4OLcnTjisJO5vuMBvyv1iGZ9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xl+2sSmzH8A6e+KclSF2nrdYXXTRUxFSMXImrDM0H0o=;
	b=Znj6LD7N/FPTzxLzYNKsfTxBilJdkXaGpJLbiLkTQIYMno94t0dWHRL8KfBKjqOoifXz
	 ieF8LtpoRcOgPV6ar+9JNXB2DZ8Y2lsi6Hhi0ToyXSJFPU9fFc7QvrnDD8nD8RNoqtIj1
	 WoxSfjg+/5VRwY4/jl7z4OC+gyFrAEhE1WKjdjedf4n+5ywsdPzf7pffwtBHcXBfB5Yc3
	 7PHklcpN9J34Ov9/GHT+hE9jfbtSJRXKCrfNEzuuysSboZ12RCMK0aZ5lX50zGK6+4q9K
	 QrHm5EFHbkG45nyrDtsFedVGr58A0f2PWWsoy+usvAbbaCMmYe+y1VE3b3hF+JTWHKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=v10U2vyQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1751360A2630
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 15:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1751360A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=v10U2vyQ
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b4dd5cb4f6so6696067b3.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 07:14:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795187646; cv=none;
        d=google.com; s=arc-20260327;
        b=ltmITxyxJ572GxlLGdG71nIhx0sPfHFoMm5bgkQ2h70I+anAVP1nP+/hYTOXAWiZpF
         DmZXEYaWo9QLiSrTDnGUd/6Vs5BISM5CojNV83z1JjV+udnhssMupCThWZNLDKuZR7eQ
         MOIuQSKTJ2nlUbzfDBh4h5Gvp05C4E1R6hS3vJ3duH67IfM5bm3mjyZoRnCY8lokck6u
         Ld6sbtl3/rk+aBiN3d5Sm80Vz+zD+0N6O7UkDgWNQ163j9+02/V/p+YLl0+RR+b8g2Yy
         YLA2bijuvnNfx6yvnP063IDpz8yrsEPWvbOawNvcrorg2iLKwdZiJZAnMYyPe+D0NRRI
         Xo0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xl+2sSmzH8A6e+KclSF2nrdYXXTRUxFSMXImrDM0H0o=;
        fh=UouWzPksDVdPwZPbvu5UmFFicriBQS5KhQtOWIQ+Dpc=;
        b=f9E7xEe8G2nhNRUR3slQTSWeuEZ+dK5JMjepC8hkN3kMPk7i9z0L3WtPXNOAbZQti/
         K7KYx7P3xEtHO1Ov3TggMFsO0Xf0rY7kbDrBg/gw6k+58+onpk85HmPC03oPw3+zizus
         LjfUCfC9IQtxPUdfqM2+A1exWSd7KTa/EjQHn1YFZgZ2g1O330+xm6vu+jAs2DTtrb21
         2RQ77YW6OAfQMofLWocRwOMg2pM61WOT8wQya8SBswtZC5qMxgLSz/cxnk6/aGTtIdlm
         erPZx/E+ppFU3IWUJuD6ojNWT2+TneBplZd9g/od6hqzycIj1HTHUXZ4aH2ckX/n18Px
         7fTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795187646; x=1795792446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xl+2sSmzH8A6e+KclSF2nrdYXXTRUxFSMXImrDM0H0o=;
        b=v10U2vyQ7offI6JU4Q6+XxRztItvxIcWm3pcttgiJIN0EJgaUgtLZS4KZNeRWA0YoO
         BhJGksF8dRP6qTHIMtOfC+9mPjfP1j5cxwk3MeBs1c2o0XbDU+Km52xaVCXbENKCs7yO
         cmHHZ7g/mFDwOIdavLuunqm1uozrjyFW0i3hbtqNFkh2pqs+/Gg8s5AaJ4wZqtCdvsrR
         YfNT8NyFi0X/elWKEHwoVXHN2/oswD1jNPipLRxRXmXFpTyDXuLHRQn4BoKQcUe5h/Oa
         4GQJxJ1QIQHK6VXLt21Kfo82ikO4lRYfbU+HZUzPUC9Qytnq5vJXmVpOqp+h+LXWuLAb
         pU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187646; x=1795792446;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xl+2sSmzH8A6e+KclSF2nrdYXXTRUxFSMXImrDM0H0o=;
        b=D7Xq+N/hxzlTAU/V5iYiPgZJZwCmZwl73iWsw6LRmVCg7BeRT0o9zWB8ymSNAOap2d
         iFbFwD9UVtMoGmWGB4dkbXKuotbDF467KO2c0L9PVs4wbWDsw8WZKjkuK/LXS8M3xq9d
         L7Nt2Tv6fL7oG1Wvv/PP8vpNcB0ItB7vbsrScBnJQr749BoHw5YxeUs5WxQyo3e5LqNE
         11EvJqN2ow23l1xNnyMQL1gPCn2VVthtMR/X2AoPh6pEUAGphcmI3Z6ghUSsBQvw24rH
         PjuF/H0XsZoEnGd6QHgP5gQuctbYf87mJokV7UH57M3UwnUBsnreXjIBl2cwhqETfWTW
         lx8w==
X-Forwarded-Encrypted: i=1; AL+hErGkYZHlOwjmq6yLeIBOHrwL8JW9gDddjW6KQAaD5ySvdHe84VWaa/gQ9yrS4J2XlByFtXo6i/BOhgGV91nQrON6@vger.kernel.org
X-Gm-Message-State: APuU4Z+c2jhVosK7otUNrTo24TbbjeSEx9FavfUgxc2HKC/0p17qHrGJ
	oFFzzsxISC7ZaZ9zJJxb8Xl8K/AkzHw2xRpnptp8xBN5EGUG1zUCer4l9w/AHN7TsjP0ONK/ZsE
	AIVUiQJ0PlEj2YTvZdWtIo63rQXtng2kxwNpxJtYQ2RDt/+/Z9qaA
X-Gm-Gg: AZFdTZfNbO7rILbMC4IculFGIlLD827zJuU+QOohZ/nW5pvBAqlibK3H2mjkfj8Lc+9
	2uS2I8cm80aamsK5PmzqSfahQvCWU2XePSFsxNO7J4IPwyEcpw42assbz2C8zBWZ9X0/b8jwa5y
	SLs103Am1I2neCwwOAPcYStONJekbWZ57x+dknrHFyojW+VoyH9UsKBCYrFGLngRuJ29af6qExp
	fSy+s0XpfuD+oxGPnsIKN6bZjaAomhzi0nmfEHkcaSq+ctmf8JBJwebjnzsOTlEchhcpynUSY38
	BIGCEuF39iKfqgWld2t1O8vAhMYldqVLm3CwCKiT1k+hAQBOy4K0nMcxP6liPctFeb7SNfBbEMk
	Ug5EzHNUIEgxDg0/EldUonnpcqiJTZSraYTnOJz7m9ws6/1hvbfyysT3lh78izNrS6f2uaV4=
X-Received: by 2002:a05:690c:2d0a:b0:8b0:ecb2:883a with SMTP id
 00721157ae682-8b52050b893mr17647767b3.62.1795187645947; Fri, 20 Nov 2026
 07:14:05 -0800 (PST)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795171088.git.u.kleine-koenig@baylibre.com> <b059b4c23302a7e7771069b8b3ce38993c5ef5d1.1795171088.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <b059b4c23302a7e7771069b8b3ce38993c5ef5d1.1795171088.git.u.kleine-koenig@baylibre.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 20 Nov 2026 09:13:54 -0600
X-Gm-Features: Aa3M54p9Ss6VX3CBd7pv3wp-tWA5dKjB3VjnZwXrAw_L7ZmUhx8I8HJlgVm0i-Y
Message-ID: <CANLsYkwp5h-Z+5kK59xmEydOUaPJ54JE18oTipa20J48Ct5aAQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] remoteproc: Allow untainted use of driver_override
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Nov 2026 at 05:11, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> The two drivers are expected to be bound to devices using a driver
> override. (See the respective use of device_set_driver_override()) and
> so should be allowed to match via that mechanism.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
>  drivers/rpmsg/rpmsg_ctrl.c | 1 +
>  drivers/rpmsg/rpmsg_ns.c   | 5 ++++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> index 5c19188d0294..79ae495c9c07 100644
> --- a/drivers/rpmsg/rpmsg_ctrl.c
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -210,6 +210,7 @@ static struct rpmsg_driver rpmsg_ctrldev_driver =3D {
>         .remove =3D rpmsg_ctrldev_remove,
>         .drv =3D {
>                 .name =3D "rpmsg_ctrl",
> +               .support_driver_override =3D true,
>         },
>  };
>
> diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
> index bde8c8d433e0..820dabbc9500 100644
> --- a/drivers/rpmsg/rpmsg_ns.c
> +++ b/drivers/rpmsg/rpmsg_ns.c
> @@ -96,7 +96,10 @@ static int rpmsg_ns_probe(struct rpmsg_device *rpdev)
>  }
>
>  static struct rpmsg_driver rpmsg_ns_driver =3D {
> -       .drv.name =3D KBUILD_MODNAME,
> +       .drv =3D {
> +               .name =3D KBUILD_MODNAME,
> +               .support_driver_override =3D true,
> +       },
>         .probe =3D rpmsg_ns_probe,
>  };
>
> --
> 2.56.0.rc1
>
