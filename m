Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795816157;
	b=KShXkhmB87GXg+gzSi8kqBTPteSIBlhViYmUQYV9VCU4/NucTCVV6hk+IKj2GMPkcM0L
	 m7pH1ZWo7j//hmbepC5CQwuk2BlEI4YPdaPKIIViwPe0urEUvGcp3HUxOOXTjefElebmC
	 I9E9AKmQmTeBiyL9iL0B/2qTHgDqwSTS7+vIpCFmquaYHZ9laxtOv/KT9ypt6vJiCrWP/
	 a7mOM6hYQajP4QI2cE5M1dzpChBObDcoDpl1YXcOSYX4DOgqIQYFeQ6RZauKv6eXDwymZ
	 2LzftFcw+MBqI9fMiugvtnDAYPlWdvrjQDGaShI2WYEfhegSN9jIaQxe/rvio4rojVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795816157;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=ijyqplWidGNnctH2VKTED9FcK0iiFiboor21pDZD/Po=;
	b=HtZZed13HZXPAKVAWjjwSAXCkOM/krsuBUT0MlS0H2UXAcMWjrCQpxT+bQ1y5In2eqk7
	 nDQNud9R6XqN9NnDa0lL3s+Afm7nEFJhqJThxmeyS9wgtu5yw2WFm+kHsJ2yJiiPHBchb
	 jAkuG1RL5CdhmrZ/LYywpXWZTrRGPz4Kwfompe43xieVQoU29k06gnD2LePZ1F2iL8V1k
	 LEq6cRgFupArl8z3U/wm7J0erC+JzR1haH/ABxYd4F0mp7sJ1ZhgNAAqMX/h7vt98+LEN
	 VfkVrak5jEVHZWjucQKFLymikPq4zvnVIZ3QI+Myykak0S7IvtozDIP8saK/93xghUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=2W+qRPPc;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=iDZ+C2mP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.0
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8BA606A330;
	Fri, 27 Nov 2026 21:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A8BA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=2W+qRPPc;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=iDZ+C2mP
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com; s=arckey; t=1795816157;
	 b=YzmGpZOFHpbHmCoSGd4UO3ucMkuMvsmHDjFymVm63Mj9iQwYPxdrrW9zyFCpWZ2Sc7/u8yR+N+
	  L70ewiWrbv6Ul+aLK2BYSA5azm2+K1aqC7d0hhq1ddFJ7wuUvOoYF3hQ3a0jW2ztNRwo1Og57u
	  398MPjK0YXccGC8RN8MyN1UE9fFtO2G2x2Z/kRwtXZYVwNp/MJ7kbr0u6fwTz4bgesO3NFIEuq
	  oYjaToIjJ5tzMSG92pC2qARmktDXSEDARcabNy7ggnQCoXEeFO8jYaMnJtj32ZWB6LfrNOZPHz
	  Ou4m1OdwmjVtt+ikktXDRZ70vcZqolCaMxNgd1qcIPMFSg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com; s=arckey; t=1795816157;
	bh=JnVC585seFKbRglL/qrOA5ykrOMoja3NqYt6DUYcFY8=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=ds3ZhuVxOGjU2eshLAeh82aKjHAV1jJskEsVZLvQ4PraQWTlJPtvK8pajXlXEkriSWreIc3Nxt
	  +eTvoDE2YdYqL+VKpTNV7bfaWtNfAGXG2vMJGBSYjPRn7lgtCzU3O6Cjn3nFHChLluEKyW3lgg
	  fkQdfib3iovhA7Dk/VRYcszGQjyYDSW4F4c8qCnGT3qGXcrkBEQX6XRO2t7TZXW30/AK5z9nfc
	  h17AGITTOk+1/E9gVfAfLuPhoC9Qli6j/B5ZMRk/nj+CpxeNaM/qoWdvLBKMn+KxBg6iGKbrDZ
	  JJ71X9SXM3QQP4NYpyWHXRIuesZAThNr+wHtyMYBHchZIg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=ijyqplWidGNnctH2VKTED9FcK0iiFiboor21pDZD/Po=; b=2W+qRPPcDoCYn/oDCCuJJMwvud
	nBauz0wD0UWInGnmqbhVHvn2oI968EFYAFOOuIvUsibxEW3oaMqdp9up5RM8UjMT1iLM9yiiC28qf
	U3oJoHsz92FS0KHvhQYD9XH3p73VWkAJqKuS9VklfCTngmr64i9O/z5XLJrpXo0mpcaY=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-h034.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.2)
	(envelope-from <francesco@valla.it>)
	id 1xX3ob-00000006vPT-01RO;
	Fri, 27 Nov 2026 21:49:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=ijyqplWidGNnctH2VKTED9FcK0iiFiboor21pDZD/Po=; b=iDZ+C2mPxYNbZ+5h8XWh9F0Qli
	itxplzNR608ZgPe4i67lX722uXOdu/foOVQ6HAFsFovmTKI+rLxsidyq6fTrgpumjhvyMNc1U5cq4
	M2G3pxv0f6MaR8u+FqIWEE8USYULnwpLBznc1xfJ5AbGlnJchn2Tf2lC0pvfQW8NGpbc=;
