Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD14456286;
	Wed, 16 Sep 2026 21:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789595326; cv=pass; b=GcjkB5dta94NsCk2rrCS4bTrw86RYNY7v/kFLStnIRXlf3iKamgWu9bUqAbcG2hfJjbCY32MspMiHnolbhRspxMcxFUvUctTkI1rckgXlq4ETMD5RpjOtLeinxdZDmsTtq/JngRi3DJv5/UqdMih2NX/BlFH+RcAduT/FHJh66Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789595326; c=relaxed/simple;
	bh=5RpInneuPFremFn6IGVocs0wamQaJJ0xuph/2qEoWFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WNxGUVDDYHDTYTBmK8DW/WVoz7vwFx6yVOdnjymPoXISTZiVdnLEglsDNfXXvC7DBvrzcRYh6tLtHW2WNTwp9gABMV/hHleWPN7wXHhLw+qOWrF5zHGVSwa9wpoG847cUdndjlXHoh1Qp2WKDQ1dPpNiy39l0TSEYtyj4urCcIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=neZsQSh6; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=MHHs7zTH; arc=pass smtp.client-ip=185.56.87.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="neZsQSh6";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="MHHs7zTH"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; s=arckey; t=1789595309;
	 b=LDGPUswdl9gNB3KdJlnSI70l5nrUe7GetenlsR1LU9SdwtgFyS263dLaasshJfJsSQXaiTr/vv
	  LhZAp3tGCa8XWORYHrCCs1G5U9T1GVKv6IONVjVHKkl7W8Hj+f+gRE4brlUmu2JvgWOaoC5Nde
	  BqSyADf69affnSUueF7ZSvfrXG6r03NsDVhpciKh2rJNlT8wJHfU48sIb1HmBNCMKzPiOZR/Kk
	  rR3kSVgd1X7E6JRe6myaAx3SqX9Iz56or5UBmteT9O3QNIu2917GYEdHLkYqxtluk70+UC3RZG
	  7ZmldXpKJXs0xr/MiupcQgRhwiVNogLtXL+ZMjiQEWp/tA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com; s=arckey; t=1789595309;
	bh=5RpInneuPFremFn6IGVocs0wamQaJJ0xuph/2qEoWFA=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=2jtSCVvQVebUbDN0yztK8tsDWtn4xji+GbBuueJOeAkIof746OuFpEvReidx+ULzTbZD0rUU3C
	  K7LYFMsogvIYyXv4DdTOAsbCytoXQudAvCl5NbW3AbPTrlnYHLd++MO4BJfgjLMc99S7JgoW0C
	  K/GB+z2TIqvNQvdKNNpc+CtoUoEgKmhGxJGf7jcuXcScBVV80UWGSCVQVEQvSsAnlfFih8hTZG
	  f7wUGbmy5hiDkWlQd6/gb38YE9jeNcbuLVOUBRBQplFbDb/l4IVRXhykPutviI1HtBX4/w3HL7
	  xe4/919hWYS0g5Thg/D7Qv/ys77dIsrnOJjjLdb3rKtMMg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=VQVoOO/zbpaeb/l4qLVnNDj9e2y11NOFxhc+SjTbWPc=; b=neZsQSh63xo28iOfbXP/yq0mHn
	DW1TVqHE+12QbqFJDddwNty3ZIPQUqoc83IqoQN4eRVyPrvZh4/hGV/gnYC1Fld8/A2MD3j39cxwS
	SXfU1WvYtSUXPpONb1KYaE5pgG3JIH8Z9GMYdxwXAOR0ElqX71p63qP0nP20TdAF/2pY=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6xUI-00000003nWX-26tj;
	Wed, 16 Sep 2026 21:48:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=VQVoOO/zbpaeb/l4qLVnNDj9e2y11NOFxhc+SjTbWPc=; b=MHHs7zTH3GK9FTI1K2dcbUyBIT
	q8tRhi/NJvR6+MO+3GGTVwn4LCZW5XbeJmxYe9D9Lq8vxF5M/fOBQwiVxhs8TsYaaesL89Nn5n5cq
	JUnxSR/3+Oi+RGCv9er5Z/iFdQTYODXlOtZj2ds900oDRlRCqFN78TDGDtb/7iyCPubM=;
