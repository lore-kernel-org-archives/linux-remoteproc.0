Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E25489883;
	Wed, 16 Sep 2026 21:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789594060; cv=pass; b=sxe84kyQuEaQbkI3eiCoNKkOkoE50euKcD6b+ZQ3WPXWOrxrM6XElUSJwmdHpOZQDwqZE4iIfVrv+zDW5Ul1Egi2IKEXovS+GV6GGNVXNBUyz++XMnr/qBTo4f19PSiBVXG3Q9Pf4cSvom1CRiYraJ6Kln3K/IIyPUb+NII8ikQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789594060; c=relaxed/simple;
	bh=sBSOz5pgMUqgONr4Fz29dN7NUC6uaTXwlSKgC8vciFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BXQAlguKSMvHWOccFx0475uJsZrwNV6ixPhmC9i7Nf3gT2O4E7s8gRi7FtwYtAGHO9pCX0Y3Sx1GdV3iQNCtcpp6FJMaJb+5FIzzVsVxf+x9NOUoN2aHHq/aQjyl9pSVuY79qgZnnpshEXYmO2pjEUFSR68sxJmaNMasElgoTZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=wN8jN+O8; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=aGmaix6g; arc=pass smtp.client-ip=185.56.87.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="wN8jN+O8";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="aGmaix6g"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com; s=arckey; t=1789594049;
	 b=Lnt6R13smeeLiU/36dboG0mh8mVRrzUFJlGQRaY35vP2Nj0rq3JtN5j30w5xRrjEm1NX2t+Cyb
	  OxtcIE+Zh0u7U8ZyS500vnTkvnvWCEpAp4pOVEXb4qb29aEgOw/RAVLoJ3GbKr5Zuk2kghZYGc
	  huREMQ9kugB+Wc+9BMksUqFkFf6ZCBAqFCK/bnKBtH0QQHMJsidJTAPB04fUSfVEfckgDsxTAe
	  XYAkB66v4FYkPWqj8uZXYFCk6CN57SL0xGm/FGuHvJJ2TgOu5YmfLqBNfcekro7xO8hjUwT0p2
	  I/CGn4QBgGWPX7WsW74ffD3LcZJPw9R+d8hkpkJNdSFbsA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com; s=arckey; t=1789594049;
	bh=sBSOz5pgMUqgONr4Fz29dN7NUC6uaTXwlSKgC8vciFU=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=NBdYieMVKp2V1ZwdVT9UlHD3v+UKb81p7MHdwP/YsaldKsqy1309PMmC0ND8FUWXbR25C3KfdB
	  5sHxuM/uyofoD1bFKaIKzLf+mHJeN2dEZ61ILI/ZZE44wA7qxHM3AdNZibJGGIolKPuhBKc+tw
	  aDp0rHSQIZvxwqegSAwIwRMyQSUB9jUEIciemZ+wS/VbePjiYFxJalXIXgQ/kR3jVCdxeQD2OW
	  4BzJN5ld4hD4KHPZCdkM6fiCTAPV+FUS3LwpIijn9xMhjydnHdtydOt+/AeSKmhPNT0zchJZds
	  DkBeGHlivODdoNQXW4AWxI5lPChhbqKU/bw7KkMFXaPRMQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=ozCv4HPZuc40czIPmQ+cRqdAb8c6IBZGMNNibW9zglE=; b=wN8jN+O8flsnThcHZrdsvV0WsU
	GpB27b+UgNTwIVnKQbFKLsZAKzf+1AoWENutMfMgh67qv/4BLTeLjJ4aOO7Y5FWuHEAgznj27I+PB
	xq0WdGl0sH2HpcwAv2/zSaplTcd19aDnKaH6qNXJemuT+5TK58Gs4GCP9yDS+2I2oa6c=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuU-00000009sAO-12G2;
	Wed, 16 Sep 2026 21:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=ozCv4HPZuc40czIPmQ+cRqdAb8c6IBZGMNNibW9zglE=; b=aGmaix6gZAAhGub8lf8EsCeKgz
	aJZqRVZw1R2ekRS/uRy12L6rk6A0JPfqMNBFKIQ2WKi05+rEjDr+Ltwh/QrTrrxW4kZwTeGxh0aqx
	iav5m65OiYJT84NLRuoOJidr7Oja+qxAsWHMQVObM0wr4jF/Uqrn7Z9Ht9+FP0WZud1g=;
