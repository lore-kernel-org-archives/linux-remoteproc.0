Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.56.87.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793575640;
	b=VkZK9kAIk+Hd/CsoAN/Pdk2I4zmOppQ1n7Vs6flUBGfBm6TIQj/RIzZbXQUUDD6XocQs
	 5UR9WmvugQ9RIcWDfvWREueGCDsfj9D/8hYd2kAWgxE2A+D/Fek+omM9kYnnxHYu2P/Pd
	 P2gSNndBa3ALgx//n3taxws/ZqXcyvsRqi77DDMxcv+EEAVph1Dm+yUtFK+3XfzFSv6Gm
	 D7UVHFLa7Uksa2LrdfUFNZ0WXg0k9LcAss2yj8rfC668U6/zG3/eskRP8ZUVXVAJBjTcL
	 vkF1kFtLg9GN6E+cKUuo3dfd92sWLXVYJIiezc2goi9Kl0li0LrFD3bmvFUqMmvN38w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575640;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=LCefTZ3DvEQ/aHEJOq6LQMCUqtge15vKLZo7lvdK1Ww=;
	b=J3oRj6C519lHxJ1aqn0urQs+CUrDsD7UF/7VSvAfTpACSD3yyWLeSrax2nHnOk8jMvZf
	 geA1PNLXkZQSV2Iy+/Q1tBnTalvhFdU/oauFUdj+TZ4oTL2r9AHleZxIPb2qEfHxZrMCN
	 XaLO+nheuJX416K0zKt8ewWtlvigjAuceYMhcX78fcUrcX8zNcI5+1DV5qJaaME6ZJ6rh
	 FQZ1LdKBoHU+eL7n14cEEA8wetrVvjtjYwULiNjc6fHdv+STE7oTiVZhEY457ne/zw9hi
	 7LPzZD9R9q4u4IzzW8SJMtXRxlx49MzMESfxBvvH5mJnNL/6Zx890JFSi/BJkZAL3mw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=08JyT4JR;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=WOtZwsCJ;
	arc=fail smtp.remote-ip=185.56.87.4
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B9560A261B;
	Sun,  1 Nov 2026 23:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71B9560A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=08JyT4JR;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=WOtZwsCJ
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; s=arckey; t=1793575639;
	 b=CEuDOEeQsEQhc/McZB6ft5SLM7ZevZDYZU8CIGC8XxIr74OU9JkK3m0g7Wm6N+q6Sy9STtH9nN
	  gi1OeKLg3N4zUQVz+IN8J2AcuUfSZ1b0vcWElQbS7gitkAyi7ZqgrrBJRKIl4llRA1dTweogs1
	  0rMvojAFuEZoIWVL+H0LerUm3zIFOB7+TwBLYfPTsAbLqIbsJ5OFwjETuT1wzs+no5ZSFrjkhO
	  dYYTNya/N33SU5l+GAajTu51YRBiGKnDNYWEXXPldi41zt2wTl6h2Qtq5UFdXfkuD7mAM8wzVi
	  0MhuP5LGumHPF01ZLnnuFHUK8G798CUoRdpttfc+8HGiJQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; s=arckey; t=1793575639;
	bh=rRnJ3p3OW5d4ywvmFtgBbw5iNIDfFa2rvLbQuPjzuDM=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=fswycsfZ4bVvUM2gbNnWF6zlhsZjkA5yE+Fu1Aep3tiEq7JldaGsU/C4O6zxS2+A/XrNtkm0HL
	  Kgg5TGYr73TP2zqeCMl4sS8UqGvNcTg8v89cNy2SuTjQCq0bLdw879NaL1pqSr4o85/qZRIehi
	  aMk8eFA3nXcXxxShgB2Mb5dHUtpQ4i3Ug8wRy86gujOVfQbXquwxX8LX6UyWtOysedk/BvdjN/
	  pKuefuj+yt0+juKpYfPW4Nr9WYeVVZEeYHsG/fYdQANQt3B0mqT1GUrJmPRRnA18zw7xxD6oeM
	  JuDVKROznaFscT9ZHqfh5mB85p4c5XBVOLlJ88RLO2upfw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=LCefTZ3DvEQ/aHEJOq6LQMCUqtge15vKLZo7lvdK1Ww=; b=08JyT4JRAtS/59yInMI3xxjtgB
	4MF6He0lR9paNf9unmK44o1E7e064/FSrjusZz8D4G/YRPdUtLHut1W22qpBxzIs5DhUHuY39Rld5
	/hBruu271YfQk7J3KRkTS0/dySjuZvCnFaiiaBbRD15I8T+O1iONr/1sozthsDW0g0Ro=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex6-00000007AgA-1KKq;
	Sun, 01 Nov 2026 23:27:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=LCefTZ3DvEQ/aHEJOq6LQMCUqtge15vKLZo7lvdK1Ww=; b=WOtZwsCJJL/61oMgV7xsVatlWs
	lB0Uv5+HaqJkpbKM7Wmg7A84tx+MgX12p9asCXoOjvGsDVQnIgV/0HCJixk4F+CwfRBFXGN0aquog
	dzwbaly/xmgZ8cG/GSyNlpTnJaQcRjDtIPRjZ4nxHSEPNJGrX/R9jr0uv4EL9sihI+BE=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex0-000000002I5-0lrl;
	Sun, 01 Nov 2026 23:26:58 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:42 +0100
