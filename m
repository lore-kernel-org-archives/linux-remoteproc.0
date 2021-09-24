Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC3CC433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Sep 2021 03:39:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25D3D61242
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Sep 2021 03:39:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244070AbhIXDlS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 23 Sep 2021 23:41:18 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:46976 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S237120AbhIXDlR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 23 Sep 2021 23:41:17 -0400
X-UUID: 2f5bac2bbe974bb789acbc75a9eea78a-20210924
X-UUID: 2f5bac2bbe974bb789acbc75a9eea78a-20210924
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <tinghan.shen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 312215166; Fri, 24 Sep 2021 11:39:40 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 11:39:38 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 24 Sep
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
Subject: [PATCH v7 2/6] dt-bindings: remoteproc: mediatek: Add binding for mt8192 scp
Date:   Fri, 24 Sep 2021 11:39:31 +0800
Message-ID: <20210924033935.2127-3-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210924033935.2127-1-tinghan.shen@mediatek.com>
References: <20210924033935.2127-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add mt8192 compatible to binding document.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
index d64466eefbe3..88f37dee7bca 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
@@ -7,14 +7,17 @@ Mediatek SoCs.
 Required properties:
 - compatible		Should be one of:
 				"mediatek,mt8183-scp"
+				"mediatek,mt8192-scp"
 				"mediatek,mt8195-scp"
 - reg			Should contain the address ranges for memory regions:
 			SRAM, CFG, and L1TCM.
 - reg-names		Contains the corresponding names for the memory regions:
 			"sram", "cfg", and "l1tcm".
-- clocks		Required by mt8183. Clock for co-processor (See: ../clock/clock-bindings.txt)
-- clock-names		Required by mt8183. Contains the corresponding name for the clock. This
-			should be named "main".
+- clocks		Required by mt8183 and mt8192. Clock for co-processor
+			(See: ../clock/clock-bindings.txt)
+- clock-names		Required by mt8183 and mt8192. Contains the
+			corresponding name for the clock. This should be
+			named "main".
 
 Subnodes
 --------
-- 
2.18.0

