Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519CFECAAA3
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Aug 2022 01:37:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233266AbiHZBhW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 25 Aug 2022 21:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234710AbiHZBhV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 25 Aug 2022 21:37:21 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F136B2D9F;
        Thu, 25 Aug 2022 18:37:20 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MDMlv4Hc2zYcnY;
        Fri, 26 Aug 2022 09:32:59 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 26 Aug 2022 09:37:18 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 26 Aug
 2022 09:37:18 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
CC:     <agross@kernel.org>, <bjorn.andersson@linaro.org>
Subject: [PATCH -next 2/3] remoteproc: qcom: wcss: Use devm_platform_ioremap_resource_byname()
Date:   Fri, 26 Aug 2022 09:45:10 +0800
Message-ID: <20220826014511.2270433-2-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220826014511.2270433-1-yangyingliang@huawei.com>
References: <20220826014511.2270433-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 017ee225dc32..209fc1bd1424 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -835,8 +835,7 @@ static int q6v5_wcss_init_mmio(struct q6v5_wcss *wcss,
 		return -ENOMEM;
 
 	if (wcss->version == WCSS_IPQ8074) {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rmb");
-		wcss->rmb_base = devm_ioremap_resource(&pdev->dev, res);
+		wcss->rmb_base = devm_platform_ioremap_resource_byname(pdev, "rmb");
 		if (IS_ERR(wcss->rmb_base))
 			return PTR_ERR(wcss->rmb_base);
 	}
-- 
2.25.1

