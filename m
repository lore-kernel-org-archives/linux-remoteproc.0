Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51982C433E0
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Feb 2021 08:21:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE49364F10
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Feb 2021 08:21:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233427AbhBXIVQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 24 Feb 2021 03:21:16 -0500
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:50460 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232343AbhBXIVP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 24 Feb 2021 03:21:15 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R551e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0UPRGZ72_1614154832;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UPRGZ72_1614154832)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 24 Feb 2021 16:20:32 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     ohad@wizery.com
Cc:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] remoteproc: pru: Replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE
Date:   Wed, 24 Feb 2021 16:20:29 +0800
Message-Id: <1614154829-42461-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Fix the following coccicheck warning:
./drivers/remoteproc/pru_rproc.c:247:0-23: WARNING:
pru_rproc_debug_ss_fops should be defined with DEFINE_DEBUGFS_ATTRIBUTE

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/remoteproc/pru_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 2667919..04a9d99 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -244,7 +244,7 @@ static int pru_rproc_debug_ss_get(void *data, u64 *val)
 
 	return 0;
 }
-DEFINE_SIMPLE_ATTRIBUTE(pru_rproc_debug_ss_fops, pru_rproc_debug_ss_get,
+DEFINE_DEBUGFS_ATTRIBUTE(pru_rproc_debug_ss_fops, pru_rproc_debug_ss_get,
 			pru_rproc_debug_ss_set, "%llu\n");
 
 /*
-- 
1.8.3.1