Received: from [95.233.221.121] (port=62880 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuP-0000000058P-1pIJ;
	Wed, 16 Sep 2026 21:11:13 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 16 Sep 2026 23:10:53 +0200
Subject: [PATCH RFC 08/12] dt-bindings: remoteproc: add remoteproc-virtio
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3369; i=francesco@valla.it;
 h=from:subject:message-id; bh=sBSOz5pgMUqgONr4Fz29dN7NUC6uaTXwlSKgC8vciFU=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFmrWZ9sbJhwKelLrNxuv0dpux/sEX7ya6cD08fllWceq
 Uz8v4FjbkcpC4MYF4OsmCJLyLob9/bMNf+WtoHxEcwcViaQIQxcnAIwEcvJDH9Fkr0c7UySpbR1
 cqJP2PrsWXG1MK7NWdjms1Lt/7ZJRTcZGT7Xn9pQNelF0752nzt7UnhCNr5uLowpVojIXx7qfdd
 Bmx8A
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
X-SGantispam-id: e08f13cb19b1ceb3d794b2616535f634
X-AntiAbuse: ID - e08f13cb19b1ceb3d794b2616535f634
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x6wuU-00000009sAO-12G2-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Add a new binding to describe remoteproc-provided virtio devices; while
these are discovered through a resource table parsed by the remoteproc
infrastructure at runtime, their description can be needed to probe
non-discoverable buses (such as I2C) or to link consumers and suppliers.

Each vdev is described by a dedicated "group" node, which then includes
a virtio-device node, which binding is already existent and used by
virtio-mmio. Each vdev shall be stattically linked to a "group" node
using its index inside the resource table as the reg property of the
node; this permits to have multiple instances of the same type of
device.

The binding is intended to be generic and adopted by any remoteproc
provider.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 .../bindings/remoteproc/remoteproc-virtio.yaml     | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
new file mode 100644
index 000000000000..c4a0d84b1460
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/remoteproc-virtio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Virtio devices over remoteproc
+
+description: |
+  Virtio devices ("vdevs") can be exposed using the remoteproc infrastructure
+  and its resource table. For some of them, a device tree node might be needed
+  to describe remote undiscoverable hardware and/or connect consumers and
+  providers.
+
+maintainers:
+  - Francesco Valla <francesco@valla.it>
+
+properties:
+  virtio:
+    description: Contains a group of Virtio devices exposed by the remoteproc.
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "^vdev@[0-9a-f]+$":
+        type: object
+
+        properties:
+          reg:
+            description: Virtio device index inside the resource table.
+            maxItems: 1
+
+        additionalProperties:
+          type: object
+          $ref: /schemas/virtio/virtio-device.yaml
+          maxItems: 1
+
+        required:
+          - reg
+
+    additionalProperties: false
+
+    required:
+      - '#address-cells'
+      - '#size-cells'
+
+additionalProperties: true
+
+examples:
+  - |
+    remoteproc-cm33 {
+      virtio {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          vdev@0 {
+              reg = <0>;
+
+              gpio {
+                  compatible = "virtio,device29";
+
+                  gpio-controller;
+                  #gpio-cells = <2>;
+              };
+          };
+
+          vdev@1 {
+              reg = <1>;
+
+              i2c {
+                  compatible = "virtio,device22";
+
+                  #address-cells = <1>;
+                  #size-cells = <0>;
+
+                  eeprom@50 {
+                      compatible = "atmel,24c1025";
+                      reg = <0x50>;
+                  };
+              };
+          };
+      };
+    };
+...

-- 
2.55.0

