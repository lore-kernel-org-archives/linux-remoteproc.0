Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43868523A
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Mar 2025 15:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741880816; cv=none; b=QN7h6k6URpesAmglnbxlN/mk6A1j8nfyeIHIl6QTFLlolZOiy4nVKJjN6N+WVm9NhDUIVga8BH2m8sR/O/EpZOcFq0S4RvTY/tz/d0Wja5JuDi41kSl1gf4YcEDuQnFyG3IJyO7O+HiILLzx7jB1j2LK1LR8420OYB42WvijuDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741880816; c=relaxed/simple;
	bh=8rhT5K5h5si2y4Q7V7FrHe+5lvc9WpW5/QmzS2Xdq6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MypXz3fbSJ2d8HHQBcwFs8mEMQs/f58kc9HgotNBvW7bZ72UeEf2QB7WLpXrhO6mnM+Wa4aATvipISOBzJOfRxd1c1JE2f9ZgcNkWQ+i/jQ7eVtkdNBAiSd0H8Lr/nxQmBeW6inzX15WavnNBsv7th4hVxiRZ/zUekOBdkA9AyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=loqoAOxs; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="loqoAOxs"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2235189adaeso22326545ad.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 13 Mar 2025 08:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741880813; x=1742485613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/dk/KVdNUO+2NCTC/VAHji5cbX9MUum8KYD6NkCMODY=;
        b=loqoAOxsrNCT+KT4/XZN3NjJrlW0ZlWYuqvo7jp1T5GyvQietaJgifeQ9EoGNYPIY2
         YiGm9ObGouzNkrOPoBUsGsLuBvbjfEMMkfx7a0ORhcj2FUQI8/fJ7HHt9Rk6vW3LKMix
         ZNRcaajWUiVQpZMtoYM3v2ykLRd1UIUp8uWDd5kWG2ZODcUzroAPQR6UWHgQhNHhO3qA
         edeIlUH0qpmvdPq+61JdXLOfn4ORfgfUDQUsPUxjNC1EG2hLUaDZ0jb8DAraUeqxtWv0
         odVvKD1L+9dS3HwnPZcZzvKoHa0NucYx7DXpom3S+VyNAi/6IK8G9/My5ud3pnNi2L0L
         vtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741880813; x=1742485613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dk/KVdNUO+2NCTC/VAHji5cbX9MUum8KYD6NkCMODY=;
        b=X7bhaaq3b0+rFlL121LKcTMmg+2jIWZ3y/3AZAjIOO126TZlGBMt+Do4DRhtebeiXN
         /b5HXOSRt2pvwKLUtQwbjInl8ppy6c4JuW+rtb0MGmxYveWLs2Fs4K9W+fETxOGiCujA
         MbdaPlPsi0rFeuCqIEInVco+u7A8C68n4WqNrXXz3cQafthHDLlqMcDXi/g8mZoJR5E2
         0NTgXJFqydnKFPk5sX0tjdK70+BXU+TcI5Kt5Ky0WD5puHYKOJFf/e9fAs5X8EnFmp7T
         Kgavu6AC1LZJ45T4wIVsP/0uHZQBG0gndRqlQ6SRQgaCdS2HJsO+klyh77ZQ99DWfJUn
         VW9w==
X-Forwarded-Encrypted: i=1; AJvYcCWolaFklfTtBQ7KiPuJuXVOaxPY7A9HLpJU1Me6q4oI5qGUI9GK1xnqVHZdZZhXvn65lfR3OoDp06U/G5BDca29@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz2I/pB/Oj4lwIeJqPdmj8vPwIEgqHR1pkYYH2Zd3xxD0zDr3m
	olvJzJk4YLdzrb42VMoMFmTr4Kk4t2UvXr4zX+FPaFJ7pPHi2hReAkgg4JAJ2Xw=
X-Gm-Gg: ASbGnctdDGESjL060RaQ873PnXwaY+FO0JG99m3QCYlB3Zmsq2GEF/Je0JFvsI7iU7t
	Z7zd0Da9YoScPM2i2oGgS2BxfGpSnEsTIDagwBYPXO9qBC6u0v+Bnc5ydntfWzNK+rgLpV/yVn7
	VsL+Bdt/TY16TDzYXCz8YJEG2+6ZleM4s1QNUucmIVZfUbiY4X3zEinSZeq3i3iNgeIMUPUvr7/
	zddMBS1eQVF/x2kr9I9g8lwslV1/AGmMOd2Efy0me75kLs1AXp8UOORKsmd/CqZO7UgBoZ+IV0b
	XVWH57S9rrXF3TiJOEEJnR/HYH0oOtzGUm0SSWAU4b/XriZM2tBuCjuwK28=
X-Google-Smtp-Source: AGHT+IHmhKUWmuw5hxmGn5MltXhJp+mOVpY2OPHTTEaVO3b51JPFYbzscOBmXvFxMsGPCnOFc7K2lg==
X-Received: by 2002:a17:903:3d03:b0:223:5187:a886 with SMTP id d9443c01a7336-225c66a7cb6mr49221535ad.22.1741880813496;
        Thu, 13 Mar 2025 08:46:53 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:46d2:1635:3673:c3f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba710dsm14851215ad.128.2025.03.13.08.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 08:46:52 -0700 (PDT)
