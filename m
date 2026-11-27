Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795816156;
	b=nvfXVesUXaqlnZfCSISbX1qtNopaq7Ydt5m5Z+nEcZvOIcu5MpYCeXOjjIueQf+p2/Gh
	 IbLpiZwYMHhYyl01p2nUkADqI28St+hHnb3kW1i3daolGvQx3LrdSlcU11vYE2hoHCwG3
	 pguMGhjSZSutAUI+hIk0nCczsSLhcdA11ZLcFND3tl7Cr89KNieSxqyGY6qBOfmL1cyJl
	 mP10vgBaJL1Wat7Q/XGS9H04e67qPClr5HFPVCVu448HXAvLNHul1oQuXEgnJVYEApvvw
	 CBfCxwr/BXA39+QMH5leen+D3bedtzbTc9iAGZjeaVxVUo0e8yTImvKwD3tD7Ik2WuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795816156;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=Md/7jkWyleE5PXsFkfDaPgCCuiHacLukKOjj2EiLbrc=;
	b=h9FhEIPJdovLJ3OnOQKaDqqD5D0uFaEde5f/IG5IhRyPdfkAGMUXA8p9ufTlqwfW0D35
	 m24OKqqbnRGbt34OrjFBrBwG6Ej4H4VRmwmA7+wOaKIi6eWN53KQhwBO4/mV35raZ4qEh
	 aUFoRO1NRKqsbE6oRfoMm3SFTCT0Z4Is8DG1hBJ9mTd3m5xTdkgvqyvoFNY3PfG6dgEPs
	 6f38Ps+6mwfoxqMU3w2EYYiXWmZ3hur0G8cs5f05cvxRnHqhcgaW6+R/NUpVLqcxpBh8N
	 s1AlXoYFcVuPwBmKL5ogrXT9vrXid13Ts65pubQE0HS/i+R12VJllJrdqIVJcGeEw7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b="gL/3ytzf";
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=GELFkz0b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.7
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04629606A31E;
	Fri, 27 Nov 2026 21:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04629606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=gL/3ytzf;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=GELFkz0b
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-dx93.prod.antispam.mailspamprotection.com; s=arckey; t=1795816155;
	 b=HfbATYfYf1BzVHIp/HRIrKlpAUdDh+4BCVuzCZPsOn/he+UN+owrpcrASxFaeDIGk7to8JGY50
	  2gOPuMm/OL4mj2vhmUpCnVw24EoadLasWoXmYrhQWlBc6o/Y0wTAxuQWZVsotRoIWOfyEg6zhD
	  y8UDCZA8XCZhbOi3lSEaezMgOQsSWic8MHb7AynX6vMqvpaoUlTwcJe9qNPrzB67DwGezUHl1N
	  EJdl/j41k/pq/T8SkFvUty4hEhFzMveyX4E15OhRm2K2pgRWSAhH/iR46p/5mfuZI781YTft2c
	  C2inr9BDD7e4s39eYpme1wA59UfLEXRyGtbeamjyYxGy0g==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-dx93.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-dx93.prod.antispam.mailspamprotection.com; s=arckey; t=1795816155;
	bh=Klp4nPONeLAeEQVjP17AnV53GdlXguS34pu6h6T6Wug=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=bLcSXH5xPjlQnvWJNE1oq4ooGBhrdWf6BxCfMrYrEMSo4YJk/Ft4fHAD+deYUi3njtGwvHYD4p
	  dqF7lr6xMfBVfnJfoevVusRHC/ciiuHNXw/vtOdY3XKGtmKSzj6l4zgkWkz2fKjZLKhNjS4PlK
	  KRDNVtmddftY9ygS3TGUNdgWVr4D/W+W9M0oXxf0Ezefn7Ai6rjBX3S+HgEgPW7atknL2erbtQ
	  sn+GHFcCxcqxerP0aNlYjHSoe7x04RSFKQ9dtE0GqZdRwnqWzLMQh6Rju4P+87znTc/rCGjmwO
	  FXWrO2JvLnI1HhiCyBL2VIeNtfY2Kz4z3mTWbJllo3Zh+Q==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=Md/7jkWyleE5PXsFkfDaPgCCuiHacLukKOjj2EiLbrc=; b=gL/3ytzfGl+dhoGy64Y6514B4W
	gs7ZBgu3F/tXfIP/6yRjCAPZBSS8umIDumv+kefYQ04GQXz0mlUe0FnbHxBvWon3QA+TnPAZ9fcp3
	0EiCRBO8sQxli0bbQ/K8PbHzrHZkJv4OKWvSATINlIcOwg4fHDe7MGED3CsE2KJpfggA=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-dx93.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.2)
	(envelope-from <francesco@valla.it>)
	id 1xX3oZ-00000005gBA-2fi3;
	Fri, 27 Nov 2026 21:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=Md/7jkWyleE5PXsFkfDaPgCCuiHacLukKOjj2EiLbrc=; b=GELFkz0b05WZcnN5V3a69ya8qf
	gJZp0A4qpDCK9VaP/VJZq5fiNQxq2L8dSVUKDQH46MKZAYLFEd8rckYWr7IDFORwIxtr9S8Po0rsX
	N/tjn2WRGy7jTHgz2+db/QYVXDN8/dIvzQnK77eqiaWj8W+fBpm61bZKIabaq4gSclvE=;
Received: from [79.28.115.6] (port=64199 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.2)
	(envelope-from <francesco@valla.it>)
	id 1xX3oV-0000000056N-0tnW;
	Fri, 27 Nov 2026 21:49:03 +0000
From: Francesco Valla <francesco@valla.it>
Date: Fri, 27 Nov 2026 22:48:50 +0100
Subject: [PATCH v3 1/4] remoteproc: virtio: Decouple vdev from the parent
 pdev
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
Message-Id: <20261127-remoteproc_pdev_decouple-v3-1-28f245622129@valla.it>
References: <20261127-remoteproc_pdev_decouple-v3-0-28f245622129@valla.it>
In-Reply-To: <20261127-remoteproc_pdev_decouple-v3-0-28f245622129@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Joakim Zhang <joakim.zhang@cixtech.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3636; i=francesco@valla.it;
 h=from:subject:message-id; bh=Klp4nPONeLAeEQVjP17AnV53GdlXguS34pu6h6T6Wug=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDNmcv85uMgpQyDp733GGy75ZCaWrp1icDV8x9eb+bBbPV
 gvxlxa/O0pZGMS4GGTFFFlC1t24t2eu+be0DYyPYOawMoEMYeDiFICJyF9i+J+Yors7MWvirW+/
 IrlT0zm+bQg3n+VyQ1S0UmixUc3q1TsY/mdWseo+SHhs3Cnz5NCTika2+duuVewuLzR98ENrm6+
 xPw8A
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
X-SGantispam-id: 0ac4e3fa9062b9133e25d5ec9ff6287b
X-AntiAbuse: ID - 0ac4e3fa9062b9133e25d5ec9ff6287b
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xX3oZ-00000005gBA-2fi3-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-dx93.prod.antispam.mailspamprotection.com;
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
index 29a3a4c18097..b59f4acbb630 100644
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
@@ -448,7 +442,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	vdev->dev.parent = dev;
 	vdev->dev.release = rproc_virtio_dev_release;
 
-	/* Reference the vdev and vring allocations */
+	/* Reference the parent device, which will be used during teardown. */
 	get_device(dev);
 
 	ret = register_virtio_device(vdev);

-- 
2.56.1

