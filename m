Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9966C388F7
	for <linux-remoteproc@archiver.kernel.org>; Fri, 13 Nov 2020 07:05:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AA7220B80
	for <linux-remoteproc@archiver.kernel.org>; Fri, 13 Nov 2020 07:05:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgKMHFJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 13 Nov 2020 02:05:09 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7533 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbgKMHFJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 13 Nov 2020 02:05:09 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CXTxN3sVszhjgp;
        Fri, 13 Nov 2020 15:04:56 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Fri, 13 Nov 2020
 15:04:59 +0800
From:   Wang Li <wangli74@huawei.com>
To:     <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
        <mathieu.poirier@linaro.org>, <s-anna@ti.com>
CC:     <linux-remoteproc@vger.kernel.org>, <wangli74@huawei.com>
Subject: [PATCH] remoteproc: k3-dsp: Fix return value check in devm_ioremap_uc()
Date:   Fri, 13 Nov 2020 15:08:40 +0800
Message-ID: <20201113070840.386033-1-wangli74@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

In case of error, the function devm_ioremap_wc() returns NULL pointer not
ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Fixes: 6edbe024ba17 ("remoteproc: k3-dsp: Add a remoteproc driver of K3 C66x DSPs")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Li <wangli74@huawei.com>
---
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 9011e477290c..863c0214e0a8 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -445,10 +445,10 @@ static int k3_dsp_rproc_of_get_memories(struct platform_device *pdev,
 
 		kproc->mem[i].cpu_addr = devm_ioremap_wc(dev, res->start,
 							 resource_size(res));
-		if (IS_ERR(kproc->mem[i].cpu_addr)) {
+		if (!kproc->mem[i].cpu_addr) {
 			dev_err(dev, "failed to map %s memory\n",
 				data->mems[i].name);
-			return PTR_ERR(kproc->mem[i].cpu_addr);
+			return -ENOMEM;
 		}
 		kproc->mem[i].bus_addr = res->start;
 		kproc->mem[i].dev_addr = data->mems[i].dev_addr;
-- 
2.25.4

