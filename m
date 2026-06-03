Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5061480DD2;
	Wed,  3 Jun 2026 13:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491923; cv=none; b=jJFkArJu1ZrMHSDEOcN++IWB/1zztUDQNfyCHEqWFx0rbx4d+i9exQ1QttHVYX1YEPiGcNr/OLxsKrbWYhGiVMgWPP3/2wqweWFYwWQl0NR2Y/d6LPsaeC3eKxBlv1mpwr8iByv37QBWYjzEIWsUnPwybgCpKIpbXFsCGMyLVS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491923; c=relaxed/simple;
	bh=YKaJvq4W9QVoH0S2jVv6q5tyBikTchZuE2gKNHaFg6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cj6CPtp2vjzf43M78VPOS7Ana0Kaz8s4MLjMY7ireGCTTX25wQmp+IvuGc6YCJCWGxZ/JsPNx78iIHQuV71gwz7S0X8GYxHzzZx5R0otiZ85grx6GuUbSmZ7rWUHdXz9vNoRbtDRX2DQyjocosNgqBjxebvGXCznz0dXfntpZCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Xi/Otzu3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=u1VUUSx+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Xi/Otzu3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="u1VUUSx+"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780491920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eHu0ybf8Zw3NyxF6mPleRKwZui1BrbXzpLJ2arEvlYg=;
	b=Xi/Otzu3nBL9YUMNqwEBz+6aq67HhwSN+0y9o0e3LpE1s4kW2RLmrfOBP2yU0/ubiJCslA
	hHn8oK2c1UXqnf1MIToBPULK+GxrpqePqmltthBxkJqeYOIv/2feEZOug9H5So0kA+f24c
	RrY112CugTbswQtjv5KKQ/Zv0royimccGgjrq7ABm60O/ZAA3xaQkhEqRNiyLATE1gZNWq
	WNpASo1MC5C/8dJzvNsAr2peJtLnsje3MV1utZOscwZGMzpUvWQEnzyOdkSlQIqPFqlWPZ
	r05nHQv94oYoPUVk2JGIKBzQ+LyijYgZxiHyyK4k+hw7Kwzg7Xsk9Zgj5RMWJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780491920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eHu0ybf8Zw3NyxF6mPleRKwZui1BrbXzpLJ2arEvlYg=;
	b=u1VUUSx+QLpX4dqAbUVgaZVjJP9IJiLjmmKyAGbcqnB7MHXGpAhHy9RnM/002XpHjA1F1e
	7x3OKcKywHQA9RAA==
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
Subject: [PATCH v2 3/9] mailbox: imx: use devm_of_platform_populate()
Date: Wed,  3 Jun 2026 15:05:06 +0200
Message-ID: <20260603-imx_mbox_rproc-v2-3-a0059dc3b69a@linutronix.de>
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

The driver uses of_platform_populate() but does not remove the added
devices on removal. This can lead to "double devices" on module removal
followed by adding the module again.

Use devm_of_platform_populate() to remove the populated devices once the
parent device is removed.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 24cf704b4f9bd..1dda1437b87f6 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -983,7 +983,7 @@ static int imx_mu_probe(struct platform_device *pdev)
 	if (ret)
 		goto disable_clk;
=20
-	of_platform_populate(dev->of_node, NULL, NULL, dev);
+	devm_of_platform_populate(dev);
=20
 	return 0;
=20

--=20
2.53.0

