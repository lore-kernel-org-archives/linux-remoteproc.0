Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.56.87.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793575635;
	b=4fbnI2RYG/YEm2DPYAnhlp2wsB2GHUn/hFgqcwM7+yU9AjX1fg2gz7KWCTP+6gV1dcSI
	 6rWFL6AqSn9APXgolXbZl6wJQk612DPrLsX9JPSMVwXN5rc/0hFEVKVvRi5IQbCWv5qxq
	 7nMlvhU6eAw80g/v07BJGoj2PqxG7gNNdaq9tXj+dPGMzXcHpuHtm6cNAMSTJ0hDXF31K
	 G8OqJMHNYLqffWDBu4ddjWfEGiLE8t+3ljYHMC0tUt6x9htKR7L/PvMcyo5PRXBL0Wgla
	 FZKbINYoTGZqOxBucoH6JGQ+ZvzA0DCMid7+VBLIhYqjPUFnVA/w+25ygweIeJ3FFfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575635;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=aNNfCoQazdT0MtZCzmoXCNf2o8qmZ8Ept3HPzeF2fxY=;
	b=NmXFfLwINmAYh6NTi3IJLC+f3v7QRYvwE2BaVafHgEWNoehVm7QEI478Seol2tW5hlVL
	 J6Q9Hg9HVTVbM4wESEfWbk0VcU/t9yV7zpdvA3a54PThK7UyWuwThu72FBcYCxHKk2OuG
	 HO+q8IWr9yG7KFJaWbA32xvlwmjZ+1vJ9A6JzJXqylvrwCOmnTxzcjo6rdkbT1+IMEBSs
	 rXDFy44HLAo9VEFhblE0YTBrHNBKzVl52xqyG8mKEQUIM4NfKIq2D4d1NTxDA694HcT5S
	 +Jffu9WH1zKkjBxNncc80jkhYoO8JPCHZ/LKeP6iJrAlwjVyemj/7VKcNKLPahoDLlw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=w8+oHiKJ;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=YupPTfRZ;
	arc=fail smtp.remote-ip=185.56.87.10
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08EA60A2600;
	Sun,  1 Nov 2026 23:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A08EA60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=w8+oHiKJ;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=YupPTfRZ
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; s=arckey; t=1793575634;
	 b=YVT/AvQqe/ZZYyyCYem6GvPukpJh61l0dn8dkEtyiwuuip7j7XY5tW/vwb+aeqSrH8jQz6h0qr
	  XhDuCvsJVXZlMCdjP8kiFWjij/k/0dhanA4diXX8waMBZ0t710Y2NDDCkHj31NloN5u0h4WhVh
	  5YiFBz5Yzhdg9sl6IjCUVys6FRU4+Yv5Mu6e3/OodQEof/I1QPtIfXBRwhLVuSnNKU2+CTakO9
	  e9l/jgLsTU6tMqkZFzNm0k5gSj/KzeO5XnRa2tOP56JBdFLTWQ58bgLD2aomIKdVfmR9Dv8peb
	  j2C2RyFJK7/b3/IBNIjFJzc9LIVF3kUlTsndI7WEVT3f0Q==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; s=arckey; t=1793575634;
	bh=xatSadXWCSV3dUAsA50Tri4B+LJCWP78e+HrJZJMlOc=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=WStCK0khSCRxY540vGwewnLf5CkXbPfQ5Qn8ZCJ0v9SRJUttaw1cItgy4gABMHs0fu/Z1tN8qp
	  Fe7zQfVVcOySf7VEe7m268NzEPEy/Zlom00TFb1sOlaV0Za5nzf7v0EqoNUVJskDySuU49XKNS
	  HL0NeAHa313ire0GApVkyj0s4mOEZBD1Ny09QvBQPTxDnTwEgMZ8PMzMar4Krp69VCyxHIVQ/z
	  aZkd28AE8q3hzlfI2kRPXmRF3n35hSjjyPuXjZxV/brpUMLiLFvMcYtnawOUe9z8L5pMdIKKsD
	  r+aqIFjt7oVSxUla92zooWpnybHI4nr8QsmOCGqk68Kiew==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=aNNfCoQazdT0MtZCzmoXCNf2o8qmZ8Ept3HPzeF2fxY=; b=w8+oHiKJXGU/y8zCIZkUowy4BV
	LXPEeWLwH64NzCjzjQ6mgacuakH1JetGrW9/TiyvlrTNUsU71eNWsqYBu3iISIAuwFlkUL5AYHGeY
	HCdkrXRbTAoVjwNZAjpFLbInsGx6jy2bIi1j2UR/6U4gMeFTlKSmtZL0csU0eU9vjxGw=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex5-00000007Afh-2IH8;
	Sun, 01 Nov 2026 23:27:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=aNNfCoQazdT0MtZCzmoXCNf2o8qmZ8Ept3HPzeF2fxY=; b=YupPTfRZ+RXBcylV7y62J43u/r
	jtVMXKCefGX0Bp6UYKCxbUG7izHxc4AVeJXOyIAeq0Ps4ogfZUB8svkGtEDbMX/7bgyrEfnMdczFM
	lr83Imq0hB4ZxbF8RadKF4nXcoMIXt6bPi4cXEevvCI2tn1x05BD/PBYB3KVA8Q8mABM=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNewz-000000002I5-1OkY;
	Sun, 01 Nov 2026 23:26:57 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:41 +0100
