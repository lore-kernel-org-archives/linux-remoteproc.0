Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.56.87.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793575630;
	b=KcnKluwtXUq3LaeaH7a1wP5kgZvUcslB/Zm44IvU0vjK57OYHBFBUbjcXJ6tDOGU3LRa
	 HoSeeECzLxabWRmb9yO+OPw7MYdMqPsrcpmgcVQZhx967EYC/8pEJak20lWcXZk2d7FDM
	 ZWjjeWm/IfEuh+fS0N2QCGZnVJUBidC/UxY7kJhmWqiKaXXCuM0+7wZcxf9uXO4m5SLMb
	 ksAoOiGJxRpT2soA8HXqnP/1CueIhyZPNP0n7iZGOGXSqwkVns/8h+M3KHqGkCYWnESoU
	 WVwlPu9idf9osUe+ga5BbZaOdBEcaWCLM0pbg1KSnycxhWCp+WRrpzTWEIfbWFL6Weg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575630;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=jDGzUeJoU453C6E72rSA80bKxfeU0j/w1IYP/rP6ntc=;
	b=RI+qc80CsrfKwh7SFgh4OEUbjs3GEyMRlnHA4g33S8Klo2OQl//pnP8pVx3lompoM+SI
	 45zdsVvXF8P/fuag5jKkDO8XvWvJvc5MG4PFE54zwslFquG6ruRz9ZtopwSdcJDGFUXL2
	 gb9tMC6XQvo3g5XPfE8OyfztgDx73lW+LwIyxx8Bb7myfE2AIbne+JsRhBrtTrA/xLJS+
	 XF12z4q0kRZMjcvZNirxMvxXE11N3by8ZhXadsNPvLUqgxuhk1U4JsdtgBl4ZYvC/BBhz
	 DaYwBJauFlgrihKri1jZEEqf7nzGR+vN1BucRmcjSp1ibmJSRwqDNTnkG+Zl8h1dsoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=kEi0LNlZ;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=DWkHZglW;
	arc=fail smtp.remote-ip=185.56.87.7
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCAB606A326;
	Sun,  1 Nov 2026 23:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DCAB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=kEi0LNlZ;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=DWkHZglW
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com; s=arckey; t=1793575627;
	 b=JQn7S/6vkQpZX9BKiOCxwn0UhvnuXXJwD+bcnbjhLtQV8O2dIsj0JMCU1tESxLozJbEsGu8RX2
	  Ua05rDjgSXNZh9TfO3w2V9r7jO89/5B9YVgjQpvNhkRK99V6RxtK/Q6zWXqNlJfnN12AzTL9Cd
	  0UfdStCjFrNzYDuQa5Tt1G8JirjVnwSa3+6GulfieRZzdUqDMfr7n9TUsdd8eGFbeY86wxdR8R
	  ljp1pK6dBDjHit7u9RjewvcxL20diLoOLotcn6rDJqw2Asge3ngCjjd/yJ2GkwXtMy4UbCICJz
	  jbk0lGZiIF+J40EsPHhVXD8hT9uIJZZzsCaVyc95Q5WM6g==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com; s=arckey; t=1793575627;
	bh=wjrwqlTjD+bsGiygLxRdvngnMYwukHYEcpIoG27o7NQ=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=Qomx6U744HaruxvXSOSRDZuVNBesmwA8knIvBn8sBMPjEUCnvY2O6Rw6+2b0ATRKOe0EcFOLqK
	  F3KCYRK9+QPlRnpzG7d4+1r0BIcY4BEDR6pHtOKqd+nQWN4cbkEZxN2l4RE8zBlJohdmk1Ychl
	  s/ztmLp6I4yv4dIJ/CuWqXhVF66aBl+eV8qhmj4Qoxjv1IdLFbx7RVfMTury82ODMxQZuDQ7As
	  rDaUgOji0Xbr6Y7G4EXYmZg0MXrfSJJqWUxxnc9JZ0IkZTaGQDddd2x+Wl3OY2y8t8u8/D9uUW
	  dPLHTTWxSe+9eU4DHgId6Da4wJCjVlCNk8nJMBK0quVbpA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=jDGzUeJoU453C6E72rSA80bKxfeU0j/w1IYP/rP6ntc=; b=kEi0LNlZGfGZfW5YMKTrR5QZyo
	17hNL4rx1Rx7+8UttNmNyWj0c5f6Iytutw4zOiAlp82A1wxBg0w6tUHc1QnsxAC1kInpuNeRrXhE6
	NJU5r4Ec401p2i84BdV0DqYrMMGHsIbU3HukWXX3RKtQVMRqjs74K3zOuO2avTAUO5C8=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-0kln.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex7-000000075UM-1Bga;
	Sun, 01 Nov 2026 23:27:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=jDGzUeJoU453C6E72rSA80bKxfeU0j/w1IYP/rP6ntc=; b=DWkHZglWJBAhWKTBNUqy4BrJ9y
	hYXQHTINCO6Tv62B/pPA57suAYhsZO/5GLNfBvMm+OU7z0msEuGdf4Jj6RinMEOVJInbhyl5XjUOL
	toFsrhRSnLw9ZmeIV69q7ci29XsXzjyNWDsyC/EAViym1PcZNNYULQ5OldBT6CpPTDLY=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex1-000000002I5-09og;
	Sun, 01 Nov 2026 23:26:59 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:43 +0100
