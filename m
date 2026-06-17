Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D943B9D99
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Jun 2026 06:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679351; cv=none; b=cVkLBO65HMTIVsBvVSD1ngmN4p98u6e7GImyDaLn88uecvgcL74xVKcM82a/umZO68BNTUaH6vxL8jdHOvYvIOvELNAj8zZzmZ4v0ZPIwEzcbpeMJEN/vf+F/vLtauYupIrsfA7deoAnkHyvMvvVZ56i8RJsCsLSmykrNDzW/5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679351; c=relaxed/simple;
	bh=rHDaQ1AuM1bNEF5UyaspBm9NBiSf0F6Sg5QtdTWAyQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mtq5Uv3bwg83oAOMzkqriqz81TO8UTS1zJ7GWaFbP9Uu04DpUxrfqaZA/+WpsPE0JKjs1UcbOXcPqwRXf48XpjfuUQcPWDTRaspuCBJnBopIwxmMkYcpJUMt/zyCHSBmBOE1NBjqLVNX7cWaVqgZfJXO0REEcSbsiwcW66OFg/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Xy9hup8B; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EngP4Ft2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Xy9hup8B";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EngP4Ft2"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781679348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WOdZnWl67SM9sux0lMq7ioPDFcc2D+BV2GgtG/OTyWg=;
	b=Xy9hup8BZ5jx5sdXOe0WwgezoZPSGABJYpWO+bG1g5hDAQ2o9n2fsKp1FF+ln0Nus+xmxy
	D/8VbKt2cMrdMm2ZlzEMoAv6pz4vvTQ4x5lrWQdVuoW/S7NHk4J1wcakrSHXoXVnr62UPV
	3Y8Ex7NF4M+jugwy4EDBwSsLiSkUj3oF2soqoOoI12eYoXeVyWEFFWCGPQL5InbDeW/gLg
	+ZpjVGKHzuV7Evm13GIZrYcrpPMoN4NteSRkDvcV8RmhsPjhZqJ312FjED6iiLYsmRb0YV
	3ZTVGutGMmn6foaPByv2GanDaajU7r/SAfWjdTyHewByI85eepIsv0FhDzZOMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781679348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WOdZnWl67SM9sux0lMq7ioPDFcc2D+BV2GgtG/OTyWg=;
	b=EngP4Ft2OPC1JysgepU8iGc5mF/S331Ny5Awv7OrYRhPmxAQhRylLYc2ro+lWI4TGtVv5R
	51t1uoaRP2dUZaBA==
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
Subject: [PATCH v3 10/10] remoteproc: imx_rproc: Invoke the callback directly
Date: Wed, 17 Jun 2026 08:55:35 +0200
Message-ID: <20260617-imx_mbox_rproc-v3-10-77948112defc@linutronix.de>
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
 drivers/remoteproc/imx_rproc.c | 33 +--------------------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 0dd80e688b0ea..c97bc1c401655 100644
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
@@ -835,21 +832,11 @@ static int imx_rproc_notified_idr_cb(int id, void *pt=
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
@@ -1214,13 +1201,6 @@ static int imx_rproc_sys_off_handler(struct sys_off_=
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
@@ -1249,17 +1229,6 @@ static int imx_rproc_probe(struct platform_device *p=
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

--=20
2.53.0

