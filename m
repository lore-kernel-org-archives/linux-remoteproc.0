Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2306D1DDA24
	for <linux-remoteproc@vger.kernel.org>; Wed,  9 Jul 2025 14:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071586; cv=none; b=NgFBi7RIX6fkTt7PE4tG+J0BrTNINS3WhLKMAgcpINnksC7GzAxgMV98vxlhWQz/VHSs6JxREWoV7GaMvwFXKuTSHhJlNQaHgCSSZkSJ1b2rwGAx/06TwrZ5y6W/LgTW5eE0uOcrc5zKVRaZqtQfRPtZIyMnVONx0Oo6n7tseHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071586; c=relaxed/simple;
	bh=C2wCAxa5FvH06O82029Gnip2a4XtLbwPFts3mlei39U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYsmq8ijnzlQvpSIfTqwO/FTFe1OpVKtmg++fjakdAtyMjMqVQ08CHkudAAu97rUeVSUE2GNiIefpM3hg+ulRjmWfeXR09b/3ge/T6+ca4oD8SRnzrF36vJc0qtF9vW/YGbyoGs0ZDzWhfsf/Shs4ehwWz002aGLOliqxWFo7m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ci6I0K0x; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ci6I0K0x"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-748feca4a61so3063029b3a.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 09 Jul 2025 07:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752071583; x=1752676383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w6DigU3ijEN37mFImpuvJY0cN+hiwAZNGwYyYKGr+K0=;
        b=ci6I0K0xlzHnLgCmM2lucZQsrT3X2di9CmiKOVfKWsv7VNHJWGref/hiON3S2Im/bJ
         zcbJz069MpxtuZ+sAPf6i9yBB6iGiqnmoevHB1BYe2lJu/phdTqmLZovMXvx+KDhdhmk
         ZZ07sNT2/0hNnsDIn2UMahoyEmOS8zgXydhasUtbT7HK47q4bvuibw/V1g0YX1WMvIcU
         3g1R/RpGi7ob6h8IrVk9kvSCI42UtfhIOYR4WOzjZziApZnevFNQiDB1zEny3X7oPauX
         xqIlu9Cy7oLTtO4QWInw7vn8Dwzdr7x7EUKIOpMFOfQEGUrpz1B3XzT2n6Wn48vaF8Hm
         KoOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071583; x=1752676383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6DigU3ijEN37mFImpuvJY0cN+hiwAZNGwYyYKGr+K0=;
        b=c+3pCTSypsKPbxGly+n/AbGM8PvfQjsU2PxWbV5WBFwQV1pzG1JJ3L5gwIuDn0wQQY
         RMZz2QE7RbrDNPxTCFjpOOqMOlJGrl4vRozNJSEbULB1dpnM/2QJMhMxRIXd9Imifz3y
         I5pT9yihRMd9bd8eQMlve3NWxnZaOZhp5jEQ25etBTTTZS+Xk0S6sU6l3WzOV3bKFqMh
         qrb7tZ1hIiWj9f5PIhniXNMMJS6nZwnoO6g9J2lEjc4VQPdvaHnJcT8/nE9hh9HMMD0K
         eU1D2vxh+oXxbxBvxeY2MjR6BtFW1c9gg5ivjqA+eCY77x89DU6CANxKE27GnLwvGlaa
         nNCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3ZJaZ8Unv9MbmB0ZZyHLqVtglgw2ZJ7mg71xktL5sKPRomu8HUUdf8nCkbyc+5+wwXDluesvDYs1CneMm0HfM@vger.kernel.org
X-Gm-Message-State: AOJu0YxWF5Nns5Hmyc5UzTulHAVIp26grIDCHWsLMm5b4pedrrfEYbB1
	MwCYxihZcigOYcdXyI9Y2M1SrdeXu9HjKH6J/xhDvK13xsmwriq5KSUTdRdipKpPh00=
X-Gm-Gg: ASbGnctk6E/AmNKVz+fFaMIsEnTPUICOuEDs31d0rIYSWFHlSHmn5TIYDRsg/XumzK1
	vgVdpUztYWwPIYx1zn9OfiPuYZd4dNsSzXhiYD/IjnsHKoar7ajFGhlOS0dL1qXPXFbEbpAyOIT
	RW5Xyb2ZxjA1sbhliWRhUej5GGIN8NYcG3VEknrUcvOSJ3L2DFma0p80cEDUx1s3du6NPIGartu
	+zmqhg4V0o4OaUP8M7x8gnWPCnD1qU/O5OGw+lVFDX47u7VtoGUvjMdvx0ZmeUYaD7MlsSKOQ0d
	p+69jAuVK/a2bXx+8CiT4Dgxg4cpHTgN5X/ya3sdbqO3BvfVukJaMqsOX66yzcI9
X-Google-Smtp-Source: AGHT+IHb9rJ94x6uyCZzHp4gJ6jJr9aNTPeUN/jkP+tdN5uFfkn31SfgFUorIkoUWVXUVDc9nNaEcg==
X-Received: by 2002:a05:6a00:1742:b0:74e:a560:dd23 with SMTP id d2e1a72fcca58-74ea669d187mr4911450b3a.21.1752071583252;
        Wed, 09 Jul 2025 07:33:03 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:433:ec07:c2cb:e3e8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38f879d040sm13455576a12.44.2025.07.09.07.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:33:02 -0700 (PDT)
Date: Wed, 9 Jul 2025 08:33:00 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 2/5] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aG59nOSfMuFbJvoK@p14s>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
 <20250625-imx95-rproc-1-v3-2-699031f5926d@nxp.com>
 <aG1IIk42q8OmGsQH@p14s>
 <20250709090231.GB14535@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709090231.GB14535@nxa18884-linux>

