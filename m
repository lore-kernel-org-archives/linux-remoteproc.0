Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C2148122B;
	Wed,  3 Jun 2026 13:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491925; cv=none; b=XSDl9esZBHjH9SDC0q1HKdXkq67hulHG6b+6IsDWSox4xJkzjCyhbAzD5O79NDGnUz4j288s31lr85CGUG78xzRuQprI2GSlNuki8fuRsbUAAxs7xyF2gyZ7B4g7UO1EoK0+49EImMbeh+p/lgz6E6hXpWyCAFrMvvJs0/xwD6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491925; c=relaxed/simple;
	bh=ar7weazsSFejktseea/mhSlOoaOx04l8Z/I5D2ICyyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d9ovE/K5F0ZMOPoxEvUeXd1Qp4Pz6k0YjbLlyjDHt7UpzDOjf7LjbDp2gV+t9j7zIRwOXWm+5acT3iWQeZ+HhfMucAYRBRxrnucfbDwsoS/R9OnpL5VSDhBndTCEIeZC+tgDTnBXYagwnLAn81IY2nY9jj4fF9MXF1EZjcqZf5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Z0pHmSo2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jeVfsNNS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Z0pHmSo2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jeVfsNNS"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780491921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qsswPfnnXsB1CCpGvONqYTMOqIRDSE3ZuW24UofC3Kc=;
	b=Z0pHmSo2e9HDjyvJRggfuyCHJ6y6zW13ZP/RkWeojZN3vR5/icaM16ZmgYP7Szm0s2XoT9
	oM72YLKc6J5H/8Ab/7G+cmC/JXKbp+ZaVqQ7RPm2GOedLO+1QyBx/VzDrS4xuxXqQu8gbo
	hF7Hk9AKHmz8K8j4DKqMLVaGIl9/JU2mmNgzaKeTn/B6zCYq9RtT+DwWX5FVJnqs8HwmBX
	+M5qwo1M48PRouUa7kyhVMrspMwoKsqo+PVrwLQegYV5a7lrMQBI5buIo9Ht57CxlBGjOv
	Cs3PtCIQ3UGRaJJZzS9Km1olhDdBIAxxZ79lnPP2idWG/NwtcXJhVm2hYxn3+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780491921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qsswPfnnXsB1CCpGvONqYTMOqIRDSE3ZuW24UofC3Kc=;
	b=jeVfsNNSjrj1ZI/nR2d3BwMidOmkeqY6W5NaTimA1P5kTSMZHU8CUP1+/aw8SruGy8vidq
	qOS0E3qXqa4qa+CQ==
To: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
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
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v2 5/9] mailbox: imx: Start splitting the IRQ handler in primary and threaded handler
Date: Wed,  3 Jun 2026 15:05:08 +0200
Message-ID: <20260603-imx_mbox_rproc-v2-5-a0059dc3b69a@linutronix.de>
In-Reply-To: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Split the mailbox irq handling into a primary handler (imx_mu_isr()) and
a threaded handler (imx_mu_isr_th()). The primary handler masks the
interrupt event so the threaded handler can run without raising the
interrupt again. The threaded handler can invoke the actuall callback in
preemtible context.

As a first step, prepare the logic and move TX handling part.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index d1de07cc0ed62..006aa76b74b62 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -81,6 +81,7 @@ struct imx_mu_con_priv {
 	struct mbox_chan	*chan;
 	struct work_struct 	txdb_work;
 	bool			shutdown;
+	bool			pending;
 };
=20
 struct imx_mu_priv {
@@ -539,11 +540,35 @@ static void imx_mu_txdb_work(struct work_struct *t)
 	mbox_chan_txdone(cp->chan, 0);
 }
=20
+static irqreturn_t imx_mu_isr_th(int irq, void *p)
+{
+	struct mbox_chan *chan =3D p;
+	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
+	struct imx_mu_con_priv *cp =3D chan->con_priv;
+
+	if (!cp->pending)
+		return IRQ_NONE;
+
+	switch (cp->type) {
+	case IMX_MU_TYPE_TX:
+		cp->pending =3D false;
+		mbox_chan_txdone(chan, 0);
+		break;
+
+	default:
+		dev_warn_ratelimited(priv->dev, "Unhandled channel type %d\n",
+				     cp->type);
+		return IRQ_NONE;
+	}
+	return IRQ_HANDLED;
+}
+
 static irqreturn_t imx_mu_isr(int irq, void *p)
 {
 	struct mbox_chan *chan =3D p;
 	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
 	struct imx_mu_con_priv *cp =3D chan->con_priv;
+	irqreturn_t ret =3D IRQ_HANDLED;
 	u32 val, ctrl;
=20
 	switch (cp->type) {
@@ -579,7 +604,8 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
 	if ((val =3D=3D IMX_MU_xSR_TEn(priv->dcfg->type, cp->idx)) &&
 	    (cp->type =3D=3D IMX_MU_TYPE_TX)) {
 		imx_mu_xcr_rmw(priv, IMX_MU_TCR, 0, IMX_MU_xCR_TIEn(priv->dcfg->type, cp=
->idx));
-		mbox_chan_txdone(chan, 0);
+		cp->pending =3D true;
+		ret =3D IRQ_WAKE_THREAD;
 	} else if ((val =3D=3D IMX_MU_xSR_RFn(priv->dcfg->type, cp->idx)) &&
 		   (cp->type =3D=3D IMX_MU_TYPE_RX)) {
 		priv->dcfg->rx(priv, cp);
@@ -594,7 +620,7 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
 	if (priv->suspend)
 		pm_system_wakeup();
=20
-	return IRQ_HANDLED;
+	return ret;
 }
=20
 static int imx_mu_send_data(struct mbox_chan *chan, void *data)
@@ -629,7 +655,8 @@ static int imx_mu_startup(struct mbox_chan *chan)
 	if (!(priv->dcfg->type & IMX_MU_V2_IRQ))
 		irq_flag |=3D IRQF_SHARED;
=20
-	ret =3D request_irq(priv->irq[cp->type], imx_mu_isr, irq_flag, cp->irq_de=
sc, chan);
+	ret =3D request_threaded_irq(priv->irq[cp->type], imx_mu_isr, imx_mu_isr_=
th,
+				   irq_flag, cp->irq_desc, chan);
 	if (ret) {
 		dev_err(priv->dev, "Unable to acquire IRQ %d\n", priv->irq[cp->type]);
 		return ret;

--=20
2.53.0

