Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2EE0C05032
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Sep 2021 03:39:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B41460FA0
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Sep 2021 03:39:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244080AbhIXDlT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 23 Sep 2021 23:41:19 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:37176 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S244056AbhIXDlR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 23 Sep 2021 23:41:17 -0400
X-UUID: 9ca22d1fc0144aaca2d2e378c00508a6-20210924
X-UUID: 9ca22d1fc0144aaca2d2e378c00508a6-20210924
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <tinghan.shen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1072256764; Fri, 24 Sep 2021 11:39:40 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 24 Sep 2021 11:39:39 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 24 Sep
 2021 11:39:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Sep 2021 11:39:38 +0800
From:   Tinghan Shen <tinghan.shen@mediatek.com>
To:     <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
        <mathieu.poirier@linaro.org>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH v7 3/6] dt-bindings: remoteproc: mediatek: Convert mtk,scp to json-schema
Date:   Fri, 24 Sep 2021 11:39:32 +0800
Message-ID: <20210924033935.2127-4-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210924033935.2127-1-tinghan.shen@mediatek.com>
References: <20210924033935.2127-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Convert the mtk,scp binding to DT schema format using json-schema.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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

