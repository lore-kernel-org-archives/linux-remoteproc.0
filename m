Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D291BE868;
	Thu, 12 Sep 2024 16:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726159711; cv=none; b=LyKHn4FETQ5OphjKLRmHmsrrPO09wCC7M1w6u/z4QNUlyGZY7WNwUfRxrBmTrQO5OoToR6VLbzaOkrUZGTMpTmkYw9GOPtoTM8u3HhawpoMUbRR7YLt05lmWcYo5ZTkUbPUJ8POTrGjti1BFjHL+XTtnQrJV8qrGrBfrQFEP42Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726159711; c=relaxed/simple;
	bh=x3u05EVznPAGnkceHj/1/uplFGC0eCJkpbZwedr6SL4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TqVHLZ8Wwe6pwbL1+A+C55pOAHnz0KXXmGRaDZ0D2Jw8D3dVB/j2XE84FstNX+fpfM39DP/hoGWcWCuQZr6sJdGwNpQq17upe4YfrAriY7nwGLVEjVaJtrsLJMv59I8JKtCUJ3LBmDIZvH5fBI/Q9TPeHIP+Vsd/1w9z1JLC2to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=bq+k0W97; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="bq+k0W97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726159709; x=1757695709;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x3u05EVznPAGnkceHj/1/uplFGC0eCJkpbZwedr6SL4=;
  b=bq+k0W974ddd8+u0W7yozfYmov/c80cRkOH7BNNKczmRebwToj1YnDTb
   Is6Sf5wilrCoasZfh4xO6QvpCTWN6f00ItVEkwA9EVgrz1t1prmpd+3zt
   Ln8RV+3DgctLlKjNBktackS0jLd/Cl/K8VkucQ/qRSo0t0bg8YkMSVk7M
   FEC5iWCnTq2iP/f1S/XPkbtFnKHZE0dG7PxlGFkkQ9ktvyYI1wXWF3O/p
   9DsmiAfDGPKHi55r9a/moxpMfdxQ76NORxN6W+Co9Q0+AlFEZXBchHnCK
   DmGlYurgHXjPaV3+nlOWg2QcTbK8qKVsvVgY++Uffdsl2X/H38dAacY7c
   Q==;
X-CSE-ConnectionGUID: DQLE4LE3SvKX/JE8rC2tCg==
X-CSE-MsgGUID: nDwqZKPbQEawD14eamXSww==
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="32331231"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Sep 2024 09:48:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 12 Sep 2024 09:47:57 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 12 Sep 2024 09:47:54 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<peterlin@andestech.com>, <dminus@andestech.com>,
	<conor.dooley@microchip.com>, <conor+dt@kernel.org>, <ycliang@andestech.com>,
	<jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
Subject: [PATCH v1 4/5] dt-bindings: remoteproc: add binding for Microchip IPC remoteproc
Date: Thu, 12 Sep 2024 18:00:24 +0100
Message-ID: <20240912170025.455167-5-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Microchip family of RISC-V SoCs typically has or more clusters. These
clusters can be configured to run in Asymmetric Multi Processing (AMP)
mode.

Add a dt-binding for the Microchip IPC Remoteproc platform driver.

Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
---
 .../remoteproc/microchip,ipc-remoteproc.yaml  | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/microchip,ipc-remoteproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/microchip,ipc-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/microchip,ipc-remoteproc.yaml
new file mode 100644
index 000000000000..1765c68d22cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/microchip,ipc-remoteproc.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/microchip,ipc-remoteproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip IPC Remote Processor
+
+description:
+  Microchip family of RISC-V SoCs typically have one or more
+  clusters. These clusters can be configured to run in an Asymmetric
+  Multi Processing (AMP) mode where clusters are split in independent
+  software contexts.
+
+  This document defines the binding for the remoteproc component that
+  loads and boots firmwares on remote clusters.
+
+  This SBI interface is compatible with the Mi-V Inter-hart
+  Communication (IHC) IP.
+
+maintainers:
+  - Valentina Fernandez <valentina.fernandezalanis@microchip.com>
+
+properties:
+  compatible:
+    const: microchip,ipc-remoteproc
+
+  mboxes:
+    description:
+      This property is required only if the rpmsg/virtio functionality is used.
+      Microchip IPC mailbox specifier. To be used for communication with a
+      remote cluster. The specifier format is as per the bindings,
+      Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
+    maxItems: 1
+
+  microchip,auto-boot:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      If defined, when remoteproc is probed, it loads the default firmware and
+      starts the remote processor.
+
+  microchip,skip-ready-wait:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      If defined, the master processor will not expect a ready signal from the
+      remote processor indicating it has booted successfully. This allows the
+      master processor to proceed with its operations without waiting for
+      confirmation from the remote processor.
+
+  memory-region:
+    description:
+      If present, a phandle for a reserved memory area that used for vdev buffer,
+      resource table, vring region and others used by remote cluster.
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        contextb: contextb_reserved@81000000 {
+          reg = <0x81000000 0x400000>;
+          no-map;
+        };
+    };
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      rproc-contextb {
+          compatible = "microchip,ipc-remoteproc";
+          memory-region = <&contextb>;
+          mboxes= <&ihc 8>;
+      };
+    };
+
+...
-- 
2.34.1

