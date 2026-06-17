Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA8A3B8D7B
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 06:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679348; cv=none; b=JFY0Xsq9IHfDyL2VMwPkMTzcZQ8RSkieFqKCAGeexLzEENH+KtF/6MqTCRBM+6pq2pgAP3WQeTly1vOk5Fi/38iyHvu/LMJQJmeh0OhDRZzQy68PbprMYOP+sBb6lzP1meInVLhvMeqpEi3RMmvH52uqwD8sYZxvR/Afi16uLic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679348; c=relaxed/simple;
	bh=UQyPIeijde/GdD0Stq48wIZOtoGiOd8vylY/waEmQr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CoDRh0S4jTTTMF4NHH6R0rlvg83VesNn9HiAQc7aMABwoIwM1ZiXqpVxe0ihmNf2lFQpsMT9O6+IsLtAjNRc8gcGHDgFmCccW4N89Abgu5sUzIQHi8P8tPqNAwQNJJdQ7L/RDRUg+In1/RxzFY5CPmk7uatuMmwz0jjCBEqEY3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yIsxAqn1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mMknssX2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yIsxAqn1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mMknssX2"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781679344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CPOpKVPNdPb4TOM3bAV+KOhZxWjDtfTT/2PKcxNL+lc=;
	b=yIsxAqn1Qg1C2ffORupU3YGBYG9a6TtH56vcueHWecnXvqr4C6RhNyCT/856JnuMAYURwJ
	emzriGnEvGE5ldCVZADsR04WvQ/Yl4RquNsL7Ss4wYEAJWsh9COfVWrYFxOXismhSo+aXA
	Mm0o9Q8oUZsLbcK6ZSIAxL1yvs8uSG4KxEwHxb/ZBBrbS0T+BJLX01ZOtbrNS3ZM308Shn
	PXmYdzzPP2eyhixaGFZ5IAi38VQwDV/R1p7pAFdTOtrP1UgvgjGHv8UrGljO2ij882fA7p
	QqmN5VbkRxWMwsYrxbUoQEK6v0PViiNfmQbgk7CC5q0lfyI4TSjZst6cnzJRuA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781679344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CPOpKVPNdPb4TOM3bAV+KOhZxWjDtfTT/2PKcxNL+lc=;
	b=mMknssX2ZyXne0SXjNOz7eCEHnUC24neDm8fTVGFkXEMrEMhgLqUUtICNeMRMnwXfINjaj
	sp2ET7KY2f9/bFCA==
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
Subject: [PATCH v3 03/10] mailbox: imx: Use devm_pm_runtime_enable()
Date: Wed, 17 Jun 2026 08:55:28 +0200
Message-ID: <20260617-imx_mbox_rproc-v3-3-77948112defc@linutronix.de>
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

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index e261b382d5c90..516a05b64daa1 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -966,38 +966,36 @@ static int imx_mu_probe(struct platform_device *pdev)
=20
 	platform_set_drvdata(pdev, priv);
=20
-	ret =3D devm_mbox_controller_register(dev, &priv->mbox);
-	if (ret)
+	ret =3D devm_pm_runtime_enable(dev);
+	if (ret < 0)
 		goto disable_clk;
=20
-	of_platform_populate(dev->of_node, NULL, NULL, dev);
-
-	pm_runtime_enable(dev);
-
 	ret =3D pm_runtime_resume_and_get(dev);
 	if (ret < 0)
-		goto disable_runtime_pm;
+		goto disable_clk;
=20
 	ret =3D pm_runtime_put_sync(dev);
 	if (ret < 0)
-		goto disable_runtime_pm;
+		goto disable_clk;
=20
 	clk_disable_unprepare(priv->clk);
=20
+	ret =3D devm_mbox_controller_register(dev, &priv->mbox);
+	if (ret)
+		goto err_out;
+
+	of_platform_populate(dev->of_node, NULL, NULL, dev);
+
 	return 0;
=20
-disable_runtime_pm:
-	pm_runtime_disable(dev);
 disable_clk:
 	clk_disable_unprepare(priv->clk);
+err_out:
 	return ret;
 }
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

