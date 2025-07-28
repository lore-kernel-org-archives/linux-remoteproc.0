Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A3E25BEE7;
	Mon, 28 Jul 2025 11:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753700741; cv=pass; b=RtAC/vRQS8+rVBlm5BmqVgJgdxKg6tBDt+nTedYJRk0rrF1BjwbOUr3nSB1qKh5IgDEHarlepVhfoWGk8+DGPcKtH670t7xrM3rqsmw+9klT9Aevj+en0VLBZ2OdW6Nex7Oza9WPekiiicGOquozGtWdtKfRGuKAKaKFBnw4CpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753700741; c=relaxed/simple;
	bh=ZB4kDHCFaJuzwRA42VaNOLuvt1FPSFTas3nAGCakyvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kkp9hTSk+HX0QN2m8ymmrVfbjg1qXGNscrq5oLIOV98mZAPGmR9Q99fLFT8Qx7ieSUe7sil843o+7r4x9fW+JvdGY7TP73EuyKHOYWFko22EVrOrxd4Z/pubGmkKVLQA9zdRShxc8yRmYObzkjGAYT49SX3fTGjBrodTLtSHPms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=D9j8J2fF; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="D9j8J2fF"
ARC-Seal: i=1; a=rsa-sha256; t=1753700710; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mxskvzESCpWwoLAeDYWZI0TwuTKd5v/58ddOerjCl+sDXuVJf6DoXzsrPVgfDaLTszQiOP9izDotiOey7G5tkc6R9I+JngFNDgacf3FFqgsS/hNu+K2TOYw1MqWROptomK6cWLL+HdBYfKnr0AKeQHgkA3Bu9sXKksvzZQ8+2w8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753700710; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8OPHGzrnmIEbRwrRDOKg+uuw/TuQkj1sMVpcX08/ceY=; 
	b=DxEl9+QRX3JnHh6ZGsaf3br6fgQYejewB8JyRBCpvV3enshVCVDZS+hOCp90TSXdtaUGiFCykDRrbmoMugPvPSVrevveKQLRdccw98m8ROmsgPH7rBoPSrBw6aPoA1CFBpUJH1PCDtiPbljaWPGoxDNS272r5DyCCaXDxMjJS/k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753700710;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=8OPHGzrnmIEbRwrRDOKg+uuw/TuQkj1sMVpcX08/ceY=;
	b=D9j8J2fFD1G9GPRcjThSVVcuEpX6xRNN2EC42xaZGy/mKS9KpDrz6Pgi8yFkUzbJ
	zEt0DIyUG43P6Fs/U25xJwbXTaKkq1z/0iiGtM2fVJqpKZcx3no71IlOs6JttiRREnW
	FfciMttAgpyUdPEIXwYUi0DXSrVr+qXmhWupxB8A=
Received: by mx.zohomail.com with SMTPS id 1753700707146593.1713743889961;
	Mon, 28 Jul 2025 04:05:07 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 28 Jul 2025 19:03:23 +0800
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: Add C906L rproc for Sophgo
 CV1800B SoC
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-cv1800-rproc-v2-1-5bbee4abe9dc@pigmoral.tech>
References: <20250728-cv1800-rproc-v2-0-5bbee4abe9dc@pigmoral.tech>
In-Reply-To: <20250728-cv1800-rproc-v2-0-5bbee4abe9dc@pigmoral.tech>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Junhui Liu <junhui.liu@pigmoral.tech>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753700654; l=2951;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=ZB4kDHCFaJuzwRA42VaNOLuvt1FPSFTas3nAGCakyvE=;
 b=faLLUs7vY3n9i8AlYkzR4JQtjNeppyGSbX+6HcHu7fQIXCQ9vOjrM9ZSsxZDYMwUO3xFHnbIP
 Dy5H05xAIa4DW++sIkEk/oA3p0RXDleANvR/sOWCZJOanlphVki/YX9
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=d3i4H2mg9LUn4SQemoLAjLRQy0nTcyknIv6zgKMwiBA=
X-ZohoMailClient: External

Add C906L remote processor for CV1800B SoC, which is an asymmetric
processor typically running RTOS.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../bindings/remoteproc/sophgo,cv1800b-c906l.yaml  | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2061c2fd6ba343c09b1a91700ea4a695d2b57f81
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/sophgo,cv1800b-c906l.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo C906L remote processor controller for CV1800B SoC
+
+maintainers:
+  - Junhui Liu <junhui.liu@pigmoral.tech>
+
+description:
+  Document the bindings for the C906L remoteproc component that loads and boots
+  firmwares on the CV1800B SoC.
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-c906l
+
+  firmware-name:
+    maxItems: 1
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  mboxes:
+    description:
+      This property is required only if the rpmsg/virtio functionality is used.
+      (see mailbox/sophgo,cv1800b-mailbox.yaml)
+    items:
+      - description: mailbox channel to send data to C906L
+      - description: mailbox channel to receive data from C906L
+
+  memory-region:
+    description:
+      List of phandles to reserved memory regions used by the remote processor.
+      The first region is required and provides the firmware region for the
+      remote processor. The following regions (vdev buffer, vrings) are optional
+      and are only required if rpmsg/virtio functionality is used.
+    minItems: 1
+    items:
+      - description: firmware region
+      - description: vdev buffer
+      - description: vring0
+      - description: vring1
+    additionalItems: true
+
+  resets:
+    maxItems: 1
+
+  sophgo,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to the SEC_SYS region, used for configuration of the remote
+      processor.
+
+required:
+  - compatible
+  - firmware-name
+  - memory-region
+  - resets
+  - sophgo,syscon
+
+additionalProperties: false
+
+examples:
+  - |
+    c906l-rproc {
+        compatible = "sophgo,cv1800b-c906l";
+        firmware-name = "c906l-firmware.elf";
+        mbox-names = "tx", "rx";
+        mboxes = <&mbox 0 2>, <&mbox 1 1>;
+        memory-region = <&c906l_mem>, <&vdev0buffer>,
+                        <&vdev0vring0>, <&vdev0vring1>;
+        resets = <&rst 294>;
+        sophgo,syscon = <&sec_sys>;
+    };

-- 
2.50.1

