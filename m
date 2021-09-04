Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5BAC433EF
	for <linux-remoteproc@archiver.kernel.org>; Sat,  4 Sep 2021 11:37:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0ACDB60FDC
	for <linux-remoteproc@archiver.kernel.org>; Sat,  4 Sep 2021 11:37:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235615AbhIDLij (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 4 Sep 2021 07:38:39 -0400
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:18043 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235943AbhIDLii (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 4 Sep 2021 07:38:38 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d31 with ME
        id pndZ250093riaq203ndZ3n; Sat, 04 Sep 2021 13:37:35 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 04 Sep 2021 13:37:35 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, james.quinlan@broadcom.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] remoteproc: Fix a memory leak in an error handling path in 'rproc_handle_vdev()'
Date:   Sat,  4 Sep 2021 13:37:32 +0200
Message-Id: <e6d0dad6620da4fdf847faa903f79b735d35f262.1630755377.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

If 'copy_dma_range_map() fails, the memory allocated for 'rvdev' will leak.
Move the 'copy_dma_range_map()' call after the device registration so
that 'rproc_rvdev_release()' can be called to free some resources.

Also, branch to the error handling path if 'copy_dma_range_map()' instead
of a direct return to avoid some other leaks.

Fixes: e0d072782c73 ("dma-mapping: introduce DMA range map, supplanting dma_pfn_offset")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
Review with care. I don't like to move code around because of possible
side-effect.
---
 drivers/remoteproc/remoteproc_core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 502b6604b757..775df165eb45 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -556,9 +556,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 	/* Initialise vdev subdevice */
 	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
 	rvdev->dev.parent = &rproc->dev;
-	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
-	if (ret)
-		return ret;
 	rvdev->dev.release = rproc_rvdev_release;
 	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
 	dev_set_drvdata(&rvdev->dev, rvdev);
@@ -568,6 +565,11 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 		put_device(&rvdev->dev);
 		return ret;
 	}
+
+	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
+	if (ret)
+		goto free_rvdev;
+
 	/* Make device dma capable by inheriting from parent's capabilities */
 	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
 
-- 
2.30.2

