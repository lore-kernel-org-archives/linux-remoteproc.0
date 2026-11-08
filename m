Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.56.87.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794177178;
	b=BavDIdCL58P+iuqXeRxoAVwIxVzOaJCmZwoigqO/cGlxL+POTt0lyTN1wS/oBxgeYVhP
	 NEoQRd5CZ2kqCTkMvZGFKdUECdOpINtDFuweVPnH1x7J7UXKrqcVnXPx7L1rKIHeLgdgR
	 M9DX9F8gw84V5yQI8lLe2CkqBNWWrSm9ncXTNL9+2n7p6T991YNf6aq2ilGf/joa483uY
	 Ih7PhMouHTkTZxv72S46PVtaQ6zhClCEfQsKRpMUJN96IFAcQyk7gQAG7Zu4iw4hL9llz
	 JsuFnnRdNrrwWCteptOcyG9uswA3HvkPc+PN+nfBhD4gUXgAaUnRCabNm8iu4aLz3DA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177178;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=IOpdWZT5jQspO42tQiglJXQ5sVQceKP+1KcvLTgvESA=;
	b=Bz+DoK7/X060y4k8v8o90q50XcH9xlgklwuNaUs9goPTMDoz5e1TgX6v9yJdCRCE5Ava
	 sfDWYB2xiGrluFqpPjAkGWyoYd4xsrQYzZ/QEGjuiS45lpqoBERPHzBQa3/VnWcoChzGq
	 e0xrTXOd6EgYldhW911Fn+s8cuVLS8ISjW+jbU6/Bspl8/AWJHCEZ1ieB397atdhq6IP2
	 ue/ecE6LNvP/mMoC1uZ7lBYHsWiaTUlXQ9x3Kq4PsxlqpW1EP8EnXwbiwZAqS43ANyHU/
	 KkBktZe/xR0LKsZx+E+uligwoORpaQsjYPBuGg4Uk12N1wEgB+HS7KrFhgY+97qicEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=nMK9Z1RC;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b="atn9Jad/";
	arc=fail smtp.remote-ip=185.56.87.1
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35173606A321;
	Sun,  8 Nov 2026 22:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35173606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=nMK9Z1RC;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=atn9Jad/
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com; s=arckey; t=1794177177;
	 b=Qik9vE6xcOUsXuIeX6bmHWzzBWyZIIDflDinLmWGr/gBvWdQGlKo8MaZdrPpupYaZWyCu5EROD
	  36fJz7N1rfCkLrTsYsJqF+YSIDitFdbAugoN3Fav5lLHZ4bdjDMF9Q1kKzMjGqINuwl2MAxBAL
	  e3NySyYF5sG+Lbh1Xhx7gR2GsTvR/VGbEW9iIJ41C21BC9/VvMUZmt5BSKXzprBQ/4H28lbuUX
	  jXRmkdfHdPaWOB6k5UqQ7u2Uj0uTv6jI/ZHFkKBVypkodo8bAQlj3FA8W22LNROSPcikGLZyjX
	  Sq6QNw6pzVNqemBwE0T8hIQG7JYVGZQEJXOrLS92Jx9zTQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com; s=arckey; t=1794177177;
	bh=pmrvNLhlmFVHCgF5l6VSvUtW2U2YRZNxylG1l1bIewc=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=vqGC0tFf6Yg0HCGii5ie443PYWf+RYaHezpegCHkigHx+h2uMf9tsh2Bo2WqOwxCek1WObvyWH
	  WyZjWUkDYLMwI4Nnf8rzfV3Vsa4g1UAoSu/4DcgRjlLGroFRLd80RkygIae8BYkguzWrEn36Ke
	  ei8CF/mQ7EARUM94FuKF36qP0C/APPeiCPt9Zmi+gSRjZT1nawbEcQe/Htpijgoq7gl82S05ZF
	  a/NhGgdCgLz+LNkXVoGJiERk70cbxpetx1PMePR/d1rjPf1yKxicejqS+gfPJWV3hVXlO2qtLD
	  Hyb6Bz/qdPMJ4nHTwaWXumzieO7KInGJlpn6UD/WbjN22Q==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=IOpdWZT5jQspO42tQiglJXQ5sVQceKP+1KcvLTgvESA=; b=nMK9Z1RCrOMCUsPIySIZGLvjQH
	NAGaF8ToSFpcLIjD5lAzxy0C+DSo9+60bkypqvv/XrtRqklp8fGcOfIwnPbVO/FEJ+mDTiJrVxue3
	ZgmGdBWoAWLEZFF6zF+sj24lBklGhPo+7pu5888a2uUZpLGyCmLeJ7LvqyGqiCfe7HnA=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xQBRW-00000008TgT-2e83;
	Sun, 08 Nov 2026 22:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=IOpdWZT5jQspO42tQiglJXQ5sVQceKP+1KcvLTgvESA=; b=atn9Jad/n7J6b8OEqGa26BIo4d
	TxT1CktUQFBi1rW9vZgb5fuVsGKnQklR0FE5+O3/vlow7EjaYK37avc95gq4r84gA0g7fDf1IlBlb
	eqHZML7Nx336uOiVa3Ve+Gw6AM1sNFefmI1wL3B7nrMm8NVA1QwkHdWjZA1dGZ5/l1mY=;
