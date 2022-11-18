Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF07C4332F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Nov 2022 07:49:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235172AbiKRHtu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Nov 2022 02:49:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235040AbiKRHts (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Nov 2022 02:49:48 -0500
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF1812D3E
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Nov 2022 23:49:47 -0800 (PST)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.56])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4ND87P5485z15MZK;
        Fri, 18 Nov 2022 15:49:21 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 18 Nov
 2022 15:49:45 +0800
From:   Yuan Can <yuancan@huawei.com>
To:     <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
        <s-anna@ti.com>, <jaswinder.singh@linaro.org>, <t-kristo@ti.com>,
        <afd@ti.com>, <linux-remoteproc@vger.kernel.org>
CC:     <yuancan@huawei.com>
Subject: [PATCH] remoteproc: omap_remoteproc: Fix compile errors about casting
Date:   Fri, 18 Nov 2022 07:47:55 +0000
Message-ID: <20221118074755.121424-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following errors was given when compiling
drivers/remoteproc/omap_remoteproc.c:

drivers/remoteproc/omap_remoteproc.c: In function ‘omap_rproc_mbox_callback’:
drivers/remoteproc/omap_remoteproc.c:497:12: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
  u32 msg = (u32)data;
            ^
drivers/remoteproc/omap_remoteproc.c: In function ‘omap_rproc_kick’:
drivers/remoteproc/omap_remoteproc.c:548:39: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
  ret = mbox_send_message(oproc->mbox, (void *)vqid);
                                       ^
drivers/remoteproc/omap_remoteproc.c: In function ‘_omap_rproc_suspend’:
drivers/remoteproc/omap_remoteproc.c:783:39: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
  ret = mbox_send_message(oproc->mbox, (void *)suspend_msg);
                                       ^
In file included from ./include/linux/device.h:15,
                 from ./include/linux/node.h:18,
                 from ./include/linux/cpu.h:17,
                 from ./include/linux/of_device.h:5,
                 from drivers/remoteproc/omap_remoteproc.c:22:
drivers/remoteproc/omap_remoteproc.c: In function ‘omap_rproc_of_get_internal_memories’:
drivers/remoteproc/omap_remoteproc.c:1211:16: error: format ‘%x’ expects argument of type ‘unsigned int’, but argument 6 has type ‘size_t’ {aka ‘long unsigned int’} [-Werror=format=]
   dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %pK da 0x%x\n",
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: 8841a66aaa7c ("mailbox/omap: adapt to the new mailbox framework")
Fixes: 5f31b232c674 ("remoteproc/omap: Add support for runtime auto-suspend/resume")
Fixes: 4a032199d3f7 ("remoteproc/omap: Add support to parse internal memories from DT")
Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/remoteproc/omap_remoteproc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 430fab0266ed..be43b5d85e2b 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -494,7 +494,7 @@ static void omap_rproc_mbox_callback(struct mbox_client *client, void *data)
 						client);
 	struct device *dev = oproc->rproc->dev.parent;
 	const char *name = oproc->rproc->name;
-	u32 msg = (u32)data;
+	u32 msg = (u32)(unsigned long)data;
 
 	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
 
@@ -545,7 +545,7 @@ static void omap_rproc_kick(struct rproc *rproc, int vqid)
 	}
 
 	/* send the index of the triggered virtqueue in the mailbox payload */
-	ret = mbox_send_message(oproc->mbox, (void *)vqid);
+	ret = mbox_send_message(oproc->mbox, (void *)(unsigned long)vqid);
 	if (ret < 0)
 		dev_err(dev, "failed to send mailbox message, status = %d\n",
 			ret);
@@ -780,7 +780,7 @@ static int _omap_rproc_suspend(struct rproc *rproc, bool auto_suspend)
 
 	reinit_completion(&oproc->pm_comp);
 	oproc->suspend_acked = false;
-	ret = mbox_send_message(oproc->mbox, (void *)suspend_msg);
+	ret = mbox_send_message(oproc->mbox, (void *)(unsigned long)suspend_msg);
 	if (ret < 0) {
 		dev_err(dev, "PM mbox_send_message failed: %d\n", ret);
 		return ret;
@@ -1208,7 +1208,7 @@ static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
 		oproc->mem[i].dev_addr = data->mems[i].dev_addr;
 		oproc->mem[i].size = resource_size(res);
 
-		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %pK da 0x%x\n",
+		dev_dbg(dev, "memory %8s: bus addr %pa size 0x%zx va %pK da 0x%x\n",
 			data->mems[i].name, &oproc->mem[i].bus_addr,
 			oproc->mem[i].size, oproc->mem[i].cpu_addr,
 			oproc->mem[i].dev_addr);
-- 
2.17.1

