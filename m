Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E854F3B8405
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 06:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679348; cv=none; b=EhIHT15G09bgrYNZFxcMyCYfMg3H7wXrD5xF1GkyzDikyWvcTTkLnRhd1QbhNJtVwK/0mdH0SXOW41IILQpejoGZh0EG4KN+E/R1mB6whcsrmDH42/z2spqEOEuiIoEoKI7vQHpGVmaBt2ZqQMK8KVll7ZoPkgU9EftCzxrV4Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679348; c=relaxed/simple;
	bh=5Pw8T1+jKgfblXAUJw8ZxdtyGBVQ2FjHPIKfg/XodJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O2MWgLR9kDucNtSZ0hLdOONWyJ5dym6tggSc6VIUmTxDWrWkNw1rVCe0DpP1Z0jb8pWFlbG/lUNa01P2/jed1JTkUB3+20uKYYtzSpK8VBADXHJk7eiqyUjHnCmXJePZXLhy468kD5s2l3QOVebXPlWKrZteLXpa4e1yKMCGLNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xhUXCBqq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=o+qabkhs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xhUXCBqq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="o+qabkhs"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781679344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CBZwcNL1eAQUAHJfoFSR6vjSaP4CfP98WpLqLWH2NEc=;
	b=xhUXCBqqY3ZTzw3Etoal/C+jfmal1HS4BCPmF9LgagPZls5uptQHmTDsi2iSC21DysjPT/
	Wa4SMF0Az4k0H0AEZ87XdczztQ0tthR5x8FWO9ujVaOU/0q7wkupzxC1gUkjQh3chaNQwZ
	JIZi4oxJo5O9L+s+N6w16Ed8HvN1Alk7jvnHMcC0zBVsIogfOduFGqp9CRUdfBEfE0u7mw
	o+8ayhT6VIaj8C/LYVACJoVv5ifoxcyffwc2Ir/EcFwXkOwkYdknTnjQF4CMAeUQoFnNPu
	S5JIGFb/H70/Iy7BvNl6SvuF+et+MD/pqfPMrGfCIPpEbEJ7cmpaCOmtIjDcrA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781679344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CBZwcNL1eAQUAHJfoFSR6vjSaP4CfP98WpLqLWH2NEc=;
	b=o+qabkhss1CF9txBm3J5BtgSGmHg0yjdOUdm0zBjW5oqk7OPywC5SzGdrcyaowwMDTWDTi
	/3SCgpz/PEOIQtCw==
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
Subject: [PATCH v3 02/10] mailbox: imx: Add a channel shutdown field
Date: Wed, 17 Jun 2026 08:55:27 +0200
Message-ID: <20260617-imx_mbox_rproc-v3-2-77948112defc@linutronix.de>
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

sashiko complained about possible teardown problem. The scenario

 CPU 0                              CPU 1
  imx_mu_isr()                   imx_mu_shutdown()
                                   imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_=
MU_xCR_RIEn(priv->dcfg->type, cp->idx));
    imx_mu_specific_rx()
      imx_mu_xcr_rmw(priv, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, 0)=
, 0);
                                   free_irq()

The RX event remains enabled because in this short window the RX event
was disabled in ->shutdown() while the interrupt was active and then
enabled again by the ISR while ->shutdown waited in free_irq().

This race requires timing and if happens can be problematic on shared
handlers if the "removed" channel triggers an interrupt. In this case
the irq-core will shutdown the interrupt with the "nobody cared"
message.

Introduce imx_mu_con_priv::shutdown to signal that the channel is
shutting down. This flag is set with the lock held (by
imx_mu_xcr_clr_shut()). The unmask side uses imx_mu_xcr_set_act() which
only enables the event if the channel has not been shutdown and
serialises on the same lock.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 40 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 0028073be4a71..e261b382d5c90 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -80,6 +80,7 @@ struct imx_mu_con_priv {
 	enum imx_mu_chan_type	type;
 	struct mbox_chan	*chan;
 	struct work_struct 	txdb_work;
+	bool			shutdown;
 };
