Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E3D379C36
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 14:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784642952; cv=none; b=lFY+MRakiuuL7qZR+sJTaIrDTQvZMJc1bBwq9a5Z1eH7YnzdVf5dAdKtxigcEti3kRjWzBHxX+oxNEWfmXf60de5SUcDry+d7rC0BJLJMepFFMmxGZtx6guamc/w8c92t0ytTLZRbEC3gEtGARonGb5utrARhCqr1I5fX2+jfnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784642952; c=relaxed/simple;
	bh=/shHvhXavkDz0BHFzR38wQrh5nk7QwR08JUjirQ63FM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qJyNBWVTcU/j8x0D4EEN2NiFTeJKNBI1fS5WrSEde2+27UPBgJrgKZPE/rqr+XSIOEJFUHBLKo+K/oJYnHr8QxHpydvgRdnDEbGdyp92iPQ0hrE7hZYYvPDX6Za66P/6sozICoCaMprQlDgeOmrKnxFAgn6cDZSDX9uU3is4hu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UO4yZl2V; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MkVwi0UU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UO4yZl2V";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MkVwi0UU"
Date: Tue, 21 Jul 2026 16:09:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784642948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BYUWYXX8kHWsBTJ72hrxX3YRBViCGluR8JguUf8yDng=;
	b=UO4yZl2Vjoi9SqlBjRbHhx9QCqRVuzwsKHZAkO+SDTVgAnKzbfLP4wvbVcQ4e+8DMojzTW
	3VTNO5ou5l4kNUDIcoGVJ2v3Hee7HmEZswMOk6gpPs/lPtHlqCB4l2zaNSLS8mZwCXAmNk
	b4sd6LEZnUT8UX0N84x5lhke33FZ9S6wG2B29GpgPZB3gdPyqMu9uBE1GoScCVyEitLqvh
	wAY4PIJjAGiCEvKMWuhZd34SaHGxEUJm3eaxZJ8zkOeYLHtZVa0IDWvOfnaPpOhERCHA8+
	S7xvlFGmFOn3pGbssoOaQ6hcAIfZPFL3nXdGeM2MqhzgA2UwxseoYB37NNbG2Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784642948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BYUWYXX8kHWsBTJ72hrxX3YRBViCGluR8JguUf8yDng=;
	b=MkVwi0UUFG+WoYSc3I4962NMaTgrQGAUustqk5OEMWeCyWmGi/in+dlOYYyxjY6n+VWPG7
	V/ZuXeGzYTr7MEAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-rt-devel@lists.linux.dev
Cc: Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>, Peng Fan <peng.fan@nxp.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v5 REPOST] remoteproc: imx_rproc: Invoke the callback directly
Message-ID: <20260721-imx_mbox_rproc-v5-1-6386a2cf8524@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOTW7DIBAF4KtYrEvEYAN2Vr1HFUX8DA1SbRJwL
 EeR717qLFI17vKNZr55d5IxBcxkX91JwinkEIcSxFtF7EkPn0iDK5lwxiUTvKOhn4+9ifMxnVO
 0VDkB3AstvWpJOTon9GFewY/DIye8XIs7PobE6IzUxr4P476a1A7Iz94p5DGm29pjgnXxv5cTU
 EZN672tJQKgeP8Kw3VMcQjzzuHKTfxJSFa/ELwQmjHROVsb2ektov5FgHoh6kIo1TUtAHfo7Rb
 RPAm10aKhQKUywIRkupXwl1iW5Ru0Dv6moQEAAA==
X-Change-ID: 20260529-imx_mbox_rproc-7d512f5a6f78

The imx-mailbox driver moved the callback invocation into the threaded
IRQ handler. This means the callback is invoked in preemptible context
and there is no need to schedule the kworker for the
imx_rproc_notified_idr_cb() invocation.

This was tested with the rpmsg-tty driver on imx93.

Remove the workqueue handling and invoke the imx_rproc_notified_idr_cb()
callback directly.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
This change was tested on a im93 board with rpmsg-tty driver.

v4=E2=80=A6v5: https://lore.kernel.org/all/20260703-imx_mbox_rproc-v4-1-67b=
10560a861@linutronix.de/
  - Repost

