Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918803A7F41
	for <linux-remoteproc@vger.kernel.org>; Tue, 18 Aug 2026 17:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787073013; cv=pass; b=XMKtyDQSBfrRNL06MrAKa8rexROlsG+rYAnTD2q+LMkZQVCxi2vOcsdZFRFz+mUMktbkVWk2fwAKUkebcSG8aoylYGPhFZPiw6mC1MUYF7gIoPs4JK8cWaamctF6gnlcJEv/FVwOvkUj9I1iNOquY34Pj4bpoCDADwuUKdPw9Js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787073013; c=relaxed/simple;
	bh=TLqBAuXIMWD2IzV7nIVKt67l8/ZmoxLkqIXugLlhzvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DwSo01+KseIIfzCR9CvmOGA7o71M6btJsEXT7do9tfesErrME68nIgCbSFA/fv1xg9Tcy0HMXtuaEEc4Z1yvjtPHeBAtX5a5T8IfZpDyQO9YgtBnevKIbJuP8Gghgnc5YCIAxi1LN1eW3BR8ewUKggiAhD3OnXWlCfBZEYW2GrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NDKnue1M; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NDKnue1M"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so100658a12.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Aug 2026 10:10:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787073010; cv=none;
        d=google.com; s=arc-20260327;
        b=hb6cF+eRXFm5KrVL5qxzuZtefB0bcpXD5iUYJKwVAuo02sfKK7HQLphWZIJVberkQ+
         lH2DWvgqqvuwzI28gWYx0YlBdRR5EHwzwO8ip6Ujah+sO29onU4Xz6gSWvBh3Y31pW8n
         UJXj1fPlFMTH6BSANBgKE83PHUQAZ7/wC+Up5xx1icjwGBPZbZ/Lhc+bEzome/mFgsyt
         +runFQHS93Cx+FkBqiiIEtcy7u7FgLt5szpKVfGeutB6OnHjhpo/8h9aUKSHsh0haEAX
         elG6Ecwe9K11bOcaTv/F3iqG+c7ouFThW3m+OAHH4OiYr13TiHl/EWJpQIImpKtU3V/C
         Pm0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uBZk4YT8qgXdmFVphk3af38SH0U45FRNDQkqVdk1COs=;
        fh=h1hSbl5Tdd37IOPBFKIscfXFKqLc9Sd+bx5gGZ8McjA=;
        b=stp8UXvUY5x++bS0rrNsrHHPjzkdg6nuvfeNfbJyYM7RDQUXbj8j01LEO7jzmnGsGo
         qhlSOFvpEpxhQNXUcP5cgmLIUbsAIedZapv/cO20SSvDyNJodoRg4aFSfYNCKYDdMFBb
         iFiktABAxAvpG9zbt8FhWvb7eho3VhX/zUuOGlJbO10jrf923L9bTmj5TgQDUmTk9lP+
         7d/spbjsRHI0MkgxT+u6kn4hw6b5IHoJfZBdtvCgZMUred4jxUH6GlfAkVhB0CSD+dai
         MpUWbiLXhjpOsNkI6UkBlkPb4gMICUhZrpk5IkgmT4jizgn4uoG302I1rcnHUHiW9J/H
         4N2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787073010; x=1787677810; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uBZk4YT8qgXdmFVphk3af38SH0U45FRNDQkqVdk1COs=;
        b=NDKnue1Mx60bb4wUB/9xVKsZ6B6d6aBnp+64OqG7wPmASn/QOtf7UOlZm786epeOQb
         9b+pFDxqnmkD5aV/w2d7AFi9BsQu9p700riDAgihrGM+95PEiM22F2tAWn25EmaK3UNA
         Ly02/5sbtVwKNgQeHySZ/E1XtiuYpquGSaDxHUQhul6gKLTwl494r+w+b4id2bQ8L+mA
         aGqOQRxux118KivAmd9znAmeHFvQMBmpOWymDFKEiJ9BSCAuVDE09q9uAHuK6jewupQC
         yq2+902n3k/bquNSufjJxfjl15PpTjNeLEz9mdTHcCVeEsoSufWYBm0w0yUnMx2lVjEW
         fcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787073010; x=1787677810;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uBZk4YT8qgXdmFVphk3af38SH0U45FRNDQkqVdk1COs=;
        b=YGNtTkUoH6+8gKmPzDD/zGb/EbSRg8fzOy7tDFp4Jl42pf2lLse+39xm4uZInnFuZ3
         jL4rj+0jhpJc8r/GavgXN18nxttGzaCs1iNUjHfNzsKbkV1SvzwmdVvIrW8KN3Gy7cs7
         fl5ZCAR3TDDCg8OjSlhbKYPstMpzIdLGtYR8qrkQX+/aaiBaNwY102smB+MZl6k7VRbt
         7pE7C9I9aapws9nEIp7bWmc962KOG0/I+Ky2iw4E52IVCetVYdPMrnuLhdpkSqffyQKH
         l/R+CNtF7iaFZgsx4cOPKzgkSWL4SGquRp57HwIxqr2q9v/pmrqJ2+FgcsfMKcf2zDRx
         7Ghw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6z5gB4GBk4jyy7YsP8lPrPKL6EjqyVkykagSufZNEpcXJAnuhwTbtxskXhiRI+OkSDILobZqDMn4RTaTMctLe@vger.kernel.org
