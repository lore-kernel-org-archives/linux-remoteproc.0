Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DCF3B7B6E
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 06:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679347; cv=none; b=Oh+5wAeUnabR0kLOlFv7nm1riVxtC4Kx4+iI42qavC6qdObwc+Ua9L/V3s5L+BFY3v9+tQuU7NM8Wh2HqnKmPfA7xeFcVb6kMBRAQLhb1tNaWQVbqIgFRitIwNDc3rjtom1lShgedMXzXZLYqJ5rAgzRVEQSkA0ri7zKkEcxecA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679347; c=relaxed/simple;
	bh=vr4rqm6WPgULwQMdCRrcFi30SILEDrRtxpuBsaJMj/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DojeiEKghyOpX+qhpcU/cnSIXx13ped+jppiinM8Vpn9H2F5r9dwP0qXQ7+PaTWlolCix8UFkZnDv0FmcqMmigm2GRKraRLhpcCijSL/nq9lFhtJy02eWJQyzZpYq42LSuV5sz/wnipyqOkydzioN7kcmkYbT2PuHqDgB5L5AOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=i06CKHNF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7G1rpFUA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="i06CKHNF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7G1rpFUA"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781679344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zi7bJtc6YWd0kE62wpRt5fZoTo2Bu+AejfibFRsUbNM=;
	b=i06CKHNF3P9ayFrqPakUUujfP/xEcSGugoL5+tlD+8UKTbX2qJUlYHNadJJ4gQc6sX6FXv
	Q+GbJsaeLTUyld7/VQcfe6qn3gKdoG5TD+AgEu1YKKkDZtN2a1RHMXDb7WaXIbo/xya4cE
	85KLBD/CX+jotJcd/XxluSYtzapCDiplDVv2Dn64j102A5AYZvK9DzovNUIHrBBc0UcjXY
	jgWkcDRLHpS5ctpDHQzQIWon3RFlIFunuJAGgYuBbHeBfyotLHD8iYPCLoS8qRdjcIIjKA
	Zi35e9tqkp78ZNdKxwnJM2+CxLRoJhWoVl15HRrn73u4bi3KevU9eCxpGg9Eyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781679344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zi7bJtc6YWd0kE62wpRt5fZoTo2Bu+AejfibFRsUbNM=;
	b=7G1rpFUAPhXKOS2LGUVkf8TEJ5GR4/5rZ9knOYLeathW7ZT4PB3Zei+2xhGH+RmNKWf7zP
	rFTesBrFJFLbywBg==
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
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v3 01/10] mailbox: imx: Forward the timeout/ error in imx_mu_generic_tx()
Date: Wed, 17 Jun 2026 08:55:26 +0200
Message-ID: <20260617-imx_mbox_rproc-v3-1-77948112defc@linutronix.de>
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

imx_mu_generic_tx() for the IMX_MU_TYPE_TXDB_V2 type polls on a register
which may timeout and is recognized as an error. This error is siltently
dropped and not dropped to the caller.

Forward the error to the caller.

Fixes: b5ef17917f3a7 ("mailbox: imx: fix TXDB_V2 channel race condition")
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 246a9a9e39520..0028073be4a71 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -227,6 +227,7 @@ static int imx_mu_generic_tx(struct imx_mu_priv *priv,
 	u32 val;
 	int ret, count;
=20
+	ret =3D 0;
 	switch (cp->type) {
 	case IMX_MU_TYPE_TX:
 		imx_mu_write(priv, *arg, priv->dcfg->xTR + cp->idx * 4);
@@ -259,7 +260,7 @@ static int imx_mu_generic_tx(struct imx_mu_priv *priv,
 		return -EINVAL;
 	}
=20
-	return 0;
+	return ret;
 }
=20
 static int imx_mu_generic_rx(struct imx_mu_priv *priv,

--=20
2.53.0

