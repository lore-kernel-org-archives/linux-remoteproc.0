Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7843B9DAC
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 06:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679350; cv=none; b=XAsNScKd3q0j+C8H0F2RAajKCnw9c2oNxKiG9zhgM5RTsGHwTlhcINaOf/LbK5YzVpqieBbO6ax8DRQX4mPzC6YoPHwMHx4Ckt3pjz9jVUoNQ9kn06wNsbbPXT4n5rN79y/4aHRjSIkNqctO2btIdkbTLEBrQj6myircLvJmY8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679350; c=relaxed/simple;
	bh=by5s1GhDGhA9Iduxz4L8vMdFlC2SM8mNOSrxy0LvEHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dc1kmRqnPLAbMiTY6c52VsOm7IJL0djq6KsI+vqK0hB3cUblo2X2U5b2WeBpKlDLXExlzhZREMjpjbNRwz98P6cS+hjx2ZJklJrKtkbNFtrvvaLfoYUQ/B4BL5Eojqpd6Y463WQoGKX2gze7+K2PAakXKbkpHQ9MauUGtPX3Mgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=a2XJfXoW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LlsaMY8o; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="a2XJfXoW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LlsaMY8o"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781679345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3DjHQpJo0DpxApXO7REZGRiNP5Ze/KHB1Lmpc4X8mS8=;
	b=a2XJfXoWgi2YkUquJH82ZjYh8FiqBl388XK6Cx0cBy/SX1E/4DIYqlXGukYANZqlc2y6rj
	1/rCuUC2uyNl8XPcyKHEzFS+MvWavVhf0p1o7CH7EaA+0B+D7GuafWp6wSsGG1cEfXmg66
	wm18Kd0se8HswFFAzp4XPrbou89GttRMXZeQZfLLOizMy44MVXlfmxVZERWPk9sgIJ5rcJ
	SBhexWoJk4uYyFxg186uMxMqameNpODx8hf/BzGiZytRWT1SMCmOi16MOD6aa6yjV1Du7R
	0M0gswMEv1MSEPs85jUDcMAHb2cOk5oQ3snfA3KrlSezBARcbdvqLTklIt4PSA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781679345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3DjHQpJo0DpxApXO7REZGRiNP5Ze/KHB1Lmpc4X8mS8=;
	b=LlsaMY8oNWaK1mMFy5QqvMRjCgOuN96pEXong7qjJohUCjHYad5OFNKqItD+qKgOpQ4Qh8
	EPTME9V9YgdB2aCQ==
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
Subject: [PATCH v3 05/10] mailbox: imx: Use channel index instead of zero in imx_mu_specific_rx()
Date: Wed, 17 Jun 2026 08:55:30 +0200
Message-ID: <20260617-imx_mbox_rproc-v3-5-77948112defc@linutronix.de>
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

imx_mu_specific_rx() masks channel 0 and unmasks it again at the end of
the function. Given that at startup the channel index got unmasked it
should do the right job.

This here either unmasks the actual channel or another one but should
have no impact given that it reverses its doing at the end.

Peng Fan commented here:
| For specific rx channel, whether it is i.MX8 SCU or i.MX ELE, actually th=
ere is
| only 1 channel as of now, but it seems better to use cp->idx in case more
| channels in future.

Use the channel index instead of zero.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index a8d4e970fb786..408cd083c64ee 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -381,7 +381,7 @@ static int imx_mu_specific_rx(struct imx_mu_priv *priv,=
 struct imx_mu_con_priv *
=20
 	data =3D (u32 *)priv->msg;
=20
-	imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(priv->dcfg->type, 0));
+	imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(priv->dcfg->type, cp-=
>idx));
 	*data++ =3D imx_mu_read(priv, priv->dcfg->xRR);
=20
 	if (priv->dcfg->type & IMX_MU_V2_S4) {
@@ -408,7 +408,7 @@ static int imx_mu_specific_rx(struct imx_mu_priv *priv,=
 struct imx_mu_con_priv *
 		*data++ =3D imx_mu_read(priv, priv->dcfg->xRR + (i % num_rr) * 4);
 	}
=20
-	imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type=
, 0));
+	imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type=
, cp->idx));
 	mbox_chan_received_data(cp->chan, (void *)priv->msg);
=20
 	return 0;

--=20
2.53.0

