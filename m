Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85A7394789
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 06:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679349; cv=none; b=HuX8TkXHrK+5hRchKuvrYkPKJkqrypYpvDe9JavwPutd120wiVviJszWOEpx8oXpXZ5zHajN0jkpEvdDFtJckjnLIZ/LBP1xiUBMyeU4Tg0pTfHlP4ObGRgNLIwcIFuI0G486PBkKMlH72qeiFp9oGaMLApeXUYfYA9qc7SSD/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679349; c=relaxed/simple;
	bh=5avinTQwCidwlAn2n8XH1wJmXuCooTYqOQX0hQNCp/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IhjsATonAAO5RfeOFbu38YM6nMTbB1C/huUoRzFVJJhmGgTeZOQ7OpbFnnDzEwVoF6M7DnRkKMxn6ZJ/bJDuvnhtAJMfyk3Yl1l5J6YMcCeWTYo55J43DKV6XSJ7d5QCwyJIr6XtzoEdc2CgpnuJGsSdwtBSGadOwo0Xb0+bmhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GEjyCA0b; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sHNGw7HJ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GEjyCA0b";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sHNGw7HJ"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781679345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=djD3Y0Nz6xCSNgvzQv0FMlV0XPA5TGOJDzSsNQVNlsg=;
	b=GEjyCA0b5QKtKRrQytaHTDii4CMXm4UDTZlWVaC5FcDYD5Un25Hpl+2TqMzk+yJvZvQ2dp
	EhIM9UKQajrpVRcFxz3lAANPjtDx+KEQrwOevKnglXrRswfTm3CxW0KFwIKTIUyMBhwMch
	/gnL6r3ssi/jdv2Vg7hM0ldwPJKN2YIa0y3bfOH40jHgHEs3fF4mIm0SAzXLxDp38/EPnt
	ilbbMnpMPNi5ZApB1QFtJzjx5LjfXGf0MIavgcfyaWeketX1sW96fCrPATM5fXnwXCcmED
	LEhUFvAwBOgPtqsbG1G3M60UhyZnXVt1wH9UQGpD8w+Oxw5OrosAhkf/eZgZGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781679345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=djD3Y0Nz6xCSNgvzQv0FMlV0XPA5TGOJDzSsNQVNlsg=;
	b=sHNGw7HJTUingmE29PYXAFSG+EyyaSt/4eTAWsUKpn2s51ydJkoR4f5eYYFq7WYGRmCI+i
	/1t8KsV5dCAUBRDA==
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
Subject: [PATCH v3 04/10] mailbox: imx: use devm_of_platform_populate()
Date: Wed, 17 Jun 2026 08:55:29 +0200
Message-ID: <20260617-imx_mbox_rproc-v3-4-77948112defc@linutronix.de>
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

The driver uses of_platform_populate() but does not remove the added
devices on removal. This can lead to "double devices" on module removal
followed by adding the module again.

Use devm_of_platform_populate() to remove the populated devices once the
parent device is removed.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 516a05b64daa1..a8d4e970fb786 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -984,7 +984,7 @@ static int imx_mu_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_out;
=20
-	of_platform_populate(dev->of_node, NULL, NULL, dev);
+	devm_of_platform_populate(dev);
=20
 	return 0;
=20

--=20
2.53.0

