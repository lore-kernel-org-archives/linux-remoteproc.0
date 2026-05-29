Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CBD3F1673
	for <linux-remoteproc@vger.kernel.org>; Fri, 29 May 2026 16:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780070485; cv=none; b=QCfF0PE2R3+iHSa6wvTUlWwVzKyH2Xa1t95OTzVSK8LZ2bWyj60QNxhaXxyJWs5hI3smmDLORrKw6pT+XGVXAnM1gS3az/HSSSg1BstP2HHBo2Dbs/lTZpaRyYttowioPQ6X7HscLmKEZrMNRdMZltBKdfPI1U9C+jSNf01nrvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780070485; c=relaxed/simple;
	bh=HN1SFeaRhMS8jENy7tU49XFln2/GhRs/C/9kuqxWh2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bVJS/F6Kz86xQe5+V2V2uJZYynCwXJvla8nPrqkxFgSV8VUBt2LDkiW+GCBtIeLTbl7jfzL3PjvQ+j9sjDcrpnDrw7CnvLYNrWiH2FCgSNadOAYSGjyeKO0kvac9Z7jfUCqsAtyUscZzZkI2Zf0JokTJzC76ei8wuGKqlRjup7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LfZhU8YX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ho0nU9om; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LfZhU8YX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ho0nU9om"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780070482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g3pwpRlS/z22YoHkLrfQQIUXLQg6hhbTC7fKDUVYHXY=;
	b=LfZhU8YXwzipNcrkic5SEMfrGEbSE2o0IJfbKlctYroXzzlwgwpwmvwE89LIpX+0b6ySKy
	Pw0vGaOP8Bg1XZYt5Gyk5vIbgi71IMnDsxfkKvjY/8u7YteI6F+LOnXIa5iIA6WIucxZs+
	BNCUjXWG6rFNCxFCIrSytFfl2snnWOb89PjfpEjda4xhHdKPZu8Wsz/hoZ+KXvyxPYqUao
	vx4RbRqQTl2UmC2BS/354au3Go5vumFvIQJxXdRGnGN7iuEUMWqIIqYSp13IjUGl2Qmmca
	+9xBFNbRTKOCmnp/TtQso+AldrpzrIc+CdClc7PwWWRp6V/fJ9sKCOsV7q082g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780070482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g3pwpRlS/z22YoHkLrfQQIUXLQg6hhbTC7fKDUVYHXY=;
	b=Ho0nU9om8K+S3FNetbcHadnUM7bMDescUmeHyJBfv0YaFnkMt0lXDm/jOZjI92VwhZV0+n
	bsZ1qqRcR2DaxSDQ==
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
Subject: [PATCH 4/5] mailbox: imx: Don't force-thread the primary handler
Date: Fri, 29 May 2026 18:01:06 +0200
Message-ID: <20260529-imx_mbox_rproc-v1-4-b8ffc36e11e5@linutronix.de>
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
 drivers/mailbox/imx-mailbox.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 9bf6484af45ed..0a710316d791b 100644
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
@@ -617,7 +616,7 @@ static int imx_mu_startup(struct mbox_chan *chan)
 {
 	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
 	struct imx_mu_con_priv *cp =3D chan->con_priv;
-	unsigned long irq_flag =3D 0;
+	unsigned long irq_flag =3D IRQF_NO_THREAD;
 	int ret;
=20
 	pm_runtime_get_sync(priv->dev);
@@ -964,7 +963,7 @@ static int imx_mu_probe(struct platform_device *pdev)
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

