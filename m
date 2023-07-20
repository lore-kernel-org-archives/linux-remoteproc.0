Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0BAEB64DA
	for <linux-remoteproc@archiver.kernel.org>; Thu, 20 Jul 2023 12:57:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbjGTM5C (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 20 Jul 2023 08:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbjGTM5B (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 20 Jul 2023 08:57:01 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C172D75;
        Thu, 20 Jul 2023 05:56:29 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 6BA6E8474B;
        Thu, 20 Jul 2023 14:56:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1689857764;
        bh=+OmVjHPpfxAaZBIC1KgOC+Zf/PX2rHGYeb2hqfr7BVE=;
        h=From:To:Cc:Subject:Date:From;
        b=FChB5mdanG86dR9W/ztMeXzL9xbI55w70IcXXEVShiEBQn6f129vD5Q460modN4Ev
         95GT7+enSRhN7B4LpYrKgdne0cJ5feQlshbNglQZzEq1iLiJ5AB8F3ppIguiivmGpk
         3LX3FokAH9xEbZkiRa+MP2h4ubQqhYcY7LtSeCF2JDhvB60RVrx92gYIZYHVn72l2y
         uXjFs0lG4+JzzLU5LBHjjQoaKT9YEtshRKpdq+MBkrZwhyEog0CQPQnB7QTlgU498D
         Pq2bietAZA0otrEV2Dvtu5C4JSHQakCwd1Zmc9hmX6LcCWq181YKY+XzSmuIeWBghU
         vTODpLSZYB16Q==
From:   Marek Vasut <marex@denx.de>
To:     linux-remoteproc@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: imx_rproc: Support i.MX8MN/P MMIO
Date:   Thu, 20 Jul 2023 14:55:48 +0200
Message-Id: <20230720125549.72929-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The MX8M CM7 boot via SMC call is problematic, since not all versions
of ATF support this interface. Document MMIO support used to boot the
CM7 on MX8MN/MP instead and discern MMIO interface using DT compatible
string. Document GPR register syscon phandle which is required by the
MMIO interface too.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-remoteproc@vger.kernel.org
---
V2: Rename 'gpr' to 'fsl,iomuxc-gpr'
---
Note that the MMIO being discerned using compatible string is similar
approach to "st,stm32mp1-rcc" vs "st,stm32mp1-rcc-secure".
---
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 0c3910f152d1d..cd352fd38e891 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -20,7 +20,9 @@ properties:
       - fsl,imx7ulp-cm4
       - fsl,imx8mm-cm4
       - fsl,imx8mn-cm7
+      - fsl,imx8mn-cm7-mmio
       - fsl,imx8mp-cm7
+      - fsl,imx8mp-cm7-mmio
       - fsl,imx8mq-cm4
       - fsl,imx8qm-cm4
       - fsl,imx8qxp-cm4
@@ -70,6 +72,11 @@ properties:
     description:
       Specify CPU entry address for SCU enabled processor.
 
+  fsl,iomuxc-gpr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to IOMUXC GPR block which provide access to CM7 CPUWAIT bit.
+
   fsl,resource-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -79,6 +86,19 @@ properties:
 required:
   - compatible
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              enum:
+                - fsl,imx8mn-cm7-mmio
+                - fsl,imx8mp-cm7-mmio
+    then:
+      properties:
+        gpr: false
+
 additionalProperties: false
 
 examples:
-- 
2.40.1