Subject: [PATCH RFC v2 05/11] remoteproc: virtio: report
 VIRTIO_F_ACCESS_PLATFORM when required
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
Message-Id: <20261102-remoteproc_virtio_map-v2-5-26b300e01c62@valla.it>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
In-Reply-To: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Francesco Valla <francesco@valla.it>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3006; i=francesco@valla.it;
 h=from:subject:message-id; bh=rRnJ3p3OW5d4ywvmFtgBbw5iNIDfFa2rvLbQuPjzuDM=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+05v4Clysj2flHs7Mhj7fLsCRYrrFvTPHov9Ms6G
 pSoVM3tKGVhEONikBVTZAlZd+Penrnm39I2MD6CmcPKBDKEgYtTACaiHcvIcKGs1ewaj/U6br61
 UanmB7XPHHJkv8QZ+tDlmsfZz50vOxn+lyReqn75aH6MiqfX9FX2n5mtt+y6uLYjwfVOuYnsmZu
 veAA=
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
X-SGantispam-id: d87bcff673b7d520186da37dace53d0e
X-AntiAbuse: ID - d87bcff673b7d520186da37dace53d0e
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNex6-00000007AgA-1KKq-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Depending on the driver originating them, data buffers used for virtio
communication can either:

  - already be allocated from the coherent memory area that is
    accessible by the remote processor; this is the case of
    remoteproc-specific virtio devices, i.e., rpmsg and rproc-serial;
  - be allocated from generic kmem, and thus not necessarily accessible
    directly by the remote processor.

In the second case, the DMA APIs can be exploited to obtain a
functional communication, since they will take care of cache maintenance
and - if required - bounce buffering. The VIRTIO_F_ACCESS_PLATFORM
feature flag can be used for this purpose: with it set, the virtio
framework will use the aforementioned DMA APIs to map and unmap buffers.

Bounce buffering will be transparently used in two cases:

  - if the buffer address supplied by the virtio driver is not suitable
    for DMA transfers, or
  - if the reserved memory associated to the vdev is a
    restricted-dma-pool; in this case, *all* buffers will be bounced to
    and from this pool.

With this support in place, any kind of virtio device can be supported
through the remoteproc-virtio transport, at least from a data exchange
standpoint.

Note that remote processors behind an IOMMU need da == pa for the memory
region(s) the buffers are allocated from.

Existing use cases (e.g., rpmsg and virtio-console) are not impacted as
they are explicitly excluded.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_virtio.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index f1b362158a9c..1496659ddff9 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -280,9 +280,14 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
 	 * All non-remoteproc-specific virtio devices are assumed to be
 	 * compliant with virtio specifications 1.x; there is no other method
 	 * to transmit this capability from the remote processor to the host.
+	 *
+	 * Virtio devices that are specific for remoteproc usage take care on
+	 * their own to allocate memory from the device's coherent pool; use
+	 * the DMA APIs for the others through VIRTIO_F_ACCESS_PLATFORM.
 	 */
 	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
-		features |= (1ULL << VIRTIO_F_VERSION_1);
+		features |= ((1ULL << VIRTIO_F_VERSION_1) |
+			     (1ULL << VIRTIO_F_ACCESS_PLATFORM));
 
 	return features;
 }
@@ -312,7 +317,8 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
 	features = vdev->features;
 
 	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
-		features &= ~(1ULL << VIRTIO_F_VERSION_1);
+		features &= ~((1ULL << VIRTIO_F_VERSION_1) |
+			      (1ULL << VIRTIO_F_ACCESS_PLATFORM));
 
 	if (WARN_ON((u32)vdev->features != features))
 		return -EINVAL;

-- 
2.56.0

