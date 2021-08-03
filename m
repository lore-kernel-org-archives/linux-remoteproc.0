Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F201C4320A
	for <linux-remoteproc@archiver.kernel.org>; Tue,  3 Aug 2021 07:59:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0683D60F8F
	for <linux-remoteproc@archiver.kernel.org>; Tue,  3 Aug 2021 07:59:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234414AbhHCH7m (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 3 Aug 2021 03:59:42 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:47284 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234396AbhHCH7j (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 3 Aug 2021 03:59:39 -0400
X-UUID: c6884d64b58c497fbe54df19cdb1e6e5-20210803
X-UUID: c6884d64b58c497fbe54df19cdb1e6e5-20210803
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <tinghan.shen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 987510474; Tue, 03 Aug 2021 15:59:25 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 15:59:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 Aug 2021 15:59:24 +0800
From:   Tinghan Shen <tinghan.shen@mediatek.com>
To:     <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
        <mathieu.poirier@linaro.org>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>, <krzysztof.kozlowski@canonical.com>,
        <shawnguo@kernel.org>, <sam@ravnborg.org>,
        <linux@rempel-privat.de>, <daniel@0x0f.com>,
        <Max.Merchel@tq-group.com>, <geert+renesas@glider.be>,
        <fanghao11@huawei.com>
CC:     <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH v5 3/5] dt-bindings: vendor-prefixes: Add another prefix for Mediatek Co.
Date:   Tue, 3 Aug 2021 15:59:20 +0800
Message-ID: <20210803075922.11611-4-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210803075922.11611-1-tinghan.shen@mediatek.com>
References: <20210803075922.11611-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add document binding for mediatek.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 07fb0d25fc15..c4252cd570b0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -760,6 +760,8 @@ patternProperties:
     description: MStar Semiconductor, Inc. (acquired by MediaTek Inc.)
   "^mti,.*":
     description: Imagination Technologies Ltd. (formerly MIPS Technologies Inc.)
+  "^mtk,.*":
+    description: MediaTek Inc.
   "^multi-inno,.*":
     description: Multi-Inno Technology Co.,Ltd
   "^mundoreader,.*":
-- 
2.18.0

