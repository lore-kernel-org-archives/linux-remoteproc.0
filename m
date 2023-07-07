Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51DEC001DC
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 Jul 2023 23:25:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbjGGXZS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 7 Jul 2023 19:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbjGGXZR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 7 Jul 2023 19:25:17 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 381BD2107;
        Fri,  7 Jul 2023 16:25:15 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 2289985F50;
        Sat,  8 Jul 2023 01:25:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1688772301;
        bh=SuB3l1QN8nvAY233gdCLXZjbGzm59nfH891us3OCgEw=;
        h=From:To:Cc:Subject:Date:From;
        b=uyZpqpZsXHPaf6xdXLoTF2v+s7FIAc0xW5Lzpc39W7OUEEkDnODmLWHVLONr4qghn
         VypFW9/aCryNgwtWq0lT/JdxzDpXyNoIxUMnCPsCLu/fZiKAmEjA+G5DXp/ayMXyAc
         wAdV/8Cix7OxLiKhwdDTCCUBYIjP3krp1IvcX1I/skmG6kWN2UNm3j33mK24vfIe8b
         BlsDdoJxJXZrVgExbWlcL5zgx4notlEj+8G+QstyWfsfmJ3dk+bYWTv9um7ncrp98i
         op0Qewv+9tu+/MIIR3pMLPIfIWkMY3eVlrvUo0jtPtzMRHTPx4973nx8nhNunsIhIr
         ga6fIJ0Z741QQ==
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
Subject: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: Document fsl,startup-delay-ms
Date:   Sat,  8 Jul 2023 01:24:43 +0200
Message-Id: <20230707232444.374431-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Document fsl,startup-delay-ms property which indicates how long
the system software should wait until attempting to communicate
with the CM firmware. This gives the CM firmware a bit of time
to boot and get ready for communication.

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
 .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 0c3910f152d1d..c940199ce89df 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -76,6 +76,11 @@ properties:
       This property is to specify the resource id of the remote processor in SoC
       which supports SCFW
 
+  fsl,startup-delay-ms:
+    default: 0
+    description:
+      CM firmware start up delay.
+
 required:
   - compatible
 
-- 
2.40.1

