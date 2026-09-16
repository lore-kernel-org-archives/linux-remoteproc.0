Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAA74E1C9E;
	Wed, 16 Sep 2026 21:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593098; cv=pass; b=RxB/CN2O/FoFx8syYWYLP6KzuyRdxfJUz33U2qWc0eHdc6DXy0LMRDALhvmt9+iu3pdFzR7tgV47Upb40IFx1Y5lQ0+pnslgcszIYywJSnEBJxC4S9oTYlYEGKHrmyaMIgtYz9yzzjwYI/AQH0Db/NGXbzWaMlQDxli89Ae72Hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593098; c=relaxed/simple;
	bh=4K/BQ7Jjv90QPg7ueeHHowYL8JOzF3baJD8cfzWYIS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HPZEJN9SmDjZuw+FY1adhB4LsbC1mAzax3J37P9h63A5G4kjTZYsfTSF04IhL1Q0ZEP6iY9p0s5aWm9sBB9tyTFwxqkopJmixYLg8u6NzIwMOdtzXGMaVkzX63+0ku3m2UMdJV1yrYb6AELSNu6bkT3nojARIOufjV1Jfq5UXrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=ulbYDMpg; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=c4PgO7sr; arc=pass smtp.client-ip=185.56.87.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="ulbYDMpg";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="c4PgO7sr"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-h0bm.prod.antispam.mailspamprotection.com; s=arckey; t=1789593083;
	 b=XOCeX2ovEEY/W6Ckm3codtTCi2zsswKAsirV6mDYreHxZftIXJ+yiL/U2JWd3fqWVsuCHoWQg8
	  YSDUFM/Gt6lhJ7a+TDtDadgUPXhfCconwUfdNV75fCnf90YZMGU6MJia/E/SPdMWAccWedCAaC
	  lEpwiVRnWZcXf3ThvrjhhG9KIq4yCnf1pK/j3MivtRO/85sF2apntwjqPcr9GAMq6snWFuX+iB
	  DR2VK5qvsHNdGf2RGgd2s09tw2O/cRX1pWB+299B5HuTOkC094GBC3/xYt81HnT7F1KCZ7jBw2
	  jVWaPJk7HYjEtGME4aj51aD2afWDhwYU/IRruaGUGg2scA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-h0bm.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-h0bm.prod.antispam.mailspamprotection.com; s=arckey; t=1789593083;
	bh=4K/BQ7Jjv90QPg7ueeHHowYL8JOzF3baJD8cfzWYIS8=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=Cqy5Q2UGLgReN7SgJY4SnE6CQmd/6lFj0NaZ7xvnCR8GFuHfFNTnldNqx3dsxOvC+VcI2WihYz
	  ueDHiTpNBCPmSy89HQHGEhU/l6nE+23NiGJTEdR8Dg+kRkIh6JsV88X7N10JJMX9sq1MzbTfHx
	  NPMth0L3JtUQLc90f5XT2XM5WO634SgJOGp0RvZ+Ggb8CLK6vMWHOZN2zJz4sWnQzFxeg3TqzI
	  r3HHJcBooa2Sg8GtVV/mIOjPLKgIJVL9VwBM6yAelCX1f8Qoi9YIc7iEqWZOxN/8z5/56tPbVb
	  rHATipXPXMz/Fj03KoIcHR5mWLXhxz1tLgL1yynM/iAAdQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=JyasnvLYTK4E6U/h+Yqi9jiKL9ObrEvgOlp1gRjyPL8=; b=ulbYDMpgOlYGm+WXUJfu0lrUTU
	u8CfrRGXw+KSF81ZhODISHK1S2ZcnBUVtKL4YVKJpQ9ZBnOex9Olyjpx8FsW4a1uih7h4oytsfb8z
	ctDeH+XoV22yqLfQpT42snGDlEMnkGpBbERwzobtyNLS/gFqjmqM0yBd84qW9U1v+lF4=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-h0bm.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuL-0000000BhgR-0qSD;
	Wed, 16 Sep 2026 21:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=JyasnvLYTK4E6U/h+Yqi9jiKL9ObrEvgOlp1gRjyPL8=; b=c4PgO7sraeZ6twB3Jr8Upwq0PK
	B2/pfEbBD85NwmHY2I4Upi28D1wuDMVDanGe/epoqjgEnx47pUUTnYLPnMR2byLBKXDyQY5S6LD+j
	DFBlfJPm0j00PG/wuV7P+OSnCFRfyeP1kB/PWJvKlaoyWgjOPjc5ii+zcjml9SWXgCEI=;
Received: from [95.233.221.121] (port=62880 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuG-0000000058P-19pe;
	Wed, 16 Sep 2026 21:11:04 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 16 Sep 2026 23:10:47 +0200
Subject: [PATCH RFC 02/12] remoteproc: virtio: replace commas with
 semicolons
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-remoteproc_virtio_map-v1-2-dac8c5eb4aa9@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=899; i=francesco@valla.it;
 h=from:subject:message-id; bh=4K/BQ7Jjv90QPg7ueeHHowYL8JOzF3baJD8cfzWYIS8=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFmrWR/rnMl8vO3aGtb6y/OEn2rxdJzzM7exMKm6tXLxC
 bm+JRlhHaUsDGJcDLJiiiwh627c2zPX/FvaBsZHMHNYmUCGMHBxCsBErhQz/E/gOxz30inzhpvu
 q8gfmlN569/ayrydfez+gmuS1/9uYD/H8L/+VLqCLMOmo7ota6dJelz//NBa0FQqtCDXx/c869Y
 9NzkB
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
X-SGantispam-id: 94914b4df39ecb6c3d772bb91eb71bc3
X-AntiAbuse: ID - 94914b4df39ecb6c3d772bb91eb71bc3
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x6wuL-0000000BhgR-0qSD-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-h0bm.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

While not technically wrong, the comma at the end of an assignment
directive can lead to nasty bugs. Just replace the two occurrences with
semicolons.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_virtio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 096bcba527c1..4dacd93bf238 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -433,8 +433,8 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	if (!vdev)
 		return -ENOMEM;
 
-	vdev->id.device = id,
-	vdev->config = &rproc_virtio_config_ops,
+	vdev->id.device = id;
+	vdev->config = &rproc_virtio_config_ops;
 	vdev->dev.parent = dev;
 	vdev->dev.release = rproc_virtio_dev_release;
 

-- 
2.55.0

