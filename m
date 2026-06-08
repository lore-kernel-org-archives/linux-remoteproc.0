Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DB53B3BF3;
	Mon,  8 Jun 2026 09:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911495; cv=none; b=RnOhV+OK/EWeVtZBD29naXswWhBNuaAfrDFr6Gylv1huzwaDB3QHfyHwVoyiPqTbeC9YQhsEVP3bdnBTYGPX1hcWOxYnIXXaY4bsjdcLHjqXh11mpA4aXw+LFKgAXL8iMqP97AYFBnGx2M48SARZ0zSof/Oy4nWH7jwuxHxBPYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911495; c=relaxed/simple;
	bh=0DB/qnF5C10Up5aL2LDmTloNAzDuQBxbN1TPgDZNV7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVfnvXIHb26KwDK7ILHLLGqn0gpCfUetE3hKKYCfz+MDHLWl1wMR4SqYXjSXlhsjSOdZV//rQ3GAugwGNfVIkcN9wBxcTd+qNhrFpwIx5P6abA/4k9zmb2+OYmXKlDkb9rU8fYsbJnf1pc5GQyo9JzREkgli+0XHF1ipmTq9g3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qSkXkyiM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CMnCKv0g; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qSkXkyiM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CMnCKv0g"
Date: Mon, 8 Jun 2026 11:37:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780911492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l+o8svFCxO2rHzDsZerdi155VOjvat+y1/HHxxd5x+s=;
	b=qSkXkyiMhG+yreJBJn8Bv+ukObN6m2OGhUPb65y3sGKyWWCw6XTaynyoEVXyQ1oAwc/Pw1
	X2u/taqCLcxpZZffzmaDVueqDQoaZXaOUOJYZHQgyUNVBbhEA7R9gHii9orsMghKX57Kna
	pc/waPc/ifmH66YVHTTi14N3d78/OZpusS+9nUVRMpq6sDM2mfZrLM0cLF3jOXjj2AIs3p
	VwAV+tJtJfEO3MrzfL0LVFdNNxNmuzlS/jPl1rK3GyqSCNLM/kNu9NYdjCiy7wj/pxsvjZ
	sZ43J9BtppHdiIgPuhtMxK/LF8fn7wOmiVVFXpzU812iGRlKyjqD7/T715YLdQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780911492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l+o8svFCxO2rHzDsZerdi155VOjvat+y1/HHxxd5x+s=;
	b=CMnCKv0gZGa7h4OSPlnQSW6h7FnNdqcBQ0uhp3q44WMHwKvAuLV17PSdXoyWNYsGQi9Vc3
	GRiILz9FH22KOJCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peng Fan <peng.fan@oss.nxp.com>
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
Subject: Re: [PATCH v2 5/9] mailbox: imx: Start splitting the IRQ handler in
 primary and threaded handler
Message-ID: <20260608093758.0K8BkEnj@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
 <20260603-imx_mbox_rproc-v2-5-a0059dc3b69a@linutronix.de>
 <aiZUAdrwhFn63a2a@shlinux89>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aiZUAdrwhFn63a2a@shlinux89>

On 2026-06-08 13:32:49 [+0800], Peng Fan wrote:
> > drivers/mailbox/imx-mailbox.c | 33 ++++++++++++++++++++++++++++++---
> > 1 file changed, 30 insertions(+), 3 deletions(-)
> >
> >diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> >index d1de07cc0ed62..006aa76b74b62 100644
> >--- a/drivers/mailbox/imx-mailbox.c
> >+++ b/drivers/mailbox/imx-mailbox.c
> >@@ -81,6 +81,7 @@ struct imx_mu_con_priv {
> > 	struct mbox_chan	*chan;
> > 	struct work_struct 	txdb_work;
> > 	bool			shutdown;
> >+	bool			pending;
> > };
> > 
> > struct imx_mu_priv {
> >@@ -539,11 +540,35 @@ static void imx_mu_txdb_work(struct work_struct *t)
> > 	mbox_chan_txdone(cp->chan, 0);
> > }
> > 
> >+static irqreturn_t imx_mu_isr_th(int irq, void *p)
> >+{
> >+	struct mbox_chan *chan = p;
> >+	struct imx_mu_priv *priv = to_imx_mu_priv(chan->mbox);
> >+	struct imx_mu_con_priv *cp = chan->con_priv;
> >+
> >+	if (!cp->pending)
> >+		return IRQ_NONE;
> 
> Is there a chance that cp->pending could be false here?

Maybe not. That handler is shared but the threaded handler is only woken
up if pending is set to true. So it should not observe it set to false.
You want me to get remove it?

> Regards
> Peng

Sebastian
