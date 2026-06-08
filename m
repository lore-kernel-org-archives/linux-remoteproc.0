Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664543B38A2;
	Mon,  8 Jun 2026 09:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911574; cv=none; b=bsqfcs3JkNpAf9LXRX3xowWSOtyPi2q7/E//XUiNnDfmHsztz5CoaXAXHIZzlEjHcYiYEymoDe+ROYSXRmLVCYMM95SwhhwhkMQOwPg/JGyyDnLzhSZ2Hqoqw2XY8spLYbgljpPPNRflCGeiFh/MkEiVjQH8srzpnSvyUUfvUBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911574; c=relaxed/simple;
	bh=EUErLaxZSps/O8mMpYkR9fMWh6hZP2eh8bGaW43VfGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTQSHC1ymLZCp8xqK/L/caKY2LNX3sC0S1ygZncS61wDcplwfwxkdFvbmH6T3pcRte9tPlA8jb+XQduvqhjXA5slTYitdFJw5Di1aAvefGeQMWNGghSXMTGCl/eyzFZFfjhBL4/iDkmiCoDIbMhCNHOtO6RMmBC9N9FYUETdMsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PZOHHIOz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YvkuTnn8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PZOHHIOz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YvkuTnn8"
Date: Mon, 8 Jun 2026 11:39:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780911571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V+s8Holh3q/9jzVDb4hC8kDK6pYQ+A1ql6aTpYhtYaw=;
	b=PZOHHIOz2oTGf6wxfmBlJ+l2gG+CrHrdhpE1fLgbnWeHU3+GZB6FqhsojxhiC2vE7LEguj
	LKetQlqV/DGIaafQTkbjhU1vFN/5YmaBc7o/7yUNoPJxVo+OSQnQoPGJPHpHOeRoqgLB2j
	Lym4OcTHkBtdCj+VNP4ZFpcBvHdQZ7YmLPWxZ6Ii5w2QKEB17j+Wmo1SNTEBKEMj6gtZ6P
	WolE0RuLiDZTF2gYFDImDvniotGa56fz5bCLAV/67LpdcmeQ5ITi6jfSau3XdoO8YS3yaf
	I6uVMaOODKr6YqoT88YESwwWNz1XHbaQpYGOVHCGB5tuBGoNpXxzkr/VtHDb7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780911571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V+s8Holh3q/9jzVDb4hC8kDK6pYQ+A1ql6aTpYhtYaw=;
	b=YvkuTnn8uebWuLKJnMegLWKeTlmmFk+STOHYamb75Oip9T/oPsdXC6QTz7BD/5IEYBvJZ4
	dNqZ17XyJxFB4fAA==
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
Subject: Re: [PATCH v2 4/9] mailbox: imx: Use channel index instead of zero
 in imx_mu_specific_rx()
Message-ID: <20260608093929.k43eIA6-@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
 <20260603-imx_mbox_rproc-v2-4-a0059dc3b69a@linutronix.de>
 <aiZO9rf4K9Ixzw0Q@shlinux89>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aiZO9rf4K9Ixzw0Q@shlinux89>

On 2026-06-08 13:11:18 [+0800], Peng Fan wrote:
> >diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> >index 1dda1437b87f6..d1de07cc0ed62 100644
> >--- a/drivers/mailbox/imx-mailbox.c
> >+++ b/drivers/mailbox/imx-mailbox.c
> >@@ -407,7 +407,7 @@ static int imx_mu_specific_rx(struct imx_mu_priv *priv, struct imx_mu_con_priv *
> > 		*data++ = imx_mu_read(priv, priv->dcfg->xRR + (i % num_rr) * 4);
> > 	}
> > 
> >-	imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, 0));
> >+	imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, cp->idx));
> > 	mbox_chan_received_data(cp->chan, (void *)priv->msg);
> 
> For specific rx channel, whether it is i.MX8 SCU or i.MX ELE, actually there is
> only 1 channel as of now, but it seems better to use cp->idx in case more
> channels in future.

Thank you for clarifying.

Sebastian
