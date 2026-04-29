Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F77337BAC;
	Wed, 29 Apr 2026 03:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777432099; cv=none; b=nCc+wEup3e9Hm2MsAxivMs1S+YcaSE9t/6tkI4C7V2muNJ88GMQc9HE5jIdlOdH8CwQ075kzmm4/ExrgxBt/N090pN8b2u0GVfXJbItOqLP80d6OKnF2Vou7t7a5J/BF1ZVyAJ5hv2ujzBbT3+Y5PaUTz7RAmL5GR56xa38DMKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777432099; c=relaxed/simple;
	bh=jyNlr5Eqqnlnz9lPryB7rWBX44L7XcjPFgCNW2QI+/A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=qS82kmt3QsZaKD9PY/41KHrokX5cBPfiizJAX1tR7c7V5j7UIXj4SCSUPrbG4iW46fGqJeDDztHnbQBxWM00f/aWWpij86Iidt59rOOsHcnw0BgTbD8yL9oBbKarnX/buFrL/8J7mCm+tv/VEUjaKoTFETxVJFV/MWYJjPCTnaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1D14A2044AE;
	Wed, 29 Apr 2026 05:08:16 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D83AF2044B9;
	Wed, 29 Apr 2026 05:08:15 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 9AD571800083;
	Wed, 29 Apr 2026 11:08:13 +0800 (+08)
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	peng.fan@nxp.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zhiqiang.Hou@nxp.com,
	mingkai.hu@nxp.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Jiafei Pan <Jiafei.Pan@nxp.com>
Subject: [PATCH v2 1/5] dt-bindings: remoteproc: add imx-rproc-psci binding
Date: Wed, 29 Apr 2026 11:10:43 +0800
Message-Id: <20260429031047.30893-2-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260429031047.30893-1-Jiafei.Pan@nxp.com>
References: <20260429031047.30893-1-Jiafei.Pan@nxp.com>
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
 .../remoteproc/fsl,imx-rproc-psci.yaml        | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
new file mode 100644
index 000000000000..cdab9566e588
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
@@ -0,0 +1,64 @@
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
+  This binding provides support for managing Cortex-A cores as remote
+  processors on i.MX platforms using the PSCI (Power State Coordination
+  Interface) for CPU power management operations. This allows single
+  Cortex-A core or multiple Cortex-A cores to be controlled by Linux as
+  a remote processor, enabling them to run RTOS or bare-metal applications.
+
+properties:
+  compatible:
+    const: fsl,imx-rproc-psci
+
+  fsl,cpus-bits:
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
+  - fsl,cpus-bits
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    / {
+        reserved-memory {
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            rtos_ca55_reserved: rtos-ca55@d0000000 {
+                reg = <0 0xd0000000 0 0x10000000>;
+                no-map;
+            };
+        };
+
+        remoteproc-ca55-1 {
+            compatible = "fsl,imx-rproc-psci";
+            /* bitmask: 0b10, assign A55 Core 1 */
+            fsl,cpus-bits = <0x2>;
+            memory-region = <&rtos_ca55_reserved>;
+        };
+    };
-- 
2.43.0

