Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F303E3C48
	for <linux-remoteproc@vger.kernel.org>; Fri, 26 Jun 2026 08:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782462861; cv=none; b=Id063ITCphXPPEifDHMOszDDLmD/OqoDErLnoEEnqSUMxNiG/j21OecNbX9l+zPE1yq90ZHZ/y/rG09b9mFM0YTu5+sGCE8cQ6bVEWaRvqR39tiXKjSgykwm+hjGyd3ay7w5O55w8XO9wSVLsc89YevMEC2ApLjS9kqLZkb1ok0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782462861; c=relaxed/simple;
	bh=Qj9KBsRLuqHVi+Rt68gJhOH+4gEwbDsPVje0koZveQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PYQlenlFG0AIS2Z1PzlhZYxdAYC7VIsUPFML1mfeyGjTfP5/BfE7qvjKw8djTy78qCq86+Hj5tNUwanbZ0O1FTi2jR2kwNaOWLs+P/py8vlbNt9MQLdCEMLXCjX4xlihMmCPaGsVUzXbTnu6r/0tKK6QNDu6hbElRbi5XRBRBs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ofMtdCr5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fxdu6q8N; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ofMtdCr5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fxdu6q8N"
Date: Fri, 26 Jun 2026 10:34:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782462858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1TVxqiKwDBksfcLYjum9fSYxSLypbXQ7jgHRkZjpTck=;
	b=ofMtdCr5++bUOaJdHemxHF8wTb21XyXCdlmXxT5HB2wKbUMv2cx378nFE+s5q6u7uEi//6
	SVP3GeBoqKWdHGH3fv6OctMTfuqPYv/mw8T04pVC+bhPemttuVRd2g6FVbPPXr+8YYWNWl
	RfPlEK8ZG3MerUSh3tqN9Vl9ZGayUI7k+rphZxDdvDzM/XmHDtEBqevXyyKxLOZWwCYhxM
	VeKnLmGcTQ0jGmOfkpaTUQj6mWJoZB1+PmJxEbR3UHWdMV1R+7N49k492kuCUHpE4FNIHN
	OZdrbpPaAiRmU0gMrcl6VZvhtVrteWe5kQ/FBs98h/PchTagb0pydJ/BV2G5sw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782462858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1TVxqiKwDBksfcLYjum9fSYxSLypbXQ7jgHRkZjpTck=;
	b=fxdu6q8Nxp//divDyDsLSzE0l2MH0u1XJelSJse/Jk/2G9znHbfH2QRZwtwYaOzRc/uxFo
	9m4brKcmJHT6R7Cw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v3 01/10] mailbox: imx: Forward the timeout/ error in
 imx_mu_generic_tx()
Message-ID: <20260626083416.xbVlbOQJ@linutronix.de>
References: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
 <20260617-imx_mbox_rproc-v3-1-77948112defc@linutronix.de>
 <ajkbUNkn6MSw8txc@shlinux89>
 <20260624074409.5jwpWs61@linutronix.de>
 <aj43FQ7f6juXQ/tP@shlinux89>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aj43FQ7f6juXQ/tP@shlinux89>

On 2026-06-26 16:23:49 [+0800], Peng Fan wrote:
> On Wed, Jun 24, 2026 at 09:44:09AM +0200, Sebastian Andrzej Siewior wrote:
> >On 2026-06-22 19:24:00 [+0800], Peng Fan wrote:
> >> We may need to use atomic API for TXDB_V2. For the patchset itself, it
> >> looks good to me.
> >> 
> >> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> >
> >Thank you. Is there anything you want me to do or is this series good
> >as-is?
> 
> If you would like to address the AI reported issue further, you may
> update readl_poll_timeout to readl_poll_timeout_atomic.

What about the timeout value? Keep it as-is or reduce to?

> From the fix on error return, this patch is ok to me, and the series is good.

Thanks.

> Thanks,
> Peng
> >

Sebastian
