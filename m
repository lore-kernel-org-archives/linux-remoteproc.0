Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6136E489888;
	Wed, 16 Sep 2026 21:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789594397; cv=pass; b=g/yr+0BEcHSGyVulBP9NPiO0lnxX3xpOwhv6mIXtrIiJoYpjbHr1KtdjQXBc5b3fEdbP++ewhtyF/W9t8Tvu+qkFDdg/Fsb/mPtqAW8fdtoikczHjnsLNvFO43Z+L0HcEXtCJ1zwt+RRqu6HWtmHqMs/qi0B1A8u0p5VQ2pnXLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789594397; c=relaxed/simple;
	bh=NrG1vMi7mjuK8rU8iFoqlOm+G1UagPSfu8bXcOD9Q8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hfgpPqVTHBuJwh5DmlwuxusubdgcWPJ9L+7TId0qMdU27xlmpojyj5yykYPEalpuEkrK44kTfYaCXsvpu+fUTujmXQsbh8alBzgT5JNmMKWwSU0SRT4d7hU9uv4NC6vcweRw+VuMeX1pYwyZp/HgZPfZCw1yDxMpaOagipdixhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=la0A2q3V; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=plO3sSjs; arc=pass smtp.client-ip=185.56.87.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="la0A2q3V";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="plO3sSjs"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com; s=arckey; t=1789594383;
	 b=mCBYpDIFJlr787F5SLgeo+3Deq0N4oOKTw5NfZz0zU6yP8ooab5g5Hc0kSIIEhKGC0cL6ehPmX
	  jJX+m7LsCWH/lfedRNr3AZ+iuElV/TFeYrZfW8tsX06MAFsJMStNzEh6InX7CURxm4b2PPQn5O
	  bDrHOyycE2NP0ByFk0XltyhwsUY0ZBpHwFQj0XgpPqnkFzeK9aCNn6IxThPuxKRcn7IvYRVMeu
	  NJ38WuavUgENW3JeYrJxlqrSy3H0xNOQAsKItT9VFUqO6FpY3PqKwEdk7OGlKCGJKq0/2jpcFB
	  NRX5Qufneq2KHSxlC4mTkZWfO/bnwFWtVJTUnUYO8onDAw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com; s=arckey; t=1789594383;
	bh=NrG1vMi7mjuK8rU8iFoqlOm+G1UagPSfu8bXcOD9Q8U=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=ZponwEU/ZyKF8cl64XvdNC+ay6xttY3qIrmwIiRcujQrlbYXMKdzat3Cd7dcqcmDJE8Fx70rsY
	  hTkWuYm8Sers9R7qy4yX95Qg60amXp3hfCRGX0qmWlsuYVDHAKGY6sZ8M/p6Stri4nbqkZ3d7s
	  1fELK+wYImRSuHgS/0upjUiGg0HPgFrtMq4pGcNBWglPOam5HnjA6uH3s4UL1xebkwEm4YE3sL
	  V4NCjOosbRqrkdxbDAKpXDpyJ0/sqYnm5znrxU6CS7vYlrlFpxmqFynVBscbU0hjzlQ6u95Ye/
	  4NPJxijzjo/nWFAZPrJXs6qTSmgVvM8qU/5x0tnhi89c2g==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=dtdxP9SpG3f91lH58tgZH/LmN4+UT+dL4jUVq/KII8w=; b=la0A2q3VHBntmHzNwV6PZVKjIJ
	9xu+0+20By417s3JbKTw36cBBD6kzrZHt86Ood5qAtrxRLD9viv2osZeMTs71bmlbMobkKgTKhKHO
	dQEoEJ3HQXUjJcLJZJfPn4Fjtasppfbr7vHT2Ir2kbCie+7/LpIgMYrj185GyMrzUDys=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuT-00000009s9Y-0aFt;
	Wed, 16 Sep 2026 21:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=dtdxP9SpG3f91lH58tgZH/LmN4+UT+dL4jUVq/KII8w=; b=plO3sSjsWcGLFhdB7DYHKt2QdW
	6D5bmj/HOJeqC0VyeoZAt+2yYVUe5UPXvu7h5filkOqLeK6nJQ8rBExiC+QoS88XRauPLiT3I4Qkm
	xUBIqXaq1DN3RgpzHn/5hl5/RV5htN/BpfqfezSrMEDt0xOjGTLIqpOPtlZN77F6t84g=;
Received: from [95.233.221.121] (port=62880 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuO-0000000058P-1JHw;
	Wed, 16 Sep 2026 21:11:12 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 16 Sep 2026 23:10:52 +0200
Subject: [PATCH RFC 07/12] dt-bindings: spi: add bindings for spi-virtio
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-remoteproc_virtio_map-v1-7-dac8c5eb4aa9@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1663; i=francesco@valla.it;
 h=from:subject:message-id; bh=NrG1vMi7mjuK8rU8iFoqlOm+G1UagPSfu8bXcOD9Q8U=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFmrWZ98//l5341Ys0W3+DuPHQl5fmvt/v83e24Xz1okc
 UGp67lQW0cpC4MYF4OsmCJLyLob9/bMNf+WtoHxEcwcViaQIQxcnAIwkfh0hv+Jb7Z5Xfs0kft/
 1QTGr69cMp//j8k9sJhPnzPJZ/+Ecg9dRobl3truXMKyTPUWuWHnsr4839h8Ku3tpwzdF6rTLkt
 0xHADAA==
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
X-SGantispam-id: ec756a4dc66af5ca0d376dea324da852
X-AntiAbuse: ID - ec756a4dc66af5ca0d376dea324da852
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x6wuT-00000009s9Y-0aFt-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Add bindings for spi-virtio, based on virtio-device.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 .../devicetree/bindings/spi/spi-virtio.yaml        | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-virtio.yaml b/Documentation/devicetree/bindings/spi/spi-virtio.yaml
new file mode 100644
index 000000000000..1a0a0763bd2f
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spi-virtio.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-virtio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Virtio SPI Controller
+
+maintainers:
+  - Francesco Valla <francesco@valla.it>
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+  - $ref: /schemas/virtio/virtio-device.yaml#
+
+description:
+  Virtio SPI device, see /schemas/virtio/virtio-device.yaml for more details.
+
+properties:
+  $nodename:
+    const: spi
+
+  compatible:
+    const: virtio,device2d
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    virtio@3000 {
+        compatible = "virtio,mmio";
+        reg = <0x3000 0x100>;
+        interrupts = <41>;
+
+        spi {
+            compatible = "virtio,device2d";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            sram@0 {
+                compatible = "microchip,mchp23k256";
+                reg = <0>;
+                spi-max-frequency = <20000000>;
+            };
+        };
+    };
+
+...

-- 
2.55.0