v3=E2=80=A6v4: https://lore.kernel.org/r/20260617-imx_mbox_rproc-v3-0-77948=
112defc@linutronix.de
  - The mailbox bits are part of v7.2-rc1. This is just a repost of the
    imx_rproc driver which is left.
  =20
v2=E2=80=A6v3: https://lore.kernel.org/r/20260603-imx_mbox_rproc-v2-0-a0059=
dc3b69a@linutronix.de
  - Forward the error in imx_mu_generic_tx() to the caller (new patch
    #1)
  - Extend the patch description a bit for for "Start splitting the IRQ
    handler" to briefly explain why callbacks are moved to the threaded
    handler.
  - Drop imx_mu_con_priv::pending. The primary handler wakes its
    threaded handler. Once the handler is woken, the pending flag must
    be set and there is no need to set/ clear it.
  - Avoid the double clk_disable_unprepare() if
    devm_mbox_controller_register() fails.

v1=E2=80=A6v2: https://lore.kernel.org/r/20260529-imx_mbox_rproc-v1-0-b8ffc=
36e11e5@linutronix.de
  - Using correct register to enable RXDB event.
  - Update commit description for the "threaded interrupt", "unmasks the
    interrupt" =3D> "masks the interrupt event".
  - Add a shutdown field so that the interrupt does not unmask the
    interrupt if it has been already disabled because the channel is
    about to be shutdown.  A possible race mentioned by sashiko.
  - Use devm_pm_runtime_enable(). This should avoid a possible race
    sashiko mentioned.
  - Use devm_of_platform_populate().
---
 drivers/remoteproc/imx_rproc.c | 33 +--------------------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 7662ebd9d2f49..e18ae33a5cf85 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -24,7 +24,6 @@
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
 #include <linux/scmi_imx_protocol.h>
-#include <linux/workqueue.h>
=20
 #include "imx_rproc.h"
 #include "remoteproc_internal.h"
@@ -115,8 +114,6 @@ struct imx_rproc {
 	struct mbox_client		cl;
 	struct mbox_chan		*tx_ch;
 	struct mbox_chan		*rx_ch;
-	struct work_struct		rproc_work;
-	struct workqueue_struct		*workqueue;
 	void __iomem			*rsc_table;
 	struct imx_sc_ipc		*ipc_handle;
 	struct notifier_block		rproc_nb;
@@ -892,21 +889,11 @@ static int imx_rproc_notified_idr_cb(int id, void *pt=
r, void *data)
 	return 0;
 }
=20
-static void imx_rproc_vq_work(struct work_struct *work)
-{
-	struct imx_rproc *priv =3D container_of(work, struct imx_rproc,
-					      rproc_work);
-	struct rproc *rproc =3D priv->rproc;
-
-	idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc);
-}
-
 static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
 {
 	struct rproc *rproc =3D dev_get_drvdata(cl->dev);
-	struct imx_rproc *priv =3D rproc->priv;
=20
-	queue_work(priv->workqueue, &priv->rproc_work);
+	idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc);
 }
=20
 static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
@@ -1271,13 +1258,6 @@ static int imx_rproc_sys_off_handler(struct sys_off_=
data *data)
 	return NOTIFY_DONE;
 }
=20
-static void imx_rproc_destroy_workqueue(void *data)
-{
-	struct workqueue_struct *workqueue =3D data;
-
-	destroy_workqueue(workqueue);
-}
-
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev =3D &pdev->dev;
@@ -1305,17 +1285,6 @@ static int imx_rproc_probe(struct platform_device *p=
dev)
 		priv->ops =3D dcfg->ops;
=20
 	dev_set_drvdata(dev, rproc);
-	priv->workqueue =3D create_workqueue(dev_name(dev));
-	if (!priv->workqueue) {
-		dev_err(dev, "cannot create workqueue\n");
-		return -ENOMEM;
-	}
-
-	ret =3D devm_add_action_or_reset(dev, imx_rproc_destroy_workqueue, priv->=
workqueue);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to add devm destroy workqueue act=
ion\n");
-
-	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
=20
 	ret =3D imx_rproc_xtr_mbox_init(rproc, true);
 	if (ret)

---
base-commit: b3f94b2b3f3e51ab880a51fc6510e1dafba654ed
change-id: 20260529-imx_mbox_rproc-7d512f5a6f78

Best regards,
--=20
Sebastian Andrzej Siewior <bigeasy@linutronix.de>
