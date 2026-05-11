Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CED2E2DF3
	for <linux-remoteproc@vger.kernel.org>; Mon, 11 May 2026 17:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519272; cv=pass; b=UyV6cb7pUNuMnaEfZWb8mJQqyEicm7TNpzQvFPQajxgVBC5I4/aGPQkVkkWqcQ9HSs1quVK9Zluv840pSMmZa/4DZuVxJWv2loClH/ZzcrgB6avAmRLMi6n9jbjN7NNGykauclSEsRWQBMH7PFiF4mNqRgH+/FVQHnGkdVlUIS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519272; c=relaxed/simple;
	bh=7GhCI9AhWgUdS+8+tjS5pyqtuvrqYJJDRvj+OCtchLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJEJ9lG1ZExHM02VXQMCrx2V2lsJOQ4IdNqdq6f7BPjzAjYDnjJ+TuMtBLx29w98N9abg+zXvYzkMR34n9uDeNz6aXCX7qjDarLomsSA8mncQDKlEJkKYb9K0vrZc7D/zuXwN+Ix2C+f4uWhOwfjCALakFhaNRcEbUv3WfqT9yY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LIlhcuyt; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LIlhcuyt"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bcda7765d64so279284966b.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 May 2026 10:07:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778519269; cv=none;
        d=google.com; s=arc-20240605;
        b=D82pbL+ymJb4ZsgTCIlnZK5e9jnp9Z6MC1RX4uoiXABWhgWPjl4i0laa4K6wgTxVJT
         j/EzGr/dlMlJ8r0NJ1KSPcRHI51/MvFWo2OtA2um9MiMuKS51LX4J5hlcw2RpT2XgNII
         PztLCJexpVxbhT+5dX8bNS2cZ9tGNRd2Eo3LJIKm7ubStJSc7pEVaQHWte4X6EHmSmvL
         Ic/THBdq8o0C/ZUd10Z/kbuveT6uEd6e9Sd4dc7O29AgTByBtHJevjq/FCTE9/nW/39I
         xL4h6G50/W+dGuvdd7C32ueAOVtRPKfwsW2FhwQRV5gX7JOqQXuqRdotOGAwAbwL3oij
         Dx/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I/eWkxVbwCJi4fviG37ZdresVY6FlsKqOTbZfFTd3O4=;
        fh=xaBvdyzn/mMa+t4mZFzQC08LVrCag3ExU0Va/Q41WuM=;
        b=IuT6hJCZXfKvH1ObYc7KxnoNIDLnguXjsgjtkfF6402K7a+QvcVZrdPC97f8TZTpff
         NCQxXIb0xL5HS2NFuFXBxOi1MI8EwCZ7sMMD2A9+Kav3t/DXHT3xkm7lEX9Bf3FxtuA/
         btFkm5Yu7qKuDPUn6TGeI+WJiuomKUhprh495x5JtrpKoWhHj55JGD67U5/36Lf6M6sa
         gw8wCLiN7gygrYQsoCAc12IYIeXUOfk1xQYG9y+fT3KL5ENpglF/+uY+4yjqNCOrBiF4
         FBe9XDJKcaVEkqTMLx8L2ti8+E/RKW5PV3eJa0Ds+Jk4NaH+V/q0cvVrh6q/3oyWjqe6
         tL4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778519269; x=1779124069; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I/eWkxVbwCJi4fviG37ZdresVY6FlsKqOTbZfFTd3O4=;
        b=LIlhcuytzz6yY6tz3lIbFjA+Bs19hH1zuMvLDbCZyUZ8wm8bLd88McL24SNMFbg7V4
         Vx4aSpvZxdeabcf3lCU0W09EbNT255VbmZ/kv8ekq8jgRAaQpslvHU/GxOC8EduUiVV7
         wkZk43NSZXjYQmBoGxuu+EZDYKUxMBAsafA77KcgVVtkt0afYtJpI9oXYAoPSyAn5xA0
         B8YpXzWBIgGdxjRzfgQUytcLeRAW0LfNOSVSaLlRuBOijpOl8RIhp5WZ7f0FnqVCkM0Y
         1uom5RcRYxn5Mbhqy8mztmghvdeyyvBe68/hiB+tGjwFIC3pee7Es0EYDzG+BKlgCpF7
         QBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519269; x=1779124069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/eWkxVbwCJi4fviG37ZdresVY6FlsKqOTbZfFTd3O4=;
        b=dH+UHdGRS28R9/U9DGKFhNgVbDHDE9jvdhlYohemayIyKS7K5vFkxF1QE3NF791hl+
         xn/l6OoeNjbRUccTfdRDfOpVKjYL2xu8UtN5AboQ7jXlrE4nb/9MekAyGS38QgC71cNu
         Z6dbvLZ4bBJBcF8sKq6wcIAT6X/PL44DJPxMeW4kFj9JblcqXDDbAqawBkLhgdftjLTW
         rhadDLZgiqAaKHbOX7rvfaSOW2y+oS3nsq9kQK47ublXbqkm4NcTRv7zxgvuU/1PkQxA
         9fWE8QF+PM+6+KNF5YtnVGVjkDFQjhAVT3h3pS788zRE4DHjR9HtOqrubzJ1Nu45LLJo
         0ofw==
