Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7005AC432BE
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Aug 2021 05:20:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50FF560F55
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Aug 2021 05:20:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233133AbhHIFUc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Aug 2021 01:20:32 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:57882 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S233051AbhHIFUa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Aug 2021 01:20:30 -0400
X-UUID: b7e620d6d1e6472abf46aeb8ab6dba5a-20210809
X-UUID: b7e620d6d1e6472abf46aeb8ab6dba5a-20210809
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <tinghan.shen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1938375716; Mon, 09 Aug 2021 13:20:03 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 13:20:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 9 Aug 2021 13:20:02 +0800
From:   Tinghan Shen <tinghan.shen@mediatek.com>
To:     <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
        <mathieu.poirier@linaro.org>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>, <krzysztof.kozlowski@canonical.com>,
        <shawnguo@kernel.org>, <sam@ravnborg.org>,
        <linux@rempel-privat.de>, <daniel@0x0f.com>,
        <Max.Merchel@tq-group.com>, <geert+renesas@glider.be>,
        <fanghao11@huawei.com>
CC:     <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH v6 3/6] dt-bindings: remoteproc: mediatek: Convert mtk,scp to json-schema
Date:   Mon, 9 Aug 2021 13:19:56 +0800
Message-ID: <20210809051959.31136-4-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210809051959.31136-1-tinghan.shen@mediatek.com>
References: <20210809051959.31136-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Convert the mtk,scp binding to DT schema format using json-schema.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 .../bindings/remoteproc/mtk,scp.txt           | 41 ---------
 .../bindings/remoteproc/mtk,scp.yaml          | 92 +++++++++++++++++++
 2 files changed, 92 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
deleted file mode 100644
index 88f37dee7bca..000000000000
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-Mediatek SCP Bindings
-----------------------------------------
-
-This binding provides support for ARM Cortex M4 Co-processor found on some
-Mediatek SoCs.
-
-Required properties:
-- compatible		Should be one of:
-				"mediatek,mt8183-scp"
-				"mediatek,mt8192-scp"
-				"mediatek,mt8195-scp"
-- reg			Should contain the address ranges for memory regions:
-			SRAM, CFG, and L1TCM.
-- reg-names		Contains the corresponding names for the memory regions:
-			"sram", "cfg", and "l1tcm".
-- clocks		Required by mt8183 and mt8192. Clock for co-processor
-			(See: ../clock/clock-bindings.txt)
-- clock-names		Required by mt8183 and mt8192. Contains the
-			corresponding name for the clock. This should be
-			named "main".
-
-Subnodes
---------
-
-Subnodes of the SCP represent rpmsg devices. The names of the devices are not
-important. The properties of these nodes are defined by the individual bindings
-for the rpmsg devices - but must contain the following property:
-
-- mtk,rpmsg-name	Contains the name for the rpmsg device. Used to match
-			the subnode to rpmsg device announced by SCP.
-
-Example:
-
-	scp: scp@10500000 {
-		compatible = "mediatek,mt8183-scp";
-		reg = <0 0x10500000 0 0x80000>,
-		      <0 0x105c0000 0 0x5000>;
-		reg-names = "sram", "cfg";
-		clocks = <&infracfg CLK_INFRA_SCPSYS>;
-		clock-names = "main";
-	};
diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
new file mode 100644
index 000000000000..d21a25ee96e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek SCP Bindings
+
+maintainers:
+  - Tinghan Shen <tinghan.shen@mediatek.com>
+
+description:
+  This binding provides support for ARM Cortex M4 Co-processor found on some
+  Mediatek SoCs.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8183-scp
+      - mediatek,mt8192-scp
+      - mediatek,mt8195-scp
+
+  reg:
+    description:
+      Should contain the address ranges for memory regions SRAM, CFG, and
+      L1TCM.
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: sram
+      - const: cfg
+      - const: l1tcm
+
+  clocks:
+    description:
+      Clock for co-processor (see ../clock/clock-bindings.txt).
+      Required by mt8183 and mt8192.
+    maxItems: 1
+
+  clock-names:
+    const: main
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+if:
+  properties:
+    compatible:
+      enum:
+        - mediatek,mt8183-scp
+        - mediatek,mt8192-scp
+then:
+  required:
+    - clocks
+    - clock-names
+
+additionalProperties:
+  type: object
+  description:
+    Subnodes of the SCP represent rpmsg devices. The names of the devices
+    are not important. The properties of these nodes are defined by the
+    individual bindings for the rpmsg devices.
+  properties:
+    mediatek,rpmsg-name:
+      $ref: /schemas/types.yaml#/definitions/string-array
+      description:
+        Contains the name for the rpmsg device. Used to match
+        the subnode to rpmsg device announced by SCP.
+
+  required:
+    - mediatek,rpmsg-name
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+
+    scp@10500000 {
+        compatible = "mediatek,mt8183-scp";
+        reg = <0x10500000 0x80000>,
+              <0x10700000 0x8000>,
+              <0x10720000 0xe0000>;
+        reg-names = "sram", "cfg", "l1tcm";
+        clocks = <&infracfg CLK_INFRA_SCPSYS>;
+        clock-names = "main";
+
+        cros_ec {
+            mediatek,rpmsg-name = "cros-ec-rpmsg";
+        };
+    };
-- 
2.18.0

