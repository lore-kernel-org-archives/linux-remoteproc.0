Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0642C11DB
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Nov 2025 17:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764003978; cv=none; b=o6kuEyIgpJXT+WIGhAf1Qu9IJrqiM0Mqqf9lRZMUnSi8/+7y/Yc7G3OGlOCJu9+ZyaNsUmxhwK0P9EHLbGuk5aD5WFSwvWGs0bM7GCTcepPMvRtfcaGFdyAhP8LHMr79u7j+fmuGYdcacYH3PBRh7eUfejGAlZTYktCtsQjNrGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764003978; c=relaxed/simple;
	bh=JYk0DlsmrYkHa9pnunJP5MMBiIh8+pvQoxXtIvOuszA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=anUrKWtsxQ8q0JpsXLdRQkk5N1ZcqPRppDm+Ol9eZmMTf9eOns/+83tdIVDxOyWIKrSuiKceLM6lQ7ANrM1pMdhDvEferQ5Kd/eVx8ZzEF2y6K2x+3uANSe2fAAfnFmccq0Xr61B2bTQsezR54F7DDWAQBWeXnb2yoYccNkF6EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MwUJyBAz; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MwUJyBAz"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2955623e6faso53026495ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 Nov 2025 09:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764003975; x=1764608775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gnHv7SSUkVZXm9MlHQF7vnbKRHnkGY//zn2BWH6fbi8=;
        b=MwUJyBAzQ9279jRUYy/gey3eDSFddfZgnMDp1XBvmQn2JmUMyA94hFPzfFhvrTxi3A
         cJj8Wlz3fXhfF1diLtyLd0BBm+X4O57exrGlyqWjKStfYkF7WEGCcg7+hvEeF7ZWP9Z9
         Li6zEH1tyiNYBB7rSf9Lp/eIIJ9Rnk8JbKeesmrEd/DDc7RDx6LkqhTvo/oQIMGA1MeV
         4wOoUWi7jhf9NoEjlpkwIZTFhV+Gm8wEOlvFIX2DqJda7DpKTjvHv+8QoRT3UMLxK7XW
         X9D0JAadElptu76pPK0UGsiRf7D090GanoeURyTrQfBWkJdLWnsO/n8/VEkk5yH5JeaJ
         7ekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764003975; x=1764608775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnHv7SSUkVZXm9MlHQF7vnbKRHnkGY//zn2BWH6fbi8=;
        b=rMVAglJJdKXaSzBDMwdPXlF38hKf7TxtRE4aeyOD2uY0dZW1bRWX55/DhUfY0FGcFE
         ul8Sr2fA5RLR48dZV/xAI493R9dmLTilgfhR9KQR9bzu72IL9QqFLFfBrG+NBKDxQZ2F
         Gw0PkjwxfGC1Pe9s3aQPQ9wdsBqDw15EPZrmw8JtOZK1CZJ9on0hD9kVnxVP9PuMopux
         A5R3kgwPWAjwPypYjxA5ZEU0P2BQsml5nghBSOpPfIq/nVOeGIMYdUENzbUXPKQoM//w
         LAT+CrNtsqsquGZKDHSwIVMrsrfLaGS4Jrg77y8Z2M+RCKvwHwmlBK76/YTird97F7w7
         ClaA==
X-Forwarded-Encrypted: i=1; AJvYcCUhM8xFzxFkPp5Y7a+nO3heGs0vfhvQFGDcGbfMjyTJOMMrizSLy4PlyElbeEADNnPuhCuDPa8MCgcqDOrfSZkh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7eXL2ej1UIjb+v0GIPiq5z0O3yn9p3Y1WWzD2uW5EUJ50dvwE
	+nVaGWL26zPvezFIzRsqbj8eLLUsGtNPGVdApWscg+9cJkXc98E3FtQ/Vv2LfGDFZDE=
