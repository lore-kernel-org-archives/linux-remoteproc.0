Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FF9A1A5
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Nov 2023 13:17:10 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6H4N-0004Sq-G9; Thu, 23 Nov 2023 22:17:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6H4N-00B7ls-3G; Thu, 23 Nov 2023 22:17:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6H4M-006z6c-QD; Thu, 23 Nov 2023 22:17:06 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 2/3] remoteproc: k3-dsp: Use symbolic error codes in error messages
Date: Thu, 23 Nov 2023 22:17:00 +0100
Message-ID: <20231123211657.518181-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123211657.518181-5-u.kleine-koenig@pengutronix.de>
References: <20231123211657.518181-5-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9534; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=YfVOVCCBNVoI8YJ5EYB1VeNoh5AlWf9mXVdiGV2pXzo=; b=owGbwMvMwMXY3/A7olbonx/jabUkhtT4gz6sebsV3FtbzIWy6l8YGB9vXtdU7F5z5ehDdtGiC 8fD6993MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjCRe2UcDNv0/u7Qkvt129V3 jkRt/v6vNn821ToKTuVn/PB/WrjMj4MSAuWah5SEXTdXPJuxtaTrHuODY/FHr9ae/p54vy/Loif h1ClRzoanVeJOD+pmb6u5oPfS6YTOji0cPG/lXFO3tU3+YyjMbR7xiDc8W9Tv017ttvc8/y635J /wcWixs619IR267tDmWlfHcs1zwRU/Od/+u6uXkP2w5cCOijKh5Xce3Sxk3G3E137tEv+h5y1qp y5ue/45vTqWt4t5W6uvhoHk/fz7u8X5Ui6/OcHdKZGnuHC6qW6lYUlqJqfWi3y9KUtZ4n5NFve6 sLeS4enKOQGi/Df/9bbJekbnqU9eq5HQu0RvmdiUetcSAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-remoteproc@vger.kernel.org

The error message

	failed to send mailbox message (-EINVAL)

is (for a human) more useful than

	failed to send mailbox message, status = -22

Adapt all error messages to use the symbolic names instead of the
numeric constants. The error paths in .probe() make use of
dev_err_probe() which automatically handles EPROBE_DEFER.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 78 ++++++++++-------------
 1 file changed, 34 insertions(+), 44 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 40a5fd8763fa..f048ec1bb00f 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -158,8 +158,8 @@ static void k3_dsp_rproc_kick(struct rproc *rproc, int vqid)
 	/* send the index of the triggered virtqueue in the mailbox payload */
 	ret = mbox_send_message(kproc->mbox, (void *)msg);
 	if (ret < 0)
-		dev_err(dev, "failed to send mailbox message, status = %d\n",
-			ret);
+		dev_err(dev, "failed to send mailbox message (%pe)\n",
+			ERR_PTR(ret));
 }
 
 /* Put the DSP processor into reset */
@@ -170,7 +170,7 @@ static int k3_dsp_rproc_reset(struct k3_dsp_rproc *kproc)
 
 	ret = reset_control_assert(kproc->reset);
 	if (ret) {
-		dev_err(dev, "local-reset assert failed, ret = %d\n", ret);
+		dev_err(dev, "local-reset assert failed (%pe)\n", ERR_PTR(ret));
 		return ret;
 	}
 
@@ -180,7 +180,7 @@ static int k3_dsp_rproc_reset(struct k3_dsp_rproc *kproc)
 	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
 						    kproc->ti_sci_id);
 	if (ret) {
-		dev_err(dev, "module-reset assert failed, ret = %d\n", ret);
+		dev_err(dev, "module-reset assert failed (%pe)\n", ERR_PTR(ret));
 		if (reset_control_deassert(kproc->reset))
 			dev_warn(dev, "local-reset deassert back failed\n");
 	}
@@ -200,14 +200,14 @@ static int k3_dsp_rproc_release(struct k3_dsp_rproc *kproc)
 	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
 						    kproc->ti_sci_id);
 	if (ret) {
-		dev_err(dev, "module-reset deassert failed, ret = %d\n", ret);
+		dev_err(dev, "module-reset deassert failed (%pe)\n", ERR_PTR(ret));
 		return ret;
 	}
 
 lreset:
 	ret = reset_control_deassert(kproc->reset);
 	if (ret) {
-		dev_err(dev, "local-reset deassert failed, ret = %d\n", ret);
+		dev_err(dev, "local-reset deassert failed, (%pe)\n", ERR_PTR(ret));
 		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
 							  kproc->ti_sci_id))
 			dev_warn(dev, "module-reset assert back failed\n");
