Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794643626;
	b=LlP8eYTBBSiji5v5k6f92VoastFSwS+oewte6peUzFMpLoKbOtNrWMsZHzW00se9BICH
	 KJaNj3djeNmlH0VodRfENz32ySve03A+8jVLSLUssdfJsXZW/DfK+/mRN6vnlLkOyHWgD
	 eQ0/PCNMGNOfQQG/OEaWe4NlvNhLalXsBtmRIcf2D9xqTqlfFfrVktd2GL0k6XPWUR/EQ
	 HMvh7X0kzbBpuBVq/g+U5FaP9nhzP3aiuYaatLAeh220UudDvPZVLuj1Cpi3/OZexmkRf
	 WW5o7M9wu+TZooffir1ezUUP0+acTDSKqy4Sehh4WSLiPXnMs9Ay+94jtFRey96wRCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794643626;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=YzTHb0yJLJ663bExkhKSf45qeyxInWUvGz0BUZZLdRE=;
	b=WMFu9d0X8r2bXiZB9DG8L0AldmJUweViVjbWWF0Rc5D/EKUERd390/zOzXQ7QXjfjI13
	 BHxoi5SOvGmG6qoEMTMQQNfk5fmtCaP4hXlwkzW/Z1Wrkow6KmDVhS1S2+TgUou/Tfdr9
	 0D/b+3L0XlvhqgwZj4GUk3XnjZCMSe2doWgs0d2+wx5JYOk4B2D1gqsZupYM/OJMMAtk1
	 9V24Dv8d6+Z7i6dy0Y+aFqd95XrbxkWerjs87o43SlZbM8IER3meBw7L8BnacmlDW6dZ0
	 /2Z5HhVDLX/2mtTQKHR0RN9wzbidZh7Wjf4b15W18dpWcNvyh9vF5+P6Eakw953MXmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=f3fzhkZM;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=hNNNc+3M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.13
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D27606A893;
	Sat, 14 Nov 2026 08:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27D27606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=f3fzhkZM;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=hNNNc+3M
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com; s=arckey; t=1794643626;
	 b=cdSBk2GLkoVO9yQtVH6bvNPAdNQB72x6pQth8iG/fZ/oOv+U9M3/Rwbgykpj2Wm4g3/la82qT0
	  pYxcg1f0incp9swxV9g+zhKCUJ2Gr1890cMBL9qZj3cQ4ceFNXScOISFW+j0UiRsYtXN/EIkgH
	  yg2OXOhIkjhJYDOtFZ3fNGQPId8GuWGA80dOQGsH3A65U9aPRmdEK+m+J1U/8IthEI/rL8TPs/
	  WcR+ykfwTl+ViHCUmQUBS23wQ+YEAV6agcTxwRpbAXGYccJgGjFu0FH82yPT+AQXTkiuWJsv6n
	  p8pfISd/9f5O+oWPZ1b6bnnrcg5jM/QW4uXWqgaRKy82QQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com; s=arckey; t=1794643626;
	bh=RwO9oGghBzKwQ/15n4F3eeGXALlCJajKOoAg7V61urU=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=QrApLMNOOo/pTLKAS+0oroXwxEPX2b4XRM3TKrSCzpiLqru2AbHMy8rBzJvH2fMV/W3YJy2VRg
	  00RiQv3sefqMWBwVCcgLniw3IdIu6meMDNxoTsdNI67VlIuYo94T/W8MUOyhQiVCylgNtXKY0u
	  VwwVSvHEButqvdIi7DnZgHCCrbroMvEE0KoIYdmiZ0tu3cG16FZRyUWfAtq9A2nUaW+LBooXXV
	  nj0GLCon32P6/wbFfCciiZuM/Os196n9Uecrk2jH+1vQBtilxqYCsZ+vXWcpGoFjI2BpPjrFqQ
	  pVnONHkOW4TcxP2Wc9jwixyp0WUBOmVSrSpvhKWiVib7lg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=YzTHb0yJLJ663bExkhKSf45qeyxInWUvGz0BUZZLdRE=; b=f3fzhkZMrtXrHlc8k9g4yyaS7U
	aKN/ChW3IBVw9v3zfnjxpcnXjaepFvAh6nZx7k+vJreruavdrDdscluTXV/xllDsrSBzdgeqzNMMy
	N07nyd3Zco+6865enK237H8nWbh69WSX5eGZU2nXQpdFb0Z0WzMLvMcy3HmJXMwhdBL4=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xS8mo-00000008wO4-1yAt;
	Sat, 14 Nov 2026 08:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=YzTHb0yJLJ663bExkhKSf45qeyxInWUvGz0BUZZLdRE=; b=hNNNc+3MtH3fEI6yxVvgpx2UjV
	gFZ6sJe5+5DGu/kMI0JPaifz2CKXvG8WB2F6VNXb1HP49pay/wu77Ya7PJJ34P2Hy+gUPg7YlbClz
	bJJyBmDxS1ozVqWniXBfIfWKJw3ztihbp7IHNpaYCZbT8tW6d1Du7QuuFf8HYyA+J6M4=;
