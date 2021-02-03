Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67ED8C433E6
	for <linux-remoteproc@archiver.kernel.org>; Wed,  3 Feb 2021 02:47:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33F8364F78
	for <linux-remoteproc@archiver.kernel.org>; Wed,  3 Feb 2021 02:47:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232027AbhBCCr3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 2 Feb 2021 21:47:29 -0500
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:39639 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232242AbhBCCr2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 2 Feb 2021 21:47:28 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R501e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04357;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UNjXzVX_1612320403;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UNjXzVX_1612320403)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 03 Feb 2021 10:46:44 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] remoteproc: qcom_wcnss: remove unneeded semicolon
Date:   Wed,  3 Feb 2021 10:46:42 +0800
Message-Id: <1612320402-3313-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Eliminate the following coccicheck warning:
./drivers/remoteproc/qcom_wcnss.c:573:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/remoteproc/qcom_wcnss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index f958542..2a6a23c 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -570,7 +570,7 @@ static int wcnss_probe(struct platform_device *pdev)
 	if (IS_ERR(mmio)) {
 		ret = PTR_ERR(mmio);
 		goto free_rproc;
-	};
+	}
 
 	ret = wcnss_alloc_memory_region(wcnss);
 	if (ret)
-- 
1.8.3.1