@@ -246,7 +246,7 @@ static int k3_dsp_rproc_request_mbox(struct rproc *rproc)
 	 */
 	ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
 	if (ret < 0) {
-		dev_err(dev, "mbox_send_message failed: %d\n", ret);
+		dev_err(dev, "mbox_send_message failed (%pe)\n", ERR_PTR(ret));
 		mbox_free_channel(kproc->mbox);
 		return ret;
 	}
@@ -272,8 +272,8 @@ static int k3_dsp_rproc_prepare(struct rproc *rproc)
 	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
 						    kproc->ti_sci_id);
 	if (ret)
-		dev_err(dev, "module-reset deassert failed, cannot enable internal RAM loading, ret = %d\n",
-			ret);
+		dev_err(dev, "module-reset deassert failed, cannot enable internal RAM loading (%pe)\n",
+			ERR_PTR(ret));
 
 	return ret;
 }
@@ -296,7 +296,7 @@ static int k3_dsp_rproc_unprepare(struct rproc *rproc)
 	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
 						    kproc->ti_sci_id);
 	if (ret)
-		dev_err(dev, "module-reset assert failed, ret = %d\n", ret);
+		dev_err(dev, "module-reset assert failed (%pe)\n", ERR_PTR(ret));
 
 	return ret;
 }
@@ -561,9 +561,9 @@ static int k3_dsp_reserved_mem_init(struct k3_dsp_rproc *kproc)
 
 	num_rmems = of_property_count_elems_of_size(np, "memory-region",
 						    sizeof(phandle));
