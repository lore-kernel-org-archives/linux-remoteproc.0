Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.56.87.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794177178;
	b=zVGoPqDh31KPIS2gLorjCrxcbVnp9M0eWtTcboUY8WaQFEHmYoOa5UHxr3gzTnI7A3t8
	 WYdLtTUFCXlYz1AID+lLiR86nbSKGU9T3UF81bRXmPCVm9QAX6m8gMnvbkrDrLuJ/85cr
	 nlVF8AVT5vS1YiVkxybwhqV9WAwwbyZMxZOdDhJ7TEZiOZy6EfbMAweQLmfVvZ4o5wsRL
	 Swqy7oZ5FpF2hRdcV9uz92DGOqbjUeu+W8W3wwIvi75APp3wo9o5AiMhCJUu3VhsBSHQc
	 O7mlFi7Iw6hNjTyC1ZrOFsPGmj6jryIxCzZ2B16Uvi7nbjsMm0UOtThs05TS7fGRNsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177178;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=WRHW7OfwOtrVaG4kbVFBAcMi/9ykLs61GfyArUFuhNI=;
	b=nYv6wRQj+rOrI1Zq1DN8v50iCg8YS4rqyqqsuhlZ7BObXkqfEFDbqe5IUoeu2u4f4E3G
	 NF0DFBK4OtKf5AMjWvFI853Kc5L55fvQsFBmIwEvRAaNC4y5gncFFnj1yvF2kdwMW0SR1
	 K7TATGoyn1CrS1/uJgP75sDdLDtxwH4lh5yNsES+iF7X27RRzZz7rX5SAxUSKBU4z13jF
	 a/VNcJ3qYYzdTgklLwP2+e06h/yax5JNKgAok80ISiCr+LTYOltJqFRLsCtAm6+Vjt61L
	 fJY/qx722YNRRcbjNFooW3xKDEa883B7wEJtZoLIyrC9GgsjVmLkAaLyPr2xj0JodaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=YgyiUEUF;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=c8ZAU+Wd;
	arc=fail smtp.remote-ip=185.56.87.1
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EAF606A322;
	Sun,  8 Nov 2026 22:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2EAF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=YgyiUEUF;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=c8ZAU+Wd
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; s=arckey; t=1794177177;
	 b=uw/06T+FB/hhhu3F3VsW1JCwg2xy9uFvHp8TTbdLBmTd7lgUWDjrQkOVq317Gp+p1MoJCg+vjl
	  H1IRvbS4C59iffbUDhZ3pde/dfuFmj2oDtfR4unJWfhyJEwKSD53iJlc8xb+jZyw7WA60CpSBM
	  MgEf0q0hIBqkl5bWE8gsMc5QmiCOoG9DOalKptSJM1Jng4lEx6kyMkXPzaC+WFUIvUqlDwar+E
	  p0zb+9g5RghOT7gtOhaLBPaVxQrzWuk3VgbtnBOrQEWiYMWoTMn0sLGcClHolale7Rq1uRloe7
	  0TEHJqrSOtSS2RH49/Sl04pYaWNtpQyWsjs2DBULJNmbrQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; s=arckey; t=1794177177;
	bh=rjVLmUUiHxAzMNkGhv4xFjstbVFQt0X08F9KitRL648=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=SLA0uajj8auEaJz5BGamByw8vgaMVZ1hC3IwcL1fanLFIoqDPNT+GD0Nw3bBSMpQ37FN0RnIB+
	  CiKAesOdDCnaWQZ/skjn5BIGwW3PDuWYDmx1udkP/ANHjbJLZQXGAlElqtabZV6XLN7AAcbmxz
	  D/WV3WWveyOmBSnsXnXYbZ6VsQcPcERtvwto9sMqJjXWfFWpHCwAu1tRICuxACwAN6L88T6VMY
	  fRpMrsVgtbmtdVRPkL492anEt2fg2vMr04RYWlNmPPojVpaqD9YLesdcMuooLKg4rbgK/2tRSh
	  mwga0jG7raYmy1R3AILPSnzOiN0KPZ9T3Y+vT416iRMcAA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=WRHW7OfwOtrVaG4kbVFBAcMi/9ykLs61GfyArUFuhNI=; b=YgyiUEUFly3v+S6eZpJMnT+3Rq
	M8kiVgKzivhE8wzE4uwXKGWajbJlPR72oQWX6Suc4YFn2U34sxDcOWFKu1Iv9u3Bmh9q9SST7L9OE
	l9km874Bqu9507/V99I5wBpW1wSRQojBX1qy92OaKBNB9V/6mPTVoUcv+aXUw/fOXnvc=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xQBRX-00000008UKo-3LFb;
	Sun, 08 Nov 2026 22:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=WRHW7OfwOtrVaG4kbVFBAcMi/9ykLs61GfyArUFuhNI=; b=c8ZAU+Wdb7xwWWkE9iA/a/op7G
	pZrKfIQohRtip1IBTUPPY6fGCDw1bZ2k4PyywmNFBFIuzExwvD3+kWupgr7r2feOSCB+t+mSnDpvl
	YkWzBlxc2Us16SU1ydW6k38PSCWQyLjvenSIzYHv3F5g8dQ8WWca0Uf8OoqjSkRKib5o=;
