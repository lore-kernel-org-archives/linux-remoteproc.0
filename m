Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156AE310651;
	Wed,  3 Jun 2026 13:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492839; cv=none; b=n3BSkgCaFVwYvpvABomdkvXvne+aE5ETvckjdoGS9EfNM0/Mbx8IJB0XrPRkv7en4PlVf8K9JQyO6U0mSKFyMI8zrpSrkt1dEH8mcFqwQnPRaRhVUQnH3sw+VT424bdITPYqH28nqZSK9Xc6XtJ2HHBAp+7ZwJBRDHRlLHoWMsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492839; c=relaxed/simple;
	bh=cfoqZBB2G5y+mUNdzj0EJXUBq81ci477NQ/AtjdKYAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DoylmXMAACvcHQX7kmraqFbHM1Gr0vFxNK6crhJajLG++yEygh7d73YgWM5L22MGL49oruXhnFBPuidePzyilzV4Y/mx44a65+bIGXpAWU51Mm08NuBLPDfxUGN9w7L9Kzgj9OnzP+i4glLrygB+ejcxwQOECQRJ0ImSL3uz3Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jSN6T8gP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UP/Js1oz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jSN6T8gP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UP/Js1oz"
Date: Wed, 3 Jun 2026 15:20:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780492836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=64ct7Kd+yKxlS9V8CwC0aSCLMmSvEB4LS5D/r91q8JY=;
	b=jSN6T8gPT2w3DLFI3CwrUaQ7Daf6BrZSGQsHzMRW1es3bXugS1XcBt8F/mUGLh5Cb1Dtoz
	p5VuCf9XpkGoXASyXhIdh+/oCRpngggfosroE6e3ZgTJLl9RluzX8ai2v0L2nGDS/r+g5o
	7Uef7pHjpZZxFmZGbDKbihXDcmV2403HFEARtLi6/FYSGnSbcip91odXyx7mtuO165utsg
	xOFPm7Lh4pRaU9ac91YnfQrjMjq0PkJkMSFcxyEc52Qepk7b2HV6eZZdzvzEZpHuHGfzHC
	PKYdqZdTI1hAIHj8Y4xzmceE7TUO/b7XwCKd/6dczf+EjDRiBvezgHtac+4iMg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780492836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=64ct7Kd+yKxlS9V8CwC0aSCLMmSvEB4LS5D/r91q8JY=;
	b=UP/Js1ozjTwwW13wk3m9RpZXA0bC4wMD3AdiEEc6Rw9BPBc1ktYeCPK8qHXJQ/JoeeEByZ
	X1w4H88/SgcCx0AA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 6/9] mailbox: imx: Move the RX part of the mailbox
 into the threaded handler
Message-ID: <20260603132034.NxZoA4pH@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
 <20260603-imx_mbox_rproc-v2-6-a0059dc3b69a@linutronix.de>
 <c81d12a8-7544-493f-a947-8f70ad9d409d@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c81d12a8-7544-493f-a947-8f70ad9d409d@oss.nxp.com>

On 2026-06-03 16:18:22 [+0300], Daniel Baluta wrote:
> On 6/3/26 16:05, Sebastian Andrzej Siewior wrote:
> > Move RX callback handling into the threaded handler. This is similar to
> > the TX side except that we explicitly mask the source interrupt in the
> > primary handler and unmask it in the threaded handler again after
> > success. This was done automatically in the TX part.
> > 
> > The masking/ unmasking can be removed from imx_mu_specific_rx() since it
> > already happens in the primary/ threaded handler before invoking the
> > channel specific callback.
> > 
> > Move RX channel handling into threaded handler.
> 
> Hi Sebastian,
> 
> It is not very clear from me from the commit message why this change is needed.
> Can you please update the commit message with proper explanation?

The intention is to move the entire interrupt handling into the threaded
handler. The primary handler masks just event, the threaded handler
performs the RX/TX/ event.
I move the individual events step by step so the previous patch moved
the TX, here is RX and the next one does RXDB.

Is this clear now? The cover later explains why this done in the first
place.

Sebastian
