Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C85EECAAA2
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Aug 2022 01:37:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244405AbiHZBhY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 25 Aug 2022 21:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233284AbiHZBhV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 25 Aug 2022 21:37:21 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 464F3B1B9F;
        Thu, 25 Aug 2022 18:37:20 -0700 (PDT)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MDMp94Mr4znTln;
        Fri, 26 Aug 2022 09:34:57 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 26 Aug 2022 09:37:18 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 26 Aug
 2022 09:37:18 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
CC:     <agross@kernel.org>, <bjorn.andersson@linaro.org>
Subject: [PATCH -next 1/3] remoteproc: qcom: wcss: check return value after calling platform_get_resource_byname()
Date:   Fri, 26 Aug 2022 09:45:09 +0800
Message-ID: <20220826014511.2270433-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
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

If platform_get_resource_byname() fails, 'res' will be set to null pointer,
it will cause null-ptr-deref when it used in devm_ioremap(), so we need check
the return value.

Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index bb0947f7770e..017ee225dc32 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -827,6 +827,8 @@ static int q6v5_wcss_init_mmio(struct q6v5_wcss *wcss,
 	int ret;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qdsp6");
+	if (!res)
+		return -EINVAL;
 	wcss->reg_base = devm_ioremap(&pdev->dev, res->start,
 				      resource_size(res));
 	if (!wcss->reg_base)
-- 
2.25.1

