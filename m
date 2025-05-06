Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4786284695
	for <linux-remoteproc@vger.kernel.org>; Tue,  6 May 2025 15:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746544900; cv=none; b=X6O27b/Sbwh12EF8k5GtxC9ZyQ9WAs01Jjkxcn/LgEbVSpgL/lZ9qsBXwnfwoXIpwpSPb+H1IO3PtMF8Ovd7/Hix2DgSP9zmVnkW/dYSxjKFwel2n5cvS/8Yh3/p716VrWI+Z1f4qDupwG8T2CEObDNzuDRlMA4QHmIZFv+7dJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746544900; c=relaxed/simple;
	bh=RrFCrLCDb2vVGDp7qDTtvDgB7VhO8TX1bChwTPYRekQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f34C4pX4oxM/n7jsybnZVJzhzeicfvMR9KEVSg0oow7cReUZ13gq/8+n7iezinV4+PsaUzpAGfYEtFLOM+oOz7Rrue6Ko2n0eIWUDzv4ae9+EYMsU3VRhtoSMjIBEm6KSBU6rLZ+zbExA37XDduta3jUYCVMpRz2NYxjEcN2HrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UJ8pQsTh; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UJ8pQsTh"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22c33e4fdb8so59176785ad.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 May 2025 08:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746544897; x=1747149697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LUMMAqzLfeU2BhLtLW4k1zZhIkqrr7YldwnF+3gqRqE=;
        b=UJ8pQsThEqTqAkNZ7+wvythibhM6QLHad1B5K0qbZotRMUU9Er+gvGohjeMEZN6iq2
         y/+Pno2UB+mNvg70PK5nSJuN4Dayhcn5eQCoeO7iLIr2PLudktmaY1EF9VTKBJqjmv2H
         Egh65+L0t2Lomwbu2fJ3S8qqvoB338zUaCGsx/O9eS1kAsC2IYbcn30TQST+A8/jgKrU
         xkE5WVEYRmGUKDp0VVdciWsANguEYGzqrVnstf3+DXAnt0+tfo9g1lodhWgR4TcstmvV
         KFGObojl0fiMczJHycmx3HFOzJEQfcZ0QtQHWStSIcO75UFLu/+rUxV86gL1G6YkIFpM
         v/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746544897; x=1747149697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUMMAqzLfeU2BhLtLW4k1zZhIkqrr7YldwnF+3gqRqE=;
        b=jFZ1P45jleBfKG+jSTQ8YDKI6E502JBMmN7xR2M+4ZCGBArkPxKSAY8BcbLlgsdfKE
         CDWsBvVqnu/39Otv/82evHa5UqhnC3Q7+nT1ueujvsi9wWiyVraR/WWq1HwSvyQM6SpO
         4T346jBAFPyGOxrEq/Wlf/Mew1jW2tjcGFYaP92NNnDOELhNX+KG+IjT88821sD3LqPF
         hExEKsfZMp9o6jUoFXnIYgMuc59uJwtJxPVG1oyLJ3C/3nQ2HBky3nSl2e58gyvehbsd
         r2CWN4o06hUmb96Ehkh7y0qLeysID3cN5P6NQeKKMyLkm59grrVf50tcgVj3a8Eyk6bQ
         sPew==
X-Forwarded-Encrypted: i=1; AJvYcCUHwpKcCGc0ieLansy+7no3grtpWLDWfwJlPJdVmYJNQMAHWB6IXpVW48IiM2RBJHRPC8Nnd4uLuCcIB+S7tYl8@vger.kernel.org
X-Gm-Message-State: AOJu0YwECYnlrlC8mlMVsO3yv9+SuOtsHLYlNE7ocwp7th/7uODXQZLT
	nPgikPKCCuzlXTc25n9tDXhkKEW/owpD2SMy1AbdPxPb+z31eEcvz4ZI8XnaGKQ=
X-Gm-Gg: ASbGnctQUftVlsRDKqDKu9auqgcPzfV6UAoEU9uq4eJC9IXtKWyQcB21Dsgxqj4HUMR
	Vnnh9SyjoTGrMzr4ayxuD1R56w6L6UTsWmWgjRC1v3JhJ+OJn7FsIdQYKEN5NUWPtUjGG6LsuWu
	7uB+C/RQ5dRso30hlwhKxs0bEvFwUFo6XD76Yq1FGsrswUlInveCzc6yjRYPbk0L0ydI8WeKFkd
	4H22h63K0cQE64WC8mi0J4ERx7ENtI3zORmib9jjEDX+Jx5avmwKjUj07Bnd60eQMbQVEcI0DIp
	IvtDKraRJvT/pW64WFJ36syVlGrlPj6FHwdyuX2X1A==
