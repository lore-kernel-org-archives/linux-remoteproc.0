Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C806610E0;
	Sun,  8 Jun 2025 02:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749350423; cv=pass; b=HdCQ9dH4Rwa4uuLr+fvaRgBT3Vr20DiurVjvWrQFosrsJsXITnj3uFBXZ5sfNBRaES5O6dxS90kde1a/7NuRvOJSxt1nioNGR+179kKss3fJq0/BzAVMns/x99Nd1HjEQ+SlAFoWX3/Cf2+GZa0lTt0MUTqu0HD/YnJvfnrZCh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749350423; c=relaxed/simple;
	bh=CZFQN0TexDJ5n/S0W8OU0fUYLQb5fAc/s4Vu1U7i8hE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XHLzcVuYiB+nXh10XV1O/Opl3ZQPRWrcgAv7pRFFJlhbsl2tVWgDrH717y60qqQF1H5xqU0FfL8FjogPVmGVw89478ZAofQmcTBYArgYgfxxalJYUg4pLhZwSEyC5yzeiMz73F+44tvREK8pyt7YihmA0tHcl8JDJUtMax8HyMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=LK2Xl6T0; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="LK2Xl6T0"
ARC-Seal: i=1; a=rsa-sha256; t=1749350395; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KicxdlJzQgHonlx+VKM82CsMXmpKTWXpffA9LiaeFjR+rn5gSQdev08HE96h2H8kef/O32spJ2DT4gv922PMY5Fm9Y3c0nk9VktPDLOYRQ4LOoOx6l6gsBnRPn3+DdR7FN6Yo6njXP73d+sLYIDPlE6pdRRB08WpUicxVTNEgWA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749350395; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2e3tyxIFEdlJkSr9hgbOko+0LgoyRZui+/GEBb0jcGQ=; 
	b=JW2yzB7DZveYwzXB5aDrb3pD7GqSs2d3uA8aCczm6z5xhsB5OYepmgiPciGom3bt4oC+ZGPwSiMb77JFOh23J8yub5a9m8ANwg9uheP2OLeWVfBLjXKlBlIG1z6Qvao/LxBtT9J/a9Y++3Lmkyvl5B8lzYpGZZzd79VCAKThm6M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749350394;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=2e3tyxIFEdlJkSr9hgbOko+0LgoyRZui+/GEBb0jcGQ=;
	b=LK2Xl6T0F74dJgAFBwLSOaT/Hf7Cg68K2Oya3Ve6KSkwba5Q3R6SxGs/xD3j7fvG
	nmMZpJznSwt5cqcfyB+vghRvff6neKPLNzrXicX3F2fAcTyE+NQ2O5KYqHAsCexAoPI
	jlwxs7E0A8y7MDUTXFgm8apoINUuJum9bwdS3BhA=
Received: by mx.zohomail.com with SMTPS id 1749350392696220.11054495371593;
	Sat, 7 Jun 2025 19:39:52 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sun, 08 Jun 2025 10:37:39 +0800
Subject: [PATCH 1/2] dt-bindings: remoteproc: Add C906L rproc for Sophgo
 CV1800B SoC
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250608-cv1800-rproc-v1-1-57cf66cdf6a3@pigmoral.tech>
References: <20250608-cv1800-rproc-v1-0-57cf66cdf6a3@pigmoral.tech>
In-Reply-To: <20250608-cv1800-rproc-v1-0-57cf66cdf6a3@pigmoral.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749350360; l=2534;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=CZFQN0TexDJ5n/S0W8OU0fUYLQb5fAc/s4Vu1U7i8hE=;
 b=SgtU7OJVOg1Isstuqp4D37soJdLYZ+/hfxkTPFTd5DiosWcvIHuQ2q8xUgPZ5J5gvQ+D7cOyP
 9fiCmd3iSX3D7vKLQAyVJZs411pYNri30fxyCYtW/JZQa4pYJfCp814
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=d3i4H2mg9LUn4SQemoLAjLRQy0nTcyknIv6zgKMwiBA=
X-ZohoMailClient: External

Add C906L remote processor for CV1800B SoC, which is an asymmetric
processor typically running RTOS.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../bindings/remoteproc/sophgo,cv1800b-c906l.yaml  | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..455e957dec01c16424c49ebe5ef451883b0c3d4a
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
@@ -0,0 +1,68 @@
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
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      The name of the firmware file to load for this remote processor, relative
+      to the firmware search path (typically /lib/firmware/).
+
+  memory-region:
+    description:
+      Phandle to a reserved memory region that is used to load the firmware for
+      this remote processor. The remote processor will use this memory region
+      as its execution memory.
+
+  resets:
+    maxItems: 1
+
+  sophgo,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to the SEC_SYS region, used for configuration of the remote processor.
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
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        c906l_mem: region@83f40000 {
+            reg = <0x83f40000 0xc0000>;
+            no-map;
+        };
+    };
+
+    c906l-rproc {
+        compatible = "sophgo,cv1800b-c906l";
+        firmware-name = "c906l-firmware.elf";
+        memory-region = <&c906l_mem>;
+        resets = <&rst 294>;
+        sophgo,syscon = <&sec_sys>;
+    };

-- 
2.49.0

