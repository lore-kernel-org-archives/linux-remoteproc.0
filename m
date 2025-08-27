Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6DD2F83B1
	for <linux-remoteproc@vger.kernel.org>; Wed, 27 Aug 2025 11:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756294579; cv=none; b=WwZOxGI7KHNCnHLx8I5k34wcrc5bAEEr+h5pD0KPhb7qofpskBwx576pdCafaUvr732pftE7bOow4p2cBGCu1/DpkRYrHPN0fcHmngx01a/xblXHz7n6/q/EpdiU2uPaEZHoW5uik9SjdwytDlJqS1FXvioUI1tomG0LE9dG6MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756294579; c=relaxed/simple;
	bh=QZvfSI6Efls1O/uSjVY3gNPC/JGViDnszCrfnx5UFnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k05sirv83Y29es8QGv+nnAaz/xgnholiZ/fJBU4srgQaKjAd/nMs0At9w/CW4IHNwak4w9Sc5hh2c3R0Y1w7gBjMX3MCkY6Cf5pPjnx9gE/xbOzp4PJm/DAp+QmyZyjfSQuCCcY/AQX4OO6fcaCDUDCuqxPl39dfRIFBgj/3i4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u0izJKIN; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u0izJKIN"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-71d603a9cfaso47364857b3.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Aug 2025 04:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756294577; x=1756899377; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IgzHHjXJwsEYXFI6nky8omo06n3wx429eZjLNQ8v7Dw=;
        b=u0izJKINn//l65M2hlrAS6yJ69NjbUB4jNwFyQCgfgQsk0PE27juZnNGCD2RIbcnFc
         TtzvxH4LdeLeEDyvVSfpWRgFLALKTcOR//KpcvrGewwhTt3NlIKhY9sTousamnFxS3Rd
         xo6xgVW2Ns8xIiiF9SN5i98SxoUMVpjd9ne7xgHfUDF5dyLgWuMh1b92my2bcjwHl+97
         fMBp9llidnCadks4TmaDUMwVF6kDHa519s5WRUUlEd5ifWZC7vgfNojKNhh+/fXw6VaT
         2Nx2z4se9GYFhXMwlWq9RUmvn0AdQLakH1EzpyuMw04dC3tnYdW6NeeGpEG/vYLf8N07
         k5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756294577; x=1756899377;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgzHHjXJwsEYXFI6nky8omo06n3wx429eZjLNQ8v7Dw=;
        b=sNycDorzcaxSbf5N9CZRYYfx4hcQ52aGQWV16YoSSvGRWkl4A5fyqyyAU78eaq2fEw
         vkig5rUZz24xVW4bopVakN9rPSEZrJzOk2IKA9U/trLX0Pr9Vg1SK8NJLCfoJK/Oh5XD
         x0ybl74Vqxxoqd2Jgb3q3WrFsoR38dUbGMDAJ9iumLauTPsGyMC8dGbmPp/EwQHzb4h0
         sInpovPrGdLJ7B64hgUncxDK/e+Ub/pSkPbRDc3O43ZTzAqGWoBN8c3Y3kwVYoasTjOT
         lW5scvM6kyxNLZhmQMYd1k6fjUkWSCDsgJMbWmvhATd4cEWxGn3RUR/A1uRuv2T4vH1b
         +m8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnw7XLb6oFFeSrzXABZrCmMSIvBl3kJcQWFaL2MfcSgQpVGB4JRS0xNaHvudxdu4KvbIyxN280Z9FB+y/iV1Qw@vger.kernel.org
X-Gm-Message-State: AOJu0YwofqI2Y43amyUmMbdc7SNXiTb0ZfXYpg/yz2QHmZsaJ74DqIhh
	7huQw910qtFKwHkM1xaXDKmG9j1b/sfRU49UYy/hZdwg29u4EEDcq5ToZKkYLO9VKVvjGUjXvCg
	Xv69jUJ+kZyo8QqwAuqpU8gB5QZUQ/9gg8BFKIoE1Ew==
X-Gm-Gg: ASbGncvma98m5eFOjxP2NXzqOfuMnoSl3daEfDgNBVHadAVmqPNID3dRAt6UKOrZ7aW
	qMjsKJFgSHgyn0iovkNkiXAZWOOJfbd12QeluvgDRtaiovJtrfOBOWvWeg1qtm1NMZ9vqy/Nvy+
	1o5XBHSf/wLhxInY5Jji23IjAzZRA0pTTCh90767IQChuMJnsUfP7cAAWtfmEzAA7B3ZIBM2aHm
	sKLg2w=
X-Google-Smtp-Source: AGHT+IEaUkzY8qVCytwXncxItKaBCsKVdQdDw2QGYUDhz69uuArC0KOJWhsNNviJwZ5P2DYev/cmNByccINJI0OdI/A=
X-Received: by 2002:a05:690c:63c7:b0:71f:afcb:a0c9 with SMTP id
 00721157ae682-71fdc4153bamr233375337b3.36.1756294576948; Wed, 27 Aug 2025
 04:36:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250827101352.927542-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250827101352.927542-1-claudiu.beznea.uj@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 27 Aug 2025 13:35:41 +0200
X-Gm-Features: Ac12FXyvYcYk8QsIjU4Ywo5Dt_V3Gf-fKGoRl4aZpVE_7Ef4IczfC1ZornMERZU
Message-ID: <CAPDyKFpL9PPKYzqh_PbMQnmT6ADw7yBTt2H-b42_JUKKpzEHow@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: core: Drop dev_pm_domain_detach() call
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, rafael@kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Aug 2025 at 12:13, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Starting with commit f99508074e78 ("PM: domains: Detach on
> device_unbind_cleanup()"), there is no longer a need to call
> dev_pm_domain_detach() in the bus remove function. The
> device_unbind_cleanup() function now handles this to avoid
> invoking devres cleanup handlers while the PM domain is
> powered off, which could otherwise lead to failures as
> described in the above-mentioned commit.
>
> Drop the explicit dev_pm_domain_detach() call and rely instead
> on the flags passed to dev_pm_domain_attach() to power off the
> domain.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>  drivers/rpmsg/rpmsg_core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index bece5e635ee9..5d661681a9b6 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -479,7 +479,8 @@ static int rpmsg_dev_probe(struct device *dev)
>         struct rpmsg_endpoint *ept = NULL;
>         int err;
>
> -       err = dev_pm_domain_attach(dev, PD_FLAG_ATTACH_POWER_ON);
> +       err = dev_pm_domain_attach(dev, PD_FLAG_ATTACH_POWER_ON |
> +                                       PD_FLAG_DETACH_POWER_OFF);
>         if (err)
>                 goto out;
>
> @@ -538,8 +539,6 @@ static void rpmsg_dev_remove(struct device *dev)
>         if (rpdrv->remove)
>                 rpdrv->remove(rpdev);
>
> -       dev_pm_domain_detach(dev, true);
> -
>         if (rpdev->ept)
>                 rpmsg_destroy_ept(rpdev->ept);
>  }
> --
> 2.43.0
>
