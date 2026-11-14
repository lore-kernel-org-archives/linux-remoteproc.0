Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794643626;
	b=aHvyd8gKOZXgB9O9DAm1OxcnYibgdqd53vNAF4KhyWKqcD08ZIL0BvfKtsfXcAO9pto3
	 eYVVj0yLqoS0miU4qAII5mUXVFmk32q+LLnl80rdrLRuNS/qDiWsfICpLrQO/UbZbeFrK
	 VpmjuyXAZvp1krjUAM0SEQefME6K4t8KTS09eaA5XGUFr3+HB5ME9CnwRfIyv3Yg/0bGx
	 lOxtJMNPvwoDKS3oRpFdBXXcwdOYzJGEokfp2zwwMXhOzN+gpE3qRndpiW4yrkm6AY3gw
	 qYbWE+hHLlbS9hicdzI8qIvqWSt52zjYe7mKpl9INSOn4s7X5WTddUvwfN7xJH3xK7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794643626;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=+oo5zBt3UZSgN8HRbSU61RSiRiRyfe/EctHOkgpPH8A=;
	b=DNhqBRY8mVwc7XUERcKwV1IqweOM4pnghuFq//vJ0xZmxPYPvC2oU0x8rHSqTrPnASVy
	 Pz8dISMu7tol4P/Ax765xv9p9egQikGOhp3a2UlMJeVvoi507lu7gats93vQv1c8aLfH9
	 D1wu23CtuDeg/LpADwLlyp4xpZ3X7+x/BEn4feTZo408eLpApnHUgGv34hmRjuz7YMKWn
	 N2y0dYL/b4x31h1k0HQjuNHAn6/Ywpvh2p67DVtADzhqeWAjLTP92WkGwxlUsJsk5JzYW
	 GwnrH+qo4vst+lkIzT8oZ2k6kFMOGQQAqmZGQgBUFuTTSVDnV2Ju9gSeCN3PNEdMztA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=N+MiJRD7;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=rx8sg42K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.0
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305D4606A883;
	Sat, 14 Nov 2026 08:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 305D4606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=N+MiJRD7;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=rx8sg42K
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com; s=arckey; t=1794643624;
	 b=Rs1Am1+KI55D54C6jBUD+P+6h269eFsERwznSki7z3B62+/Fg1tkVGrjDSonH52Vs54P6LAqfI
	  ZfOtXu+ZVYLUPyXLhTdD/OO/+6oOQOiXaWCRFH/P2bvb1bV77BbLWJ9yHEqVjaScLkaZL1PNQt
	  c+qBSG/cALlbTk85HXalB2GkJecaE44YLD/kgedOpBThVDpaV1+BGNQOjiTV38JYAmde3A8ma+
	  /h+OHRlHT96S6eJo92XiknHQSMo8Hhpkr7j2HmRdQ2FXBtmJDrL0vX2ltTjjqSNAZAcbS0Qed8
	  r9TkvYHntUb+oDrtxvC2xlkX/pb7uHmeDUIZDLMENrg/wA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com; s=arckey; t=1794643624;
	bh=ipbUhe+ISCCOAO0eJU9SmVxroj/p4peJptKohoa5/Yg=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=Qh6oiMB2gy8tpwA4d5hXl/dtq5QwDx65GA0uF69FCL/0AkwBQ6vOpa6QhMHKf6L9YMP0dc8/Az
	  LBFZOHW5ybhkZ5mL/FZWQnyJjqVuzRtY+afGcqE29X0axHFobGV8ZJnXs6kXM/k0jxg7dJQXku
	  ea/rDUNJJRzwVoAhjEhphYMIhB3ykJ8Ame17tQDwa8p5cdi/YWtuiblIUGNTNQ/JvANoDXBe5b
	  lNHtrx7fq11f1+VGQ9MTsYqi8uILefM5yjpaXTVVBt4BG2KHPChAWNDjWIu6vH6r1QW8ygQpEw
	  +jv7yrK5Pm/CvQJbIQ4x3YzrGwKlIFDdEG4eps3rEogV1Q==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=+oo5zBt3UZSgN8HRbSU61RSiRiRyfe/EctHOkgpPH8A=; b=N+MiJRD7OpXa57sMuXqyUpL8Br
	GWGJtOxNstVmn/UJLYlAUrWiMgCyggkAZH4IuibsL1lhEdmJmkpgg5pQihoHshkwXaxxcNi7zZlSK
	zjuuHnf2Sf6fUj2xqHY+9Y9iZcU0bg9ZP3DjOWO5tW5Cch0WQjpLU6Dq5oxss/M6OeqM=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xS8mn-0000000AtO3-2LB0;
	Sat, 14 Nov 2026 08:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=+oo5zBt3UZSgN8HRbSU61RSiRiRyfe/EctHOkgpPH8A=; b=rx8sg42KNSUdHVE3D8TUz11ZhF
	icSwp+oSeyFZsTNU4dpsQ1Lu5GB6gsrPYDoVAvBB8BmJvBze0X/5BpR9mC+qQ8DT+zRECWtNiVvPA
	rA/0B5pHWSNTFRE6DYxPeJgWl94YwRFebdHevS6yDaqA4E0cnjNz35u50/uMLFsgPHAc=;
Received: from [95.75.15.255] (port=5068 helo=[10.167.111.42])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xS8mj-000000006Ml-0ptL;
	Sat, 14 Nov 2026 08:06:53 +0000
From: Francesco Valla <francesco@valla.it>
Date: Sat, 14 Nov 2026 09:06:33 +0100
Subject: [PATCH v2 1/4] remoteproc: virtio: Decouple vdev from the parent
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
Message-Id: <20261114-remoteproc_pdev_decouple-v2-1-95235dd056aa@valla.it>
References: <20261114-remoteproc_pdev_decouple-v2-0-95235dd056aa@valla.it>
In-Reply-To: <20261114-remoteproc_pdev_decouple-v2-0-95235dd056aa@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Joakim Zhang <joakim.zhang@cixtech.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3636; i=francesco@valla.it;
 h=from:subject:message-id; bh=ipbUhe+ISCCOAO0eJU9SmVxroj/p4peJptKohoa5/Yg=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFk/xObUX/jPYLb/re1S7Ukpvgk/lb14Hv6s/VmotO13s
 eI971zXjlIWBjEuBlkxRZaQdTfu7Zlr/i1tA+MjmDmsTCBDGLg4BWAiX8IZ/ooapbz4m6tnHbE5
 O/n18rXGs6f8+GKS+Dbif9flI8+4xE0ZGVZ82Gxtdj9/1Y01vmfOzOpTaBXdcCzeQYiBZ8WRNPc
 /EpwA
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
X-SGantispam-id: b438a27de1c637c54639732092d8a49d
X-AntiAbuse: ID - b438a27de1c637c54639732092d8a49d
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xS8mn-0000000AtO3-2LB0-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com;
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
2.56.0