Received: from [79.28.115.6] (port=64199 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.2)
	(envelope-from <francesco@valla.it>)
	id 1xX3oW-0000000056N-1TPB;
	Fri, 27 Nov 2026 21:49:04 +0000
From: Francesco Valla <francesco@valla.it>
Date: Fri, 27 Nov 2026 22:48:53 +0100
Subject: [PATCH v3 4/4] remoteproc: virtio: Stop de-referencing pdev from
 its children
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
Message-Id: <20261127-remoteproc_pdev_decouple-v3-4-28f245622129@valla.it>
References: <20261127-remoteproc_pdev_decouple-v3-0-28f245622129@valla.it>
In-Reply-To: <20261127-remoteproc_pdev_decouple-v3-0-28f245622129@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Joakim Zhang <joakim.zhang@cixtech.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2739; i=francesco@valla.it;
 h=from:subject:message-id; bh=JnVC585seFKbRglL/qrOA5ykrOMoja3NqYt6DUYcFY8=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDNmcv85NnHuU3+O9bcYvn2l6ygsTeV8y7Ju61Kj1vfrZl
 X1BL/bt6ihlYRDjYpAVU2QJWXfj3p655t/SNjA+gpnDygQyhIGLUwAmcvQVwz8d2a3FL5hCXxae
 Mbtn6rny+OyP36stPsdf7ZXh+l9Xf8SZkeHrvqOLWOKt0o6cTSpz/jzhzm69ip9c/J4HrQute9N
 n/ucFAA==
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
X-SGantispam-id: 04877c0fb84c1fd293d090a9f18eca40
X-AntiAbuse: ID - 04877c0fb84c1fd293d090a9f18eca40
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xX3ob-00000006vPT-01RO-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

The struct device underlying the rproc-virtio platform device is used to
perform some operations during the lifetime of the rproc_vdev. It is
however no longer necessary to keep a pointer to the platform device,
which is not really used but only de-referenced to access its struct
device; a pointer to the struct device itself is sufficient.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_virtio.c | 6 +++---
 include/linux/remoteproc.h             | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 403519e78ee3..16c48ed45b48 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -368,7 +368,7 @@ static void rproc_virtio_dev_release(struct device *dev)
 static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 {
 	struct rproc *rproc = rvdev->rproc;
-	struct device *dev = &rvdev->pdev->dev;
+	struct device *dev = rvdev->dev;
 	struct virtio_device *vdev;
 	struct rproc_mem_entry *mem;
 	int ret;
@@ -483,7 +483,7 @@ static int rproc_vdev_do_start(struct rproc_subdev *subdev)
 static void rproc_vdev_do_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct rproc_vdev *rvdev = container_of(subdev, struct rproc_vdev, subdev);
-	struct device *dev = &rvdev->pdev->dev;
+	struct device *dev = rvdev->dev;
 	int ret;
 
 	ret = device_for_each_child(dev, NULL, rproc_remove_virtio_dev);
@@ -510,6 +510,7 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 	if (!rvdev)
 		return -ENOMEM;
 
+	rvdev->dev = dev;
 	rvdev->id = rvdev_data->id;
 	rvdev->rproc = rproc;
 	rvdev->index = rvdev_data->index;
@@ -528,7 +529,6 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, rvdev);
-	rvdev->pdev = pdev;
 
 	rsc = rvdev_data->rsc;
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index ac14c3877315..d8a2eb3eb4d8 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -354,7 +354,7 @@ struct rproc_vring {
 /**
  * struct rproc_vdev - remoteproc state for a supported virtio device
  * @subdev: handle for registering the vdev as a rproc subdevice
- * @pdev: remoteproc virtio platform device
+ * @dev: parent remoteproc virtio device
  * @id: virtio device id (as in virtio_ids.h)
  * @rproc: the rproc handle
  * @vring: the vrings for this vdev
@@ -363,7 +363,7 @@ struct rproc_vring {
  */
 struct rproc_vdev {
 	struct rproc_subdev subdev;
-	struct platform_device *pdev;
+	struct device *dev;
 
 	unsigned int id;
 	struct rproc *rproc;

-- 
2.56.1

