Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88845C4338F
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Aug 2021 05:20:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5485361077
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Aug 2021 05:20:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233102AbhHIFUa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Aug 2021 01:20:30 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:57882 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231996AbhHIFU0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Aug 2021 01:20:26 -0400
X-UUID: 04253b585d544119aa72ceed57a50489-20210809
X-UUID: 04253b585d544119aa72ceed57a50489-20210809
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <tinghan.shen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 593297562; Mon, 09 Aug 2021 13:20:03 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
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
Subject: [PATCH v6 5/6] rpmsg: change naming of mediatek rpmsg property
Date:   Mon, 9 Aug 2021 13:19:58 +0800
Message-ID: <20210809051959.31136-6-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210809051959.31136-1-tinghan.shen@mediatek.com>
References: <20210809051959.31136-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Change from "mtk,rpmsg-name" to "mediatek,rpmsg-name" to sync with the
vendor name defined in vendor-prefixes.yaml.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/rpmsg/mtk_rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
index 96a17ec29140..5b4404b8be4c 100644
--- a/drivers/rpmsg/mtk_rpmsg.c
+++ b/drivers/rpmsg/mtk_rpmsg.c
@@ -183,7 +183,7 @@ mtk_rpmsg_match_device_subnode(struct device_node *node, const char *channel)
 	int ret;
 
 	for_each_available_child_of_node(node, child) {
-		ret = of_property_read_string(child, "mtk,rpmsg-name", &name);
+		ret = of_property_read_string(child, "mediatek,rpmsg-name", &name);
 		if (ret)
 			continue;
 
-- 
2.18.0

