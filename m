Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47059C2FC0E
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Aug 2023 08:34:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348874AbjHQId5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 17 Aug 2023 04:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349041AbjHQIdz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Aug 2023 04:33:55 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A14313D
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Aug 2023 01:33:54 -0700 (PDT)
Received: from dggpemm500016.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RRJ921FNYztSf4;
        Thu, 17 Aug 2023 16:30:14 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 17 Aug
 2023 16:33:51 +0800
From:   Chen Jiahao <chenjiahao16@huawei.com>
To:     <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <arnaud.pouliquen@foss.st.com>
CC:     <chenjiahao16@huawei.com>
Subject: [PATCH -next v2] remoteproc: stm32: Clean up redundant dev_err_probe()
Date:   Thu, 17 Aug 2023 16:33:36 +0800
Message-ID: <20230817083336.404635-1-chenjiahao16@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Referring to platform_get_irq()'s definition, the return value has
already been checked if ret < 0, and printed via dev_err_probe().
Calling dev_err_probe() one more time outside platform_get_irq()
is obviously redundant. Removing outside dev_err_probe() to
clean it up.

Besides, switch to use platform_get_irq_optional() since the irq
is optional here.

Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
---
 drivers/remoteproc/stm32_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 98234b44f038..1f53c672c66b 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -712,9 +712,9 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 	unsigned int tzen;
 	int err, irq;
 
-	irq = platform_get_irq(pdev, 0);
+	irq = platform_get_irq_optional(pdev, 0);
 	if (irq == -EPROBE_DEFER)
-		return dev_err_probe(dev, irq, "failed to get interrupt\n");
+		return irq;
 
 	if (irq > 0) {
 		err = devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
-- 
2.34.1