X-Forwarded-Encrypted: i=1; AFNElJ+uSGSlweCAcez2/SZ9zc/wNKiF989E0zNFoSwyoZVsoHyb92giKYHjuWt659lAsQYT78dYg74MKlOmJMumRKVQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/h5Oj/MV4goxn0B1Cwc6KINZNdo4xmM4vo8DmHhg5OXda5h2r
	ehV/vEoiKb+dZjfWNLC6IyQhz4rkZfZZ8k8XkgtyUgWHjyhimfXoSLWKEqwrSGXQ8rAtf9wHiNQ
	5k9MnfMYqUDLQuwOQmibx2yc1g1oUxZQ1KYZpBzbRRj5Eg69uSzdm
X-Gm-Gg: Acq92OGSmPURPzq3y6Rc8e2QzidLX94oSCE4GL1k2t/39pnUmKwExy3a33HLaPvowsq
	yhcgkJfpERyGwXsDuMBatkAwx9C1ONXhHXfPX5Cf+0Yg7/PQRmHo5Z0U81Unvu2ckmjgoedzC2g
	TM/+zrr2XAcrmz4svyfLl/SPexUUBOjfmLGL1Vb3UJfK/+ds19FSeEzOErk47A4X+cnkcEo9OLb
	P5lxJdJdt0RPD3JmF6sHApZOYs01mJlxGMCTz4wB+DRB0+m2zdmnf0Z7PvEAOG9zHy7SXRz+CqU
	ynByS3PEkWdMLC2nWMwFYRWP24FZxYOnww5MxKiPJA==
X-Received: by 2002:a17:907:7241:b0:b98:8494:3174 with SMTP id
 a640c23a62f3a-bd23cefd076mr22158766b.24.1778519268980; Mon, 11 May 2026
 10:07:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509115719.12546-1-Zhiqiang.Hou@nxp.com>
In-Reply-To: <20260509115719.12546-1-Zhiqiang.Hou@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 11 May 2026 11:07:37 -0600
X-Gm-Features: AVHnY4II3uL7VMLf38N5WMkRQDRE4eLBmdCpHOIITPZV1IHf9hjN-dk40YLWOM4
Message-ID: <CANLsYkzB8CcJ-dpxPjkDYqVDxw2oz4p+xThiWQaDYbWAp__eNg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: add lost DRAM range for i.MX93
To: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
Cc: imx@lists.linux.dev, linux-remoteproc@vger.kernel.org, 
	andersson@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	festevam@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 9 May 2026 at 05:54, Zhiqiang Hou <Zhiqiang.Hou@nxp.com> wrote:
>
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>
> The M33 DRAM view of 256MB ranges 0x[a,b]0000000 are mapped to
> 0xa0000000 of A55 mapping view.
>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 7f54322244aca..175c2d3099794 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -198,6 +198,9 @@ static const struct imx_rproc_att imx_rproc_att_imx93[] = {
>         { 0x80000000, 0x80000000, 0x10000000, 0 },
>         { 0x90000000, 0x80000000, 0x10000000, 0 },
>
> +       { 0xA0000000, 0xA0000000, 0x10000000, 0 },
> +       { 0xB0000000, 0xA0000000, 0x10000000, 0 },
> +

Based on what this patch does, I'm not sure the word "lost" in the
subject is accurate.  Would something like "missing" better?

Thanks,
Mathieu

>         { 0xC0000000, 0xC0000000, 0x10000000, 0 },
>         { 0xD0000000, 0xC0000000, 0x10000000, 0 },
>  };
> --
> 2.43.0
>
