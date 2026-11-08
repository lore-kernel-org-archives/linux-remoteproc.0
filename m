Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.56.87.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794177182;
	b=fGX/+mzRaq9N2XFR+SbSgiPe4Q0jmjXUWLD3eec4I/JIbbc7M4tAaNi5JRXD0JcZSIT7
	 ZBQvI4p7CA1InxEaRdRjcj6QNtABAN+VzUZpw9jY2uWjsKjvlcbNMGrCLNc5YjF+Jazp0
	 EyJ3sGQFZIerILVTDhcouCMet4vCa6+L1chUUXM9mJDwyskjlJtx8cqzjPqvckAjWqq45
	 XBs766TSgz3t86Pvkx9H7FtNqh5pYKLcZ+rN5Xi8JWX/DrrLa/P8elweGWxeC8jizOIgY
	 mfy6sMwi9cMywHonT8zfrYl+F+Ulju3qRzlDbiNmDxKUuIretw5CUY2MMhrEi9uYd/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177182;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=nBCeVFuVDFOOI0UXm7AYD9k1acheA644yWX/1Oy/SZI=;
	b=DPRcZDGkppcMOb3kTC5YXA4BoNmO5FMsEmaCq1jsEsn022KCQwldrZM5z2r9nGhVXSoh
	 jpOgkXy4CUQR5QiQXQA0ubylo2bDIZdF5OYUztpljId1uUn4XySypdGKOF4jzwYTJOSS3
	 Q9UXm0Gee0TpvmV2liLzG9Mb1bt9rFZpZqMcKHUfOlBwEfOH0uMREb39YlSs699DdV4an
	 grayM32+W90XyRPnecxoPj6I82u0cVg74H6ITJ6Wr71suKlb59anKippYDquyrt94CN8C
	 AHgAhelYPRxKzmkiszCGlbXFKp5b7iaDaNrG1hb/6LYxgiebzW73a0q/+wpsfUKc1HA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=Sw28vPOF;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=dEmWOVa1;
	arc=fail smtp.remote-ip=185.56.87.0
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D60606D806;
	Sun,  8 Nov 2026 22:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28D60606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=Sw28vPOF;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=dEmWOVa1
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; s=arckey; t=1794177181;
	 b=aGz+jSxG6AkBEtXMhaDJ5eFRrbUzZSUUHFvrhx8AM86RRlQO2qGA0HeJDhbI/i9+BQdjAJKj4A
	  haqUdGW7P4N12DQyTKERJdmshqRGYiMJ88fxBCk/TUxxYmXmtyIQWZgdx/94JtZhjujPPKDgh8
	  duLM2cXv6kQ5hYmbb+ktgHH+uJGzRn0ENNw2q96bJkOgqIedyPc0UgzMZg8QTcjqEj3iRZ9hzK
	  1hAtb4wSrvHOcJrMtdcu3uUzsmbABjCASLIwJpEDqfcavubysQZWnIRoOz5rrJQqfUpHR4UehA
	  GZ+k0O1wn/nuwWuIZbl+epxCzjGmmRmsn5ve0iqk6zdnXw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; s=arckey; t=1794177181;
	bh=WfqzW8PpYCjvLnLwknpjNzPs2VOYcuG6JF/XhXZye1I=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=o/3iMK44xalGS1q/A8BMkxCKxS8xFcUc01a0hhp719K/jAHvd0mRdTs32CQjZwErunt2xblBPj
	  X/ZJ7CrhFQpQCO5lI3vSR6ErLLCJ8mzS6dGm1FBzmQMredS5ZkK500M6PVXDHyL/XU5VdWFi0O
	  VkQWcuBTcj7uApVpl4v1Hn2wDGjP32TvwsQ5ZJvMsf8BR4UqJvnpg6EefGRBKpXIE40yq7o3mN
	  ZQI0t2EgkZpCe0VRzMKYJ/q9XNi4Raw0AmXFfDDDtAe7FIcApsXczZWIDmVbJ/0cVjhwvHPQIt
	  DxqWBbcHKs8kwBEnrCzuyE0xsMtXzrUiWRo5hPCXp+nRPg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=nBCeVFuVDFOOI0UXm7AYD9k1acheA644yWX/1Oy/SZI=; b=Sw28vPOFtiLVKN/cxRDmH8r0Ta
	M6zJMJHlUNUWUkIoI10FLUrSEurqijbUpCYU9ol8d32Bvb3RwxM2J/Wn6YzhXr6MUq1tOkiWt4OOj
	MDM83MSurLZZLKvACMqc645Xth7X0voEnoY7j06uTZY1JdjR6LKlzl+C6x56mMgy1/m4=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xQBRW-0000000AC0Q-2Xfv;
	Sun, 08 Nov 2026 22:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=nBCeVFuVDFOOI0UXm7AYD9k1acheA644yWX/1Oy/SZI=; b=dEmWOVa1okn24uYg4979OlYa8k
	sNXksBKIxwfJsjxjtu5tm5hP75AuSWrFeU6D8uUve+cd/Ut4NmiqaAPDbyDMWTxtRfhiJdDDP0/X9
	06b8cliPNsi3hT9QVtTA2/zi0jloaXsx5FJpwBQ8TdedjZbKX+H3phGIuLwRiknLcROE=;
