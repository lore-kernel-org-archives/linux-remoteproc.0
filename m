Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795816157;
	b=n+/MZdQHx4lKaohDlgObKZ+O/lRDhhN853gzlr/qyHSW0xdsD8YQa2XqYiahk8v8JAyz
	 N+is10SKzua7hhXRlp/jV1EumoNiH5f3a9F5TTcbj5wsAjJJRVkNWzEUU2LzuHhw3/nv9
	 dVHQmRKQkz7s2Z2fKdkBGqWebVZa617cZ89MEDhut2I3PdAcxvU5ojPz70+PQF8kJJdcO
	 JBluG8zgl0o72jrmPmeASOhDuBNI8UGwwouYiVTo0UrSaWanWgWQLU9YmsjgTqCgHF+JJ
	 bI/tYzTJtHfJnBvp47BD3JvnuTr2RCqf0KPqr2++RZ100qGSeaZYLnH1AkFrGN82YHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795816157;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=RBs8h3dv4xxWQMYbUTd1ZJEPluiilhem7hy+ByV7mZg=;
	b=xGNvHcxTBBaBX/B49b6BwyTcj3hejqrKRZa4+DqPNh23AOPmCx2voNNMtoKsJHIjb+e/
	 MmDcsGLpsNNahWrAQ157QDrtzpWj4m3RBCvMtlZSQUPXCrLncMD9Xa8/VP5Q61fCm0NLW
	 KFQ/Za8FM0rdFc2IgBwLQEUIC6Q+balK4DsnJNdcQd1U9hcjtKqZ5yrRsnBviTViY9t9I
	 /GjOW17UCc0KBi0EvbpAkO+uBvzASsuCfi3+4HEM6r4styRyPOErB5DK5x6IjZ/qbiWgg
	 v/RiHILVBJMTwxDUZdRV2wFwa/wOXQ9d8Ifmqs47HMlXHLsttXS1y1ElCi4x0ioOyyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=J0kiQd9u;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=vDbLV6Jy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.2
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817CB606A31F;
	Fri, 27 Nov 2026 21:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 817CB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=J0kiQd9u;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=vDbLV6Jy
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; s=arckey; t=1795816156;
	 b=R1Y6JKmg/YxbqVgqcltDdLp9b7SeVTMHL8EoUS/9mjUQd1FZTj5pTo54ZC6o+vb3kkZmZoP5od
	  uHmJkZJyO+uzrfDi+gU8jmBdrHMwE62enGTt4CvIOiTM/fopqo1L5Pjn0PBm/qYeE6k0wjtMX7
	  4ZY8fLbgHd4PiFipjoRr4Zu0IsFbzv9vrqnM6Q9/UwF7ec6zqtRO2r5BfPRDYFFp0TVjF0+lHU
	  rg+Uk8HkRD3lGDF79MdvGp8F2BtK3su12+sK947NpsaN5cHOHXdN+C5OrDbASonaCufFbQBSo2
	  tZxvUvdE0OfovpVe/P9jttB461asPqO2rhJ7OOpGOKfCpg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; s=arckey; t=1795816156;
	bh=Ob4yTAVBH2WA3jsLbxD/+DDVzvf9gCHss2dhZxEqVGk=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=rB9VXJRqbn5LsjCp7G5Rjj1k+sIGITuI666DZje8Lr3sp3SxLAH0/rN5VzRNxQNdIN1FitXki5
	  XvLXc0PQMKhrhwp8I2YIJaSGDn486+1Ng1mHjtmZBVOxq4as1Q5SP6yDEWi/ZzbEMPA8q8KFIQ
	  lubNHs7q8XuhRbYomBugSeI+LFN4I+Xi8AuJuujZRrvvWoGFHNFGrmmDZ+1c/TpAKnVO7ptFfk
	  Kc8H0+IDNRtLb5208kKtD/g1/DTpC04UAw89BuTWtKVhEE/WhEWpMTDVoE/nw6IoAeC2xVRhDd
	  NhUqP0ovTtUz0VcMJ/1tfpuEYJbJFHjqxoisorcXVFU8qg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=RBs8h3dv4xxWQMYbUTd1ZJEPluiilhem7hy+ByV7mZg=; b=J0kiQd9udQgKYBQx9sfzhIi41q
	HQmdKPjEqdWsrfLRqfXDOOq+cnnKhkmo4Ehk+LoIOv2pxzPHw7ZBZuxFbZUO1ukY/AjLe9RR4zZwr
	oOXgoQr8ZnPMkZkuMTar/3RrmVRbxruUNsRXb8hUJn1PB7uewtUTYR0vXzR/HBTLStU4=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.2)
	(envelope-from <francesco@valla.it>)
	id 1xX3oa-000000074yt-2Dj9;
	Fri, 27 Nov 2026 21:49:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=RBs8h3dv4xxWQMYbUTd1ZJEPluiilhem7hy+ByV7mZg=; b=vDbLV6JybLPiaJJfsTzdxhkR9+
	KgbU5zAaBybSHoJ8JFwe0XGrms4qm2IfwEl53EV2pCloj9fQca6MMJq9jJCSWzdgC66VnWEhsY0Ib
	5dLIV5eJT2gSMmqS+mwiaIK8z1omK9w7EBnFu0F4oaDak7CrpcQvdMpQDi6v7PMbC/1k=;
Received: from [79.28.115.6] (port=64199 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.2)
	(envelope-from <francesco@valla.it>)
	id 1xX3oV-0000000056N-2TEb;
	Fri, 27 Nov 2026 21:49:03 +0000
From: Francesco Valla <francesco@valla.it>
Date: Fri, 27 Nov 2026 22:48:51 +0100
Subject: [PATCH v3 2/4] remoteproc: virtio: Rework memory release
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
Message-Id: <20261127-remoteproc_pdev_decouple-v3-2-28f245622129@valla.it>
References: <20261127-remoteproc_pdev_decouple-v3-0-28f245622129@valla.it>
In-Reply-To: <20261127-remoteproc_pdev_decouple-v3-0-28f245622129@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Joakim Zhang <joakim.zhang@cixtech.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3454; i=francesco@valla.it;
 h=from:subject:message-id; bh=Ob4yTAVBH2WA3jsLbxD/+DDVzvf9gCHss2dhZxEqVGk=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDNmcv851dKVcun/2zeXjxxqmqJU9KurdfUfjdkIOt8iET
 QbvjwXbdZSyMIhxMciKKbKErLtxb89c829pGxgfwcxhZQIZwsDFKQAT+fqJkeFerufZuN8X1957
 4LYmO/fQmYefXn0MfFKlyMzlt/tmjVACI8MmFqUvby7MWGW8suju7nVO1iGrVGe8UfBgYtC8M7/
 w7H0mAA==
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
X-SGantispam-id: 264f1d9a0104b3bb8ced44d98e21a082
X-AntiAbuse: ID - 264f1d9a0104b3bb8ced44d98e21a082
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xX3oa-000000074yt-2Dj9-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com;
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
2.56.1

