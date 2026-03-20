Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556A82E11A6;
	Fri, 20 Mar 2026 03:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773976860; cv=none; b=kWhmwSPgoFiFapU0Sb9HwfR7/a8zwsRqnPs6r/tLFt/tR3sHt6UJZZOpZxf4jGIgEymex8NwEVsE5lP5CTMWuU1uEQPpa6/46FbHpUTejw4nO1MceWLVoqSwr3gPQS0OqHkVMc+RXe4b5tw/hfCctoJgn4haMz6Oy1jw6kRFPPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773976860; c=relaxed/simple;
	bh=iHKxvtz2PgFYLrcWYXN0oarWIty7O/8RDbR4hpCvHDs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PuseVppzTcdeFOTYIQGhx9Ua0O2KowJmNA7cLAythGyNj9mzgWRE0T9yMM1AAofrDbTMPb7xn9WacMlX4V6Gp++0SZmpBs/sr8OMgQPViXkadIdsfBNe7UKnc4+doMRXm5nf69WclF4H3QbChfQaolORUYZ0Oc14kqsqnXJ+1h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=dT7GIKyl; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dT7GIKyl"
X-UUID: cc07a6ea240b11f1a02d4725871ece0b-20260320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PhHH1eFF51u/zNrMzfxhIKmtLMJpZ4bBYigWRekSPi0=;
	b=dT7GIKylHdOx8YTiaA/gc4j1FU8Bq2RwWiK6fXEus/Q1WTzARqwiUYNQqpfnI3P+sbXAUcDBsugtLb7hU/bzs5nHF0JYx6vuNDWtVibhftO+gWIPqqDeWnQu96w/3Sk13bdEUTdLMmOziuksrSPLcGFjB3842MAfwcnw6CLs33w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:111a8d34-7714-4c32-af33-f409be553f99,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:c81ab54c-9183-487b-8624-e74f2dd98990,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:11|97|99|83|106|1,File:130,RT:0,Bulk:nil,QS:nil,
	BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cc07a6ea240b11f1a02d4725871ece0b-20260320
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 422781593; Fri, 20 Mar 2026 11:20:51 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 20 Mar 2026 11:20:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 20 Mar 2026 11:20:48 +0800
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
	<Hailong.Fan@mediatek.com>, Huayu Zong <huayu.Zong@mediatek.com>, Xiangzhi
 Tang <xiangzhi.tang@mediatek.com>
Subject: [PATCH v3 1/6] dt-bindings: remoteproc: Add VCP support for mt8196
Date: Fri, 20 Mar 2026 11:18:03 +0800
Message-ID: <20260320032014.13608-2-xiangzhi.tang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260320032014.13608-1-xiangzhi.tang@mediatek.com>
References: <20260320032014.13608-1-xiangzhi.tang@mediatek.com>
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
 .../remoteproc/mediatek,mt8196-vcp.yaml       | 161 ++++++++++++++++++
 1 file changed, 161 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml b/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
new file mode 100644
index 000000000000..7ec1ec69537a
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
@@ -0,0 +1,161 @@
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
+
+  reg-names:
+    items:
+      - const: sram
+      - const: cfg
+      - const: cfg_core
+      - const: cfg_sec
+
+  interrupts:
+    maxItems: 1
+
+  mboxes:
+    maxItems: 5
+
+  mbox-names:
+    maxItems: 5
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    description:
+      Using MediaTek iommu to apply larb ports for Multimedia Memory
+      Management Unit and address translation
+      Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
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
+
+      reg:
+        description: The base address and size of SRAM.
+        maxItems: 1
+
+      reg-names:
+        const: sram
+
+      mtk,vcp-core-twohart:
+        enum: [0, 1]
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      mtk,vcp-sram-offset:
+        description:
+          Allocated SRAM memory for each VCP core used.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+    required:
+      - compatible
+      - reg
+      - reg-names
+      - mtk,vcp-core-twohart
+      - mtk,vcp-sram-offset
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
+              <0x31a70020 0x100>,
+        reg-names = "sram",
+                    "cfg",
+                    "cfg_core",
+                    "cfg_sec";
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
+            mtk,vcp-core-twohart = <1>;
+            mtk,vcp-sram-offset = <0x0>;
+        };
+
+        vcp@31000 {
+            compatible = "mediatek,vcp-core";
+            reg = <0x31000 0x60000>;
+            reg-names = "sram";
+            mtk,vcp-core-twohart = <0>;
+            mtk,vcp-sram-offset = <0x31000>;
+        };
+    };
-- 
2.46.0

