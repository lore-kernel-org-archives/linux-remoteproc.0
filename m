Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919AE3B42FA
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 06:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679350; cv=none; b=oLCKg5JjIqOYX9m6b0OJTpNVSYBNwyNpxHrrk7ecucxkp1HiLGbAgUkweRWm+tluJZ6u/eQkOkYBdfGj6Jm3mkLa0tGZsy+tuvoC88t/gSNphumtFUxUkGsEl5x2KOGZbJPDuzGuGtRLa9YOOBVgihSSN0a21wNaqqlb3GjBmUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679350; c=relaxed/simple;
	bh=HfROMFYhqNMezpcjw8fYzYv/EDEm3a0b1cv3im+l4Z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kdNXQjVmAyRW865iaWkix0AO8qNRmILXEZgaJ50rjcoOrUPGMsUE3PMzojdbt9wizULsuL9CDBCJEWyvbRdWRcGUyV2b4DR9QJHRrcJ+eGF/G99Cqfa0AnGwdzr6S3bPNaT35WRT33brouQkJtKmaGqFChqal4pkvU16tP0UCko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DelXLfp3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uJkjEdkX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DelXLfp3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uJkjEdkX"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781679346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ggQaVDDpNPR76lGbN7CL357TIsvbBMdEKCYYXYIjGU=;
	b=DelXLfp3kfloaK+YSgdSzpPMc5DyLSgjvlIW9utWc76N/QCvGfL+S2Jbxf9Gm0qAfrK+EJ
	TyxTec26djsAOCmACRknjvRfjpcB4GWVtGKN31GJrxvG/HIGKtiQLtYBYc72BJEJWCIpNI
	fCh7XmA+BN3kuhIC8Vgs9taunqcxoEVhIqK4wyyPWU6sPJfXgzNcw0JROY6OlfqvG+nROV
	AWGantbfffzX4sbMvkkf/nS1174ln3cWGgdE/rY1BaKOiKmTJQPyh2JjkScGspiGInH55u
	9hbnZm/XXEd465f2+noSpzLCcOko1NUqjEnqQHdG6pCv8Gifk3tLCAmEX4pkaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781679346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ggQaVDDpNPR76lGbN7CL357TIsvbBMdEKCYYXYIjGU=;
	b=uJkjEdkXKWqGh63YQXU/mmj3dGrKUjbefNJEGL32b2QHPhGuLeglqqPHlPprkWIPHkqT+0
	AXccafA4WVUYmDDQ==
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
Subject: [PATCH v3 06/10] mailbox: imx: Start splitting the IRQ handler in primary and threaded handler
Date: Wed, 17 Jun 2026 08:55:31 +0200
Message-ID: <20260617-imx_mbox_rproc-v3-6-77948112defc@linutronix.de>
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

Split the mailbox irq handling into a primary handler (imx_mu_isr()) and
a threaded handler (imx_mu_isr_th()). The primary handler masks the
interrupt event so the threaded handler can run without raising the
interrupt again.

The goal here is to invoke the mailbox core functions (such as
mbox_chan_received_data(), mbox_chan_txdone()) in preemptible context which=
 is
made possible by using an threaded interrupt handler. This in turn means th=
at
mailbox's client callbacks are invoked in preemptible context, too. This th=
en
allows the mailbox client callback to skip an indirection via a workqueue if
it requries preemptible callback.

As a first step, prepare the logic and move TX handling part.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 408cd083c64ee..87acc43cb99c4 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -540,11 +540,31 @@ static void imx_mu_txdb_work(struct work_struct *t)
 	mbox_chan_txdone(cp->chan, 0);
 }
=20
+static irqreturn_t imx_mu_isr_th(int irq, void *p)
+{
+	struct mbox_chan *chan =3D p;
+	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
+	struct imx_mu_con_priv *cp =3D chan->con_priv;
+
+	switch (cp->type) {
+	case IMX_MU_TYPE_TX:
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
@@ -580,7 +600,7 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
 	if ((val =3D=3D IMX_MU_xSR_TEn(priv->dcfg->type, cp->idx)) &&
 	    (cp->type =3D=3D IMX_MU_TYPE_TX)) {
 		imx_mu_xcr_rmw(priv, IMX_MU_TCR, 0, IMX_MU_xCR_TIEn(priv->dcfg->type, cp=
->idx));
-		mbox_chan_txdone(chan, 0);
+		ret =3D IRQ_WAKE_THREAD;
 	} else if ((val =3D=3D IMX_MU_xSR_RFn(priv->dcfg->type, cp->idx)) &&
 		   (cp->type =3D=3D IMX_MU_TYPE_RX)) {
 		priv->dcfg->rx(priv, cp);
@@ -595,7 +615,7 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
 	if (priv->suspend)
 		pm_system_wakeup();
=20
-	return IRQ_HANDLED;
+	return ret;
 }
=20
 static int imx_mu_send_data(struct mbox_chan *chan, void *data)
@@ -630,7 +650,8 @@ static int imx_mu_startup(struct mbox_chan *chan)
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

