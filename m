Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F3B23EA8A
	for <linux-remoteproc@vger.kernel.org>; Thu,  8 Jan 2026 15:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767885017; cv=none; b=YNbtdv4Pmxk1t9X1Jr8mLYfA8ked0BYXHmW31Evc3V2vciHLwWJqDhqpjuk/92ugKk0QhjjKtaEZuxm1s788lyAEDa2TRmfs315vhGPTe3m7b0L1jm1i5ulUlFFj0B0jL2L0KU+Ri3UrL/3QZVIoLWd0n387LMVHmrIX4ekhUo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767885017; c=relaxed/simple;
	bh=qKoNns7ZimbfPEEy1t4QVDO1CmWWwQqfbpDDZVsHnmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLRQMxQvBbsRLhdaF3UesqZ9XD6BwDbm2uT41fWojjOY06Hk6bLfxjoBbukCkC+/BU+2H7KxFbotV7yQql/vlgMAca9BGXE8wY46jsnIo2WjKgZjMuIxL3TuL0Nu0khFsiylrVps7cJBsZGO5yOj7rP+v6O1XrOevPMsCjqIoMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pxg4R7jy; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pxg4R7jy"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a110548cdeso25861005ad.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 08 Jan 2026 07:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767885013; x=1768489813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dhcuq9el8jXisrdDDPJhueutUdvIyETPBmEWgvOuRc0=;
        b=Pxg4R7jyv688W0U2QDM4Ci2Gbk0j+SJXbtdB3wGyUtOrDT5U8fMbpaSwKYSvrhQqKk
         m6bJMNkOOYCWUViWsrDWk8ozDnIJYVAl+Tt0wCLRMZ6txaHJw8JFFr/KF9XeJI0jIh24
         5tcb/1UetapGMWfPNm+O4uJcLxA2ZeSTiaCXP5QpXudGu59X3gbAZFsjiuP5JgyU9X8e
         icBU5sOZ2HVv4MtHn9CRorYca7al3++fZ3S+Nc7htk8Mfpzc/eZ7Sty8jRirYNNxhdde
         12Inzi3UB743xon+WJ6tcgA8y8MeZNN7Bv8My/bo9P3y1bDVl+9YiLG+eXED3SX7/D7W
         32LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767885013; x=1768489813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dhcuq9el8jXisrdDDPJhueutUdvIyETPBmEWgvOuRc0=;
        b=V3qo9yuBK1Cb4mtKke41avd45rfoan98nmpdfWUEutazMEiUGrXDQBo/kuETScqkZb
         EA3RhqV0LITgM86E74s87w1Z3OEDcAU0wJeztDWZcm9/z9kLbYb30Bgqn0A5BpM54oaJ
         8wQN/2Xzo4AB5iJKCFPLC4ap+SPGZv4ztBoiKPNeXPZaFCH20MCE7wnhn+q+3yVEcZ4+
         eGrVUXtwSF9WyMq3d2+B17cFxYe8FeokTqwPiimur9eN9TvTvT+6fasV9ESa3fRANPZj
         3hFP1LcT7jfK2SPOgK60W9XMuSO8Hq35aGlm6Ai9xJ9R+gkCDYsUeho1o4wTYhU636cx
         +jow==
X-Forwarded-Encrypted: i=1; AJvYcCVaPA5Z7az6xh7VVqqQZXCQSHdWbzTWX3EwxoQAGbjzHYdcFzfIAHtNMGtzUJLMMswzfDlsy4X446luTpNp0n2D@vger.kernel.org
X-Gm-Message-State: AOJu0YyqqdjeOVwn4+Q0dHQ3FMTbzIKnDf43VnEJEcMuwYKawr3+TXPy
	A8USoFRkBW3B7VVERtN/3TR8LDXyCK0U1OJc+7EYBr7viegM1KH0qXuuFiUYCAfF7Y0=
X-Gm-Gg: AY/fxX70Fqsdw5dydYjfogFfaX8BlA5aSXtm+KAkCbwIZ7eknBW2Ylesu/T8Dd31Xqt
	BT6evT+qJ+3wPS7WX/u16X5c8Njlw6UkjEwSGcvE6NN/vUL2X75WWM71yj6bFnjAxbaWHiCK15U
	5o/TStd8pfIhD88t4oqPfkVmv1vxf6GAArGXVJJdDe55/FgZvX4ANynEoAeqpMXydEiC/X3GCdk
	474rY2SMfTfkNl70hbNRjOihDxW1kPG3bxLnKvGg9vWCDeiiolDgjgNJ4qsxnkdOAH0GyvXnTcD
	P9RqnoHAZzkz4L2kA7glzkD+Wh7Tqb+nmwqbR0+v090Mu1kEqRmHmPouTzXfn76nshPhx+3BOs/
	HYZn7q0jBnU6DC48w2GOoi2OMoSuPys+SAoarN8qJAVoxfBkCRwxZdPAz/LdKtJUVFTw0xbLSjo
	1zPIrwdsu1k5p2+w==
X-Google-Smtp-Source: AGHT+IHdVQFm0LoRLpz5ffOipFREjXXoGNgUc0A0LwHWdii2Nr5bh8+R06mGKRoJf0I2Vwoi809Uig==
X-Received: by 2002:a17:902:e846:b0:2a1:39cd:7462 with SMTP id d9443c01a7336-2a3ee43892bmr52476395ad.8.1767885013214;
        Thu, 08 Jan 2026 07:10:13 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9a09:dd70:79df:b876])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48c75sm83669855ad.35.2026.01.08.07.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 07:10:12 -0800 (PST)
