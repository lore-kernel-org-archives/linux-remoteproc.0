Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDBFC433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Nov 2021 14:15:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9E50610CC
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Nov 2021 14:15:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhKBOSR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 2 Nov 2021 10:18:17 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:49520 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229712AbhKBOSR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 2 Nov 2021 10:18:17 -0400
X-UUID: 3648d3006f054c0d8cbbbf7b13307803-20211102
X-UUID: 3648d3006f054c0d8cbbbf7b13307803-20211102
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <mark-pk.tsai@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 366777280; Tue, 02 Nov 2021 22:15:39 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Nov 2021 22:15:37 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkexhb02.mediatek.inc (172.21.101.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Nov 2021 22:15:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 2 Nov 2021 22:15:37 +0800
From:   Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To:     <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
        <mathieu.poirier@linaro.org>
CC:     <matthias.bgg@gmail.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <mark-pk.tsai@mediatek.com>,
        <yj.chiang@mediatek.com>
Subject: [PATCH v2] remoteproc: use %pe format string to print return error code
Date:   Tue, 2 Nov 2021 22:15:35 +0800
Message-ID: <20211102141535.28372-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use %pe format string to print return error code which
make the error message easier to understand.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 drivers/remoteproc/remoteproc_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 502b6604b757..2242da320368 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -575,8 +575,8 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 					   dma_get_mask(rproc->dev.parent));
 	if (ret) {
 		dev_warn(dev,
-			 "Failed to set DMA mask %llx. Trying to continue... %x\n",
-			 dma_get_mask(rproc->dev.parent), ret);
+			 "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
+			 dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
 	}
 
 	/* parse the vrings */
-- 
2.18.0