On Wed, Jul 09, 2025 at 05:02:31PM +0800, Peng Fan wrote:
> Hi Mathieu,
> 
> On Tue, Jul 08, 2025 at 10:32:34AM -0600, Mathieu Poirier wrote:
> >Good day,
> 
> Thanks, good day.
> 
> >
> >On Wed, Jun 25, 2025 at 10:23:28AM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> >> one Cortex-M7 core. The System Control Management Interface(SCMI)
> >> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> >> Manager(SM) includes vendor extension protocols, Logical Machine
> >> Management(LMM) protocol and CPU protocol and etc.
> >> 
> >> There are three cases for M7:
> >>  (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
> >>  (2) M7 in a separate Logical Machine that Linux can control it using
> >>      LMM protocol
> >>  (3) M7 runs in same Logical Machine as A55, so Linux can control it
> >>      using CPU protocol
> >> 
> >> So extend the driver to using LMM and CPU protocol to manage the M7 core.
> >>  - Add IMX_RPROC_SM to indicate the remote core runs on a SoC that
> >>    has System Manager.
> >>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
> >>    is fixed as 1 in SM firmware if M7 is in a seprate LM),
> >>    if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
> >>    protocol to start/stop. Otherwise, use LMM protocol to start/stop.
> >>    Whether using CPU or LMM protocol to start/stop, the M7 status
> >>    detection could use CPU protocol to detect started or not. So
> >>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
> >>    status of M7.
> >>  - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whether
> >>    the M7 LM is under control of A55 LM.
> >>
> >
> >Thanks for the context, it really helps.
> 
> Glad that helps.
> 
> >
> 
> [....]
> 
> >> @@ -592,6 +637,38 @@ static int imx_rproc_prepare(struct rproc *rproc)
> >>  		rproc_add_carveout(rproc, mem);
> >>  	}
> >>  
> >> +	switch (dcfg->method) {
> >> +	case IMX_RPROC_SM:
> >> +		if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP))
> >> +			break;
> >> +		/*
> >> +		 * Power on the Logical Machine to make sure TCM is available.
> >> +		 * Also serve as permission check. If in different Logical
> >> +		 * Machine, and linux has permission to handle the Logical
> >> +		 * Machine, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
> >> +		 */
> >> +		ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> >> +		if (ret == 0) {
> >> +			dev_info(priv->dev, "lmm(%d) powered on\n", dcfg->lmid);
> >> +			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> >
> >This is set all the time imx_rproc_prepare() is called - isn't there a way to
> >set it once at initialisation time?
> 
> Yeah. Moving this to probe path should be ok, such as in imx_rproc_detect_mode.
> The drawback is M7 logical machine will be left in powered up state if
> moving to probe path before user starts M7 LM. Leaving in here means M7 logcal
> machine will be only powered up when user does
> "echo start > /xx/remoteproc-y/state", but needs to set
> IMX_RPROC_FLAGS_SM_LMM_AVAIL flags each time do preparing.
> 
> If you prefer moving this logic to probe, I could give a try to move
> to imx_rproc_detect_mode which is probe path.
> 
> How do you think?

Just leave it where it is.

Mathieu

> 
> >
> >> +		} else if (ret == -EACCES) {
> >> +			dev_info(priv->dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
> >> +			/*
> >> +			 * If remote cores boots up in detached mode, continue;
> >> +			 * else linux has no permission, return -EACCES.
> >> +			 */
> >> +			if (priv->rproc->state != RPROC_DETACHED)
> >> +				return -EACCES;
> >> +		} else if (ret) {
> >> +			dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", ret, dcfg->lmid);
> >> +			return ret;
> >> +		}
> >> +
> >> +		break;
> >> +	default:
> >> +		break;
> >> +	};
> >> +
> >
> >Please put this in a function and get rid of the switch{}.
> 
> ok. Fix in v4
> 
> >
> >>  	return  0;
> >>  }
> >>  
> >> @@ -911,13 +988,41 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
> >>  	struct regmap_config config = { .name = "imx-rproc" };
> >>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> >>  	struct device *dev = priv->dev;
> >> +	struct scmi_imx_lmm_info info;
> >>  	struct regmap *regmap;
> >>  	struct arm_smccc_res res;
> >> +	bool started = false;
> >>  	int ret;
> >>  	u32 val;
> >>  	u8 pt;
> >>  
> >>  	switch (dcfg->method) {
> >> +	case IMX_RPROC_SM:
> >> +		/* Get current Linux Logical Machine ID */
> >> +		ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
> >> +		if (ret) {
> >> +			dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
> >> +			return ret;
> >> +		}
> >> +
> >> +		/*
> >> +		 * Check whether remote processor is in same Logical Machine as Linux.
> >> +		 * If no, need use Logical Machine API to manage remote processor, and
> >> +		 * set IMX_RPROC_FLAGS_SM_LMM_OP.
> >> +		 * If yes, use CPU protocol API to manage remote processor.
> >> +		 */
> >> +		if (dcfg->lmid != info.lmid) {
> >> +			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_OP;
> >> +			dev_info(dev, "Using LMM Protocol OPS\n");
> >> +		} else {
> >> +			dev_info(dev, "Using CPU Protocol OPS\n");
> >> +		}
> >> +
> >> +		scmi_imx_cpu_started(dcfg->cpuid, &started);
> >
> >Function scmi_imx_cpu_started() returns a value that is not taken into account.
> >
> >> +		if (started)
> 
> I will update to "if (started || ret)" in v4, with ret assigned the return
> value of scmi_imx_cpu_started.
> 
> Thanks,
> Peng
