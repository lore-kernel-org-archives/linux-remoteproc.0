Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103D5EB64D9
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 Jul 2023 23:26:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbjGGX0l (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 7 Jul 2023 19:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjGGX0l (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 7 Jul 2023 19:26:41 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7A432127;
        Fri,  7 Jul 2023 16:26:39 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 19CC285F50;
        Sat,  8 Jul 2023 01:26:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1688772398;
        bh=njmuRh0WR2KTTOX3tz8FV2jEOUSOxOGj/xiEt/oNLIA=;
        h=From:To:Cc:Subject:Date:From;
        b=CzTJEP5K57oX0RDsM9CBjCLelIDxr6vRQpoX27i5oypAjz81kC5miI9L4svJ4as74
         32B42q3yqL866KWLYPc5J4T7bDT/4Xffd7jshNn9Mi36Gg4+LZjc9uF4qhSgo9qSP+
         ZEc5eSQIwZd0gyBAlQLgRa+5Tv2/8LIuNX2+nh4qWxYYnrRSgwLwZxEvVByVkZXZuR
         JpFEvC3/g/m7W/wTIx2TTdt8bfPLWqmDRsImYkT7VY68j3zPaSY86ajoH5yUfkSSUJ
         U1OsYfIliGOcKt5W4WD3zh2CiDu1tDcXxIKgKm64gF4Lh3pV/mxadNYoMDFjIZpXFn
         wdjMrmXywW/TA==
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
Subject: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: Support i.MX8MN/P MMIO
Date:   Sat,  8 Jul 2023 01:26:25 +0200
Message-Id: <20230707232626.374475-1-marex@denx.de>
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
Note that the MMIO being discerned using compatible string is similar
approach to "st,stm32mp1-rcc" vs "st,stm32mp1-rcc-secure".
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
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index c940199ce89df..78bb976f738ee 100644
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
@@ -30,6 +32,11 @@ properties:
   clocks:
     maxItems: 1
 
+  gpr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to IOMUXC GPR block which provide access to CM7 CPUWAIT bit.
+
   syscon:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -84,6 +91,19 @@ properties:
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