X-Google-Smtp-Source: AGHT+IG9qR+Bw2uygv8xQSXKT77iYKR8E4JwPxPN+b6XzkhfQ8z4EFuMOu2q9YdcGCpJtb1y5nY+aw==
X-Received: by 2002:a17:902:d40b:b0:22e:4a2e:8ae7 with SMTP id d9443c01a7336-22e4a2e9073mr19297995ad.22.1746544897093;
        Tue, 06 May 2025 08:21:37 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fc7c:b927:d229:c0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15232224sm75295875ad.253.2025.05.06.08.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:21:36 -0700 (PDT)
Date: Tue, 6 May 2025 09:21:34 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 1/3] remoteproc: imx_rproc: skip clock enable when M-core
 is managed by the SCU
Message-ID: <aBoo_p1KlmOieJ50@p14s>
References: <20250505154849.64889-1-hiagofranco@gmail.com>
 <20250505154849.64889-2-hiagofranco@gmail.com>
 <20250506043835.GB24259@nxa18884-linux>
 <20250506123619.egobussm6b74imso@hiago-nb>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506123619.egobussm6b74imso@hiago-nb>

On Tue, May 06, 2025 at 09:36:19AM -0300, Hiago De Franco wrote:
> Hi Peng,
> 
> On Tue, May 06, 2025 at 12:38:35PM +0800, Peng Fan wrote:
> > On Mon, May 05, 2025 at 12:48:47PM -0300, Hiago De Franco wrote:
> > >From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > >For the i.MX8X and i.MX8 family SoCs, when the M-core is powered up
> > >before Linux starts (e.g., by the bootloader) and it is being managed by
> > >the SCU, the SCFW will not allow the kernel to enable the clock again.
> > >This currently causes an SCU fault reset when the M-core is up and
> > >running and the kernel boots, resetting the system.
> > >
> > >Therefore, add a check in the clock enable function to not execute it if
> > >the M-core is being managed by the SCU.
> > >
> > >This change affects only the i.MX8X and i.MX8 family SoCs, as this is
> > >under the IMX_RPROC_SCU_API method.
> > 
> > I would rewrite as below: "
> > 
> > For the i.MX8X and i.MX8 family SoCs, when the M-core is powered up
> > by the bootloader, M-core and Linux are in same SCFW(System Controller
> > Firmware) partition, so linux has permission to control M-core.
> > 
> > But when M-core is started, the SCFW will automatically enable the clock
> > and configure the rate, and any users that wanna to enable the clock
> > will get error 'LOCKED' from SCFW. So current imx_rproc.c probe function
> > gets failure because clk_prepare_enable returns failure. Then
> > the power domain of M-core is powered off when M-core is still running,
> > SCU(System Controller Unit) will get a fault reset, and system restarts.
> > 
> > To address the issue, ignore handling the clk for i.MX8X and i.MX8 M-core,
> > because SCFW automatically enables and configures the clock.
> > "
> > 
> > You may update if you wanna.
> > 
> > >
> > >Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > >Suggested-by: Peng Fan <peng.fan@oss.nxp.com>
> > 
> > -> peng.fan@nxp.com
> 
> Thanks for the review, I will update the suggestions on a v2. Meanwhile,
> I will wait a little bit for other feedbacks.
>

I suggest you go ahead with a v2 - I have a fair amount of patches to review and
my time to do so is currently very limited.

> > 
> > Thanks,
> > Peng
> > 
> > >---
> > > drivers/remoteproc/imx_rproc.c | 4 ++--
> > > 1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > >diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > >index 74299af1d7f1..627e57a88db2 100644
> > >--- a/drivers/remoteproc/imx_rproc.c
> > >+++ b/drivers/remoteproc/imx_rproc.c
> > >@@ -1029,8 +1029,8 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
> > > 	struct device *dev = priv->dev;
> > > 	int ret;
> > > 
> > >-	/* Remote core is not under control of Linux */
> > >-	if (dcfg->method == IMX_RPROC_NONE)
> > >+	/* Remote core is not under control of Linux or it is managed by SCU API */
> > >+	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
> > > 		return 0;
> > > 
> > > 	priv->clk = devm_clk_get(dev, NULL);
> > >-- 
> > >2.39.5
> > >
> 
> Cheers,
> Hiago.
