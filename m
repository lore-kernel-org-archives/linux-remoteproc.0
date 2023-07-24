Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF1FEB64DD
	for <linux-remoteproc@archiver.kernel.org>; Mon, 24 Jul 2023 22:24:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbjGXWYd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 24 Jul 2023 18:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjGXWYc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 24 Jul 2023 18:24:32 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8538410D;
        Mon, 24 Jul 2023 15:24:31 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id B6BCA867E3;
        Tue, 25 Jul 2023 00:24:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1690237470;
        bh=rK8b3/IPpSE0ll7vrNZpoHCEBMwF61sgD6J2PS0mQWg=;
        h=From:To:Cc:Subject:Date:From;
        b=cCiBb+wcPDl+duyVdqnkJ7hASD1T7tR2FMWRMqn5qB4IeKyjwR761Ks0bquiWU5yA
         pgG95GidO1tikb2ZKaL4vZ61/dcWLkx7DYJxKCAl75vboS8/pFzbHDPm6aQs3AGkKn
         tq+SZXg7BSvpo3kSqzuDOx+KscOTGGNT+wHoekA9thX6pXH5lfyDFSiplAh9e3xlSY
         v2XiKzK39IUGowmTUeMW0OvfrQsC/1ZgV6lK9G/5HqW7lVQA8RzA02SIS5apPr5yw2
         PFZHSZkYAFM7UHWSAiVmnWmJ079MG1Yeo42Umw3nFYSkdGEsMD2/o5kEXJIk4vOuMt
         ICRLKHEDp9YUA==
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
Subject: [PATCH v3 1/2] dt-bindings: remoteproc: imx_rproc: Support i.MX8MN/P MMIO
Date:   Tue, 25 Jul 2023 00:24:17 +0200
Message-Id: <20230724222418.163220-1-marex@denx.de>
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
V3: Rename 'gpr' to 'fsl,iomuxc-gpr' everywhere
---
Note that the MMIO being discerned using compatible string is similar
approach to "st,stm32mp1-rcc" vs "st,stm32mp1-rcc-secure".
---
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 0c3910f152d1d..30632efdad8bb 100644
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
+        fsl,iomuxc-gpr: false
+
 additionalProperties: false
 
 examples:
-- 
2.40.1

