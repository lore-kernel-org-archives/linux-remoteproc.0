Return-Path: <SRS0=dsuy=6X=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADED4C28CBC
	for <linux-remoteproc@archiver.kernel.org>; Sat,  9 May 2020 08:38:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 954382495C
	for <linux-remoteproc@archiver.kernel.org>; Sat,  9 May 2020 08:38:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbgEIIiv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 9 May 2020 04:38:51 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4314 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725930AbgEIIiu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 9 May 2020 04:38:50 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 5A748C4CB26369EF78C8;
        Sat,  9 May 2020 16:38:48 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Sat, 9 May 2020 16:38:41 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Erin Lo" <erin.lo@mediatek.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] remoteproc/mediatek: fix invalid use of sizeof in scp_ipi_init()
Date:   Sat, 9 May 2020 08:42:37 +0000
Message-ID: <20200509084237.36293-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

sizeof() when applied to a pointer typed expression gives the
size of the pointer, not that of the pointed data.

Fixes: 63c13d61eafe ("remoteproc/mediatek: add SCP support for mt8183")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/remoteproc/mtk_scp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 2bead57c9cf9..ac13e7b046a6 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -132,8 +132,8 @@ static int scp_ipi_init(struct mtk_scp *scp)
 		(struct mtk_share_obj __iomem *)(scp->sram_base + recv_offset);
 	scp->send_buf =
 		(struct mtk_share_obj __iomem *)(scp->sram_base + send_offset);
-	memset_io(scp->recv_buf, 0, sizeof(scp->recv_buf));
-	memset_io(scp->send_buf, 0, sizeof(scp->send_buf));
+	memset_io(scp->recv_buf, 0, sizeof(*scp->recv_buf));
+	memset_io(scp->send_buf, 0, sizeof(*scp->send_buf));
 
 	return 0;
 }



