Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28042C0F6D
	for <linux-remoteproc@vger.kernel.org>; Fri,  7 Nov 2025 07:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762502056; cv=none; b=HQlBwyt8shYLerXWLdb2EhGKHy+mVX7GmgVEXtSnDIM6TFc5ErlPpnnrVnIlbAquChHw5ZwyD9pubOW5aG5G3UIA5sQQ4MM3yctum8nnp55RuMsq8FE58r5uMa85OvZwH3+MsKQUxZSKLLc4NbT6bhWsFKiC1huGB5B3dy2kjJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762502056; c=relaxed/simple;
	bh=hht2khT+M/paWxzoLF4glbCzxzDG6WfHD/Jh8JDmVm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bWKVbCDOLphrnnPOTaN+bZEQOsJy/PR2+vNOP8jv1j620hj2vMNwOlWJZB6IH5DcYqeCyvOmlyJd2NDzIIVA5X9i7jPH2C+knZ/wB6vo7KJ+wLSU41f4zta9mUu6X7NvXhrn+84OZX8tLdM3orfJDsX5Rmd5VlNltPY347F30bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqmsZeXn; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqmsZeXn"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7aad4823079so453024b3a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 06 Nov 2025 23:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762502054; x=1763106854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hht2khT+M/paWxzoLF4glbCzxzDG6WfHD/Jh8JDmVm8=;
        b=dqmsZeXnah3owgv9LU0TB/AZDmVzNCwm1AATRL8aG2Rur5PLhtJZ3sQkQl0W2DfAWy
         71EPUf/DQ9ddYGflNciTusRdjd03tZ7fRBfVIvnyhQyiGsR2cnUMqp2RGzbbzKlKSXjq
         Sm4CKgtEdn0iDEiW7E5oTc1i5PMgPvJzSewDHDRggUgpaymPyYz7695a/VzZrA7r719M
         KghSiL10cU++5uhit8q2wd2pEQCOqGNI0JgCiHScV9+OntAuJU+/DZpLgNPzpHKmDtJE
         uaVLMAEl9BQeiVi9wc+R9/PkymLZpCiz4auNfP64Q26UaovpfmX3Y4iFvK2Lm9x43r2m
         xgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762502054; x=1763106854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hht2khT+M/paWxzoLF4glbCzxzDG6WfHD/Jh8JDmVm8=;
        b=H8DRQsCcHLIHLMST3bslzrMrm9HOGG8m2x9rvVJOiAWVcqlKKYDsOIBkyq498g9XD6
         5d92FBlmSxH/tG1nj/bgLfhTZ1RW36CbTLEhkrS8uh3zRH0+xROD3klSOgeiyrPazUhv
         sJsGCSyN0m9Jc4u5iup+BjSHeKays9jdUqM8j1wRMAByY2Rfwf7XqSsHJmOwKEqi4HFm
         obspK04wa1aSHp/FCJrxHbOyITyXDNFlvIrsz81cGthH2GUfuSwI8DbNws0oTLEb4PWS
         keh89VRW4oe9mXr3JAdhNZEl66R5Bn7ttMac3G+JcgFCt4bt+mzpYlHtB0OVxL6t89kp
         t/Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVPRwy8DifyK0R2EbEzWa2f2P2EPTEnFU9xCrKhOtucxutljfLOff85kMRITUiOv6kcbrccQulv0iXBxGBEqJuN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx92nsXdAWkehas69HD2bANIgrQxeBebS1CWVWD6JwBHMvxbWmB
	h3VT3Uys8XfsIFvgtFTAG1CuhgTPxz5Tnn3gnY+yUFOPB30Ev298v1yZw9A/Nrh9BfDtn0rqQjk
	lCryc239ssht8nCBzQ371O5mUMDPtJr4=
X-Gm-Gg: ASbGncsRQViUfQ5eBHDgi8Rc+THtzE+YyC+dzTg09iAuHhtZt+KoWS+jyHti8TSGWaB
	G9nZVsvV3AZsyyMyIf9sXvoj9r9Sckxmahx0bky7ufnS5qnnaKZ1VaH/fAfZotFa9ZqlpR8qj6u
	RlCTcxH08Sd18CMxZ8i1M76hUTK8zL98SgkooNNtD0KA8yjJB1qr6TCAcCg+0OssvWH3iAZZ6Dw
	ymhnT5x9y1ckPyL+ctpyKFRJVIvzhrD/b0J4TkDSEYWmjvIpC/piz+DsA==
X-Google-Smtp-Source: AGHT+IHL0mKF9QQYctg7K2SDNNvhbCsy5jQOa37KMcgcdBvRiNDOg88v8nsypzK+cTSQzbs7MXiMalVatyoMujxAM6A=
X-Received: by 2002:a05:6a20:914f:b0:334:8e2e:2c55 with SMTP id
 adf61e73a8af0-35228572ba4mr3084918637.18.1762502054278; Thu, 06 Nov 2025
 23:54:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com> <20251031-imx95-rproc-2025-10-31-v2-3-758b2e547a55@nxp.com>
In-Reply-To: <20251031-imx95-rproc-2025-10-31-v2-3-758b2e547a55@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 7 Nov 2025 09:56:40 +0200
X-Gm-Features: AWmQ_bldmBxOD-3eNLQss-begsdemT3T5zDmdImzkOkUALSL6znnWYvoGByIzsQ
Message-ID: <CAEnQRZB4szsOxtP2QmRdpwR+ZJ+8ydGg8hGAo5DqHC=tw23M8A@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] remoteproc: imx_rproc: Introduce prepare ops for imx_rproc_dcfg
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 4:28=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> Allow each platform to provide its own prepare operations, preparing
> for i.MX95 LMM and CPU ops support.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
