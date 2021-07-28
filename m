Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71A6C04FE3
	for <linux-remoteproc@archiver.kernel.org>; Wed, 28 Jul 2021 03:59:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B32576056B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 28 Jul 2021 03:59:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234507AbhG1D7T (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 27 Jul 2021 23:59:19 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:46476 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234065AbhG1D7L (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 27 Jul 2021 23:59:11 -0400
X-UUID: 5790b32f5a7f4f759bb6f822d7365577-20210728
X-UUID: 5790b32f5a7f4f759bb6f822d7365577-20210728
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <tinghan.shen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1283641764; Wed, 28 Jul 2021 11:59:05 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 11:59:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Jul 2021 11:59:04 +0800
From:   Tinghan Shen <tinghan.shen@mediatek.com>
To:     <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
        <mathieu.poirier@linaro.org>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <tzungbi@google.com>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH v4 4/4] remoteproc: mediatek: Support mt8195 scp
Date:   Wed, 28 Jul 2021 11:58:59 +0800
Message-ID: <20210728035859.5405-5-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210728035859.5405-1-tinghan.shen@mediatek.com>
References: <20210728035859.5405-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The SCP clock design is changed on mt8195 that doesn't need to control
SCP clock on kernel side.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_scp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 9679cc26895e..250cb946ea37 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -785,7 +785,7 @@ static int scp_probe(struct platform_device *pdev)
 	if (ret)
 		goto destroy_mutex;
 
-	scp->clk = devm_clk_get(dev, "main");
+	scp->clk = devm_clk_get_optional(dev, "main");
 	if (IS_ERR(scp->clk)) {
 		dev_err(dev, "Failed to get clock\n");
 		ret = PTR_ERR(scp->clk);
@@ -877,6 +877,7 @@ static const struct mtk_scp_of_data mt8192_of_data = {
 static const struct of_device_id mtk_scp_of_match[] = {
 	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
 	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
+	{ .compatible = "mediatek,mt8195-scp", .data = &mt8192_of_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
-- 
2.18.0

