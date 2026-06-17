Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF6A394789
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 06:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679351; cv=none; b=JWu5Z9FRX2/8dEtvZv5WuKlC8NSkdDEHZSe8NxLASUtKApIEvIbgfRr70zfd73CWKNdaf4IgdQC/YDzQYS9RX4DVsr+XPraWqesgY2CibZq6eQJM12rVeWKAL8zHZEjclHnqabj/3TQFwmVboOyc+XPKNLCM9KVd1kvXSB9823g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679351; c=relaxed/simple;
	bh=kTZA2EM0q5Y3Vvro3tdcXNJuZReEeOH3jAvenMXpM7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i/EVDZnJ83j704YJ7G/n9VDMfPYnF3I0yIYqaz/v9625ZOq1Mim34vjGjfd7RnAWIA67eNdcA/7Ew2okIjvbr/m3TnL4JDxCCbxV3Rq6N88pGxNDSTdJ3NbSRhYsPMZDJfd2E8r6/LgChpp5db0Aq5JeqB+K1tzP/7HmQ24EPxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=u6wYF47F; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LHvWmm1W; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="u6wYF47F";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LHvWmm1W"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781679348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vkLWyR5j83iOJvGQjhK88xzZqYSNRipAcO47hPIOCE4=;
	b=u6wYF47FnODrLmkcqITM3T9iC60QqIKDpxy0Np6r74qYqDB0wF9vi4y4W3+ntD/zEvWvAV
	jCz0vzD52XSFGfTSLsuu4F3Ynp2G4bZAsuzsPkTfPxphvwfba0YKGO1cql/vhoEjMLhVss
	qUYvRAYqCDJqYF/0kQxNYloFfw5bTDvrosR6nwjwmdBO/mwbfUm+ioPngA4rC25YKba9bd
	dVFCNn6RNS9nZIeUjpDmnnPhnQXp5aUShTZPJSviEWYfOYVcC+D+BE2iRWpQ4aLGIpR1AR
	r2XI6j0e4jqxroydJ2vjdzHZRHD6fSOydYklInbmFDXEFYuWjcAq4DkfCTTuaw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781679348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vkLWyR5j83iOJvGQjhK88xzZqYSNRipAcO47hPIOCE4=;
	b=LHvWmm1WOL77QQghjxM8qyEZ+cqDXXD2zeisezDMXR4xIVxWmTLPi0Ec3yYrD1Yy+IkW6w
	AciV5oKTrpB0krDQ==
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
Subject: [PATCH v3 09/10] mailbox: imx: Don't force-thread the primary handler
Date: Wed, 17 Jun 2026 08:55:34 +0200
Message-ID: <20260617-imx_mbox_rproc-v3-9-77948112defc@linutronix.de>
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

The primary interrupt handler (imx_mu_isr()) no longer invokes any
callbacks it only masks the interrupt source and returns. In a
forced-threaded environment the IRQ-core will force-thread the primary
handler which can be avoided.

The primary handler uses a spinlock_t to protect the RMW operation in
imx_mu_xcr_rmw() - nothing that may introduce long latencies.

The lock can be turned into a raw_spinlock_t and then the primary
handler can run in hardirq context even on PREEMPT_RT skipping one
thread.

Make struct imx_mu_priv::xcr_lock a raw_spinlock_t and skip
force-threading the primrary handler by marking it IRQF_NO_THREAD.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 1bd434bdff87a..40bad2b3e4d19 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -87,7 +87,7 @@ struct imx_mu_priv {
 	struct device		*dev;
 	void __iomem		*base;
 	void			*msg;
-	spinlock_t		xcr_lock; /* control register lock */
+	raw_spinlock_t		xcr_lock; /* control register lock */
=20
 	struct mbox_controller	mbox;
 	struct mbox_chan	mbox_chans[IMX_MU_CHANS];
@@ -207,15 +207,14 @@ static int imx_mu_rx_waiting_read(struct imx_mu_priv =
*priv, u32 *val, u32 idx)
=20
 static u32 imx_mu_xcr_rmw(struct imx_mu_priv *priv, enum imx_mu_xcr type, =
u32 set, u32 clr)
 {
-	unsigned long flags;
 	u32 val;
=20
-	spin_lock_irqsave(&priv->xcr_lock, flags);
+	guard(raw_spinlock_irqsave)(&priv->xcr_lock);
+
 	val =3D imx_mu_read(priv, priv->dcfg->xCR[type]);
 	val &=3D ~clr;
 	val |=3D set;
 	imx_mu_write(priv, val, priv->dcfg->xCR[type]);
-	spin_unlock_irqrestore(&priv->xcr_lock, flags);
=20
 	return val;
 }
@@ -223,31 +222,27 @@ static u32 imx_mu_xcr_rmw(struct imx_mu_priv *priv, e=
num imx_mu_xcr type, u32 se
 static void imx_mu_xcr_clr_shut(struct imx_mu_priv *priv, struct imx_mu_co=
n_priv *cp,
 				enum imx_mu_xcr type, u32 clr)
 {
-	unsigned long flags;
 	u32 val;
=20
-	spin_lock_irqsave(&priv->xcr_lock, flags);
+	guard(raw_spinlock_irqsave)(&priv->xcr_lock);
 	cp->shutdown =3D true;
=20
 	val =3D imx_mu_read(priv, priv->dcfg->xCR[type]);
 	val &=3D ~clr;
 	imx_mu_write(priv, val, priv->dcfg->xCR[type]);
-	spin_unlock_irqrestore(&priv->xcr_lock, flags);
 }
=20
 static void imx_mu_xcr_set_act(struct imx_mu_priv *priv, struct imx_mu_con=
_priv *cp,
 			       enum imx_mu_xcr type, u32 set)
 {
-	unsigned long flags;
 	u32 val;
=20
-	spin_lock_irqsave(&priv->xcr_lock, flags);
+	guard(raw_spinlock_irqsave)(&priv->xcr_lock);
 	if (!cp->shutdown) {
 		val =3D imx_mu_read(priv, priv->dcfg->xCR[type]);
 		val |=3D set;
 		imx_mu_write(priv, val, priv->dcfg->xCR[type]);
 	}
-	spin_unlock_irqrestore(&priv->xcr_lock, flags);
 }
=20
 static int imx_mu_generic_tx(struct imx_mu_priv *priv,
@@ -640,7 +635,7 @@ static int imx_mu_startup(struct mbox_chan *chan)
 {
 	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
 	struct imx_mu_con_priv *cp =3D chan->con_priv;
-	unsigned long irq_flag =3D 0;
+	unsigned long irq_flag =3D IRQF_NO_THREAD;
 	int ret;
=20
 	pm_runtime_get_sync(priv->dev);
@@ -988,7 +983,7 @@ static int imx_mu_probe(struct platform_device *pdev)
 		goto disable_clk;
 	}
=20
-	spin_lock_init(&priv->xcr_lock);
+	raw_spin_lock_init(&priv->xcr_lock);
=20
 	priv->mbox.dev =3D dev;
 	priv->mbox.ops =3D &imx_mu_ops;

--=20
2.53.0

