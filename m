Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04656C11F67
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Jun 2021 15:02:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D28E561D9A
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Jun 2021 15:02:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233791AbhF2PE1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 29 Jun 2021 11:04:27 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:41500 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234583AbhF2PE0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 29 Jun 2021 11:04:26 -0400
X-UUID: 016235ef35a0485eb01b979f11d6978f-20210629
X-UUID: 016235ef35a0485eb01b979f11d6978f-20210629
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <phil.chang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1076631800; Tue, 29 Jun 2021 23:01:52 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 23:01:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Jun 2021 23:01:50 +0800
From:   Phil Chang <phil.chang@mediatek.com>
To:     <linux-remoteproc@vger.kernel.org>
CC:     <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
        <mathieu.poirier@linaro.org>, <matthias.bgg@gmail.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <yj.chiang@mediatek.com>,
        <mark-pk.tsai@mediatek.com>, <weiting.tsai@mediatek.com>,
        Phil Chang <phil.chang@mediatek.com>
Subject: [PATCH] remoteproc: export rproc re/unregister to virtio device APIs
Date:   Tue, 29 Jun 2021 23:00:02 +0800
Message-ID: <20210629150002.8050-1-phil.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

In some case, the remote processor already boot up on previous state,
but still need register to virtio device, so that exported those APIs.

Signed-off-by: Phil Chang <phil.chang@mediatek.com>
Signed-off-by: YJ chiang <yj.chiang@mediatek.com>
---
Hi

In our case, the remote processor is already boot up in u-boot,
we don't want to boot again or load fw in driver but register to virtio
device for rpmsg. so that needs those API exported.
Furthermore, the rproc_vq_interrupt is exported, so those functions
should be exported also.

thanks

 drivers/remoteproc/remoteproc_virtio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 0cc617f76068..e23658a76f5e 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -425,6 +425,7 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 out:
 	return ret;
 }
+EXPORT_SYMBOL(rproc_add_virtio_dev);
 
 /**
  * rproc_remove_virtio_dev() - remove an rproc-induced virtio device
@@ -440,3 +441,4 @@ int rproc_remove_virtio_dev(struct device *dev, void *data)
 	unregister_virtio_device(vdev);
 	return 0;
 }
+EXPORT_SYMBOL(rproc_remove_virtio_dev);
-- 
2.18.0

