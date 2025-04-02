Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEA4233727;
	Wed,  2 Apr 2025 09:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743585751; cv=none; b=KY50t6h4aJKA5z8dC3JRb4pxP524VMp3aDpHmMexNnDEmiUTUJ5dfoYJj+r5OS4sMSQsRFS5FFQLzypToWuByNjgtfBMplGfB7srhSqKngtdPQZyesnTXE0faL5L6zqZXzflJtm7sdV6r72evJ7g18w9o/PywrHYy9zooEWlgmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743585751; c=relaxed/simple;
	bh=tdl7VWFJysjw1NSogVxTKvhInXibBa6bqokALmozYFA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p41flac94b4LyL6tnHX4ndpmLMAs3RNj1ZNp3F5IlIAwyu9t+RoKBTDJT4jeAMP4qnhJxTk32l4gQXU7wA+NjHUZpTTMmqAMNs/uNKuBM8B7kkCYICwVYlBcFKL3BX+xg+zxTvOmwy9yamS0mEbH/KJU0nlhw1/YOvwb+zK6H5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=c0+sBvnY; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="c0+sBvnY"
X-UUID: fb17ef9e0fa311f08eb9c36241bbb6fb-20250402
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=s2JMCg2JclTEEd0N3Q75VPRJx5xkg3/cUf95k4E332A=;
	b=c0+sBvnYGovMZPbcSrmjfIV54AyF4q2ZFg30P7r6vuin1DYirhmI4Wm74lVi8ye9vt4uV3EazuBMrskyOBbQkzAmoerEYK7Y04tguEiA3a05gEoKi35oaVFGKLcztoyLKeiC5Z8Bl3REDFqCARujRbhG9Q1MGVKy+as3gU7chPo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:1c5473bc-b968-4335-9eea-c4bab9335324,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:0ef645f,CLOUDID:d258248d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: fb17ef9e0fa311f08eb9c36241bbb6fb-20250402
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1910110246; Wed, 02 Apr 2025 17:22:21 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 2 Apr 2025 17:22:20 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 2 Apr 2025 17:22:19 +0800
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
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jjian.zhou@mediatek.com>, <hailong.fan@mediatek.com>, Xiangzhi Tang
	<xiangzhi.tang@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: remoteproc: Add VCP support for mt8196
Date: Wed, 2 Apr 2025 17:19:24 +0800
Message-ID: <20250402092134.12293-2-xiangzhi.tang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250402092134.12293-1-xiangzhi.tang@mediatek.com>
References: <20250402092134.12293-1-xiangzhi.tang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add the new binding document for MediaTek Video Companion
Processor(VCP) on MediaTek mt8196.

Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
---
 .../remoteproc/mediatek,mt8196-vcp.yaml       | 174 ++++++++++++++++++
 1 file changed, 174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml b/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
new file mode 100644
index 000000000000..0c2926e29c02
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
@@ -0,0 +1,174 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/mediatek,mt8196-vcp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Video Companion Processor (VCP)
+
+maintainers:
+  - Xiangzhi Tang <Xiangzhi.Tang@mediatek.com>
+
+description:
+  The MediaTek VCP enables the SoC control the MediaTek Video Companion Risc-V coprocessor.
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
+      - description: vcp rdy group IO
+
+  reg-names:
+    items:
+      - const: sram
+      - const: cfg
+      - const: cfg_core
+      - const: cfg_sec
+      - const: vcp_vlp_ao_rsvd7
+
+  interrupts:
+    maxItems: 1
+
+  mboxes:
+    description:
+      Using mailbox to communicate with VCP, it should have this
+      property and list of phandle, mailbox specifiers. See
+      Documentation/devicetree/bindings/mailbox/mediatek,mt8196-vcp-mbox.yaml
+      for details.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  mbox-names:
+    maxItems: 5
+
+  power-domains:
+    description:
+      A phandle and PM domain specifier as defined by bindings
+      of the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+    maxItems: 1
+
+  iommus:
+    description:
+      Using MediaTek iommu to apply larb ports for Multimedia Memory
+      Management Unit and address translation
+      Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
+
+  memory-region:
+    maxItems: 1
+
+  vcp-mem-tbl:
+    description:
+      Manage reserved memory for VCP RTOS FW and various features.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 12
+
+patternProperties:
+  "^vcp_[a-f0-9]+$":
+    type: object
+    description:
+      The MediaTek VCP integrated to SoC might be a multi-core version.
+      The other cores are represented as child nodes of the boot core.
+      There are some integration differences for the IP like the usage of
+      address translator for translating SoC bus addresses into address
+      space for the processor.
+
+      The SRAM are shared by all cores, each VCP core only using a piece
+      SRAM memory. The power of SRAM should be enabled before booting VCP cores.
+      The size of SRAM are varied on differnt SoCs.
+
+      The VCP cores has differences on different SoCs to support for
+      Hart.
+
+    properties:
+      compatible:
+        enum:
+          - mediatek,vcp-core
+          - mediatek,mmup-core
+
+      twohart:
+        enum: [0, 1]
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      sram-offset:
+        description:
+          Allocated SRAM memory for each VCP core used.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+    required:
+      - compatible
+      - twohart
+      - sram-offset
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
+  - vcp-mem-tbl
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
+              <0x31a70020 0x100>,
+              <0x1c00091c 0x4>;
+        reg-names = "sram",
+                    "cfg",
+                    "cfg_core",
+                    "cfg_sec",
+                    "vcp_vlp_ao_rsvd7";
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
+        vcp-mem-tbl = <0 0x1a00000>,
+                      <1 0x30000>,
+                      <2 0x12000>,
+                      <3 0x1000>,
+                      <4 0x1000>,
+                      <5 0x1000>;
+        vcp_0 {
+            compatible = "mediatek,vcp-core";
+            twohart = <1>;
+            sram-offset = <0x0>;
+        };
+
+        vcp_1 {
+            compatible = "mediatek,mmup-core";
+            twohart = <0>;
+            sram-offset = <0x31000>;
+        };
+    };
-- 
2.45.2