Subject: [PATCH RFC v2 06/11] dt-bindings: remoteproc: add
 remoteproc-virtio
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
Message-Id: <20261102-remoteproc_virtio_map-v2-6-26b300e01c62@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4131; i=francesco@valla.it;
 h=from:subject:message-id; bh=wjrwqlTjD+bsGiygLxRdvngnMYwukHYEcpIoG27o7NQ=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+1ZOt07pE+76wzvgiav4v7lb8Ovry8SnWzhsihPb
 erBllm2HaUsDGJcDLJiiiwh627c2zPX/FvaBsZHMHNYmUCGMHBxCsBELC4zMtwWEz+urpm56f7P
 3tM/CwoTV9/fvu+JY3v7Mqv2F8/uCPEyMtxjFZq6euHOhf+t02Y0nutSbTqyhe309lidBe3axTF
 fmvgA
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
X-SGantispam-id: 7775717b9a173c6e301ec8f944791d20
X-AntiAbuse: ID - 7775717b9a173c6e301ec8f944791d20
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNex7-000000075UM-1Bga-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-0kln.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Add a new binding to describe remoteproc-provided virtio devices; while
these are discovered through a resource table parsed by the remoteproc
infrastructure at runtime, their description can be needed to probe
non-discoverable buses (such as I2C) or to link consumers and suppliers.

Each vdev is described by a dedicated "group" node, which then includes
a virtio-device node. Each vdev shall be statically linked to a "group"
node using its index inside the resource table as the reg property of
the node; this permits to have multiple instances of the same type of
device.

The binding is intended to be generic and adopted by any remoteproc
provider.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 .../bindings/remoteproc/remoteproc-virtio.yaml     | 106 +++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
new file mode 100644
index 000000000000..8cdfa8d0f936
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
@@ -0,0 +1,106 @@
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
+    type: object
+    description: |
+      Contains a group of virtio devices exposed by the firmware running on
+      the remote processor through its resource table.
+
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "@[0-9a-f]+$":
+        type: object
+        description: |
+          A single virtio device exposed by the remote processor. It can
+          contain at most one child node, describing the virtio device itself
+          (e.g., to declare devices on a non-discoverable bus or to act as a
+          provider for other nodes).
+
+        properties:
+          reg:
+            description: |
+              Position of the virtio device among the VDEV resources contained
+              inside the resource table.
+            maxItems: 1
+
+          memory-region:
+            description: |
+              Memory region used for the buffers exchanged with the remote
+              processor. A restricted-dma-pool region forces all buffers to
+              be bounced through it.
+            maxItems: 1
+
+        additionalProperties:
+          type: object
+          $ref: /schemas/virtio/virtio-device.yaml#
+
+        required:
+          - reg
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
+        virtio {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            vdev@0 {
+                reg = <0>;
+
+                gpio {
+                    compatible = "virtio,device29";
+
+                    gpio-controller;
+                    #gpio-cells = <2>;
+                };
+            };
+
+            vdev@1 {
+                reg = <1>;
+                memory-region = <&vdev1_buffer>;
+
+                i2c {
+                    compatible = "virtio,device22";
+
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    eeprom@50 {
+                        compatible = "atmel,24c1025";
+                        reg = <0x50>;
+                    };
+                };
+            };
+        };
+    };
+...

-- 
2.56.0

