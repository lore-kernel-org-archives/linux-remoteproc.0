Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8F2C433F5
	for <linux-remoteproc@archiver.kernel.org>; Sat, 11 Sep 2021 08:17:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F7D4611C0
	for <linux-remoteproc@archiver.kernel.org>; Sat, 11 Sep 2021 08:17:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235439AbhIKIS6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 11 Sep 2021 04:18:58 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:19027 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235334AbhIKIS6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 11 Sep 2021 04:18:58 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H659J66jwzbmHd;
        Sat, 11 Sep 2021 16:13:40 +0800 (CST)
Received: from dggpemm500004.china.huawei.com (7.185.36.219) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sat, 11 Sep 2021 16:17:43 +0800
Received: from huawei.com (10.174.28.241) by dggpemm500004.china.huawei.com
 (7.185.36.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Sat, 11 Sep
 2021 16:17:43 +0800
From:   Bixuan Cui <cuibixuan@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
CC:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <ohad@wizery.com>, <mathieu.poirier@linaro.org>
Subject: [PATCH -next] remoteproc: qcom_wcnss: Add missing of_node_put() in qcom_iris_probe()
Date:   Sat, 11 Sep 2021 16:13:47 +0800
Message-ID: <20210911081347.33929-1-cuibixuan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.28.241]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500004.china.huawei.com (7.185.36.219)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add missing of_node_put() in qcom_iris_probe() before return.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
 drivers/remoteproc/qcom_wcnss_iris.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/qcom_wcnss_iris.c b/drivers/remoteproc/qcom_wcnss_iris.c
index 09720ddddc85..f77ab49a9cae 100644
--- a/drivers/remoteproc/qcom_wcnss_iris.c
+++ b/drivers/remoteproc/qcom_wcnss_iris.c
@@ -140,6 +140,7 @@ struct qcom_iris *qcom_iris_probe(struct device *parent, bool *use_48mhz_xo)
 	ret = device_add(&iris->dev);
 	if (ret) {
 		put_device(&iris->dev);
+		of_node_put(of_node);
 		return ERR_PTR(ret);
 	}
 
@@ -192,10 +193,12 @@ struct qcom_iris *qcom_iris_probe(struct device *parent, bool *use_48mhz_xo)
 
 	*use_48mhz_xo = data->use_48mhz_xo;
 
+	of_node_put(of_node);
 	return iris;
 
 err_device_del:
 	device_del(&iris->dev);
+	of_node_put(of_node);
 
 	return ERR_PTR(ret);
 }
-- 
2.17.1

