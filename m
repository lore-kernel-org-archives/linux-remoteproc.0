Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E3A43E48E
	for <linux-remoteproc@vger.kernel.org>; Mon, 11 May 2026 17:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519415; cv=none; b=UAXOVdni8Xd7m3cRpgB4f7IDHdKy2oymTOct49EzBCjTjSvMRdDBjmKlrA6GfnsUJPZSRFaAOaq1iwQ1StusLcIdaTHBsMGFCseoJTrMHTVepS1FiZMOL+EvZNcM2rBbIC79e8qCsncxAHL9CeNUM4VW4WUqTaaxcQUIdxTmrGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519415; c=relaxed/simple;
	bh=D/KRR3cWA8YhRg3pD1Dkj2Jx4iqOpEciiw/dqXN+Rvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pFazmnfzI5AqtxfVbeSAKr1rvH0/0v50kpmAv4BNRwSfwmC6KqCDJWmA/DCvWK9XGqgQhqu8FDK2BcO7k2CiRszo+g3Y5D1YZcbnl1Qs99afs4Snzkg2ckFnCLKwxRCrng8IxYifUEECwqwfWrpmEWZ8WRyUklzb4gtSqNkNDTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F/zx59+N; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F/zx59+N"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82f8893bff3so2058012b3a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 May 2026 10:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778519414; x=1779124214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wXPv9NMuATRuOngICuHBognry2tLHdZTtLmZBPko5FM=;
        b=F/zx59+NL44D/FyyXI2cboR9odacHlRLWqpwqPO/W/rl3er4izrUKs59CoRu1KZ/6c
         J96ro0aJJEpFfZdkVrF0vcLPM8eGuAF+H/kegaCP24qs8iKhFB8fhuJLdipdzauK29on
         l8oc/zx+6+5xyHebRFl3lTfuVjsk1zkk3bY0/mmu2DBZpX7WqOyHMQMjQ5o8J2hvxDGa
         D7brsSXobrV+mgZvi0/Mb4wwZn98YhdeqKyCTOOLwYYhU+jgtgDAb5QPUrj/iUMuAA+j
         7EMIfjoH5rajBsVxEIZGj3RQsRUncW6j6sxglfUIspGPpgsEjeBrC/VQdyHv/565Wx0P
         qxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519414; x=1779124214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXPv9NMuATRuOngICuHBognry2tLHdZTtLmZBPko5FM=;
        b=d9YAa6+wPZb5vHsRxD/kv9J6CpwZZFqFPIMfr8VwasJGtY5x7LeNjpJtjhIbE89SAo
         2ThZH4qryZT5U0wHQR0GNSpfJ8Ja+4fSIpeaFz81V6zm33pWKdI8/RrkbMi2f43s2JnR
         DmzACosJkuv+jZqOxuUq3llr3gUQ6wlAmviiayHPEYo85ZGJ+n4vlZfLxqHkNU0oGPRO
         4ib/zRjrnexyAxey3bBhEJHpKI4lFN+5z83mp5YpSAhCK61aojCUm1H1LVDtgzaJ5EqX
         RZDfqf8BMClt6TFde6WYXiIQxhEPGiT2OeOgr+VVcbYZZvFeI9UrV7Ft8BEFwbtIY3nD
         gZ8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Msf+ek2ttvp6ugoF65Pfu6zanF+PTUacJClvGEWbwnVmoMG2sowtj68YC9kLyPdNMWS5wwvzNWxxFMs8CIOYk@vger.kernel.org
X-Gm-Message-State: AOJu0YzYsZpRrE9Sdvw9KfoE5s6zcHPK09d9e+wpHLkLAOAoc+bvPzx1
	fkyV05i6oIEL/oxRf7/xFqaFTfynbmKw9N36jZIKg1izTf5ahsOpXJqQvxpJ8aDNnx0=
