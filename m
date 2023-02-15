Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E702EC636CC
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Feb 2023 04:13:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232353AbjBOENS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Feb 2023 23:13:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230474AbjBOENJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Feb 2023 23:13:09 -0500
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 916D5241C5;
        Tue, 14 Feb 2023 20:13:07 -0800 (PST)
X-UUID: 087eaf78ace711ed945fc101203acc17-20230215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=X5BMOUCftBqUoS89OY1vJghk0U8zsFcVshTFWmsRm4E=;
        b=ejyq+YHSI5KVfeI5h6KewDKUTNARh3EhbjVxUKBG7kYh1H9Qrz8ROj6qLA6y3fw2rvEKJBoCq8pZsmoJ6FLhkhRaQB4AUGHZxJjAtgniJyLVt72igHKslMrHtCxA9kYLQ/d8yp82hjTQur0Gi9vIUi8hWQ1g2hOYFyuznuPsmRI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:3910c56a-e317-4df8-801e-204e851437cd,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:885ddb2,CLOUDID:ba739b25-564d-42d9-9875-7c868ee415ec,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 087eaf78ace711ed945fc101203acc17-20230215
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
        (envelope-from <tinghan.shen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 456755916; Wed, 15 Feb 2023 12:12:59 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 15 Feb 2023 12:12:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 15 Feb 2023 12:12:58 +0800
From:   Tinghan Shen <tinghan.shen@mediatek.com>
To:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>
CC:     <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 01/12] dt-bindings: remoteproc: mediatek: Improve the rpmsg subnode definition
Date:   Wed, 15 Feb 2023 12:12:46 +0800
Message-ID: <20230215041257.14548-2-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230215041257.14548-1-tinghan.shen@mediatek.com>
References: <20230215041257.14548-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Improve the definition of the rpmsg subnode by
assigning a distinct node name and adding the
definition source of node properties.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/remoteproc/mtk,scp.yaml          | 31 +++++++++----------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index 895415772d1d..271081df0e46 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -58,6 +58,18 @@ properties:
   memory-region:
     maxItems: 1
 
+  cros-ec-rpmsg:
+    $ref: /schemas/mfd/google,cros-ec.yaml
+    description:
+      This subnode represents the rpmsg device. The properties
+      of this node are defined by the individual bindings for
+      the rpmsg devices.
+
+    required:
+      - mediatek,rpmsg-name
+
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
@@ -89,21 +101,7 @@ allOf:
         reg-names:
           maxItems: 2
 
-additionalProperties:
-  type: object
-  description:
-    Subnodes of the SCP represent rpmsg devices. The names of the devices
-    are not important. The properties of these nodes are defined by the
-    individual bindings for the rpmsg devices.
-  properties:
-    mediatek,rpmsg-name:
-      $ref: /schemas/types.yaml#/definitions/string-array
-      description:
-        Contains the name for the rpmsg device. Used to match
-        the subnode to rpmsg device announced by SCP.
-
-  required:
-    - mediatek,rpmsg-name
+additionalProperties: false
 
 examples:
   - |
@@ -118,7 +116,8 @@ examples:
         clocks = <&infracfg CLK_INFRA_SCPSYS>;
         clock-names = "main";
 
-        cros_ec {
+        cros-ec-rpmsg {
+            compatible = "google,cros-ec-rpmsg";
             mediatek,rpmsg-name = "cros-ec-rpmsg";
         };
     };
-- 
2.18.0