Date: Thu, 8 Jan 2026 08:10:10 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v5 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aV_I0iGYt1lxEIUw@p14s>
References: <20251218-imx95-rproc-2025-12-18-v5-0-b56a27d4158f@nxp.com>
 <20251218-imx95-rproc-2025-12-18-v5-4-b56a27d4158f@nxp.com>
 <aV6ow9dGUNaPDqZg@p14s>
 <aV+HEAzwNSOCUx88@shlinux89>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV+HEAzwNSOCUx88@shlinux89>

On Thu, Jan 08, 2026 at 06:29:36PM +0800, Peng Fan wrote:
> Hi Mathieu,
> 
> On Wed, Jan 07, 2026 at 11:41:07AM -0700, Mathieu Poirier wrote:
> >On Thu, Dec 18, 2025 at 01:17:38PM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> ...
> >> +/* Linux has permission to handle the Logical Machine of remote cores */
> >> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(0)
> >> +
> >
> >This should be named IMX_RPROC_FLAGS_SM_LMM_CTRL.
> 
> Fix in V6.
> 
> >
> >>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
> >>  static void imx_rproc_free_mbox(void *data);
> >>  
> ...
> >> +static int imx_rproc_sm_lmm_start(struct rproc *rproc)
> >> +{
> >> +	struct imx_rproc *priv = rproc->priv;
> >> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> >> +	struct device *dev = priv->dev;
> >> +	int ret;
> >> +
> >
> >A comment is needed here to say that if the remoteproc core can't start the M7,
> >it will already be handled in imx_rproc_sm_lmm_prepare()
> 
> Add in V6:
>         /*
>          * If the remoteproc core can't start the LM, it will already be

The remoteproc core starts a remote processor, which in this case is the M7.
I'm not sure why you are referring to the logical machine (LM).


>          * handled in imx_rproc_sm_lmm_prepare().
>          */
> 
> >
> >> +	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
> >> +	if (ret) {
> >> +		dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
> >> +			dcfg->lmid, dcfg->cpuid, ret);
> >> +		return ret;
> >> +	}
> >> +
> >>  
> ...
> >> +static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
> >> +{
> >> +	struct imx_rproc *priv = rproc->priv;
> >> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> >> +	int ret;
> >> +
> >
> >>>>>>>>>>>>
> >
> >> +	/*
> >> +	 * IMX_RPROC_FLAGS_SM_LMM_AVAIL not set indicates Linux is not able
> >> +	 * to start/stop rproc LM, then if rproc is not in detached state,
> >> +	 * prepare should fail. If in detached state, this is in rproc_attach()
> >> +	 * path.
> >> +	 */
> >> +	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
> >> +		return rproc->state == RPROC_DETACHED ? 0 : -EACCES;
> >
> ><<<<<<<<<<<
> >
> >        if (rproc->state == RPROC_DETACHED)
> >                return 0;
> >
> >        if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
> >                return -EACCES;
> >
> ><<<<<<<<<<<
> 
> Update in v6 with your code snippets.
> 
> >> +
> >> +	/* Power on the Logical Machine to make sure TCM is available. */
> >> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> >> +	if (ret) {
> >> +		dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", dcfg->lmid, ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	dev_info(priv->dev, "lmm(%d) powered on by Linux\n", dcfg->lmid);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  static int imx_rproc_prepare(struct rproc *rproc)
> >>  {
> >>  	struct imx_rproc *priv = rproc->priv;
> >> @@ -980,6 +1078,93 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
> >>  	return 0;
> >>  }
> >>  
> >> +static int imx_rproc_sm_lmm_check(struct rproc *rproc, bool started)
> >> +{
> >> +	struct imx_rproc *priv = rproc->priv;
> >> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> >> +	struct device *dev = priv->dev;
> >> +	int ret;
> >> +
> >> +	/*
> >> +	 * Use power on to do permission check. If rproc is in different LM,
> >> +	 * and linux has permission to handle the LM, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
> >> +	 */
> >
> >Two things here:
> >(1) This whole comment describes what this function does rather than what the
> >code is doing in the next few lines.  As such it needs to be moved above the
> >function declaration.
> >(2) We know the M7 is in a different LM, otherwise "dcfg->lmid == info.lmid" in
> >imx_rproc_sm_detect_mode() and we would not be here.  As such the comment is
> >wrong.  The only thing this code is doing is check if the remoteproc core is
> >responsible for the M7 lifecycle.
> 
> Update in v6:
> /* Check whether remoteproc core is responsible for LM lifecycle */

Same comment as above.

> static int imx_rproc_sm_lmm_check(struct rproc *rproc, bool started)
> 
> >
> >> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> >> +	if (ret) {
> ...
> >> +
> >> +
> >
> >>>>>>>>>>>>
> >
> >> +	/* rproc was started before boot Linux and under control of Linux, directly return */
> >> +	if (started) {
> >> +		priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> >> +		return 0;
> >> +	}
> >> +
> >> +	/* else shutdown the LM to save power */
> >> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> >> +	if (ret) {
> >> +		dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> >
> ><<<<<<<<<<<
> >
> >        /* Shutdown remote processor if not started */
> >        if (!started) {
> >	        ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> >	        if (ret) {
> >		        dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
> >		        return ret;
> >	        }
> >        }
> >
> >	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> >
> ><<<<<<<<<<<
> 
> Thanks for your code snippets. Update in v6.
> 
> >
> >This patchset would be a lot easier to digest if you had split the support for
> >CPU and LMM protocols in diffent patches.
> 
> I appreciate your detailed review and the code snippets you provided. Please
> let me know if you'd prefer that I split the support for LMM
> and CPU into separate patches in v6, or keep them combined as they are.

Please split.

> 
> Thanks,
> Peng.
