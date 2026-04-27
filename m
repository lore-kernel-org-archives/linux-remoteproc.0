Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662BB3B775B;
	Mon, 27 Apr 2026 11:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777288513; cv=none; b=dfA10fHWnaLX4BqkhQipPr9MqCYwkEFu4LfGOw8Va+6pyJ+TGYrisdTMz+HNJ/jKwNrLNMxJTae5Ntc9WsXDkpA7XyCpOapu8jXTLPEY/YhDjFrWQr/kB30/rWA8CdR3N3mK7Dx9hES33pSU37rNYYKvcCm474cp/fI90ZsZ1T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777288513; c=relaxed/simple;
	bh=FKVi9H5n+Ygevt4eNRlmcaLrjeWDDl8NL5sgkJC1f8w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BfwAgX+XocivsI8rj+3JD+m52yETBoXjDNQnzKkoVaD8sBYTFs+cYgZeIgPMaWk78J8fPBqKIJKrqAhJJwKYrhAXtCwRRCXM390dUEGE2Tll4Ld7134CHItIPUk1axyKZunORsv1R0CJswn3bNVK4mPKwGJ5xhthuUZgrza+AdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=u4yKOCo+; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="u4yKOCo+"
X-UUID: 5761bafa422a11f19781c1a04af40193-20260427
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BjBoE/eELfGcy+c4cqtV+JxXHfww4jP3U0dh+zL8bEA=;
	b=u4yKOCo+okjuEMBzPvVm8jfnU0M2kRxI1axXdPPQsg0UjW+jLJ927FFY+VWJsEKXyJC8oPwOJuRZQZPnx3DLv3jVNiRWOYx4a+nKWvp18WFTmKAs9cwkgmvJwgWPT4llHey84RZDLiYyeUUZEeJV0x3Xq+kTIhZ8LMVbBvPQZAs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:11a74933-f40c-4e5e-ad0f-32ebe92fbcb7,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:f57c82be-65a8-4b41-ac18-3671578a914d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:97|99|83|106|11|1,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5761bafa422a11f19781c1a04af40193-20260427
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 455111229; Mon, 27 Apr 2026 19:15:04 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 27 Apr 2026 19:15:03 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 27 Apr 2026 19:15:02 +0800
From: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiangzhi Tang
	<Xiangzhi.Tang@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hailong Fan
	<Hailong.Fan@mediatek.com>, Huayu Zong <Huayu.Zong@mediatek.com>, Jarried Lin
	<Jarried.Lin@mediatek.com>, Justin Yeh <Justin.Yeh@mediatek.com>, Vince-WL
 Liu <Vince-WL.Liu@mediatek.com>, Xiangzhi Tang <xiangzhi.tang@mediatek.com>
Subject: [PATCH v4 1/7] dt-bindings: remoteproc: Add MediaTek mt8196 VCP binding
Date: Mon, 27 Apr 2026 19:04:40 +0800
Message-ID: <20260427111446.22955-2-xiangzhi.tang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260427111446.22955-1-xiangzhi.tang@mediatek.com>
References: <20260427111446.22955-1-xiangzhi.tang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add device tree binding for the MediaTek Video Companion Processor
(VCP), a RISC-V based coprocessor used for video processing and
multimedia tasks on mt8196 and future MediaTek SoCs.

The VCP is a heterogeneous multi-core processor that can contain
multiple RISC-V cores with different hart (hardware thread)
configurations. Key features:

- Supports both single-core and multi-core VCP configurations
- Each core can have 1 or 2 harts (hardware threads)
- Shared SRAM memory space partitioned among cores
- Communication via 5 dedicated mailbox channels for IPI messaging
- Integrated with SoC IOMMU for multimedia memory management
- Boot and power management coordinated with ARM Trusted Firmware

The binding defines both the top-level VCP device (with mailboxes,
interrupts, and power domains) and child nodes for individual VCP
cores (with SRAM allocation and hart configuration).

Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
---
 .../remoteproc/mediatek,mt8196-vcp.yaml       | 166 ++++++++++++++++++
 1 file changed, 166 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml b/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