Date: Thu, 13 Mar 2025 09:46:50 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	shawnguo@kernel.org, devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
	Frank.Li@nxp.com, peng.fan@nxp.com, laurentiu.mihalcea@nxp.com,
	iuliana.prodan@nxp.com, shengjiu.wang@nxp.com
Subject: Re: [PATCH v5 0/8] imx8mp: Add support to Run/Stall DSP via reset API
Message-ID: <Z9L96ssnL1S5z7rb@p14s>
References: <20250311085812.1296243-1-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311085812.1296243-1-daniel.baluta@nxp.com>

On Tue, Mar 11, 2025 at 10:58:03AM +0200, Daniel Baluta wrote:
> This patch series adds support to control the Run/Stall DSP bits found on
> i.MX8MP via the reset controller API instead of using the syscon API.
> 
> DSP found on i.MX8MP doesn't have a direct reset line so according to hardware
> design team in order to handle assert/deassert/reset functionality we
> need to use a combination of control bits from two modules.
> 
> Audio block control module:
> 	- for Run/Stall control bits of the DSP
> 
> Debug Access Port (DAP)
> 	- for Software Reset via IMX8M_DAP_PWRCTL register
> 
> The current implementation for IMX DSP Remotproc driver and for Sound Open
> Firmware driver (already upstream) uses the following approach:
> 	- maps the Audio Block Control address via syscon API through
>           the fsl,dsp-ctrl property of the dsp node.
> 	- maps the DAP address space using directly a call to ioremap
>           with IMX8M_DAP_DEBUG macro depicting the DAP base address.
> 
> The both approaches are problematic when comes to describing the address
> spaces via the DT:
> 	- for Audio Block Control, because it uses the syscon interface
> 	- for DAP because it hardcodes de base address instead of using a dt node.
> 
> This patch series aims to fix the Audio Block control usage of the
> syscon interface and replace it with Reset Controller interface.
> 
> Main advantages of using the Reset Controller API is that we stop
> abusing the syscon interface, offer a better probe ordering, PM runtime
> support. Main critique of using the Reset Controller API is that
> Run/Stall bits are not reset bits (but according the hardware design
> team they are part of the reset proccess since there is no real reset
> line).
> 
> Initial discussion is here:
> https://patchwork.kernel.org/project/imx/patch/20250212085222.107102-6-daniel.baluta@nxp.com/
> 
> Note that we can safely remove the fsl,dsp-ctrl property usage from IMX DSP
> remoteproc driver because there is no Device Tree users.
> 
> Changes since v4:
> https://lore.kernel.org/lkml/20250305100037.373782-3-daniel.baluta@nxp.com/T/
> 	- picked-up R-b tags from Frank Li and Peng Fan
> 	- reworded commit message of patch 8/8 as per Mathieu Poirier suggestion
> 
> Changes since v3:
> https://lore.kernel.org/linux-arm-kernel/20250225102005.408773-5-daniel.baluta@nxp.com/T/
> 	- renamed resets ids as per Philipp comments
> 	- add boths resets (named them runstall and softreset) as per Philipp comments
> 
> Changes since v2:
> (https://lore.kernel.org/lkml/Z7ZNngd3wtJ5MZgl@lizhi-Precision-Tower-5810/T/)
>         - picked R-b and A-b tags
>         - use run_stall instead of reset to refer to reset controller
>           instance
>         - remove 'resets' description as it is a common property
>         - add correct include in the yaml dts snippet example
> Changes since v1:
> (https://lore.kernel.org/imx/20250219030809.GD6537@nxa18884-linux/T/)
>         - addresed comments received on v1
>         - picked up R-b and A-b tags
> 
> Daniel Baluta (8):
>   dt-bindings: reset: audiomix: Add reset ids for EARC and DSP
>   dt-bindings: dsp: fsl,dsp: Add resets property
>   arm64: dts: imx8mp: Use resets property
>   reset: imx8mp-audiomix: Add prefix for internal macro
>   reset: imx8mp-audiomix: Prepare the code for more reset bits
>   reset: imx8mp-audiomix: Introduce active_low configuration option
>   reset: imx8mp-audiomix: Add support for DSP run/stall
>   imx_dsp_rproc: Use reset controller API to control the DSP
> 
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 24 +++++-
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  3 +
>  drivers/remoteproc/imx_dsp_rproc.c            | 25 ++++--
>  drivers/remoteproc/imx_rproc.h                |  2 +
>  drivers/reset/reset-imx8mp-audiomix.c         | 78 +++++++++++++------
>  .../dt-bindings/reset/imx8mp-reset-audiomix.h | 13 ++++
>  6 files changed, 114 insertions(+), 31 deletions(-)
>  create mode 100644 include/dt-bindings/reset/imx8mp-reset-audiomix.h

Other than patch 3 for which I haven't received a Reviewed-by, I have applied
this set.

Thanks,
Mathieu

> 
> -- 
> 2.43.0
> 
