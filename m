Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36BE409121;
	Wed, 12 Aug 2026 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786531623; cv=none; b=YPH7z8zibzTE56lXUiSKX4SLy5UPyPOmPQXLd4EoLwCCRukz4MpKfIYdnS7vU8ZCOfn8c8tvR8dlY1BnvTLkWT0GysSdCNxrkseLRqyZHrCp7xsAZFNK2pNMBoWDwHO2r3I2Tx79KHgQ0zwevd7eSBId33V+oaNvu0scn5n1SPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786531623; c=relaxed/simple;
	bh=0eEBJcdkU5y3abHYLXfT7KFHqo1WFkpFzA3GHFW+6dE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=IrblGmyCaOroEAOt0e3WLZklPvReh8b3pcdIRkR6LsIIrWWkG6TPdVRnV1+LuNsSMyNFYIly5UwC35ig0j6eK22aPT2YEu0Dh34cwPdTZPy64tJ1nXplzflo/RnCRmSHnnwJM8OFuG09qdpzcp4xAyHe0gC6koQYAQk0a0xdfdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3E53D200016;
	Wed, 12 Aug 2026 12:47:00 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 00472200011;
	Wed, 12 Aug 2026 12:47:00 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id AAA4418000B1;
	Wed, 12 Aug 2026 18:46:57 +0800 (+08)
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: krzysztof.kozlowski@linaro.org,
	peng.fan@nxp.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhiqiang.Hou@nxp.com,
	mingkai.hu@nxp.com,
	Jiafei Pan <Jiafei.Pan@nxp.com>
Subject: [PATCH v4 1/4] dt-bindings: remoteproc: add imx-rproc-psci
Date: Wed, 12 Aug 2026 18:46:30 +0800
Message-Id: <20260812104633.22420-2-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260812104633.22420-1-Jiafei.Pan@nxp.com>
References: <20260511023928.39640-2-Jiafei.Pan@nxp.com>
 <20260812104633.22420-1-Jiafei.Pan@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

Add compatible string "fsl,imx-rproc-psci" for i.MX Cortex-A Core's
remoteproc support.

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>

---
Changes in v4:
- Updated description to describe the hardware instead of the binding
- Changed compatible to SoC-specific "fsl,imx93-rproc-psci" with
  generic fallback "fsl,imx-rproc-psci"
- Fixed example node name from "remoteproc-ca55-1" to "remoteproc"

---
 .../remoteproc/fsl,imx-rproc-psci.yaml        | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
new file mode 100644
index 000000000000..7d0d0da383a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/fsl,imx-rproc-psci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX Cortex-A Core Remote Processor via PSCI
+
+maintainers:
+  - Jiafei Pan <Jiafei.Pan@nxp.com>
+
+description:
+  NXP i.MX SoCs integrate multiple Cortex-A cores. On certain i.MX
+  platforms, one or more of these cores can be offloaded to run RTOS
+  or bare-metal firmware as a remote processor, while the remaining
+  cores run Linux. The cores are powered on and off via PSCI (Power
+  State Coordination Interface) CPU_ON/CPU_OFF calls to the firmware.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,imx93-ca55-rproc
+      - const: fsl,imx-rproc-psci
+
+  fsl,cpus-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Bitmask indicating which CPU cores are assigned to this remote
+      processor instance. Each bit represents a CPU core, where bit N
+      corresponds to CPU N. For example, 0x2 (0b10) assigns CPU core 1,
+      while 0x6 (0b110) assigns CPU cores 1 and 2.
+
+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to a reserved memory region to be used for the remote
+      processor's code and data.
+
+required:
+  - compatible
+  - fsl,cpus-mask
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+        remoteproc {
+            compatible = "fsl,imx93-ca55-rproc", "fsl,imx-rproc-psci";
+            /* bitmask: 0b10, assign A55 Core 1 */
+            fsl,cpus-mask = <0x2>;
+            memory-region = <&rtos_ca55_reserved>;
+        };
-- 
2.43.0

