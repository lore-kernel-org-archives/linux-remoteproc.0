Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E75C6FD19
	for <linux-remoteproc@archiver.kernel.org>; Thu, 16 Mar 2023 08:40:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230141AbjCPIkZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 16 Mar 2023 04:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230412AbjCPIkU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Mar 2023 04:40:20 -0400
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1002F66D14;
        Thu, 16 Mar 2023 01:40:15 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0VdzyBoc_1678956012;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VdzyBoc_1678956012)
          by smtp.aliyun-inc.com;
          Thu, 16 Mar 2023 16:40:13 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     andersson@kernel.org
Cc:     mathieu.poirier@linaro.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Yang Li <yang.lee@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] remoteproc/mtk_scp: Fix one kernel-doc comment
Date:   Thu, 16 Mar 2023 16:40:11 +0800
Message-Id: <20230316084011.99613-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Fixs the function name in kernel-doc comments to clear the below
warning:

drivers/remoteproc/mtk_scp_ipi.c:136: warning: expecting prototype for scp_ipi_lock(). Prototype was for scp_ipi_unlock() instead

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4544
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/remoteproc/mtk_scp_ipi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index fc55df649b40..9c7c17b9d181 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -125,7 +125,7 @@ void scp_ipi_lock(struct mtk_scp *scp, u32 id)
 EXPORT_SYMBOL_GPL(scp_ipi_lock);
 
 /**
- * scp_ipi_lock() - Unlock after operations of an IPI ID
+ * scp_ipi_unlock() - Unlock after operations of an IPI ID
  *
  * @scp:	mtk_scp structure
  * @id:		IPI ID
-- 
2.20.1.7.g153144c

