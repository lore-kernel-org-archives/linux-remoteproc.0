Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE693B9933
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 06:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679351; cv=none; b=bnc7ncL6x+ss+loB80Y1Gmhlr7CO/1HEe+mM3uYK88TnBLm3m0BYlAB/loOjDCIRVblCiICbapy0XFMF9AWTD2z0bhVM1AFWfKWKcSwxUj8Tfyb89CdIEZH+S6tzb28QBhxrSiy6C+/jgR2cS8GNtFdOqhzkEgd2qd2EExX06AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679351; c=relaxed/simple;
	bh=tgrij6ljjbgiY70DANrYwTEKB5JVEXV1vL6KoIfCNnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rjZ3q0jAzHc/QMazbf9XQnfnfHnGfp6CWKe4aUZcBUAiF5dvBwPATMh1nP8BBMxK1dV/jXmzzf7OI+73dgTYSzbxRsYJJzjgLZwyORNmUoGNDSH2+56tJS17XjBPSUAmGCdI9pN1LIoQ6syA58hePgGbhsc1iTorBEXKy+qumvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HFjtLtoX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6klIHgBD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HFjtLtoX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6klIHgBD"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781679347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UH7OkPFNLUXxg+rvsW/p0INRvMHLxAI9MeDfvHIaxZ8=;
	b=HFjtLtoXmTv8KhN5phfZLC2w2QQaC2D2G6/Kn7M1a/L0sSR1Pf4Yf1wQX++H3SXqFwEpjQ
	94pyRnxL9atqgOSPyqrseH4CC++9QCbaCl28MBPVz/W1oaqmIg+5O7VBNASbNXcaTVvtcm
	mSwM/rSU+F5hxG5BNmfAH+FQyDSzsoe1da9VqEvq5veOb03Jhq3hg1cMBYCZnvtLn5uKUr
	K7eZhi5lwsO0UTIV8IR1Pm0TaXLmFDnY5AwmaByZHVYIdMbxc8cGW4JlZO8FQjunj+smFw
	M/xNO2BsWPw5I4vs2wIu+Z6PrLfHb2gkQjL/TfJyYwEkA1GVXMGS9w9BLtBqfw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781679347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UH7OkPFNLUXxg+rvsW/p0INRvMHLxAI9MeDfvHIaxZ8=;
	b=6klIHgBD9VnAVSHINtDxVWg6vKoloqY7B4bGP9RHdmUMtcY1J/eMPlMnu4nPPf+mH+m/AT
	nKQTj4rYmeddWHCA==
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
Subject: [PATCH v3 08/10] mailbox: imx: Move the RXDB part of the mailbox into the threaded handler
Date: Wed, 17 Jun 2026 08:55:33 +0200
Message-ID: <20260617-imx_mbox_rproc-v3-8-77948112defc@linutronix.de>
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

Move RXDB callback handling into the threaded handler. This similar to
the RX side and since the imx_mu_dcfg::rxdb callback can return an error, t=
he
interrupt is only enabled on success.

Move RXDB callback handling into the threaded handler.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 1219c35b116e4..1bd434bdff87a 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -554,6 +554,11 @@ static irqreturn_t imx_mu_isr_th(int irq, void *p)
 			imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->ty=
pe, cp->idx));
 		break;
=20
+	case IMX_MU_TYPE_RXDB:
+		if (!priv->dcfg->rxdb(priv, cp))
+			imx_mu_xcr_set_act(priv, cp, IMX_MU_GIER, IMX_MU_xCR_GIEn(priv->dcfg->t=
ype, cp->idx));
+		break;
+
 	default:
 		dev_warn_ratelimited(priv->dev, "Unhandled channel type %d\n",
 				     cp->type);
@@ -610,7 +615,8 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
 		ret =3D IRQ_WAKE_THREAD;
 	} else if ((val =3D=3D IMX_MU_xSR_GIPn(priv->dcfg->type, cp->idx)) &&
 		   (cp->type =3D=3D IMX_MU_TYPE_RXDB)) {
-		priv->dcfg->rxdb(priv, cp);
+		imx_mu_xcr_rmw(priv, IMX_MU_GIER, 0, IMX_MU_xCR_GIEn(priv->dcfg->type, c=
p->idx));
+		ret =3D IRQ_WAKE_THREAD;
 	} else {
 		dev_warn_ratelimited(priv->dev, "Not handled interrupt\n");
 		return IRQ_NONE;

--=20
2.53.0

