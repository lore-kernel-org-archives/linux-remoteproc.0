Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348CF480DE0;
	Wed,  3 Jun 2026 13:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491923; cv=none; b=n6Vkag0leYPXIZGn1RrcmEd5DRVoKMaglEiwWzJxa8V3XAV2gR0lDUacAomd1Md0hJxKIh9JQ8UcyyfcqZmHHmBo0oq2Db73mGDre60AjruwUrg7p45LgYmFOl3XiN86GZfdKT4N7KQ7Bk4gajxfyNb33rRn1g8GVNj+mpcBVJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491923; c=relaxed/simple;
	bh=OnGN29T3WNoMUOJKKHNXVWq4a1RN4jNrXeuqbtmMD/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dmVQk2lMoen9dKqIlxbFykkbqfQupR7DSH9q2xKEAtb1jwd6qjNI7IcH1to7kXY9w1dcW/n7qaRWM4cP3XTlFFjOW41O4bmEPTxJVoRn88vY5krNvwZOIzOkwEjmg0VQsTdzBKtE0FiyTlLqPd7xikTmmi8ijCjaKa+KjkD0RHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=z/7sL9Na; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6tWwcYEa; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="z/7sL9Na";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6tWwcYEa"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780491920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tQw5lyjGpMXFlBOE2LL7wmUpV6nFm6/pguDg6ZWbcPE=;
	b=z/7sL9Nazcyq4OSdck02yPF9unIjlwIWxrj0YVVqBR4tJQb5aZ3W9rMYMdcSU4BYRbNgs7
	5M2Mbr8Avs+893GwD8rU1gph9/UJbAUyTJvCoFWr5fOCV+0+NecUMZKY65+UNH08j2Ubsh
	fCRoklxDD76nsWYLgbEmdxczbSQ8nMor6b5l6bSbAE2IDzuAlE/GHZ1XiLiI7D5xJ87xZn
	mR0tmj9lCsq8fH8zkczsaGJQV6E02suz9PDJh75o9iAx863kgqEcjabcKnYf3oOJFD7cAG
	6cflJ3vhVd+s6HHfnCAGJAI96ku5Lc67cSzQrrgtRLL6cHxEdV6+B2NQLkOKkA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780491920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tQw5lyjGpMXFlBOE2LL7wmUpV6nFm6/pguDg6ZWbcPE=;
	b=6tWwcYEaEm+e9zkwgFr7t/R2M+yhJL1XbO2yBMOHA4AZ+Cnt7RWh3A0HciQKZf6MTXzqEz
	8QDweHENd8lRKUAw==
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
Subject: [PATCH v2 4/9] mailbox: imx: Use channel index instead of zero in imx_mu_specific_rx()
Date: Wed,  3 Jun 2026 15:05:07 +0200
Message-ID: <20260603-imx_mbox_rproc-v2-4-a0059dc3b69a@linutronix.de>
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

imx_mu_specific_rx() masks channel 0 and unmasks it again at the end of
the function. Given that at startup the channel index got unmasked it
should do the right job.

This here either unmasks the actual channel or another one but should
have no impact given that it reverses its doing at the end.

Use the channel index instead of zero.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 1dda1437b87f6..d1de07cc0ed62 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -380,7 +380,7 @@ static int imx_mu_specific_rx(struct imx_mu_priv *priv,=
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
@@ -407,7 +407,7 @@ static int imx_mu_specific_rx(struct imx_mu_priv *priv,=
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