X-Gm-Gg: ASbGncvu/Q5eOmoR9c/hXh+wAGCnHBpr85379Xg41jVQNgC7M+sXekO5hd1KnXvMR7i
	hrO1Zed/t4vVduoqubMz/HxfKGjPuN0SfBKtxvN6+wO3plA6h9Eyq7mFnJJP6Cr+AFe6gMtZPbG
	GThWvsHpCj6NowX5BrkeA9sLT4/lo1dl4/JD/ZLpiD1lXnzdoJEya+ukNR/J0UWXnn00HZc1/Bc
	n1VbniYxyk6VNoNDY/8LZnjrhPwNtkjPhKk3gYx1BhzxlWFo+cZxtIov3L2PIQ4XJI0ys4jiKFg
	B6fw16+16lLaqXrv385nhw3TRiU2Jdbp6Fd+HHLCbyUGAl2rome+WX6OqCR27+IdE29zbb4QWWs
	ZD/9I0BgYuzJ7FldKHQSC/swBQEo+rNvTkFU6m597RDA+7yA8UO6bobVfgPcGADYGbGxnhNCUSv
	N+Zu+vyPQcAvCBCV3qyXBf6YFV
X-Google-Smtp-Source: AGHT+IFFll1ZBv/7+NTNtf66eRKGB3OEh6EXFU3EYSb6koOyW950nZNuI/PfU8U/2nZsnDgImLDneQ==
X-Received: by 2002:a17:903:384c:b0:27c:56af:88ea with SMTP id d9443c01a7336-29b6bfa1f66mr134598965ad.60.1764003974768;
        Mon, 24 Nov 2025 09:06:14 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:aebb:f23e:8a7c:d95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13965csm142296595ad.30.2025.11.24.09.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 09:06:14 -0800 (PST)
Date: Mon, 24 Nov 2025 10:06:11 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-imx@nxp.com, Randy Dunlap <rdunlap@infradead.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Message-ID: <aSSQg22Kt-565T8S@p14s>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104203315.85706-1-shenwei.wang@nxp.com>

On Tue, Nov 04, 2025 at 02:33:10PM -0600, Shenwei Wang wrote:
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
> 
> Changes in v5:
>  - move the gpio-rpmsg.rst from admin-guide to staging directory after
>    discussion with Randy Dunlap.
>  - add include files with some code improvements per Bartosz's comments.
> 
> Changes in v4:
>  - add a documentation to describe the transport protocol per Andrew's
>    comments.
>  - add a new handler to get the gpio direction.
> 
> Changes in v3:
>  - fix various format issue and return value check per Peng 's review
>    comments.
>  - add the logic to also populate the subnodes which are not in the
>    device map per Arnaud's request. (in imx_rproc.c)
>  - update the yaml per Frank's review comments.
> 
> Changes in v2:
>  - re-implemented the gpio driver per Linus Walleij's feedback by using
>    GPIOLIB_IRQCHIP helper library.
>  - fix various format issue per Mathieu/Peng 's review comments.
>  - update the yaml doc per Rob's feedback
> 
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> 
> Shenwei Wang (5):
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
>   docs: staging: gpio-rpmsg: gpio over rpmsg bus
>   gpio: imx-rpmsg: add imx-rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 123 +++++
>  Documentation/staging/gpio-rpmsg.rst          | 202 ++++++++
>  Documentation/staging/index.rst               |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  27 +
>  drivers/gpio/Kconfig                          |  17 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-imx-rpmsg.c                 | 475 ++++++++++++++++++
>  drivers/remoteproc/imx_rproc.c                | 146 ++++++
>  include/linux/rpmsg/imx_rpmsg.h               |  48 ++
>  9 files changed, 1040 insertions(+)

I started reviewing this set.  Given the size and amount of comments to go
through, it will likely take me several days.  I will tell you when I am done.

Even at this early stage of review on my side, I can already confirm the only
way to move forward with this set is by reaching a consensus that includes
Andrew, Arneaud and Linus W.

Thanks,
Mathieu

>  create mode 100644 Documentation/staging/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-imx-rpmsg.c
>  create mode 100644 include/linux/rpmsg/imx_rpmsg.h
> 
> --
> 2.43.0
> 