Received: from [79.17.15.196] (port=64784 helo=[192.168.178.158])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xQBRS-000000006ZR-1YQg;
	Sun, 08 Nov 2026 22:32:50 +0000
From: Francesco Valla <francesco@valla.it>
Date: Sun, 08 Nov 2026 23:32:38 +0100
Subject: [PATCH 2/4] remoteproc: virtio: Rework memory release
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
Message-Id: <20261108-remoteproc_pdev_decouple-v1-2-3dc2fad4951d@valla.it>
References: <20261108-remoteproc_pdev_decouple-v1-0-3dc2fad4951d@valla.it>
In-Reply-To: <20261108-remoteproc_pdev_decouple-v1-0-3dc2fad4951d@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Joakim Zhang <joakim.zhang@cixtech.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4222; i=francesco@valla.it;
 h=from:subject:message-id; bh=WfqzW8PpYCjvLnLwknpjNzPs2VOYcuG6JF/XhXZye1I=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFkffkys0xDO/Tn/VLa+eMEXJvlzcivt2zwsRKYklF79t
 z5x/YvQjlIWBjEuBlkxRZaQdTfu7Zlr/i1tA+MjmDmsTCBDGLg4BWAiln0Mf8UYpgb/ns5+QW+i
 6ffpt4q+Gr8J+cc+MWOCQu1fL21/X16GfzaF9169ynZ8su2I34Z/zKFrV5TaLit4d3Gtxq2Hj+I
 vHeMGAA==
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
X-SGantispam-id: e46ce223eec65191b54d2ea62303ec52
X-AntiAbuse: ID - e46ce223eec65191b54d2ea62303ec52
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xQBRW-0000000AC0Q-2Xfv-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com;
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
 drivers/remoteproc/remoteproc_virtio.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 7979b2570998..bd4edc89e696 100644
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
 
@@ -380,9 +374,8 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	int ret;
 
 	if (rproc->ops->kick == NULL) {
-		ret = -EINVAL;
 		dev_err(dev, ".kick method not defined for %s\n", rproc->name);
-		goto out;
+		return -EINVAL;
 	}
 
 	/* Try to find dedicated vdev buffer carveout */
@@ -398,7 +391,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 								 mem->of_resm_idx);
 			if (ret) {
 				dev_err(dev, "Can't associate reserved memory\n");
-				goto out;
+				return ret;
 			}
 		} else {
 			if (mem->va) {
@@ -416,7 +409,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 							   mem->len);
 			if (ret < 0) {
 				dev_err(dev, "Failed to associate buffer\n");
-				goto out;
+				return ret;
 			}
 		}
 	} else {
@@ -437,26 +430,28 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	vdev = kzalloc_obj(*vdev);
 	if (!vdev) {
 		ret = -ENOMEM;
-		goto out;
+		goto release_mem;
 	}
 	vdev->id.device	= id,
 	vdev->config = &rproc_virtio_config_ops,
 	vdev->dev.parent = dev;
 	vdev->dev.release = rproc_virtio_dev_release;
 
-	/* Reference the parent device, which will be used during teardown. */
-	get_device(dev);
-
 	ret = register_virtio_device(vdev);
 	if (ret) {
 		put_device(&vdev->dev);
 		dev_err(dev, "failed to register vdev: %d\n", ret);
-		goto out;
+		goto release_mem;
 	}
 
 	dev_info(dev, "registered %s (type %d)\n", dev_name(&vdev->dev), id);
 
-out:
+	return 0;
+
+release_mem:
+	of_reserved_mem_device_release(dev);
+	dma_release_coherent_memory(dev);
+
 	return ret;
 }
 
@@ -493,6 +488,9 @@ static void rproc_vdev_do_stop(struct rproc_subdev *subdev, bool crashed)
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

