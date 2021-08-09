Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3966C43214
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Aug 2021 05:20:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A14B761053
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Aug 2021 05:20:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233126AbhHIFUd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Aug 2021 01:20:33 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:39242 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S233038AbhHIFUa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Aug 2021 01:20:30 -0400
X-UUID: 3a589e41452845da86beb78577f88d14-20210809
X-UUID: 3a589e41452845da86beb78577f88d14-20210809
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <tinghan.shen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 654624063; Mon, 09 Aug 2021 13:20:04 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 13:20:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 9 Aug 2021 13:20:02 +0800
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
Subject: [PATCH v6 6/6] arm64: dts: mt8183: change rpmsg property name
Date:   Mon, 9 Aug 2021 13:19:59 +0800
Message-ID: <20210809051959.31136-7-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210809051959.31136-1-tinghan.shen@mediatek.com>
References: <20210809051959.31136-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The rpmsg property name is changed to "mediatek," to sync with the
vendor name defined in vendor-prefixes.yaml.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ae549d55a94f..30df2754be6d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -752,7 +752,7 @@
 
 	cros_ec {
 		compatible = "google,cros-ec-rpmsg";
-		mtk,rpmsg-name = "cros-ec-rpmsg";
+		mediatek,rpmsg-name = "cros-ec-rpmsg";
 	};
 };
 
-- 
2.18.0

