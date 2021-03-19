Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89173C433E0
	for <linux-remoteproc@archiver.kernel.org>; Fri, 19 Mar 2021 09:33:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60A9964F68
	for <linux-remoteproc@archiver.kernel.org>; Fri, 19 Mar 2021 09:33:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbhCSJdD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 19 Mar 2021 05:33:03 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14014 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbhCSJck (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 19 Mar 2021 05:32:40 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F1zBn2fY2zPkgm;
        Fri, 19 Mar 2021 17:30:09 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Fri, 19 Mar 2021 17:32:28 +0800
From:   'w00385741 <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        "Mathieu Poirier" <mathieu.poirier@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Govind Singh <govinds@codeaurora.org>
CC:     <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] remoteproc: qcom: wcss: Fix return value check in q6v5_wcss_init_mmio()
Date:   Fri, 19 Mar 2021 09:41:00 +0000
Message-ID: <20210319094100.4185044-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

In case of error, the function devm_ioremap() returns NULL pointer
not ERR_PTR(). The IS_ERR() test in the return value check should
be replaced with NULL test.

Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 71ec1a451e35..6f7d940d4431 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -829,8 +829,8 @@ static int q6v5_wcss_init_mmio(struct q6v5_wcss *wcss,
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qdsp6");
 	wcss->reg_base = devm_ioremap(&pdev->dev, res->start,
 				      resource_size(res));
-	if (IS_ERR(wcss->reg_base))
-		return PTR_ERR(wcss->reg_base);
+	if (!wcss->reg_base)
+		return -ENOMEM;
 
 	if (wcss->version == WCSS_IPQ8074) {
 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rmb");