Received: from [95.75.15.255] (port=5068 helo=[10.167.111.42])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xS8mj-000000006Ml-3wMS;
	Sat, 14 Nov 2026 08:06:54 +0000
From: Francesco Valla <francesco@valla.it>
Date: Sat, 14 Nov 2026 09:06:34 +0100
Subject: [PATCH v2 2/4] remoteproc: virtio: Rework memory release
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
Message-Id: <20261114-remoteproc_pdev_decouple-v2-2-95235dd056aa@valla.it>
References: <20261114-remoteproc_pdev_decouple-v2-0-95235dd056aa@valla.it>
In-Reply-To: <20261114-remoteproc_pdev_decouple-v2-0-95235dd056aa@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Joakim Zhang <joakim.zhang@cixtech.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3454; i=francesco@valla.it;
 h=from:subject:message-id; bh=RwO9oGghBzKwQ/15n4F3eeGXALlCJajKOoAg7V61urU=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFk/xObMbrT3vLQlM71XYFdCRESgFXvELbHYquyVT3MiL
 5hemZvWUcrCIMbFICumyBKy7sa9PXPNv6VtYHwEM4eVCWQIAxenAEyk5yIjQ3N0OPe5g2qvtttP
 D3p63ur55gViNfOK/CbWL5GbPF29dCcjw53P62c+MjDLX6gndL7l3qYaLsdGr/Vlleuk3x+8Xt8
 izg8A
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
X-SGantispam-id: 9b0dbfbcafcd6f7113a61eb298172dda
X-AntiAbuse: ID - 9b0dbfbcafcd6f7113a61eb298172dda
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xS8mo-00000008wO4-1yAt-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

The current memory release setup has two issues, which may happen in
specific corner cases:

  - a failure in kzalloc_obj() during subdev.start() would keep alive
    the association between the pdev and the memory setups done just
    before, leaking them and preventing further start attempts;
  - in case of a crash recovery restart, where the pdev is maintained
    but subdev.start() is called again, a delayed release of the
    previous vdev either makes the start fail with -EBUSY (dedicated
    vdev buffer) or, when falling back to the parent's reserved memory,
    makes the memory setup disappear underneath the newly created vdev.

Move the memory release calls to subdev.stop(), symmetrically to what
happens in subdev.start(), and add them to the failure path of the
start() itself. The get()/put() actions on the pdev, that are now
useless since no access to it is performed during the vdev release, can
be safely dropped.

Fixes: b327c72753d6 ("remoteproc: virtio: Fix wdg cannot recovery remote processor")
Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_virtio.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index b59f4acbb630..6cfdab831185 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -344,8 +344,7 @@ static const struct virtio_config_ops rproc_virtio_config_ops = {
 
 /*
  * This function is called whenever vdev is released, and is responsible
- * to decrement the platform device's refcount which was taken when vdev was
- * added.
+ * to free the memory allocated for the vdev.
  *
  * Never call this function directly; it will be called by the driver
  * core when needed.
@@ -354,11 +353,6 @@ static void rproc_virtio_dev_release(struct device *dev)
 {
 	struct virtio_device *vdev = dev_to_virtio(dev);
 
-	of_reserved_mem_device_release(dev->parent);
-	dma_release_coherent_memory(dev->parent);
-
-	put_device(dev->parent);
-
 	kfree(vdev);
 }
 
@@ -434,27 +428,32 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 
 	/* Allocate virtio device */
 	vdev = kzalloc_obj(*vdev);
-	if (!vdev)
-		return -ENOMEM;
+	if (!vdev) {
+		ret = -ENOMEM;
+		goto release_mem;
+	}
 
 	vdev->id.device = id;
 	vdev->config = &rproc_virtio_config_ops;
 	vdev->dev.parent = dev;
 	vdev->dev.release = rproc_virtio_dev_release;
 
-	/* Reference the parent device, which will be used during teardown. */
-	get_device(dev);
-
 	ret = register_virtio_device(vdev);
 	if (ret) {
 		put_device(&vdev->dev);
 		dev_err(dev, "failed to register vdev: %d\n", ret);
-		return ret;
+		goto release_mem;
 	}
 
 	dev_info(dev, "registered %s (type %d)\n", dev_name(&vdev->dev), id);
 
 	return 0;
+
+release_mem:
+	of_reserved_mem_device_release(dev);
+	dma_release_coherent_memory(dev);
+
+	return ret;
 }
 
 /**
@@ -490,6 +489,9 @@ static void rproc_vdev_do_stop(struct rproc_subdev *subdev, bool crashed)
 	ret = device_for_each_child(dev, NULL, rproc_remove_virtio_dev);
 	if (ret)
 		dev_warn(dev, "can't remove vdev child device: %d\n", ret);
+
+	of_reserved_mem_device_release(dev);
+	dma_release_coherent_memory(dev);
 }
 
 static int rproc_virtio_probe(struct platform_device *pdev)

-- 
2.56.0

