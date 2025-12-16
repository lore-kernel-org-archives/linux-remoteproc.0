Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2259730E0C0
	for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 08:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765875015; cv=none; b=c6zlmwq/PJJ1G18Mj8A1/iQ5y09PpG26syqcwqQFG5vSdpTGDvIPWrZ/ViDi+bpVcjS3FsC1Thw0C+uSDs2a3SfDfGL6U6BbkvcRQDc1BhZ6bAgikNHkVSrlj27K82e0PRxsmPu45hlhId/qLnUG5CluSM0P0ScgtMf6toXQaH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765875015; c=relaxed/simple;
	bh=ZUFe47qtGYjU5Yn2pY9F8UI7JZG74YZxx2wQ1k0dRgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPO+2FPfQdSUf7m5Io2nwnAVakEqL30ftPw3SDvNAN3hd1ncVMNWYxBaQI5DfOqUa8j2W6ncmIaFYs8zR6GL36pgaK+lLa2bQSP4UZq1Xle8h1KvNjHrhizcjWLEgT3ohvtIYYVm/uIMRHtbcHq1AaEkSBNZqz0Nsajao7ytngo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLx1dA7n; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLx1dA7n"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0bae9aca3so30520205ad.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 00:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765875008; x=1766479808; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUFe47qtGYjU5Yn2pY9F8UI7JZG74YZxx2wQ1k0dRgg=;
        b=KLx1dA7nXlar4Y1RdRs0omA7As1afxUv9e3HsIYvmlzdQTXQKDS0SjLLzM+D6//q3Z
         6v5iui5VRkvcKsQLq9wuIIm+cxmos+gxdSSluJ2OD84dXEyuVBhE6m5wmTMBMo799j6f
         NlP+sFlq1e+vFYK4ObfQ4U+G5F46HHMdhOpwZz7HxeC9Q+skDaCytlKKWaC60T3wGLJ6
         jUrZ/bFOh3NIe/3YgAk+7+gnjcySNBVWV0GxSXX9eJQrV2la3XU0poyI/p14Yt173Yq8
         f37fKwDHO7brD1NG6Y0lhGjNBG7VZ1sCLrpZ+g/54/yWeATG9DdhL6SB6XqhndOVkax4
         6F5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765875008; x=1766479808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZUFe47qtGYjU5Yn2pY9F8UI7JZG74YZxx2wQ1k0dRgg=;
        b=Zr5uCSq8TNOG86E6FHKKPbygKYrvu9v0/urVuuOqDrq6oRQJyrI6icoRorVA5gc7Pc
         ojUvSL0tkS2031OFz78KUEsmlqeN3OvHBwrvmuLb6iqREYUhzoXDHkLda30Hc1UJVOf+
         L3hbvJ5Mu8iMfaTvnUkhiL9b8oRDbT3UjyoJB/incEJf00pPTSrhiSGXvI5QqU25i2eA
         3vwEf/W0jnaFvEnHEyHNUwueC55NXwkOu7JN2hb2FOF9Jr+uiy1z51Z3+8mRKdB5+x4h
         vEtv3oXU/2u+xBsIpWLxyzVZ9ZMDFALxsVT8p7MvZnkZOW7s53TY6boTd9AXgS5OdsmY
         xtyw==
X-Forwarded-Encrypted: i=1; AJvYcCVjxz6D7dewYE/+Y3JWeY0Rm+17x+27DXHnRiIaHvLfsVrRZeDQT1Uw8I+oh29ztV3F3wT/unhtGiryO0/CPA3P@vger.kernel.org
X-Gm-Message-State: AOJu0YwG0HA8C+QqZCYGYXmu1CyScvFwTHBemvSB5MeENAcdvhxPzjEF
	W+tu54F8e/9uVHOEUeOeq6Gp5X8ZSMKjmOuAPxosFwLHridcP+IjbcOX8t9EBnHoiqN89feJfNH
	i/h6z40EPTtu2OuXyeacyH4iFO5D8c0w=
X-Gm-Gg: AY/fxX5HscHvcH3uOvx5HS3zmoTnODBMBUeV+NVTJkZblg9HiWYly1RF7q76mxzwS+s
	eWshRPXS/r4fVpTBwNGQVyL+fG6nWxBBOYpiy1orP+hmvpVKYB+aBCCtNIpC0SP/Pf48843bCL7
	/j1XVZhsuRwIZU19mow9pqMhYt95JdIz9f/mY26I50miJgbvFiqh4Xe+ODSOkU7o9hYcd49m3Am
	vpexk9ytiZuduQBMP8MbaWObQGtdMkzflyPG7wGm7WdGgBcBXTI8zF+jFDwCq+VIRcl8DtwZaBh
	fw279kscreLGcq75U/y4ZN+u+9ONjHPVKnJI7KohYDDsyMuBb7bQp1FJwXdZHzDJ6AUND2KYh0N
	lZb7iAlgWQWCx0YeU8U5G
X-Google-Smtp-Source: AGHT+IFdZYFT+NIwzhAXA50MF6zrj86tN0JwKIahPILeOcWuOCFok0qYlbb+VZx5E16t5BM86z6amXtW1CuiK+Z1D7g=
X-Received: by 2002:a05:7022:5f04:b0:11b:88a7:e1b0 with SMTP id
 a92af1059eb24-11f354cd726mr6498824c88.26.1765875007985; Tue, 16 Dec 2025
 00:50:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216074216.447193-1-shengjiu.wang@nxp.com>
In-Reply-To: <20251216074216.447193-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 16 Dec 2025 10:52:38 +0200
X-Gm-Features: AQt7F2qAJy_LSqPhNedKh08SXl3wUZHMX7Nrl3yXqFHsKDgpXLFzkxbItF2FoEo
Message-ID: <CAEnQRZCZe3z8F7TsFdCz5P6mu6qzGkdoqC76XkyCCzQz+pSpmA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_dsp_rproc: only reset carveout memory at
 RPROC_OFFLINE state
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	daniel.baluta@nxp.com, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 9:59=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> Don't need to reset memory at suspend and resume stage, because some
> memory is used to save the software state for resume, if it is cleared,
> the resume operation can fail.

I would rephrase this as "Do not reset memory ...".

"Don't need .." suggests that this operation is unnecessary, but not wrong.

With that,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
