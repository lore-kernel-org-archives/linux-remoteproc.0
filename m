Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E76175D56;
	Fri,  2 Aug 2024 15:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722612088; cv=none; b=STT7qLTJvzkP5BVdljbECeyE+Xw/O/xiyEFrhl8o+LDCUT3Ezc8SKWmyPXt8tYaBYVgyjKMQO2CcplxEfpGdVX0tnf/IXFOurzeqqhO0ZFwLh1NLoeKR1THt8mNaK4+AxES8uGdYlmSBW8swI1stzBC5foI2ysGsUfYyK4Nb9Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722612088; c=relaxed/simple;
	bh=4kah5gW4Qm+rCRloM1GoVSyBRZsMrK2hpdctAHE2n7c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PXEM231LREhD8ounmCUkJAhIlOIG3y1tzzzyOkb25ZfgiRzQvJtDQPlGfvmsNRzvay7C5EmCDLcMObCVbtSYQjBpk39/azpHTHcpzcPM3e8Ln6FXoFLCMfBPUYHMn7zYUVnHEgaEGTC0IOY8yrfVGU2mbO/ErXDPIDlPdJH3CjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=O//Z9Hi6; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="O//Z9Hi6"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 472FLCRC052146;
	Fri, 2 Aug 2024 10:21:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722612072;
	bh=9j5bnO7OtFB7GG/h+OkYgySHAA0rpWDExuuXCrmfifA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=O//Z9Hi6qBDuPyBWEUUcLEkwIiSNW3mCrySqAOexrU/FduSs/C2z3gDzQKLTvlJ4f
	 uiBlS3QAip88bpRJ9Hh2nHuHgbMegf9PU5yxkQZ6Ae3/+v0+cesU9QsGld/hCevWku
	 dozZgl9CrkWECtNcI2mcCzsOq69OftbKCPVPn70k=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 472FLBJn099554
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Aug 2024 10:21:11 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Aug 2024 10:21:11 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Aug 2024 10:21:11 -0500
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 472FLAep007504;
	Fri, 2 Aug 2024 10:21:11 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth
 Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo
	<kristo@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hari Nagalla
	<hnagalla@ti.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis <afd@ti.com>
Subject: [PATCH v11 1/9] dt-bindings: remoteproc: k3-m4f: Add K3 AM64x SoCs
Date: Fri, 2 Aug 2024 10:21:01 -0500
Message-ID: <20240802152109.137243-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240802152109.137243-1-afd@ti.com>
References: <20240802152109.137243-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

From: Hari Nagalla <hnagalla@ti.com>

K3 AM64x SoC has a Cortex M4F subsystem in the MCU voltage domain.
The remote processor's life cycle management and IPC mechanisms are
similar across the R5F and M4F cores from remote processor driver
point of view. However, there are subtle differences in image loading
and starting the M4F subsystems.

The YAML binding document provides the various node properties to be
configured by the consumers of the M4F subsystem.

Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Andrew Davis <afd@ti.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/remoteproc/ti,k3-m4f-rproc.yaml  | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-m4f-rproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-m4f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-m4f-rproc.yaml
new file mode 100644
index 0000000000000..2bd0752b6ba9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-m4f-rproc.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/ti,k3-m4f-rproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI K3 M4F processor subsystems
+
+maintainers:
+  - Hari Nagalla <hnagalla@ti.com>
+  - Mathieu Poirier <mathieu.poirier@linaro.org>
+
+description: |
+  Some K3 family SoCs have Arm Cortex M4F cores. AM64x is a SoC in K3
+  family with a M4F core. Typically safety oriented applications may use
+  the M4F core in isolation without an IPC. Where as some industrial and
+  home automation applications, may use the M4F core as a remote processor
+  with IPC communications.
+
+$ref: /schemas/arm/keystone/ti,k3-sci-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ti,am64-m4fss
+
+  power-domains:
+    maxItems: 1
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  reg:
+    items:
+      - description: IRAM internal memory region
+      - description: DRAM internal memory region
+
+  reg-names:
+    items:
+      - const: iram
+      - const: dram
+
+  resets:
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
+    description: Name of firmware to load for the M4F core
+
+  mboxes:
+    description:
+      OMAP Mailbox specifier denoting the sub-mailbox, to be used for
+      communication with the remote processor. This property should match
+      with the sub-mailbox node used in the firmware image.
+    maxItems: 1
+
+  memory-region:
+    description:
+      phandle to the reserved memory nodes to be associated with the
+      remoteproc device. Optional memory regions available for firmware
+      specific purposes.
+      (see reserved-memory/reserved-memory.yaml in dtschema project)
+    maxItems: 8
+    items:
+      - description: regions used for DMA allocations like vrings, vring buffers
+                     and memory dedicated to firmware's specific purposes.
+    additionalItems: true
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - ti,sci
+  - ti,sci-dev-id
+  - ti,sci-proc-ids
+  - resets
+  - firmware-name
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        mcu_m4fss_dma_memory_region: m4f-dma-memory@9cb00000 {
+            compatible = "shared-dma-pool";
+            reg = <0x00 0x9cb00000 0x00 0x100000>;
+            no-map;
+        };
+
+        mcu_m4fss_memory_region: m4f-memory@9cc00000 {
+            compatible = "shared-dma-pool";
+            reg = <0x00 0x9cc00000 0x00 0xe00000>;
+            no-map;
+        };
+    };
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        mailbox0_cluster0: mailbox-0 {
+            #mbox-cells = <1>;
+        };
+
+        remoteproc@5000000 {
+            compatible = "ti,am64-m4fss";
+            reg = <0x00 0x5000000 0x00 0x30000>,
+                  <0x00 0x5040000 0x00 0x10000>;
+            reg-names = "iram", "dram";
+            resets = <&k3_reset 9 1>;
+            firmware-name = "am62-mcu-m4f0_0-fw";
+            mboxes = <&mailbox0_cluster0>, <&mbox_m4_0>;
+            memory-region = <&mcu_m4fss_dma_memory_region>,
+                            <&mcu_m4fss_memory_region>;
+            ti,sci = <&dmsc>;
+            ti,sci-dev-id = <9>;
+            ti,sci-proc-ids = <0x18 0xff>;
+         };
+    };
-- 
2.39.2