Received: from [95.233.221.121] (port=62880 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuR-0000000058P-2urL;
	Wed, 16 Sep 2026 21:11:15 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 16 Sep 2026 23:10:55 +0200
Subject: [PATCH RFC 10/12] remoteproc: imx_rproc: always use non-blocking
 mailboxes
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-remoteproc_virtio_map-v1-10-dac8c5eb4aa9@valla.it>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
In-Reply-To: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5141; i=francesco@valla.it;
 h=from:subject:message-id; bh=5RpInneuPFremFn6IGVocs0wamQaJJ0xuph/2qEoWFA=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFmrWZ8wVjamH5pQ1v6rb3vpIv/4BI25fgUp/3Tvq67S2
 lLyqsWlo5SFQYyLQVZMkSVk3Y17e+aaf0vbwPgIZg4rE8gQBi5OAZjIDn5GhhsL14SeifMKn6y0
 OHlJ0cy5U06pTpv6Q+yg5L5tIpvvSbsz/HfesCfDI8aMLb7s/dFPPNty3pi8nsi6e+nqVWtrf6V
 zPWEGAA==
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 34e675cb71f7906ad68cefa10a742871
X-AntiAbuse: ID - 34e675cb71f7906ad68cefa10a742871
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x6xUI-00000003nWX-26tj-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-xhtg.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Blocking mailboxes may lead to sleep during the kick operation, which
conflicts with some virtio devices (e.g.: virtio-can) that kicks their
virtqueues with spinlock(s) held.

Align to the behavior of all the other remoteproc drivers that use a
mailbox to perform the kick (i.e.: omap, st, stm32, ti_k3_*, xlnx_r5)
and move to a non-blocking mailbox here as well.

As a side effect of this modification, remove the close-reopen action on
the mailboxes during restart and shutdown.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/imx_rproc.c | 49 ++++++------------------------------------
 drivers/remoteproc/imx_rproc.h |  1 -
 2 files changed, 6 insertions(+), 44 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 745ce52cd822..100440328f92 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -97,7 +97,7 @@ struct imx_rproc_mem {
 /* Linux has permission to handle the Logical Machine of remote cores */
 #define IMX_RPROC_FLAGS_SM_LMM_CTRL	BIT(0)
 
-static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
+static int imx_rproc_xtr_mbox_init(struct rproc *rproc);
 static void imx_rproc_free_mbox(void *data);
 
 /* Forward declarations for platform operations */
@@ -444,7 +444,7 @@ static int imx_rproc_start(struct rproc *rproc)
 	struct device *dev = priv->dev;
 	int ret;
 
-	ret = imx_rproc_xtr_mbox_init(rproc, true);
+	ret = imx_rproc_xtr_mbox_init(rproc);
 	if (ret)
 		return ret;
 
@@ -712,7 +712,7 @@ static void imx_rproc_kick(struct rproc *rproc, int vqid)
 
 static int imx_rproc_attach(struct rproc *rproc)
 {
-	return imx_rproc_xtr_mbox_init(rproc, true);
+	return imx_rproc_xtr_mbox_init(rproc);
 }
 
 static int imx_rproc_scu_api_detach(struct rproc *rproc)
@@ -877,7 +877,7 @@ static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
 	queue_work(priv->workqueue, &priv->rproc_work);
 }
 
-static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
+static int imx_rproc_xtr_mbox_init(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
 	struct device *dev = priv->dev;
@@ -900,7 +900,7 @@ static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
 
 	cl = &priv->cl;
 	cl->dev = dev;
-	cl->tx_block = tx_block;
+	cl->tx_block = false;
 	cl->tx_tout = 100;
 	cl->knows_txdone = false;
 	cl->rx_callback = imx_rproc_rx_callback;
@@ -1223,22 +1223,6 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	return priv->ops->detect_mode(priv->rproc);
 }
 
-static int imx_rproc_sys_off_handler(struct sys_off_data *data)
-{
-	struct rproc *rproc = data->cb_data;
-	int ret;
-
-	imx_rproc_free_mbox(rproc);
-
-	ret = imx_rproc_xtr_mbox_init(rproc, false);
-	if (ret) {
-		dev_err(&rproc->dev, "Failed to request non-blocking mbox\n");
-		return NOTIFY_BAD;
-	}
-
-	return NOTIFY_DONE;
-}
-
 static void imx_rproc_destroy_workqueue(void *data)
 {
 	struct workqueue_struct *workqueue = data;
@@ -1285,7 +1269,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
 
-	ret = imx_rproc_xtr_mbox_init(rproc, true);
+	ret = imx_rproc_xtr_mbox_init(rproc);
 	if (ret)
 		return ret;
 
@@ -1315,26 +1299,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	if (rproc->state != RPROC_DETACHED)
 		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
 
-	if (dcfg->flags & IMX_RPROC_NEED_SYSTEM_OFF) {
-		/*
-		 * setup mailbox to non-blocking mode in
-		 * [SYS_OFF_MODE_POWER_OFF_PREPARE, SYS_OFF_MODE_RESTART_PREPARE]
-		 * phase before invoking [SYS_OFF_MODE_POWER_OFF, SYS_OFF_MODE_RESTART]
-		 * atomic chain, see kernel/reboot.c.
-		 */
-		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF_PREPARE,
-						    SYS_OFF_PRIO_DEFAULT,
-						    imx_rproc_sys_off_handler, rproc);
-		if (ret)
-			return dev_err_probe(dev, ret, "register power off handler failure\n");
-
-		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART_PREPARE,
-						    SYS_OFF_PRIO_DEFAULT,
-						    imx_rproc_sys_off_handler, rproc);
-		if (ret)
-			return dev_err_probe(dev, ret, "register restart handler failure\n");
-	}
-
 	pm_runtime_enable(dev);
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
@@ -1447,7 +1411,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8ulp = {
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
 	.att		= imx_rproc_att_imx7ulp,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
-	.flags		= IMX_RPROC_NEED_SYSTEM_OFF,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 0d7d48352a10..9a1400d0d081 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -16,7 +16,6 @@ struct imx_rproc_att {
 };
 
 /* dcfg flags */
-#define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
 #define IMX_RPROC_NEED_CLKS		BIT(1)
 
 struct imx_rproc_plat_ops {

-- 
2.55.0

