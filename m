Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507D3480DCC;
	Wed,  3 Jun 2026 13:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491922; cv=none; b=EmUVFgivAdr3icBtZDELPL4yUggCBg21sPcb/qEQjiTpn1VDyIWwNwyz42EiCL6T/KMHh0hKJ01nf9pBdIp/6paseCcPOCnUKKd8TvN4TnYkZ9RY2ZufvX0llwJd+weSbVhsYRscVp3oGIEQFrYJgK5QWFA9uJ+OdcaXy5vT8I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491922; c=relaxed/simple;
	bh=um3Q3O07JbrhlBvCpvy4uDKTX0c9Y3LOxG0TU6kUriY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d57oAR8FCdaZrLwLs4Sciyrta53TbZOw/dtVm3D/uUypC+zyVNXCC8ViXMSW4Q6zQ6ZUbkZ7lTD/jSMjCO6Uz+7S6Ix6wryO8ws/7+EOBNq3teiSXDi0x2riL599FYB6VB5cHZN++MVQ4ctRZmxkoMtg3HIz2JD5pavk+T67Ths=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nmG0UQZ3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=s2TKqXuf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nmG0UQZ3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="s2TKqXuf"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780491919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9c+IJqqXc5Um/JnqM9Fs6W5B34mNQPyzW5r2N0OJlp0=;
	b=nmG0UQZ3uRRN421PZnIKKsQ/6CUuMSXFdXHRToidgzlX6MbhOua4omBZxgwYrJ+9EIDwNa
	VOLxH4eon4lO0Q5Tr0PUuxKGLJ11rP0slhUuGDDPVtpbT5X+4AqDZfLTAyKh6slnqyn5gK
	+niXF+JR4Px1NC1KXEjDQerjPG1mN3zsm8lJggu6d79WndRE1uWLfIHXXhN2HI0Hl/STHY
	FBlvoaXiZRN4sniNzsrpGjFKi/6OqVhQo3NQvWBrPlac1fzoSy0LB1m1t9sqmyHCCGzjFa
	dlNCQc1OfxXEk1El0mcdDTPxLhyPSN1dVycTRObLqJfHCdhrCHZt1ooA7m1Zcg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780491919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9c+IJqqXc5Um/JnqM9Fs6W5B34mNQPyzW5r2N0OJlp0=;
	b=s2TKqXuf2rV/21XHS+15u8efIO2Hw6iOXn8HyAluV9CkNUkjgbXX2FmbpkcMU+7h19BJpl
	IsOqMLnf6sGAASBQ==
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
Subject: [PATCH v2 2/9] mailbox: imx: Use devm_pm_runtime_enable()
Date: Wed,  3 Jun 2026 15:05:05 +0200
Message-ID: <20260603-imx_mbox_rproc-v2-2-a0059dc3b69a@linutronix.de>
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

sashiko complained about early usage of the device while probe isn't
completed. This can be mitigated by delaying the pm_runtime_enable()
into the removal path instead doing it early. This ensures that in an
error case the device is removed (and imx_mu_shutdown()) before
pm_runtime_disable() so we don't have to do this manually.

For the order to work, lets move devm_mbox_controller_register() until
after the pm-runtime part. So the reverse order will be mbox-controller
removal followed by disabling pm runtime.

Use devm_pm_runtime_enable(), remove manual pm_runtime_disable()
invocations and move the pm_runtime handling in probe before
devm_mbox_controller_register().

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 34edc2f31dcb5..24cf704b4f9bd 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -965,28 +965,28 @@ static int imx_mu_probe(struct platform_device *pdev)
=20
 	platform_set_drvdata(pdev, priv);
=20
+	ret =3D devm_pm_runtime_enable(dev);
+	if (ret < 0)
+		goto disable_clk;
+
+	ret =3D pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		goto disable_clk;
+
+	ret =3D pm_runtime_put_sync(dev);
+	if (ret < 0)
+		goto disable_clk;
+
+	clk_disable_unprepare(priv->clk);
+
 	ret =3D devm_mbox_controller_register(dev, &priv->mbox);
 	if (ret)
 		goto disable_clk;
=20
 	of_platform_populate(dev->of_node, NULL, NULL, dev);
=20
-	pm_runtime_enable(dev);
-
-	ret =3D pm_runtime_resume_and_get(dev);
-	if (ret < 0)
-		goto disable_runtime_pm;
-
-	ret =3D pm_runtime_put_sync(dev);
-	if (ret < 0)
-		goto disable_runtime_pm;
-
-	clk_disable_unprepare(priv->clk);
-
 	return 0;
=20
-disable_runtime_pm:
-	pm_runtime_disable(dev);
 disable_clk:
 	clk_disable_unprepare(priv->clk);
 	return ret;
@@ -994,9 +994,6 @@ static int imx_mu_probe(struct platform_device *pdev)
=20
 static void imx_mu_remove(struct platform_device *pdev)
 {
-	struct imx_mu_priv *priv =3D platform_get_drvdata(pdev);
-
-	pm_runtime_disable(priv->dev);
 }
=20
 static const struct imx_mu_dcfg imx_mu_cfg_imx6sx =3D {

--=20
2.53.0

