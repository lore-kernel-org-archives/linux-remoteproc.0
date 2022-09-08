Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FBCC54EE9
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Sep 2022 12:33:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbiIHMdE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 8 Sep 2022 08:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbiIHMdC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 8 Sep 2022 08:33:02 -0400
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.67.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E23113E06;
        Thu,  8 Sep 2022 05:32:59 -0700 (PDT)
X-QQ-mid: bizesmtp87t1662640364t2qllz94
Received: from localhost.localdomain ( [182.148.14.0])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Thu, 08 Sep 2022 20:32:43 +0800 (CST)
X-QQ-SSF: 0100000000200090C000B00A0000000
X-QQ-FEAT: ytApUffxWvwFvfVFXS92J47YekOGaRY/Aen5/+IW82OHIG4hauK2FnEV0vfvA
        lkH0H2SQcqJK+nHEKkaqqxLL6uWlWkqSQfVfkI0aKERuLpteqFHspyRDbXrOlLM05D5chQY
        mEfEqIggdGqmc5BSfxFTxZIJR1MzeHfE/w4GLbOe/WJOI63G3qZxniw5+kH7roNII21vHXT
        oaGJLYRTTlZ8AQPcrj48KqYoJLIu+2qM33sQEbiRNiBsIQZVdEwCaNc57kPSMMoqR2p5B1v
        +pJ8T1K32Kbc2s9CFW/Sm4byqDiXV8fz7ESfVSjJJeymRGwoxsx2WEoZMVQNjEFreti02DF
        WJQUm++2v8Ut2rqReuRy1SzAp66ZdlOGZkYeRheqxElCxUabYLwYEkd8tgK4g==
X-QQ-GoodBg: 0
From:   wangjianli <wangjianli@cdjrlc.com>
To:     andersson@kernel.org, mathieu.poirier@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        wangjianli <wangjianli@cdjrlc.com>
Subject: [PATCH] drivers/remoteproc: fix repeated words in comments
Date:   Thu,  8 Sep 2022 20:32:37 +0800
Message-Id: <20220908123237.16911-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Delete the redundant word 'in'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 drivers/remoteproc/remoteproc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index e5279ed9a8d7..6e8849f0df18 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -346,7 +346,7 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 		if (rproc_check_carveout_da(rproc, mem, rsc->vring[i].da, size))
 			return -ENOMEM;
 	} else {
-		/* Register carveout in in list */
+		/* Register carveout in list */
 		mem = rproc_mem_entry_init(dev, NULL, 0,
 					   size, rsc->vring[i].da,
 					   rproc_alloc_carveout,
-- 
2.36.1