Received: from [79.17.15.196] (port=64784 helo=[192.168.178.158])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xQBRS-000000006ZR-0BEL;
	Sun, 08 Nov 2026 22:32:50 +0000
From: Francesco Valla <francesco@valla.it>
Date: Sun, 08 Nov 2026 23:32:37 +0100
Subject: [PATCH 1/4] remoteproc: virtio: Decouple vdev from the parent pdev
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-remoteproc_pdev_decouple-v1-1-3dc2fad4951d@valla.it>
References: <20261108-remoteproc_pdev_decouple-v1-0-3dc2fad4951d@valla.it>
In-Reply-To: <20261108-remoteproc_pdev_decouple-v1-0-3dc2fad4951d@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Joakim Zhang <joakim.zhang@cixtech.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3636; i=francesco@valla.it;
 h=from:subject:message-id; bh=pmrvNLhlmFVHCgF5l6VSvUtW2U2YRZNxylG1l1bIewc=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFkffkzYvM2kZEZsk2tlhK/WJf61u+6rPGdh8usTVajQO
 lEo+PVqRykLgxgXg6yYIkvIuhv39sw1/5a2gfERzBxWJpAhDFycAjARm0JGhtO6a+Ifzp1z4b75
 muyfXrkXpjz0LZvbuNJxXUF8ZfC/t1MZ/umyrWE8t/3ezzvlJQ81boc+a7/Mtj6M0z+4VsX+bwA
 zOxcA
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
X-SGantispam-id: d03ddc932c225c7750ba240bf1ca6465
X-AntiAbuse: ID - d03ddc932c225c7750ba240bf1ca6465
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xQBRW-00000008TgT-2e83-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

The rproc-virtio platform device can have a lifetime different from the
virtio_device it registers. During cleanup (e.g.: when a remoteproc is
stopped) the platform device is de-registered by the remoteproc core,
but the related virtio_device might be released later; if this happens,
rproc_virtio_dev_release() will try to de-reference a NULL pointer as
part of vdev_to_rvdev(). This can easily be reproduced with
CONFIG_DEBUG_KOBJECT_RELEASE.

Remove the access to the platform device structure from the cleanup path
and interact instead with its backing device, whose refcount was
explicitly increased during rproc_add_virtio_dev() and will be
decremented as part of rproc_virtio_dev_release(). The same is done for
the pdev de-reference inside vdev_to_rvdev(), even if no more used
during cleanup, to maintain the same access pattern.

While at it, fix the comments on the specific matter.

Fixes: 1d7b61c06dc3 ("remoteproc: virtio: Create platform device for the remoteproc_virtio")
Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_virtio.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 12f55a81cfa0..7979b2570998 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -49,11 +49,7 @@ static int copy_dma_range_map(struct device *to, struct device *from)
 
 static struct rproc_vdev *vdev_to_rvdev(struct virtio_device *vdev)
 {
-	struct platform_device *pdev;
-
-	pdev = container_of(vdev->dev.parent, struct platform_device, dev);
-
-	return platform_get_drvdata(pdev);
+	return dev_get_drvdata(vdev->dev.parent);
 }
 
 static struct rproc *vdev_to_rproc(struct virtio_device *vdev)
@@ -348,7 +344,7 @@ static const struct virtio_config_ops rproc_virtio_config_ops = {
 
 /*
  * This function is called whenever vdev is released, and is responsible
- * to decrement the remote processor's refcount which was taken when vdev was
+ * to decrement the platform device's refcount which was taken when vdev was
  * added.
  *
  * Never call this function directly; it will be called by the driver
@@ -357,14 +353,13 @@ static const struct virtio_config_ops rproc_virtio_config_ops = {
 static void rproc_virtio_dev_release(struct device *dev)
 {
 	struct virtio_device *vdev = dev_to_virtio(dev);
-	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
 
-	kfree(vdev);
+	of_reserved_mem_device_release(dev->parent);
+	dma_release_coherent_memory(dev->parent);
 
-	of_reserved_mem_device_release(&rvdev->pdev->dev);
-	dma_release_coherent_memory(&rvdev->pdev->dev);
+	put_device(dev->parent);
 
-	put_device(&rvdev->pdev->dev);
+	kfree(vdev);
 }
 
 /**
@@ -372,8 +367,7 @@ static void rproc_virtio_dev_release(struct device *dev)
  * @rvdev: the remote vdev
  * @id: the device type identification (used to match it with a driver).
  *
- * This function registers a virtio device. This vdev's partent is
- * the rproc device.
+ * This function registers a virtio device with the platform device as parent.
  *
  * Return: 0 on success or an appropriate error value otherwise
  */
@@ -450,7 +444,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	vdev->dev.parent = dev;
 	vdev->dev.release = rproc_virtio_dev_release;
 
-	/* Reference the vdev and vring allocations */
+	/* Reference the parent device, which will be used during teardown. */
 	get_device(dev);
 
 	ret = register_virtio_device(vdev);

-- 
2.56.0