Received: from [79.17.15.196] (port=64784 helo=[192.168.178.158])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xQBRT-000000006ZR-056b;
	Sun, 08 Nov 2026 22:32:51 +0000
From: Francesco Valla <francesco@valla.it>
Date: Sun, 08 Nov 2026 23:32:40 +0100
Subject: [PATCH 4/4] remoteproc: virtio: Stop de-referencing pdev from its
 children
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
Message-Id: <20261108-remoteproc_pdev_decouple-v1-4-3dc2fad4951d@valla.it>
References: <20261108-remoteproc_pdev_decouple-v1-0-3dc2fad4951d@valla.it>
In-Reply-To: <20261108-remoteproc_pdev_decouple-v1-0-3dc2fad4951d@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Joakim Zhang <joakim.zhang@cixtech.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2739; i=francesco@valla.it;
 h=from:subject:message-id; bh=rjVLmUUiHxAzMNkGhv4xFjstbVFQt0X08F9KitRL648=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFkffkzkneLtLBc7IXrS0f+x0tlfZ5+29D79IX7Dd/XJq
 o6S1xSrO0pZGMS4GGTFFFlC1t24t2eu+be0DYyPYOawMoEMYeDiFICJqGxmZFhoOllh9TRLly23
 dqdsyvipONsuXd7t1YH97CWrRJkm5LIyMrxau+P4KRdhbTGzHU0JPgzaFwO7vC+ujPxmzfSf+ab
 RclYA
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
X-SGantispam-id: 97eaf25217a6835ba8093bdcccab0f5e
X-AntiAbuse: ID - 97eaf25217a6835ba8093bdcccab0f5e
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xQBRX-00000008UKo-3LFb-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com;
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
index ac0103a5c261..4b778720d478 100644
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
@@ -482,7 +482,7 @@ static int rproc_vdev_do_start(struct rproc_subdev *subdev)
 static void rproc_vdev_do_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct rproc_vdev *rvdev = container_of(subdev, struct rproc_vdev, subdev);
-	struct device *dev = &rvdev->pdev->dev;
+	struct device *dev = rvdev->dev;
 	int ret;
 
 	ret = device_for_each_child(dev, NULL, rproc_remove_virtio_dev);
@@ -509,6 +509,7 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 	if (!rvdev)
 		return -ENOMEM;
 
+	rvdev->dev = dev;
 	rvdev->id = rvdev_data->id;
 	rvdev->rproc = rproc;
 	rvdev->index = rvdev_data->index;
@@ -527,7 +528,6 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, rvdev);
-	rvdev->pdev = pdev;
 
 	rsc = rvdev_data->rsc;
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 77ea0e1067e0..f3074c69098f 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -347,7 +347,7 @@ struct rproc_vring {
 /**
  * struct rproc_vdev - remoteproc state for a supported virtio device
  * @subdev: handle for registering the vdev as a rproc subdevice
- * @pdev: remoteproc virtio platform device
+ * @dev: parent remoteproc virtio device
  * @id: virtio device id (as in virtio_ids.h)
  * @rproc: the rproc handle
  * @vring: the vrings for this vdev
@@ -356,7 +356,7 @@ struct rproc_vring {
  */
 struct rproc_vdev {
 	struct rproc_subdev subdev;
-	struct platform_device *pdev;
+	struct device *dev;
 
 	unsigned int id;
 	struct rproc *rproc;

-- 
2.56.0

