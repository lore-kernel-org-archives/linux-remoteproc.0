Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C03C433FE
	for <linux-remoteproc@archiver.kernel.org>; Wed,  1 Jun 2022 11:22:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352552AbiFALWU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 1 Jun 2022 07:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348453AbiFALWQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 1 Jun 2022 07:22:16 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 662DE42A2A;
        Wed,  1 Jun 2022 04:22:14 -0700 (PDT)
X-UUID: 34aac9a9ae084ceb81e2490911d9a68c-20220601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:1fa75032-b3d3-4545-ab73-476466c84bd6,OB:0,LO
        B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
        ION:release,TS:-5
X-CID-META: VersionHash:2a19b09,CLOUDID:bd90268a-32d7-4fc0-b2ef-8776ac194f8f,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
        ,QS:0,BEC:nil
X-UUID: 34aac9a9ae084ceb81e2490911d9a68c-20220601
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
        (envelope-from <tinghan.shen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 421798836; Wed, 01 Jun 2022 19:22:05 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 1 Jun 2022 19:22:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 1 Jun 2022 19:22:04 +0800
From:   Tinghan Shen <tinghan.shen@mediatek.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Daisuke Nojiri <dnojiri@chromium.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        "Dustin L. Howett" <dustin@howett.net>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Prashant Malani <pmalani@chromium.org>,
        "Enric Balletbo i Serra" <enric.balletbo@collabora.com>,
        Brian Norris <briannorris@chromium.org>
CC:     <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        <weishunc@google.com>
Subject: [PATCH v1 02/15] remoteproc: Kconfig: Add mt8195 SCP dual core configuration
Date:   Wed, 1 Jun 2022 19:21:48 +0800
Message-ID: <20220601112201.15510-3-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220601112201.15510-1-tinghan.shen@mediatek.com>
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

MediaTek MT8195 SoC SCP is a dual-core subsystem. Add a remoteproc
configuration to enable support of the 2nd core.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 166019786653..bb2960b4ffbd 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -64,6 +64,16 @@ config MTK_SCP
 
 	  It's safe to say N here.
 
+config MTK_SCP_DUALCORE
+	tristate "MediaTek SCP dual-core support"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on MTK_SCP
+	help
+	  Say y here to support bring up the 2nd core of the dual-core version of
+	  MediaTek's SCP via the remote processor framework.
+
+	  It's safe to say N here.
+
 config OMAP_REMOTEPROC
 	tristate "OMAP remoteproc support"
 	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX
-- 
2.18.0

