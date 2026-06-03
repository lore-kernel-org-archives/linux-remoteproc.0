Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085A848124B;
	Wed,  3 Jun 2026 13:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491926; cv=none; b=RGv5MhZalfEjTjt5Y4NZjPP4i+cGKYCZ03vzqbNMcQD87MJpPowZzlkkxxAvcy6ie7TG0680eihbDASSXSMeMCcz+YBME9d+f/l2R+At4qFPIVj3ix/SMSdlG9qKWE9fNfzrbRJHGVw5BBYZArs7qY/+qQ+ruJtcJef5L7gaecc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491926; c=relaxed/simple;
	bh=I3XlPjVeGaUl7tcqyQ8JubRrz/ZfqITkqWXd9ykonvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X9JS3i8mpwSG7GzQZ2v2SwbnpElAjYzLUwS/j3Fokuj8R8IucazsWlBioJ4fP0+jr1GlFEE8o8gkDL3IXO3s00t7U9oAmekitTrbMZFkMJyE8r1bNi7Hi1FhlQqFEPkGunFjVZIFgGuRjGRFPtC/0yoNVlkbQtcRkCAbzjV1sRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wI2jUlzb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PtDBb86+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wI2jUlzb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PtDBb86+"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780491921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wVrQgH307p2rx62VD32KF6aFAEvmCWdX4MSBe18SAfM=;
	b=wI2jUlzb8ILVRCLjA2FboDh8h3YpRarNz0Kd9mme46WiQFy39clzl6/RhVJLY2FiTXUalx
	ZDyhXisKCQZnIA0mumgW5DQu/fvCM82tna5U7p47JkUfdeJbNp46asqGQcbzbGkdHzm6ZB
	BisMSSOQHC6rx3K9ghktMRmuyxhdrQB2DohacbR2T0GTotFyO/sAq/QYntfQrHHG5CPLhl
	JAMkIE7g39M5iO3o4Y3bAses158jubYVVsEhdWVkwHewZolu38DKaF8hTJSrLv1o8slABf
	9VeBB/4p/7zMzB8hDCwM3rRgmrY8rmqZjWKUO6M7zeNpmP6Exh9y6ILlZCvVpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780491921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wVrQgH307p2rx62VD32KF6aFAEvmCWdX4MSBe18SAfM=;
	b=PtDBb86+MufClB2Givo/ph5u3yuVMJSdhbUdE+JC6gje8EJ1jwcGPgzBd29HZoa2H3R6VX
	X4HGzmoN9uILQ6Ag==
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
Subject: [PATCH v2 7/9] mailbox: imx: Move the RXDB part of the mailbox into the threaded handler
Date: Wed,  3 Jun 2026 15:05:10 +0200
Message-ID: <20260603-imx_mbox_rproc-v2-7-a0059dc3b69a@linutronix.de>
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

Move RXDB callback handling into the threaded handler. This similar to
the RX side except that we unmask it unconditionally in threaded
handler.

Move RXDB callback handling into the threaded handler.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 6fe202593592f..f0a14449652f1 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -559,6 +559,12 @@ static irqreturn_t imx_mu_isr_th(int irq, void *p)
 			imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->ty=
pe, cp->idx));
 		break;
=20
+	case IMX_MU_TYPE_RXDB:
+		cp->pending =3D false;
+		priv->dcfg->rxdb(priv, cp);
+		imx_mu_xcr_set_act(priv, cp, IMX_MU_GIER, IMX_MU_xCR_GIEn(priv->dcfg->ty=
pe, cp->idx));
+		break;
+
 	default:
 		dev_warn_ratelimited(priv->dev, "Unhandled channel type %d\n",
 				     cp->type);
@@ -617,7 +623,9 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
 		ret =3D IRQ_WAKE_THREAD;
 	} else if ((val =3D=3D IMX_MU_xSR_GIPn(priv->dcfg->type, cp->idx)) &&
 		   (cp->type =3D=3D IMX_MU_TYPE_RXDB)) {
-		priv->dcfg->rxdb(priv, cp);
+		cp->pending =3D true;
+		imx_mu_xcr_rmw(priv, IMX_MU_GIER, 0, IMX_MU_xCR_GIEn(priv->dcfg->type, c=
p->idx));
+		ret =3D IRQ_WAKE_THREAD;
 	} else {
 		dev_warn_ratelimited(priv->dev, "Not handled interrupt\n");
 		return IRQ_NONE;

--=20
2.53.0