Subject: [PATCH RFC v2 04/11] remoteproc: report VIRTIO_F_VERSION_1 for
 non-rproc-specific vdevs
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
Message-Id: <20261102-remoteproc_virtio_map-v2-4-26b300e01c62@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3487; i=francesco@valla.it;
 h=from:subject:message-id; bh=xatSadXWCSV3dUAsA50Tri4B+LJCWP78e+HrJZJMlOc=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+1J1+2XTmBMtxPQPXLjdnWXpN1SDaHaoP3BW7b7q
 R+/a1TfUcrCIMbFICumyBKy7sa9PXPNv6VtYHwEM4eVCWQIAxenAExEUJfhv2evXbr1pcW3L7J9
 6Z5wUyHsxf01s6Pnt20+fubZHqejbg8Y/hlxNW/Zu3Hvo40nPwfFbnvPLdnseO2LZHjN+u1cR6O
 3RXABAA==
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
X-SGantispam-id: 4a8650d2b1555773977986b1409c4976
X-AntiAbuse: ID - 4a8650d2b1555773977986b1409c4976
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNex5-00000007Afh-2IH8-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

There is currently no way to report the VIRTIO_F_VERSION_1 using the
resource table alone, as the per-vdev feature array is limited to 32
bits.

Considering that the VIRTIO 1.0 specification is now ~10 years old,
always report the VIRTIO_F_VERSION_1 feature for virtio devices that
are not specific for remoteproc usage. These latter, which as of today
are rpmsg and rproc-serial, are excluded to avoid impacting the existing
usecases, since VIRTIO_F_VERSION_1 changes the semantics of the
communication (e.g., the configuration space is assumed to be
little-endian rather than follow the device's endianness).

While at it, replace BUG_ON() with WARN_ON() and return an appropriate
error in case of features that would overflow the 32 bits limit.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_virtio.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index c56d3330adfe..f1b362158a9c 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -16,6 +16,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/remoteproc.h>
+#include <linux/rsc_table.h>
 #include <linux/virtio.h>
 #include <linux/virtio_config.h>
 #include <linux/virtio_ids.h>
@@ -27,6 +28,11 @@
 
 #include "remoteproc_internal.h"
 
+static bool rproc_virtio_rsc_vdev_rproc_specific(struct fw_rsc_vdev *rsc)
+{
+	return (rsc->id == VIRTIO_ID_RPMSG || rsc->id == VIRTIO_ID_RPROC_SERIAL);
+}
+
 static int copy_dma_range_map(struct device *to, struct device *from)
 {
 	const struct bus_dma_region *map = from->dma_range_map, *new_map, *r;
@@ -268,8 +274,17 @@ static void rproc_virtio_synchronize_cbs(struct virtio_device *vdev)
 static u64 rproc_virtio_get_features(struct virtio_device *vdev)
 {
 	struct fw_rsc_vdev *rsc = vdev_to_rsc(vdev);
+	u64 features = (u64)rsc->dfeatures;
 
-	return rsc->dfeatures;
+	/*
+	 * All non-remoteproc-specific virtio devices are assumed to be
+	 * compliant with virtio specifications 1.x; there is no other method
+	 * to transmit this capability from the remote processor to the host.
+	 */
+	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
+		features |= (1ULL << VIRTIO_F_VERSION_1);
+
+	return features;
 }
 
 static void rproc_transport_features(struct virtio_device *vdev)
@@ -285,6 +300,7 @@ static void rproc_transport_features(struct virtio_device *vdev)
 static int rproc_virtio_finalize_features(struct virtio_device *vdev)
 {
 	struct fw_rsc_vdev *rsc = vdev_to_rsc(vdev);
+	u64 features;
 
 	/* Give virtio_ring a chance to accept features */
 	vring_transport_features(vdev);
@@ -292,8 +308,14 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
 	/* Give virtio_rproc a chance to accept features. */
 	rproc_transport_features(vdev);
 
-	/* Make sure we don't have any features > 32 bits! */
-	BUG_ON((u32)vdev->features != vdev->features);
+	/* Make sure we don't have any features > 32 bits except the expected ones. */
+	features = vdev->features;
+
+	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
+		features &= ~(1ULL << VIRTIO_F_VERSION_1);
+
+	if (WARN_ON((u32)vdev->features != features))
+		return -EINVAL;
 
 	/*
 	 * Remember the finalized features of our vdev, and provide it

-- 
2.56.0

