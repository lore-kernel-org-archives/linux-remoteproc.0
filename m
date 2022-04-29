Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B61C433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 29 Apr 2022 21:11:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbiD2VOo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 29 Apr 2022 17:14:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232286AbiD2VOm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 29 Apr 2022 17:14:42 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 699DED3AD2;
        Fri, 29 Apr 2022 14:11:23 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nfraprado)
        with ESMTPSA id C2C101F469DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1651266682;
        bh=zkf2OdOr4qeK3DFvoa0PuUxALZNEfVfEptYcm+0bgWY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dfdpa804qceBKZ5hxqyciz2L4G4BIRypnil5OHRrbaUrasFP7RTTZjGR3m+UWxbuT
         6+L5MnQ6R7N1NRd05Ud+tTgOm+KQVOEfJZ+nwwysCdOWTHe8ihdOd3gjlFDoqfAkRd
         uoFjR1YeYQAjqpKR4TtUo/kUKMv30gJX61VhTvPBtK2NmU6I5xQY+pj15jWwSn7JqF
         /aARjrqrFgy5azn2f9uxOFnVzvGUfq0o0rssfcefSzLUW6Wp2IHpdWpB/R3xwre+PW
         zlW1G1EMYkW6ACwyQxL3/maz8CrTjxUWiZJQDuqmdiUBIE8hukqzYnedOSdZ7VBubO
         AwoQmkDC2h34A==
From:   =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, kernel@collabora.com,
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: remoteproc: mediatek: Fix optional reg-names for mtk,scp
Date:   Fri, 29 Apr 2022 17:11:09 -0400
Message-Id: <20220429211111.2214119-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220429211111.2214119-1-nfraprado@collabora.com>
References: <20220429211111.2214119-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The SCP has three memory regions: sram, l1tcm and cfg. Only sram is
required, the other two are optional. Fix the dt-binding so that the
optional regions can be omitted and passed in any order.

Also add the missing minItems to the reg property and update the
description.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 .../devicetree/bindings/remoteproc/mtk,scp.yaml      | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index 823a236242de..ec9ddeb6ca2c 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -24,14 +24,20 @@ properties:
   reg:
     description:
       Should contain the address ranges for memory regions SRAM, CFG, and
-      L1TCM.
+      L1TCM. Only SRAM is required, while CFG and L1TCM are optional.
+    minItems: 1
     maxItems: 3
 
   reg-names:
+    minItems: 1
     items:
       - const: sram
-      - const: cfg
-      - const: l1tcm
+      - enum:
+          - l1tcm
+          - cfg
+      - enum:
+          - l1tcm
+          - cfg
 
   clocks:
     description:
-- 
2.36.0