-	if (num_rmems <= 0) {
-		dev_err(dev, "device does not reserved memory regions, ret = %d\n",
-			num_rmems);
+	if (num_rmems < 0) {
+		dev_err(dev, "device does not reserved memory regions (%pe)\n",
+			ERR_PTR(num_rmems));
 		return -EINVAL;
 	}
 	if (num_rmems < 2) {
@@ -575,8 +575,8 @@ static int k3_dsp_reserved_mem_init(struct k3_dsp_rproc *kproc)
 	/* use reserved memory region 0 for vring DMA allocations */
 	ret = of_reserved_mem_device_init_by_idx(dev, np, 0);
 	if (ret) {
-		dev_err(dev, "device cannot initialize DMA pool, ret = %d\n",
-			ret);
+		dev_err(dev, "device cannot initialize DMA pool (%pe)\n",
+			ERR_PTR(ret));
 		return ret;
 	}
 
@@ -687,11 +687,8 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
-	if (ret) {
-		dev_err(dev, "failed to parse firmware-name property, ret = %d\n",
-			ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse firmware-name property\n");
 
 	rproc = rproc_alloc(dev, dev_name(dev), &k3_dsp_rproc_ops, fw_name,
 			    sizeof(*kproc));
@@ -711,39 +708,35 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 
 	kproc->ti_sci = ti_sci_get_by_phandle(np, "ti,sci");
 	if (IS_ERR(kproc->ti_sci)) {
-		ret = PTR_ERR(kproc->ti_sci);
-		if (ret != -EPROBE_DEFER) {
-			dev_err(dev, "failed to get ti-sci handle, ret = %d\n",
-				ret);
-		}
+		ret = dev_err_probe(dev, PTR_ERR(kproc->ti_sci),
+				    "failed to get ti-sci handle\n");
 		kproc->ti_sci = NULL;
 		goto free_rproc;
 	}
 
 	ret = of_property_read_u32(np, "ti,sci-dev-id", &kproc->ti_sci_id);
 	if (ret) {
-		dev_err(dev, "missing 'ti,sci-dev-id' property\n");
+		dev_err_probe(dev, ret, "missing 'ti,sci-dev-id' property\n");
 		goto put_sci;
 	}
 
 	kproc->reset = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(kproc->reset)) {
-		ret = PTR_ERR(kproc->reset);
-		dev_err(dev, "failed to get reset, status = %d\n", ret);
+		ret = dev_err_probe(dev, PTR_ERR(kproc->reset),
+				    "failed to get reset\n");
 		goto put_sci;
 	}
 
 	kproc->tsp = k3_dsp_rproc_of_get_tsp(dev, kproc->ti_sci);
 	if (IS_ERR(kproc->tsp)) {
-		dev_err(dev, "failed to construct ti-sci proc control, ret = %d\n",
-			ret);
-		ret = PTR_ERR(kproc->tsp);
+		ret = dev_err_probe(dev, PTR_ERR(kproc->tsp),
+				    "failed to construct ti-sci proc control\n");
 		goto put_sci;
 	}
 
 	ret = ti_sci_proc_request(kproc->tsp);
 	if (ret < 0) {
-		dev_err(dev, "ti_sci_proc_request failed, ret = %d\n", ret);
+		dev_err_probe(dev, ret, "ti_sci_proc_request failed\n");
 		goto free_tsp;
 	}
 
@@ -753,15 +746,14 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 
 	ret = k3_dsp_reserved_mem_init(kproc);
 	if (ret) {
-		dev_err(dev, "reserved memory init failed, ret = %d\n", ret);
+		dev_err_probe(dev, ret, "reserved memory init failed\n");
 		goto release_tsp;
 	}
 
 	ret = kproc->ti_sci->ops.dev_ops.is_on(kproc->ti_sci, kproc->ti_sci_id,
 					       NULL, &p_state);
 	if (ret) {
-		dev_err(dev, "failed to get initial state, mode cannot be determined, ret = %d\n",
-			ret);
+		dev_err_probe(dev, ret, "failed to get initial state, mode cannot be determined\n");
 		goto release_mem;
 	}
 
@@ -787,8 +779,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		if (data->uses_lreset) {
 			ret = reset_control_status(kproc->reset);
 			if (ret < 0) {
-				dev_err(dev, "failed to get reset status, status = %d\n",
-					ret);
+				dev_err_probe(dev, ret, "failed to get reset status\n");
 				goto release_mem;
 			} else if (ret == 0) {
 				dev_warn(dev, "local reset is deasserted for device\n");
@@ -799,8 +790,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 
 	ret = rproc_add(rproc);
 	if (ret) {
-		dev_err(dev, "failed to add register device with remoteproc core, status = %d\n",
-			ret);
+		dev_err_probe(dev, ret, "failed to add register device with remoteproc core\n");
 		goto release_mem;
 	}
 
@@ -813,13 +803,13 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 release_tsp:
 	ret1 = ti_sci_proc_release(kproc->tsp);
 	if (ret1)
-		dev_err(dev, "failed to release proc, ret = %d\n", ret1);
+		dev_err(dev, "failed to release proc (%pe)\n", ERR_PTR(ret1));
 free_tsp:
 	kfree(kproc->tsp);
 put_sci:
 	ret1 = ti_sci_put_handle(kproc->ti_sci);
 	if (ret1)
-		dev_err(dev, "failed to put ti_sci handle, ret = %d\n", ret1);
+		dev_err(dev, "failed to put ti_sci handle (%pe)\n", ERR_PTR(ret1));
 free_rproc:
 	rproc_free(rproc);
 	return ret;
@@ -836,7 +826,7 @@ static int k3_dsp_rproc_remove(struct platform_device *pdev)
 		ret = rproc_detach(rproc);
 		if (ret) {
 			/* Note this error path leaks resources */
-			dev_err(dev, "failed to detach proc, ret = %d\n", ret);
+			dev_err(dev, "failed to detach proc (%pe)\n", ERR_PTR(ret));
 			return 0;
 		}
 	}
@@ -845,13 +835,13 @@ static int k3_dsp_rproc_remove(struct platform_device *pdev)
 
 	ret = ti_sci_proc_release(kproc->tsp);
 	if (ret)
-		dev_err(dev, "failed to release proc, ret = %d\n", ret);
+		dev_err(dev, "failed to release proc (%pe)\n", ERR_PTR(ret));
 
 	kfree(kproc->tsp);
 
 	ret = ti_sci_put_handle(kproc->ti_sci);
 	if (ret)
-		dev_err(dev, "failed to put ti_sci handle, ret = %d\n", ret);
+		dev_err(dev, "failed to put ti_sci handle (%pe)\n", ERR_PTR(ret));
 
 	k3_dsp_reserved_mem_exit(kproc);
 	rproc_free(kproc->rproc);
-- 
2.42.0

