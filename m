Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF533B9937
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 06:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679351; cv=none; b=Vw66+TUVofSNeo2awj1+dDiJKWtrdViRiOdhHXup9VJlYKmAalemflM5cCtfU+/9mJQ5QCGYKntskAkR0woxurUr6cj+XZ/fHM1pWt+WKnMDwbYsYyDLqPMY29ZB0ZIFbXSzVEkPwROAinUaVmmySyQCbR/N1rbSnQbf1pdZxP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679351; c=relaxed/simple;
	bh=cbMJWtll4VOT2D+tKjVt4Sw6IQZHaBkhYWv5t4lXHsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mn09ghghfN0fVZuwz3+ngakS4G+uLe2FP0dv7+uv+7OvBmIDMXAnga4annjA07FBNeLVNvCHH4Ax30ou4YU76tGM+GjnYPd+AVxwxOatvtLV0jhxrlfV7CC3LRJ1ShWmHvEtBgPmG26UOcFz5q4YxlRaGTwszCIwPb4HAFj60gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4197dqZO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gsHonUWZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4197dqZO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gsHonUWZ"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781679347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XfpZwCg0u8EXGbePq2dXyBkiOQd+rMzCgxtnb63zw4Q=;
	b=4197dqZO4E0vEx+lbAySGiYIXBQp8v/En4/APLfBoRnzar5WKQUWC6Z3mjD4Udb1Y/dsWg
	LQdiiTXnWz1S/YaYQte2CoSiznAdMOWq5Ym532Am/ZQ1Ex0KpznZ4yKuJTDH9PcBYXo+4Z
	/AcADq3Wl8TEKIasmWN5WzePhwEla9GhyeSVZG7f2f9RF3Ct1U4Bu0FTOXgi1X0f+hKlol
	4l9fZhg2azZlFGvcsOJ3oqxzoPSqcAQWxJXaCFLBDFXeCngjsTO+MUjVsDVdqR3iymRm6D
	4a7lij8KUrbz/VHLCnSDg0FVBvNzD94FK1vfKWHefpd7w1N6cKGP7RBi3fszKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781679347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XfpZwCg0u8EXGbePq2dXyBkiOQd+rMzCgxtnb63zw4Q=;
	b=gsHonUWZxVol++wYr+zwgcvF9YrlMryZLh+vqM7zn2gjNPeWObezot9Sw2eZoceolLONjq
	INmhqyk4C+V9yjBQ==
To: linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v3 07/10] mailbox: imx: Move the RX part of the mailbox into the threaded handler
Date: Wed, 17 Jun 2026 08:55:32 +0200
Message-ID: <20260617-imx_mbox_rproc-v3-7-77948112defc@linutronix.de>
In-Reply-To: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
References: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
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

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 87acc43cb99c4..1219c35b116e4 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -381,7 +381,6 @@ static int imx_mu_specific_rx(struct imx_mu_priv *priv,=
 struct imx_mu_con_priv *
=20
 	data =3D (u32 *)priv->msg;
=20
-	imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(priv->dcfg->type, cp-=
>idx));
 	*data++ =3D imx_mu_read(priv, priv->dcfg->xRR);
=20
 	if (priv->dcfg->type & IMX_MU_V2_S4) {
@@ -408,7 +407,6 @@ static int imx_mu_specific_rx(struct imx_mu_priv *priv,=
 struct imx_mu_con_priv *
 		*data++ =3D imx_mu_read(priv, priv->dcfg->xRR + (i % num_rr) * 4);
 	}
=20
-	imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type=
, cp->idx));
 	mbox_chan_received_data(cp->chan, (void *)priv->msg);
=20
 	return 0;
@@ -551,6 +549,11 @@ static irqreturn_t imx_mu_isr_th(int irq, void *p)
 		mbox_chan_txdone(chan, 0);
 		break;
=20
+	case IMX_MU_TYPE_RX:
+		if (!priv->dcfg->rx(priv, cp))
+			imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->ty=
pe, cp->idx));
+		break;
+
 	default:
 		dev_warn_ratelimited(priv->dev, "Unhandled channel type %d\n",
 				     cp->type);
@@ -603,7 +606,8 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
 		ret =3D IRQ_WAKE_THREAD;
 	} else if ((val =3D=3D IMX_MU_xSR_RFn(priv->dcfg->type, cp->idx)) &&
 		   (cp->type =3D=3D IMX_MU_TYPE_RX)) {
-		priv->dcfg->rx(priv, cp);
+		imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(priv->dcfg->type, cp=
->idx));
+		ret =3D IRQ_WAKE_THREAD;
 	} else if ((val =3D=3D IMX_MU_xSR_GIPn(priv->dcfg->type, cp->idx)) &&
 		   (cp->type =3D=3D IMX_MU_TYPE_RXDB)) {
 		priv->dcfg->rxdb(priv, cp);

--=20
2.53.0