new file mode 100644
index 000000000000..8ecb643cbdc5
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
@@ -0,0 +1,166 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/mediatek,mt8196-vcp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Video Companion Processor (VCP)
+
+maintainers:
+  - Xiangzhi Tang <xiangzhi.tang@mediatek.com>
+
+description:
+  This binding provides support for the MediaTek Video Companion Processor
+  (VCP), a Risc-V coprocessor found on some MediaTek SoCs.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8196-vcp
+
+  reg:
+    items:
+      - description: sram base
+      - description: cfg group IO
+      - description: cfg core group IO
+      - description: cfg sec group IO
+
+  reg-names:
+    items:
+      - const: sram
+      - const: cfg
+      - const: cfg-core
+      - const: cfg-sec
+
+  interrupts:
+    maxItems: 1
+
+  mboxes:
+    maxItems: 5
+
+  mbox-names:
+    items:
+      - const: mbox0
+      - const: mbox1
+      - const: mbox2
+      - const: mbox3
+      - const: mbox4
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    description:
+      Using MediaTek IOMMU to apply larb ports for Multimedia Memory
+      Management Unit and address translation.
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+
+patternProperties:
+  "^vcp@[a-f0-9]+$":
+    type: object
+    description:
+      The MediaTek VCP integrated to SoC might be a multi-core version.
+      The other cores are represented as child nodes of the boot core.
+      There are some integration differences for the IP like the usage of
+      address translator for translating SoC bus addresses into address
+      space for the processor.
+
+      The SRAM is shared by all cores, each VCP core only using a piece of
+      SRAM memory. The power of SRAM should be enabled before booting VCP cores.
+      The size of SRAM varies on different SoCs.
+
+      The VCP cores have differences on different SoCs for Hart support.
+
+    properties:
+      compatible:
+        enum:
+          - mediatek,vcp-core
+
+      reg:
+        description: The base address and size of SRAM.
+        maxItems: 1
+
+      reg-names:
+        const: sram
+
+      mediatek,vcp-core-harts:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Number of harts in this VCP core.
+        enum: [1, 2]
+
+      mediatek,vcp-core-sram-offset:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Offset of the allocated SRAM memory for this VCP core.
+
+    required:
+      - compatible
+      - reg
+      - reg-names
+      - mediatek,vcp-core-harts
+      - mediatek,vcp-core-sram-offset
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - mboxes
+  - mbox-names
+  - power-domains
+  - iommus
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8196-power.h>
+
+    vcp: vcp@31800000 {
+        compatible = "mediatek,mt8196-vcp";
+        reg = <0x31800000 0x60000>,
+              <0x31a04000 0xa000>,
+              <0x31bd0000 0x1000>,
+              <0x31a70020 0x100>;
+        reg-names = "sram",
+                    "cfg",
+                    "cfg-core",
+                    "cfg-sec";
+
+        interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>;
+
+        mboxes = <&vcp_mailbox0>,
+                 <&vcp_mailbox1>,
+                 <&vcp_mailbox2>,
+                 <&vcp_mailbox3>,
+                 <&vcp_mailbox4>;
+        mbox-names = "mbox0", "mbox1", "mbox2", "mbox3", "mbox4";
+
+        power-domains = <&scpsys MT8196_POWER_DOMAIN_MM_PROC_DORMANT>;
+        iommus = <&mm_smmu 160>;
+        memory-region = <&vcp_resv_mem>;
+
+        vcp@0 {
+            compatible = "mediatek,vcp-core";
+            reg = <0x0 0x31000>;
+            reg-names = "sram";
+            mediatek,vcp-core-harts = <2>;
+            mediatek,vcp-core-sram-offset = <0x0>;
+        };
+
+        vcp@31000 {
+            compatible = "mediatek,vcp-core";
+            reg = <0x31000 0x60000>;
+            reg-names = "sram";
+            mediatek,vcp-core-harts = <1>;
+            mediatek,vcp-core-sram-offset = <0x31000>;
+        };
+    };
-- 
2.46.0

