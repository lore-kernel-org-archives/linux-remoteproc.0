Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C42C2D0E4
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 06:45:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B82CD2223F
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 06:45:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725931AbgKSGpJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 Nov 2020 01:45:09 -0500
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:51398 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725799AbgKSGpJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 Nov 2020 01:45:09 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1051683|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.108863-0.000133142-0.891004;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047198;MF=fuyao@allwinnertech.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.IygQvnF_1605768303;
Received: from localhost.localdomain(mailfrom:fuyao@allwinnertech.com fp:SMTPD_---.IygQvnF_1605768303)
          by smtp.aliyun-inc.com(10.147.40.233);
          Thu, 19 Nov 2020 14:45:05 +0800
From:   fuyao@allwinnertech.com
To:     mripard@kernel.org, wens@csie.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     fuyao <fuyao@allwinnertech.com>
Subject: [PATCH 1/2] dt-bindings: hwlock: add sunxi hwlock
Date:   Thu, 19 Nov 2020 14:44:52 +0800
Message-Id: <8f7e10853466867edafc3dc3059250fd15b8cbdb.1605767679.git.fuyao@allwinnertech.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1605767679.git.fuyao@allwinnertech.com>
References: <cover.1605767679.git.fuyao@allwinnertech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: fuyao <fuyao@allwinnertech.com>

SUNXI hwspinlock binding DT schema format

Signed-off-by: fuyao <fuyao@allwinnertech.com>
---
 .../bindings/hwlock/sunxi,hwspinlock.yaml     | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/sunxi,hwspinlock.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/sunxi,hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/sunxi,hwspinlock.yaml
new file mode 100644
index 0000000000000..68ce93b6d2bcb
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/sunxi,hwspinlock.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwlock/sunxi,hwspinlock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SUNXI HwSpinlock for SUNXI
+
+maintainers:
+  - fuyao <fuyao@allwinnertech.com>
+
+properties:
+  compatible:
+    enum:
+      - allwinner,h3-hwspinlock,  # for h3-hwspinlock
+      - allwinner,h6-hwspinlock,  # for h6-hwspinlock
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+
+additionalProperties: false
+
+examples:
+
+  - |
+    hwspinlock: spinlock@1c17000 {
+        compatible = "allwinner,h3-hwspinlock";
+        reg = <0x0 0x01c17000 0x0 0x1000>;
+        clocks = <&ccu CLK_BUS_SPINLOCK>;
+        resets = <&ccu RST_BUS_SPINLOCK>;
+    };
+
+  - |
+    hwspinlock: spinlock@3004000 {
+        compatible = "allwinner,h6-hwspinlock";
+        reg = <0x0 0x03004000 0x0 0x1000>;
+        clocks = <&ccu CLK_BUS_SPINLOCK>;
+        resets = <&ccu RST_BUS_SPINLOCK>;
+    };
+
-- 
2.29.2