X-Gm-Gg: Acq92OFOGSeeIAhAv1DzIKAYF8i1SSIkxsbAEHbQcg/I0LWD1UEIGg6YrVSTqQ3pm+e
	4WZK32bLFX0V1ARd7A/Qiqy/2qQhYLGEfdn4idi+Ufg2bUgJAsmgF+IN76mW8pKITEbGvZkMAIy
	uWEjN7dyAC1lStK64+rAJWZG/s8iHBfzykoIkyeucl0qi6qtIPP8SrqI9zzHlid/kJSRLmL91Mn
	ir0FuSaabRa+JrpGFNnSBEi7A35Gbb1aDVJ+rHFQYNF4eWEvkgTDJ9ew6NORgd3ZEnkT/kdRMpV
	eUxM9A52+0Tygj1x6TXjst2Z+9cvY2s/3UMy9mf4cD/sgaess4F3HQt8g/AcF6gjTYmLxLNOzZr
	0Gyw0jc7xTrMH6XOgAQK1GfX5eBJUi7j6E/MsWxvS0rvS48ZRH9h/vxMHURnKGvDTsiE7oqydoU
	VJru7iBJZP2ByE/0LQpxIlXltqTYo=
X-Received: by 2002:a05:6a00:f9a:b0:82a:7893:e14b with SMTP id d2e1a72fcca58-83e3bb9f9ecmr9882717b3a.38.1778519413426;
        Mon, 11 May 2026 10:10:13 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:6a4f:ac45:cc0f:8508])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a52cesm19958782b3a.57.2026.05.11.10.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:10:12 -0700 (PDT)
Date: Mon, 11 May 2026 11:10:08 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Jiafei Pan <Jiafei.Pan@nxp.com>, andersson@kernel.org, peng.fan@nxp.com,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Zhiqiang.Hou@nxp.com, mingkai.hu@nxp.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/4] remoteproc: add Cortex-A Core remoteproc support
 on i.MX platforms
Message-ID: <agINcH6hVf8G_T_3@p14s>
References: <20260511023928.39640-1-Jiafei.Pan@nxp.com>
 <agF+iYRfUIoBu35M@shlinux89>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agF+iYRfUIoBu35M@shlinux89>

On Mon, May 11, 2026 at 03:00:25PM +0800, Peng Fan wrote:
> Hi Jiafei,
> 
> On Mon, May 11, 2026 at 10:39:24AM +0800, Jiafei Pan wrote:
> >This patch series is to add remoteproc support on Cortex-A Core of i.MX platforms:
> >1. Adding dts binding for Cortex-A Core remoteproc
> >2. Enable Cortex-A Core remoteproc support in remoteproc driver
> >3. Adding dts example on imx93 platforms.
> 
> Normally, we only keep one patch or patch series from the same author that
> modifies the same file in the review queue at a time.
> 
> You already have a patch for imx_rproc.c currently under review(got R-b, but
> need Mathieu to handle), so this patch series might be delayed to be reviewed.
> 
> As I have replied in internal, to make multiple OS run on Cortex-A SMP without
> hypervsior, some GIC changes are required, without those GIC changes,
> this patchset is not testable using upstream tree.
>

If that is the case, please re-submit when the proper background work on GIC has
been merged.

Mathieu
 
> Thanks,
> Peng
> 
> >
> >Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
> >
> >---
> >Changes in v3:
> >- Fixed dt_binding_check warnings
> >- Updated prefix of patch subject
> >
> >Changes in v2:
> >- Update arch/arm64/boot/dts/freescale/Makefile to add new dts
> >
> >---
> >Hou Zhiqiang (1):
> >  remoteproc: imx_rproc: add autoboot support for A-core
> >
> >Jiafei Pan (3):
> >  dt-bindings: remoteproc: add imx-rproc-psci
> >  remoteproc: imx_rproc: add support for Cortex-A Core
> >  arm64: dts: imx93: Cortex-A Core remoteproc device node
> >
> > .../remoteproc/fsl,imx-rproc-psci.yaml        |  51 ++++++
> > arch/arm64/boot/dts/freescale/Makefile        |   2 +
> > .../imx93-11x11-evk-multicore-rtos.dts        |  39 +++++
> > .../imx93-14x14-evk-multicore-rtos.dts        |  39 +++++
> > .../boot/dts/freescale/imx93-rproc-ca55.dtsi  |  14 ++
> > drivers/remoteproc/imx_rproc.c                | 150 ++++++++++++++++++
> > drivers/remoteproc/imx_rproc.h                |   2 +
> > 7 files changed, 297 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
> > create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
> > create mode 100644 arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts
> > create mode 100644 arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi
> >
> >-- 
> >2.43.0
> >
