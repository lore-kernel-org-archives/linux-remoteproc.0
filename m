Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2A0481248;
	Wed,  3 Jun 2026 13:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491926; cv=none; b=LHHyf6eKNIWXGRst5Q4PwyvWp5HmGo90hqT0sg9Mei2IH3yd6zwF0FO9SJYkSc5ZhRLHZc9hAdUlWtzny6MCu7V7j98yxe+NuJbCDqSvTZAN36Eza8meN8NY1QOxeT8wiQ+kIuDhGc1FJhg58hrbEuF8Rv+wj0izHxTMpyt0e3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491926; c=relaxed/simple;
	bh=wb8mby7OqMqwNUsM4e621APpRoR4X04lMeOtvgCpZa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X7DVSUXqgJufPvwvNtjUhxG/QRTuPBLhXpH/IpYdemZIlStKeg5cIphpSVJfP+yatYAgoC8CDMxxE4TUvfv2q38tFYmp+0C3o0zrMm2nUO97i2MyFtepuWpWkdSO5NtDHd2Nrc1PQgMGTR6nXptbYNrR7nctgLlADbdtZlBQLck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zWM5R/8f; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hv5eVAbn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zWM5R/8f";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hv5eVAbn"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780491922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hUrx0WQ2t1MaZcUsq14gpCwZ9IGi87ebAm9MbfGcKCk=;
	b=zWM5R/8fIknuyuyYycP5CBUsNVSWf/DrkdJ2KBUl1FRwA6AxWz764VLUnOxdVMuMQ2XEv6
	jUH8KdSKaQ0IjX6LBPB7eEBbQjOrWRuBuiwaB/PoL00Tp6uLJunFMkcV1Ih74NJ90BEW2w
	sE2FcbKcBdwuS6+N3XIJqVeNOzGrdKagVkv1k9vhxwo89fZO2U97AmVSU3+s6s+z90KFVq
	sBMI5Iw2whWMnOfhuzATmLCMvwHT9/T3pfRSSEiUWAjcgBhSEuGiqUm6Ky3bNK7oHNQ6Mz
	98V/GG2fFOGKicVEB+NVmoexvG2Bny5J/X7ZXZOpJWsjGkBWKitSxYtE/1+fgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780491922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hUrx0WQ2t1MaZcUsq14gpCwZ9IGi87ebAm9MbfGcKCk=;
	b=hv5eVAbngf3l5mQkTK0BjMSUJ1qdqwZ8o/r7sk3qO/SewV8uZ2kMb43s1dxk/gEl2Pc5oj
	r0qcgZivq2+RXmAA==
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
Subject: [PATCH v2 8/9] mailbox: imx: Don't force-thread the primary handler
Date: Wed,  3 Jun 2026 15:05:11 +0200
Message-ID: <20260603-imx_mbox_rproc-v2-8-a0059dc3b69a@linutronix.de>
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

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index f0a14449652f1..f3de47908e00f 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -88,7 +88,7 @@ struct imx_mu_priv {
 	struct device		*dev;
 	void __iomem		*base;
 	void			*msg;
-	spinlock_t		xcr_lock; /* control register lock */
+	raw_spinlock_t		xcr_lock; /* control register lock */
=20
 	struct mbox_controller	mbox;
 	struct mbox_chan	mbox_chans[IMX_MU_CHANS];
@@ -208,15 +208,14 @@ static int imx_mu_rx_waiting_read(struct imx_mu_priv =
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
@@ -224,31 +223,27 @@ static u32 imx_mu_xcr_rmw(struct imx_mu_priv *priv, e=
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
@@ -649,7 +644,7 @@ static int imx_mu_startup(struct mbox_chan *chan)
 {
 	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
 	struct imx_mu_con_priv *cp =3D chan->con_priv;
-	unsigned long irq_flag =3D 0;
+	unsigned long irq_flag =3D IRQF_NO_THREAD;
 	int ret;
=20
 	pm_runtime_get_sync(priv->dev);
@@ -997,7 +992,7 @@ static int imx_mu_probe(struct platform_device *pdev)
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

