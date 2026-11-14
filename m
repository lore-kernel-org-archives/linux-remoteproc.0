Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794643622;
	b=o7A2GvTOnHzdGe4ICexJGSVNM71oP8w0xg2HreYguVev67U/PMU1f5ta1sajMx2EbhjQ
	 iNvUT3GcTxGYF6Cs9wnm3IvQO51wUiQ33NenNiAbePUSRL2gadMt0woIn8rKf92E/txxa
	 x2AKdlUsy3rjb2TOSgEN2c+04BDlM6KD1qVvIMK7u0ZDw0ujhp29MGa5MwdlN/t2jZegU
	 MgKasekBwrHFFhgmzXxoV178eBr6Jv7h90sZexbh8uJpeHQbakglDtaCyEa1iGliXtsMI
	 y8UupP8qQ9Bco1mvMWfpM6lL2KUR+gYrMISPs62YcIo9hGKICkC9oD3yt99Sj1hLWFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794643622;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=dVOJclEO0nq4VtFdJTEFvMW9h4czsifYiMpIt9oGpYQ=;
	b=nJoKtd3sAfVFTAlhoml7lgzFAtN0aKjV2l+PCdK8s/B/Tlq85Lsk4pDbojG/skPZg7aA
	 hA9Nju4uoBzz5yrrZInpNarQ41Ky8fH7bGhADGi5dEbyQJCbLiEqTaIfbhjU0xXDXt05j
	 FqRs4O3xf/L2EafuTXzZF0zP8Fk9evaJ8ZMbjig4H6W++oEdPFp5fRnvXVMwACcIQamPr
	 UsLBh1XJo45NHq/b/mdlo/tNScrKYeuubXnAN3G3BhpziGoXVdRmVsOCK/oCB3ISVxXaX
	 W3najaPnBwAWanq8ky4jhFdQ9JqucOudxfRCBV7s39TbpVpE6bZIV64P2YICvySJzIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=kKTyW6GO;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b="ldovF+u/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.11
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC39606A334;
	Sat, 14 Nov 2026 08:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EC39606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=kKTyW6GO;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=ldovF+u/
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com; s=arckey; t=1794643622;
	 b=IrPkxnJKMbO+6cUCbgGxQ1IBa9vGxePyIuPcVPQWaXpchZ2gnidBynJWAH/yKf8HY6/buqgBlI
	  QO5+TL7JY3/q0bHQ7YwMnONhFZ2QhfaVrXddhrteulGSQjDGZ68N/GfUjpU5RHmOZJubbEh4Jc
	  6vw8chGsN/2ECvTOe4XYE9OHcOyNnETAmwGDxs/iFVHG85a8K3GUyMgqDrwJvu+l7THfQXoDYG
	  YGS1y6tNDO+Iu4siiysvm4KdF2snrLtqKlpDEiz3tCOSVNupGtJsaxISKsyqJ0D1tksQgeGEbk
	  5+a7epxtrDBV1je/D1qVo/rlSiFT9ZpH/QwTrdw0hO8gBg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com; s=arckey; t=1794643622;
	bh=h5c7eVfOZme5+IN1di+tlBG6wqlLPEk4OuSif1Mxggc=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=Q/DLc0JspVEAeW6tCDZviqDovSMPyR/V5dtPhUSNiZyvyYZqe1IUTtVe1b4mSAzjZ2mCTcu9JP
	  LhE6RBRarEEg53ToaUMQz01fAcLEJGQBzWfjhvygc59QE2qnsrd69PndSmAAPBWZ1penXsOV9o
	  I2Oj5AQM+L2La+RuWhKEA2VN3F5S88BZiSlZVVENTkuwdpcaPtHE0CeK782wQGt03juCQFQQhE
	  dUdwsJM1LHzxCwuRC1EVs0xcGiuLSekhvuXClDtEeEyl+q39bF+/fEQ4ji3OQNu6LI5U/zkgo3
	  Tn4zFOt6AlV3LAHdg32kENjlmRFwEqiaCZrtw1PuehLBbg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=dVOJclEO0nq4VtFdJTEFvMW9h4czsifYiMpIt9oGpYQ=; b=kKTyW6GObrnQuYZp635JW37tKL
	O5QXJLSuqA5nIbPsYiMHtpYvy4aRI/3rRk1Lri6vrVtTlZ5d+8f+Cz0NbqBqH8ovuZSWprJryFK6L
	jafbwOFP746EYuzahUu1mFSkDNoTGApBj85UMAnoleysm4BK62wuJ+h+iwBCJjSlM14Y=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xS8mq-0000000AtQh-0YuM;
	Sat, 14 Nov 2026 08:07:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=dVOJclEO0nq4VtFdJTEFvMW9h4czsifYiMpIt9oGpYQ=; b=ldovF+u/YJwujFsHwy220CPh/Y
	wEav9rK4wu2JTFP9KoPYZRjti1OwQceXXJpJHjYEeNlvdRX0IUXXuJkXGA6tE8V/g5JYDmoUAGuhz
	QhByNTCfxNMSTZn/Y+fp+h7zZaGCRo8a7Zf3uqRCbLwMWQZgW1cxkwiey6vA1NHMvfpY=;
Received: from [95.75.15.255] (port=5068 helo=[10.167.111.42])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xS8ml-000000006Ml-1qJD;
	Sat, 14 Nov 2026 08:06:55 +0000
From: Francesco Valla <francesco@valla.it>
Date: Sat, 14 Nov 2026 09:06:36 +0100
Subject: [PATCH v2 4/4] remoteproc: virtio: Stop de-referencing pdev from
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
Message-Id: <20261114-remoteproc_pdev_decouple-v2-4-95235dd056aa@valla.it>
References: <20261114-remoteproc_pdev_decouple-v2-0-95235dd056aa@valla.it>
In-Reply-To: <20261114-remoteproc_pdev_decouple-v2-0-95235dd056aa@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Joakim Zhang <joakim.zhang@cixtech.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2739; i=francesco@valla.it;
 h=from:subject:message-id; bh=h5c7eVfOZme5+IN1di+tlBG6wqlLPEk4OuSif1Mxggc=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFk/xOZM079Qeu3yzJ3/H39bcOvZh0eLy3pnS14yDwn2E
 2F5sWP2no5SFgYxLgZZMUWWkHU37u2Za/4tbQPjI5g5rEwgQxi4OAVgIltbGBmO7GcTjwx8X1rM
 5vjwcmnsyqIWFq4a14dzHXvuvZzysGcuI8OyqbULGFLMwq/LzbJdd0GLUVKPa7bNYaU1F44qa74
 4U8YIAA==
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
X-SGantispam-id: 1b25e59f36ab2a15048c4ffad4c00a8c
X-AntiAbuse: ID - 1b25e59f36ab2a15048c4ffad4c00a8c
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xS8mq-0000000AtQh-0YuM-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com;
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

