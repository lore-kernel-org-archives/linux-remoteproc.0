Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15263F1676
	for <linux-remoteproc@vger.kernel.org>; Fri, 29 May 2026 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780070483; cv=none; b=FgnK1E+tTH4WWS1ZeFaDh/oNTlec+l1Wd8VMSaG8khtmIpK0COkRACJQEKYelGkQjOWv3o3PG+44KWL5pnN2U/Vk3567K53K63gj01RSOLdBS1txiWPFp3+vDF4pVf9YHZgK6f+RzmiE1sRyFCv+lSKWhO1x7Tr9tagm3/+jt1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780070483; c=relaxed/simple;
	bh=g8co2To/mzLnsoa0vTTbLfoV6aHIIyt/KdbRvmJqJao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kmfJ3qVbQVjgmBHrb0uri2sETjwMtJlPSns0k3BN0yo8b2oz9P5K8xeePFJy+1zKrjUYxHKGntdd/7OXWLobLsXFOipdqJjVN5OieCa+gGg5A078JlTuUIn59ctC11vDbuy1yp2qSvOF5w6qe5TIy9WpDq18yqhVubZwmKTaSDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OCoDKhED; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tr4NTO1Y; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OCoDKhED";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tr4NTO1Y"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780070480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JbrnpdD8CF3wPWvXSTboKcNrFbu7LYufEVGUIXXk/IQ=;
	b=OCoDKhEDt+SYMnBLTMKN+LUH8VOvCeM7CyrYXEEld5LI2sA8bOJ98ttY5LXrMNY/OZtbmu
	ZgHjfIi1b2LufXEXB0eQcu+ztkYeKOVSyl4XUU4fGpNoXJT+aphPInqfNh7MU9IbiCLGwB
	Sf9tF/W0yPqZ8AbCp7mCdOANodn98cFQidY8QeytGaCgA75khMkgH67kB1dqQj00b+bBAh
	/68yU9dB5THgTxrheAKcD6+jHh316zzHAr9qH/ttbffEWLK/zGs+FD7vUHBQd7A581dE/N
	uAuZF5ymfOmoxFhiBFdrmXQbd7tLNIA7YSSdXyf9ydoegmFm93V2yxr6ot7FMg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780070480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JbrnpdD8CF3wPWvXSTboKcNrFbu7LYufEVGUIXXk/IQ=;
	b=tr4NTO1YNRsGuahlOKQtSUD8eg7CCkQPgW7y+NJgZiX6IbK3HIbCNwY/XqexMCEbBibY6v
	GgeY9AFsCgbpQOCA==
To: linux-rt-devel@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 2/5] mailbox: imx: Move the RX part of the mailbox into the threaded handler
Date: Fri, 29 May 2026 18:01:04 +0200
Message-ID: <20260529-imx_mbox_rproc-v1-2-b8ffc36e11e5@linutronix.de>
In-Reply-To: <20260529-imx_mbox_rproc-v1-0-b8ffc36e11e5@linutronix.de>
References: <20260529-imx_mbox_rproc-v1-0-b8ffc36e11e5@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Move RX callback handling into the threaded handler. This is similar to
the TX side except that we explicitly mask the source interrupt in the
primary handler and unmask it in the threaded handler again after
success. This was done automatically in the TX part.

The masking/ unmasking can be removed from imx_mu_specific_rx() since it
already happens in the primary/ threaded handler before invoking the
channel specific callback.

Move RX channel handling into threaded handler.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 2809965677bd7..30a52c609e56b 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -350,7 +350,6 @@ static int imx_mu_specific_rx(struct imx_mu_priv *priv,=
 struct imx_mu_con_priv *
=20
 	data =3D (u32 *)priv->msg;
=20
-	imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(priv->dcfg->type, 0));
 	*data++ =3D imx_mu_read(priv, priv->dcfg->xRR);
=20
 	if (priv->dcfg->type & IMX_MU_V2_S4) {
@@ -377,7 +376,6 @@ static int imx_mu_specific_rx(struct imx_mu_priv *priv,=
 struct imx_mu_con_priv *
 		*data++ =3D imx_mu_read(priv, priv->dcfg->xRR + (i % num_rr) * 4);
 	}
=20
-	imx_mu_xcr_rmw(priv, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, 0), 0);
 	mbox_chan_received_data(cp->chan, (void *)priv->msg);
=20
 	return 0;
@@ -524,6 +522,12 @@ static irqreturn_t imx_mu_isr_th(int irq, void *p)
 		mbox_chan_txdone(chan, 0);
 		return IRQ_HANDLED;
=20
+	case IMX_MU_TYPE_RX:
+		cp->pending =3D 0;
+		if (!priv->dcfg->rx(priv, cp))
+			imx_mu_xcr_rmw(priv, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, cp->=
idx), 0);
+		return IRQ_HANDLED;
+
 	default:
 		dev_warn_ratelimited(priv->dev, "Unhandled channel type %d\n",
 				     cp->type);
@@ -576,7 +580,9 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
 		ret =3D IRQ_WAKE_THREAD;
 	} else if ((val =3D=3D IMX_MU_xSR_RFn(priv->dcfg->type, cp->idx)) &&
 		   (cp->type =3D=3D IMX_MU_TYPE_RX)) {
-		priv->dcfg->rx(priv, cp);
+		cp->pending =3D 1;
+		imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(priv->dcfg->type, cp=
->idx));
+		ret =3D IRQ_WAKE_THREAD;
 	} else if ((val =3D=3D IMX_MU_xSR_GIPn(priv->dcfg->type, cp->idx)) &&
 		   (cp->type =3D=3D IMX_MU_TYPE_RXDB)) {
 		priv->dcfg->rxdb(priv, cp);

--=20
2.53.0

