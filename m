Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA8F26ED3A;
	Mon, 11 May 2026 02:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778467044; cv=none; b=DBPFkJ4GzZWQNK46pm2lhqzWk7qTw4qzqdCdd9k0MJNuR0f8VeNnb6w3lZhdYBotHHJdk3ZocJV4JLqznQRo2ZDKpknM5McflJEuLl+uBcsyO5hViwyfJQGodBcPPNkhu14N/Kew1xhK0cmZHFhYd8YUlLL24PKUMl709st4Kes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778467044; c=relaxed/simple;
	bh=xNbxGe7aSwjgSU07Ix1JQliTrpp3b+Q5a295IWkbFu0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=tKefLMz6Vu5tSc9OJpolNzHI6O7HEzgB0TFPRuZ0UQUjJy49I/8qM+XG6T3KcESG4leSR3GQy+j7kKpV4Q0CMaQI822VWYYqHjgOB8FkdWOKUAOrnKaPTRKik+PW/XxzpphpBwhDZ5CY1IyUvRE6/TWHRwBGMETxaAiFn1OOERI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CA5CE1A4840;
	Mon, 11 May 2026 04:37:07 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9C0771A4841;
	Mon, 11 May 2026 04:37:07 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 69EE618002C2;
	Mon, 11 May 2026 10:37:05 +0800 (+08)
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
Subject: [PATCH v3 1/4] dt-bindings: remoteproc: add imx-rproc-psci
Date: Mon, 11 May 2026 10:39:25 +0800
Message-Id: <20260511023928.39640-2-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260511023928.39640-1-Jiafei.Pan@nxp.com>
References: <20260511023928.39640-1-Jiafei.Pan@nxp.com>
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
Changes in v3:
- Fixed dt_binding_check warnings

---
 .../remoteproc/fsl,imx-rproc-psci.yaml        | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
new file mode 100644
index 000000000000..28d00dbf8bc7
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
@@ -0,0 +1,51 @@
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
+        remoteproc-ca55-1 {
+            compatible = "fsl,imx-rproc-psci";
+            /* bitmask: 0b10, assign A55 Core 1 */
+            fsl,cpus-mask = <0x2>;
+            memory-region = <&rtos_ca55_reserved>;
+        };
-- 
2.43.0

