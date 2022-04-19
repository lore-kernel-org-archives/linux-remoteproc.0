Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7644C433FE
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Apr 2022 12:33:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243164AbiDSMgY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 19 Apr 2022 08:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231693AbiDSMgY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 Apr 2022 08:36:24 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F1D123BC3;
        Tue, 19 Apr 2022 05:33:40 -0700 (PDT)
X-UUID: 473cf921a10d4667bb1569154d2142f1-20220419
X-UUID: 473cf921a10d4667bb1569154d2142f1-20220419
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <allen-kh.cheng@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1020629310; Tue, 19 Apr 2022 20:33:35 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 Apr 2022 20:33:34 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 19 Apr
 2022 20:33:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 Apr 2022 20:33:33 +0800
From:   Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Hsin-Yi Wang <hsinyi@chromium.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>,
        Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v3 1/2] dt-bindings: remoteproc: mediatek: add firmware-name property
Date:   Tue, 19 Apr 2022 20:33:30 +0800
Message-ID: <20220419123331.14377-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220419123331.14377-1-allen-kh.cheng@mediatek.com>
References: <20220419123331.14377-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The SCP needs firmware which differs between other platforms and SoCs.
Add a new property "firmware-name" to allow the DT to specify the
platform/board specific path to this firmware file.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index 5b693a2d049c..a20effa836f1 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -42,6 +42,13 @@ properties:
   clock-names:
     const: main
 
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      If present, name (or relative path) of the file within the
+      firmware search path containing the firmware image used when
+      initializing SCP.
+
 required:
   - compatible
   - reg
-- 
2.18.0

