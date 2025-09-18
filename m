Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3011C101F2
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Sep 2025 12:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758198643; cv=none; b=lMPucFJF5nEdKOHELpDOaAR50+ftJbi1VLUqaLoRAeoa9/oSk4furdW5ch9ysJT1Uxe/e+p31/eGn5gsktNXJqe6bYcQmWO1uBQoMDDvmLfpquMw2qYVWY7pWOVbWbMAVnt6QlIIZIbgywFauvrl0cHqWeIarWRpBeMkR2tLQbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758198643; c=relaxed/simple;
	bh=hFnQmhtB5FdUouz9wOMjSFsEfEpZDGlWnR0IKMEjviw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eKqE4+SDdft2ZzVcJMSte1ZVucHUIgxslfDi7305j6/55LB/c0xR7f/timS1TFS5FX/bIQbFm+NpoJFB2N49CoHVQma/q85ooupi8yKY8k3cIKIsco5xPhLxrSH2KuTE+3g8repAx61Mv6qy/P4SpLuS2mboqJmvVaOwyZ8ZCsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRGXxpD3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRGXxpD3"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-24b13313b1bso6356645ad.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Sep 2025 05:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758198641; x=1758803441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ja6LsTNawGy4pmDnATZPCfzTVrsSk5wN9q0e+DceoU8=;
        b=bRGXxpD3ZIyxEkVfPJ48lb6z09Orn0+ZOlI4e0AqFqo3eM+DpBs6pV+OWG8gMLb2x1
         3DTFmaUcFBRu3SKNwtFLELoeVWXL6N0mcSEWp1TTK4+i2bjSqOK4OpaCe+VgAlmac4IU
         nGrDL5CVMnylKfcGOwzAEn30f99GzPJNHe1J9zTgqJFLpUcz8pdMy5NJL0ylk5TPMRa8
         aIX7DDHe904vf8jYA0vJR9VOteiPcuCOrV45yt3OhMAzXyT523cWx65XmUPE9sgXh9gg
         xfx1Hsl14YlGs7CGQyHHf+ofKhfW8cLxzy7IDQsf3ILoK8sBFycn6OKfwhTBsjT8+3G+
         2bUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758198641; x=1758803441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ja6LsTNawGy4pmDnATZPCfzTVrsSk5wN9q0e+DceoU8=;
        b=HNdwt+TtNDKxIVrNR6YXinvxkYOcnY7k27mOCVs5EA+KJtdJupO8ZPHUeEDWVlbos3
         yEC946zJPpnPrFOTsIc5UHo/dyNfwhnyhtnQ0lSf6ETYvCkl0lJzC+F5GVLJa3/Ek605
         eFQ3l4i4AJDX8YXf3p01S7dgO+hne2vPZtSkXZBTjgyJyjTs/pbLb3B4Hh4p0RkPaRal
         6BZqgZcAEgBasHdQB8iF0wv0Xh6qj8n0lZeppu9W04uPDhzdY5490Uvjim6bdVexoLrD
         q7uptZYhG4JPRNOEmZ17vXH5bXItYZGOKYldDqvIIpy8tHtZYOEjKTbIj/ctYwYaWt7i
         WEYA==
X-Forwarded-Encrypted: i=1; AJvYcCV8UadwmZLKQA4gQ/6xu+UmCXd7C1A6U9yXixPUBvMEh5isV6j8634Cr7cbY5t8OD+3T7Qnql5sa93R3/7fQh9W@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/e+t7VJLK2uwqScMQhNiJOWCw2yOvFkPn9fX+zORMFTZqEoel
	e4f1yp1txbbkXpKtIa1KOzYO0Dv5yrEUMNgubnkQDLQXybwdwBDb3TADOC9HEulFs9Bcxthql1a
	Ji7gESo0CB6dpnQCYCcYvLzzD6PfTaus=
X-Gm-Gg: ASbGncvdguek1RjAbWjcnqwKig5AsMmCyXEp9DTV/9rVRTCoNfbDttRFp5M781BhpRs
	F3Hd+FHvLUv6i+KUl+sXgUf/8Z/kVXmg7MDtA9okhgOD6T7AfIqrHY2v9rl16hVMCto8+jx5tVN
	7Rr2xGcQCLBe5nmOhrMg97Xt5rZ5VWGeu0CQpf2LuZszxrGggKNKSSnfpSeYnGjvkPNsN0Wcg4q
	MAD/W9wtwB/0c3C9Uthg0VUdJ9hxgCAIuhGt3dL78A3asEcABrEmEIXbWajC0kPCA==
X-Google-Smtp-Source: AGHT+IHfxVH6u3MLt6Uuih0vzSbpLygF4jPPQ9s8yqLw/oxh8/QW2NTZ+3Q+TitB6KAglFx0XO0/v8MormCOdtkYPDY=
X-Received: by 2002:a17:902:d4c1:b0:266:702a:616b with SMTP id
 d9443c01a7336-2681228a5cbmr84479475ad.18.1758198641200; Thu, 18 Sep 2025
 05:30:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com> <20250918-imx_rproc_c2-v1-1-deec8183185f@nxp.com>
In-Reply-To: <20250918-imx_rproc_c2-v1-1-deec8183185f@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 18 Sep 2025 15:32:58 +0300
X-Gm-Features: AS18NWDb4GfzMHKRtymYoCSSIMdUKa-LQpWcaz1XI-CRyqhVc2xtdOdWO6gJCWo
Message-ID: <CAEnQRZB2ZkcRirj1SZkfbsPHyyGr5PfnCDfv+ZuMu_Mj6XKBEQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] remoteproc: imx_rproc: Simplify clock enable logic
 using dcfg flags
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 2:51=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> Simplify the clock enable logic by removing the dedicated
> imx_rproc_clk_enable() function and integrate the clock handling directly
> into the probe function to simplify the code.
>
> Add a new IMX_RPROC_NEED_CLKS flag in dcfg to indicate whether clock
> management is required for a given SoC. Update probe logic to conditional=
ly
> enable clocks based on the new flag.
>

<snip>

> -               return dev_err_probe(dev, ret, "failed to enable clks\n")=
;
> +       /* Remote core is under control of Linux or clock is not managed =
by firmware */

I see that you negate the comment from imx_rproc_clk_enable but with
the negation
OR becomes AND.

So, the comment should be:

/* Handle clocks when remote core is under control of Linux AND the
clocks are not managed by remote side  FW */

Also, do we really need this flag?
Shouldn't we just make a decision based on the fact that clk is in the
device tree or not?

> +       if (dcfg->flags & IMX_RPROC_NEED_CLKS) {
> +               priv->clk =3D devm_clk_get_enabled(dev, NULL);
> +               if (IS_ERR(priv->clk))
> +                       return dev_err_probe(dev, PTR_ERR(priv->clk), "Fa=
iled to enable clock\n");
