Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CE13603D8
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Aug 2026 08:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609327; cv=none; b=QYL7wjzEZ8b6HA5VVViNb/6avmFgakffKx5m5gR2yitA71N7CyQRMSkhuHVKpI0w20ROvH3PRT/IgYuOlRnhU6qawj3E1TB747TDzfpUBj9kDHqykdejnlYfjQ97IDt11ej7zz3iB1OVBahIzdw8hMaBXbdjxw74yluOIkyQjVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609327; c=relaxed/simple;
	bh=WgRRDaoWPZwOJuVMjX7/03GgTdkqCeXOBG68VI6CWMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mdmucoFn4itFxPkdT/Jij64Hw7rihGqsUevR0PZBGr9w7usaEv3unm/ImaDnugFhLCyt8KcqKuR+GBkANr/TSeOvWln7BUj1dwh1ivmDrFPi5SSz/y0FJLtjBrK814eycmpdwH98JCUpRXvkGJ7tzlubzPQmfZIjYg67RonOAKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eD96uLUc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=y3ptXPA5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eD96uLUc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="y3ptXPA5"
Date: Thu, 13 Aug 2026 10:22:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786609324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bnFio1oNNrm91Jw4PTtNlaJV8syzqd0jiUAgXBq7K3U=;
	b=eD96uLUciE8j2GP/q4QeItW5OshyUxrCgZupSZvzlDVdpsPxWU85h6hJgZKrB1Ky/U8urP
	VlxOJngoFCNBCVGoLwlHK8tLAeSMAqAw9Jo7gIb2VAJ6f9WNg3jmOPq6/9ffbdpAvPIPxz
	EXyMBaA9yjmv52alX57wgmIryq0frLHKY6Ms3bNUoDp+ti15ZxCxwjd+t8iroYVyGxFOwE
	0kxWY0XeK9YnGI2jBJOa4yejen99R1qfO6KMLPBgfJ7pAdA1S3oauMWBgzHvTnI4Hk9UhK
	seqSwHDybl1N0TJaBZdQW7OKPuhHUi/yzMvRmDPRxDR9JeQYVWTXnjg6IbcanA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786609324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bnFio1oNNrm91Jw4PTtNlaJV8syzqd0jiUAgXBq7K3U=;
	b=y3ptXPA5Lo3wMSLHcgJ/kGZiDctoIQm8sXXnCRX+BOuwbubQh9IBV4PZZ11vLNFWeqaWTI
	M7h8yC7HygwGtqDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>, Peng Fan <peng.fan@nxp.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH REPOST REPOST v6] remoteproc: imx_rproc: Invoke the callback
 directly
Message-ID: <20260813-imx_mbox_rproc-v6-1-6903a93b0456@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOTW6DMBAF4Ksgr+vIY+Mfsuo9qigyZtxYKjgxB
 BFF3L0OWSQqdPlGM9+8O+kxBezJvriThGPoQ+xyUB8FcSfbfSMNTc6EM66Y5BUN7XRs6zgd0zl
 FR3UjgXtpldeG5KNzQh+mBfw6PHPCyzW7w3NIatsjdbFtw7AvRr3jNDlNHrun0A8x3ZYuIyzL/
 70dgTJaG++dUAiA8vMndNchxS5MuwYXbuQvQjGxIngmLGOyapyoVWW3CPFGgF4RIhNaV6UB4A1
 6t0WUL0JvtCgpUKVrYFIxaxRsEfKN4LAi5IMQRlnuvJG8/EvM8/wLYGsYQegBAAA=
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
The imx's remoteproc driver uses a kworker from its mailbox callback to
complete the request. The reason is that the imx mailbox driver invokes
the callback from its interrupt handler and the remoteproc callback (at
least the rpmsg-tty) requires a preemptible context.

This works but is problematic in a PREEMPT_RT environment where the
latency of the invocation is important. By scheduling a kworker the
high task priority from the threaded handler is lost and the kworker
competes for CPU ressources with every SCHED_OTHER task in the system.
This can lead to long delays on a busy system with other RT threads
which are less important than the completion of this request.

Looking over other mailbox driver, like the arm_mhu for instance, they
use a threaded interrupt handler to invoke the callback. This avoids the
kworker detour.

The here suggested change utilises a threaded interrupt to invoke the
callback. The primary handler mask the interrupt source so that the
handler can run without getting interrupted by the interrupt again.
Doing so avoids marking the interrupt IRQF_ONESHOT so that in a
shared-interrupt environment the other interrupt can still fire while
the first is masked.

The first four patches are result of the sashiko review. Does not look
critical.

This change was tested on a im93 board with rpmsg-tty driver.

v5=E2=80=A6v6: https://patch.msgid.link/20260721-imx_mbox_rproc-v5-1-6386a2=
cf8524@linutronix.de
  - Repost. Adding Greg and akpm, hoping someone will apply it.

v4=E2=80=A6v5: https://lore.kernel.org/all/20260703-imx_mbox_rproc-v4-1-67b=
10560a861@linutronix.de/
  - Repost

v3=E2=80=A6v4: https://lore.kernel.org/r/20260617-imx_mbox_rproc-v3-0-77948=
112defc@linutronix.de
  - The mailbox bits are part of v7.2-rc1. This is just a repost of the
    imx_rproc driver which is left.

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
base-commit: 2ee859ebf156157609f71060ae472711c8cbc326
change-id: 20260529-imx_mbox_rproc-7d512f5a6f78

Best regards,
-- =20
Sebastian Andrzej Siewior <bigeasy@linutronix.de>