X-Gm-Message-State: AOJu0YxTwaawkLbGsWG+uL1vWKsZ2PVuK6hIZnDbCTLm4Xq0GZExQwsc
	7WhCI6zKSbxdJClpZq2Z1MsvorO1zo3pOiXF6Ud1UZsPQnsGUX3B31yh9RMSO205G0ciWed/Z6z
	mkHxp2uOm1DVk3uX27d13isYeac/Y5VqbCmsFTKd27A==
X-Gm-Gg: AR+sD12o23HWw7jPmQyq78IeANcwruA9jaABDQvFs4A0vrHYn7DYSKcYx3ENMcrsMue
	hBX48EBnJ2+aIH9uUdgGMy52YFPVGAwxHOiYuFfZ/BT2+Dsx0iTH5FaHLQYUzHgZm739UNMbxVc
	OijpIzyD4XJX1S4QJqXBbutzwmMNKiZLLAW7/Ztw++X01I9CCw5/eoBWb6RFpEpN47r2LZRIm/i
	Hv3v0qDvyTudtNrsum/qTBduGKgV2MtNpJRUHpUZEYdYgbxq75YfnCbOqAQzBCLTxll3wkDRN/1
	x/vrOdAvcDcFLjbJwSHCk/CGjooD2dI8ty5Mq79zao/N5b++6Id9Xrqfo6UpiIF2gy4xXAwjMHR
	jTFk=
X-Received: by 2002:a05:6402:51c7:b0:6a3:867f:edd0 with SMTP id
 4fb4d7f45d1cf-6a38a927568mr15910469a12.5.1787073009842; Tue, 18 Aug 2026
 10:10:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810051907.27136-1-phucduc.bui@gmail.com>
In-Reply-To: <20260810051907.27136-1-phucduc.bui@gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 18 Aug 2026 11:09:58 -0600
X-Gm-Features: AcwNN1W0aiakkr2e92E9x-HbBeSLfkJ2O2xbcsCE6IBCSzoDBvWOIXWBuDs1O54
Message-ID: <CANLsYkzHog8P=0Zxnn58zOQZP+RWiVpQxw3EDb4TkPdYxdYMfw@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: stm32_rproc: Propagate errors from optional
 IRQ lookup
To: phucduc.bui@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-remoteproc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Aug 2026 at 23:19, <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
>
> Instead of only checking for -EPROBE_DEFER, propagate all error codes
> returned by platform_get_irq_optional() other than -ENXIO, so that
> failures are properly reported to the caller.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  drivers/remoteproc/stm32_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

I'll pick this up when rc1 comes out.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 632614013dc6..9301e1dab830 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -705,7 +705,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>         int err, irq;
>
>         irq = platform_get_irq_optional(pdev, 0);
> -       if (irq == -EPROBE_DEFER)
> +       if (irq < 0 && irq != -ENXIO)
>                 return irq;
>
>         if (irq > 0) {
> --
> 2.43.0
>
