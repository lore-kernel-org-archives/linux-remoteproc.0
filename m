Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519422BD01B
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 20:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755722966; cv=none; b=gUDe0C14WQbr4uP/e0NhjOJ6Y+/1AVgv2whr8+EQuLqKVs/k82rBVHhF5rV+U4lW1hyQMfEfvRPbAoUZDgQ9kl6v92oz2ChFM7G+DcO+F0Kfg7/DxUIkcGyiA0UTFWPFCq0OmxAqR7m1VrBiSPUf7oCICRnDaGAedhyfN247YUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755722966; c=relaxed/simple;
	bh=2VLSz3wHxmzDBw+7dDQ0rcBNHyEKToxUIFKa/DJSnxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3hPQRHndA7wU76wcEF9TRvCcv8ysMoj0YtucGB1Vgw6CFiSOhcjFU5/7O8AS7umXEJGqIVlJfR3o71a2NqcHCO0FlnGec608cD+BeO2WiEThH9bsBh6DBt7LR34qhm0Kg4GRgdg+5NzKWhHarRHCgAr7+CHZl9OVhaYThbkESo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j44rFRcz; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j44rFRcz"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so348987b3a.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 13:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755722964; x=1756327764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4v/yTvx7RBI8LtWbJxBxyTglyBh+fQ/yrAxsVqZVRi0=;
        b=j44rFRcz56iTxoqRAjGVCqA+LNjXtfSubuNhTWeLQ8yor0L7Lwxm5zcpPWdmbmRAvd
         H4YbaNeAxgBgTmJ06oKBIjzSSGNMDTwUAWzxeHZ/TCEk4vH5yE+kMQ1fCt5Nm9/f6Klk
         6+j5ixJy8xaVQYy+e2p1CBV4OzX89tpOyT3yhz6OfsEmCr13FvYqHvMC/E7CkaInI5MN
         AQzOpMZegvxyitrFMSj2kVuGHRyhqsBCH73B76cBIdjUl2f2W3I4c39YpFqVCoaDM44P
         2QrecQoXMmleHiMdg2tpWxNCnWOb/A/O90ySv9OCOadjtyDAtKJGAxPMPHRqfSfBBkKM
         maLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755722964; x=1756327764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4v/yTvx7RBI8LtWbJxBxyTglyBh+fQ/yrAxsVqZVRi0=;
        b=mLb0B1wmnUhJRKBuUaAWh7429QeGLn1Q9SOJdJlvowI/MKSJ47vpx5/I4PQ2gsMnJg
         sUzCpjH9Kjk6YIsVhOO0vYEPMB6Vk2CKNDEkjmQ6AZypD1VarldnGr3rJl9pPdY7QWC4
         lexHwGYvhT0ehl9WHs4dINbCdhsQiLlpj9bvfD54GEM4uwIB/X4X7dW9ZTFjTfgy7mzo
         5daMybIQgzMK7yh/JjiOzmDvYyhuiSfP5HbJfk4PYcr9EAeHEOrMvtuLJyBncd6eREvk
         4+F2wiPGQZQHP6ItgHsf+1aAePP2HCRnnDhOj9B719zRiYjiRPDtV1FgVo5hdP6dagUV
         Yc6A==
X-Forwarded-Encrypted: i=1; AJvYcCWZgtRDBSnUcuFosC46QDs9L+/wSyj73z+mDT9S2fBbN4SxbSHcxwed0d/r94O4TfhcxJLx5xj1zpFHpsRgKLwb@vger.kernel.org
X-Gm-Message-State: AOJu0YzNc5MFgILwLnfYkAV2fi/3b3/RZ/Wi9yqa6ZdzemqFOBeA0vdI
	f0bnNrh3PjrlGi/YWgsl0fJqZ8CVYkyYrDGAhp7ymUeQfa96x6LDsmo73HHEKKvUx9M=
X-Gm-Gg: ASbGncuT9vXMSatnpMziBKB44LzAbFOJfFcAEiFqdGNmVKZcfIDOJvX7hsHSX3X39zW
	LQtKjw9f5Tck/1lKC48Q/BHAEREL4+rpbGre4i5XaXCeW3HCymzgk58lhgssKg9g9Beh4D6poI2
	RgoTEV1PtoUDflt8DeJZjT9YYBc81YJNBH+9SYllmvhi4NV2GloxL0HneAsaxAPrv10mIAsKI3E
	6btU7p9U5WsgbbmK4mGDxro6K9s35Gh6KWOFn1RnOMiNbOFNQMR4UqaoTS4xaPZ9ydXgfzqv/C/
	EyaZDGTvEpYnhXAbDLnxvBXebhiIswRITXV3m2vOgea28JJt1Q40paKknqSiWOzknPECvvR9hmn
	rxbMNUAJp9an0hTDDD6getOy87w==
X-Google-Smtp-Source: AGHT+IGhgPqqfmRMNGx86fAr6FlVuQIPW8YOrUg5lPs2NO14D0x2SMo+UNh8zB+5H+CHAosyVL/RUA==
X-Received: by 2002:a05:6a20:3ca8:b0:23d:7a30:a82d with SMTP id adf61e73a8af0-2432c196a3cmr1194253637.5.1755722964369;
        Wed, 20 Aug 2025 13:49:24 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ed3c:56fb:c00a:205e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d1522sm6263547b3a.18.2025.08.20.13.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:49:23 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:49:21 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
Message-ID: <aKY00cmV0NnOlAmx@p14s>
References: <20250818204420.794554-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818204420.794554-1-shenwei.wang@nxp.com>

Did you send me a patchset that doesn't clear checkpatch.pl?

On Mon, Aug 18, 2025 at 03:44:16PM -0500, Shenwei Wang wrote:
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
> 
> The expected DTS layout structure is following:
> 
>     cm33: remoteproc-cm33 {
>              compatible = "fsl,imx8ulp-cm33";
> 
>              rpmsg {
>                      rpmsg-io-channel {
>                              gpio@0 {
>                                      compatible = "fsl,imx-rpmsg-gpio";
>                                      reg = <0>;
>                              };
> 
>                              gpio@1 {
>                                      compatible = "fsl,imx-rpmsg-gpio";
>                                      reg = <1>;
>                              };
> 
>                              ...
>                      };
> 
>                      rpmsg-i2c-channel {
>                              i2c@0 {
>                                      compatible = "fsl,imx-rpmsg-i2c";
>                                      reg = <0>;
>                              };
>                      };
> 
>                      ...
>              };
>      };
> 
> 
> Shenwei Wang (4):
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
>   gpio: imx-rpmsg: add imx-rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 117 ++++
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  27 +
>  drivers/gpio/Kconfig                          |  11 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-imx-rpmsg.c                 | 559 ++++++++++++++++++
>  drivers/remoteproc/imx_rproc.c                | 125 ++++
>  include/linux/imx_rpmsg.h                     |  55 ++
>  7 files changed, 895 insertions(+)
>  create mode 100644 drivers/gpio/gpio-imx-rpmsg.c
>  create mode 100644 include/linux/imx_rpmsg.h
> 
> --
> 2.43.0
> 