=20
 struct imx_mu_priv {
@@ -219,6 +220,36 @@ static u32 imx_mu_xcr_rmw(struct imx_mu_priv *priv, en=
um imx_mu_xcr type, u32 se
 	return val;
 }
=20
+static void imx_mu_xcr_clr_shut(struct imx_mu_priv *priv, struct imx_mu_co=
n_priv *cp,
+				enum imx_mu_xcr type, u32 clr)
+{
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&priv->xcr_lock, flags);
+	cp->shutdown =3D true;
+
+	val =3D imx_mu_read(priv, priv->dcfg->xCR[type]);
+	val &=3D ~clr;
+	imx_mu_write(priv, val, priv->dcfg->xCR[type]);
+	spin_unlock_irqrestore(&priv->xcr_lock, flags);
+}
+
+static void imx_mu_xcr_set_act(struct imx_mu_priv *priv, struct imx_mu_con=
_priv *cp,
+			       enum imx_mu_xcr type, u32 set)
+{
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&priv->xcr_lock, flags);
+	if (!cp->shutdown) {
+		val =3D imx_mu_read(priv, priv->dcfg->xCR[type]);
+		val |=3D set;
+		imx_mu_write(priv, val, priv->dcfg->xCR[type]);
+	}
+	spin_unlock_irqrestore(&priv->xcr_lock, flags);
+}
+
 static int imx_mu_generic_tx(struct imx_mu_priv *priv,
 			     struct imx_mu_con_priv *cp,
 			     void *data)
@@ -377,7 +408,7 @@ static int imx_mu_specific_rx(struct imx_mu_priv *priv,=
 struct imx_mu_con_priv *
 		*data++ =3D imx_mu_read(priv, priv->dcfg->xRR + (i % num_rr) * 4);
 	}
=20
-	imx_mu_xcr_rmw(priv, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, 0), 0);
+	imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type=
, 0));
 	mbox_chan_received_data(cp->chan, (void *)priv->msg);
=20
 	return 0;
@@ -605,6 +636,7 @@ static int imx_mu_startup(struct mbox_chan *chan)
 		return ret;
 	}
=20
+	cp->shutdown =3D false;
 	switch (cp->type) {
 	case IMX_MU_TYPE_RX:
 		imx_mu_xcr_rmw(priv, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, cp->i=
dx), 0);
@@ -639,13 +671,13 @@ static void imx_mu_shutdown(struct mbox_chan *chan)
=20
 	switch (cp->type) {
 	case IMX_MU_TYPE_TX:
-		imx_mu_xcr_rmw(priv, IMX_MU_TCR, 0, IMX_MU_xCR_TIEn(priv->dcfg->type, cp=
->idx));
+		imx_mu_xcr_clr_shut(priv, cp, IMX_MU_TCR, IMX_MU_xCR_TIEn(priv->dcfg->ty=
pe, cp->idx));
 		break;
 	case IMX_MU_TYPE_RX:
-		imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(priv->dcfg->type, cp=
->idx));
+		imx_mu_xcr_clr_shut(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->ty=
pe, cp->idx));
 		break;
 	case IMX_MU_TYPE_RXDB:
-		imx_mu_xcr_rmw(priv, IMX_MU_GIER, 0, IMX_MU_xCR_GIEn(priv->dcfg->type, c=
p->idx));
+		imx_mu_xcr_clr_shut(priv, cp, IMX_MU_GIER, IMX_MU_xCR_GIEn(priv->dcfg->t=
ype, cp->idx));
 		break;
 	case IMX_MU_TYPE_RST:
 		imx_mu_xcr_rmw(priv, IMX_MU_CR, IMX_MU_xCR_RST(priv->dcfg->type), 0);

--=20
2.53.0

